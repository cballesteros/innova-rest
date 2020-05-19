--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-19 15:48:19

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
-- TOC entry 205 (class 1259 OID 32797)
-- Name: OVAS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OVAS" (
    "OVA_ID" integer NOT NULL,
    "TITLE" text,
    "SUBJECT" text,
    "DESCRIPTION" text,
    "CREATOR" character varying,
    "PUBLISHER" character varying,
    "CONTRIBUTOR" character varying,
    "DATE" date,
    "TYPE" character varying,
    "FORMAT" character varying,
    "IDENTIFIER" text,
    "LANGUAGE" character varying,
    "ALTERNATIVE" character varying,
    "EDUCATION_LEVEL" character varying,
    "RIGHTS" text,
    "RIGHTS_HOLDER" text
);

--
-- TOC entry 204 (class 1259 OID 32795)
-- Name: OVAS_OVA_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OVAS_OVA_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 2836 (class 0 OID 0)
-- Dependencies: 204
-- Name: OVAS_OVA_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OVAS_OVA_ID_seq" OWNED BY public."OVAS"."OVA_ID";


--
-- TOC entry 202 (class 1259 OID 16402)
-- Name: USERS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."USERS" (
    "NAME" character varying NOT NULL,
    "LAST_NAME" character varying NOT NULL,
    "PASSWORD" character varying NOT NULL,
    "USER_DNI" text,
    "USER_ID" integer NOT NULL
);

--
-- TOC entry 203 (class 1259 OID 32784)
-- Name: USERS_USER_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."USERS_USER_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 203
-- Name: USERS_USER_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."USERS_USER_ID_seq" OWNED BY public."USERS"."USER_ID";


--
-- TOC entry 2696 (class 2604 OID 32800)
-- Name: OVAS OVA_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OVAS" ALTER COLUMN "OVA_ID" SET DEFAULT nextval('public."OVAS_OVA_ID_seq"'::regclass);


--
-- TOC entry 2695 (class 2604 OID 32786)
-- Name: USERS USER_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."USERS" ALTER COLUMN "USER_ID" SET DEFAULT nextval('public."USERS_USER_ID_seq"'::regclass);


--
-- TOC entry 2830 (class 0 OID 32797)
-- Dependencies: 205
-- Data for Name: OVAS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OVAS" ("OVA_ID", "TITLE", "SUBJECT", "DESCRIPTION", "CREATOR", "PUBLISHER", "CONTRIBUTOR", "DATE", "TYPE", "FORMAT", "IDENTIFIER", "LANGUAGE", "ALTERNATIVE", "EDUCATION_LEVEL", "RIGHTS", "RIGHTS_HOLDER") FROM stdin;
1	¿DÓNDE SE ENCUENTRA MI CENTRO DE MASA?	¿DÓNDE SE ENCUENTRA MI CENTRO DE MASA?	¿DÓNDE SE ENCUENTRA MI CENTRO DE MASA?	Juan Francisco Díaz Frias	Univalle	Daniela Palomino Soto	2015-03-30	HTML	HTML	http://objetos.ciersur.co/LO/S_G10_U01_L06/S_G10_U01_L06/index.html	SPANISH	¿DÓNDE SE ENCUENTRA MI CENTRO DE MASA?	MEDIUM	Ministerio de Educación Nacional	Ministerio de Educación Nacional
\.


--
-- TOC entry 2827 (class 0 OID 16402)
-- Dependencies: 202
-- Data for Name: USERS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."USERS" ("NAME", "LAST_NAME", "PASSWORD", "USER_DNI", "USER_ID") FROM stdin;
Amanda	Ballesteros	254285061	25428506	1
Cristian	Ballesteros	25428506	1144060456	2
\.


--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 204
-- Name: OVAS_OVA_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OVAS_OVA_ID_seq"', 1, true);


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 203
-- Name: USERS_USER_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."USERS_USER_ID_seq"', 2, true);


--
-- TOC entry 2700 (class 2606 OID 32805)
-- Name: OVAS OVAS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OVAS"
    ADD CONSTRAINT "OVAS_pkey" PRIMARY KEY ("OVA_ID");


--
-- TOC entry 2698 (class 2606 OID 32794)
-- Name: USERS USERS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."USERS"
    ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_ID");


-- Completed on 2020-05-19 15:48:20

--
-- PostgreSQL database dump complete
--

