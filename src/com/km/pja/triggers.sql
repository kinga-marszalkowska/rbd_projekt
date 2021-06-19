-- cancel all uncompleted orders containing archived games
CREATE OR REPLACE FUNCTION cancel_orders()
    RETURNS TRIGGER
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    IF NEW.archived THEN
        UPDATE public.order SET status = 'canceled' WHERE (status = 'paid' OR status = 'ordered')
        AND id IN (SELECT order_game.order_id FROM public.order_game WHERE order_game.game_id = NEW.game_id);
    END IF;
    RETURN NULL;
END
$$;

CREATE TRIGGER cancel_orders_with_archived_games
    AFTER UPDATE ON storage
    FOR EACH ROW
EXECUTE FUNCTION cancel_orders();

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
EXECUTE FUNCTION subtract_quantity();

-- prevent user form placing order if not enough copies are available
CREATE OR REPLACE FUNCTION copies_in_storage_check()
    RETURNS TRIGGER
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    IF (SELECT quantity FROM public.storage WHERE game_id = NEW.game_id) < (NEW."orderQuantity") THEN
        RAISE EXCEPTION 'Not enough copies in storage';
    END IF;
    RETURN NEW;
END
$$;

CREATE TRIGGER are_enough_copies_in_storage
    BEFORE INSERT ON order_game
    FOR EACH ROW
EXECUTE FUNCTION copies_in_storage_check();