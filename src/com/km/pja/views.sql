CREATE VIEW newest
AS
SELECT title, "releaseDate" FROM game ORDER BY "releaseDate" DESC;

CREATE VIEW most_popular
AS
SELECT count(public.order_game.game_id) AS ilosc,
       (SELECT title FROM public.game WHERE id = public.order_game.game_id)
FROM public.order_game GROUP BY public.order_game.game_id ORDER BY ilosc DESC;
