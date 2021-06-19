--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE projekt;
CREATE DATABASE projekt WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1250';
ALTER DATABASE projekt OWNER TO postgres;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.author (
    id integer NOT NULL,
    name character varying(30),
    surname character varying(30),
    middle_name character varying(30)
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: author_game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author_game (
    author_id integer,
    game_id integer
);


ALTER TABLE public.author_game OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;


--
-- Name: award; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.award (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    year integer,
    game_id integer
);


ALTER TABLE public.award OWNER TO postgres;

--
-- Name: award_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.award_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.award_id_seq OWNER TO postgres;

--
-- Name: award_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.award_id_seq OWNED BY public.award.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_game (
    category_id integer,
    game_id integer
);


ALTER TABLE public.category_game OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game (
    title character varying(65),
    publisher_id bigint NOT NULL,
    "shortDescription" character varying(70),
    "longDescription" text,
    language character varying(5),
    "playersMin" integer,
    "playersMax" integer,
    "timeMin" integer,
    "timeMax" integer,
    "ageMin" integer,
    "ageMax" integer,
    id integer NOT NULL,
    price double precision,
    rating double precision,
    weight double precision,
    "releaseDate" date
);


ALTER TABLE public.game OWNER TO postgres;

--
-- Name: game_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_id_seq OWNER TO postgres;

--
-- Name: game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;


--
-- Name: illustrator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.illustrator (
    id integer NOT NULL,
    name character varying(30),
    middle_name character varying(30),
    surname character varying(30) NOT NULL
);


ALTER TABLE public.illustrator OWNER TO postgres;

--
-- Name: illustrator_game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.illustrator_game (
    illustrator_id integer,
    game_id integer
);


ALTER TABLE public.illustrator_game OWNER TO postgres;

--
-- Name: illustrator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.illustrator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.illustrator_id_seq OWNER TO postgres;

--
-- Name: illustrator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.illustrator_id_seq OWNED BY public.illustrator.id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    "orderDate" date,
    status character varying(10)
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_game (
    order_id integer NOT NULL,
    game_id integer NOT NULL,
    "orderQuantity" integer NOT NULL
);


ALTER TABLE public.order_game OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- Name: publisher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publisher (
    id integer NOT NULL,
    name character varying(65) NOT NULL
);


ALTER TABLE public.publisher OWNER TO postgres;

--
-- Name: publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publisher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publisher_id_seq OWNER TO postgres;

--
-- Name: publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publisher_id_seq OWNED BY public.publisher.id;


--
-- Name: storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage (
    id integer NOT NULL,
    game_id integer NOT NULL,
    quantity integer NOT NULL,
    price double precision,
    archived boolean
);


ALTER TABLE public.storage OWNER TO postgres;

--
-- Name: storage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storage_id_seq OWNER TO postgres;

--
-- Name: storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storage_id_seq OWNED BY public.storage.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(320),
    "phoneNumber" character varying(15),
    username character varying(30) NOT NULL,
    password text NOT NULL,
    name character varying(30),
    surname character varying(50),
    country character varying(80),
    city character varying(80),
    "adressLine1" character varying(80),
    "postalCode" character varying(6),
    regular boolean
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- Name: award id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.award ALTER COLUMN id SET DEFAULT nextval('public.award_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: game id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);


--
-- Name: illustrator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.illustrator ALTER COLUMN id SET DEFAULT nextval('public.illustrator_id_seq'::regclass);


--
-- Name: order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- Name: publisher id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher ALTER COLUMN id SET DEFAULT nextval('public.publisher_id_seq'::regclass);


--
-- Name: storage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage ALTER COLUMN id SET DEFAULT nextval('public.storage_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


SELECT pg_catalog.setval('public.author_id_seq', 3, true);


--
-- Name: award_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.award_id_seq', 1, false);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 5, true);


--
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_id_seq', 1, true);


--
-- Name: illustrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.illustrator_id_seq', 1, false);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- Name: publisher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publisher_id_seq', 4, true);


--
-- Name: storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storage_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- Name: award award_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.award
    ADD CONSTRAINT award_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: game id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- Name: illustrator illustrator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.illustrator
    ADD CONSTRAINT illustrator_pkey PRIMARY KEY (id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: publisher publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);


--
-- Name: storage storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: author_game fk_author_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_game
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES public.author(id);


--
-- Name: category_game fk_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_game
    ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: award fk_game_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.award
    ADD CONSTRAINT fk_game_id FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- Name: illustrator_game fk_game_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.illustrator_game
    ADD CONSTRAINT fk_game_id FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- Name: author_game fk_game_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author_game
    ADD CONSTRAINT fk_game_id FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- Name: category_game fk_game_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_game
    ADD CONSTRAINT fk_game_id FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- Name: illustrator_game fk_illustrator_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.illustrator_game
    ADD CONSTRAINT fk_illustrator_id FOREIGN KEY (illustrator_id) REFERENCES public.illustrator(id);


--
-- Name: game fk_publisher_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT fk_publisher_id FOREIGN KEY (publisher_id) REFERENCES public.publisher(id);


--
-- Name: order_game game_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_game
    ADD CONSTRAINT game_id_fk FOREIGN KEY (game_id) REFERENCES public.game(id) NOT VALID;


--
-- Name: storage game_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT game_id_fk FOREIGN KEY (game_id) REFERENCES public.game(id) NOT VALID;


--
-- Name: order_game order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_game
    ADD CONSTRAINT order_id_fk FOREIGN KEY (order_id) REFERENCES public."order"(id) NOT VALID;


--
-- Name: order user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public."user"(id) NOT VALID;


--
-- PostgreSQL database dump complete
--



-- publishers --
INSERT INTO public.publisher (id, name) VALUES (1, 'rebel'); --1
INSERT INTO public.publisher (id, name) VALUES (2, 'Days of Wonder'); --2
INSERT INTO public.publisher (id, name) VALUES (3, 'mattel'); --3
INSERT INTO public.publisher (id, name) VALUES (4, 'What the frog'); --4
INSERT INTO public.publisher (id, name) VALUES (5, 'Black Monk'); --5
INSERT INTO public.publisher (id, name) VALUES (6, 'Awaken Realms'); --6
INSERT INTO public.publisher (id, name) VALUES (7, 'FryxGames'); --7

-- authors --
INSERT INTO public.author (id, name, surname) VALUES (1, 'Denis', 'Blanchot'); --1
INSERT INTO public.author (id, name, surname) VALUES (2, 'Guillaume', 'Gille-Naves'); --2
INSERT INTO public.author (id, name, surname) VALUES (3, 'Igor', 'Polouchine'); --3
INSERT INTO public.author (id, name, surname) VALUES (4, 'Krzysztof', 'Głośnicki'); --4
INSERT INTO public.author (id, name, surname) VALUES (5, 'Adam', 'Kwapiński'); --5
INSERT INTO public.author (id, name, surname) VALUES (6, 'Alan', 'R. Moon'); --6
INSERT INTO public.author (id, name, surname) VALUES (7, 'Matthew', 'Inman'); --7
INSERT INTO public.author (id, name, surname) VALUES (8, 'Vlaada', 'Chvátil'); --8
INSERT INTO public.author (id, name, surname) VALUES (9, 'Ramy', 'Badie'); --9
INSERT INTO public.author (id, name, surname) VALUES (10, 'Jacob', 'Fryxelius'); --10
INSERT INTO public.author (id, name, surname) VALUES (11, 'Steve Jackson Games', null); --11
INSERT INTO public.author (id, name, surname) VALUES (12, 'Marc', 'André'); --12

-- illustrators --
INSERT INTO public.illustrator (id, name, surname) VALUES (1, 'Katarzyna', 'Malinowska'); --1
INSERT INTO public.illustrator (id, name, surname) VALUES (2, 'Piotr', 'Foksowicz'); --2
INSERT INTO public.illustrator (id, name, surname) VALUES (3, 'Ewa', 'Labak'); --3
INSERT INTO public.illustrator (id, name, surname) VALUES (4, 'Patryk', 'Jędraszek'); --4
INSERT INTO public.illustrator (id, name, surname) VALUES (5, 'Paweł', 'Samborski'); --5
INSERT INTO public.illustrator (id, name, surname) VALUES (6, 'Piotr', 'Gacek'); --6
INSERT INTO public.illustrator (id, name, surname) VALUES (7, 'Andrzej', 'Półtoranos'); --7
INSERT INTO public.illustrator (id, name, surname) VALUES (8, 'Matthew', 'Inman'); --8
INSERT INTO public.illustrator (id, name, surname) VALUES (9, 'Tomáš', 'Kučerovský'); --9
INSERT INTO public.illustrator (id, name, surname) VALUES (10, 'Ramy', 'Badie'); --10
INSERT INTO public.illustrator (id, name, surname) VALUES (11, 'Isaac', 'Fryxelius'); --11
INSERT INTO public.illustrator (id, name, surname) VALUES (12, 'Pascal', 'Quidault'); --12

-- categories --
INSERT INTO public.category (id, name) VALUES (1, 'zręcznościowa'); --1
INSERT INTO public.category (id, name) VALUES (2, 'karciana'); --2
INSERT INTO public.category (id, name) VALUES (3, 'edukacyjna'); --3
INSERT INTO public.category (id, name) VALUES (4, 'odnajdowanie wzorców'); --4
INSERT INTO public.category (id, name) VALUES (5, 'sport'); --5
INSERT INTO public.category (id, name) VALUES (6, 'fantasy'); --6
INSERT INTO public.category (id, name) VALUES (7, 'science fiction'); --7
INSERT INTO public.category (id, name) VALUES (8, 'podróże'); --8
INSERT INTO public.category (id, name) VALUES (9, 'familijna'); --9
INSERT INTO public.category (id, name) VALUES (10, 'strategiczna'); --10
INSERT INTO public.category (id, name) VALUES (11, 'imprezowa'); --11
INSERT INTO public.category (id, name) VALUES (12, 'towarzyska'); --12
INSERT INTO public.category (id, name) VALUES (13, 'przygodowa'); --13
INSERT INTO public.category (id, name) VALUES (14, 'horror'); --14
INSERT INTO public.category (id, name) VALUES (15, 'ekonomiczna'); --15


----- games -----

-- insert Dobble (relate to correct categories and authors) --1
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (1, 'Dobble', 1, 'Gra, która rozkręci każdą imprezę!', 'Spójrz na pierwszą kartę, którą trzymasz w ręku oraz na tę, która leży na środku stołu. Znajdź na nich wspólny symbol, nazwij go i szybko pozbądź się swojego kartonika. Teraz następny! Tylko nie zwątp, każda karta łączy się z inną zawsze tylko jednym symbolem! Dobble to rozrywka absolutnie dla każdego - gra nadaje się zarówno do zabawy z dziećmi, jak i na imprezy dorosłych. 55 kolorowych kart zamkniętych jest w solidnej, metalowej puszce, dzięki czemu łatwo zabrać Dobble ze sobą i grać absolutnie wszędzie: w poczekalni u lekarza, w pociągu, na wycieczce… ',
        'pl', 2, 8, 5, 10, 6, 0.22, '01/01/2011');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (1,1);
INSERT INTO public.author_game ("author_id", "game_id") VALUES (2,1);
INSERT INTO public.author_game ("author_id", "game_id") VALUES (3,1);

INSERT INTO public.category_game ("category_id", "game_id") VALUES (1,1);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,1);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (3,1);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (4,1);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (5,1);

-- insert Elekt --2
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (2, 'Elekt', 4, 'Cesarz jest wyczerpany...', 'Elekt to taktyczna gra karciana dla 2-4 osób utrzymana w stylistyce dark fantasy. Gracze wcielają się w pretendentów do tronu mrocznego Dominatu Ebionitów. Aby zostać nowym władcą, będziecie przejmować władzę i spiskować. Będziecie przywoływać upiory i sługi ciemności, aby zasilać ich moce żarem. Najprzebieglejszy z Was zasiądzie na szczycie Wieży Dzwonów.',
        'pl', 2, 4, 60, 90, 16, 0.5, '23/11/2020');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (4, 2);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (1, 2);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (6,2);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,2);

