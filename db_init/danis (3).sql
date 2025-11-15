--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-11-15 09:05:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 217 (class 1259 OID 83636)
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    id integer NOT NULL,
    id_user integer,
    name character varying(255) NOT NULL,
    location text NOT NULL,
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    current_amount numeric(10,2) DEFAULT 0,
    goal_amount numeric(10,2) DEFAULT 100,
    description text,
    isdelete smallint DEFAULT 0
);


ALTER TABLE public.event OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 83644)
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_id_seq OWNER TO postgres;

--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 218
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- TOC entry 219 (class 1259 OID 83645)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 83648)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 221 (class 1259 OID 83649)
-- Name: volunteer_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteer_list (
    id_user integer NOT NULL,
    id_event integer NOT NULL,
    rating smallint
);


ALTER TABLE public.volunteer_list OWNER TO postgres;

--
-- TOC entry 4650 (class 2604 OID 83652)
-- Name: event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- TOC entry 4654 (class 2604 OID 83653)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4809 (class 0 OID 83636)
-- Dependencies: 217
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event (id, id_user, name, location, date, "time", current_amount, goal_amount, description, isdelete) FROM stdin;
1	1	Субботник в городском парке	Городской парк, центральный вход	2025-04-05	10:00:00	1500.00	5000.00	Уборка парка, высадка деревьев и цветов.	0
4	4	Лекция по экологии	Коворкинг "Эко-пространство", зал 2	2025-02-10	18:30:00	500.00	2000.00	Открытая лекция о раздельном сборе отходов.	0
2	2	Уборка на пляже	Набережная реки, старт у моста	2025-05-12	09:30:00	7800.00	10000.00	Уборка на пляже	0
3	3	Уборка в парке	Пункт приема на ул. Лесная, 15	2025-03-20	12:00:00	2300.00	3000.00	Уборка в парке	0
5	5	Сажаем деревья в парке	Дом престарелых №3, ул. Солнечная, 8	2025-01-25	11:00:00	0.00	1000.00	Сажаем деревья в парке	0
\.


--
-- TOC entry 4811 (class 0 OID 83645)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name) FROM stdin;
1	Иван Петров
2	Мария Иванова
3	Алексей Смирнов
4	Ольга Соколова
5	Дмитрий Кузнецов
6	Елена Морозова
\.


--
-- TOC entry 4813 (class 0 OID 83649)
-- Dependencies: 221
-- Data for Name: volunteer_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteer_list (id_user, id_event, rating) FROM stdin;
1	1	5
2	1	4
3	1	5
2	2	5
4	2	4
6	2	5
3	3	5
5	3	4
1	4	4
4	4	5
2	5	5
6	5	4
\.


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 218
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_seq', 1, false);


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4656 (class 2606 OID 83655)
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- TOC entry 4658 (class 2606 OID 83657)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4660 (class 2606 OID 83659)
-- Name: volunteer_list volunteer_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_list
    ADD CONSTRAINT volunteer_list_pkey PRIMARY KEY (id_user, id_event);


--
-- TOC entry 4661 (class 2606 OID 83660)
-- Name: event event_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 4662 (class 2606 OID 83665)
-- Name: volunteer_list volunteer_list_id_event_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_list
    ADD CONSTRAINT volunteer_list_id_event_fkey FOREIGN KEY (id_event) REFERENCES public.event(id);


--
-- TOC entry 4663 (class 2606 OID 83670)
-- Name: volunteer_list volunteer_list_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer_list
    ADD CONSTRAINT volunteer_list_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


-- Completed on 2025-11-15 09:05:51

--
-- PostgreSQL database dump complete
--

