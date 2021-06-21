-- get 11th user's order history
SELECT order_game.order_id, (SELECT title FROM public.game WHERE id = order_game.game_id),
       order_game."orderQuantity", user_id, "orderDate", status
FROM public.order_game JOIN public.order ON order_game.order_id = id
WHERE user_id = 11
ORDER BY "orderDate" ASC;

-- select games by category name
SELECT (SELECT title FROM public.game WHERE id = category_game.game_id)
FROM public.category_game JOIN public.category ON category_id = id
WHERE category.name = 'zręcznościowa';

-- or multiple categories
SELECT DISTINCT
(SELECT title FROM public.game WHERE id = category_game.game_id)
FROM public.category_game JOIN public.category ON category_id = id
WHERE category.name IN ('zręcznościowa', 'karciana', 'edukacyjna');

-- find games for 2 players
SELECT * FROM public.game WHERE 2 BETWEEN "playersMin" and "playersMax";

-- find games for kids of age > 7 published by rebel
SELECT * FROM public.game
WHERE (10 >= "ageMin") AND (game.publisher_id = (SELECT id FROM publisher WHERE name = 'rebel' )) ;

-- shows totals of all orders
SELECT public.order.id,
       SUM(("orderQuantity" * (SELECT price FROM public.storage WHERE public.storage.game_id = public.order_game.game_id))) AS total
FROM public.order JOIN public.order_game ON public.order.id = order_id
GROUP BY public.order.id ;

-- select games that need restocking (quantity is < 5)
SELECT game_id, quantity, price, archived, (SELECT game.title FROM public.game WHERE id = public.storage.game_id)
FROM public.storage
WHERE quantity < 5
ORDER BY public.storage.game_id;
