CREATE VIEW newest
AS
SELECT title, "releaseDate" FROM public.game ORDER BY "releaseDate" DESC;

CREATE VIEW most_popular
AS
SELECT game_id, SUM("orderQuantity") FROM public.order_game GROUP BY game_id;

CREATE VIEW game_authors
AS
SELECT public.game.title, public.author.name, public.author.surname
    from public.game
    inner join public.author_game ON public.game.id = public.author_game.game_id
    inner join public.author ON public.author_game.author_id = public.author.id;

CREATE VIEW game_illustrators
AS
SELECT public.game.title, public.illustrator.name, public.illustrator.surname
    from public.game
    inner join public.illustrator_game ON public.game.id = public.illustrator_game.game_id
    inner join public.illustrator ON public.illustrator_game.illustrator_id = public.illustrator.id;

CREATE VIEW game_publishers
AS
SELECT public.game.title, public.publisher.name
    from public.game
    join public.publisher ON public.game.publisher_id = public.publisher.id;
