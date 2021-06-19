# 🎲 Sklep internetowy grami planszowymi
![diagram](https://user-images.githubusercontent.com/55376943/122652853-5a1f1d00-d141-11eb-8a7c-2ac28f1ed87c.png)

Autorzy: Marek Kudła, Kinga Marszałkowska

## Opis

Baza danych przechowuje informacje o grach, oraz o użytkownikach i ich zamówieniach. 

### ⚀ 
### ⚁ Bazka (creaty + inserty)

W pilku [allInOne.sql](/src/com/km/pja/allInOne.sql) znajdują się:

* Definicja bazy (create),
* Dane (insert),
* Funkcje i procedury,
* Triggery,
* Role

### ⚂ Select


### ⚃ Triggery

Przykładowe zastosowania triggerów w pliku [triggers_examples.sql](/src/com/km/pja/triggers_examples.sql)

#### cancel_orders

```SQL 
CREATE TRIGGER cancel_orders_with_archived_games
    AFTER UPDATE ON storage
    FOR EACH ROW
EXECUTE FUNCTION cancel_orders();

```


#### 

####

### ⚄ Procedury i funkcje
### ⚅ Role

