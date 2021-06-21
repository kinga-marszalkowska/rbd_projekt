# 🎲 Sklep internetowy z grami planszowymi 🎲
![diagram_v4](https://user-images.githubusercontent.com/55376943/122669507-09013e80-d1be-11eb-87d5-05e9e6123da4.png)


Autorzy: Kinga Marszałkowska, Marek Kudła 

## Opis

Baza danych przechowuje informacje o grach, oraz o użytkownikach i ich zamówieniach. 

## 📖 Zawartość
**[⚀ Bazka](#-bazka)**<br>
**[⚁ Select, Update](#-select-update)**<br>
**[⚂ Widoki](#-widoki)**<br>
**[⚃ Triggery](#-triggery)**<br>
**[⚄ Procedury i funkcje](#-procedury-i-funkcje)**<br>
**[⚅ Role](#-role)**<br>



## ⚀ Bazka

Żeby mieć ją u siebie wystarczy stworzyć nową bazę za pomocą pgAdmin, kliknąć prawym przyciskiem w jej nazwę i otworzyć query tool. Następnie skopiować do niego zawartość pliku
[allInOne.sql](/src/com/km/pja/allInOne.sql), gdzie znajdują się:

* Definicja bazy (create),
* Dane (insert),
* Role
* Widoki

Żeby baza była w pełni funkcjonalna klikając prawym przyciskiem w schema public należy otworzyć query tool i przekopiować do niego zawartość pliku [allInOne_2.sql](/src/com/km/pja/allInOne_2.sql). Są tam trygiery, procedury i funkcje.


## ⚁ Select, Update

Więcej przykładów zapytań select: [selects_example.sql](/src/com/km/pja/selects_example.sql)

🔵 Zapytanie do pobrania historii zamówień wybranego użytkownika.

```SQL 
-- get 11th user's order history
SELECT order_game.order_id, (SELECT title FROM public.game WHERE id = order_game.game_id),
       order_game."orderQuantity", user_id, "orderDate", status
FROM public.order_game JOIN public.order ON order_game.order_id = id 
WHERE user_id = 11 ORDER BY "orderDate" ASC;

```

Wynik:

![order_history](https://user-images.githubusercontent.com/64398325/122830736-0f400980-d2e9-11eb-98be-8b3c2b378384.PNG)


🔵 Pobieranie całościowej wartości zamówienia i jego id.

```SQL 
-- shows totals of all orders
SELECT public.order.id,
       SUM(("orderQuantity" * (SELECT price FROM public.storage WHERE public.storage.game_id = public.order_game.game_id))) AS total
FROM public.order JOIN public.order_game ON public.order.id = order_id
GROUP BY public.order.id ;

```

Wynik:

![total](https://user-images.githubusercontent.com/64398325/122830984-7c539f00-d2e9-11eb-9ec6-f74749826acf.PNG)


🔵 Filtrowanie wyników wyszukiwań - wybiera gry o podanej kategorii.

```SQL 
-- select games with given categories
SELECT DISTINCT
(SELECT title FROM public.game WHERE id = category_game.game_id)
FROM public.category_game JOIN public.category ON category_id = id
WHERE category.name IN ('zręcznościowa', 'karciana', 'edukacyjna');
```
Wynik:

![games](https://user-images.githubusercontent.com/64398325/122831122-b45ae200-d2e9-11eb-95cb-c2c819caf0d5.PNG)


Więcej przykładów zapytań update: [updates_example.sql](/src/com/km/pja/updates_example.sql)

🔵 Zmiana statusu zamówienia

```SQL 
-- change order status
UPDATE public.order SET status = 'shipped' WHERE id = 1;

```


## ⚂ Widoki
Więcej przykładów widoków: [views.sql](/src/com/km/pja/views.sql)

### 🔵 newest

Wyświetla gry w kolejności od najnowszych pod względem daty wydania.
```SQL 
CREATE VIEW newest
AS
SELECT title, "releaseDate" FROM game ORDER BY "releaseDate" DESC;

```

### 🔵 most_popular

Wyświetla pozycje w kolejności od tych z największą liczbą zamówień.

```SQL 
CREATE VIEW most_popular
AS
SELECT game_id, SUM("orderQuantity") FROM public.order_game GROUP BY game_id;

```

### 🔵 game_authors

Wyświetla listę gier wraz z imionami i nazwiskami jej autorów.

```SQL 
CREATE VIEW game_authors
AS
SELECT public.game.title, public.author.name, public.author.surname
    from public.game
    inner join public.author_game ON public.game.id = public.author_game.game_id
    inner join public.author ON public.author_game.author_id = public.author.id;

```

## ⚃ Triggery

Przykładowe zastosowania triggerów w pliku [triggers_example.sql](/src/com/km/pja/triggers_example.sql)

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


## ⚄ Procedury i funkcje

Procedury i funkcje znajdują się w pliku [procedures.sql](/src/com/km/pja/procedures.sql)

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


### 🔵 get_most_active_users

Zwraca listę id użytkowników i liczby ich zamówień z danego miesiąca i roku.

```SQL 
-- get a list of clients that have the most orders in a given month and year
CREATE FUNCTION get_most_active_users(month varchar(2), year varchar(4) )
    RETURNS TABLE (user_id integer, liczba_zamowien bigint)
    AS
$BODY$
BEGIN
    RETURN QUERY SELECT public.order.user_id, COUNT(status) AS liczba_zamowien FROM public.order
                 WHERE "orderDate"::text LIKE CONCAT(year, '-',month,'-%')
                 GROUP BY public.order.user_id
                 ORDER BY liczba_zamowien DESC;

    RETURN;
END;
$BODY$
    LANGUAGE plpgsql;
```

Przykładowe wywołanie:

```SQL 
SELECT * FROM get_most_active_users('08', '2020')
```

Wynik:

![queryout](https://user-images.githubusercontent.com/64398325/122830464-a8225500-d2e8-11eb-93a9-4547f752bf7f.PNG)


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

Wszystkie role znajdują się tutaj: [roles.sql](/src/com/km/pja/roles.sql)

### 🔵 it

Grupa ról IT ma dostęp do większości danych i funkcji w systemie. 

```SQL 
CREATE ROLE it;
GRANT INSERT, SELECT, UPDATE, DELETE
    ON ALL TABLES IN SCHEMA 'public'
    TO it;
REVOKE UPDATE, DELETE
    ON user
    TO it;

```

### 🔵 sales

Role posiadające uprawnienia "sales" mogą dodawać i aktualizować informacje o grach.

```SQL 
CREATE ROLE sales;
GRANT INSERT, SELECT, UPDATE
    ON games, awards
    TO sales;
```

### 🔵 ecommerce

Rola grupowa przeznaczona dla systemu obsługującego sklep. Ma uprawnienia do tworzenia nowych użytkowników, aktualizowania ich danych oraz do składania zamównień.

```SQL 
CREATE ROLE ecommerce;
GRANT INSERT
    ON order, order_game
    TO ecommerce;
GRANT INSERT, UPDATE
    ON user
    TO ecommerce;
```

Wszystkie grupy posiadają uprawnienia do wyświetlania tabel związanych z grami.
```SQL 
GRANT SELECT
    ON category, category_game, game, illustrator, illustrator_game, author, author_game, publisher, award
    TO ALL;
```

### 🔵 Przykładowe role użytkowników systemu

```SQL 
-- accounts --
CREATE ROLE pioter
    LOGIN
    ENCRYPTED
    PASSWORD 'maslo'
    VALID UNTIL '2022-04-01';
GRANT it TO pioter;

CREATE ROLE janusz
    LOGIN
    ENCRYPTED
    PASSWORD 'jajco123'
    VALID UNTIL '2022-04-01';
GRANT storage TO janusz;

CREATE ROLE dorotka
    LOGIN
    ENCRYPTED
    PASSWORD 'xoxo'
    VALID UNTIL '2021-12-31';
GRANT sales TO dorotka;
```
