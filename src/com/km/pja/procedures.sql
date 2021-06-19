-- inserts new order with given params
CREATE OR REPLACE PROCEDURE place_order(game_id int, user_id int, quantity int)
    LANGUAGE sql
AS $$
    INSERT INTO public.order (id, user_id, "orderDate", status) VALUES ( ((SELECT MAX(id) FROM public.order) + 1), user_id, NOW(), 'ordered');
    INSERT INTO public.order_game (order_id, game_id, "orderQuantity") values ((SELECT MAX(id) FROM public.order), game_id, quantity);
$$;

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
