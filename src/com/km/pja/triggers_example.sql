-- order game 1
INSERT INTO public.order (id, user_id, "orderDate", status) VALUES ( ((SELECT MAX(id) FROM public.order) + 1), 1, NOW(), 'ordered');
INSERT INTO public.order_game (order_id, game_id, "orderQuantity") values ((SELECT MAX(id) FROM public.order), 1, 1);
-- check all orders for game 1
SELECT order_id, game_id, user_id, "orderDate", status, "orderQuantity" FROM public.order JOIN public.order_game ON id = order_id WHERE game_id = 1;
-- archive game 1 (triggers canceling unfinished orders)
UPDATE public.storage SET archived = true WHERE game_id = 1;
-- check orders for game 1 again - all orders that were paid or ordered are now canceled
SELECT order_id, game_id, user_id, "orderDate", status, "orderQuantity" FROM public.order JOIN public.order_game ON id = order_id WHERE game_id = 1;


-- check and note quantity for game 1
SELECT quantity FROM public.storage WHERE game_id = 1
-- order game 1
INSERT INTO public.order (id, user_id, "orderDate", status) VALUES ( ((SELECT MAX(id) FROM public.order) + 1), 1, NOW(), 'ordered');
INSERT INTO public.order_game (order_id, game_id, "orderQuantity") values ((SELECT MAX(id) FROM public.order), 1, 1);
-- check quantity for game 1 again, should decrease by the amount of games ordered (in this case by 1)
SELECT quantity FROM public.storage WHERE game_id = 1