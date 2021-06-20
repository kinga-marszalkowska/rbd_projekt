-- group roles --
CREATE ROLE db_owner;
GRANT ALL
    ON ALL TABLES IN SCHEMA public
    TO db_owner;

CREATE ROLE it;
GRANT INSERT, SELECT, UPDATE, DELETE
    ON ALL TABLES IN SCHEMA public
    TO it;
REVOKE SELECT, UPDATE, DELETE
    ON public.user
    FROM it;

CREATE ROLE storage;
GRANT INSERT, SELECT, UPDATE
    ON public.storage
    TO storage;

CREATE ROLE sales;
GRANT INSERT, SELECT, UPDATE
    ON public.game, public.award
    TO sales;

CREATE ROLE ecommerce;
GRANT INSERT
    ON public.order, public.order_game
    TO ecommerce;
GRANT INSERT, UPDATE
    ON public.user
    TO ecommerce;

GRANT SELECT
    ON public.category, public.category_game, public.game, public.illustrator, public.illustrator_game, public.author, public.author_game, public.publisher, public.award
    TO it, storage, sales, ecommerce;

-- accounts --
CREATE ROLE pioter
    LOGIN
    ENCRYPTED
    PASSWORD 'maslo'
    VALID UNTIL '2022-04-01';
GRANT it TO pioter;

CREATE ROLE janusz
    LOGIN
    ENCRYPTED
    PASSWORD 'jajco123'
    VALID UNTIL '2022-04-01';
GRANT storage TO janusz;

CREATE ROLE dorotka
    LOGIN
    ENCRYPTED
    PASSWORD 'xoxo'
    VALID UNTIL '2021-12-31';
GRANT sales TO dorotka;
