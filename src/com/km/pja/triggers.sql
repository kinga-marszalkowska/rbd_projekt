-- cancel all uncompleted orders containing archived games
-- CREATE OR REPLACE FUNCTION cancel_orders()
-- RETURNS TRIGGER
-- LANGUAGE 'plpgsql'
-- AS $$
--     BEGIN
--         IF NEW.archived THEN
--                 UPDATE public.order SET status = 'canceled' WHERE (status = 'paid' OR status = 'ordered')
--                 AND
--                 id = (SELECT order_game.order_id FROM public.order_game WHERE order_game.game_id = NEW.game_id);
--         end if;
--         RETURN NULL;
--     END
--     $$;
--
--
-- CREATE TRIGGER cancel_orders_with_archived_games
--     AFTER UPDATE ON storage
--     FOR EACH ROW
-- EXECUTE FUNCTION cancel_orders();
--
--
--
--
-- CREATE OR REPLACE FUNCTION cancel_orders2()
--     RETURNS TRIGGER
--     LANGUAGE 'plpgsql'
-- AS $$
-- BEGIN
--     IF NEW.archived THEN
--         -- dla każdego indexu z tego setu (SELECT order_game.order_id FROM public.order_game WHERE order_game.game_id = NEW.game_id);
--         -- wykonaj update
--         UPDATE public.order SET status = 'canceled' WHERE (status = 'paid' OR status = 'ordered') AND id = ;
--     end if;
--     RETURN NULL;
-- END
-- $$;
--
--
--
--
-- -- (jesli nie ma wystarczajacej ilosci gier w magazynie, cancel zamowienia)
-- -- Przy zamowieniu jesli quantity (order game)
-- -- od game id jest wieksze od game id w storage to cancel
--
-- -- cancel orders if there is not enough game copies
-- CREATE OR REPLACE FUNCTION check_game_count()
--     RETURNS TRIGGER
--     LANGUAGE 'plpgsql'
-- AS $$
-- BEGIN
--     IF NEW.game_id THEN
--         SELECT quantity FROM public.storage WHERE game_id = 1;
--     end if;
--     RETURN NULL;
-- END
-- $$;
--
-- CREATE TRIGGER notEnoughGamesInStorage
--     BEFORE INSERT ON order_game
--     FOR EACH ROW
-- EXECUTE FUNCTION checkGameCount()


-- subtract quantity when a new game is ordered
CREATE OR REPLACE FUNCTION subtract_quantity()
    RETURNS TRIGGER
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    UPDATE storage SET quantity = ((SELECT quantity FROM public.storage WHERE game_id = NEW.game_id) - NEW."orderQuantity") WHERE game_id = NEW.game_id;
    RETURN NULL;
END
$$;

CREATE TRIGGER subtract_quantity_order
    AFTER INSERT ON order_game
    FOR EACH ROW
EXECUTE FUNCTION subtract_quantity()