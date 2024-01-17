--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5 (Debian 15.5-0+deb12u1)
-- Dumped by pg_dump version 15.5 (Debian 15.5-0+deb12u1)

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

--
-- Name: users; Type: TABLE; Schema: public; Owner: fred
--

CREATE TABLE public.users (
    id integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    role character varying(50) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    last_login timestamp without time zone
);


ALTER TABLE public.users OWNER TO fred;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: fred
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO fred;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fred
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: fred
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fred
--

COPY public.users (id, firstname, lastname, email, role, created_on, last_login) FROM stdin;
1	Jean	Boyat	jeanboyat@me.com	admin	2018-06-01 12:20:05	2022-04-18 02:24:56
2	Ernest	Dupuis	ernestd@gmail.com	moderator	2019-03-18 12:17:04	2022-08-19 10:03:10
3	Alexandra	Sablet	alexandras@hotmail.com	customer	2020-09-28 12:17:48	2022-06-02 09:20:23
5	Lionel	Fontet	lionelfontet@hotmail.com	customer	2021-12-11 12:17:25	2022-04-11 00:12:09
6	Damien	Pic	damienpic@hotmail.com	customer	2021-09-18 12:19:29	2022-01-19 13:12:04
7	Matt	Wood	mattwood@hotmail.com	customer	2021-01-07 12:20:54	2021-04-05 15:07:00
8	Kevin	Toll	kevintoll@me.com	customer	2021-05-04 12:20:54	2022-09-08 23:01:10
9	Lou	Dumont	loudumont@free.fr	customer	2021-03-02 08:20:54	2022-10-18 09:40:01
10	Serge	Polito	spolito@gmail.com	customer	2021-01-29 08:21:54	2022-02-15 04:09:10
11	Sandra	Fernandez	sandraf@icloud.com	customer	2020-02-27 18:20:55	2021-01-17 11:00:00
12	Thomas	Petit	thomasp13@gmail.com	moderator	2020-09-21 13:21:54	2022-06-21 12:03:01
13	Tristan	Diterlizzi	tristanditerlizzi@gmail.com	customer	2021-04-12 13:22:55	2022-05-18 13:01:05
14	Karine	Jagnot	karinej45@hotmail.com	customer	2020-05-24 13:02:22	2022-04-27 14:00:05
15	Olivier	Prévot	oli210@me.com	customer	2021-12-23 14:01:12	2022-09-21 14:04:05
16	Mohamed	Boli	mohamedb@gmail.com	customer	2020-02-29 17:26:24	2022-01-18 15:01:04
17	Jerome	Dufour	jeromedf@gmail.com	customer	2021-03-23 13:23:00	2021-03-24 16:00:22
18	François-Xavier	Lucy	francois-xavier.lucy@gmail.com	customer	2021-08-01 08:00:33	2022-09-20 03:03:12
19	Élodie	Lorca	elodie.lorca@hotmail.com	customer	2021-12-08 07:03:22	2022-05-14 13:40:05
20	Marc	Cabro	marc.cabro@hotmail.com	customer	2020-11-30 19:01:03	2022-08-24 14:00:04
21	Tobias	Hermann	tobias795@gmail.com	customer	2021-12-02 22:21:07	2022-08-27 14:05:06
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fred
--

SELECT pg_catalog.setval('public.users_id_seq', 21, true);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: fred
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_firstname_key; Type: CONSTRAINT; Schema: public; Owner: fred
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_firstname_key UNIQUE (firstname);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: fred
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

