# 🎲 Sklep internetowy grami planszowymi
![diagram](https://user-images.githubusercontent.com/55376943/122652853-5a1f1d00-d141-11eb-8a7c-2ac28f1ed87c.png)

Autorzy: Marek Kudła, Kinga Marszałkowska

## Opis

Baza danych przechowuje informacje o grach, oraz o użytkownikach i ich zamówieniach. 

## ⚀ 
## ⚁ Bazka (creaty + inserty)

W pilku [allInOne.sql](/src/com/km/pja/allInOne.sql) znajdują się:

* Definicja bazy (create),
* Dane (insert),
* Funkcje i procedury,
* Triggery,
* Role

## ⚂ Select


## ⚃ Triggery

Przykładowe zastosowania triggerów w pliku [triggers_examples.sql](/src/com/km/pja/triggers_examples.sql)

Definicje triggerów [triggers.sql](/src/com/km/pja/triggers.sql)

### 🔵 cancel_orders

Anuluje wszystkie niedokończone zamówienia (wprowadzone, opłacone) od razu, gdy jakaś gra zostanie zarchiwizowana (wycofana ze sprzedaży).

```SQL 
CREATE TRIGGER cancel_orders_with_archived_games
    AFTER UPDATE ON storage
    FOR EACH ROW
EXECUTE FUNCTION cancel_orders();

```

Przykładowe zastosowanie:
```SQL 
-- 1. order game 1
CALL place_order(1, 1, 1);
    
-- 2. check and note all orders for game 1
SELECT order_id, game_id, user_id, "orderDate", status, "orderQuantity" 
FROM public.order JOIN public.order_game ON id = order_id 
WHERE game_id = 1;
```

```SQL 
-- 3. archive game 1 (triggers canceling unfinished orders)
UPDATE public.storage SET archived = true WHERE game_id = 1;

-- 4. check orders for game 1 again - all orders that were paid or ordered are now canceled
SELECT order_id, game_id, user_id, "orderDate", status, "orderQuantity" 
FROM public.order JOIN public.order_game ON id = order_id 
WHERE game_id = 1;
```

### 🔵 are_enough_copies_in_storage

Przed dodaniem zamówienia sprawdza, czy w magazynie jest wystarczająca liczba egzemplarzy. Jeśli nie, operacja nie zostanie wykonana.
```SQL 
CREATE TRIGGER are_enough_copies_in_storage
    BEFORE INSERT ON order_game
    FOR EACH ROW
EXECUTE FUNCTION copies_in_storage_check();

```

Przykładowe zastosowanie:
```SQL 
-- order a lot of copies using a procedure place_order(game_id, user_id, quantity)
CALL place_order(1, 1, 1000);
-- you should catch an exception:
-- ERROR:  Not enough copies in storage
-- CONTEXT:  PL/pgSQL function
```

### 🔵 subtract_quantity_order

Odejmuje z magazynu liczbę zamówionych egzemplarzy danej gry (trigger wykonuje się po insercie do tabeli zamówień).

```SQL 
CREATE TRIGGER subtract_quantity_order
    AFTER INSERT ON order_game
    FOR EACH ROW
EXECUTE FUNCTION subtract_quantity();

```

Przykładowe zastosowanie:
```SQL 
-- 1. check and note number of copies (quantity) of game 1
SELECT quantity FROM public.storage WHERE game_id = 1
```

```SQL 
-- 2. order game 1
CALL place_order(1, 1, 1);
-- 3. check quantity for game 1 again, should decrease by the amount of games ordered (in this case by 1)
SELECT quantity FROM public.storage WHERE game_id = 1
```


## 

##

## ⚄ Procedury i funkcje

### 🔵 place_order

Procedura pomocnicza do składania zamówień, robi od razu inserty do tabeli pośredniczącej.

```SQL 
CREATE OR REPLACE PROCEDURE place_order(game_id int, user_id int, quantity int)
    LANGUAGE sql
AS $$
    INSERT INTO public.order (id, user_id, "orderDate", status) 
    VALUES ( ((SELECT MAX(id) FROM public.order) + 1), user_id, NOW(), 'ordered');
    INSERT INTO public.order_game (order_id, game_id, "orderQuantity") 
    VALUES ((SELECT MAX(id) FROM public.order), game_id, quantity);
$$;
```

Przykładowe wywołanie

```SQL 
-- game_id int, user_id int, quantity int
CALL place_order(1, 1, 1);
```


### 🔵 cancel_orders

Funkcja używana przy wywołaniu triggera do anulowania zamówień dotyczących zarchiwizowanych gier.

```SQL 
-- cancel all uncompleted orders containing archived games
CREATE OR REPLACE FUNCTION cancel_orders()
    RETURNS TRIGGER
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    IF NEW.archived THEN
        UPDATE public.order SET status = 'canceled' 
        WHERE (status = 'paid' OR status = 'ordered') AND id IN 
        (SELECT order_game.order_id FROM public.order_game WHERE order_game.game_id = NEW.game_id);
    END IF;
    RETURN NULL;
END
$$;
```

### 🔵 copies_in_storage_check

Zapewnia, że zamówienie z za dużą ilością gier nie zostanie przekazane do realizacji.

```SQL 
-- prevent user form placing order if not enough copies are available
CREATE OR REPLACE FUNCTION copies_in_storage_check()
    RETURNS TRIGGER
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    IF (SELECT quantity FROM public.storage WHERE game_id = NEW.game_id) < (NEW."orderQuantity") 
    THEN
        RAISE EXCEPTION 'Not enough copies in storage';
    END IF;
    RETURN NEW;
END
$$;
```

### 🔵 subtract_quantity

Zmniejsza liczbę towarów w magazynie - nie zmieni na mniej niż 0, gdyż przed insertem zamówienia wywołuje się trigger, który sprawdzi, czy zamówienie może być oddane do realizacji.

```SQL 
-- subtract quantity when a new game is ordered
CREATE OR REPLACE FUNCTION subtract_quantity()
    RETURNS TRIGGER
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    UPDATE storage SET quantity = 
    ((SELECT quantity FROM public.storage WHERE game_id = NEW.game_id) - NEW."orderQuantity") 
    WHERE game_id = NEW.game_id;
    RETURN NULL;
END
$$;
```


## ⚅ Role

