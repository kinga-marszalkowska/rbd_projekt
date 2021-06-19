-- get 1st user's order history
SELECT order_game.order_id, (SELECT title FROM public.game WHERE id = order_game.game_id),
       order_game."orderQuantity", user_id, "orderDate", status
FROM public.order_game JOIN public.order ON order_game.order_id = id WHERE user_id = 11 ORDER BY "orderDate" ASC;

-- select games by category name
SELECT (SELECT title FROM public.game WHERE id = category_game.game_id)
FROM public.category_game JOIN public.category ON category_id = id WHERE category.name = 'zręcznościowa';

-- shows total order price --
SELECT public.order.id, SUM(public.storage.price) AS cena
from public.order 
inner join public.order_game on public.order.id = public.order_game.order_id
inner join public.storage on public.order_game.game_id = public.storage.game_id
group by public.order.id
order by public.order.id;
