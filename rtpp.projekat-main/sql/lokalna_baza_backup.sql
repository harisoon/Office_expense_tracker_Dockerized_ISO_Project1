--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Debian 16.9-1.pgdg120+1)
-- Dumped by pg_dump version 17.4

-- Started on 2025-06-09 12:50:43

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

--
-- TOC entry 862 (class 1247 OID 18436)
-- Name: roles; Type: TYPE; Schema: public; Owner: expense_user
--

CREATE TYPE public.roles AS ENUM (
    'admin',
    'employee'
);


ALTER TYPE public.roles OWNER TO expense_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 18457)
-- Name: blacklisttokens; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public.blacklisttokens (
    id integer NOT NULL,
    token character varying(200) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.blacklisttokens OWNER TO expense_user;

--
-- TOC entry 218 (class 1259 OID 18456)
-- Name: blacklisttokens_id_seq; Type: SEQUENCE; Schema: public; Owner: expense_user
--

CREATE SEQUENCE public.blacklisttokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blacklisttokens_id_seq OWNER TO expense_user;

--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 218
-- Name: blacklisttokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expense_user
--

ALTER SEQUENCE public.blacklisttokens_id_seq OWNED BY public.blacklisttokens.id;


--
-- TOC entry 221 (class 1259 OID 18468)
-- Name: budget; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public.budget (
    id integer NOT NULL,
    total_budget double precision NOT NULL,
    spent_budget double precision NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.budget OWNER TO expense_user;

--
-- TOC entry 220 (class 1259 OID 18467)
-- Name: budget_id_seq; Type: SEQUENCE; Schema: public; Owner: expense_user
--

CREATE SEQUENCE public.budget_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.budget_id_seq OWNER TO expense_user;

--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 220
-- Name: budget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expense_user
--

ALTER SEQUENCE public.budget_id_seq OWNED BY public.budget.id;


--
-- TOC entry 223 (class 1259 OID 18477)
-- Name: category; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    enabled boolean NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.category OWNER TO expense_user;

--
-- TOC entry 222 (class 1259 OID 18476)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: expense_user
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO expense_user;

--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 222
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expense_user
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 229 (class 1259 OID 18520)
-- Name: categorybudget; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public.categorybudget (
    id integer NOT NULL,
    category_id integer,
    budget_id integer,
    total_value double precision NOT NULL,
    spent_value double precision NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.categorybudget OWNER TO expense_user;

--
-- TOC entry 228 (class 1259 OID 18519)
-- Name: categorybudget_id_seq; Type: SEQUENCE; Schema: public; Owner: expense_user
--

CREATE SEQUENCE public.categorybudget_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorybudget_id_seq OWNER TO expense_user;

--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 228
-- Name: categorybudget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expense_user
--

ALTER SEQUENCE public.categorybudget_id_seq OWNED BY public.categorybudget.id;


--
-- TOC entry 231 (class 1259 OID 18539)
-- Name: invoice; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public.invoice (
    id integer NOT NULL,
    firm_name character varying(100),
    invoice_number character varying(64),
    fiscal_number character varying(64),
    order_number character varying(64),
    date date DEFAULT CURRENT_DATE,
    date_issue date,
    date_delivery date,
    due_date date,
    place_issue character varying(100),
    payment_method character varying(50),
    reference character varying(100),
    quantity integer DEFAULT 0,
    vat_number character varying(32),
    account_number character varying(64),
    iban character varying(64),
    bank_name character varying(64),
    unit_price double precision DEFAULT 0,
    vat_rate double precision DEFAULT 0,
    total_excl_vat double precision DEFAULT 0,
    vat_amount double precision DEFAULT 0,
    total_incl_vat double precision DEFAULT 0,
    photo_filename character varying(256),
    vendor_id integer,
    category_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.invoice OWNER TO expense_user;

--
-- TOC entry 230 (class 1259 OID 18538)
-- Name: invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: expense_user
--

CREATE SEQUENCE public.invoice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoice_id_seq OWNER TO expense_user;

--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 230
-- Name: invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expense_user
--

ALTER SEQUENCE public.invoice_id_seq OWNED BY public.invoice.id;


--
-- TOC entry 233 (class 1259 OID 18556)
-- Name: invoice_items; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public.invoice_items (
    id integer NOT NULL,
    invoice_id integer,
    product_id integer,
    quantity integer NOT NULL,
    unit_price_excl_vat double precision NOT NULL,
    unit_price_incl_vat double precision NOT NULL,
    total_excl_vat double precision NOT NULL,
    total_incl_vat double precision NOT NULL,
    discount double precision NOT NULL,
    vat_rate double precision NOT NULL,
    vat_amount double precision NOT NULL,
    product_code character varying,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.invoice_items OWNER TO expense_user;

--
-- TOC entry 232 (class 1259 OID 18555)
-- Name: invoice_items_id_seq; Type: SEQUENCE; Schema: public; Owner: expense_user
--

CREATE SEQUENCE public.invoice_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoice_items_id_seq OWNER TO expense_user;

--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 232
-- Name: invoice_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expense_user
--

ALTER SEQUENCE public.invoice_items_id_seq OWNED BY public.invoice_items.id;


--
-- TOC entry 234 (class 1259 OID 18576)
-- Name: invoice_product; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public.invoice_product (
    invoice_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.invoice_product OWNER TO expense_user;

--
-- TOC entry 215 (class 1259 OID 18428)
-- Name: measuringUnits; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public."measuringUnits" (
    id character varying(20) NOT NULL,
    measuring_unit character varying(15) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."measuringUnits" OWNER TO expense_user;

--
-- TOC entry 225 (class 1259 OID 18488)
-- Name: products; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public.products (
    id integer NOT NULL,
    item_name character varying(100) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    measuring_units_id character varying(20) NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.products OWNER TO expense_user;

--
-- TOC entry 224 (class 1259 OID 18487)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: expense_user
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO expense_user;

--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 224
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expense_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 217 (class 1259 OID 18442)
-- Name: users; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    email character varying(120) NOT NULL,
    password character varying(256) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    reset_password_link character varying NOT NULL,
    role public.roles NOT NULL,
    must_change_pwd boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO expense_user;

--
-- TOC entry 216 (class 1259 OID 18441)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: expense_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO expense_user;

--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expense_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 227 (class 1259 OID 18507)
-- Name: vendor; Type: TABLE; Schema: public; Owner: expense_user
--

CREATE TABLE public.vendor (
    id integer NOT NULL,
    vendor_name character varying(100) NOT NULL,
    vat_number character varying(20) NOT NULL,
    account_number character varying(50) NOT NULL,
    bank character varying(100) NOT NULL,
    adress character varying(200) NOT NULL,
    "vendorCity" character varying(50) NOT NULL,
    "vendorTelephone" character varying(20) NOT NULL,
    "vendorEmail" character varying(100) NOT NULL,
    "vendorTransact" character varying(100) NOT NULL,
    "supportsAvans" boolean NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.vendor OWNER TO expense_user;

--
-- TOC entry 226 (class 1259 OID 18506)
-- Name: vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: expense_user
--

CREATE SEQUENCE public.vendor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_id_seq OWNER TO expense_user;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 226
-- Name: vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: expense_user
--

ALTER SEQUENCE public.vendor_id_seq OWNED BY public.vendor.id;


--
-- TOC entry 3259 (class 2604 OID 18460)
-- Name: blacklisttokens id; Type: DEFAULT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.blacklisttokens ALTER COLUMN id SET DEFAULT nextval('public.blacklisttokens_id_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 18471)
-- Name: budget id; Type: DEFAULT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.budget ALTER COLUMN id SET DEFAULT nextval('public.budget_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 18480)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 18523)
-- Name: categorybudget id; Type: DEFAULT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.categorybudget ALTER COLUMN id SET DEFAULT nextval('public.categorybudget_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 18542)
-- Name: invoice id; Type: DEFAULT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.invoice ALTER COLUMN id SET DEFAULT nextval('public.invoice_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 18559)
-- Name: invoice_items id; Type: DEFAULT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.invoice_items ALTER COLUMN id SET DEFAULT nextval('public.invoice_items_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 18491)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 18445)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 18510)
-- Name: vendor id; Type: DEFAULT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.vendor ALTER COLUMN id SET DEFAULT nextval('public.vendor_id_seq'::regclass);


--
-- TOC entry 3472 (class 0 OID 18457)
-- Dependencies: 219
-- Data for Name: blacklisttokens; Type: TABLE DATA; Schema: public; Owner: expense_user
--

COPY public.blacklisttokens (id, token, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3474 (class 0 OID 18468)
-- Dependencies: 221
-- Data for Name: budget; Type: TABLE DATA; Schema: public; Owner: expense_user
--

COPY public.budget (id, total_budget, spent_budget, year, month, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3476 (class 0 OID 18477)
-- Dependencies: 223
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: expense_user
--

COPY public.category (id, name, enabled, "createdAt", "updatedAt") FROM stdin;
9	Sredstva za čišćenje	t	2025-05-28 00:43:38.370117	2025-05-28 00:43:38.370117
10	Ostalo	t	2025-05-28 00:43:38.370117	2025-05-28 00:43:38.370117
20	Knjige	t	2025-05-28 17:57:04.234781	2025-05-28 17:57:04.234781
\.


--
-- TOC entry 3482 (class 0 OID 18520)
-- Dependencies: 229
-- Data for Name: categorybudget; Type: TABLE DATA; Schema: public; Owner: expense_user
--

COPY public.categorybudget (id, category_id, budget_id, total_value, spent_value, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3484 (class 0 OID 18539)
-- Dependencies: 231
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: expense_user
--

COPY public.invoice (id, firm_name, date, quantity, vat_number, account_number, iban, bank_name, unit_price, vat_rate, total_excl_vat, vat_amount, total_incl_vat, photo_filename, vendor_id, created_at, "updatedAt") FROM stdin;
\.


--
-- TOC entry 3486 (class 0 OID 18556)
-- Dependencies: 233
-- Data for Name: invoice_items; Type: TABLE DATA; Schema: public; Owner: expense_user
--

COPY public.invoice_items (id, invoice_id, product_id, quantity, unit_price_excl_vat, unit_price_incl_vat, total_excl_vat, total_incl_vat, discount, vat_rate, vat_amount, product_code, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3487 (class 0 OID 18576)
-- Dependencies: 234
-- Data for Name: invoice_product; Type: TABLE DATA; Schema: public; Owner: expense_user
--

COPY public.invoice_product (invoice_id, product_id) FROM stdin;
\.


--
-- TOC entry 3468 (class 0 OID 18428)
-- Dependencies: 215
-- Data for Name: measuringUnits; Type: TABLE DATA; Schema: public; Owner: expense_user
--

COPY public."measuringUnits" (id, measuring_unit, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3478 (class 0 OID 18488)
-- Dependencies: 225
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: expense_user
--

COPY public.products (id, item_name, "createdAt", "updatedAt", measuring_units_id, category_id) FROM stdin;
\.


--
-- TOC entry 3470 (class 0 OID 18442)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: expense_user
--

INSERT INTO public.users (id, "firstName", "lastName", email, password, "createdAt", "updatedAt", reset_password_link, role, must_change_pwd) VALUES
(1, 'Mahir', 'Halilović', 'mahir.halilovic1@fet.ba', 'scrypt:32768:8:1$vXvXvXvX$f9e8f7d6c5b4a3210123456789abcdef', NOW(), NOW(), '', 'admin', false),
(3, 'Mujo', 'Alić', 'mujo.alic@fet.ba', 'scrypt:32768:8:1$vXvXvXvX$f9e8f7d6c5b4a3210123456789abcdef', NOW(), NOW(), '', 'admin', false),
(19, 'Haris', 'Vikalo', 'haris.vikalo@fet.ba', 'scrypt:32768:8:1$vXvXvXvX$f9e8f7d6c5b4a3210123456789abcdef', NOW(), NOW(), '', 'admin', false);


--
-- TOC entry 3480 (class 0 OID 18507)
-- Dependencies: 227
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: expense_user
--

COPY public.vendor (id, vendor_name, vat_number, account_number, bank, adress, "vendorCity", "vendorTelephone", "vendorEmail", "vendorTransact", "supportsAvans", "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 218
-- Name: blacklisttokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expense_user
--

SELECT pg_catalog.setval('public.blacklisttokens_id_seq', 1, false);


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 220
-- Name: budget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expense_user
--

SELECT pg_catalog.setval('public.budget_id_seq', 1, false);


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 222
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expense_user
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 228
-- Name: categorybudget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expense_user
--

SELECT pg_catalog.setval('public.categorybudget_id_seq', 1, false);


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 230
-- Name: invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expense_user
--

SELECT pg_catalog.setval('public.invoice_id_seq', 1, false);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 232
-- Name: invoice_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expense_user
--

SELECT pg_catalog.setval('public.invoice_items_id_seq', 1, false);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 224
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expense_user
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expense_user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 226
-- Name: vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: expense_user
--

SELECT pg_catalog.setval('public.vendor_id_seq', 1, false);


--
-- TOC entry 3293 (class 2606 OID 18464)
-- Name: blacklisttokens blacklisttokens_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.blacklisttokens
    ADD CONSTRAINT blacklisttokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 18466)
-- Name: blacklisttokens blacklisttokens_token_key; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.blacklisttokens
    ADD CONSTRAINT blacklisttokens_token_key UNIQUE (token);


--
-- TOC entry 3297 (class 2606 OID 18475)
-- Name: budget budget_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.budget
    ADD CONSTRAINT budget_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 18486)
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- TOC entry 3301 (class 2606 OID 18484)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 18527)
-- Name: categorybudget categorybudget_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.categorybudget
    ADD CONSTRAINT categorybudget_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 18565)
-- Name: invoice_items invoice_items_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT invoice_items_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 18549)
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- TOC entry 3315 (class 2606 OID 18580)
-- Name: invoice_product invoice_product_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.invoice_product
    ADD CONSTRAINT invoice_product_pkey PRIMARY KEY (invoice_id, product_id);


--
-- TOC entry 3285 (class 2606 OID 18434)
-- Name: measuringUnits measuringUnits_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public."measuringUnits"
    ADD CONSTRAINT "measuringUnits_pkey" PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 18495)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 18453)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3289 (class 2606 OID 18455)
-- Name: users users_password_key; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_password_key UNIQUE (password);


--
-- TOC entry 3291 (class 2606 OID 18451)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 18516)
-- Name: vendor vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 18518)
-- Name: vendor vendor_vat_number_key; Type: CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT vendor_vat_number_key UNIQUE (vat_number);


--
-- TOC entry 3318 (class 2606 OID 18533)
-- Name: categorybudget categorybudget_budget_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.categorybudget
    ADD CONSTRAINT categorybudget_budget_id_fkey FOREIGN KEY (budget_id) REFERENCES public.budget(id);


--
-- TOC entry 3319 (class 2606 OID 18528)
-- Name: categorybudget categorybudget_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.categorybudget
    ADD CONSTRAINT categorybudget_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3321 (class 2606 OID 18566)
-- Name: invoice_items invoice_items_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT invoice_items_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoice(id);


--
-- TOC entry 3322 (class 2606 OID 18571)
-- Name: invoice_items invoice_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT invoice_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3323 (class 2606 OID 18581)
-- Name: invoice_product invoice_product_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.invoice_product
    ADD CONSTRAINT invoice_product_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoice(id);


--
-- TOC entry 3324 (class 2606 OID 18586)
-- Name: invoice_product invoice_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.invoice_product
    ADD CONSTRAINT invoice_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 3320 (class 2606 OID 18550)
-- Name: invoice invoice_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendor(id);


--
-- TOC entry 3316 (class 2606 OID 18501)
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3317 (class 2606 OID 18496)
-- Name: products products_measuring_units_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: expense_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_measuring_units_id_fkey FOREIGN KEY (measuring_units_id) REFERENCES public."measuringUnits"(id);

CREATE TABLE public.category_budgets (
    id SERIAL PRIMARY KEY,
    category_id integer REFERENCES public.category(id),
    total_value double precision NOT NULL,
    spent_value double precision NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    recurring boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE public.category_budgets OWNER TO expense_user;
-- Completed on 2025-06-09 12:50:49

--
-- PostgreSQL database dump complete
--

