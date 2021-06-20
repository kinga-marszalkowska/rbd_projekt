-- archive game with id = 1
UPDATE public.storage SET archived = true WHERE game_id = 1;
-- change order status
UPDATE public.order SET status = 'shipped' WHERE id = 1;
