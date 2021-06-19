-- cancel all uncompleted orders containing archived games
CREATE OR REPLACE FUNCTION cancelOrders()
LANGUAGE 'plpgsql'
AS $$
    BEGIN
        IF storage.archived THEN
                -- if order.status = ordered, paid
                UPDATE order SET order.status = 'canceled' WHERE order.status = 'paid' OR order.status = 'ordered'
                AND
                -- TODO czy na pewno dobra gra zostanie wybrana?
                order_id = (SELECT order_game.order_id FROM order_game WHERE order_game.game_id = storage.game_id);
        end if;
    END
    $$;




CREATE TRIGGER cancelOrdersWithArchivedGames
    AFTER UPDATE ON storage
    FOR EACH ROW
    EXECUTE FUNCTION cancelOrders();


-- (jesli nie ma wystarczajacej ilosci gier w magazynie, cancel zamowienia)
-- Przy zamowieniu jesli quantity (order game)
-- od game id jest wieksze od game id w storage to cancel