-- insert wsiasc do pociagu --3
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (3, 'Wsiąść do Pociągu: Europa', 2, 'Bezkonkurencyjna gra familijna z mapą Europy', 'Od urwistych wzgórz Edynburga po słoneczne nabrzeża Stambułu, z dusznych alej Pampeluny do wietrznego Berlina - Wsiąść do pociągu: Europa zabierze cię w wielką podróż przez wielkie miasta Starego Kontynentu u progu zeszłego stulecia.Czy odważysz się przebyć mroczne tunele Szwajcarii?',
        'pl', 2, 5, 60, 90, 8, 1.415, '01/08/2019');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (6, 3);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (8,3);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,3);

-- insert nemesis --4
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (4, 'Nemesis', 1, 'Survival sci-fi game', 'Nemesis is a 1-5 player survival sci-fi game where players are woken up from hibernation as a crew of a space ship. The emergency procedure states that there is a critical system failure and the space ship can`t continue its cruise.',
        'en', 1, 5, 90, 180, 12, 3.9, '24/06/2019');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (5, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (2, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (3, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (4, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (5, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (6, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (7, 4);

INSERT INTO public.category_game ("category_id", "game_id") VALUES (7,4);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (10,4);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (14,4);

-- insert eksplodujace kotki --5
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (5, 'Eksplodujące Kotki', 1, 'Dla kochających koty i wybuchy', 'Eksplodujące Kotki to napędzana kociakami odmiana rosyjskiej ruletki. Gracze ciągną co turę po karcie, aż do momentu dobrania eksplodującego kota - wtedy nieszczęśnik wybucha i ginie, a gra się kończy.',
        'pl', 2, 5, 15, null, 12, 0.21, '16/11/2017');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (7, 5);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (8, 5);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (1,5);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,5);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (9,5);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (11,5);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (12,5);

-- insert tajniacy --6
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (6, 'Tajniacy', 1, 'Przednia, zespołowa zabawa dedukcyjna!', 'Dwie drużyny, którym przewodzi dwóch Szefów Wywiadu, próbują jak najszybciej nawiązać kontakt ze wszystkimi swoimi agentami.',
        'pl', 2, 8, 10, null, 14, 0.56, '03/03/2016');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (8, 6);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (9, 6);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,6);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (4,6);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (9,6);

-- insert to ja go tne --7
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (7, 'To ja go tnę!', 1, 'Przed polowaniem na potwora należy zebrać drużynę...', 'Zbierzcie drużynę bohaterów i wyruszcie na epicką przygodę przepełnioną prawdziwą jatką! Niech zdrada, groźne potwory i humor znany z Odjechanych jednorożców zagoszczą na Waszym stole!',
        'pl', 2, 6, 30, 60, 10, 0.45, '28/04/2021');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (9, 7);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (10, 7);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,7);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (6,7);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (8,7);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (13,7);

-- insert Terraformacja Marsa --8
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (8, 'Terraforming Mars', 7, 'Zmień Marsa w planetę zdatną do życia!', 'Ludzkość rozpoczęła ekspansję w Układzie Słonecznym. Na Marsie założono już kilka niewielkich kolonii. Ich mieszkańcy są odgrodzeni od naturalnego środowiska straszliwie zimnej, suchej i niemal pozbawionej atmosfery planety.',
        'en', 1, 5, 90, 120, 12, 1.642, '28/09/2016');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (10, 8);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (11, 8);

INSERT INTO public.category_game ("category_id", "game_id") VALUES (7,8);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (10,8);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (15,8);

-- insert Munchkin --9
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (9, 'Munchkin', 5, 'Świetna gra kpiąca z RPG', 'Munchkin to niekolekcjonerska gra karciana, która oddaje urok typowej gry fabularnej bez tego całego durnego odgrywania postaci. Musisz tylko zabijać potwory i zbierać magiczne przedmioty!',
        'pl', 3, 5, 60, 90, 12, 0.3, '02/03/2016');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (11, 9);

INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,9);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (6,9);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (12,9);

-- insert Splendor --10
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (10, 'Splendor', 1, 'Kolekcjonowanie nigdy nie było tak uzależniające!', 'Gracze wcielają się w renesansowych kupców, którzy próbują nabyć kopalnie klejnotów, środki transportu, sklepy - wszystko to w celu zdobycia jak największego prestiżu.',
        'pl', 2, 4, 30, null, 10, 1.02, '21/03/2016');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (12, 10);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (12, 10);

INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,10);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (6,10);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (9,10);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (10,10);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (15,10);

-- insert awards --

INSERT INTO public.award ("id", "name", "year", "game_id") VALUES (1, 'Board Game Quest Game of the Year Award', 2016, 8);
INSERT INTO public.award ("id", "name", "year", "game_id") VALUES (2, 'Game of the Year Award', 2018, 1);
INSERT INTO public.award ("id", "name", "year", "game_id") VALUES (3, 'Diana Jones Award', 2005, 3);
INSERT INTO public.award ("id", "name", "year", "game_id") VALUES (4, 'Spiel des Jahres', 2016, 6);
INSERT INTO public.award ("id", "name", "year", "game_id") VALUES (5, 'Deutscher Spiele Preis', 2016, 6);

-- insert users --
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (1, 'mmenault0@hexun.com', '527-456-4697', 'mmenault0', '1CSYpPzbrZJjxbSVBg4XZxCJ2rVDFLHNHz', 'Montague', 'Menault', 'Poland', 'Główczyce', '326 Almo Point', '76-220', false);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (2, 'climrick1@latimes.com', '874-308-9323', 'climrick1', '19QbPaFctsaAuu1qsx2g9P46y9J4KDfepr', 'Christine', 'Limrick', 'Poland', 'Olsztyn', '3 Clarendon Terrace', '42-256', false);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (3, 'meton2@merriam-webster.com', '889-258-2375', 'meton2', '1AY2zYnw1TEA3fbUBDTaH6g3w1yDdMWjWS', 'Marius', 'Eton', 'Poland', 'Giebułtów', '7 Crescent Oaks Avenue', '32-087', false);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (4, 'gbrainsby3@yahoo.com', '211-613-6168', 'gbrainsby3', '1PahEk1kJUuVjwmBeESR6PLqL4y354vgdw', 'Garry', 'Brainsby', 'Poland', 'Rzyki', '69 Garrison Avenue', '34-125', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (5, 'mwornum4@i2i.jp', '802-110-3163', 'mwornum4', '1DNG8WgK3W87rKuRWVjLsyU4ZEomPqNKc5', 'Mariquilla', 'Wornum', 'Poland', 'Damnica', '957 Waubesa Road', '76-231', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (6, 'fbauckham5@wikimedia.org', '526-247-7229', 'fbauckham5', '1G3sLaLN98DhsECxst2gQZgPLfs1tnDphq', 'Filippo', 'Bauckham', 'Poland', 'Węgliniec', '581 Mallory Crossing', '59-940', false);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (7, 'cthurlborn6@mysql.com', '353-111-8498', 'cthurlborn6', '12rVLojmERyyMbzGSCkibsG4X7LRf5QyLs', 'Colman', 'Thurlborn', 'Poland', 'Murów', '4246 Lien Court', '46-030', false);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (8, 'bweben7@yolasite.com', '839-247-7002', 'bweben7', '1DxCtu29MSNr7nerKPsh2trLkB4fFERz1P', 'Bernadine', 'Weben', 'Poland', 'Lubowidz', '8 Parkside Hill', '09-304', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (9, 'dwillshaw8@51.la', '153-819-4284', 'dwillshaw8', '1HV9iqtFXxZMQEsci2wbht6PHia2fpT83L', 'Domingo', 'Willshaw', 'Poland', 'Lubień', '257 Oneill Crossing', '32-433', false);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (10, 'bvanthoog9@purevolume.com', '387-995-0101', 'bvanthoog9', '1MjNLzEWoZs1uBsdynKJ5e8BSpiNScQwwb', 'Biron', 'Van T''Hoog', 'Poland', 'Rzeczenica', '1 Artisan Lane', '77-304', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (11, 'ssigginsa@hugedomains.com', '807-999-6016', 'ssigginsa', '19fijH37XXaD2NGhVTU8R5UXZaSaMcPqdx', 'Sol', 'Siggins', 'Poland', 'Jeziorzany', '71809 Arizona Park', '21-146', false);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (12, 'tdeattab@usnews.com', '138-551-5959', 'tdeattab', '16RhBWNVmvL9tZLbnRUNZVrvnJgJhfB9wH', 'Toinette', 'De Atta', 'Poland', 'Baranów', '4924 Elgar Road', '96-314', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (13, 'lgebbiec@oakley.com', '466-360-5696', 'lgebbiec', '178MomX8PuF9aMzMc3qm8asYtYyXmw3my9', 'Layla', 'Gebbie', 'Poland', 'Wilcza', '52 Melvin Pass', '44-189', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (14, 'wquantrelld@google.com', '263-341-6006', 'wquantrelld', '1PchABTrZh3mcMLu5J1EjadgDGj7yWxMLu', 'Woodie', 'Quantrell', 'Poland', 'Sośnicowice', '14 North Pass', '44-153', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (15, 'gmoyere@goo.ne.jp', '917-420-3699', 'gmoyere', '1LrRPbL8wmQrZns3NF4geSzjZQevLjdyDe', 'Gus', 'Moyer', 'Poland', 'Boniewo', '2679 Hudson Drive', '87-851', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (16, 'abaudessonf@cbsnews.com', '139-385-4826', 'abaudessonf', '133N9sHjt8UAduoVM3dMagXLLkrdf2XKNo', 'Arnoldo', 'Baudesson', 'Poland', 'Kaczory', '62 Norway Maple Junction', '64-810', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (17, 'rgoodwellg@comcast.net', '717-716-1469', 'rgoodwellg', '15YCYxghXCzWyTTQAETMXbr9tfRy4L8xmd', 'Ranee', 'Goodwell', 'Poland', 'Radostowice', '514 Oak Valley Trail', '43-243', false);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (18, 'ymcaleesh@tamu.edu', '283-978-2045', 'ymcaleesh', '1Ea6myfi1P4bheGZ6TxpQLFDg1pJi7cdRv', 'Yolanthe', 'McAlees', 'Poland', 'Sietesz', '30 Northland Pass', '37-206', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (19, 'icoskerryi@unblog.fr', '957-586-3559', 'icoskerryi', '17yu63MyDRtLDgUaQQSAyYnRsooH7v7RUU', 'Inglis', 'Coskerry', 'Poland', 'Dzwola', '671 Maple Wood Parkway', '23-304', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (20, 'alabelj@mozilla.org', '944-210-2776', 'alabelj', '18s5HRc5nqx867bCgec1bsg3Fs3YNH388v', 'Ashil', 'Label', 'Poland', 'Strachówka', '054 Scoville Center', '05-282', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (21, 'lcobleyk@craigslist.org', '873-966-1200', 'lcobleyk', '127sfmF6qXvndf9FMRRYTivomSLS2YoYiX', 'Lanette', 'Cobley', 'Poland', 'Sępólno Krajeńskie', '16 Eagle Crest Place', '89-400', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (22, 'cdaelmanl@google.co.uk', '812-788-3668', 'cdaelmanl', '155SaEizBr7p8PJsDM3rdH4MJpBHx7DPyq', 'Cindelyn', 'Daelman', 'Poland', 'Skalbmierz', '53516 Donald Circle', '28-530', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (23, 'dcharmanm@bluehost.com', '184-627-6094', 'dcharmanm', '127N1Si1Wi218w5GzDotyThLD4imAns38k', 'Dulcia', 'Charman', 'Poland', 'Kasina Wielka', '1559 Ridgeway Terrace', '34-741', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (24, 'bchastangn@cbsnews.com', '463-605-7164', 'bchastangn', '171JkDgEAhH975jh9vnU3Q4iQ8cki78vsg', 'Bevon', 'Chastang', 'Poland', 'Ochla', '36 Independence Place', '65-980', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (25, 'azarfaio@ustream.tv', '963-186-6711', 'azarfaio', '14RkPa9XgkmkQ33XpBamcnEu3DbkV7R632', 'Alisha', 'Zarfai', 'Poland', 'Iwierzyce', '30 Mccormick Court', '39-124', false);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (26, 'ctaylorp@reverbnation.com', '222-985-7740', 'ctaylorp', '1MntJpiqZzcPLiu9CfjqQtrrVUyU3wrw1u', 'Corey', 'Taylor', 'Poland', 'Zakroczym', '07583 Sloan Center', '05-170', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (27, 'nwannesq@miitbeian.gov.cn', '972-417-7291', 'nwannesq', '1DYDKYhhExjVA9V42E1G8UtbqLPVD8pHx4', 'Nelle', 'Wannes', 'Poland', 'Zabierzów', '50211 Di Loreto Crossing', '32-080', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (28, 'pcraiser@howstuffworks.com', '153-357-6914', 'pcraiser', '1Mng9WRYLZ3fnucmbnPUvqwxPqiKuS8FM7', 'Pierce', 'Craise', 'Poland', 'Żurowa', '588 Ludington Street', '38-323', false);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (29, 'qjimenezs@free.fr', '304-744-5444', 'qjimenezs', '1KEJedvE4CGXcDD9ATr5wUNM6rkmH4Ja7c', 'Quill', 'Jimenez', 'Poland', 'Biała Piska', '15 Emmet Hill', '12-230', true);
insert into public.user (id, email, "phoneNumber", username, password, name, surname, country, city, "adressLine1", "postalCode", regular) values (30, 'atavinort@earthlink.net', '200-160-0690', 'atavinort', '16RfMxtwkH5uRKiKEA3JUhrnRenfeeZ9D8', 'Ad', 'Tavinor', 'Poland', 'Kalety', '65 Lillian Street', '42-660', true);

-- insert orders --
insert into public.order (id, user_id, "orderDate", status) values (1, 16, '12/04/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (2, 27, '13/03/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (3, 11, '24/03/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (4, 16, '22/09/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (5, 29, '12/03/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (6, 14, '11/09/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (7, 1, '12/03/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (8, 10, '08/04/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (9, 29, '13/06/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (10, 5, '09/10/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (11, 20, '22/02/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (12, 24, '02/02/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (13, 24, '04/12/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (14, 21, '06/08/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (15, 30, '24/07/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (16, 13, '18/01/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (17, 11, '07/01/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (18, 14, '23/06/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (19, 22, '06/12/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (20, 26, '24/10/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (21, 24, '23/01/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (22, 10, '24/11/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (23, 29, '06/03/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (24, 21, '19/08/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (25, 23, '12/09/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (26, 29, '15/12/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (27, 7, '14/05/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (28, 25, '19/03/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (29, 21, '06/05/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (30, 19, '10/11/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (31, 16, '06/01/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (32, 8, '19/06/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (33, 10, '17/02/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (34, 16, '25/12/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (35, 18, '07/01/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (36, 4, '05/07/2020', 'canceled');
insert into public.order (id, user_id, "orderDate", status) values (37, 29, '16/08/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (38, 15, '03/08/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (39, 4, '12/04/2021', 'received');
insert into public.order (id, user_id, "orderDate", status) values (40, 16, '18/08/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (41, 26, '13/07/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (42, 15, '11/06/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (43, 11, '05/12/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (44, 1, '04/05/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (45, 8, '06/03/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (46, 7, '14/09/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (47, 22, '08/10/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (48, 25, '25/12/2020', 'received');
insert into public.order (id, user_id, "orderDate", status) values (49, 26, '19/01/2020', 'canceled');
insert into public.order (id, user_id, "orderDate", status) values (50, 18, '20/02/2021', 'canceled');

-- insert relations order_game --
insert into public.order_game (order_id, game_id, "orderQuantity") values (1, 5, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (2, 5, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (3, 4, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (3, 10, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (4, 5, 2);
insert into public.order_game (order_id, game_id, "orderQuantity") values (5, 10, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (6, 7, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (7, 4, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (8, 8, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (9, 2, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (10, 1, 2);
insert into public.order_game (order_id, game_id, "orderQuantity") values (11, 8, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (12, 1, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (13, 4, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (13, 6, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (14, 8, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (15, 4, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (16, 6, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (17, 2, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (18, 4, 3);
insert into public.order_game (order_id, game_id, "orderQuantity") values (19, 9, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (20, 7, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (21, 9, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (22, 8, 3);
insert into public.order_game (order_id, game_id, "orderQuantity") values (22, 1, 2);
insert into public.order_game (order_id, game_id, "orderQuantity") values (23, 10, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (24, 5, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (25, 6, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (26, 3, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (27, 7, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (28, 8, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (29, 10, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (29, 6, 1);
insert into public.order_game (order_id, game_id, "orderQuantity") values (30, 2, 2);

-- insert storage --
insert into public.storage (id, game_id, quantity, price, archived) values (1, 1, 6, 40.0, false);
insert into public.storage (id, game_id, quantity, price, archived) values (2, 2, 4, 105.65, false);
insert into public.storage (id, game_id, quantity, price, archived) values (3, 3, 6, 126.70, false);
insert into public.storage (id, game_id, quantity, price, archived) values (4, 4, 5, 449.0, false);
insert into public.storage (id, game_id, quantity, price, archived) values (5, 5, 6, 74.50, false);
insert into public.storage (id, game_id, quantity, price, archived) values (6, 6, 6, 48.90, false);
insert into public.storage (id, game_id, quantity, price, archived) values (7, 7, 4, 69.75, false);
insert into public.storage (id, game_id, quantity, price, archived) values (8, 8, 10, 137.99, false);
insert into public.storage (id, game_id, quantity, price, archived) values (9, 9, 1, 69.93, false);
insert into public.storage (id, game_id, quantity, price, archived) values (10, 10, 4, 75.71, false);
