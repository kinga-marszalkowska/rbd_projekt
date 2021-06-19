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



## 

##

## ⚄ Procedury i funkcje
## ⚅ Role

