-- cancel all uncompleted orders containing archived games
CREATE OR REPLACE FUNCTION cancelOrders()
RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS $$
    BEGIN
        IF NEW.archived THEN
                -- if order.status = ordered, paid
                UPDATE public.order SET status = 'canceled' WHERE (status = 'paid' OR status = 'ordered')
                AND
                -- TODO czy na pewno dobra gra zostanie wybrana?
--                 SELECT order_game.order_id FROM public.order_game WHERE order_game.game_id = 1;
                order_id = (SELECT order_game.order_id FROM order_game WHERE order_game.game_id = NEW.game_id);
        end if;
        RETURN NULL;
    END
    $$;


CREATE TRIGGER cancelOrdersWithArchivedGames
    AFTER UPDATE ON storage
    FOR EACH ROW
EXECUTE FUNCTION cancelOrders();



-- (jesli nie ma wystarczajacej ilosci gier w magazynie, cancel zamowienia)
-- Przy zamowieniu jesli quantity (order game)
-- od game id jest wieksze od game id w storage to cancel

-- cancel orders if there is not enough game copies
CREATE OR REPLACE FUNCTION checkGameCount()
    RETURNS TRIGGER
    LANGUAGE 'plpgsql'
AS $$
BEGIN

    RETURN NULL;
END
$$;

CREATE TRIGGER notEnoughGamesInStorage
    BEFORE INSERT ON order_game
    FOR EACH ROW
EXECUTE FUNCTION checkGameCount()