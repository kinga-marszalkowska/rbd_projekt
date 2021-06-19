-- get 1st user's order history
SELECT order_game.order_id, (SELECT title FROM public.game WHERE id = order_game.game_id),
       order_game."orderQuantity", user_id, "orderDate", status
FROM public.order_game JOIN public.order ON order_game.order_id = id WHERE user_id = 11 ORDER BY "orderDate" ASC;

-- select games by category name
SELECT (SELECT title FROM public.game WHERE id = category_game.game_id)
FROM public.category_game JOIN public.category ON category_id = id WHERE category.name = 'zręcznościowa';

-- newest games
SELECT title, "releaseDate" FROM game ORDER BY "releaseDate" DESC;

-- most popular games -- add (*(select "orderQuantity" from public.order where id = public.order_game.game_id))
SELECT count(public.order_game.game_id) AS ilosc,
       (SELECT title FROM public.game WHERE id = public.order_game.game_id)
FROM public.order_game GROUP BY public.order_game.game_id ORDER BY ilosc DESC;
