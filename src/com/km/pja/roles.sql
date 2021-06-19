-- group roles --
CREATE ROLE db_owner;
GRANT ALL
    ON ALL TABLES IN SCHEMA 'public'
    TO db_owner;

CREATE ROLE it;
GRANT INSERT, SELECT, UPDATE, DELETE
    ON ALL TABLES IN SCHEMA 'public'
    TO it;
REVOKE SELECT, UPDATE, DELETE
    ON user
    TO it;

CREATE ROLE storage;
GRANT INSERT, SELECT, UPDATE
    ON storage
    TO storage;

CREATE ROLE marketing;
GRANT INSERT, SELECT, UPDATE
    ON games, awards
    TO marketing;

CREATE ROLE ecommerce;
GRANT INSERT
    ON order, order_game
    TO ecommerce;
GRANT INSERT, UPDATE
    ON user
    TO ecommerce;

GRANT SELECT
    ON category, category_game, game, illustrator, illustrator_game, author, author_game, publisher, award
    TO ALL;

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
GRANT marketing TO dorotka;
