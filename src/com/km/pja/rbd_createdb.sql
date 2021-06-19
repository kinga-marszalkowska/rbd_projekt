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
    surname character varying(30)
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
    "orderQuantity" integer
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
    name character varying(65)
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

