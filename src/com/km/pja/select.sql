-- get 1st user's order history
SELECT order_game.order_id, order_game.game_id, order_game."orderQuantity", user_id, "orderDate", status
FROM public.order_game JOIN public.order ON order_game.order_id = id WHERE user_id = 1;
