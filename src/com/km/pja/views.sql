CREATE VIEW newest
AS
SELECT title, "releaseDate" FROM game ORDER BY "releaseDate" DESC;

CREATE VIEW most_popular
AS
SELECT game_id, SUM("orderQuantity") FROM public.order_game GROUP BY game_id;