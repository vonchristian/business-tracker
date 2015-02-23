--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    trackable_id integer,
    trackable_type character varying,
    owner_id integer,
    owner_type character varying,
    key character varying,
    parameters text,
    recipient_id integer,
    recipient_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: businesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE businesses (
    id integer NOT NULL,
    taxpayer_id integer,
    status integer,
    asset_size numeric,
    enterprise_scale integer,
    type_of_organization integer,
    address_sitio character varying,
    address_street character varying,
    address_barangay character varying,
    address_municipality character varying,
    address_province character varying,
    application_date date,
    dti_sec_reg_no integer,
    dti_sec_reg_date date,
    president_first_name character varying,
    president_middle_name character varying,
    president_last_name character varying,
    business_name character varying,
    "position" character varying,
    no_of_employees integer,
    business_area integer,
    first_name_lessor character varying,
    middle_name_lessor character varying,
    last_name_lessor character varying,
    monthly_rental integer,
    permit_number character varying,
    gross_sales numeric,
    industry_type integer,
    business_type integer,
    capital numeric,
    capital_tax numeric,
    bir_registered boolean,
    police_clearance_cleared boolean,
    sanitary_inspection_cleared boolean,
    health_certificate_cleared boolean,
    logo_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE businesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE businesses_id_seq OWNED BY businesses.id;


--
-- Name: gross_sales_taxes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE gross_sales_taxes (
    id integer NOT NULL,
    amount numeric,
    business_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: gross_sales_taxes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gross_sales_taxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gross_sales_taxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE gross_sales_taxes_id_seq OWNED BY gross_sales_taxes.id;


--
-- Name: line_of_businesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE line_of_businesses (
    id integer NOT NULL,
    business_id integer,
    description character varying,
    psic_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: line_of_businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE line_of_businesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: line_of_businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE line_of_businesses_id_seq OWNED BY line_of_businesses.id;


--
-- Name: mayors_permit_fees; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mayors_permit_fees (
    id integer NOT NULL,
    amount numeric,
    business_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: mayors_permit_fees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mayors_permit_fees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mayors_permit_fees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mayors_permit_fees_id_seq OWNED BY mayors_permit_fees.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE payments (
    id integer NOT NULL,
    amount numeric,
    business_id integer,
    status integer,
    official_receipt_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    collecting_officer character varying
);


--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE payments_id_seq OWNED BY payments.id;


--
-- Name: pg_search_documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pg_search_documents (
    id integer NOT NULL,
    content text,
    searchable_id integer,
    searchable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pg_search_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pg_search_documents_id_seq OWNED BY pg_search_documents.id;


--
-- Name: police_clearances; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE police_clearances (
    id integer NOT NULL,
    other_identification_marks text,
    remarks text,
    purpose character varying,
    build character varying,
    height character varying,
    weight character varying,
    taxpayer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: police_clearances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE police_clearances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: police_clearances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE police_clearances_id_seq OWNED BY police_clearances.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: taxpayers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taxpayers (
    id integer NOT NULL,
    first_name character varying,
    middle_name character varying,
    last_name character varying,
    suffix character varying,
    civil_status character varying,
    date_of_birth date,
    place_of_birth character varying,
    occupation character varying,
    gender character varying,
    profile_image_id character varying,
    email character varying,
    mobile_number character varying,
    tin_number character varying,
    cedula_number character varying,
    address_sitio character varying,
    address_street character varying,
    address_barangay character varying,
    address_subdivision character varying,
    address_municipality character varying,
    address_province character varying,
    cedula_place_issued character varying,
    cedula_date_issued date,
    status integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying,
    photo_content_type character varying,
    photo_file_size integer,
    photo_updated_at timestamp without time zone
);


--
-- Name: taxpayers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taxpayers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taxpayers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taxpayers_id_seq OWNED BY taxpayers.id;


--
-- Name: type_of_organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE type_of_organizations (
    id integer NOT NULL,
    business_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: type_of_organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE type_of_organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: type_of_organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE type_of_organizations_id_seq OWNED BY type_of_organizations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    mobile_number character varying,
    profile_image_id character varying,
    role integer,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY businesses ALTER COLUMN id SET DEFAULT nextval('businesses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY gross_sales_taxes ALTER COLUMN id SET DEFAULT nextval('gross_sales_taxes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY line_of_businesses ALTER COLUMN id SET DEFAULT nextval('line_of_businesses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mayors_permit_fees ALTER COLUMN id SET DEFAULT nextval('mayors_permit_fees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY payments ALTER COLUMN id SET DEFAULT nextval('payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pg_search_documents ALTER COLUMN id SET DEFAULT nextval('pg_search_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY police_clearances ALTER COLUMN id SET DEFAULT nextval('police_clearances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taxpayers ALTER COLUMN id SET DEFAULT nextval('taxpayers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_of_organizations ALTER COLUMN id SET DEFAULT nextval('type_of_organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY activities (id, trackable_id, trackable_type, owner_id, owner_type, key, parameters, recipient_id, recipient_type, created_at, updated_at) FROM stdin;
1	291	Business	1	User	business.create	\N	\N	\N	2015-02-16 03:56:56.41533	2015-02-16 03:56:56.41533
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('activities_id_seq', 1, true);


--
-- Data for Name: businesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY businesses (id, taxpayer_id, status, asset_size, enterprise_scale, type_of_organization, address_sitio, address_street, address_barangay, address_municipality, address_province, application_date, dti_sec_reg_no, dti_sec_reg_date, president_first_name, president_middle_name, president_last_name, business_name, "position", no_of_employees, business_area, first_name_lessor, middle_name_lessor, last_name_lessor, monthly_rental, permit_number, gross_sales, industry_type, business_type, capital, capital_tax, bir_registered, police_clearance_cleared, sanitary_inspection_cleared, health_certificate_cleared, logo_id, created_at, updated_at) FROM stdin;
18	17	1	0.0	0	0	Tabangawen	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Abluyan Store	\N	1	\N	\N	\N	\N	\N	18	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 02:34:01.607572	2015-01-27 02:34:19.877878
16	16	1	0.0	0	3	Bagaen	\N	Danggo	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Danggo Women's Organization	\N	74	\N	\N	\N	\N	\N	16	\N	6	8	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 02:23:12.872677	2015-01-27 02:35:01.450875
75	69	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jumong's Food Hauz	\N	1	\N	\N	\N	\N	\N	75	9000.0	3	8	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 03:09:16.797575	2015-02-09 05:26:38.967591
71	66	1	150001.0	1	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	3S JF Store (Tupaan Branch)	\N	1	\N	\N	\N	\N	\N	71	\N	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 02:52:38.30284	2015-02-09 05:32:58.580387
1	1	1	0.0	0	0	Tupaan	Tupa-an	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Appay's Tailoring	\N	1	\N	\N	\N	\N	\N	1	36000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-26 04:24:58.088207	2015-02-09 05:26:14.491075
73	67	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Joseph & Agustina Cahlangan's Store	\N	1	\N	\N	\N	\N	\N	73	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 02:58:00.518803	2015-02-09 05:29:22.82667
20	18	1	0.0	0	0	Tawang	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Mariano's Store	\N	1	\N	\N	\N	\N	\N	20	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 02:44:18.46573	2015-01-27 02:47:24.782718
10	9	1	0.0	0	0	Pantal	Pantal	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	TLPJ Hardware and General Merchandise	\N	1	\N	\N	\N	\N	\N	10	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-26 07:45:27.262064	2015-02-09 05:38:51.492138
21	19	1	0.0	0	0	Bahal	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Viola's Store	\N	1	\N	\N	\N	\N	\N	21	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 02:57:43.322998	2015-01-27 02:57:57.048026
65	62	1	0.0	0	0	Ababba	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Marciana's Enterprises	\N	1	\N	\N	\N	\N	\N	65	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 02:23:54.524573	2015-02-09 05:36:54.535613
3	2	1	160000.0	1	0	\N	Tupa-an	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lito's General Merchandise (Branch)	\N	1	\N	\N	\N	\N	\N	3	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-26 05:04:06.695532	2015-01-26 05:05:07.12161
2	2	1	0.0	0	0	\N	Pantal	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lito's General Merchandise (Main)	\N	1	\N	\N	\N	\N	\N	2	90000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-26 04:40:55.381196	2015-01-26 05:31:35.21038
8	7	1	0.0	0	0	\N	Tupaan	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Cayat Pharmacy	\N	1	\N	\N	\N	\N	\N	8	180000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-26 07:06:49.379832	2015-01-26 07:08:13.649371
9	8	1	0.0	0	0	\N	Huhlucan	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Damullog Sari Sari Store	\N	1	\N	\N	\N	\N	\N	9	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-26 07:34:12.699944	2015-01-26 07:34:26.624144
6	5	1	0.0	0	0	Tabuyan		Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Yanky's Sari Sari Store	\N	1	\N	\N	\N	\N	\N	6	54000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-26 06:24:13.297298	2015-01-28 02:25:55.606874
25	24	1	0.0	0	0	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Cayat Phamacy	\N	1	\N	\N	\N	\N	\N	25	180000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 03:58:50.383951	2015-01-27 03:59:32.514672
5	4	1	0.0	0	0	\N		Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Kolba's Meat Booth	\N	1	\N	\N	\N	\N	\N	5	36000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-26 05:43:27.006815	2015-01-26 05:44:12.717023
27	25	1	0.0	0	0	Tupa-an	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Sinak-ey General Merchandise	\N	1	\N	\N	\N	\N	\N	27	36000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-27 05:52:37.371169	2015-02-09 05:40:27.597991
79	73	1	0.0	0	0	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Morning Sun Bakery	\N	1	\N	\N	\N	\N	\N	79	48000.0	6	4	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 05:05:02.101977	2015-02-09 05:30:08.699101
11	10	1	0.0	0	0	\N		Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	J2KF Store and Catering Services	\N	1	\N	\N	\N	\N	\N	11	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-26 08:22:35.613302	2015-01-26 08:23:24.806726
63	61	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Ken-Ken Sari Sari Store	\N	1	\N	\N	\N	\N	\N	63	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 02:14:56.705025	2015-01-28 02:15:24.088921
12	11	1	0.0	0	0	\N		Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	R-LAN Store	\N	1	\N	\N	\N	\N	\N	12	36000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-26 08:50:57.851447	2015-01-26 08:51:26.967533
15	15	1	16000000.0	3	0	Abat	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	JRD Construction and Supply	\N	1	\N	\N	\N	\N	\N	15	5000.0	3	6	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 01:00:01.57769	2015-01-29 01:26:04.15878
69	66	1	0.0	0	0	Kumelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	3S JF Store(Kumelbeng Branch)	\N	1	\N	\N	\N	\N	\N	69	\N	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 02:44:41.319774	2015-02-09 05:32:24.039532
22	20	1	0.0	0	0	Higib	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Two Brother's Store	\N	1	\N	\N	\N	\N	\N	22	77500.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 03:12:20.911238	2015-01-27 03:14:17.357882
26	23	1	0.0	0	0	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	CMD Sari Sari Store	\N	1	\N	\N	\N	\N	\N	26	54000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 04:02:11.907706	2015-01-27 04:02:59.07044
23	21	1	0.0	0	0	Amuweg	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Zeny's Store	\N	1	\N	\N	\N	\N	\N	23	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 03:18:29.112382	2015-01-27 03:18:46.487418
17	16	1	0.0	0	3	Bagaen	\N	Danggo	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Danggo Women Sari Sari Store	\N	1	\N	\N	\N	\N	\N	17	36000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 02:30:09.008584	2015-01-27 02:30:38.948109
74	68	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Vanj Xerox and Computer Works	\N	1	\N	\N	\N	\N	\N	74	0.0	3	8	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 03:02:26.702871	2015-02-09 05:42:55.203233
24	22	1	150001.0	1	0	Tabangawen	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Patnaan's Store	\N	1	\N	\N	\N	\N	\N	24	100000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 03:22:43.654447	2015-01-27 03:23:25.024692
64	7	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	N and E Store	\N	1	\N	\N	\N	\N	\N	64	36000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 02:17:13.521077	2015-01-28 02:17:29.253262
66	63	1	0.0	0	0	Ababba	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Melba's Construction and Aggregates	\N	1	\N	\N	\N	\N	\N	66	\N	6	1	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 02:28:35.27494	2015-02-09 05:42:25.653466
14	13	1	150001.0	1	0	Kamelbeng		Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	4J's Store and Family Lodge	\N	1	\N	\N	\N	\N	\N	14	77500.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-26 09:21:27.272483	2015-02-09 05:36:17.144057
60	58	1	0.0	0	0	Tabuyan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Ikalahan Store	\N	1	\N	\N	\N	\N	\N	60	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-27 07:07:42.564527	2015-01-27 07:08:06.290295
70	66	1	150001.0	1	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	3S JF Store (Main)	\N	1	\N	\N	\N	\N	\N	70	132500.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 02:47:21.840231	2015-02-09 05:33:09.075788
67	64	1	0.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Family Store	\N	1	\N	\N	\N	\N	\N	67	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 02:32:50.32681	2015-01-28 02:33:02.18892
62	60	1	0.0	0	0	Abat	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Stephen's Store	\N	1	\N	\N	\N	\N	\N	63	36000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 02:12:05.267882	2015-02-09 05:35:16.250693
68	65	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Mlyn's Eatery	\N	1	\N	\N	\N	\N	\N	68	\N	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 02:41:34.915065	2015-01-28 02:41:55.630949
4	3	1	0.0	0	0	Tabuyan	Poblacion	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Ger-Son Store	\N	1	\N	\N	\N	\N	\N	4	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-26 05:37:19.227361	2015-02-09 05:29:55.469297
81	2	1	1500000.0	1	1	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tinoc-Bambang Via Lagawe and Tinoc-Abatan Van Operators & Drivers Association	\N	11	\N	\N	\N	\N	\N	81	\N	6	8	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 05:22:56.785396	2015-02-09 08:52:33.886641
7	6	1	0.0	0	0	Kamelbeng		Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	LLB Store and Sari Sari Store	\N	1	\N	\N	\N	\N	\N	7	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-26 06:45:11.095479	2015-02-09 05:27:22.486362
76	70	1	0.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	HRB Store	\N	1	\N	\N	\N	\N	\N	76	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 03:38:43.503178	2015-01-28 03:58:09.169468
77	71	1	150001.0	1	0	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Fely's Store	\N	1	\N	\N	\N	\N	\N	77	54000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 04:54:21.915632	2015-01-28 04:55:09.882793
78	72	1	0.0	0	0	Amueg	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Family Store	\N	1	\N	\N	\N	\N	\N	78	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 04:58:46.240761	2015-01-28 04:58:54.662477
13	12	1	0.0	0	0	Tupaan		Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Dugyon's Store	\N	1	\N	\N	\N	\N	\N	13	100000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-26 08:56:59.032767	2015-02-09 05:32:08.745403
80	74	1	150001.0	1	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lacbongan's Dry Goods	\N	1	\N	\N	\N	\N	\N	80	0.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 05:18:23.335668	2015-01-28 05:19:45.818889
61	59	1	0.0	0	0	Pamulubulan	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Esberta's Sari Sari Store	\N	1	\N	\N	\N	\N	\N	61	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 00:48:09.222292	2015-01-28 06:17:09.117467
104	97	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Susan Diwag Sari Sari Store	\N	1	\N	\N	\N	\N	\N	104	30000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-29 00:43:53.425683	2015-02-09 05:31:24.435778
82	75	1	0.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Benilda's Store	\N	1	\N	\N	\N	\N	\N	82	54000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 05:29:25.521863	2015-01-28 05:33:00.079041
83	76	1	0.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Yolly's Store	\N	1	\N	\N	\N	\N	\N	83	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 05:52:21.931639	2015-01-28 05:52:32.190376
90	83	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tri-Star Enterprise	\N	1	\N	\N	\N	\N	\N	90	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 06:48:20.695455	2015-02-09 05:41:06.558422
84	77	1	0.0	0	0	Proper	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lino Timbuloy Boarding House	\N	1	\N	\N	\N	\N	\N	84	\N	4	8	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 06:03:45.505285	2015-01-28 06:04:30.001822
85	78	1	0.0	0	0	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Linda's Store	\N	1	\N	\N	\N	\N	\N	85	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 06:21:12.729093	2015-01-28 06:21:52.492934
92	86	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	5 Kids Store	\N	1	\N	\N	\N	\N	\N	92	54000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 06:58:06.518205	2015-01-28 06:58:47.548095
91	84	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	MKS Store	\N	1	\N	\N	\N	\N	\N	91	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 06:50:52.377551	2015-02-09 05:40:48.592563
113	104	1	30000.0	0	0	Ababba	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Nenita's Store	\N	1	\N	\N	\N	\N	\N	113	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 01:17:58.070921	2015-01-29 01:18:35.640969
99	93	1	0.0	0	0	Amueg	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	RDB Sari Sari Store	\N	1	\N	\N	\N	\N	\N	99	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 08:45:14.214584	2015-01-28 08:46:58.326043
122	112	1	30000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	FCF Sari Sari Store	\N	1	\N	\N	\N	\N	\N	122	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-29 03:10:08.703519	2015-02-09 05:35:33.455776
94	88	1	0.0	0	0	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	LBCM Tanawe Variety Store	\N	1	\N	\N	\N	\N	\N	94	54000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 07:16:37.012471	2015-01-28 07:17:06.714455
93	87	1	0.0	0	0	Kamelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Bantag General Merchandise	\N	1	\N	\N	\N	\N	\N	93	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 07:13:58.946453	2015-01-28 07:31:38.847218
98	92	1	0.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	3J'S Northeast Enterprise	\N	1	\N	\N	\N	\N	\N	98	77500.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 08:19:31.591782	2015-02-09 05:30:49.9096
86	79	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Pilley's Store	\N	1	\N	\N	\N	\N	\N	86	36000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 06:24:21.762489	2015-02-09 05:37:12.341229
109	101	1	60000.0	0	0	Tabuyan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	MAJ Yolyses General Merchandise	\N	1	\N	\N	\N	\N	\N	109	54000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 00:59:30.837214	2015-01-29 00:59:47.238283
100	85	1	0.0	0	0	Abat	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	8 Aces Bakeshop	\N	1	\N	\N	\N	\N	\N	100	30000.0	6	4	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 09:06:48.233519	2015-01-28 09:10:09.122319
88	81	1	0.0	0	0	Kamelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	JC CAN Sari Sari Store	\N	1	\N	\N	\N	\N	\N	88	36000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 06:36:06.265851	2015-02-09 05:30:27.995123
89	82	1	150001.0	1	0	Kamelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jims Pension Haus and general merchandise	\N	1	\N	\N	\N	\N	\N	89	\N	6	8	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 06:40:29.203754	2015-01-28 06:45:37.419138
95	89	1	0.0	0	0	Dangla	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Vilma Sari Sari Store	\N	1	\N	\N	\N	\N	\N	95	77500.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 07:35:54.99282	2015-02-09 05:24:50.319905
105	98	1	152000.0	1	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Dun Dun's Store	\N	1	\N	\N	\N	\N	\N	105	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-29 00:46:25.42256	2015-02-09 05:31:45.583214
102	95	1	15000001.0	3	0	Tabuyan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	BHE Enterprise	\N	10	\N	\N	\N	\N	\N	102	600000.0	4	1	0.0	0.0	t	\N	\N	\N	\N	2015-01-29 00:33:48.029554	2015-02-09 05:41:54.834873
96	90	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Gina Mae Store	\N	1	\N	\N	\N	\N	\N	96	36000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-28 07:52:02.184967	2015-01-28 07:55:37.431118
114	105	1	90000.0	0	0	Kamelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Destiny Dry Goods and General Merchandise	\N	1	\N	\N	\N	\N	\N	114	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-29 01:20:28.167195	2015-02-09 05:34:22.388694
130	117	1	60000.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Luciap's Dry Goods and Furnitures	\N	1	\N	\N	\N	\N	\N	130	36000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-29 07:41:00.184948	2015-02-09 05:42:39.437331
101	94	1	0.0	0	0	Kamelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	ITWORX Technology Services	\N	1	\N	\N	\N	\N	\N	101	49000.0	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 00:23:10.334898	2015-01-29 00:26:16.223417
87	80	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Vil Dry Goods	\N	1	\N	\N	\N	\N	\N	87	69000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 06:29:09.436304	2015-02-09 05:34:46.082796
106	99	1	50000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lovely Joy Sari Sari Store	\N	1	\N	\N	\N	\N	\N	106	36000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 00:49:33.950666	2015-01-29 00:49:52.929188
111	102	1	155000.0	1	0	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Impugong Farm Supply	\N	1	\N	\N	\N	\N	\N	111	200000.0	4	4	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 01:03:33.502726	2015-01-29 01:04:31.18547
107	100	1	50000.0	0	0	Tabuyan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	AJJ's Store (Main)	\N	1	\N	\N	\N	\N	\N	107	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 00:55:32.295841	2015-01-29 00:55:46.567004
97	91	1	0.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Gat's Store and Meat Products	\N	1	\N	\N	\N	\N	\N	97	36000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 08:04:10.05201	2015-02-09 05:42:09.141511
108	100	1	50000.0	0	0	Tabuyan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	AJJ's Store (Tabuyan Branch)	\N	1	\N	\N	\N	\N	\N	108	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 00:56:50.657044	2015-01-29 00:57:28.132881
115	106	1	50000.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Gecharube Sari Sari Store	\N	1	\N	\N	\N	\N	\N	115	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 01:28:25.609809	2015-01-29 01:28:41.307675
112	103	1	60000.0	0	0	Kamelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jermth Sari Sari Store 	\N	1	\N	\N	\N	\N	\N	112	54000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 01:07:59.234657	2015-01-29 01:15:48.396984
103	96	1	150001.0	1	0	Tabuyan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jane's Little Store	\N	1	\N	\N	\N	\N	\N	103	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-29 00:37:55.527382	2015-02-09 05:35:54.441988
119	109	1	0.0	0	4	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tinoc Organic Producers Multipurpose Cooperative (TOPMC)	\N	1	\N	\N	\N	\N	\N	119	1.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 02:10:28.301762	2015-02-02 07:03:07.958918
124	2	1	0.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lito's General Merchandise (Tupaan Branch)	\N	1	\N	\N	\N	\N	\N	124	36000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 05:20:01.844473	2015-01-29 05:20:19.106682
123	113	1	50000.0	0	0	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	MJT Sari Sari Store	\N	1	\N	\N	\N	\N	\N	123	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 03:42:31.060608	2015-01-29 03:42:47.432429
125	114	1	50000.0	0	0	Maca-ong	\N	Danggo	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Betoy Kelly Store	\N	1	\N	\N	\N	\N	\N	125	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 06:29:38.417464	2015-01-29 06:31:19.157508
126	115	1	0.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Catherina Store	\N	1	\N	\N	\N	\N	\N	126	54000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 06:43:51.79606	2015-01-29 06:48:03.952589
128	116	1	50000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	WWW Enterprise	\N	1	\N	\N	\N	\N	\N	128	42500.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 07:27:19.260442	2015-01-29 07:28:18.366541
129	116	1	50000.0	0	0	Crossing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	WWW Enterprise(Branch)	\N	1	\N	\N	\N	\N	\N	129	42500.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 07:29:37.95466	2015-01-29 07:29:59.699506
110	102	1	155000.0	1	0	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Impugong Farm Supply	\N	1	\N	\N	\N	\N	\N	110	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 01:03:27.088859	2015-02-03 07:24:45.157374
149	168	1	15000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Venus Store	\N	1	\N	\N	\N	\N	\N	149	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 06:29:32.264577	2015-01-30 06:29:46.719033
131	118	1	100000.0	0	4	Pantal	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tinoc Health Providers Multipurpose Cooperative	\N	1	\N	\N	\N	\N	\N	131	100000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 07:47:35.154784	2015-01-29 07:51:03.96417
141	127	1	20000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Portia Sari Sari Store	\N	1	\N	\N	\N	\N	\N	141	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 01:50:32.681672	2015-01-30 01:50:56.136729
132	119	1	30000.0	0	0	Riverside	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Riverside Sari Sari Store	\N	1	\N	\N	\N	\N	\N	132	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 08:01:58.999517	2015-01-29 08:03:33.563024
133	120	1	30000.0	0	0	Riverside	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	RiverSide Sari Sari Store	\N	1	\N	\N	\N	\N	\N	133	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 08:08:04.047386	2015-01-29 08:08:27.659659
134	121	1	30000.0	0	0	Riverside	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Eliza Sari Sari Store	\N	1	\N	\N	\N	\N	\N	134	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 08:16:27.529175	2015-01-29 08:17:02.477603
142	128	1	30000.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Zabeth Sari Sari Store	\N	1	\N	\N	\N	\N	\N	142	36000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 02:48:26.461036	2015-01-30 02:48:54.141095
181	196	4	15000.0	0	0	Gumhang	\N	Gumhang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Virginia Food Handling	\N	1	\N	\N	\N	\N	\N	181	\N	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:08:59.391443	2015-02-04 01:09:15.577177
143	129	4	15000000.0	2	1	533 Quirino Avenue	\N	Tambo	Paranaque City	Paranaque	\N	\N	\N	\N	\N	\N	Gem AgroLogic, Incorporation	\N	10	\N	\N	\N	\N	\N	143	\N	4	1	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 03:22:04.0879	2015-02-03 07:44:11.106381
121	111	4	0.0	0	0	Danggo	\N	Danggo	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Rhean Joy's Store	\N	1	\N	\N	\N	\N	\N	121	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 02:19:04.37127	2015-02-03 07:44:26.810208
136	123	1	30000.0	0	0	Riverside	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Aguinao's Sari Sari Store	\N	1	\N	\N	\N	\N	\N	136	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 08:24:48.059611	2015-01-29 08:25:11.505144
135	122	1	30000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Antonio Sari Sari Store	\N	1	\N	\N	\N	\N	\N	135	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 08:22:02.05393	2015-01-29 08:27:25.835886
137	124	1	20000.0	0	0	Manaan	\N	Luhong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	CGB Store	\N	1	\N	\N	\N	\N	\N	137	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 08:57:55.471414	2015-01-29 08:58:18.95109
151	133	1	0.0	0	4	Ababba	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Kalanguya Cultural Community Multipurpose Cooperative(Tukucan Branch)	\N	9	\N	\N	\N	\N	\N	151	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 06:41:12.253196	2015-01-30 06:41:26.816269
138	124	1	50000.0	0	3	Manaan	\N	Luhong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Luhong Women's Organization	\N	40	\N	\N	\N	\N	\N	138	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 09:08:49.712134	2015-01-29 09:09:00.299157
155	172	1	80000.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	CLB Dental Clinic	\N	1	\N	\N	\N	\N	\N	155	25000.0	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-02 00:13:42.136311	2015-02-02 00:15:41.01385
152	169	1	15000.0	0	0	Ababba	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Nigel Khaylle Store	\N	1	\N	\N	\N	\N	\N	152	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 07:14:37.649159	2015-01-30 07:14:49.089967
147	134	1	20000.0	0	0	Batwagan	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jane Store	\N	1	\N	\N	\N	\N	\N	147	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 03:48:58.58391	2015-01-30 03:49:28.278019
139	125	1	50000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	ERM Dayao's Store	\N	1	\N	\N	\N	\N	\N	139	14500.0	6	8	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 00:31:47.04742	2015-01-30 00:34:09.60326
140	126	1	30000.0	0	0	Danggo	\N	Danggo	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Two Brothers Sari Sari Store	\N	1	\N	\N	\N	\N	\N	140	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 01:26:46.107931	2015-01-30 01:27:14.208746
153	170	1	50000.0	0	4	Tabuyan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	St. Nino Parish Consumers Cooperative	\N	1	\N	\N	\N	\N	\N	153	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 07:24:13.290979	2015-01-30 07:24:38.932476
146	133	1	1500000.0	1	4	Kamelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Kalanguya Cultural Community Multipurpose Cooperative (Main)	\N	9	\N	\N	\N	\N	\N	146	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 03:41:50.332007	2015-01-30 05:10:25.703993
160	178	1	50000.0	0	0	Brookside	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Zeny Mini Mart	\N	1	\N	\N	\N	\N	\N	160	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-03 01:32:37.73612	2015-02-03 01:33:33.044953
148	135	1	20000.0	0	0	Batwagan	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Josefa Store	\N	1	\N	\N	\N	\N	\N	148	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 06:20:10.229425	2015-01-30 06:20:25.823691
156	173	1	40000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Pauline's Sari Sari Store	\N	1	\N	\N	\N	\N	\N	156	36000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-02-02 00:22:49.944986	2015-02-09 05:35:01.880291
150	133	1	0.0	0	4	Masoyosoy	\N	Mansoyosoy	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Kalanguya Cultural Community Multipurpose Cooperative(Mansoyosoy Branch)	\N	9	\N	\N	\N	\N	\N	150	\N	2	7	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 06:39:07.277379	2015-01-30 08:25:37.42532
157	174	1	30000.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Gayaho Sari Sari Store	\N	1	\N	\N	\N	\N	\N	157	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-02 02:26:01.352452	2015-02-02 02:27:28.219611
165	182	4	20000.0	0	0	Lam-ayan	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Baoy Store	\N	1	\N	\N	\N	\N	\N	165	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:16:38.982283	2015-02-04 00:17:03.07866
163	180	4	20000.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	2014-01-01	\N	\N	\N	\N	\N	Pinkihan's Store	\N	1	\N	\N	\N	\N	\N	163	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:09:08.733066	2015-02-04 00:09:52.475737
154	171	1	40000.0	0	0	Kamelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Bilagot Sari Sari Store	\N	1	\N	\N	\N	\N	\N	154	54000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-30 07:35:06.408706	2015-02-09 05:27:58.738584
161	132	4	50000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Food Supplement (PHP & Empower By Moreishi) + Organic Farm Supply	\N	1	\N	\N	\N	\N	\N	161	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-03 09:13:25.089902	2015-02-03 09:14:06.087668
159	176	1	20000.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jhol Jab Jay Sari Sari Store	\N	1	\N	\N	\N	\N	\N	159	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-02 06:58:34.404447	2015-02-02 06:58:57.70949
120	110	4	50000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Angie's Fastfood	\N	1	\N	\N	\N	\N	\N	120	\N	6	8	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 02:15:31.842168	2015-02-03 07:41:10.321784
116	107	4	0.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	JP Store	\N	1	\N	\N	\N	\N	\N	116	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-29 01:45:07.608833	2015-02-03 07:42:22.523414
145	131	4	200000.0	1	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Leonora Butata Auto Supply and Hardware	\N	1	\N	\N	\N	\N	\N	145	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-01-30 03:33:59.446696	2015-02-03 07:42:49.154975
162	179	4	40000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Johnson's Meat Shop and Sari Sari Store	\N	1	\N	\N	\N	\N	\N	162	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-03 09:16:25.36092	2015-02-03 09:16:43.237118
164	181	4	20000.0	0	0	Lam-ayan	\N	Ahin	Tinoc	Ifugao	2014-01-01	\N	\N	\N	\N	\N	Domingo Store	\N	1	\N	\N	\N	\N	\N	164	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:14:41.168337	2015-02-04 00:14:56.984374
167	184	4	50000.0	0	0	Danggo	\N	Danggo	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Danggo Farmer's Organization	\N	10	\N	\N	\N	\N	\N	167	\N	6	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:25:13.290316	2015-02-04 00:25:26.14574
166	183	4	20000.0	0	0	Tabuyan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Sherwin Selling Tools	\N	1	\N	\N	\N	\N	\N	166	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:21:25.960883	2015-02-04 00:21:42.468188
168	185	4	50000.0	0	1	Luhong	\N	Luhong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Luhong Farmers Organization	\N	10	\N	\N	\N	\N	\N	168	\N	6	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:27:57.734156	2015-02-04 00:28:20.064202
169	186	4	50000.0	0	4	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tinoc Food Terminal	\N	1	\N	\N	\N	\N	\N	169	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:31:22.377629	2015-02-04 00:31:42.814399
170	187	4	50000.0	0	4	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tinoc Community Multi Purpose Cooperative	\N	1	\N	\N	\N	\N	\N	170	\N	6	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:33:59.141924	2015-02-04 00:34:19.340865
171	187	4	50000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tinoc Municipal Employee Credit Cooperative	\N	40	\N	\N	\N	\N	\N	171	\N	2	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:36:39.840338	2015-02-04 00:37:04.987232
172	188	4	30000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tinoc Merchandise	\N	1	\N	\N	\N	\N	\N	172	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:38:48.073426	2015-02-04 00:40:59.705075
174	189	4	20000.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Mucati Store	\N	1	\N	\N	\N	\N	\N	174	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:42:59.879136	2015-02-04 00:44:04.895269
158	175	1	30000.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Baludda's Store	\N	1	\N	\N	\N	\N	\N	158	36000.0	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-02-02 06:05:07.507191	2015-02-09 05:26:54.954573
173	188	4	30000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Mummy's Restaurant and Catering Services	\N	1	\N	\N	\N	\N	\N	173	\N	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:39:40.327207	2015-02-04 00:40:15.617488
175	190	4	15000.0	0	0	Tulludan	\N	Tulludan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Polonio Store	\N	1	\N	\N	\N	\N	\N	175	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:45:36.371234	2015-02-04 00:45:57.654299
190	206	4	15000.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Nancy Store	\N	1	\N	\N	\N	\N	\N	190	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:31:24.121416	2015-02-04 01:31:43.212367
200	217	4	15000.0	0	0	Tulludan	\N	Tulludan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Hector Store	\N	1	\N	\N	\N	\N	\N	200	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:51:11.493317	2015-02-04 01:51:24.265179
176	191	4	30000.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Marlyn Food Handling	\N	1	\N	\N	\N	\N	\N	176	\N	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:52:21.935368	2015-02-04 00:54:58.1371
191	207	4	15000.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jona's Store	\N	1	\N	\N	\N	\N	\N	191	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:33:43.546771	2015-02-04 01:34:00.795212
177	192	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Joan's Store	\N	1	\N	\N	\N	\N	\N	177	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 00:57:22.0887	2015-02-04 00:57:38.479875
178	193	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Georgina Snack Hauz	\N	1	\N	\N	\N	\N	\N	178	\N	6	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:00:00.133429	2015-02-04 01:01:01.277734
192	208	4	15000.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Analiza's Store	\N	1	\N	\N	\N	\N	\N	192	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:35:17.605137	2015-02-04 01:35:30.99412
180	195	4	20000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Agnes Store	\N	1	\N	\N	\N	\N	\N	180	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:06:16.190878	2015-02-04 01:06:43.866554
201	218	4	15000.0	0	0	Mugao	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lyn Store	\N	1	\N	\N	\N	\N	\N	201	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:52:52.641822	2015-02-04 01:53:03.952039
193	209	4	50000.0	0	0	Binablayan	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Toda Welding Shop	\N	1	\N	\N	\N	\N	\N	193	\N	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:37:12.814283	2015-02-04 01:37:25.161042
183	198	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	MJ Store	\N	1	\N	\N	\N	\N	\N	183	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:13:16.566553	2015-02-04 01:13:46.366558
184	199	4	15000.0	0	0	Wangwang	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Gerry Din Sari Sari Store	\N	1	\N	\N	\N	\N	\N	184	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:18:44.595212	2015-02-04 01:18:56.267513
185	201	4	15000.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	DBJ Sari Sari Store	\N	1	\N	\N	\N	\N	\N	185	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:22:26.667492	2015-02-04 01:22:40.561429
194	210	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Ibel-ew's Store	\N	1	\N	\N	\N	\N	\N	194	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:38:49.84528	2015-02-04 01:39:02.992165
186	202	4	15000.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Khayzelle Store	\N	1	\N	\N	\N	\N	\N	186	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:24:06.897884	2015-02-04 01:24:26.920448
179	194	4	50000.0	0	3	Gumhang	\N	Gumhang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Gumhang Farmers Development Association Inc.	\N	10	\N	\N	\N	\N	\N	179	\N	6	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:04:04.473637	2015-02-04 01:39:16.6464
187	203	4	15000.0	0	0	Proper	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lumawig's Sari Sari Store	\N	1	\N	\N	\N	\N	\N	187	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:26:02.38963	2015-02-04 01:26:17.255471
188	204	1	15000.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Paduyao Store	\N	1	\N	\N	\N	\N	\N	188	30000.0	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-04 01:27:49.410943	2015-02-10 06:39:42.575823
202	219	4	15000.0	0	0	Ababba	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Ballagan Store	\N	1	\N	\N	\N	\N	\N	202	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:54:14.492	2015-02-04 01:54:23.279512
196	212	4	15000.0	0	0	Gumhang	\N	Gumhang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jay's Store	\N	1	\N	\N	\N	\N	\N	196	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:42:41.133808	2015-02-04 01:42:53.325961
215	231	4	15000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lindawan's Store	\N	1	\N	\N	\N	\N	\N	215	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:37:12.720947	2015-02-04 02:37:33.878868
197	213	4	15000.0	0	0	Gumhang	\N	Gumhang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Siopao Store	\N	1	\N	\N	\N	\N	\N	197	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:44:11.471543	2015-02-04 01:44:22.85304
203	220	4	20000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Guinsiman Store	\N	1	\N	\N	\N	\N	\N	203	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:55:29.733679	2015-02-04 01:55:39.406998
199	216	4	15000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	LEBB Sari Sari Store	\N	1	\N	\N	\N	\N	\N	199	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:49:33.670014	2015-02-04 01:49:49.458155
208	224	4	15000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Shawn-Dee Sari Sari Store	\N	1	\N	\N	\N	\N	\N	208	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:22:30.407123	2015-02-04 02:22:42.695574
204	220	4	15000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Guinsiman Billiard Hall	\N	1	\N	\N	\N	\N	\N	204	\N	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:56:31.283172	2015-02-04 01:56:41.182039
212	228	4	50000.0	0	0	Tulludan	\N	Tulludan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lhazzlhynne Motorcycle Parts	\N	1	\N	\N	\N	\N	\N	212	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:31:36.866585	2015-02-04 02:31:46.370113
205	221	4	15000.0	0	0	Gumhang	\N	Gumhang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jocelyn Store	\N	1	\N	\N	\N	\N	\N	205	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:57:43.76161	2015-02-04 01:57:54.141314
209	225	4	15000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Mary-An's Sari Sari Store	\N	1	\N	\N	\N	\N	\N	209	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:25:50.354396	2015-02-04 02:26:02.413484
210	226	4	15000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Marieta's Sari Sari Store	\N	1	\N	\N	\N	\N	\N	210	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:27:37.687066	2015-02-04 02:27:46.652515
213	229	4	15000.0	0	0	Tulludan	\N	Tulludan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Feliza's Store	\N	1	\N	\N	\N	\N	\N	213	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:33:27.502266	2015-02-04 02:33:36.009048
211	227	4	15000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Triple 'K' Sari Sari Store	\N	1	\N	\N	\N	\N	\N	211	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:29:48.098347	2015-02-04 02:30:17.939161
214	230	4	15000.0	0	0	Tulludan	\N	Tulludan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	4C.G. Store	\N	1	\N	\N	\N	\N	\N	214	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:35:04.738504	2015-02-04 02:35:14.976324
216	232	4	15000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Nora's Store	\N	1	\N	\N	\N	\N	\N	216	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:38:44.683587	2015-02-04 02:38:52.614154
218	234	4	15000.0	0	0	Tulludan	\N	Tulludan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Sonia's Store	\N	1	\N	\N	\N	\N	\N	218	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:41:34.487354	2015-02-04 02:41:43.156579
217	233	4	15000.0	0	0	Tulludan	\N	Tulludan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jocelyn's Store	\N	1	\N	\N	\N	\N	\N	217	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:40:12.062423	2015-02-04 02:40:21.4292
220	236	4	30000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Kemberta Sari Sari and Tailoring Shop	\N	1	\N	\N	\N	\N	\N	220	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:45:52.697783	2015-02-04 02:46:02.3864
221	237	1	15000.0	0	0	Eheb	\N	Eheb	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Julimar Store	\N	1	\N	\N	\N	\N	\N	221	0.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:47:10.563879	2015-02-04 08:09:22.170945
222	238	4	15000.0	0	0	Eheb	\N	Eheb	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Chrisden Store	\N	1	\N	\N	\N	\N	\N	222	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:49:15.079082	2015-02-04 02:49:23.016214
223	239	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Roel Store	\N	1	\N	\N	\N	\N	\N	223	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:50:38.847313	2015-02-04 02:50:48.063451
224	240	4	15000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Adela's Store	\N	1	\N	\N	\N	\N	\N	224	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:52:35.884697	2015-02-04 02:52:51.822456
225	241	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Nerisa's Store	\N	1	\N	\N	\N	\N	\N	225	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:53:44.244793	2015-02-04 02:54:23.717415
226	242	4	15000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Manuela Store	\N	1	\N	\N	\N	\N	\N	226	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 02:55:37.692339	2015-02-04 02:55:48.43658
227	243	1	15000.0	0	0	Moh-ngol	\N	Eheb	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	9 Clouds Store	\N	1	\N	\N	\N	\N	\N	227	30000.0	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-04 03:00:03.181586	2015-02-11 06:35:38.212067
253	269	4	15000.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Carmen Little Store	\N	1	\N	\N	\N	\N	\N	253	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:38:18.632685	2015-02-04 03:38:26.564592
243	259	4	15000.0	0	0	Eheb	\N	Eheb	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Olivia Little Store	\N	1	\N	\N	\N	\N	\N	243	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:24:28.937586	2015-02-04 03:24:51.068168
230	246	4	15000.0	0	0	Ap-apid	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	CJ Store	\N	1	\N	\N	\N	\N	\N	230	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:06:30.348907	2015-02-04 03:06:38.862364
231	247	4	15000.0	0	0	Ap-apid	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	An-an Store	\N	1	\N	\N	\N	\N	\N	231	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:07:56.05827	2015-02-04 03:08:03.10953
244	260	4	15000.0	0	0	Wangwang	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	LCD Boarding House	\N	1	\N	\N	\N	\N	\N	244	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:25:50.841175	2015-02-04 03:26:00.163592
232	248	4	15000.0	0	0	Ap-apid	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Brens's Store	\N	1	\N	\N	\N	\N	\N	232	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:09:02.925319	2015-02-04 03:09:27.108947
233	249	4	15000.0	0	0	Eheb	\N	Eheb	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	TJ Store	\N	1	\N	\N	\N	\N	\N	233	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:10:32.611395	2015-02-04 03:11:22.491852
234	250	4	15000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Javes Store	\N	1	\N	\N	\N	\N	\N	234	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:12:23.693086	2015-02-04 03:12:34.995112
245	261	4	15000.0	0	0	Ababba	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Philip's Store	\N	1	\N	\N	\N	\N	\N	245	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:27:24.802645	2015-02-04 03:27:32.986497
228	244	4	15000.0	0	0	Kamelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Noleth Barber Shop and Sari Sari Store	\N	1	\N	\N	\N	\N	\N	228	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-04 03:03:22.773449	2015-02-16 05:32:18.670995
198	215	1	30000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Gumangan Sari Sari Store	\N	1	\N	\N	\N	\N	\N	198	30000.0	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-04 01:48:00.540925	2015-02-16 02:25:52.313693
182	197	1	15000.0	0	0	Ababba	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jun Jun Store	\N	1	\N	\N	\N	\N	\N	182	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 01:10:56.482167	2015-02-17 03:07:12.516208
235	251	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	RBC Sari Sari Store	\N	1	\N	\N	\N	\N	\N	235	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:13:44.479219	2015-02-04 03:13:54.530296
256	272	1	15000.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Purita Little Store	\N	1	\N	\N	\N	\N	\N	256	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:42:11.915583	2015-02-09 03:58:41.632865
254	270	4	15000.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Marlyn Store	\N	1	\N	\N	\N	\N	\N	254	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:39:42.250761	2015-02-04 03:39:52.907892
237	253	1	15000.0	0	0	Ap-apid	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Conception's Store	\N	1	\N	\N	\N	\N	\N	237	30000.0	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-04 03:16:39.483216	2015-02-09 06:56:38.265087
246	262	4	50000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	CJ'S Eatery	\N	1	\N	\N	\N	\N	\N	246	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:28:55.495708	2015-02-04 03:29:05.169728
238	254	4	15000.0	0	0	Ap-apid	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Galwan Store	\N	1	\N	\N	\N	\N	\N	238	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:17:49.747149	2015-02-04 03:17:57.71184
239	255	4	15000.0	0	0	Eheb	\N	Eheb	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Junila's Store	\N	1	\N	\N	\N	\N	\N	239	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:18:57.428506	2015-02-04 03:19:05.704333
240	256	4	15000.0	0	0	Wangwang	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Aloysius Store	\N	1	\N	\N	\N	\N	\N	240	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:20:10.050871	2015-02-04 03:20:20.142682
247	263	4	15000.0	0	0	Tawang	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tawang Store	\N	1	\N	\N	\N	\N	\N	247	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:30:11.542723	2015-02-04 03:30:24.136982
241	257	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Agustin's Store	\N	1	\N	\N	\N	\N	\N	241	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:21:41.024852	2015-02-04 03:21:52.165696
248	264	4	15000.0	0	0	Ap-apid	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jenelita's Store	\N	1	\N	\N	\N	\N	\N	248	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:31:40.178974	2015-02-04 03:31:54.432029
257	273	1	15000.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Sabel's Store	\N	1	\N	\N	\N	\N	\N	257	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:43:39.802504	2015-02-09 04:10:00.079258
249	265	1	15000.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	VS Wanhay Store	\N	1	\N	\N	\N	\N	\N	249	36000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:33:40.402579	2015-02-05 03:08:03.66097
250	266	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lariza's Store	\N	1	\N	\N	\N	\N	\N	250	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:34:51.15874	2015-02-04 03:35:05.534433
261	277	4	15000.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Nenita's Store	\N	1	\N	\N	\N	\N	\N	261	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:51:25.142404	2015-02-04 03:51:43.868905
251	267	4	15000.0	0	0	Ap-apid	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	MaryJane's Store	\N	1	\N	\N	\N	\N	\N	251	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:36:02.450261	2015-02-04 03:36:10.005567
255	271	1	15000.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Geraldine Store	\N	1	\N	\N	\N	\N	\N	255	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:40:58.606209	2015-02-09 04:03:21.81771
252	268	4	15000.0	0	0	Luhong	\N	Luhong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Josie's Store	\N	1	\N	\N	\N	\N	\N	252	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:37:07.626418	2015-02-04 03:37:17.852944
272	288	4	50000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Little Store and General Merchandise	\N	1	\N	\N	\N	\N	\N	272	\N	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-02-04 04:58:23.202835	2015-02-09 05:29:05.25069
262	278	4	100000.0	0	1	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Mangingihi Impugong Ap-apid Poblacion Irrigators' Association Inc.	\N	1	\N	\N	\N	\N	\N	262	\N	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:53:26.488963	2015-02-04 03:53:51.443629
258	274	4	15000.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lynlyn Store	\N	1	\N	\N	\N	\N	\N	258	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:44:51.951956	2015-02-04 03:45:04.352716
259	275	4	50000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Barangay Food Terminal	\N	1	\N	\N	\N	\N	\N	259	\N	4	4	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:46:28.374853	2015-02-04 03:47:34.487223
260	276	4	15000.0	0	0	Ahin	\N	Ahin	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Rosita's Store	\N	1	\N	\N	\N	\N	\N	260	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:49:33.142603	2015-02-04 03:49:46.974106
263	279	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Clarita Store	\N	1	\N	\N	\N	\N	\N	263	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:55:51.660496	2015-02-04 03:56:01.833787
264	280	4	15000.0	0	0	Bawi	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Jacquiline Store	\N	1	\N	\N	\N	\N	\N	264	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:57:23.101744	2015-02-04 03:57:33.49744
266	282	4	15000.0	0	0	Binablayan	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Duyapat Store	\N	1	\N	\N	\N	\N	\N	266	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 04:00:37.561958	2015-02-04 04:00:58.503625
268	284	1	50000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	ChrisJanne's General Merchandise	\N	1	\N	\N	\N	\N	\N	268	30000.0	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-04 04:50:18.804663	2015-02-10 07:18:47.513745
267	283	4	50000.0	0	0	Landing	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Debbie's Personalized Items and Gift Collection	\N	1	\N	\N	\N	\N	\N	267	\N	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 04:48:09.479152	2015-02-04 04:49:00.78956
269	285	4	50000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	JNB Dry Goods	\N	1	\N	\N	\N	\N	\N	269	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 04:52:41.135811	2015-02-04 04:52:49.32247
242	258	4	15000.0	0	0	Eheb	\N	Eheb	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Couples Store	\N	1	\N	\N	\N	\N	\N	242	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-04 03:23:02.528707	2015-02-09 08:42:15.216249
270	286	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	RG'S Store	\N	1	\N	\N	\N	\N	\N	270	\N	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-02-04 04:53:46.883996	2015-02-09 05:40:14.169513
271	287	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Angel Desire's Store	\N	1	\N	\N	\N	\N	\N	271	\N	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-02-04 04:57:01.490004	2015-02-09 05:38:16.27657
273	289	4	15000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Maria Food Handling	\N	1	\N	\N	\N	\N	\N	273	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 04:59:52.198384	2015-02-04 05:00:00.046774
274	290	4	15000.0	0	0	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Mary Ellen Food Handling	\N	1	\N	\N	\N	\N	\N	274	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 05:01:04.235643	2015-02-04 05:01:39.917316
275	291	4	15000.0	0	0	Luhong	\N	Luhong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Norma's Store	\N	1	\N	\N	\N	\N	\N	275	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 05:04:09.722691	2015-02-04 05:04:19.755903
276	292	4	15000.0	0	0	Luhong	\N	Luhong	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Remy's Store	\N	1	\N	\N	\N	\N	\N	276	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 05:05:24.10319	2015-02-04 05:05:35.939568
286	302	4	15000.0	0	0	Palabayan	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Rosing Galwan Sari Sari Store	\N	1	\N	\N	\N	\N	\N	286	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-09 07:59:24.575501	2015-02-09 08:06:18.133198
285	301	4	15000.0	0	0	Upper	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Regine Palangyo Sari Sari Store	\N	1	\N	\N	\N	\N	\N	285	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-09 07:57:45.667074	2015-02-09 08:06:41.477481
279	295	4	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Eliza Food Handling	\N	1	\N	\N	\N	\N	\N	279	\N	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 05:09:37.895741	2015-02-04 05:09:47.008774
284	300	4	15000.0	0	0	Keb-keb	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Satur Nginhayan Sari Sari Store	\N	1	\N	\N	\N	\N	\N	284	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-09 07:56:07.486559	2015-02-09 08:07:03.684928
283	299	4	15000.0	0	0	Banga	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Lilian Pihet Sari Sari Store	\N	1	\N	\N	\N	\N	\N	283	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-09 07:54:01.804485	2015-02-09 08:07:23.452623
282	298	4	15000.0	0	0	Banga	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Rita Pinkihan Sari Sari Store	\N	1	\N	\N	\N	\N	\N	282	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-09 07:52:38.149701	2015-02-09 08:07:37.244614
144	130	1	2400000.0	2	3	Kamelbeng	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tinoc Van Operators and Drivers Association Incorporation	\N	10	\N	\N	\N	\N	\N	144	\N	6	8	0.0	0.0	f	\N	\N	\N	\N	2015-01-30 03:29:05.602392	2015-02-10 03:13:05.509514
236	252	1	15000.0	0	0	Poblacion	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Mymy Tailoring	\N	1	\N	\N	\N	\N	\N	236	0.0	3	8	0.0	0.0	\N	\N	\N	\N	\N	2015-02-04 03:15:08.967966	2015-02-05 07:01:20.45208
289	305	1	15000.0	0	0	Pitikan	\N	Luhong	Tinoc	Ifugao	2015-10-02	\N	\N	\N	\N	\N	Glory Store	\N	1	\N	\N	\N	\N	\N	289	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-10 06:34:09.961558	2015-02-10 06:34:29.265621
280	296	1	20000.0	0	0	Impugong	\N	Impugong	Tinoc	Ifugao	2015-06-02	\N	\N	\N	\N	\N	Jay-R S Store	\N	1	\N	\N	\N	\N	\N	280	30000.0	4	5	0.0	0.0	\N	\N	\N	\N	\N	2015-02-06 07:11:53.246705	2015-02-06 07:12:32.802429
72	66	1	60000.0	0	0	Wangwang	\N	Wangwang	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	3S JF Store (Wangwang Branch)	\N	1	\N	\N	\N	\N	\N	72	\N	4	5	0.0	0.0	t	\N	\N	\N	\N	2015-01-28 02:54:45.002261	2015-02-09 05:32:46.287294
290	16	1	120000.0	0	3	Tupaan	\N	Poblacion	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Ulnoh ni Bibi-i di Tinoc, Inc	\N	50	\N	\N	\N	\N	\N	290	\N	6	8	0.0	0.0	f	\N	\N	\N	\N	2015-02-11 06:39:16.012736	2015-02-11 06:51:22.105185
278	294	1	15000.0	0	0	Ababba	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	David's Store	\N	1	\N	\N	\N	\N	\N	278	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-04 05:08:17.34387	2015-02-16 02:38:55.018638
265	281	1	15000.0	0	0	Proper	\N	Binablayan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Paduyao's Store	\N	1	\N	\N	\N	\N	\N	265	30000.0	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-04 03:59:31.533044	2015-02-16 03:47:07.70614
281	297	1	15000.0	0	0	Ap-apid	\N	Ap-apid	Tinoc	Ifugao	2015-09-02	\N	\N	\N	\N	\N	Jelyn Store	\N	1	\N	\N	\N	\N	\N	281	30000.0	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-09 07:02:06.847137	2015-02-09 07:03:31.327415
288	304	4	15000.0	0	0	Tuking	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Sonny Balangui Sari Sari Store	\N	1	\N	\N	\N	\N	\N	288	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-09 08:02:58.43592	2015-02-09 08:05:14.733825
287	303	4	15000.0	0	0	Proper	\N	Ap-apid	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Pepe Casinto	\N	1	\N	\N	\N	\N	\N	287	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-09 08:01:17.1841	2015-02-09 08:05:53.341511
291	306	1	15000.0	0	0	Tulludan	\N	Tulludan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Anita Bongtiwen Sari Sari Store	\N	1	\N	\N	\N	\N	\N	291	30000.0	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-16 03:56:56.069539	2015-02-16 03:57:52.642106
117	108	4	0.0	0	0	Ababba	\N	Tukucan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Tom's Construction Supplies and Equipment Rental	\N	1	\N	\N	\N	\N	\N	117	\N	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-01-29 01:53:38.258146	2015-02-16 06:42:16.691049
207	223	1	15000.0	0	0	Alungan	\N	Tulludan	Tinoc	Ifugao	\N	\N	\N	\N	\N	\N	Dulawan's Store	\N	1	\N	\N	\N	\N	\N	207	30000.0	4	5	0.0	0.0	f	\N	\N	\N	\N	2015-02-04 02:20:43.127548	2015-02-17 03:21:14.031041
\.


--
-- Name: businesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('businesses_id_seq', 291, true);


--
-- Data for Name: gross_sales_taxes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gross_sales_taxes (id, amount, business_id, created_at, updated_at) FROM stdin;
1	720.0	1	2015-01-26 04:26:20.554515	2015-01-26 04:26:20.554515
2	720.0	1	2015-01-26 04:27:18.726735	2015-01-26 04:27:18.726735
3	1000.0	2	2015-01-26 04:47:04.047997	2015-01-26 04:47:04.047997
4	1600.0	2	2015-01-26 04:47:17.447772	2015-01-26 04:47:17.447772
5	1800.0	2	2015-01-26 04:47:28.755822	2015-01-26 04:47:28.755822
6	\N	2	2015-01-26 04:49:11.077666	2015-01-26 04:49:11.077666
7	1800.0	2	2015-01-26 04:51:04.11814	2015-01-26 04:51:04.11814
8	1800.0	2	2015-01-26 05:31:35.23117	2015-01-26 05:31:35.23117
9	720.0	4	2015-01-26 05:37:33.198965	2015-01-26 05:37:33.198965
10	1000.0	4	2015-01-26 05:37:43.857395	2015-01-26 05:37:43.857395
11	1120.0	4	2015-01-26 05:37:58.848757	2015-01-26 05:37:58.848757
12	1080.0	4	2015-01-26 05:38:10.256904	2015-01-26 05:38:10.256904
13	1000.0	5	2015-01-26 05:43:49.942094	2015-01-26 05:43:49.942094
14	720.0	5	2015-01-26 05:44:01.003012	2015-01-26 05:44:01.003012
15	1080.0	4	2015-01-26 05:58:30.775519	2015-01-26 05:58:30.775519
16	1080.0	4	2015-01-26 06:00:13.116604	2015-01-26 06:00:13.116604
17	1080.0	4	2015-01-26 06:00:19.849431	2015-01-26 06:00:19.849431
18	720.0	6	2015-01-26 06:24:23.071198	2015-01-26 06:24:23.071198
19	1200.0	6	2015-01-26 06:24:38.388565	2015-01-26 06:24:38.388565
20	1800.0	6	2015-01-26 06:24:48.713867	2015-01-26 06:24:48.713867
21	1700.0	6	2015-01-26 06:24:59.821535	2015-01-26 06:24:59.821535
22	1680.0	6	2015-01-26 06:25:11.33849	2015-01-26 06:25:11.33849
23	1400.0	6	2015-01-26 06:25:31.687999	2015-01-26 06:25:31.687999
24	1200.0	6	2015-01-26 06:25:42.11272	2015-01-26 06:25:42.11272
25	1000.0	6	2015-01-26 06:25:52.604735	2015-01-26 06:25:52.604735
26	1100.0	6	2015-01-26 06:26:03.662247	2015-01-26 06:26:03.662247
27	1080.0	6	2015-01-26 06:26:12.078701	2015-01-26 06:26:12.078701
28	1080.0	7	2015-01-26 06:45:35.043073	2015-01-26 06:45:35.043073
29	1080.0	7	2015-01-26 06:48:15.795648	2015-01-26 06:48:15.795648
30	3000.0	8	2015-01-26 07:06:58.483895	2015-01-26 07:06:58.483895
31	4000.0	8	2015-01-26 07:07:12.382747	2015-01-26 07:07:12.382747
32	5000.0	8	2015-01-26 07:07:27.433333	2015-01-26 07:07:27.433333
33	3000.0	8	2015-01-26 07:07:39.191658	2015-01-26 07:07:39.191658
34	3600.0	8	2015-01-26 07:07:55.081973	2015-01-26 07:07:55.081973
35	1000.0	10	2015-01-26 07:48:26.200508	2015-01-26 07:48:26.200508
36	1080.0	10	2015-01-26 07:48:36.281145	2015-01-26 07:48:36.281145
37	1080.0	10	2015-01-26 08:15:35.581161	2015-01-26 08:15:35.581161
38	720.0	12	2015-01-26 08:51:10.491672	2015-01-26 08:51:10.491672
39	2000.0	13	2015-01-26 08:58:05.809869	2015-01-26 08:58:05.809869
40	3160.0	14	2015-01-26 09:24:13.18107	2015-01-26 09:24:13.18107
41	1780.0	14	2015-01-26 09:24:30.980838	2015-01-26 09:24:30.980838
42	1340.0	14	2015-01-26 09:24:39.497356	2015-01-26 09:24:39.497356
43	1600.0	14	2015-01-26 09:24:51.33797	2015-01-26 09:24:51.33797
44	1500.0	14	2015-01-26 09:25:05.622191	2015-01-26 09:25:05.622191
45	1520.0	14	2015-01-26 09:25:20.913128	2015-01-26 09:25:20.913128
46	1560.0	14	2015-01-26 09:25:31.304696	2015-01-26 09:25:31.304696
47	1540.0	14	2015-01-26 09:25:46.845946	2015-01-26 09:25:46.845946
48	1550.0	14	2015-01-26 09:25:59.120887	2015-01-26 09:25:59.120887
49	\N	15	2015-01-27 01:14:39.09171	2015-01-27 01:14:39.09171
50	\N	15	2015-01-27 01:14:39.175639	2015-01-27 01:14:39.175639
51	750000.0	15	2015-01-27 01:17:49.49209	2015-01-27 01:17:49.49209
52	25000.0	15	2015-01-27 01:19:03.94483	2015-01-27 01:19:03.94483
53	12600.0	15	2015-01-27 01:20:33.671406	2015-01-27 01:20:33.671406
54	10000.005	15	2015-01-27 01:27:40.108053	2015-01-27 01:27:40.108053
55	720.0	17	2015-01-27 02:30:16.351194	2015-01-27 02:30:16.351194
56	1000.0	22	2015-01-27 03:12:59.883539	2015-01-27 03:12:59.883539
57	1600.0	22	2015-01-27 03:13:11.708838	2015-01-27 03:13:11.708838
58	1500.0	22	2015-01-27 03:13:21.732642	2015-01-27 03:13:21.732642
59	1520.0	22	2015-01-27 03:13:30.21549	2015-01-27 03:13:30.21549
60	1540.0	22	2015-01-27 03:13:37.41546	2015-01-27 03:13:37.41546
61	1560.0	22	2015-01-27 03:13:44.898744	2015-01-27 03:13:44.898744
62	1550.0	22	2015-01-27 03:13:56.599268	2015-01-27 03:13:56.599268
63	2000.0	24	2015-01-27 03:23:10.232843	2015-01-27 03:23:10.232843
64	3000.0	25	2015-01-27 03:58:57.731817	2015-01-27 03:58:57.731817
65	3100.0	25	2015-01-27 03:59:09.739828	2015-01-27 03:59:09.739828
66	3600.0	25	2015-01-27 03:59:20.456235	2015-01-27 03:59:20.456235
67	1200.0	26	2015-01-27 04:02:16.612086	2015-01-27 04:02:16.612086
68	1120.0	26	2015-01-27 04:02:25.237279	2015-01-27 04:02:25.237279
69	1000.0	26	2015-01-27 04:02:32.66331	2015-01-27 04:02:32.66331
70	1040.0	26	2015-01-27 04:02:42.495766	2015-01-27 04:02:42.495766
71	1080.0	26	2015-01-27 04:02:48.90396	2015-01-27 04:02:48.90396
72	720.0	27	2015-01-27 05:52:51.450905	2015-01-27 05:52:51.450905
105	12600.0	15	2015-01-27 08:23:57.341329	2015-01-27 08:23:57.341329
106	720.0	62	2015-01-28 02:12:13.016567	2015-01-28 02:12:13.016567
107	720.0	64	2015-01-28 02:17:19.394459	2015-01-28 02:17:19.394459
108	720.0	62	2015-01-28 02:22:18.031711	2015-01-28 02:22:18.031711
109	1000.0	65	2015-01-28 02:24:22.263938	2015-01-28 02:24:22.263938
110	1120.0	65	2015-01-28 02:24:31.848115	2015-01-28 02:24:31.848115
111	1080.0	65	2015-01-28 02:24:41.829752	2015-01-28 02:24:41.829752
112	1080.0	6	2015-01-28 02:25:55.628785	2015-01-28 02:25:55.628785
113	2600.0	70	2015-01-28 02:48:00.208574	2015-01-28 02:48:00.208574
114	2700.0	70	2015-01-28 02:48:14.384025	2015-01-28 02:48:14.384025
115	2690.0	70	2015-01-28 02:48:24.409069	2015-01-28 02:48:24.409069
116	2680.0	70	2015-01-28 02:48:33.308909	2015-01-28 02:48:33.308909
117	2670.0	70	2015-01-28 02:48:44.933343	2015-01-28 02:48:44.933343
118	2000.0	70	2015-01-28 02:49:17.350195	2015-01-28 02:49:17.350195
119	2670.0	70	2015-01-28 02:49:34.099636	2015-01-28 02:49:34.099636
120	2676.0	70	2015-01-28 02:49:49.63266	2015-01-28 02:49:49.63266
121	2640.0	70	2015-01-28 02:50:01.389782	2015-01-28 02:50:01.389782
122	2650.0	70	2015-01-28 02:50:15.073906	2015-01-28 02:50:15.073906
123	920.0	73	2015-01-28 02:58:09.059005	2015-01-28 02:58:09.059005
124	1000.0	73	2015-01-28 02:58:19.242132	2015-01-28 02:58:19.242132
125	1080.0	73	2015-01-28 02:58:28.566739	2015-01-28 02:58:28.566739
126	965.0	74	2015-01-28 03:02:38.47943	2015-01-28 03:02:38.47943
127	30.0	75	2015-01-28 03:09:33.056508	2015-01-28 03:09:33.056508
128	67.0	75	2015-01-28 03:09:49.431585	2015-01-28 03:09:49.431585
129	67.0	75	2015-01-28 03:10:02.815205	2015-01-28 03:10:02.815205
130	114.0	75	2015-01-28 03:10:11.947505	2015-01-28 03:10:11.947505
131	67.0	75	2015-01-28 03:10:22.09347	2015-01-28 03:10:22.09347
132	30.0	74	2015-01-28 04:50:03.954389	2015-01-28 04:50:03.954389
133	67.0	74	2015-01-28 04:50:19.029105	2015-01-28 04:50:19.029105
134	114.0	74	2015-01-28 04:50:28.437259	2015-01-28 04:50:28.437259
135	67.0	74	2015-01-28 04:51:06.227435	2015-01-28 04:51:06.227435
136	30.0	74	2015-01-28 04:51:19.235227	2015-01-28 04:51:19.235227
137	1080.0	77	2015-01-28 04:54:37.899142	2015-01-28 04:54:37.899142
138	1080.0	77	2015-01-28 04:54:57.632403	2015-01-28 04:54:57.632403
139	\N	79	2015-01-28 05:06:45.353567	2015-01-28 05:06:45.353567
140	500.0	79	2015-01-28 05:10:14.229306	2015-01-28 05:10:14.229306
141	540.0	79	2015-01-28 05:10:32.391344	2015-01-28 05:10:32.391344
142	540.0	79	2015-01-28 05:13:27.838499	2015-01-28 05:13:27.838499
143	600.0	79	2015-01-28 05:13:46.129839	2015-01-28 05:13:46.129839
144	580.0	79	2015-01-28 05:14:01.261784	2015-01-28 05:14:01.261784
145	550.0	79	2015-01-28 05:14:11.796873	2015-01-28 05:14:11.796873
146	500.0	79	2015-01-28 05:14:18.94672	2015-01-28 05:14:18.94672
147	480.0	79	2015-01-28 05:14:26.120677	2015-01-28 05:14:26.120677
148	0.0	80	2015-01-28 05:19:08.675181	2015-01-28 05:19:08.675181
149	620.0	80	2015-01-28 05:19:18.000127	2015-01-28 05:19:18.000127
150	0.0	80	2015-01-28 05:19:37.158497	2015-01-28 05:19:37.158497
151	1080.0	82	2015-01-28 05:32:40.151935	2015-01-28 05:32:40.151935
152	720.0	86	2015-01-28 06:25:02.951529	2015-01-28 06:25:02.951529
153	1160.0	87	2015-01-28 06:29:22.502148	2015-01-28 06:29:22.502148
154	1400.0	87	2015-01-28 06:29:32.451249	2015-01-28 06:29:32.451249
155	1360.0	87	2015-01-28 06:29:41.626273	2015-01-28 06:29:41.626273
156	1380.0	87	2015-01-28 06:29:51.967434	2015-01-28 06:29:51.967434
157	680.0	88	2015-01-28 06:36:26.536148	2015-01-28 06:36:26.536148
158	720.0	88	2015-01-28 06:36:34.12808	2015-01-28 06:36:34.12808
159	500.0	89	2015-01-28 06:40:36.148851	2015-01-28 06:40:36.148851
160	1000.0	89	2015-01-28 06:40:46.423355	2015-01-28 06:40:46.423355
161	620.0	89	2015-01-28 06:41:09.840087	2015-01-28 06:41:09.840087
162	620.0	89	2015-01-28 06:41:51.646985	2015-01-28 06:41:51.646985
163	0.0	89	2015-01-28 06:42:11.605025	2015-01-28 06:42:11.605025
164	30.0	89	2015-01-28 06:45:04.859979	2015-01-28 06:45:04.859979
165	720.0	90	2015-01-28 06:48:28.124304	2015-01-28 06:48:28.124304
166	1080.0	90	2015-01-28 06:48:37.848229	2015-01-28 06:48:37.848229
167	1120.0	91	2015-01-28 06:50:58.763811	2015-01-28 06:50:58.763811
168	1080.0	91	2015-01-28 06:51:08.605386	2015-01-28 06:51:08.605386
169	1080.0	92	2015-01-28 06:58:20.823604	2015-01-28 06:58:20.823604
170	1080.0	94	2015-01-28 07:16:52.711406	2015-01-28 07:16:52.711406
171	1080.0	94	2015-01-28 07:18:34.066062	2015-01-28 07:18:34.066062
172	1200.0	95	2015-01-28 07:36:04.974166	2015-01-28 07:36:04.974166
173	1600.0	95	2015-01-28 07:36:13.641558	2015-01-28 07:36:13.641558
174	1520.0	95	2015-01-28 07:36:20.000763	2015-01-28 07:36:20.000763
175	1540.0	95	2015-01-28 07:36:27.098943	2015-01-28 07:36:27.098943
176	1550.0	95	2015-01-28 07:36:34.182475	2015-01-28 07:36:34.182475
177	1080.0	96	2015-01-28 07:52:09.392367	2015-01-28 07:52:09.392367
178	1000.0	96	2015-01-28 07:55:12.747556	2015-01-28 07:55:12.747556
179	720.0	96	2015-01-28 07:55:23.597397	2015-01-28 07:55:23.597397
180	680.0	97	2015-01-28 08:04:20.75425	2015-01-28 08:04:20.75425
181	720.0	97	2015-01-28 08:04:33.32915	2015-01-28 08:04:33.32915
182	1550.0	98	2015-01-28 08:19:44.197131	2015-01-28 08:19:44.197131
183	1550.0	98	2015-01-28 08:22:50.485151	2015-01-28 08:22:50.485151
184	6000.02	99	2015-01-28 08:45:28.527218	2015-01-28 08:45:28.527218
185	600.02	99	2015-01-28 08:45:41.193831	2015-01-28 08:45:41.193831
186	600.02	99	2015-01-28 08:46:24.077425	2015-01-28 08:46:24.077425
187	600.0	99	2015-01-28 08:46:42.768324	2015-01-28 08:46:42.768324
188	0.0	100	2015-01-28 09:07:03.099915	2015-01-28 09:07:03.099915
189	0.0	100	2015-01-28 09:09:41.706512	2015-01-28 09:09:41.706512
190	300.0	100	2015-01-28 09:09:50.372599	2015-01-28 09:09:50.372599
191	300.0	101	2015-01-29 00:23:31.666394	2015-01-29 00:23:31.666394
192	600.0	101	2015-01-29 00:23:45.062937	2015-01-29 00:23:45.062937
193	1450.0	101	2015-01-29 00:24:16.075623	2015-01-29 00:24:16.075623
194	1450.0	101	2015-01-29 00:25:00.135284	2015-01-29 00:25:00.135284
195	965.0	101	2015-01-29 00:25:31.481276	2015-01-29 00:25:31.481276
196	600.0	101	2015-01-29 00:25:48.715593	2015-01-29 00:25:48.715593
197	33000.0	102	2015-01-29 00:34:19.199798	2015-01-29 00:34:19.199798
198	9500.0	102	2015-01-29 00:34:25.641525	2015-01-29 00:34:25.641525
199	7200.0	102	2015-01-29 00:35:12.51782	2015-01-29 00:35:12.51782
200	1080.0	103	2015-01-29 00:38:05.588037	2015-01-29 00:38:05.588037
201	1080.0	103	2015-01-29 00:38:31.212027	2015-01-29 00:38:31.212027
202	620.0	104	2015-01-29 00:43:59.524026	2015-01-29 00:43:59.524026
203	600.0	104	2015-01-29 00:44:09.607902	2015-01-29 00:44:09.607902
204	1080.0	105	2015-01-29 00:46:37.648155	2015-01-29 00:46:37.648155
205	720.0	106	2015-01-29 00:49:41.403949	2015-01-29 00:49:41.403949
206	1080.0	109	2015-01-29 00:59:36.404595	2015-01-29 00:59:36.404595
207	1000.0	111	2015-01-29 01:03:48.821591	2015-01-29 01:03:48.821591
208	2000.0	111	2015-01-29 01:04:13.160259	2015-01-29 01:04:13.160259
209	1080.0	112	2015-01-29 01:08:16.350318	2015-01-29 01:08:16.350318
210	1080.0	112	2015-01-29 01:15:48.414469	2015-01-29 01:15:48.414469
211	1080.0	114	2015-01-29 01:20:37.146889	2015-01-29 01:20:37.146889
212	12600.0	15	2015-01-29 01:23:29.835403	2015-01-29 01:23:29.835403
213	12600.0	15	2015-01-29 01:23:41.612312	2015-01-29 01:23:41.612312
214	965.0	15	2015-01-29 01:24:19.023584	2015-01-29 01:24:19.023584
215	30.0	15	2015-01-29 01:25:17.101956	2015-01-29 01:25:17.101956
216	30.0	15	2015-01-29 01:25:28.017375	2015-01-29 01:25:28.017375
217	67.0	15	2015-01-29 01:25:37.559434	2015-01-29 01:25:37.559434
218	1080.0	122	2015-01-29 03:10:14.312607	2015-01-29 03:10:14.312607
219	720.0	124	2015-01-29 05:20:06.972322	2015-01-29 05:20:06.972322
220	600.0	125	2015-01-29 06:29:50.623928	2015-01-29 06:29:50.623928
221	0.0	125	2015-01-29 06:30:08.009088	2015-01-29 06:30:08.009088
222	0.0	125	2015-01-29 06:30:15.075608	2015-01-29 06:30:15.075608
223	600.0	125	2015-01-29 06:31:04.291954	2015-01-29 06:31:04.291954
224	1080.0	126	2015-01-29 06:44:18.136645	2015-01-29 06:44:18.136645
225	1000.0	127	2015-01-29 07:24:33.244641	2015-01-29 07:24:33.244641
226	720.0	128	2015-01-29 07:27:28.497234	2015-01-29 07:27:28.497234
227	900.0	128	2015-01-29 07:27:38.50104	2015-01-29 07:27:38.50104
228	800.0	128	2015-01-29 07:27:46.116571	2015-01-29 07:27:46.116571
229	820.0	128	2015-01-29 07:27:54.924667	2015-01-29 07:27:54.924667
230	850.0	128	2015-01-29 07:28:02.592246	2015-01-29 07:28:02.592246
231	850.0	129	2015-01-29 07:29:42.818612	2015-01-29 07:29:42.818612
232	680.0	130	2015-01-29 07:41:11.79702	2015-01-29 07:41:11.79702
233	720.0	130	2015-01-29 07:41:18.530893	2015-01-29 07:41:18.530893
234	2000.0	131	2015-01-29 07:47:58.267562	2015-01-29 07:47:58.267562
235	2000.0	131	2015-01-29 07:51:04.002108	2015-01-29 07:51:04.002108
236	600.0	132	2015-01-29 08:02:05.130223	2015-01-29 08:02:05.130223
237	600.0	133	2015-01-29 08:08:16.328462	2015-01-29 08:08:16.328462
238	600.0	134	2015-01-29 08:16:44.093909	2015-01-29 08:16:44.093909
239	600.0	135	2015-01-29 08:22:14.206162	2015-01-29 08:22:14.206162
240	600.0	136	2015-01-29 08:25:01.831829	2015-01-29 08:25:01.831829
241	30.0	139	2015-01-30 00:32:02.825333	2015-01-30 00:32:02.825333
242	67.0	139	2015-01-30 00:32:12.988738	2015-01-30 00:32:12.988738
243	180.0	139	2015-01-30 00:32:24.605154	2015-01-30 00:32:24.605154
244	114.0	139	2015-01-30 00:32:36.064174	2015-01-30 00:32:36.064174
245	114.0	139	2015-01-30 00:32:47.605668	2015-01-30 00:32:47.605668
246	114.0	139	2015-01-30 00:33:02.496247	2015-01-30 00:33:02.496247
247	180.0	139	2015-01-30 00:33:16.763328	2015-01-30 00:33:16.763328
248	114.0	139	2015-01-30 00:33:29.76297	2015-01-30 00:33:29.76297
249	600.0	140	2015-01-30 01:26:50.743044	2015-01-30 01:26:50.743044
250	600.0	141	2015-01-30 01:50:37.561872	2015-01-30 01:50:37.561872
251	680.0	142	2015-01-30 02:48:32.600242	2015-01-30 02:48:32.600242
252	720.0	142	2015-01-30 02:48:42.850016	2015-01-30 02:48:42.850016
253	1080.0	154	2015-01-30 07:35:22.68579	2015-01-30 07:35:22.68579
254	67.0	155	2015-02-02 00:13:55.84461	2015-02-02 00:13:55.84461
255	180.0	155	2015-02-02 00:14:05.26772	2015-02-02 00:14:05.26772
256	420.0	155	2015-02-02 00:14:32.231889	2015-02-02 00:14:32.231889
257	300.0	155	2015-02-02 00:14:40.505278	2015-02-02 00:14:40.505278
258	300.0	155	2015-02-02 00:14:49.904938	2015-02-02 00:14:49.904938
259	720.0	156	2015-02-02 00:22:55.212597	2015-02-02 00:22:55.212597
260	720.0	158	2015-02-02 06:05:12.343825	2015-02-02 06:05:12.343825
261	\N	119	2015-02-02 07:01:43.863166	2015-02-02 07:01:43.863166
262	\N	119	2015-02-02 07:01:43.963346	2015-02-02 07:01:43.963346
263	\N	119	2015-02-02 07:02:03.563983	2015-02-02 07:02:03.563983
264	0.0	119	2015-02-02 07:02:18.930863	2015-02-02 07:02:18.930863
265	0.0	119	2015-02-02 07:03:07.978967	2015-02-02 07:03:07.978967
266	600.0	160	2015-02-03 01:32:55.802213	2015-02-03 01:32:55.802213
267	0.0	221	2015-02-04 08:09:04.288459	2015-02-04 08:09:04.288459
268	680.0	249	2015-02-05 02:54:28.155021	2015-02-05 02:54:28.155021
269	720.0	249	2015-02-05 02:54:37.004509	2015-02-05 02:54:37.004509
270	720.0	249	2015-02-05 03:08:03.713372	2015-02-05 03:08:03.713372
271	300.0	236	2015-02-05 06:57:58.230874	2015-02-05 06:57:58.230874
272	0.0	236	2015-02-05 06:59:01.121363	2015-02-05 06:59:01.121363
273	300.0	236	2015-02-05 06:59:09.721089	2015-02-05 06:59:09.721089
274	30.0	236	2015-02-05 06:59:25.400632	2015-02-05 06:59:25.400632
275	420.0	236	2015-02-05 06:59:31.204128	2015-02-05 06:59:31.204128
276	965.0	236	2015-02-05 06:59:44.078323	2015-02-05 06:59:44.078323
277	600.0	236	2015-02-05 06:59:52.778017	2015-02-05 06:59:52.778017
278	420.0	236	2015-02-05 07:00:31.060851	2015-02-05 07:00:31.060851
279	420.0	236	2015-02-05 07:00:45.77729	2015-02-05 07:00:45.77729
280	30.0	236	2015-02-05 07:00:54.631046	2015-02-05 07:00:54.631046
281	600.0	280	2015-02-06 07:11:58.767729	2015-02-06 07:11:58.767729
282	1550.0	95	2015-02-09 05:20:00.030734	2015-02-09 05:20:00.030734
283	1550.0	95	2015-02-09 05:21:32.237328	2015-02-09 05:21:32.237328
284	1550.0	95	2015-02-09 05:21:37.149863	2015-02-09 05:21:37.149863
285	1550.0	95	2015-02-09 05:22:28.988789	2015-02-09 05:22:28.988789
286	1550.0	95	2015-02-09 05:24:37.207408	2015-02-09 05:24:37.207408
287	1550.0	95	2015-02-09 05:24:50.353769	2015-02-09 05:24:50.353769
288	1550.0	95	2015-02-09 05:24:53.39447	2015-02-09 05:24:53.39447
289	720.0	1	2015-02-09 05:26:14.536129	2015-02-09 05:26:14.536129
290	67.0	75	2015-02-09 05:26:38.984384	2015-02-09 05:26:38.984384
291	720.0	158	2015-02-09 05:26:54.967677	2015-02-09 05:26:54.967677
292	1080.0	7	2015-02-09 05:27:22.543719	2015-02-09 05:27:22.543719
293	1080.0	154	2015-02-09 05:27:58.750229	2015-02-09 05:27:58.750229
294	1080.0	73	2015-02-09 05:29:22.840927	2015-02-09 05:29:22.840927
295	1080.0	4	2015-02-09 05:29:55.520282	2015-02-09 05:29:55.520282
296	480.0	79	2015-02-09 05:30:08.715073	2015-02-09 05:30:08.715073
297	720.0	88	2015-02-09 05:30:28.006736	2015-02-09 05:30:28.006736
298	1550.0	98	2015-02-09 05:30:49.948447	2015-02-09 05:30:49.948447
299	600.0	104	2015-02-09 05:31:24.455622	2015-02-09 05:31:24.455622
300	1080.0	105	2015-02-09 05:31:45.604892	2015-02-09 05:31:45.604892
301	2000.0	13	2015-02-09 05:32:08.765312	2015-02-09 05:32:08.765312
302	2650.0	70	2015-02-09 05:33:09.096227	2015-02-09 05:33:09.096227
303	1080.0	114	2015-02-09 05:34:22.40296	2015-02-09 05:34:22.40296
304	1380.0	87	2015-02-09 05:34:46.10257	2015-02-09 05:34:46.10257
305	720.0	156	2015-02-09 05:35:01.894446	2015-02-09 05:35:01.894446
306	720.0	62	2015-02-09 05:35:16.270102	2015-02-09 05:35:16.270102
307	1080.0	122	2015-02-09 05:35:33.493773	2015-02-09 05:35:33.493773
308	1080.0	103	2015-02-09 05:35:54.460604	2015-02-09 05:35:54.460604
309	1550.0	14	2015-02-09 05:36:17.203463	2015-02-09 05:36:17.203463
310	1080.0	65	2015-02-09 05:36:54.550928	2015-02-09 05:36:54.550928
311	720.0	86	2015-02-09 05:37:12.358781	2015-02-09 05:37:12.358781
312	1080.0	10	2015-02-09 05:38:51.550877	2015-02-09 05:38:51.550877
313	720.0	27	2015-02-09 05:40:27.622862	2015-02-09 05:40:27.622862
314	1080.0	91	2015-02-09 05:40:48.605897	2015-02-09 05:40:48.605897
315	1080.0	90	2015-02-09 05:41:06.571596	2015-02-09 05:41:06.571596
316	7200.0	102	2015-02-09 05:41:54.855164	2015-02-09 05:41:54.855164
317	720.0	97	2015-02-09 05:42:09.163319	2015-02-09 05:42:09.163319
318	720.0	130	2015-02-09 05:42:39.455007	2015-02-09 05:42:39.455007
319	30.0	74	2015-02-09 05:42:55.220597	2015-02-09 05:42:55.220597
320	600.0	237	2015-02-09 06:56:29.09431	2015-02-09 06:56:29.09431
321	600.0	281	2015-02-09 07:02:31.668056	2015-02-09 07:02:31.668056
322	600.0	188	2015-02-10 06:36:27.985622	2015-02-10 06:36:27.985622
323	0.0	268	2015-02-10 07:17:39.021205	2015-02-10 07:17:39.021205
324	600.0	268	2015-02-10 07:17:44.09635	2015-02-10 07:17:44.09635
325	600.0	268	2015-02-10 07:18:47.554291	2015-02-10 07:18:47.554291
326	600.0	227	2015-02-11 06:35:13.813047	2015-02-11 06:35:13.813047
327	600.0	198	2015-02-16 02:25:40.582624	2015-02-16 02:25:40.582624
328	600.0	265	2015-02-16 03:46:17.543805	2015-02-16 03:46:17.543805
329	600.0	291	2015-02-16 03:57:31.13606	2015-02-16 03:57:31.13606
330	600.0	207	2015-02-17 03:19:10.884662	2015-02-17 03:19:10.884662
331	600.0	207	2015-02-17 03:21:14.105762	2015-02-17 03:21:14.105762
\.


--
-- Name: gross_sales_taxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('gross_sales_taxes_id_seq', 331, true);


--
-- Data for Name: line_of_businesses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY line_of_businesses (id, business_id, description, psic_code, created_at, updated_at) FROM stdin;
1	1	Tailoring		2015-01-26 04:33:29.680628	2015-01-26 04:33:29.680628
2	2	General Merchandise		2015-01-26 04:41:12.63782	2015-01-26 04:41:12.63782
3	3	General Merchandise		2015-01-26 05:04:56.901063	2015-01-26 05:04:56.901063
4	4	Sari Sari Store		2015-01-26 05:38:36.991777	2015-01-26 05:38:36.991777
5	5	Meat Boot, Sari Sari Store		2015-01-26 05:43:39.653569	2015-01-26 05:43:39.653569
6	6	Sari Sari Store		2015-01-26 06:26:39.626717	2015-01-26 06:26:39.626717
7	7	Sari Sari Store, Tailoring 		2015-01-26 06:45:25.0261	2015-01-26 06:45:25.0261
8	10	Hardware and General Merchandise		2015-01-26 07:45:51.580812	2015-01-26 07:45:51.580812
9	9	Sari Sari Store		2015-01-26 07:46:48.471297	2015-01-26 07:46:48.471297
10	11	Tailoring, Repair Shop, Dry Goods Retailer		2015-01-26 08:24:06.461798	2015-01-26 08:24:06.461798
11	8	Pharmacy		2015-01-26 08:46:09.31108	2015-01-26 08:46:09.31108
12	12	Sari Sari Store		2015-01-26 08:51:57.608463	2015-01-26 08:51:57.608463
13	13	Meat Retailer		2015-01-26 08:57:55.867047	2015-01-26 08:57:55.867047
14	14	Retail Sale in Non-Specialized Store, Lodge		2015-01-26 09:27:20.826365	2015-01-26 09:27:20.826365
15	15	Construction and Supply		2015-01-27 01:12:00.445584	2015-01-27 01:12:00.445584
16	16	Rural Workers Association		2015-01-27 02:24:48.531312	2015-01-27 02:24:48.531312
17	17	Sari Sari Store		2015-01-27 02:30:49.046378	2015-01-27 02:30:49.046378
18	18	Sari Sari Store		2015-01-27 02:38:05.590246	2015-01-27 02:38:05.590246
19	20	Sari Sari Store		2015-01-27 02:51:43.199326	2015-01-27 02:51:43.199326
20	21	Sari Sari Store		2015-01-27 02:58:11.630761	2015-01-27 02:58:11.630761
21	22	Sari Sari Store		2015-01-27 03:14:33.976492	2015-01-27 03:14:33.976492
22	23	Sari Sari Store		2015-01-27 03:18:59.367528	2015-01-27 03:18:59.367528
23	24	Sari Sari Store		2015-01-27 03:23:52.088876	2015-01-27 03:23:52.088876
24	25	Pharmacy		2015-01-27 03:59:45.191573	2015-01-27 03:59:45.191573
25	26	Sari Sari Store		2015-01-27 04:03:15.583572	2015-01-27 04:03:15.583572
26	27	General Merchandise		2015-01-27 05:53:18.277081	2015-01-27 05:53:18.277081
59	60	Sari Sari Store		2015-01-27 07:07:51.154884	2015-01-27 07:07:51.154884
60	61	Sari Sari Store		2015-01-28 00:49:09.152426	2015-01-28 00:49:09.152426
61	62	Sari Sari Store		2015-01-28 02:12:45.484137	2015-01-28 02:12:45.484137
62	63	Sari Sari Store		2015-01-28 02:17:42.510058	2015-01-28 02:17:42.510058
63	64	Motor Parts and Accessories Retailer		2015-01-28 02:18:00.012035	2015-01-28 02:18:00.012035
64	65	Sari Sari Store		2015-01-28 02:33:20.899642	2015-01-28 02:33:20.899642
65	66	Construction Supplies and Aggregates		2015-01-28 02:34:00.938617	2015-01-28 02:34:00.938617
66	67	Sari Sari Store		2015-01-28 02:34:16.87933	2015-01-28 02:34:16.87933
67	68	Eatery		2015-01-28 02:42:43.092761	2015-01-28 02:42:43.092761
68	69	Sari Sari Store, Motor Parts and Accessories Retailer		2015-01-28 02:45:19.012889	2015-01-28 02:45:19.012889
69	70	Sari Sari Store, Motor Parts and Accessories Retailer		2015-01-28 02:47:45.831751	2015-01-28 02:47:45.831751
70	71	Sari Sari Store, Motor Parts and Accessories Retailer		2015-01-28 02:53:10.36318	2015-01-28 02:53:10.36318
71	72	Sari Sari Store, Motor Parts and Accessories Retailer		2015-01-28 02:59:15.845312	2015-01-28 02:59:15.845312
72	73	Sari Sari Store and Dry Goods		2015-01-28 02:59:31.99908	2015-01-28 02:59:31.99908
73	75	Restaurant		2015-01-28 03:12:08.860779	2015-01-28 03:12:08.860779
74	76	Sari Sari Store		2015-01-28 03:56:56.430848	2015-01-28 03:56:56.430848
75	74	Printing, Photocopy and Encoding Services		2015-01-28 04:55:38.221436	2015-01-28 04:55:38.221436
76	77	Sari Sari Store		2015-01-28 04:56:16.563905	2015-01-28 04:56:16.563905
77	78	Sari Sari Store		2015-01-28 04:59:06.568374	2015-01-28 04:59:06.568374
78	79	Bakeshop		2015-01-28 05:19:58.12765	2015-01-28 05:19:58.12765
79	80	Dry Goods Retailer		2015-01-28 05:20:20.284328	2015-01-28 05:20:20.284328
80	82	Sari Sari Store		2015-01-28 05:33:10.306084	2015-01-28 05:33:10.306084
81	83	Sari Sari Store		2015-01-28 05:52:42.044598	2015-01-28 05:52:42.044598
82	84	Boarding House		2015-01-28 06:04:41.942837	2015-01-28 06:04:41.942837
83	85	Sari Sari Store		2015-01-28 06:21:41.395849	2015-01-28 06:21:41.395849
84	86	Sari Sari Store		2015-01-28 06:26:08.34682	2015-01-28 06:26:08.34682
85	87	Dry Goods Retailer		2015-01-28 06:30:13.271344	2015-01-28 06:30:13.271344
86	88	Sari Sari Store		2015-01-28 06:36:17.675114	2015-01-28 06:36:17.675114
87	89	Lodging, General Merchandise		2015-01-28 06:46:19.688049	2015-01-28 06:46:19.688049
88	90	Bakeshop, General Merchandise		2015-01-28 06:49:15.433999	2015-01-28 06:49:15.433999
89	91	Sari Sari Store		2015-01-28 06:51:41.730135	2015-01-28 06:51:41.730135
90	92	Sari Sari Store		2015-01-28 06:59:01.400945	2015-01-28 06:59:01.400945
91	94	Sari Sari Store		2015-01-28 07:16:44.292356	2015-01-28 07:16:44.292356
92	93	General Merchandise		2015-01-28 07:31:52.990439	2015-01-28 07:31:52.990439
93	95	Sari Sari Store		2015-01-28 07:40:14.439685	2015-01-28 07:40:14.439685
94	96	Sari Sari Store		2015-01-28 07:55:53.430108	2015-01-28 07:55:53.430108
95	97	Sari Sari Store, Meat Products		2015-01-28 08:07:27.062708	2015-01-28 08:07:27.062708
96	98	General Merchandise		2015-01-28 08:20:08.376119	2015-01-28 08:20:08.376119
97	99	Sari Sari Store		2015-01-28 08:47:49.615026	2015-01-28 08:47:49.615026
98	100	Bakeshop		2015-01-28 09:10:19.349452	2015-01-28 09:10:19.349452
99	101	Computer Sales and Services		2015-01-29 00:27:51.517958	2015-01-29 00:27:51.517958
100	102	General Merchandise, Bus Transportation		2015-01-29 00:35:53.775912	2015-01-29 00:35:53.775912
101	103	Dry Goods Retailer		2015-01-29 00:39:13.269752	2015-01-29 00:39:13.269752
102	104	Sari Sari Store		2015-01-29 00:47:00.457409	2015-01-29 00:47:00.457409
103	105	General Merchandise		2015-01-29 00:47:12.776937	2015-01-29 00:47:12.776937
104	106	Sari Sari Store		2015-01-29 00:50:04.728223	2015-01-29 00:50:04.728223
105	107	Sari Sari Store		2015-01-29 00:55:57.507472	2015-01-29 00:55:57.507472
106	111	Farm Supply		2015-01-29 01:05:33.634189	2015-01-29 01:05:33.634189
107	108	Sari Sari Store		2015-01-29 01:08:44.474412	2015-01-29 01:08:44.474412
109	112	General Merchandise		2015-01-29 01:13:31.277017	2015-01-29 01:13:31.277017
110	109	General Merchandise		2015-01-29 01:15:18.863025	2015-01-29 01:15:18.863025
111	114	General Merchandise		2015-01-29 01:21:18.021123	2015-01-29 01:21:18.021123
112	113	Sari Sari Store		2015-01-29 01:26:14.497309	2015-01-29 01:26:14.497309
113	115	Sari Sari Store		2015-01-29 01:28:54.939871	2015-01-29 01:28:54.939871
114	120	Fast Food, Catering Services		2015-01-29 02:15:54.091258	2015-01-29 02:15:54.091258
115	122	Sari Sari Store		2015-01-29 03:12:27.288619	2015-01-29 03:12:27.288619
116	123	Sari Sari Store		2015-01-29 03:43:49.454237	2015-01-29 03:43:49.454237
117	124	General Merchandise		2015-01-29 05:20:52.610496	2015-01-29 05:20:52.610496
118	125	Sari Sari Store		2015-01-29 06:29:42.651051	2015-01-29 06:29:42.651051
119	126	Dry Goods Retailer		2015-01-29 06:44:11.537582	2015-01-29 06:44:11.537582
120	127	General Merchandise		2015-01-29 07:25:26.441009	2015-01-29 07:25:26.441009
121	128	General Merchandise		2015-01-29 07:28:25.838971	2015-01-29 07:28:25.838971
122	129	General Merchandise		2015-01-29 07:30:08.476522	2015-01-29 07:30:08.476522
123	130	Dry Goods Retailer, Furniture Shop		2015-01-29 07:44:11.185534	2015-01-29 07:44:11.185534
124	131	General Merchandise		2015-01-29 07:48:37.497447	2015-01-29 07:48:37.497447
125	132	Sari Sari Store		2015-01-29 08:03:42.746943	2015-01-29 08:03:42.746943
126	133	Sari Sari Store		2015-01-29 08:08:35.627332	2015-01-29 08:08:35.627332
127	134	Sari Sari Store		2015-01-29 08:19:36.147976	2015-01-29 08:19:36.147976
128	135	Sari Sari Store		2015-01-29 08:22:18.349005	2015-01-29 08:22:18.349005
129	136	Sari Sari Store		2015-01-29 08:28:25.459893	2015-01-29 08:28:25.459893
130	136	Sari Sari Store		2015-01-29 08:29:47.827838	2015-01-29 08:29:47.827838
131	137	Sari Sari Store		2015-01-29 09:01:47.512297	2015-01-29 09:01:47.512297
132	138	Women's Organization		2015-01-29 09:09:33.296954	2015-01-29 09:09:33.296954
133	139	General Merchandise, Computer Services		2015-01-30 00:37:48.830426	2015-01-30 00:37:48.830426
134	140	Sari Sari Store		2015-01-30 01:29:59.818338	2015-01-30 01:29:59.818338
135	141	Sari Sari Store		2015-01-30 01:57:49.013934	2015-01-30 01:57:49.013934
136	142	Sari Sari Store		2015-01-30 02:49:35.95062	2015-01-30 02:49:35.95062
137	146	Cooperative		2015-01-30 03:47:18.387738	2015-01-30 03:47:18.387738
138	147	Sari Sari Store		2015-01-30 03:49:03.390767	2015-01-30 03:49:03.390767
139	148	Sari Sari Store		2015-01-30 06:20:35.282217	2015-01-30 06:20:35.282217
140	149	Sari Sari Store		2015-01-30 06:32:33.76122	2015-01-30 06:32:33.76122
141	150	Cooperative		2015-01-30 06:39:46.419532	2015-01-30 06:39:46.419532
142	151	Cooperative		2015-01-30 06:41:49.974802	2015-01-30 06:41:49.974802
143	152	Sari Sari Store		2015-01-30 07:16:55.857964	2015-01-30 07:16:55.857964
145	154	General Merchandise		2015-01-30 07:35:49.36163	2015-01-30 07:35:49.36163
146	155	Dental Clinic		2015-02-02 00:23:32.300389	2015-02-02 00:23:32.300389
147	157	Sari Sari Store		2015-02-02 02:27:35.536035	2015-02-02 02:27:35.536035
148	158	Sari Sari Store		2015-02-02 06:06:20.843883	2015-02-02 06:06:20.843883
149	156	Sari Sari Store		2015-02-02 06:34:45.783075	2015-02-02 06:34:45.783075
150	159	Sari Sari Store		2015-02-02 06:59:05.244244	2015-02-02 06:59:05.244244
151	119	Cooperative		2015-02-02 07:02:55.759512	2015-02-02 07:02:55.759512
152	160	General Merchandise		2015-02-03 01:35:58.98818	2015-02-03 01:35:58.98818
153	221	Sari Sari Store		2015-02-04 08:09:36.467976	2015-02-04 08:09:36.467976
154	249	General Merchandise		2015-02-05 02:55:05.142765	2015-02-05 02:55:05.142765
155	236	Tailoring Shop		2015-02-05 07:05:00.254912	2015-02-05 07:05:00.254912
156	280	Sari Sari Store		2015-02-06 07:12:46.175591	2015-02-06 07:12:46.175591
157	256	Sari Sari Store		2015-02-09 03:58:27.284174	2015-02-09 03:58:27.284174
158	255	Sari Sari Store		2015-02-09 04:03:33.817258	2015-02-09 04:03:33.817258
159	257	Sari Sari Store		2015-02-09 04:10:07.918912	2015-02-09 04:10:07.918912
160	237	Sari Sari Store		2015-02-09 06:59:32.222415	2015-02-09 06:59:32.222415
161	281	Sari Sari Store		2015-02-09 07:02:11.879859	2015-02-09 07:02:11.879859
162	144	Public Utility Vehicle Operation	492	2015-02-10 03:10:14.612335	2015-02-10 03:10:14.612335
144	153	Public Utility Vehicle Operation	492	2015-01-30 07:24:47.95746	2015-02-10 03:10:32.160854
163	289	Sari Sari Store		2015-02-10 06:34:43.111729	2015-02-10 06:34:43.111729
164	188	Sari Sari Store		2015-02-10 06:39:56.353547	2015-02-10 06:39:56.353547
165	268	Computer Rental and Services		2015-02-10 07:19:09.260756	2015-02-10 07:19:09.260756
166	227	Sari Sari Store		2015-02-11 06:35:26.389454	2015-02-11 06:35:26.389454
167	290	Women's Organization		2015-02-11 06:52:48.155891	2015-02-11 06:52:48.155891
168	198	Sari Sari Store		2015-02-16 02:26:09.963594	2015-02-16 02:26:09.963594
169	278	Sari Sari Store		2015-02-16 02:39:16.224431	2015-02-16 02:39:16.224431
170	265	Sari Sari Store		2015-02-16 03:48:08.561311	2015-02-16 03:48:08.561311
171	291	Sari Sari Store		2015-02-16 03:58:06.058876	2015-02-16 03:58:06.058876
172	182	Sari Sari Store		2015-02-17 03:07:27.223524	2015-02-17 03:07:27.223524
173	207	Sari Sari Store		2015-02-17 03:20:53.488467	2015-02-17 03:20:53.488467
\.


--
-- Name: line_of_businesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('line_of_businesses_id_seq', 173, true);


--
-- Data for Name: mayors_permit_fees; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mayors_permit_fees (id, amount, business_id, created_at, updated_at) FROM stdin;
1	1600.0	1	2015-01-26 04:24:58.179451	2015-01-26 04:24:58.179451
2	600.0	1	2015-01-26 04:27:18.753352	2015-01-26 04:27:18.753352
3	600.0	2	2015-01-26 04:40:55.421974	2015-01-26 04:40:55.421974
4	600.0	2	2015-01-26 04:44:40.892439	2015-01-26 04:44:40.892439
5	600.0	2	2015-01-26 04:47:04.056231	2015-01-26 04:47:04.056231
6	600.0	2	2015-01-26 04:47:17.455729	2015-01-26 04:47:17.455729
7	600.0	2	2015-01-26 04:47:28.763983	2015-01-26 04:47:28.763983
8	600.0	2	2015-01-26 04:49:11.087729	2015-01-26 04:49:11.087729
9	600.0	2	2015-01-26 04:51:04.126383	2015-01-26 04:51:04.126383
10	600.0	3	2015-01-26 05:04:06.720616	2015-01-26 05:04:06.720616
11	900.0	3	2015-01-26 05:04:24.17797	2015-01-26 05:04:24.17797
12	900.0	3	2015-01-26 05:05:07.135369	2015-01-26 05:05:07.135369
13	600.0	2	2015-01-26 05:31:35.248081	2015-01-26 05:31:35.248081
14	600.0	4	2015-01-26 05:37:19.257774	2015-01-26 05:37:19.257774
15	600.0	4	2015-01-26 05:37:33.224086	2015-01-26 05:37:33.224086
16	600.0	4	2015-01-26 05:37:43.865439	2015-01-26 05:37:43.865439
17	600.0	4	2015-01-26 05:37:58.85694	2015-01-26 05:37:58.85694
18	600.0	4	2015-01-26 05:38:10.265265	2015-01-26 05:38:10.265265
19	600.0	5	2015-01-26 05:43:27.034314	2015-01-26 05:43:27.034314
20	600.0	5	2015-01-26 05:43:49.950436	2015-01-26 05:43:49.950436
21	600.0	5	2015-01-26 05:44:01.025791	2015-01-26 05:44:01.025791
22	600.0	4	2015-01-26 05:58:30.783788	2015-01-26 05:58:30.783788
23	600.0	4	2015-01-26 06:00:13.1322	2015-01-26 06:00:13.1322
24	600.0	4	2015-01-26 06:00:19.857436	2015-01-26 06:00:19.857436
25	600.0	6	2015-01-26 06:24:13.342693	2015-01-26 06:24:13.342693
26	600.0	6	2015-01-26 06:24:23.080678	2015-01-26 06:24:23.080678
27	600.0	6	2015-01-26 06:24:38.406362	2015-01-26 06:24:38.406362
28	600.0	6	2015-01-26 06:24:48.721587	2015-01-26 06:24:48.721587
29	600.0	6	2015-01-26 06:24:59.830111	2015-01-26 06:24:59.830111
30	600.0	6	2015-01-26 06:25:11.346164	2015-01-26 06:25:11.346164
31	600.0	6	2015-01-26 06:25:31.696025	2015-01-26 06:25:31.696025
32	600.0	6	2015-01-26 06:25:42.120351	2015-01-26 06:25:42.120351
33	600.0	6	2015-01-26 06:25:52.611447	2015-01-26 06:25:52.611447
34	600.0	6	2015-01-26 06:26:03.669627	2015-01-26 06:26:03.669627
35	600.0	6	2015-01-26 06:26:12.086611	2015-01-26 06:26:12.086611
36	600.0	7	2015-01-26 06:45:11.123757	2015-01-26 06:45:11.123757
37	600.0	7	2015-01-26 06:45:35.066364	2015-01-26 06:45:35.066364
38	600.0	7	2015-01-26 06:48:15.804399	2015-01-26 06:48:15.804399
39	600.0	8	2015-01-26 07:06:49.433949	2015-01-26 07:06:49.433949
40	600.0	8	2015-01-26 07:06:58.491731	2015-01-26 07:06:58.491731
41	600.0	8	2015-01-26 07:07:12.391541	2015-01-26 07:07:12.391541
42	600.0	8	2015-01-26 07:07:27.466725	2015-01-26 07:07:27.466725
43	600.0	8	2015-01-26 07:07:39.199332	2015-01-26 07:07:39.199332
44	600.0	8	2015-01-26 07:07:55.115961	2015-01-26 07:07:55.115961
45	600.0	9	2015-01-26 07:34:12.739965	2015-01-26 07:34:12.739965
46	600.0	10	2015-01-26 07:45:27.314391	2015-01-26 07:45:27.314391
47	600.0	10	2015-01-26 07:48:26.210954	2015-01-26 07:48:26.210954
48	600.0	10	2015-01-26 07:48:36.302549	2015-01-26 07:48:36.302549
49	600.0	10	2015-01-26 08:15:35.597543	2015-01-26 08:15:35.597543
50	600.0	11	2015-01-26 08:22:35.681984	2015-01-26 08:22:35.681984
51	600.0	12	2015-01-26 08:50:57.891791	2015-01-26 08:50:57.891791
52	600.0	12	2015-01-26 08:51:10.499532	2015-01-26 08:51:10.499532
53	600.0	13	2015-01-26 08:56:59.060971	2015-01-26 08:56:59.060971
54	600.0	13	2015-01-26 08:58:05.817864	2015-01-26 08:58:05.817864
55	1200.0	14	2015-01-26 09:21:27.299205	2015-01-26 09:21:27.299205
56	1200.0	14	2015-01-26 09:22:05.1499	2015-01-26 09:22:05.1499
57	600.0	14	2015-01-26 09:23:42.972474	2015-01-26 09:23:42.972474
58	900.0	14	2015-01-26 09:23:51.938746	2015-01-26 09:23:51.938746
59	900.0	14	2015-01-26 09:24:13.188448	2015-01-26 09:24:13.188448
60	900.0	14	2015-01-26 09:24:30.988461	2015-01-26 09:24:30.988461
61	900.0	14	2015-01-26 09:24:39.505169	2015-01-26 09:24:39.505169
62	900.0	14	2015-01-26 09:24:51.34684	2015-01-26 09:24:51.34684
63	900.0	14	2015-01-26 09:25:05.629691	2015-01-26 09:25:05.629691
64	900.0	14	2015-01-26 09:25:20.929421	2015-01-26 09:25:20.929421
65	900.0	14	2015-01-26 09:25:31.31242	2015-01-26 09:25:31.31242
66	900.0	14	2015-01-26 09:25:46.854016	2015-01-26 09:25:46.854016
67	900.0	14	2015-01-26 09:25:59.128578	2015-01-26 09:25:59.128578
68	1600.0	15	2015-01-27 01:00:01.632564	2015-01-27 01:00:01.632564
69	2000.0	15	2015-01-27 01:04:52.526786	2015-01-27 01:04:52.526786
70	3000.0	15	2015-01-27 01:05:20.151299	2015-01-27 01:05:20.151299
71	3000.0	15	2015-01-27 01:14:39.15981	2015-01-27 01:14:39.15981
72	3000.0	15	2015-01-27 01:14:39.167139	2015-01-27 01:14:39.167139
73	3000.0	15	2015-01-27 01:17:49.522444	2015-01-27 01:17:49.522444
74	3000.0	15	2015-01-27 01:19:03.963225	2015-01-27 01:19:03.963225
75	3000.0	15	2015-01-27 01:20:33.678614	2015-01-27 01:20:33.678614
76	3000.0	15	2015-01-27 01:27:40.122353	2015-01-27 01:27:40.122353
77	1200.0	16	2015-01-27 02:23:12.903726	2015-01-27 02:23:12.903726
78	1200.0	16	2015-01-27 02:23:33.44858	2015-01-27 02:23:33.44858
79	600.0	17	2015-01-27 02:30:09.055656	2015-01-27 02:30:09.055656
80	600.0	17	2015-01-27 02:30:16.371761	2015-01-27 02:30:16.371761
81	600.0	18	2015-01-27 02:34:01.627226	2015-01-27 02:34:01.627226
82	1200.0	16	2015-01-27 02:35:01.4677	2015-01-27 02:35:01.4677
83	600.0	19	2015-01-27 02:37:18.208273	2015-01-27 02:37:18.208273
84	600.0	19	2015-01-27 02:37:52.598177	2015-01-27 02:37:52.598177
85	600.0	20	2015-01-27 02:44:18.501264	2015-01-27 02:44:18.501264
86	600.0	21	2015-01-27 02:57:43.354557	2015-01-27 02:57:43.354557
87	600.0	22	2015-01-27 03:12:20.932968	2015-01-27 03:12:20.932968
88	600.0	22	2015-01-27 03:12:59.891061	2015-01-27 03:12:59.891061
89	600.0	22	2015-01-27 03:13:11.716489	2015-01-27 03:13:11.716489
90	600.0	22	2015-01-27 03:13:21.741055	2015-01-27 03:13:21.741055
91	600.0	22	2015-01-27 03:13:30.224322	2015-01-27 03:13:30.224322
92	600.0	22	2015-01-27 03:13:37.424152	2015-01-27 03:13:37.424152
93	600.0	22	2015-01-27 03:13:44.907436	2015-01-27 03:13:44.907436
94	600.0	22	2015-01-27 03:13:56.607326	2015-01-27 03:13:56.607326
95	600.0	23	2015-01-27 03:18:29.136661	2015-01-27 03:18:29.136661
96	600.0	24	2015-01-27 03:22:43.682807	2015-01-27 03:22:43.682807
97	900.0	24	2015-01-27 03:23:10.240878	2015-01-27 03:23:10.240878
98	600.0	25	2015-01-27 03:58:50.415672	2015-01-27 03:58:50.415672
99	600.0	25	2015-01-27 03:58:57.740579	2015-01-27 03:58:57.740579
100	600.0	25	2015-01-27 03:59:09.748154	2015-01-27 03:59:09.748154
101	600.0	25	2015-01-27 03:59:20.464455	2015-01-27 03:59:20.464455
102	600.0	26	2015-01-27 04:02:11.937035	2015-01-27 04:02:11.937035
103	600.0	26	2015-01-27 04:02:16.62075	2015-01-27 04:02:16.62075
104	600.0	26	2015-01-27 04:02:25.244906	2015-01-27 04:02:25.244906
105	600.0	26	2015-01-27 04:02:32.670581	2015-01-27 04:02:32.670581
106	600.0	26	2015-01-27 04:02:42.502858	2015-01-27 04:02:42.502858
107	600.0	26	2015-01-27 04:02:48.911742	2015-01-27 04:02:48.911742
108	600.0	27	2015-01-27 05:52:37.459395	2015-01-27 05:52:37.459395
109	600.0	27	2015-01-27 05:52:51.484104	2015-01-27 05:52:51.484104
141	600.0	60	2015-01-27 07:07:42.608237	2015-01-27 07:07:42.608237
142	3000.0	15	2015-01-27 08:23:57.373761	2015-01-27 08:23:57.373761
143	600.0	61	2015-01-28 00:48:09.271777	2015-01-28 00:48:09.271777
144	600.0	61	2015-01-28 00:49:22.745118	2015-01-28 00:49:22.745118
145	600.0	62	2015-01-28 02:12:05.307255	2015-01-28 02:12:05.307255
146	600.0	62	2015-01-28 02:12:13.074618	2015-01-28 02:12:13.074618
147	600.0	63	2015-01-28 02:14:56.730166	2015-01-28 02:14:56.730166
148	600.0	64	2015-01-28 02:17:13.552446	2015-01-28 02:17:13.552446
149	600.0	64	2015-01-28 02:17:19.403158	2015-01-28 02:17:19.403158
150	600.0	62	2015-01-28 02:22:18.048108	2015-01-28 02:22:18.048108
151	600.0	65	2015-01-28 02:23:54.555541	2015-01-28 02:23:54.555541
152	600.0	65	2015-01-28 02:24:22.272007	2015-01-28 02:24:22.272007
153	600.0	65	2015-01-28 02:24:31.855704	2015-01-28 02:24:31.855704
154	600.0	65	2015-01-28 02:24:41.838497	2015-01-28 02:24:41.838497
155	600.0	6	2015-01-28 02:25:55.636008	2015-01-28 02:25:55.636008
156	600.0	66	2015-01-28 02:28:35.300591	2015-01-28 02:28:35.300591
157	1200.0	66	2015-01-28 02:29:18.076365	2015-01-28 02:29:18.076365
158	1200.0	66	2015-01-28 02:29:38.514332	2015-01-28 02:29:38.514332
159	600.0	67	2015-01-28 02:32:50.356015	2015-01-28 02:32:50.356015
160	1600.0	68	2015-01-28 02:41:34.947983	2015-01-28 02:41:34.947983
161	600.0	69	2015-01-28 02:44:41.34457	2015-01-28 02:44:41.34457
162	600.0	70	2015-01-28 02:47:21.8679	2015-01-28 02:47:21.8679
163	600.0	70	2015-01-28 02:48:00.216647	2015-01-28 02:48:00.216647
164	600.0	70	2015-01-28 02:48:14.392233	2015-01-28 02:48:14.392233
165	600.0	70	2015-01-28 02:48:24.41701	2015-01-28 02:48:24.41701
166	600.0	70	2015-01-28 02:48:33.316036	2015-01-28 02:48:33.316036
167	600.0	70	2015-01-28 02:48:44.953373	2015-01-28 02:48:44.953373
168	600.0	70	2015-01-28 02:49:17.358005	2015-01-28 02:49:17.358005
169	900.0	70	2015-01-28 02:49:34.116036	2015-01-28 02:49:34.116036
170	900.0	70	2015-01-28 02:49:49.640586	2015-01-28 02:49:49.640586
171	900.0	70	2015-01-28 02:50:01.39885	2015-01-28 02:50:01.39885
172	900.0	70	2015-01-28 02:50:15.081951	2015-01-28 02:50:15.081951
173	900.0	71	2015-01-28 02:52:38.330244	2015-01-28 02:52:38.330244
174	600.0	72	2015-01-28 02:54:45.027495	2015-01-28 02:54:45.027495
175	600.0	73	2015-01-28 02:58:00.584159	2015-01-28 02:58:00.584159
176	600.0	73	2015-01-28 02:58:09.066936	2015-01-28 02:58:09.066936
177	600.0	73	2015-01-28 02:58:19.250177	2015-01-28 02:58:19.250177
178	600.0	73	2015-01-28 02:58:28.575025	2015-01-28 02:58:28.575025
179	1600.0	74	2015-01-28 03:02:26.728988	2015-01-28 03:02:26.728988
180	1600.0	74	2015-01-28 03:02:38.487809	2015-01-28 03:02:38.487809
181	1600.0	75	2015-01-28 03:09:16.823099	2015-01-28 03:09:16.823099
182	1600.0	75	2015-01-28 03:09:33.064278	2015-01-28 03:09:33.064278
183	1600.0	75	2015-01-28 03:09:49.439971	2015-01-28 03:09:49.439971
184	1600.0	75	2015-01-28 03:10:02.83981	2015-01-28 03:10:02.83981
185	1600.0	75	2015-01-28 03:10:11.956365	2015-01-28 03:10:11.956365
186	1600.0	75	2015-01-28 03:10:22.114575	2015-01-28 03:10:22.114575
187	600.0	76	2015-01-28 03:38:43.548857	2015-01-28 03:38:43.548857
188	600.0	76	2015-01-28 03:58:09.185371	2015-01-28 03:58:09.185371
189	1600.0	74	2015-01-28 04:50:04.004627	2015-01-28 04:50:04.004627
190	1600.0	74	2015-01-28 04:50:19.036725	2015-01-28 04:50:19.036725
191	1600.0	74	2015-01-28 04:50:28.444942	2015-01-28 04:50:28.444942
192	1600.0	74	2015-01-28 04:51:06.236161	2015-01-28 04:51:06.236161
193	1600.0	74	2015-01-28 04:51:19.26033	2015-01-28 04:51:19.26033
194	600.0	77	2015-01-28 04:54:21.949112	2015-01-28 04:54:21.949112
195	600.0	77	2015-01-28 04:54:37.90754	2015-01-28 04:54:37.90754
196	900.0	77	2015-01-28 04:54:57.640379	2015-01-28 04:54:57.640379
197	600.0	78	2015-01-28 04:58:46.269074	2015-01-28 04:58:46.269074
198	1600.0	79	2015-01-28 05:05:02.138317	2015-01-28 05:05:02.138317
199	600.0	79	2015-01-28 05:06:26.929004	2015-01-28 05:06:26.929004
200	600.0	79	2015-01-28 05:06:45.361702	2015-01-28 05:06:45.361702
201	600.0	79	2015-01-28 05:10:14.273514	2015-01-28 05:10:14.273514
202	600.0	79	2015-01-28 05:10:32.399124	2015-01-28 05:10:32.399124
203	1200.0	79	2015-01-28 05:13:27.847375	2015-01-28 05:13:27.847375
204	1200.0	79	2015-01-28 05:13:46.138793	2015-01-28 05:13:46.138793
205	1200.0	79	2015-01-28 05:14:01.280315	2015-01-28 05:14:01.280315
206	1200.0	79	2015-01-28 05:14:11.804215	2015-01-28 05:14:11.804215
207	1200.0	79	2015-01-28 05:14:18.954046	2015-01-28 05:14:18.954046
208	1200.0	79	2015-01-28 05:14:26.129567	2015-01-28 05:14:26.129567
209	600.0	80	2015-01-28 05:18:23.417149	2015-01-28 05:18:23.417149
210	600.0	80	2015-01-28 05:18:53.515976	2015-01-28 05:18:53.515976
211	600.0	80	2015-01-28 05:19:08.708428	2015-01-28 05:19:08.708428
212	600.0	80	2015-01-28 05:19:18.050368	2015-01-28 05:19:18.050368
213	900.0	80	2015-01-28 05:19:37.191595	2015-01-28 05:19:37.191595
214	900.0	81	2015-01-28 05:22:56.862553	2015-01-28 05:22:56.862553
215	1400.0	81	2015-01-28 05:23:14.238684	2015-01-28 05:23:14.238684
216	600.0	82	2015-01-28 05:29:25.606802	2015-01-28 05:29:25.606802
217	600.0	82	2015-01-28 05:32:40.186409	2015-01-28 05:32:40.186409
218	600.0	83	2015-01-28 05:52:22.015477	2015-01-28 05:52:22.015477
219	1200.0	84	2015-01-28 06:03:45.586269	2015-01-28 06:03:45.586269
220	600.0	84	2015-01-28 06:04:05.419219	2015-01-28 06:04:05.419219
221	600.0	61	2015-01-28 06:17:09.149656	2015-01-28 06:17:09.149656
222	600.0	85	2015-01-28 06:21:12.809389	2015-01-28 06:21:12.809389
223	600.0	86	2015-01-28 06:24:21.84844	2015-01-28 06:24:21.84844
224	600.0	86	2015-01-28 06:25:02.981155	2015-01-28 06:25:02.981155
225	600.0	87	2015-01-28 06:29:09.517822	2015-01-28 06:29:09.517822
226	600.0	87	2015-01-28 06:29:22.535267	2015-01-28 06:29:22.535267
227	600.0	87	2015-01-28 06:29:32.484894	2015-01-28 06:29:32.484894
228	600.0	87	2015-01-28 06:29:41.659762	2015-01-28 06:29:41.659762
229	600.0	87	2015-01-28 06:29:52.001301	2015-01-28 06:29:52.001301
230	600.0	88	2015-01-28 06:36:06.35578	2015-01-28 06:36:06.35578
231	600.0	88	2015-01-28 06:36:26.569363	2015-01-28 06:36:26.569363
232	600.0	88	2015-01-28 06:36:34.160432	2015-01-28 06:36:34.160432
233	900.0	89	2015-01-28 06:40:29.274025	2015-01-28 06:40:29.274025
234	900.0	89	2015-01-28 06:40:36.182047	2015-01-28 06:40:36.182047
235	900.0	89	2015-01-28 06:40:46.431412	2015-01-28 06:40:46.431412
236	900.0	89	2015-01-28 06:41:09.87345	2015-01-28 06:41:09.87345
237	1400.0	89	2015-01-28 06:41:51.655399	2015-01-28 06:41:51.655399
238	1400.0	89	2015-01-28 06:42:11.639044	2015-01-28 06:42:11.639044
239	1400.0	89	2015-01-28 06:45:04.868641	2015-01-28 06:45:04.868641
240	1400.0	89	2015-01-28 06:45:23.4772	2015-01-28 06:45:23.4772
241	600.0	90	2015-01-28 06:48:20.7737	2015-01-28 06:48:20.7737
242	600.0	90	2015-01-28 06:48:28.157773	2015-01-28 06:48:28.157773
243	600.0	90	2015-01-28 06:48:37.882367	2015-01-28 06:48:37.882367
244	600.0	91	2015-01-28 06:50:52.4472	2015-01-28 06:50:52.4472
245	600.0	91	2015-01-28 06:50:58.796478	2015-01-28 06:50:58.796478
246	600.0	91	2015-01-28 06:51:08.65479	2015-01-28 06:51:08.65479
247	600.0	92	2015-01-28 06:58:06.606159	2015-01-28 06:58:06.606159
248	600.0	92	2015-01-28 06:58:20.85565	2015-01-28 06:58:20.85565
249	600.0	93	2015-01-28 07:13:59.038374	2015-01-28 07:13:59.038374
250	600.0	94	2015-01-28 07:16:37.094851	2015-01-28 07:16:37.094851
251	600.0	94	2015-01-28 07:16:52.744495	2015-01-28 07:16:52.744495
252	600.0	94	2015-01-28 07:18:34.102936	2015-01-28 07:18:34.102936
253	600.0	95	2015-01-28 07:35:55.074453	2015-01-28 07:35:55.074453
254	600.0	95	2015-01-28 07:36:05.007215	2015-01-28 07:36:05.007215
255	600.0	95	2015-01-28 07:36:13.665374	2015-01-28 07:36:13.665374
256	600.0	95	2015-01-28 07:36:20.032672	2015-01-28 07:36:20.032672
257	600.0	95	2015-01-28 07:36:27.131575	2015-01-28 07:36:27.131575
258	600.0	95	2015-01-28 07:36:34.215294	2015-01-28 07:36:34.215294
259	600.0	96	2015-01-28 07:52:02.302338	2015-01-28 07:52:02.302338
260	600.0	96	2015-01-28 07:52:09.425304	2015-01-28 07:52:09.425304
261	600.0	96	2015-01-28 07:55:12.78122	2015-01-28 07:55:12.78122
262	600.0	96	2015-01-28 07:55:23.630624	2015-01-28 07:55:23.630624
263	600.0	97	2015-01-28 08:04:10.129899	2015-01-28 08:04:10.129899
264	600.0	97	2015-01-28 08:04:20.787508	2015-01-28 08:04:20.787508
265	600.0	97	2015-01-28 08:04:33.362865	2015-01-28 08:04:33.362865
266	600.0	98	2015-01-28 08:19:31.680216	2015-01-28 08:19:31.680216
267	600.0	98	2015-01-28 08:19:44.238333	2015-01-28 08:19:44.238333
268	600.0	98	2015-01-28 08:22:50.518283	2015-01-28 08:22:50.518283
269	600.0	99	2015-01-28 08:45:14.303099	2015-01-28 08:45:14.303099
270	600.0	99	2015-01-28 08:45:28.561222	2015-01-28 08:45:28.561222
271	600.0	99	2015-01-28 08:45:41.227307	2015-01-28 08:45:41.227307
272	600.0	99	2015-01-28 08:46:24.093224	2015-01-28 08:46:24.093224
273	600.0	99	2015-01-28 08:46:42.800955	2015-01-28 08:46:42.800955
274	1200.0	100	2015-01-28 09:06:48.304958	2015-01-28 09:06:48.304958
275	1200.0	100	2015-01-28 09:07:03.134292	2015-01-28 09:07:03.134292
276	1200.0	100	2015-01-28 09:09:41.739399	2015-01-28 09:09:41.739399
277	1200.0	100	2015-01-28 09:09:50.405851	2015-01-28 09:09:50.405851
278	1600.0	101	2015-01-29 00:23:10.491203	2015-01-29 00:23:10.491203
279	1600.0	101	2015-01-29 00:23:31.741176	2015-01-29 00:23:31.741176
280	1600.0	101	2015-01-29 00:23:45.092193	2015-01-29 00:23:45.092193
281	1600.0	101	2015-01-29 00:24:16.108293	2015-01-29 00:24:16.108293
282	1600.0	101	2015-01-29 00:25:00.165065	2015-01-29 00:25:00.165065
283	1600.0	101	2015-01-29 00:25:31.515505	2015-01-29 00:25:31.515505
284	1600.0	101	2015-01-29 00:25:48.748371	2015-01-29 00:25:48.748371
285	1500.0	102	2015-01-29 00:33:48.091601	2015-01-29 00:33:48.091601
286	2500.0	102	2015-01-29 00:34:00.387891	2015-01-29 00:34:00.387891
287	2500.0	102	2015-01-29 00:34:19.232336	2015-01-29 00:34:19.232336
288	2500.0	102	2015-01-29 00:34:25.67409	2015-01-29 00:34:25.67409
289	2500.0	102	2015-01-29 00:35:12.548575	2015-01-29 00:35:12.548575
290	600.0	103	2015-01-29 00:37:55.596432	2015-01-29 00:37:55.596432
291	600.0	103	2015-01-29 00:38:05.621127	2015-01-29 00:38:05.621127
292	900.0	103	2015-01-29 00:38:31.245143	2015-01-29 00:38:31.245143
293	600.0	104	2015-01-29 00:43:53.490528	2015-01-29 00:43:53.490528
294	600.0	104	2015-01-29 00:43:59.558108	2015-01-29 00:43:59.558108
295	600.0	104	2015-01-29 00:44:09.640463	2015-01-29 00:44:09.640463
296	900.0	105	2015-01-29 00:46:25.513793	2015-01-29 00:46:25.513793
297	900.0	105	2015-01-29 00:46:37.674158	2015-01-29 00:46:37.674158
298	600.0	106	2015-01-29 00:49:34.029628	2015-01-29 00:49:34.029628
299	600.0	106	2015-01-29 00:49:41.438096	2015-01-29 00:49:41.438096
300	600.0	107	2015-01-29 00:55:32.374598	2015-01-29 00:55:32.374598
301	600.0	108	2015-01-29 00:56:50.732391	2015-01-29 00:56:50.732391
302	600.0	109	2015-01-29 00:59:30.930819	2015-01-29 00:59:30.930819
303	600.0	109	2015-01-29 00:59:36.4388	2015-01-29 00:59:36.4388
304	900.0	110	2015-01-29 01:03:27.169155	2015-01-29 01:03:27.169155
305	900.0	111	2015-01-29 01:03:33.576421	2015-01-29 01:03:33.576421
306	900.0	111	2015-01-29 01:03:48.885276	2015-01-29 01:03:48.885276
307	900.0	111	2015-01-29 01:04:13.176016	2015-01-29 01:04:13.176016
308	600.0	112	2015-01-29 01:07:59.348789	2015-01-29 01:07:59.348789
309	600.0	112	2015-01-29 01:08:16.38139	2015-01-29 01:08:16.38139
310	600.0	112	2015-01-29 01:15:48.43202	2015-01-29 01:15:48.43202
311	600.0	113	2015-01-29 01:17:58.182289	2015-01-29 01:17:58.182289
312	600.0	114	2015-01-29 01:20:28.255109	2015-01-29 01:20:28.255109
313	600.0	114	2015-01-29 01:20:37.180078	2015-01-29 01:20:37.180078
314	3000.0	15	2015-01-29 01:23:29.868666	2015-01-29 01:23:29.868666
315	3000.0	15	2015-01-29 01:23:41.644074	2015-01-29 01:23:41.644074
316	3000.0	15	2015-01-29 01:24:19.059017	2015-01-29 01:24:19.059017
317	3000.0	15	2015-01-29 01:25:17.133953	2015-01-29 01:25:17.133953
318	3000.0	15	2015-01-29 01:25:28.05128	2015-01-29 01:25:28.05128
319	3000.0	15	2015-01-29 01:25:37.583331	2015-01-29 01:25:37.583331
320	600.0	115	2015-01-29 01:28:25.724185	2015-01-29 01:28:25.724185
321	600.0	116	2015-01-29 01:45:07.692738	2015-01-29 01:45:07.692738
322	600.0	117	2015-01-29 01:53:38.341896	2015-01-29 01:53:38.341896
323	600.0	118	2015-01-29 01:54:34.283687	2015-01-29 01:54:34.283687
324	3000.0	119	2015-01-29 02:10:28.403588	2015-01-29 02:10:28.403588
325	3000.0	119	2015-01-29 02:11:39.832292	2015-01-29 02:11:39.832292
326	1200.0	120	2015-01-29 02:15:31.932342	2015-01-29 02:15:31.932342
327	600.0	121	2015-01-29 02:19:04.45504	2015-01-29 02:19:04.45504
328	600.0	122	2015-01-29 03:10:08.814975	2015-01-29 03:10:08.814975
329	600.0	122	2015-01-29 03:10:14.34189	2015-01-29 03:10:14.34189
330	600.0	123	2015-01-29 03:42:31.156133	2015-01-29 03:42:31.156133
331	600.0	124	2015-01-29 05:20:01.930805	2015-01-29 05:20:01.930805
332	600.0	124	2015-01-29 05:20:06.99733	2015-01-29 05:20:06.99733
333	600.0	125	2015-01-29 06:29:38.515226	2015-01-29 06:29:38.515226
334	600.0	125	2015-01-29 06:29:50.683665	2015-01-29 06:29:50.683665
335	600.0	125	2015-01-29 06:30:08.042105	2015-01-29 06:30:08.042105
336	600.0	125	2015-01-29 06:30:15.108095	2015-01-29 06:30:15.108095
337	600.0	125	2015-01-29 06:31:04.324604	2015-01-29 06:31:04.324604
338	600.0	126	2015-01-29 06:43:51.897137	2015-01-29 06:43:51.897137
339	600.0	126	2015-01-29 06:44:18.163501	2015-01-29 06:44:18.163501
340	600.0	127	2015-01-29 07:24:16.720292	2015-01-29 07:24:16.720292
341	600.0	127	2015-01-29 07:24:33.269709	2015-01-29 07:24:33.269709
342	600.0	128	2015-01-29 07:27:19.366696	2015-01-29 07:27:19.366696
343	600.0	128	2015-01-29 07:27:28.525815	2015-01-29 07:27:28.525815
344	600.0	128	2015-01-29 07:27:38.53395	2015-01-29 07:27:38.53395
345	600.0	128	2015-01-29 07:27:46.150644	2015-01-29 07:27:46.150644
346	600.0	128	2015-01-29 07:27:54.958067	2015-01-29 07:27:54.958067
347	600.0	128	2015-01-29 07:28:02.62544	2015-01-29 07:28:02.62544
348	600.0	129	2015-01-29 07:29:38.024585	2015-01-29 07:29:38.024585
349	600.0	129	2015-01-29 07:29:42.848167	2015-01-29 07:29:42.848167
350	600.0	130	2015-01-29 07:41:00.264324	2015-01-29 07:41:00.264324
351	600.0	130	2015-01-29 07:41:11.8587	2015-01-29 07:41:11.8587
352	600.0	130	2015-01-29 07:41:18.564249	2015-01-29 07:41:18.564249
353	600.0	131	2015-01-29 07:47:35.266946	2015-01-29 07:47:35.266946
354	600.0	131	2015-01-29 07:47:58.300882	2015-01-29 07:47:58.300882
355	600.0	131	2015-01-29 07:51:04.0224	2015-01-29 07:51:04.0224
356	600.0	132	2015-01-29 08:01:59.088569	2015-01-29 08:01:59.088569
357	600.0	132	2015-01-29 08:02:05.164045	2015-01-29 08:02:05.164045
358	600.0	133	2015-01-29 08:08:04.141937	2015-01-29 08:08:04.141937
359	600.0	133	2015-01-29 08:08:16.359169	2015-01-29 08:08:16.359169
360	600.0	134	2015-01-29 08:16:27.551374	2015-01-29 08:16:27.551374
361	600.0	134	2015-01-29 08:16:44.127344	2015-01-29 08:16:44.127344
362	600.0	135	2015-01-29 08:22:02.147025	2015-01-29 08:22:02.147025
363	600.0	135	2015-01-29 08:22:14.239517	2015-01-29 08:22:14.239517
364	600.0	136	2015-01-29 08:24:48.13698	2015-01-29 08:24:48.13698
365	600.0	136	2015-01-29 08:25:01.845004	2015-01-29 08:25:01.845004
366	600.0	137	2015-01-29 08:57:55.558468	2015-01-29 08:57:55.558468
367	600.0	138	2015-01-29 09:08:49.799042	2015-01-29 09:08:49.799042
368	1200.0	139	2015-01-30 00:31:47.204064	2015-01-30 00:31:47.204064
369	1200.0	139	2015-01-30 00:32:03.004877	2015-01-30 00:32:03.004877
370	1200.0	139	2015-01-30 00:32:13.055103	2015-01-30 00:32:13.055103
371	1200.0	139	2015-01-30 00:32:24.638458	2015-01-30 00:32:24.638458
372	1200.0	139	2015-01-30 00:32:36.096726	2015-01-30 00:32:36.096726
373	1200.0	139	2015-01-30 00:32:47.638954	2015-01-30 00:32:47.638954
374	1200.0	139	2015-01-30 00:33:02.529933	2015-01-30 00:33:02.529933
375	1200.0	139	2015-01-30 00:33:16.79583	2015-01-30 00:33:16.79583
376	1200.0	139	2015-01-30 00:33:29.79599	2015-01-30 00:33:29.79599
377	600.0	140	2015-01-30 01:26:46.272215	2015-01-30 01:26:46.272215
378	600.0	140	2015-01-30 01:26:50.793395	2015-01-30 01:26:50.793395
379	600.0	141	2015-01-30 01:50:32.753214	2015-01-30 01:50:32.753214
380	600.0	141	2015-01-30 01:50:37.594343	2015-01-30 01:50:37.594343
381	600.0	142	2015-01-30 02:48:26.626121	2015-01-30 02:48:26.626121
382	600.0	142	2015-01-30 02:48:32.75024	2015-01-30 02:48:32.75024
383	600.0	142	2015-01-30 02:48:42.883347	2015-01-30 02:48:42.883347
384	1500.0	143	2015-01-30 03:22:04.175634	2015-01-30 03:22:04.175634
385	1400.0	144	2015-01-30 03:29:05.687115	2015-01-30 03:29:05.687115
386	900.0	145	2015-01-30 03:33:59.541397	2015-01-30 03:33:59.541397
387	1400.0	146	2015-01-30 03:41:50.417729	2015-01-30 03:41:50.417729
388	600.0	147	2015-01-30 03:48:58.668453	2015-01-30 03:48:58.668453
389	1400.0	146	2015-01-30 05:02:34.057094	2015-01-30 05:02:34.057094
390	1400.0	146	2015-01-30 05:03:59.44085	2015-01-30 05:03:59.44085
391	3000.0	146	2015-01-30 05:04:09.315925	2015-01-30 05:04:09.315925
392	900.0	146	2015-01-30 05:05:51.11452	2015-01-30 05:05:51.11452
393	900.0	146	2015-01-30 05:10:25.765561	2015-01-30 05:10:25.765561
394	600.0	148	2015-01-30 06:20:10.389442	2015-01-30 06:20:10.389442
395	600.0	149	2015-01-30 06:29:32.355539	2015-01-30 06:29:32.355539
396	600.0	150	2015-01-30 06:39:07.363281	2015-01-30 06:39:07.363281
397	600.0	151	2015-01-30 06:41:12.336196	2015-01-30 06:41:12.336196
398	600.0	152	2015-01-30 07:14:37.726128	2015-01-30 07:14:37.726128
399	600.0	153	2015-01-30 07:24:13.380577	2015-01-30 07:24:13.380577
400	600.0	154	2015-01-30 07:35:06.487638	2015-01-30 07:35:06.487638
401	600.0	154	2015-01-30 07:35:22.838255	2015-01-30 07:35:22.838255
402	600.0	150	2015-01-30 08:22:37.500454	2015-01-30 08:22:37.500454
403	3000.0	150	2015-01-30 08:25:37.449592	2015-01-30 08:25:37.449592
404	1600.0	155	2015-02-02 00:13:42.289486	2015-02-02 00:13:42.289486
405	1600.0	155	2015-02-02 00:13:55.98942	2015-02-02 00:13:55.98942
406	1600.0	155	2015-02-02 00:14:05.297978	2015-02-02 00:14:05.297978
407	1600.0	155	2015-02-02 00:14:32.255236	2015-02-02 00:14:32.255236
408	1600.0	155	2015-02-02 00:14:40.538836	2015-02-02 00:14:40.538836
409	1600.0	155	2015-02-02 00:14:49.939176	2015-02-02 00:14:49.939176
410	600.0	156	2015-02-02 00:22:50.036575	2015-02-02 00:22:50.036575
411	600.0	156	2015-02-02 00:22:55.239977	2015-02-02 00:22:55.239977
412	600.0	157	2015-02-02 02:26:01.445699	2015-02-02 02:26:01.445699
413	600.0	158	2015-02-02 06:05:07.67712	2015-02-02 06:05:07.67712
414	600.0	158	2015-02-02 06:05:12.56947	2015-02-02 06:05:12.56947
415	600.0	159	2015-02-02 06:58:34.506156	2015-02-02 06:58:34.506156
416	3000.0	119	2015-02-02 07:01:43.922638	2015-02-02 07:01:43.922638
417	3000.0	119	2015-02-02 07:01:43.955488	2015-02-02 07:01:43.955488
418	3000.0	119	2015-02-02 07:02:03.597604	2015-02-02 07:02:03.597604
419	600.0	119	2015-02-02 07:02:18.938268	2015-02-02 07:02:18.938268
420	600.0	119	2015-02-02 07:03:07.988178	2015-02-02 07:03:07.988178
421	600.0	160	2015-02-03 01:32:37.910957	2015-02-03 01:32:37.910957
422	600.0	160	2015-02-03 01:32:55.927665	2015-02-03 01:32:55.927665
423	1200.0	120	2015-02-03 07:36:06.895968	2015-02-03 07:36:06.895968
424	1200.0	120	2015-02-03 07:41:10.384457	2015-02-03 07:41:10.384457
425	600.0	161	2015-02-03 09:13:25.183997	2015-02-03 09:13:25.183997
426	600.0	162	2015-02-03 09:16:25.4489	2015-02-03 09:16:25.4489
427	600.0	117	2015-02-04 00:07:13.182114	2015-02-04 00:07:13.182114
428	600.0	163	2015-02-04 00:09:08.885222	2015-02-04 00:09:08.885222
429	600.0	164	2015-02-04 00:14:41.270101	2015-02-04 00:14:41.270101
430	600.0	165	2015-02-04 00:16:39.069083	2015-02-04 00:16:39.069083
431	600.0	166	2015-02-04 00:21:26.055584	2015-02-04 00:21:26.055584
432	1200.0	167	2015-02-04 00:25:13.418247	2015-02-04 00:25:13.418247
433	1200.0	168	2015-02-04 00:27:57.823389	2015-02-04 00:27:57.823389
434	600.0	169	2015-02-04 00:31:22.470417	2015-02-04 00:31:22.470417
435	1200.0	170	2015-02-04 00:33:59.225184	2015-02-04 00:33:59.225184
436	1200.0	171	2015-02-04 00:36:39.865104	2015-02-04 00:36:39.865104
437	3000.0	171	2015-02-04 00:36:49.598793	2015-02-04 00:36:49.598793
438	600.0	172	2015-02-04 00:38:48.155178	2015-02-04 00:38:48.155178
439	1600.0	173	2015-02-04 00:39:40.41257	2015-02-04 00:39:40.41257
440	600.0	174	2015-02-04 00:42:59.975399	2015-02-04 00:42:59.975399
441	600.0	175	2015-02-04 00:45:36.464758	2015-02-04 00:45:36.464758
442	1600.0	176	2015-02-04 00:52:22.041203	2015-02-04 00:52:22.041203
443	1600.0	176	2015-02-04 00:53:44.57421	2015-02-04 00:53:44.57421
444	1600.0	176	2015-02-04 00:54:17.511329	2015-02-04 00:54:17.511329
445	1600.0	176	2015-02-04 00:54:26.281049	2015-02-04 00:54:26.281049
446	600.0	177	2015-02-04 00:57:22.177744	2015-02-04 00:57:22.177744
447	1200.0	178	2015-02-04 01:00:00.224882	2015-02-04 01:00:00.224882
448	1200.0	179	2015-02-04 01:04:04.571079	2015-02-04 01:04:04.571079
449	600.0	180	2015-02-04 01:06:16.285616	2015-02-04 01:06:16.285616
450	1600.0	181	2015-02-04 01:08:59.482871	2015-02-04 01:08:59.482871
451	600.0	182	2015-02-04 01:10:56.581162	2015-02-04 01:10:56.581162
452	600.0	117	2015-02-04 01:11:53.078849	2015-02-04 01:11:53.078849
453	600.0	183	2015-02-04 01:13:16.685572	2015-02-04 01:13:16.685572
454	600.0	184	2015-02-04 01:18:44.682158	2015-02-04 01:18:44.682158
455	600.0	185	2015-02-04 01:22:26.751683	2015-02-04 01:22:26.751683
456	600.0	186	2015-02-04 01:24:06.983128	2015-02-04 01:24:06.983128
457	600.0	187	2015-02-04 01:26:02.483555	2015-02-04 01:26:02.483555
458	600.0	188	2015-02-04 01:27:49.489885	2015-02-04 01:27:49.489885
459	600.0	189	2015-02-04 01:29:26.954689	2015-02-04 01:29:26.954689
460	600.0	190	2015-02-04 01:31:24.202061	2015-02-04 01:31:24.202061
461	600.0	191	2015-02-04 01:33:43.634093	2015-02-04 01:33:43.634093
462	600.0	192	2015-02-04 01:35:17.691149	2015-02-04 01:35:17.691149
463	1600.0	193	2015-02-04 01:37:12.906087	2015-02-04 01:37:12.906087
464	600.0	194	2015-02-04 01:38:49.936797	2015-02-04 01:38:49.936797
465	1200.0	179	2015-02-04 01:39:16.695924	2015-02-04 01:39:16.695924
466	600.0	195	2015-02-04 01:41:19.161422	2015-02-04 01:41:19.161422
467	600.0	196	2015-02-04 01:42:41.224871	2015-02-04 01:42:41.224871
468	600.0	197	2015-02-04 01:44:11.540604	2015-02-04 01:44:11.540604
469	600.0	198	2015-02-04 01:48:00.628485	2015-02-04 01:48:00.628485
470	600.0	199	2015-02-04 01:49:33.76026	2015-02-04 01:49:33.76026
471	600.0	200	2015-02-04 01:51:11.574734	2015-02-04 01:51:11.574734
472	600.0	201	2015-02-04 01:52:52.715668	2015-02-04 01:52:52.715668
473	600.0	202	2015-02-04 01:54:14.581011	2015-02-04 01:54:14.581011
474	600.0	203	2015-02-04 01:55:29.829814	2015-02-04 01:55:29.829814
475	1600.0	204	2015-02-04 01:56:31.37875	2015-02-04 01:56:31.37875
476	600.0	205	2015-02-04 01:57:43.85227	2015-02-04 01:57:43.85227
477	600.0	206	2015-02-04 02:18:45.095993	2015-02-04 02:18:45.095993
478	600.0	207	2015-02-04 02:20:43.219557	2015-02-04 02:20:43.219557
479	600.0	208	2015-02-04 02:22:30.500493	2015-02-04 02:22:30.500493
480	600.0	209	2015-02-04 02:25:50.447591	2015-02-04 02:25:50.447591
481	600.0	210	2015-02-04 02:27:37.77107	2015-02-04 02:27:37.77107
482	600.0	211	2015-02-04 02:29:48.194213	2015-02-04 02:29:48.194213
483	600.0	212	2015-02-04 02:31:36.950554	2015-02-04 02:31:36.950554
484	600.0	213	2015-02-04 02:33:27.606843	2015-02-04 02:33:27.606843
485	600.0	214	2015-02-04 02:35:04.813555	2015-02-04 02:35:04.813555
486	600.0	215	2015-02-04 02:37:12.811958	2015-02-04 02:37:12.811958
487	600.0	216	2015-02-04 02:38:44.769386	2015-02-04 02:38:44.769386
488	600.0	217	2015-02-04 02:40:12.142159	2015-02-04 02:40:12.142159
489	600.0	218	2015-02-04 02:41:34.59176	2015-02-04 02:41:34.59176
490	600.0	219	2015-02-04 02:43:57.414257	2015-02-04 02:43:57.414257
491	600.0	220	2015-02-04 02:45:52.78749	2015-02-04 02:45:52.78749
492	600.0	221	2015-02-04 02:47:10.653147	2015-02-04 02:47:10.653147
493	600.0	222	2015-02-04 02:49:15.176012	2015-02-04 02:49:15.176012
494	600.0	223	2015-02-04 02:50:38.934324	2015-02-04 02:50:38.934324
495	600.0	224	2015-02-04 02:52:35.972997	2015-02-04 02:52:35.972997
496	600.0	225	2015-02-04 02:53:44.331098	2015-02-04 02:53:44.331098
497	600.0	226	2015-02-04 02:55:37.780234	2015-02-04 02:55:37.780234
498	600.0	227	2015-02-04 03:00:03.274236	2015-02-04 03:00:03.274236
499	600.0	227	2015-02-04 03:00:15.816758	2015-02-04 03:00:15.816758
500	600.0	228	2015-02-04 03:03:22.870501	2015-02-04 03:03:22.870501
501	600.0	229	2015-02-04 03:04:37.78688	2015-02-04 03:04:37.78688
502	600.0	230	2015-02-04 03:06:30.443596	2015-02-04 03:06:30.443596
503	600.0	231	2015-02-04 03:07:56.149659	2015-02-04 03:07:56.149659
504	600.0	232	2015-02-04 03:09:03.024124	2015-02-04 03:09:03.024124
505	600.0	233	2015-02-04 03:10:32.697134	2015-02-04 03:10:32.697134
506	600.0	234	2015-02-04 03:12:23.779597	2015-02-04 03:12:23.779597
507	600.0	235	2015-02-04 03:13:44.560209	2015-02-04 03:13:44.560209
508	1600.0	236	2015-02-04 03:15:09.051806	2015-02-04 03:15:09.051806
509	600.0	237	2015-02-04 03:16:39.575289	2015-02-04 03:16:39.575289
510	600.0	238	2015-02-04 03:17:49.832738	2015-02-04 03:17:49.832738
511	600.0	239	2015-02-04 03:18:57.514841	2015-02-04 03:18:57.514841
512	600.0	240	2015-02-04 03:20:10.138137	2015-02-04 03:20:10.138137
513	600.0	241	2015-02-04 03:21:41.12032	2015-02-04 03:21:41.12032
514	600.0	242	2015-02-04 03:23:02.627672	2015-02-04 03:23:02.627672
515	600.0	243	2015-02-04 03:24:29.026557	2015-02-04 03:24:29.026557
516	600.0	244	2015-02-04 03:25:50.924925	2015-02-04 03:25:50.924925
517	600.0	245	2015-02-04 03:27:24.898907	2015-02-04 03:27:24.898907
518	600.0	246	2015-02-04 03:28:55.571164	2015-02-04 03:28:55.571164
519	600.0	247	2015-02-04 03:30:11.637718	2015-02-04 03:30:11.637718
520	600.0	248	2015-02-04 03:31:40.269647	2015-02-04 03:31:40.269647
521	600.0	249	2015-02-04 03:33:40.500904	2015-02-04 03:33:40.500904
522	600.0	250	2015-02-04 03:34:51.24984	2015-02-04 03:34:51.24984
523	600.0	251	2015-02-04 03:36:02.548146	2015-02-04 03:36:02.548146
524	600.0	252	2015-02-04 03:37:07.714196	2015-02-04 03:37:07.714196
525	600.0	253	2015-02-04 03:38:18.745992	2015-02-04 03:38:18.745992
526	600.0	254	2015-02-04 03:39:42.345081	2015-02-04 03:39:42.345081
527	600.0	255	2015-02-04 03:40:58.702319	2015-02-04 03:40:58.702319
528	600.0	256	2015-02-04 03:42:12.000122	2015-02-04 03:42:12.000122
529	600.0	257	2015-02-04 03:43:39.891232	2015-02-04 03:43:39.891232
530	600.0	258	2015-02-04 03:44:52.048405	2015-02-04 03:44:52.048405
531	600.0	259	2015-02-04 03:46:28.454256	2015-02-04 03:46:28.454256
532	600.0	260	2015-02-04 03:49:33.235544	2015-02-04 03:49:33.235544
533	600.0	261	2015-02-04 03:51:25.217935	2015-02-04 03:51:25.217935
534	1600.0	262	2015-02-04 03:53:26.590345	2015-02-04 03:53:26.590345
535	600.0	263	2015-02-04 03:55:51.746711	2015-02-04 03:55:51.746711
536	600.0	264	2015-02-04 03:57:23.188105	2015-02-04 03:57:23.188105
537	600.0	265	2015-02-04 03:59:31.635279	2015-02-04 03:59:31.635279
538	600.0	266	2015-02-04 04:00:37.652007	2015-02-04 04:00:37.652007
539	1600.0	267	2015-02-04 04:48:09.583833	2015-02-04 04:48:09.583833
540	600.0	268	2015-02-04 04:50:18.899698	2015-02-04 04:50:18.899698
541	600.0	269	2015-02-04 04:52:41.230857	2015-02-04 04:52:41.230857
542	600.0	270	2015-02-04 04:53:46.971536	2015-02-04 04:53:46.971536
543	600.0	271	2015-02-04 04:57:01.582779	2015-02-04 04:57:01.582779
544	600.0	272	2015-02-04 04:58:23.29091	2015-02-04 04:58:23.29091
545	600.0	273	2015-02-04 04:59:52.297624	2015-02-04 04:59:52.297624
546	600.0	274	2015-02-04 05:01:04.331075	2015-02-04 05:01:04.331075
547	600.0	275	2015-02-04 05:04:09.793394	2015-02-04 05:04:09.793394
548	600.0	276	2015-02-04 05:05:24.192755	2015-02-04 05:05:24.192755
549	600.0	277	2015-02-04 05:06:43.042521	2015-02-04 05:06:43.042521
550	600.0	278	2015-02-04 05:08:17.415824	2015-02-04 05:08:17.415824
551	600.0	279	2015-02-04 05:09:37.981451	2015-02-04 05:09:37.981451
552	600.0	221	2015-02-04 08:09:04.428403	2015-02-04 08:09:04.428403
553	600.0	249	2015-02-05 02:54:28.288148	2015-02-05 02:54:28.288148
554	600.0	249	2015-02-05 02:54:37.037719	2015-02-05 02:54:37.037719
555	600.0	249	2015-02-05 03:08:03.746754	2015-02-05 03:08:03.746754
556	1600.0	236	2015-02-05 06:57:58.263936	2015-02-05 06:57:58.263936
557	1600.0	236	2015-02-05 06:59:01.129423	2015-02-05 06:59:01.129423
558	600.0	236	2015-02-05 06:59:09.729703	2015-02-05 06:59:09.729703
559	600.0	236	2015-02-05 06:59:25.428709	2015-02-05 06:59:25.428709
560	600.0	236	2015-02-05 06:59:31.237945	2015-02-05 06:59:31.237945
561	600.0	236	2015-02-05 06:59:44.112354	2015-02-05 06:59:44.112354
562	600.0	236	2015-02-05 06:59:52.786966	2015-02-05 06:59:52.786966
563	600.0	236	2015-02-05 07:00:31.094409	2015-02-05 07:00:31.094409
564	1600.0	236	2015-02-05 07:00:45.785701	2015-02-05 07:00:45.785701
565	1600.0	236	2015-02-05 07:00:54.660298	2015-02-05 07:00:54.660298
566	600.0	280	2015-02-06 07:11:53.420745	2015-02-06 07:11:53.420745
567	600.0	280	2015-02-06 07:11:58.895019	2015-02-06 07:11:58.895019
568	600.0	95	2015-02-09 05:20:00.10848	2015-02-09 05:20:00.10848
569	600.0	95	2015-02-09 05:21:32.256694	2015-02-09 05:21:32.256694
570	600.0	95	2015-02-09 05:21:37.165381	2015-02-09 05:21:37.165381
571	600.0	95	2015-02-09 05:22:29.00519	2015-02-09 05:22:29.00519
572	600.0	95	2015-02-09 05:24:37.219344	2015-02-09 05:24:37.219344
573	600.0	95	2015-02-09 05:24:50.370657	2015-02-09 05:24:50.370657
574	600.0	95	2015-02-09 05:24:53.412508	2015-02-09 05:24:53.412508
575	600.0	1	2015-02-09 05:26:14.568818	2015-02-09 05:26:14.568818
576	1600.0	75	2015-02-09 05:26:38.993324	2015-02-09 05:26:38.993324
577	600.0	158	2015-02-09 05:26:54.975806	2015-02-09 05:26:54.975806
578	600.0	7	2015-02-09 05:27:22.577298	2015-02-09 05:27:22.577298
579	600.0	154	2015-02-09 05:27:58.758934	2015-02-09 05:27:58.758934
580	600.0	272	2015-02-09 05:29:05.26576	2015-02-09 05:29:05.26576
581	600.0	73	2015-02-09 05:29:22.849388	2015-02-09 05:29:22.849388
582	600.0	4	2015-02-09 05:29:55.549639	2015-02-09 05:29:55.549639
583	1200.0	79	2015-02-09 05:30:08.723632	2015-02-09 05:30:08.723632
584	600.0	88	2015-02-09 05:30:28.015219	2015-02-09 05:30:28.015219
585	600.0	98	2015-02-09 05:30:49.956076	2015-02-09 05:30:49.956076
586	600.0	104	2015-02-09 05:31:24.463531	2015-02-09 05:31:24.463531
587	900.0	105	2015-02-09 05:31:45.61333	2015-02-09 05:31:45.61333
588	600.0	13	2015-02-09 05:32:08.822555	2015-02-09 05:32:08.822555
589	600.0	69	2015-02-09 05:32:24.054404	2015-02-09 05:32:24.054404
590	600.0	69	2015-02-09 05:32:33.668883	2015-02-09 05:32:33.668883
591	600.0	72	2015-02-09 05:32:46.371263	2015-02-09 05:32:46.371263
592	900.0	71	2015-02-09 05:32:58.595966	2015-02-09 05:32:58.595966
593	900.0	70	2015-02-09 05:33:09.104254	2015-02-09 05:33:09.104254
594	600.0	72	2015-02-09 05:33:19.606361	2015-02-09 05:33:19.606361
595	600.0	114	2015-02-09 05:34:22.411925	2015-02-09 05:34:22.411925
596	600.0	87	2015-02-09 05:34:46.127029	2015-02-09 05:34:46.127029
597	600.0	156	2015-02-09 05:35:01.91156	2015-02-09 05:35:01.91156
598	600.0	62	2015-02-09 05:35:16.278112	2015-02-09 05:35:16.278112
599	600.0	122	2015-02-09 05:35:33.519422	2015-02-09 05:35:33.519422
600	900.0	103	2015-02-09 05:35:54.468606	2015-02-09 05:35:54.468606
601	900.0	14	2015-02-09 05:36:17.235203	2015-02-09 05:36:17.235203
602	600.0	65	2015-02-09 05:36:54.5594	2015-02-09 05:36:54.5594
603	600.0	86	2015-02-09 05:37:12.367415	2015-02-09 05:37:12.367415
604	600.0	271	2015-02-09 05:38:16.291284	2015-02-09 05:38:16.291284
605	600.0	10	2015-02-09 05:38:51.582482	2015-02-09 05:38:51.582482
606	600.0	270	2015-02-09 05:40:14.190276	2015-02-09 05:40:14.190276
607	600.0	27	2015-02-09 05:40:27.631136	2015-02-09 05:40:27.631136
608	600.0	91	2015-02-09 05:40:48.614363	2015-02-09 05:40:48.614363
609	600.0	90	2015-02-09 05:41:06.579907	2015-02-09 05:41:06.579907
610	2500.0	102	2015-02-09 05:41:54.871684	2015-02-09 05:41:54.871684
611	600.0	97	2015-02-09 05:42:09.171696	2015-02-09 05:42:09.171696
612	1200.0	66	2015-02-09 05:42:25.671605	2015-02-09 05:42:25.671605
613	600.0	130	2015-02-09 05:42:39.462849	2015-02-09 05:42:39.462849
614	1600.0	74	2015-02-09 05:42:55.229038	2015-02-09 05:42:55.229038
615	600.0	237	2015-02-09 06:56:29.148952	2015-02-09 06:56:29.148952
616	600.0	281	2015-02-09 07:02:06.943711	2015-02-09 07:02:06.943711
617	600.0	281	2015-02-09 07:02:31.738398	2015-02-09 07:02:31.738398
618	600.0	282	2015-02-09 07:52:38.235581	2015-02-09 07:52:38.235581
619	600.0	283	2015-02-09 07:54:01.901401	2015-02-09 07:54:01.901401
620	600.0	284	2015-02-09 07:56:07.565514	2015-02-09 07:56:07.565514
621	600.0	285	2015-02-09 07:57:45.764539	2015-02-09 07:57:45.764539
622	600.0	286	2015-02-09 07:59:24.663176	2015-02-09 07:59:24.663176
623	600.0	287	2015-02-09 08:01:17.2783	2015-02-09 08:01:17.2783
624	600.0	288	2015-02-09 08:02:58.526508	2015-02-09 08:02:58.526508
625	600.0	288	2015-02-09 08:03:07.377178	2015-02-09 08:03:07.377178
626	600.0	242	2015-02-09 08:42:15.263973	2015-02-09 08:42:15.263973
627	1800.0	144	2015-02-10 03:02:17.175725	2015-02-10 03:02:17.175725
628	1800.0	144	2015-02-10 03:13:05.548518	2015-02-10 03:13:05.548518
629	600.0	289	2015-02-10 06:34:10.064486	2015-02-10 06:34:10.064486
630	600.0	188	2015-02-10 06:36:28.137698	2015-02-10 06:36:28.137698
631	600.0	268	2015-02-10 07:17:39.05539	2015-02-10 07:17:39.05539
632	600.0	268	2015-02-10 07:17:44.129877	2015-02-10 07:17:44.129877
633	600.0	268	2015-02-10 07:18:47.587851	2015-02-10 07:18:47.587851
634	600.0	227	2015-02-11 06:35:13.97099	2015-02-11 06:35:13.97099
635	1200.0	290	2015-02-11 06:39:16.183285	2015-02-11 06:39:16.183285
636	600.0	198	2015-02-16 02:25:40.683489	2015-02-16 02:25:40.683489
637	600.0	278	2015-02-16 02:38:36.561037	2015-02-16 02:38:36.561037
638	600.0	265	2015-02-16 03:46:17.577072	2015-02-16 03:46:17.577072
639	600.0	291	2015-02-16 03:56:56.260831	2015-02-16 03:56:56.260831
640	600.0	291	2015-02-16 03:57:31.189308	2015-02-16 03:57:31.189308
641	600.0	228	2015-02-16 05:32:18.771069	2015-02-16 05:32:18.771069
642	600.0	117	2015-02-16 06:42:16.790656	2015-02-16 06:42:16.790656
643	600.0	207	2015-02-17 03:19:10.947605	2015-02-17 03:19:10.947605
644	600.0	207	2015-02-17 03:21:14.171718	2015-02-17 03:21:14.171718
\.


--
-- Name: mayors_permit_fees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('mayors_permit_fees_id_seq', 644, true);


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY payments (id, amount, business_id, status, official_receipt_number, created_at, updated_at, collecting_officer) FROM stdin;
1	1320.0	1	0	3492244 H	2015-01-26 04:32:32.404817	2015-01-26 04:32:32.404817	Chrisol Catalino
2	2400.0	2	0	3492309 H	2015-01-26 05:01:20.9328	2015-01-26 05:01:20.9328	Chrisol Catalino
3	900.0	3	0	3492309	2015-01-26 05:04:45.089763	2015-01-26 05:04:45.089763	Chrisol Catalino
4	1680.0	4	0	3492237 H	2015-01-26 05:38:27.507425	2015-01-26 05:38:27.507425	Chrisol Catalino
5	1320.0	5	0	3491635	2015-01-26 05:44:12.697344	2015-01-26 05:44:12.697344	Chrisol Catalino
6	1680.0	6	0	3491641	2015-01-26 06:26:26.992452	2015-01-26 06:26:26.992452	Chrisol Catalino
7	1680.0	7	0	3491642 H	2015-01-26 06:45:51.204928	2015-01-26 06:45:51.204928	Chrisol Catalino
8	4200.0	8	0	0648101 D	2015-01-26 07:08:13.624482	2015-01-26 07:08:13.624482	Chrisol Catalino
9	600.0	9	0	3492243 H	2015-01-26 07:34:26.601147	2015-01-26 07:34:26.601147	Chrisol Catalino
10	1680.0	10	0	3492248 H	2015-01-26 07:49:00.660765	2015-01-26 07:49:00.660765	Chrisol Catalino
11	600.0	11	0	0648102 D	2015-01-26 08:23:24.787552	2015-01-26 08:23:24.787552	Chrisol Catalino
12	1320.0	12	0	3492176 H	2015-01-26 08:51:26.949292	2015-01-26 08:51:26.949292	Chrisol Catalino
13	2600.0	13	0	3491643 H	2015-01-26 08:58:37.603313	2015-01-26 08:58:37.603313	Chrisol Catalino
14	2450.0	14	0	3491636	2015-01-26 09:26:16.999892	2015-01-26 09:26:16.999892	Chrisol Catalino
16	1200.0	16	0	3491648 H	2015-01-27 02:23:46.233751	2015-01-27 02:23:46.233751	Chrisol Catalino
17	1320.0	17	0	3491647 H	2015-01-27 02:30:38.925182	2015-01-27 02:30:38.925182	Chrisol Catalino
18	600.0	18	0	0648110 D	2015-01-27 02:34:19.85657	2015-01-27 02:34:19.85657	Chrisol Catalino
19	600.0	20	0	0648109 D	2015-01-27 02:47:24.756041	2015-01-27 02:47:24.756041	Chrisol Catalino
20	600.0	21	0	0648108 D	2015-01-27 02:57:57.02538	2015-01-27 02:57:57.02538	Chrisol Catalino
21	2150.0	22	0	3491650 H	2015-01-27 03:14:17.332222	2015-01-27 03:14:17.332222	Chrisol Catalino
22	600.0	23	0	3491649 H	2015-01-27 03:18:46.464921	2015-01-27 03:18:46.464921	Chrisol Catalino
23	2900.0	24	0	0648111 D	2015-01-27 03:23:25.000779	2015-01-27 03:23:25.000779	Chrisol Catalino
24	4200.0	25	0	0648115 D	2015-01-27 03:59:32.498327	2015-01-27 03:59:32.498327	Chrisol Catalino
25	1680.0	26	0	0648114 D	2015-01-27 04:02:59.061199	2015-01-27 04:02:59.061199	Chrisol Catalino
26	1320.0	27	0	0648117 D	2015-01-27 05:53:05.626413	2015-01-27 05:53:05.626413	Chrisol Catalino
59	600.0	60	0	0648118 D	2015-01-27 07:08:06.27017	2015-01-27 07:08:06.27017	Chrisol Catalino
60	600.0	61	0	3492242	2015-01-28 00:48:59.130387	2015-01-28 00:48:59.130387	Chrisol Catalino
61	1320.0	62	0	3492232 H	2015-01-28 02:12:32.317287	2015-01-28 02:12:32.317287	Chrisol Catalino
62	600.0	63	0	3492302 H	2015-01-28 02:15:24.06858	2015-01-28 02:15:24.06858	Chrisol Catalino
63	1320.0	64	0	34922229 H	2015-01-28 02:17:29.242451	2015-01-28 02:17:29.242451	Chrisol Catalino
64	1680.0	65	0	3492170 H	2015-01-28 02:24:57.043351	2015-01-28 02:24:57.043351	Chrisol Catalino
65	1200.0	66	0	3492225 H	2015-01-28 02:29:53.174009	2015-01-28 02:29:53.174009	Chrisol Catalino
66	600.0	67	0	349000 H	2015-01-28 02:33:02.17009	2015-01-28 02:33:02.17009	Chrisol Catalino
67	1600.0	68	0	3492220 H	2015-01-28 02:41:55.62059	2015-01-28 02:41:55.62059	Chrisol Catalino
68	600.0	69	0	3492159	2015-01-28 02:44:55.016781	2015-01-28 02:44:55.016781	Chrisol Catalino
69	3550.0	70	0	3492158 H / 3492162 H	2015-01-28 02:50:37.750533	2015-01-28 02:50:37.750533	Chrisol Catalino
70	900.0	71	0	3492159 H	2015-01-28 02:52:49.075809	2015-01-28 02:52:49.075809	Chrisol Catalino
71	600.0	72	0	3492160 H	2015-01-28 02:55:08.45272	2015-01-28 02:55:08.45272	Chrisol Catalino
72	1680.0	73	0	3492165 H	2015-01-28 02:58:43.378357	2015-01-28 02:58:43.378357	Chrisol Catalino
73	1667.0	75	0	0648121 D	2015-01-28 03:10:48.140242	2015-01-28 03:10:48.140242	Chrisol Catalino
74	600.0	76	0	3491639 H	2015-01-28 03:56:46.357902	2015-01-28 03:56:46.357902	Chrisol Catalino
75	1630.0	74	0	3492166 H	2015-01-28 04:51:47.064071	2015-01-28 04:51:47.064071	Chrisol Catalino
76	1980.0	77	0	3491998 H	2015-01-28 04:55:09.86355	2015-01-28 04:55:09.86355	Chrisol Catalino
77	600.0	78	0	3491630 H	2015-01-28 04:58:54.640686	2015-01-28 04:58:54.640686	Chrisol Catalino
78	1680.0	79	0	3491623	2015-01-28 05:14:39.58413	2015-01-28 05:14:39.58413	Chrisol Catalino
79	900.0	80	0	3491498	2015-01-28 05:19:45.774168	2015-01-28 05:19:45.774168	Chrisol Catalino
80	1680.0	82	0	3492405 H	2015-01-28 05:33:00.040449	2015-01-28 05:33:00.040449	Chrisol Catalino
81	600.0	83	0	3492177 H	2015-01-28 05:52:32.109701	2015-01-28 05:52:32.109701	Chrisol Catalino
82	600.0	84	0	3492406 H	2015-01-28 06:04:29.965537	2015-01-28 06:04:29.965537	Chrisol Catalino
83	600.0	85	0	3491470	2015-01-28 06:21:52.452451	2015-01-28 06:21:52.452451	Chrisol Catalino
84	1320.0	86	0	3491620 H	2015-01-28 06:25:15.547633	2015-01-28 06:25:15.547633	Chrisol Catalino
85	1980.0	87	0	3491497	2015-01-28 06:30:03.705457	2015-01-28 06:30:03.705457	Chrisol Catalino
86	1320.0	88	0	3492203 H	2015-01-28 06:36:43.573391	2015-01-28 06:36:43.573391	Chrisol Catalino
87	1400.0	89	0	3491981	2015-01-28 06:45:37.385054	2015-01-28 06:45:37.385054	Chrisol Catalino
88	1680.0	90	0	3492219	2015-01-28 06:48:50.066837	2015-01-28 06:48:50.066837	Chrisol Catalino
89	1680.0	91	0	3492217 H	2015-01-28 06:51:21.943808	2015-01-28 06:51:21.943808	Chrisol Catalino
90	1680.0	92	0	0648122 D	2015-01-28 06:58:47.498436	2015-01-28 06:58:47.498436	Chrisol Catalino
91	1680.0	94	0	3491638 H	2015-01-28 07:17:06.676786	2015-01-28 07:17:06.676786	Chrisol Catalino
92	600.0	93	0	3492409 H	2015-01-28 07:31:38.812073	2015-01-28 07:31:38.812073	Chrisol Catalino
93	2150.0	95	0	3492410 H	2015-01-28 07:36:50.866694	2015-01-28 07:36:50.866694	Chrisol Catalino
94	1320.0	96	0	0648123 D	2015-01-28 07:55:37.385878	2015-01-28 07:55:37.385878	Chrisol Catalino
95	1320.0	97	0	3492414 H	2015-01-28 08:04:49.492176	2015-01-28 08:04:49.492176	Chrisol Catalino
96	2150.0	98	0	3492415 H	2015-01-28 08:19:59.35662	2015-01-28 08:19:59.35662	Chrisol Catalino
97	1200.0	99	0	0648125 D	2015-01-28 08:46:58.284503	2015-01-28 08:46:58.284503	Chrisol Catalino
98	1500.0	100	0	341894 H	2015-01-28 09:10:09.087353	2015-01-28 09:10:09.087353	Chrisol Catalino
99	2200.0	101	0	342201 H	2015-01-29 00:26:16.167871	2015-01-29 00:26:16.167871	Chrisol Catalino
100	9700.0	102	0	3492201 H	2015-01-29 00:35:36.470291	2015-01-29 00:35:36.470291	Chrisol Catalino
101	1980.0	103	0	3491495 H	2015-01-29 00:38:51.920193	2015-01-29 00:38:51.920193	Chrisol Catalino
102	1200.0	104	0	3492151 H	2015-01-29 00:44:22.843797	2015-01-29 00:44:22.843797	Chrisol Catalino
103	1980.0	105	0	341971 H	2015-01-29 00:46:48.093405	2015-01-29 00:46:48.093405	Chrisol Catalino
104	1320.0	106	0	3492211	2015-01-29 00:49:52.898094	2015-01-29 00:49:52.898094	Chrisol Catalino
105	600.0	107	0	3492202 H	2015-01-29 00:55:46.528704	2015-01-29 00:55:46.528704	Chrisol Catalino
106	600.0	108	0	unknown receipt number	2015-01-29 00:57:28.101845	2015-01-29 00:57:28.101845	Chrisol Catalino
107	1680.0	109	0	3491617 H	2015-01-29 00:59:47.185651	2015-01-29 00:59:47.185651	Chrisol Catalino
108	2900.0	111	0	3491494	2015-01-29 01:04:31.151965	2015-01-29 01:04:31.151965	Chrisol Catalino
109	1680.0	112	0	3491898 H	2015-01-29 01:08:33.670456	2015-01-29 01:08:33.670456	Chrisol Catalino
110	600.0	113	0	3492063	2015-01-29 01:18:35.595252	2015-01-29 01:18:35.595252	Chrisol Catalino
111	1680.0	114	0	3492022 H	2015-01-29 01:21:08.382915	2015-01-29 01:21:08.382915	Chrisol Catalino
112	3067.0	15	0	3491861	2015-01-29 01:26:04.11591	2015-01-29 01:26:04.11591	Chrisol Catalino
113	600.0	115	0	3491978 H	2015-01-29 01:28:41.258464	2015-01-29 01:28:41.258464	Chrisol Catalino
114	1680.0	122	0	0648126 D	2015-01-29 03:10:24.630263	2015-01-29 03:10:24.630263	Chrisol Catalino
115	600.0	123	0	3492417 H	2015-01-29 03:42:47.385358	2015-01-29 03:42:47.385358	Chrisol Catalino
116	1320.0	124	0	3492418 H	2015-01-29 05:20:19.068981	2015-01-29 05:20:19.068981	Chrisol Catalino
117	1200.0	125	0	3492412 H	2015-01-29 06:31:19.115662	2015-01-29 06:31:19.115662	Chrisol Catalino
118	1680.0	126	0	0648129 D	2015-01-29 06:48:03.902899	2015-01-29 06:48:03.902899	Chrisol Catalino
120	1450.0	128	0	06481831 	2015-01-29 07:28:18.312427	2015-01-29 07:28:18.312427	Chrisol Catalino
121	1450.0	129	0	0648131	2015-01-29 07:29:59.651879	2015-01-29 07:29:59.651879	Chrisol Catalino
122	1320.0	130	0	3492429 H	2015-01-29 07:41:31.485601	2015-01-29 07:41:31.485601	Chrisol Catalino
123	2600.0	131	0	3492428 H	2015-01-29 07:48:11.179196	2015-01-29 07:48:11.179196	Chrisol Catalino
124	1200.0	132	0	0648132	2015-01-29 08:03:33.517564	2015-01-29 08:03:33.517564	Chrisol Catalino
125	1200.0	133	0	0648130	2015-01-29 08:08:27.609665	2015-01-29 08:08:27.609665	Chrisol Catalino
126	1200.0	134	0	3492430 H	2015-01-29 08:17:02.426807	2015-01-29 08:17:02.426807	Chrisol Catalino
127	1200.0	136	0	3492432 H	2015-01-29 08:25:11.460125	2015-01-29 08:25:11.460125	Chrisol Catalino
128	1200.0	135	0	3492431 H	2015-01-29 08:27:25.801109	2015-01-29 08:27:25.801109	Chrisol Catalino
129	600.0	137	0	0648134 D	2015-01-29 08:58:18.892557	2015-01-29 08:58:18.892557	Chrisol Catalino
130	600.0	138	0	0648135 D	2015-01-29 09:09:00.240694	2015-01-29 09:09:00.240694	Chrisol Catalino
131	1314.0	139	0	0648124 D	2015-01-30 00:34:09.527759	2015-01-30 00:34:09.527759	Chrisol Catalino
132	1200.0	140	0	3492156 H	2015-01-30 01:27:14.118204	2015-01-30 01:27:14.118204	Chrisol Catalino
133	1200.0	141	0	0648127 D	2015-01-30 01:50:56.090287	2015-01-30 01:50:56.090287	Chrisol Catalino
134	1320.0	142	0	0648136 D	2015-01-30 02:48:54.037869	2015-01-30 02:48:54.037869	Chrisol Catalino
135	600.0	147	0	0648137	2015-01-30 03:49:28.215218	2015-01-30 03:49:28.215218	Chrisol Catalino
136	900.0	146	0	3492433 H	2015-01-30 05:06:21.038054	2015-01-30 05:06:21.038054	Chrisol Catalino
138	600.0	149	0	0648128 D	2015-01-30 06:29:46.665922	2015-01-30 06:29:46.665922	Chrisol Catalino
139	600.0	150	0	3492435	2015-01-30 06:39:31.91455	2015-01-30 06:39:31.91455	Chrisol Catalino
140	600.0	151	0	3492435 H	2015-01-30 06:41:26.774534	2015-01-30 06:41:26.774534	Chrisol Catalino
141	600.0	152	0	3492437 H	2015-01-30 07:14:49.008927	2015-01-30 07:14:49.008927	Chrisol Catalino
142	600.0	153	0	0648141 D	2015-01-30 07:24:38.878759	2015-01-30 07:24:38.878759	Chrisol Catalino
143	1680.0	154	0	3492436 H	2015-01-30 07:35:40.549446	2015-01-30 07:35:40.549446	Chrisol Catalino
137	600.0	148	0	0944321	2015-01-30 06:20:25.724496	2015-01-30 08:18:43.275798	Chrisol Catalino
144	1900.0	155	0	0648144	2015-02-02 00:15:40.928901	2015-02-02 00:15:40.928901	Chrisol Catalino
145	1320.0	156	0	3492440 H	2015-02-02 00:23:05.932623	2015-02-02 00:23:05.932623	Chrisol Catalino
146	600.0	157	0	3492442 H	2015-02-02 02:27:28.165127	2015-02-02 02:27:28.165127	Chrisol Catalino
147	1320.0	158	0	0648138 D	2015-02-02 06:05:25.931827	2015-02-02 06:05:25.931827	Chrisol Catalino
148	600.0	159	0	3492438 H	2015-02-02 06:58:57.645628	2015-02-02 06:58:57.645628	Chrisol Catalino
149	600.0	119	0	0648140 D	2015-02-02 07:02:35.098507	2015-02-02 07:02:35.098507	Chrisol Catalino
150	1350.0	160	0	0648148 D	2015-02-03 01:33:32.957137	2015-02-03 01:33:32.957137	Chrisol Catalino
151	900.0	110	0	Unknown receipt number	2015-02-03 07:24:45.103393	2015-02-03 07:24:45.103393	Chrisol Catalino
152	750.0	221	0	3492457 H	2015-02-04 08:09:22.056961	2015-02-04 08:09:22.056961	Chrisol Catalino
153	1470.0	249	0	3492460 H	2015-02-05 02:54:53.883767	2015-02-05 02:54:53.883767	Chrisol Catalino
154	2030.0	236	0	3492467 H	2015-02-05 07:01:20.413127	2015-02-05 07:01:20.413127	Chrisol Catalino
155	1200.0	280	0	3492470 H	2015-02-06 07:12:32.649711	2015-02-06 07:12:32.649711	Chrisol Catalino
156	750.0	256	0	3492473 h	2015-02-09 03:58:41.541117	2015-02-09 03:58:41.541117	Chrisol Catalino
157	750.0	255	0	3492471 H	2015-02-09 04:03:21.760168	2015-02-09 04:03:21.760168	Chrisol Catalino
158	750.0	257	0	3492472 H	2015-02-09 04:10:00.015924	2015-02-09 04:10:00.015924	Chrisol Catalino
159	1350.0	237	0	3492477 H	2015-02-09 06:56:38.214116	2015-02-09 06:56:38.214116	Chrisol Catalino
160	1350.0	281	0	3492479 H	2015-02-09 07:03:31.274085	2015-02-09 07:03:31.274085	Chrisol Catalino
161	1400.0	81	0	receipt number unknown	2015-02-09 08:52:33.835443	2015-02-09 08:52:33.835443	Juanita Palubo
162	2250.0	144	0	3492486 H	2015-02-10 03:02:32.86984	2015-02-10 03:02:32.86984	Chrisol Catalino
163	600.0	289	0	3492490 H	2015-02-10 06:34:29.224738	2015-02-10 06:34:29.224738	Chrisol Catalino
164	1350.0	188	0	3492489 H	2015-02-10 06:39:42.528553	2015-02-10 06:39:42.528553	Chrisol Catalino
165	1350.0	268	0	3492492 H	2015-02-10 07:17:58.646134	2015-02-10 07:17:58.646134	Chrisol Catalino
166	1350.0	227	0	3492525 H	2015-02-11 06:35:38.135946	2015-02-11 06:35:38.135946	Chrisol Catalino
167	1200.0	290	0	3492495 H	2015-02-11 06:51:22.055549	2015-02-11 06:51:22.055549	Chrisol Catalino
168	1350.0	198	0	3492622	2015-02-16 02:25:52.183103	2015-02-16 02:25:52.183103	Chrisol Catalino
169	750.0	278	0	3492653 H	2015-02-16 02:38:54.994556	2015-02-16 02:38:54.994556	Chrisol Catalino
170	1350.0	265	0	3492623 H	2015-02-16 03:47:07.648691	2015-02-16 03:47:07.648691	Chrisol Catalino
171	1200.0	291	0	3492563 H	2015-02-16 03:57:52.59343	2015-02-16 03:57:52.59343	Chrisol Catalino
172	750.0	182	0	3492626 H	2015-02-17 03:07:12.326219	2015-02-17 03:07:12.326219	Chrisol Catalino
173	1350.0	207	0	3492572 H	2015-02-17 03:19:41.440317	2015-02-17 03:19:41.440317	Chrisol Catalino
\.


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('payments_id_seq', 173, true);


--
-- Data for Name: pg_search_documents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pg_search_documents (id, content, searchable_id, searchable_type, created_at, updated_at) FROM stdin;
1	Danao Sheanymar	15	Taxpayer	2015-01-27 00:58:51.523995	2015-01-27 00:58:51.523995
3	Abluyan Romeo	17	Taxpayer	2015-01-27 02:33:06.113491	2015-01-27 02:33:06.113491
4	Cutiyog Mariano	18	Taxpayer	2015-01-27 02:39:48.821215	2015-01-27 02:39:48.821215
7	Baguilat Zenaida	21	Taxpayer	2015-01-27 03:17:51.733975	2015-01-27 03:17:51.733975
8	Patnaan Yolanda	22	Taxpayer	2015-01-27 03:21:59.609061	2015-01-27 03:21:59.609061
9	Domingo Carlito	23	Taxpayer	2015-01-27 03:55:34.048258	2015-01-27 03:55:34.048258
10	Langdew Jovena	24	Taxpayer	2015-01-27 03:58:09.573996	2015-01-27 03:58:09.573996
11	Sinak-ey Dora	25	Taxpayer	2015-01-27 05:52:00.634907	2015-01-27 05:52:00.634907
44	Pacleb Elsie	7	Taxpayer	2015-01-27 06:59:01.165483	2015-01-27 06:59:01.165483
47	Uybaan Marcela	10	Taxpayer	2015-01-27 08:33:17.634816	2015-01-27 08:33:17.634816
50	Dugyon Jonathan	12	Taxpayer	2015-01-27 08:34:22.414481	2015-01-27 08:34:22.414481
51	Matso Nadia	11	Taxpayer	2015-01-27 08:35:13.707457	2015-01-27 08:35:13.707457
52	Calansanan Sonia	3	Taxpayer	2015-01-27 08:35:32.590807	2015-01-27 08:35:32.590807
53	Bandao Luisa	6	Taxpayer	2015-01-27 08:36:16.023803	2015-01-27 08:36:16.023803
54	Damullog Solinia	8	Taxpayer	2015-01-27 08:36:30.50952	2015-01-27 08:36:30.50952
55	Abuan Lity	5	Taxpayer	2015-01-27 08:37:14.764067	2015-01-27 08:37:14.764067
58	Cuyasen Yulie	61	Taxpayer	2015-01-28 02:14:13.932491	2015-01-28 02:14:13.932491
59	Pilay Marciana	62	Taxpayer	2015-01-28 02:21:37.400235	2015-01-28 02:21:37.400235
60	Donato Melba	63	Taxpayer	2015-01-28 02:27:44.289363	2015-01-28 02:27:44.289363
61	Locoy Angelina	64	Taxpayer	2015-01-28 02:31:44.616135	2015-01-28 02:31:44.616135
62	Legaspi Merilyn	65	Taxpayer	2015-01-28 02:40:47.989425	2015-01-28 02:40:47.989425
63	Francisco Shenandoah	66	Taxpayer	2015-01-28 02:43:57.860392	2015-01-28 02:43:57.860392
64	Cahlangan Joseph	67	Taxpayer	2015-01-28 02:56:33.480036	2015-01-28 02:56:33.480036
65	Likiyan Rowena	68	Taxpayer	2015-01-28 03:00:59.536706	2015-01-28 03:00:59.536706
66	Ballual Abraham	69	Taxpayer	2015-01-28 03:08:19.30119	2015-01-28 03:08:19.30119
67	Banaang Rosemarie	70	Taxpayer	2015-01-28 03:36:48.708637	2015-01-28 03:36:48.708637
69	Dumanop Virginia	72	Taxpayer	2015-01-28 04:57:54.530035	2015-01-28 04:57:54.530035
70	Calion Jocelyn	73	Taxpayer	2015-01-28 05:00:37.374751	2015-01-28 05:00:37.374751
71	Lacbongan Charlotte	74	Taxpayer	2015-01-28 05:16:22.094737	2015-01-28 05:16:22.094737
72	Choj-yag Benilda	75	Taxpayer	2015-01-28 05:28:11.52004	2015-01-28 05:28:11.52004
73	Kiput Yolanda	76	Taxpayer	2015-01-28 05:41:24.596161	2015-01-28 05:41:24.596161
74	Timbuloy Lino	77	Taxpayer	2015-01-28 06:01:38.5732	2015-01-28 06:01:38.5732
75	Quinocop Linda	78	Taxpayer	2015-01-28 06:20:40.251069	2015-01-28 06:20:40.251069
79	Lacbongan Janice	82	Taxpayer	2015-01-28 06:38:56.952768	2015-01-28 06:38:56.952768
80	Torio Febie	83	Taxpayer	2015-01-28 06:47:39.657016	2015-01-28 06:47:39.657016
81	Sindac Marlene	84	Taxpayer	2015-01-28 06:50:21.119981	2015-01-28 06:50:21.119981
82	Zingabo Orlino	85	Taxpayer	2015-01-28 06:53:04.186072	2015-01-28 06:53:04.186072
83	Mariano Estrelita	86	Taxpayer	2015-01-28 06:57:22.367588	2015-01-28 06:57:22.367588
84	Hidung Monmon	87	Taxpayer	2015-01-28 07:12:44.002705	2015-01-28 07:12:44.002705
85	Tanawe Linda	88	Taxpayer	2015-01-28 07:15:58.718172	2015-01-28 07:15:58.718172
86	Balinggan Vilma	89	Taxpayer	2015-01-28 07:34:59.738116	2015-01-28 07:34:59.738116
87	Labora Mylien	90	Taxpayer	2015-01-28 07:50:51.163889	2015-01-28 07:50:51.163889
89	Danao Riza	92	Taxpayer	2015-01-28 08:18:45.514537	2015-01-28 08:18:45.514537
90	Buhong Richie	93	Taxpayer	2015-01-28 08:44:26.543226	2015-01-28 08:44:26.543226
91	Halip Shirley	94	Taxpayer	2015-01-29 00:21:59.863286	2015-01-29 00:21:59.863286
93	Namponan Jane	96	Taxpayer	2015-01-29 00:37:10.029911	2015-01-29 00:37:10.029911
94	Diwag Susan	97	Taxpayer	2015-01-29 00:42:19.991049	2015-01-29 00:42:19.991049
96	Mocati Novemia	99	Taxpayer	2015-01-29 00:48:44.972218	2015-01-29 00:48:44.972218
98	Cayat Yolanda	101	Taxpayer	2015-01-29 00:58:40.625264	2015-01-29 00:58:40.625264
99	Cabinta Regina	102	Taxpayer	2015-01-29 01:02:28.299358	2015-01-29 01:02:28.299358
101	Tiway Nenita	104	Taxpayer	2015-01-29 01:17:21.602034	2015-01-29 01:17:21.602034
104	Pilayan Junia	107	Taxpayer	2015-01-29 01:44:22.027987	2015-01-29 01:44:22.027987
105	Palongyas Pepe	108	Taxpayer	2015-01-29 01:51:58.467114	2015-01-29 01:51:58.467114
106	Dulnuan Leonida	109	Taxpayer	2015-01-29 02:08:56.598279	2015-01-29 02:08:56.598279
107	Hidalgo Angelita	110	Taxpayer	2015-01-29 02:14:31.196502	2015-01-29 02:14:31.196502
108	Bugtong Rita	111	Taxpayer	2015-01-29 02:18:13.778107	2015-01-29 02:18:13.778107
109	Matso Celyn	112	Taxpayer	2015-01-29 03:09:32.287837	2015-01-29 03:09:32.287837
110	Tanawe Julia	113	Taxpayer	2015-01-29 03:41:54.914094	2015-01-29 03:41:54.914094
112	Cayat Candida	115	Taxpayer	2015-01-29 06:43:25.786593	2015-01-29 06:43:25.786593
113	Pugong Watson	116	Taxpayer	2015-01-29 07:22:18.37074	2015-01-29 07:22:18.37074
114	Luciap Clarita	117	Taxpayer	2015-01-29 07:40:17.796035	2015-01-29 07:40:17.796035
115	Godagod Juliet	118	Taxpayer	2015-01-29 07:46:18.822342	2015-01-29 07:46:18.822342
116	Calpahi Jandyma	119	Taxpayer	2015-01-29 07:58:45.782598	2015-01-29 07:58:45.782598
117	Aldave Melody	120	Taxpayer	2015-01-29 08:07:32.274774	2015-01-29 08:07:32.274774
120	Aguinao Josephine	123	Taxpayer	2015-01-29 08:24:08.036647	2015-01-29 08:24:08.036647
121	Calpahi Victoria	124	Taxpayer	2015-01-29 08:57:01.518227	2015-01-29 09:15:50.353468
122	Dayao Mialyn	125	Taxpayer	2015-01-30 00:30:55.444235	2015-01-30 00:30:55.444235
123	Dincog Jenny	126	Taxpayer	2015-01-30 01:25:43.987039	2015-01-30 01:25:43.987039
124	Gamotlong Portia	127	Taxpayer	2015-01-30 01:50:00.541993	2015-01-30 01:50:00.541993
126	Garcia Jr Faustino	129	Taxpayer	2015-01-30 03:08:50.449839	2015-01-30 03:08:50.449839
127	Bayadang Arnold	130	Taxpayer	2015-01-30 03:27:28.525544	2015-01-30 03:27:28.525544
128	Butata Leonora	131	Taxpayer	2015-01-30 03:33:17.26384	2015-01-30 03:33:17.26384
92	Tumayan Concepcion	95	Taxpayer	2015-01-29 00:32:13.543229	2015-02-09 05:41:46.764966
130	Binwihan Epifania	133	Taxpayer	2015-01-30 03:39:16.76333	2015-01-30 03:39:16.76333
49	Dulnuan Jacqueline	4	Taxpayer	2015-01-27 08:34:01.383297	2015-02-14 12:04:26.828769
88	Halip Shirley	94	Taxpayer	2015-01-28 08:02:42.345573	2015-02-14 09:41:02.097136
303	Dincog Rebecca	35	Taxpayer	2015-02-14 11:08:31.769748	2015-02-14 11:08:31.769748
5	Abluyan Romeo 	17	Taxpayer	2015-01-27 02:54:32.121297	2015-02-14 10:03:54.085049
304	Ballual Abraham	36	Taxpayer	2015-02-14 11:13:47.863544	2015-02-14 11:13:47.863544
129	Degorio Moncheline	132	Taxpayer	2015-01-30 03:37:12.902212	2015-02-15 15:17:50.340095
76	Pilley Josephine	79	Taxpayer	2015-01-28 06:23:40.757982	2015-02-15 13:50:57.871295
68	Anayasan Felicidad	71	Taxpayer	2015-01-28 04:53:19.436933	2015-02-15 13:19:49.799917
57	Lomicio Meriam	60	Taxpayer	2015-01-28 02:10:55.152894	2015-02-15 13:15:48.455894
56	Aydinan Esberta	59	Taxpayer	2015-01-28 00:47:23.207826	2015-02-15 13:26:49.224964
78	Canute Jenny Claire	81	Taxpayer	2015-01-28 06:34:11.426387	2015-02-15 13:55:34.689237
95	Duglayan Jr Julio	98	Taxpayer	2015-01-29 00:45:41.2911	2015-02-15 13:59:36.268195
77	Lacbongan Sr Victor	80	Taxpayer	2015-01-28 06:28:31.036663	2015-02-15 14:07:00.137325
97	Balabal Ernie Jane	100	Taxpayer	2015-01-29 00:54:46.183526	2015-02-15 14:11:54.320259
103	Dumanop Gertrude	106	Taxpayer	2015-01-29 01:27:44.379177	2015-02-15 14:14:52.559393
111	Madayag Ana	114	Taxpayer	2015-01-29 06:28:49.246014	2015-02-15 14:23:22.949518
118	Sagywan Eliza	121	Taxpayer	2015-01-29 08:15:37.180522	2015-02-15 14:37:46.82016
125	Tostos Elizabeth	128	Taxpayer	2015-01-30 02:47:39.484785	2015-02-15 14:39:38.109233
119	Antonio Jenny	122	Taxpayer	2015-01-29 08:18:27.6829	2015-02-15 14:46:36.562904
6	Nginhayan Analiza	20	Taxpayer	2015-01-27 03:11:35.43294	2015-02-15 14:58:09.494379
45	Llanga Jonalyn	58	Taxpayer	2015-01-27 07:06:20.741045	2015-02-15 15:09:09.958308
131	Pawingi Mary Jane	134	Taxpayer	2015-01-30 03:48:31.815045	2015-01-30 03:48:31.815045
132	Muhlao Josefa	135	Taxpayer	2015-01-30 05:27:10.622976	2015-01-30 05:27:10.622976
165	Casinto Venus	168	Taxpayer	2015-01-30 06:28:55.270297	2015-01-30 06:28:55.270297
166	Banahan Marebeth	169	Taxpayer	2015-01-30 07:14:00.216127	2015-01-30 07:14:00.216127
167	Belingon Pureza	170	Taxpayer	2015-01-30 07:23:18.384266	2015-01-30 07:23:18.384266
168	Bilagot Vaneza	171	Taxpayer	2015-01-30 07:34:26.434385	2015-01-30 07:34:26.434385
169	Ballagan Cherry Ann	172	Taxpayer	2015-02-02 00:12:47.815159	2015-02-02 00:12:47.815159
170	Lawa Pauline	173	Taxpayer	2015-02-02 00:20:00.259343	2015-02-02 00:20:00.259343
171	Gayaho Abril	174	Taxpayer	2015-02-02 02:25:00.443193	2015-02-02 02:25:00.443193
173	Secretario Catherine	176	Taxpayer	2015-02-02 06:57:38.711803	2015-02-02 06:57:38.711803
174	Dulnuan Leonida	177	Taxpayer	2015-02-02 07:01:12.816325	2015-02-02 07:01:12.816325
175	Tadao Zenaida	178	Taxpayer	2015-02-03 01:32:02.466441	2015-02-03 01:32:02.466441
176	Naneng Johnson	179	Taxpayer	2015-02-03 09:15:41.680844	2015-02-03 09:15:41.680844
179	Baoy Helen	182	Taxpayer	2015-02-04 00:16:03.038185	2015-02-04 00:16:03.038185
180	Relato Sherwin	183	Taxpayer	2015-02-04 00:20:29.934791	2015-02-04 00:20:29.934791
181	Ugaldi Jr. Pablo	184	Taxpayer	2015-02-04 00:24:13.115615	2015-02-04 00:24:13.115615
182	Halawad Santos	185	Taxpayer	2015-02-04 00:26:44.278358	2015-02-04 00:26:44.278358
183	Bahiwag Ceasario	186	Taxpayer	2015-02-04 00:30:46.74482	2015-02-04 00:30:46.74482
184	Bahiwag Aida	187	Taxpayer	2015-02-04 00:33:05.322541	2015-02-04 00:33:05.322541
185	Danao Alvina	188	Taxpayer	2015-02-04 00:37:57.128684	2015-02-04 00:37:57.128684
186	Mucati Nena	189	Taxpayer	2015-02-04 00:42:19.521644	2015-02-04 00:42:19.521644
187	Polonio Julieta	190	Taxpayer	2015-02-04 00:44:58.592662	2015-02-04 00:44:58.592662
188	Paulino Marlyn	191	Taxpayer	2015-02-04 00:51:36.238968	2015-02-04 00:51:36.238968
189	Kinliyan Joan	192	Taxpayer	2015-02-04 00:56:54.628912	2015-02-04 00:56:54.628912
190	Awichen Georgina	193	Taxpayer	2015-02-04 00:59:29.016111	2015-02-04 00:59:29.016111
191	Dangew Pio	194	Taxpayer	2015-02-04 01:02:35.958655	2015-02-04 01:02:35.958655
192	Cabutte Agnes	195	Taxpayer	2015-02-04 01:05:45.606721	2015-02-04 01:05:45.606721
193	Binwihan Virginia	196	Taxpayer	2015-02-04 01:07:55.480476	2015-02-04 01:07:55.480476
194	Apilis Anabel	197	Taxpayer	2015-02-04 01:10:22.058156	2015-02-04 01:10:22.058156
195	Salapio Madonna	198	Taxpayer	2015-02-04 01:12:43.917849	2015-02-04 01:12:43.917849
196	Madiano Geronimo	199	Taxpayer	2015-02-04 01:18:06.717557	2015-02-04 01:18:06.717557
199	Hiblawan Gunia	202	Taxpayer	2015-02-04 01:23:34.878114	2015-02-04 01:23:34.878114
200	Lumawig Jimmy	203	Taxpayer	2015-02-04 01:25:17.756451	2015-02-04 01:25:17.756451
201	Paduyao Aida	204	Taxpayer	2015-02-04 01:27:16.677524	2015-02-04 01:27:16.677524
202	Damullog Solinia	205	Taxpayer	2015-02-04 01:28:58.526602	2015-02-04 01:28:58.526602
203	Banaang Nancy	206	Taxpayer	2015-02-04 01:30:52.452768	2015-02-04 01:30:52.452768
204	Dimingyay Jona	207	Taxpayer	2015-02-04 01:33:17.812552	2015-02-04 01:33:17.812552
205	Buyya Analiza	208	Taxpayer	2015-02-04 01:34:50.690274	2015-02-04 01:34:50.690274
206	Toda Lourdes	209	Taxpayer	2015-02-04 01:36:08.518719	2015-02-04 01:36:08.518719
207	Pigganto Evelyn	210	Taxpayer	2015-02-04 01:38:14.50248	2015-02-04 01:38:14.50248
208	Nginhayan Satur	211	Taxpayer	2015-02-04 01:40:50.693355	2015-02-04 01:40:50.693355
209	Waling Melba	212	Taxpayer	2015-02-04 01:42:12.81763	2015-02-04 01:42:12.81763
210	Tindaan Jonathan	213	Taxpayer	2015-02-04 01:43:37.860687	2015-02-04 01:43:37.860687
212	Gumangan George	215	Taxpayer	2015-02-04 01:47:14.803718	2015-02-04 01:47:14.803718
213	Binwihan Leo	216	Taxpayer	2015-02-04 01:49:00.383389	2015-02-04 01:49:00.383389
215	Andres Asherlyn	218	Taxpayer	2015-02-04 01:52:17.579649	2015-02-04 01:52:17.579649
216	Ballagan Alfredo	219	Taxpayer	2015-02-04 01:53:44.872558	2015-02-04 01:53:44.872558
217	Guinsiman Gringo	220	Taxpayer	2015-02-04 01:55:04.096075	2015-02-04 01:55:04.096075
218	Pedring Jocelyn	221	Taxpayer	2015-02-04 01:57:19.057238	2015-02-04 01:57:19.057238
219	Domingo Milagros	222	Taxpayer	2015-02-04 02:18:15.952739	2015-02-04 02:18:15.952739
220	Dulawan Ereny	223	Taxpayer	2015-02-04 02:20:14.730808	2015-02-04 02:20:14.730808
221	Paris Jucy	224	Taxpayer	2015-02-04 02:21:59.271613	2015-02-04 02:21:59.271613
222	Olsim Mary An	225	Taxpayer	2015-02-04 02:25:02.943844	2015-02-04 02:25:02.943844
223	Inguhan Marieta	226	Taxpayer	2015-02-04 02:27:00.704465	2015-02-04 02:27:00.704465
225	Palongya Brendalyn	228	Taxpayer	2015-02-04 02:30:54.518608	2015-02-04 02:30:54.518608
226	Puyao Janet	229	Taxpayer	2015-02-04 02:32:59.258826	2015-02-04 02:32:59.258826
228	Lindawan Florence	231	Taxpayer	2015-02-04 02:36:28.466599	2015-02-04 02:36:28.466599
229	Lindawan Nora	232	Taxpayer	2015-02-04 02:38:22.381469	2015-02-04 02:38:22.381469
230	Tabbangao Jocelyn	233	Taxpayer	2015-02-04 02:39:38.551458	2015-02-04 02:39:38.551458
231	Paay Sonia	234	Taxpayer	2015-02-04 02:41:06.316717	2015-02-04 02:41:06.316717
232	Bongtiwen Anita	235	Taxpayer	2015-02-04 02:43:33.566734	2015-02-04 02:43:33.566734
233	Alilao Theresita	236	Taxpayer	2015-02-04 02:44:58.532984	2015-02-04 02:44:58.532984
234	Tacio Julie	237	Taxpayer	2015-02-04 02:46:44.871055	2015-02-04 02:46:44.871055
235	Pecon Christine	238	Taxpayer	2015-02-04 02:48:47.327729	2015-02-04 02:48:47.327729
236	Biniahan Corazon	239	Taxpayer	2015-02-04 02:50:14.677575	2015-02-04 02:50:14.677575
237	Pasigon Adela	240	Taxpayer	2015-02-04 02:52:10.800864	2015-02-04 02:52:10.800864
238	Macario Nerisa	241	Taxpayer	2015-02-04 02:53:22.826626	2015-02-04 02:53:22.826626
239	Ngo-oy Manuela	242	Taxpayer	2015-02-04 02:55:02.153957	2015-02-04 02:55:02.153957
240	Wanhay Jonalyn	243	Taxpayer	2015-02-04 02:59:38.215846	2015-02-04 02:59:38.215846
241	Balinggan Roger	244	Taxpayer	2015-02-04 03:02:42.388017	2015-02-04 03:02:42.388017
242	Patnaan Yolanda	245	Taxpayer	2015-02-04 03:04:05.867389	2015-02-04 03:04:05.867389
243	Daluyon Anie Rose	246	Taxpayer	2015-02-04 03:05:58.460771	2015-02-04 03:05:58.460771
245	Lingbanan Brenda	248	Taxpayer	2015-02-04 03:08:40.825186	2015-02-04 03:08:40.825186
246	Mayumis Angela	249	Taxpayer	2015-02-04 03:10:11.865805	2015-02-04 03:10:11.865805
247	Nehyeban Gloria	250	Taxpayer	2015-02-04 03:12:02.603865	2015-02-04 03:12:02.603865
248	Calya-en Ruby Ann	251	Taxpayer	2015-02-04 03:13:19.382992	2015-02-04 03:13:19.382992
250	Inguhan Concepcion	253	Taxpayer	2015-02-04 03:16:13.442078	2015-02-04 03:16:13.442078
251	Galwan Cela	254	Taxpayer	2015-02-04 03:17:17.709936	2015-02-04 03:17:17.709936
252	Marcos Junila	255	Taxpayer	2015-02-04 03:18:29.373799	2015-02-04 03:18:29.373799
254	Dupos Agustin	257	Taxpayer	2015-02-04 03:21:07.012375	2015-02-04 03:21:07.012375
257	Dummang Lydia	260	Taxpayer	2015-02-04 03:25:28.237703	2015-02-04 03:25:28.237703
258	Awihan Philip	261	Taxpayer	2015-02-04 03:27:03.388464	2015-02-04 03:27:03.388464
260	Cutiyog Mariano	263	Taxpayer	2015-02-04 03:29:43.22378	2015-02-04 03:29:43.22378
262	Wanhay Elvira	265	Taxpayer	2015-02-04 03:33:00.242641	2015-02-04 03:33:00.242641
177	Pinkihan Berto	180	Taxpayer	2015-02-04 00:08:22.918813	2015-02-15 15:07:40.212125
178	Domingo Jessie Faith	181	Taxpayer	2015-02-04 00:11:49.058346	2015-02-15 15:25:37.205817
172	Baludda Popoy	175	Taxpayer	2015-02-02 06:03:27.851302	2015-02-15 15:34:56.991087
214	Cdap Hector	217	Taxpayer	2015-02-04 01:50:31.89435	2015-02-16 01:28:20.866332
198	Bongtiwon Violeta	201	Taxpayer	2015-02-04 01:21:53.722492	2015-02-16 01:44:56.948859
255	Carlos Cherryl	258	Taxpayer	2015-02-04 03:22:37.572323	2015-02-16 02:14:07.210878
261	Aluney Jenelita	264	Taxpayer	2015-02-04 03:31:15.566488	2015-02-16 03:03:44.988138
253	Dominguez Aloysius	256	Taxpayer	2015-02-04 03:19:45.433435	2015-02-16 03:06:53.38019
244	Lumauig Feliza	247	Taxpayer	2015-02-04 03:07:35.312355	2015-02-16 05:26:58.529437
256	Comti Olivia	259	Taxpayer	2015-02-04 03:24:00.305582	2015-02-16 05:31:39.426913
227	Mangibin Crisantine	230	Taxpayer	2015-02-04 02:34:37.536578	2015-02-16 05:50:32.605997
224	Lindawan Jerry	227	Taxpayer	2015-02-04 02:29:18.830867	2015-02-16 05:51:31.240995
263	Liwan Lariza	266	Taxpayer	2015-02-04 03:34:27.077619	2015-02-04 03:34:27.077619
265	Gullunan Josie	268	Taxpayer	2015-02-04 03:36:43.612572	2015-02-04 03:36:43.612572
266	Tobiagon Brenda	269	Taxpayer	2015-02-04 03:37:56.829029	2015-02-04 03:37:56.829029
267	Bayogao Marlyn	270	Taxpayer	2015-02-04 03:39:20.477892	2015-02-04 03:39:20.477892
268	Dalang Geraldine	271	Taxpayer	2015-02-04 03:40:27.338766	2015-02-04 03:40:27.338766
269	Cabiadan Purita	272	Taxpayer	2015-02-04 03:41:43.685335	2015-02-04 03:41:43.685335
270	Saldaan Isabel	273	Taxpayer	2015-02-04 03:43:16.189474	2015-02-04 03:43:16.189474
271	Pagaspas Rodelyn	274	Taxpayer	2015-02-04 03:44:29.295204	2015-02-04 03:44:29.295204
272	Hidalgo Marcela	275	Taxpayer	2015-02-04 03:45:51.877877	2015-02-04 03:45:51.877877
273	Bellit Rosita	276	Taxpayer	2015-02-04 03:49:08.919864	2015-02-04 03:49:08.919864
274	Huldong Nenita	277	Taxpayer	2015-02-04 03:50:33.025873	2015-02-04 03:50:33.025873
275	Biniahan Celso	278	Taxpayer	2015-02-04 03:52:20.482537	2015-02-04 03:52:20.482537
276	Innad Clarita	279	Taxpayer	2015-02-04 03:55:30.246236	2015-02-04 03:55:30.246236
278	Paduyao Marciana	281	Taxpayer	2015-02-04 03:58:20.370726	2015-02-04 03:58:20.370726
279	Bingit Terio	282	Taxpayer	2015-02-04 04:00:09.539591	2015-02-04 04:00:09.539591
282	Basilio Joel	285	Taxpayer	2015-02-04 04:52:14.209394	2015-02-04 04:52:14.209394
284	Polista Jorgina	287	Taxpayer	2015-02-04 04:56:35.113924	2015-02-04 04:56:35.113924
285	Binay-an Sherly	288	Taxpayer	2015-02-04 04:57:54.771552	2015-02-04 04:57:54.771552
286	Baucas Maria	289	Taxpayer	2015-02-04 04:59:18.155354	2015-02-04 04:59:18.155354
287	Bulintao Mary Ellen	290	Taxpayer	2015-02-04 05:00:40.731502	2015-02-04 05:00:40.731502
288	Simeon Norma	291	Taxpayer	2015-02-04 05:03:41.095348	2015-02-04 05:03:41.095348
289	Benson Remy	292	Taxpayer	2015-02-04 05:04:58.179277	2015-02-04 05:04:58.179277
290	Humiwat Norma	293	Taxpayer	2015-02-04 05:06:18.694443	2015-02-04 05:06:18.694443
291	Domingo David	294	Taxpayer	2015-02-04 05:07:53.480722	2015-02-04 05:07:53.480722
292	Polito Eliza	295	Taxpayer	2015-02-04 05:09:11.88619	2015-02-04 05:09:11.88619
249	Bonoy Selma	252	Taxpayer	2015-02-04 03:14:34.508697	2015-02-05 07:04:19.394362
293	Saltino Garcia	296	Taxpayer	2015-02-06 07:11:17.612992	2015-02-06 07:11:17.612992
102	Guyon Roy	105	Taxpayer	2015-01-29 01:19:40.787693	2015-02-09 05:34:10.32088
283	Ramos Gladys	286	Taxpayer	2015-02-04 04:53:25.554571	2015-02-09 05:40:06.2871
294	Wayas Florenda	297	Taxpayer	2015-02-09 07:01:19.250414	2015-02-09 07:01:19.250414
295	Pinkihan Rita	298	Taxpayer	2015-02-09 07:51:54.958342	2015-02-09 07:51:54.958342
296	Nginhayan Lilian	299	Taxpayer	2015-02-09 07:53:28.723627	2015-02-09 07:53:28.723627
297	Nginhayan Satur	300	Taxpayer	2015-02-09 07:55:30.651206	2015-02-09 07:55:30.651206
298	Palangyo Regine	301	Taxpayer	2015-02-09 07:57:05.686691	2015-02-09 07:57:05.686691
299	Galwan Rosing	302	Taxpayer	2015-02-09 07:58:53.637204	2015-02-09 07:58:53.637204
300	Casinto Pepe	303	Taxpayer	2015-02-09 08:00:44.108914	2015-02-09 08:00:44.108914
301	Balangui Sonny	304	Taxpayer	2015-02-09 08:02:24.388759	2015-02-09 08:02:24.388759
302	Dulnuan Glory	305	Taxpayer	2015-02-10 06:32:41.054717	2015-02-10 06:32:41.054717
281	Manuelo Vangie	284	Taxpayer	2015-02-04 04:49:47.499338	2015-02-10 07:20:14.572624
2	Dincog Rebecca	16	Taxpayer	2015-01-27 02:19:16.665351	2015-02-14 11:09:15.2617
305	Francisco Shenanndoah	37	Taxpayer	2015-02-14 11:17:59.177363	2015-02-14 11:17:59.177363
306	Appay Stephen	38	Taxpayer	2015-02-14 11:20:42.915288	2015-02-14 11:20:42.915288
48	Appay Stephen	1	Taxpayer	2015-01-27 08:33:47.289958	2015-02-14 11:21:05.577901
307	Cahlangan Joseph	39	Taxpayer	2015-02-14 11:24:35.66734	2015-02-14 11:24:35.66734
308	Cutiyog Mariano	40	Taxpayer	2015-02-14 11:38:56.757948	2015-02-14 11:38:56.757948
309	Pugong Jr Tomas	41	Taxpayer	2015-02-14 11:42:16.378664	2015-02-14 11:42:16.378664
310	Pugong Jr Tomas	9	Taxpayer	2015-02-14 11:43:05.090538	2015-02-14 11:43:05.090538
311	Cuyao Viola	42	Taxpayer	2015-02-14 11:47:53.732361	2015-02-14 11:47:53.732361
312	Cuyao Viola	19	Taxpayer	2015-02-14 11:48:23.579178	2015-02-14 11:48:23.579178
313	Pilay Marciana	43	Taxpayer	2015-02-14 11:50:20.105956	2015-02-14 11:50:20.105956
314	Ahingwa Pablito	44	Taxpayer	2015-02-14 11:54:58.356532	2015-02-14 11:54:58.356532
46	Ahingwa Pablito	2	Taxpayer	2015-01-27 08:32:30.221115	2015-02-14 11:55:23.322121
315	Damullog Solinia	45	Taxpayer	2015-02-14 11:57:15.027814	2015-02-14 11:57:15.027814
316	Abuan Lity	46	Taxpayer	2015-02-14 12:00:30.483063	2015-02-14 12:00:30.483063
317	Dulnuan Jacqueline	47	Taxpayer	2015-02-14 12:03:58.481359	2015-02-14 12:03:58.481359
318	Sinak-ey Dora	48	Taxpayer	2015-02-14 12:06:12.000932	2015-02-14 12:06:12.000932
319	Calion Jocelyn	49	Taxpayer	2015-02-14 12:12:43.940952	2015-02-14 12:12:43.940952
320	Uybaan Marcela	50	Taxpayer	2015-02-14 12:14:43.971675	2015-02-14 12:14:43.971675
259	Uybaan Marcela	10	Taxpayer	2015-02-04 03:28:24.452426	2015-02-14 12:17:16.093234
321	Cuyasen Yulie	51	Taxpayer	2015-02-14 12:18:38.9779	2015-02-14 12:18:38.9779
322	Matso Nadia	52	Taxpayer	2015-02-14 12:20:42.830856	2015-02-14 12:20:42.830856
323	Danao Sheanymar	53	Taxpayer	2015-02-14 12:23:00.286019	2015-02-14 12:23:00.286019
324	Pacleb Elsie	54	Taxpayer	2015-02-14 12:27:02.055754	2015-02-14 12:27:02.055754
325	Langdew Jovena	55	Taxpayer	2015-02-14 12:30:27.961513	2015-02-14 12:30:27.961513
326	Domingo Carlito	56	Taxpayer	2015-02-14 12:32:36.699952	2015-02-14 12:32:36.699952
327	Baguilat Zenaida	57	Taxpayer	2015-02-15 06:06:07.628214	2015-02-15 06:06:07.628214
328	Nibaten Norma	13	Taxpayer	2015-02-15 13:04:37.720806	2015-02-15 13:04:37.720806
329	Tumayan Glen	91	Taxpayer	2015-02-15 14:13:21.681936	2015-02-15 14:13:21.681936
100	Balahya Imaya Jovana	103	Taxpayer	2015-01-29 01:07:13.949325	2015-02-15 14:16:07.239979
280	Ballagan Deborah	283	Taxpayer	2015-02-04 04:47:31.3875	2015-02-16 02:14:53.820237
277	Abuan Jacqueline	280	Taxpayer	2015-02-04 03:56:51.926758	2015-02-16 02:20:50.880181
264	Wahit Maryjane	267	Taxpayer	2015-02-04 03:35:38.70351	2015-02-16 02:57:48.920846
330	Bangdo Joy	262	Taxpayer	2015-02-16 03:16:20.192271	2015-02-16 03:16:20.192271
331	Bongtiwen Anita	306	Taxpayer	2015-02-16 03:56:17.68792	2015-02-16 03:56:17.68792
332	Lingbanan Brenda	307	Taxpayer	2015-02-16 05:20:58.927183	2015-02-16 05:20:58.927183
333	Lingbanan Brenda	308	Taxpayer	2015-02-16 05:22:00.046127	2015-02-16 05:22:00.046127
334	Lingbanan Brenda	309	Taxpayer	2015-02-16 05:22:46.851371	2015-02-16 05:22:46.851371
\.


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pg_search_documents_id_seq', 334, true);


--
-- Data for Name: police_clearances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY police_clearances (id, other_identification_marks, remarks, purpose, build, height, weight, taxpayer_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: police_clearances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('police_clearances_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20141214040345
20141215122055
20141219134714
20150112133600
20150113025425
20150113031014
20150118123747
20150119104120
20150123010016
20150123015714
20150127003419
20150209030846
20150217025610
\.


--
-- Data for Name: taxpayers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY taxpayers (id, first_name, middle_name, last_name, suffix, civil_status, date_of_birth, place_of_birth, occupation, gender, profile_image_id, email, mobile_number, tin_number, cedula_number, address_sitio, address_street, address_barangay, address_subdivision, address_municipality, address_province, cedula_place_issued, cedula_date_issued, status, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at) FROM stdin;
17	Romeo 	P	Abluyan	\N	\N	\N	\N	\N	\N	675af65fcfe52acefc1c2e5a225fcfefa97e2b6799ac02e2613a27e0249e	none	none	\N	30285778	\N	Tabangawen	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-14 10:02:25.552311	2015-02-14 10:03:54.07586	\N	\N	\N	\N
16	Rebecca	Tayaban	Dincog	\N	\N	\N	\N	\N	\N	a14313ea6dc5e96a271208da3c42127d0997b6747fb5258e541846ccbf68		09056809891	\N	30285130	\N	Danggo	Danggo	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-14	\N	2015-02-14 11:08:31.558009	2015-02-14 11:09:15.210201	\N	\N	\N	\N
69	Abraham	Egua	Ballual	\N	\N	\N	\N	\N	\N	e7d93e1ba76443fc400cac5404013d7fdfd02ab7529de559bc6780eca620		09157941139	\N	30286134	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-27	\N	2015-02-14 11:13:47.829992	2015-02-14 11:14:38.75756	\N	\N	\N	\N
66	Shenandoah	N	Francisco	\N	\N	\N	\N	\N	\N	2bfdf4cb65dbbb73a143d136ead5ece4cb4baf3627061da21fdedc3c6ec8		none	\N	30285933	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-14 11:17:59.161834	2015-02-14 11:18:51.867207	\N	\N	\N	\N
1	Stephen	Hallip	Appay	\N	\N	\N	\N	\N	\N	fa75de6f907028a8bbaa5caa9e591bcb0d9f7677119f93c628efd04aee2e		none	\N	30285855	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-13	\N	2015-02-14 11:20:42.902668	2015-02-14 11:21:05.560811	\N	\N	\N	\N
67	Joseph	T	Cahlangan	\N	\N	\N	\N	\N	\N	2eaaf74278ab18ebc52201d4506ce6eeee30ce26a0d16f1065fb602ffb2e		none	\N	30285429	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-14 11:24:35.65373	2015-02-14 11:25:16.203087	\N	\N	\N	\N
18	Mariano	B	Cutiyog	\N	\N	\N	\N	\N	\N	d9b16612ac033915c6671d41cd19822c4685a76aae9d77c6fb4e91578e39		none	\N	30285781	\N	Tawang	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-14 11:38:56.742632	2015-02-14 11:39:47.331999	\N	\N	\N	\N
9	Tomas	Lagaban	Pugong Jr	\N	\N	\N	\N	\N	\N	563a3a32447f6bb6463465d138142acf5733f27fd180b00c058d35d098ed		none	\N	30285874	\N	Pantal	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-14 11:42:16.364682	2015-02-14 11:43:05.074189	\N	\N	\N	\N
19	Viola	Dulnuan	Cuyao	\N	\N	\N	\N	\N	\N	161176130e674d35fe2ceabbfce948e249c65aa76c4b22dbe6eb871ce295		none	\N	30285780	\N	Wangwang	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-14 11:47:53.72083	2015-02-14 11:48:23.563019	\N	\N	\N	\N
62	Marciana	D	Pilay	\N	\N	\N	\N	\N	\N	ddad5ce8a37ba992d7213d70432151f1a989e90ba1b16e6906d0cabbb5fa		none	\N	30284778	\N	Ababba	Tukucan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-11	\N	2015-02-14 11:50:20.084507	2015-02-14 11:51:18.091107	\N	\N	\N	\N
2	Pablito	Carino	Ahingwa	\N	\N	\N	\N	\N	\N	779cc4384a776b60b9f8e4c95db06eba9ba46dc8ab73fd4316adba5df710		none	\N	30285296	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-14	\N	2015-02-14 11:54:58.337954	2015-02-14 11:55:23.305167	\N	\N	\N	\N
8	Solinia	Kidmano	Damullog	\N	\N	\N	\N	\N	\N	da4a341612019670ed54805debf17696e4e62ce68b109ab763f6b2f426d6		09262910430	\N	30286004	\N	Huhlukan	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-22	\N	2015-02-14 11:57:15.013221	2015-02-14 11:58:46.383493	\N	\N	\N	\N
5	Lity	Sab-it	Abuan	\N	\N	\N	\N	\N	\N	2a6965f052d34e16cba130d97c0156e237d02a0cec8057da670a232a6859	ls_abuan07@yahoo.com	09104466272	\N	30285917	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-16	\N	2015-02-14 12:00:30.466447	2015-02-14 12:01:10.125732	\N	\N	\N	\N
4	Jacqueline	Sendac	Dulnuan	\N	\N	\N	\N	\N	\N	861dbc91300f6e999ca133cf5332b27cb0885f235af7e95a07375290fd33		none	\N	30285942	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-22	\N	2015-02-14 12:03:58.464525	2015-02-14 12:04:26.81093	\N	\N	\N	\N
25	Dora	Basilio	Sinak-ey	\N	\N	\N	\N	\N	\N	4b4e4d9895cc71342a14cbf42cb18b419d87524b4c51b6b4bad3df184dad		09169175848	\N	30285609	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-08	\N	2015-02-14 12:06:11.98354	2015-02-14 12:06:45.295541	\N	\N	\N	\N
73	Jocelyn	T	Calion	\N	\N	\N	\N	\N	\N	93a12c6a083da3a37acc78e677c52905a689f59bc5b7c3703468b336b32b		none	\N	30285710	\N	Pantal	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-05	\N	2015-02-14 12:12:43.926161	2015-02-14 12:13:06.907193	\N	\N	\N	\N
10	Marcela	B	Uybaan	\N	\N	\N	\N	\N	\N	715d5eb514d83f94e54b58e65f9093592ce6976532002e62de921043b8d9		none	\N	30285881	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-14 12:14:43.957981	2015-02-14 12:17:16.086147	\N	\N	\N	\N
61	Yulie	L	Cuyasen	\N	\N	\N	\N	\N	\N	4cdcd414a67cb4be7da982a5284457d33fbea9ec5706a1b9142428e0ede4		none	\N	30285873	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-21	\N	2015-02-14 12:18:38.965914	2015-02-14 12:19:12.294864	\N	\N	\N	\N
11	Nadia	Aluney	Matso	\N	\N	\N	\N	\N	\N	e1f1123f615eb0ca73cca7ddd1479f6728096b4e18db864ec8e716059c09		none	\N	30285934	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-14 12:20:42.816689	2015-02-14 12:21:11.344879	\N	\N	\N	\N
15	Sheanymar	Alindayo	Danao	\N	\N	\N	\N	\N	\N	0e449fc401b331119230e3098ea6e0d8a424777301f677dee695283db387		09167049945	\N	29177713	\N	Abat	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-05	\N	2015-02-14 12:23:00.268529	2015-02-14 12:23:46.113919	\N	\N	\N	\N
7	Elsie	S	Pacleb	\N	\N	\N	\N	\N	\N	26a3de66da2447d8317b84c5949e7899492f3e17e49068c91da08d6ad6f7		none	\N	30285929	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-19	\N	2015-02-14 12:27:02.04026	2015-02-14 12:27:22.731607	\N	\N	\N	\N
24	Jovena	Tok-cho	Langdew	\N	\N	\N	\N	\N	\N	71e642b68a7c26609cc2a8233f3ac4cf1d7e2d98dc3a4aca0e19cc023dbf		none	\N	0285810	\N	Pantal	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-27	\N	2015-02-14 12:30:27.943254	2015-02-14 12:30:55.491714	\N	\N	\N	\N
23	Carlito	Ulnas	Domingo	\N	\N	\N	\N	\N	\N	174f398dd2f7965cd36981dfebd833b6b0e4333ef3503a37d7814f07858d		none	\N	30285809	\N	Pantal	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-14 12:32:36.683204	2015-02-14 12:33:18.884491	\N	\N	\N	\N
21	Zenaida	Tindungan	Baguilat	\N	\N	\N	\N	\N	\N	\N		none	\N	30285753	\N	Amueg	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-21	\N	2015-02-15 06:06:07.276315	2015-02-15 06:14:20.55855	\N	\N	\N	\N
68	Rowena	M	Likiyan	\N	\N	\N	\N	\N	\N	\N		none	\N	30285619	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-15 06:15:52.638522	2015-02-15 06:16:45.909864	\N	\N	\N	\N
22	Yolanda	Buyawe	Patnaan	\N	\N	\N	\N	\N	\N	\N		none	\N	30285766	\N	Tabangawen	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-22	\N	2015-02-15 06:18:17.754887	2015-02-15 06:18:39.610444	\N	\N	\N	\N
63	Melba	W	Donato	\N	\N	\N	\N	\N	\N	\N		none	\N	30284787	\N	Ababba	Tukucan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-10	\N	2015-02-15 06:19:55.853236	2015-02-15 06:20:14.710347	\N	\N	\N	\N
13	Norma	Wanhay	Nibaten	\N	\N	\N	\N	\N	\N	\N		09176670671	\N	30285715	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-05	\N	2015-02-15 13:04:37.537695	2015-02-15 13:04:37.537695	\N	\N	\N	\N
65	Merilyn	S	Legaspi	\N	\N	\N	\N	\N	\N	\N		none	\N	30285278	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-05	\N	2015-02-15 13:11:11.314454	2015-02-15 13:11:11.314454	\N	\N	\N	\N
6	Luisa	Lasbacan	Bandao	\N	\N	\N	\N	\N	\N	bdccdfb4d866599813a1511ec980b22bc063fa8269ccc70232a0551e16c8		none	\N	30285947	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-15 13:13:40.478663	2015-02-15 13:13:52.477069	\N	\N	\N	\N
3	Sonia	Lumauig	Calansanan	\N	\N	\N	\N	\N	\N	2abf77a8ceca48d360158a1144747dca6b9661485f1e171df0261868286b		none	\N	30285283	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-09	\N	2015-02-15 13:09:08.376934	2015-02-15 13:14:13.743914	\N	\N	\N	\N
60	Meriam	Garcia	Lomicio	\N	\N	\N	\N	\N	\N	\N		09154814065	\N	30285907	\N	Abat	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-13	\N	2015-02-15 13:15:48.44123	2015-02-15 13:15:48.44123	\N	\N	\N	\N
71	Felicidad	C	Anayasan	\N	\N	\N	\N	\N	\N	\N		09359362459	\N	30285227	\N	Pantal	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-19	\N	2015-02-15 13:19:49.787706	2015-02-15 13:19:49.787706	\N	\N	\N	\N
12	Jonathan	A	Dugyon	\N	\N	\N	\N	\N	\N	2a3adfa092a2d7be109dd47acd4e37cf383535a4acd9e2410b3635abe4a5		09359348204	\N	30286075	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-15 13:22:25.315512	2015-02-15 13:22:39.962701	\N	\N	\N	\N
74	Charlotte	Masilem	Lacbongan	\N	\N	\N	\N	\N	\N	\N	bezlot_21@yahoo.com	09462922265	\N	30285081	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-15	\N	2015-02-15 13:25:04.309447	2015-02-15 13:25:04.309447	\N	\N	\N	\N
59	Esberta	Tayaban	Aydinan	\N	\N	\N	\N	\N	\N	\N		none	\N	30285771	\N	Pamulubulan	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-25	\N	2015-02-15 13:26:49.205536	2015-02-15 13:26:49.205536	\N	\N	\N	\N
97	Susan	Legaspi	Diwag	\N	\N	\N	\N	\N	\N	\N		09061522278	\N	30285602	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-05	\N	2015-02-15 13:28:25.028243	2015-02-15 13:28:25.028243	\N	\N	\N	\N
75	Benilda	Sagayo	Choj-yag	\N	\N	\N	\N	\N	\N	c0b13ee46b2c6318ba3cb4fc69c82f8abfef009e51891060d7ace9ad5c8d		09161359923	\N	30285467	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-06	\N	2015-02-15 13:30:08.678697	2015-02-15 13:30:20.782779	\N	\N	\N	\N
76	Yolanda	Ullanio	Kiput	\N	\N	\N	\N	\N	\N	\N		none	\N	30285481	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-18	\N	2015-02-15 13:32:51.112472	2015-02-15 13:32:51.112472	\N	\N	\N	\N
83	Febie	Uybaan	Torio	\N	\N	\N	\N	\N	\N	\N		none	\N	30285928	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-19	\N	2015-02-15 13:34:31.284389	2015-02-15 13:34:31.284389	\N	\N	\N	\N
304	Sonny	Palangyo	Balangui	\N	\N	\N	\N	\N	\N	\N	Balanagui	none	\N	none	\N	Tuking	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:52:32.917125	2015-02-16 01:52:32.917125	\N	\N	\N	\N
297	Florenda	Inguhan	Wayas	\N	\N	\N	\N	\N	\N	\N		none	\N	30285635	\N		Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:53:40.049428	2015-02-16 01:53:40.049428	\N	\N	\N	\N
77	Lino	T	Timbuloy	\N	\N	\N	\N	\N	\N	699dfc17da03e8be7be208e57e6c8d3f0b139189cefd3397982297185f10		none	\N	30286017	\N		Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-15 13:35:54.645666	2015-02-15 13:36:05.576112	\N	\N	\N	\N
78	Linda	Nehyeban	Quinocop	\N	\N	\N	\N	\N	\N	\N		09354391389	\N	30285220	\N	Pantal	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-04	\N	2015-02-15 13:37:52.289634	2015-02-15 13:37:52.289634	\N	\N	\N	\N
86	Estrelita	Guyon	Mariano	\N	\N	\N	\N	\N	\N	15749aa651f295ff5d11f3bf326a290587a5767a1929db98b58c78a60736		09162096023	\N	30285623	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-28	\N	2015-02-15 13:39:13.513499	2015-02-15 13:39:13.513499	\N	\N	\N	\N
84	Marlene	Kupe	Sindac	\N	\N	\N	\N	\N	\N	\N		none	\N	30285869	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-18	\N	2015-02-15 13:40:16.533657	2015-02-15 13:40:16.533657	\N	\N	\N	\N
104	Nenita	Aghan	Tiway	\N	\N	\N	\N	\N	\N	\N		none	\N	30285863	\N	Ababba	Tukucan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-15	\N	2015-02-15 13:41:32.298071	2015-02-15 13:41:32.298071	\N	\N	\N	\N
93	Richie	Pigudo	Buhong	\N	\N	\N	\N	\N	\N	b8a0076817186e468c0e2571c01fabdad0368b5c2349bce70f21e28cc86b		09156974800	\N	30285785	\N	Amueg	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-15 13:43:02.046825	2015-02-15 13:43:02.046825	\N	\N	\N	\N
88	Linda	Tindaan	Tanawe	\N	\N	\N	\N	\N	\N	f3d6baf22e2837028d83a50c20ab3b79a69b174365a2ca5b115df66960b9		09261295545	\N	30285670	\N	Pantal	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-28	\N	2015-02-15 13:45:42.668639	2015-02-15 13:45:42.668639	\N	\N	\N	\N
87	Monmon	Pihayon	Hidung	\N	\N	\N	\N	\N	\N	e650ca9e80515baa3930c05bbc2197a12a3cc96eafa3190f74cf8756ba9f		none	\N	30286135	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-28	\N	2015-02-15 13:47:14.7347	2015-02-15 13:47:14.7347	\N	\N	\N	\N
92	Riza	Sabungan	Danao	\N	\N	\N	\N	\N	\N	\N		09162752009	\N	30286136	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-28	\N	2015-02-15 13:48:37.664415	2015-02-15 13:48:37.664415	\N	\N	\N	\N
79	Josephine	Ballawan	Pilley	\N	\N	\N	\N	\N	\N	\N		none	\N	30285916	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-16	\N	2015-02-15 13:50:57.855646	2015-02-15 13:50:57.855646	\N	\N	\N	\N
101	Yolanda	Maddawat	Cayat	\N	\N	\N	\N	\N	\N	\N		none	\N	30285280	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-18	\N	2015-02-15 13:52:23.599284	2015-02-15 13:52:23.599284	\N	\N	\N	\N
85	Orlino	Bolunsat	Zingabo	\N	\N	\N	\N	\N	\N	\N		none	\N	30285862	\N	Abat	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-15	\N	2015-02-15 13:53:45.772761	2015-02-15 13:53:45.772761	\N	\N	\N	\N
81	Jenny Claire	Dumapong	Canute	\N	\N	\N	\N	\N	\N	\N	jeniclairecanute@yahoo.com	none	\N	jeniclairecanute@yahoo.com	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-16	\N	2015-02-15 13:55:34.672842	2015-02-15 13:55:34.672842	\N	\N	\N	\N
82	Janice	Saldaan	Lacbongan	\N	\N	\N	\N	\N	\N	\N	jims_genmerchandise@yahoo.com	none	\N	30285919	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	30285919	2015-01-16	\N	2015-02-15 13:57:02.20888	2015-02-15 13:57:02.20888	\N	\N	\N	\N
89	Vilma	Martin	Balinggan	\N	\N	\N	\N	\N	\N	\N		09261857074	\N	30285232	\N	Dangla	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-22	\N	2015-02-15 13:58:29.180708	2015-02-15 13:58:29.180708	\N	\N	\N	\N
98	Julio	Bangonan	Duglayan Jr	\N	\N	\N	\N	\N	\N	\N		none	\N	30285864	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-29	\N	2015-02-15 13:59:36.249995	2015-02-15 13:59:36.249995	\N	\N	\N	\N
95	Concepcion	Polino	Tumayan	\N	\N	\N	\N	\N	\N	\N		none	\N	3492201	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-29	\N	2015-02-15 14:01:05.520388	2015-02-15 14:01:05.520388	\N	\N	\N	\N
90	Mylien	Tayaban	Labora	\N	\N	\N	\N	\N	\N	2587d38ca87c8c21200eef6c4b38b631def9dd6c04054c49f82f4fba480d		09155719285	\N	30285392	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-28	\N	2015-02-15 14:02:24.618855	2015-02-15 14:02:24.618855	\N	\N	\N	\N
108	Pepe	Songot	Palongyas	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Ababba	Tukucan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 14:03:33.164941	2015-02-15 14:03:33.164941	\N	\N	\N	\N
105	Roy	Guiniling	Guyon	\N	\N	\N	\N	\N	\N	\N		none	\N	30285956	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-15	\N	2015-02-15 14:04:30.94978	2015-02-15 14:04:30.94978	\N	\N	\N	\N
117	Clarita	Andres	Luciap	\N	\N	\N	\N	\N	\N	39a8d16ad5192de2a22374da6b74ed4e2bf32a9c1aff5765cb37180eeccf		09061839241	\N	30285937	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-15 14:05:48.888814	2015-02-15 14:05:48.888814	\N	\N	\N	\N
80	Victor	Binay-an	Lacbongan Sr	\N	\N	\N	\N	\N	\N	\N		none	\N	0280893	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-18	\N	2015-02-15 14:07:00.125789	2015-02-15 14:07:00.125789	\N	\N	\N	\N
99	Novemia	Dominguez	Mocati	\N	\N	\N	\N	\N	\N	\N		none	\N	302825221	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-06	\N	2015-02-15 14:09:35.526765	2015-02-15 14:09:35.526765	\N	\N	\N	\N
102	Regina	Arsing	Cabinta	\N	\N	\N	\N	\N	\N	\N		none	\N	30285617	\N	Pantal	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-15	\N	2015-02-15 14:10:39.439838	2015-02-15 14:10:39.439838	\N	\N	\N	\N
100	Ernie Jane	Amuay	Balabal	\N	\N	\N	\N	\N	\N	\N		none	\N	30285915	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-16	\N	2015-02-15 14:11:54.306195	2015-02-15 14:11:54.306195	\N	\N	\N	\N
91	Glen	T	Tumayan	\N	\N	\N	\N	\N	\N	79f12c2342e4a3fb7c22b2cff096eccbebb52332df3b701c0b471d6445b5		none	\N	30285223	\N	Pantal	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-07	\N	2015-02-15 14:13:21.669196	2015-02-15 14:13:21.669196	\N	\N	\N	\N
106	Gertrude	Cuyasen	Dumanop	\N	\N	\N	\N	\N	\N	\N		none	\N	3491978	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-08	\N	2015-02-15 14:14:52.537026	2015-02-15 14:14:52.537026	\N	\N	\N	\N
103	Imaya Jovana	Atas	Balahya	\N	\N	\N	\N	\N	\N	\N		none	\N	30280891	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-07	\N	2015-02-15 14:16:07.228049	2015-02-15 14:16:07.228049	\N	\N	\N	\N
96	Jane	Tumayan	Namponan	\N	\N	\N	\N	\N	\N	\N		none	\N	30285281	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-06	\N	2015-02-15 14:18:09.522962	2015-02-15 14:18:09.522962	\N	\N	\N	\N
109	Leonida	B	Dulnuan	\N	\N	\N	\N	\N	\N	\N		none	\N	30282219	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-23	\N	2015-02-15 14:20:00.863382	2015-02-15 14:20:00.863382	\N	\N	\N	\N
113	Julia	Mucati	Tanawe	\N	\N	\N	\N	\N	\N	\N		09169186048	\N	30281914	\N	Pantal	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-27	\N	2015-02-15 14:21:43.273721	2015-02-15 14:21:43.273721	\N	\N	\N	\N
114	Ana	Mensi	Madayag	\N	\N	\N	\N	\N	\N	526a17e1417c9f9c7c631df185e59a29d2c32355dd1f7b993344df2b4087		09363515516	\N	30281914	\N	Macaong	Danggo	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-27	\N	2015-02-15 14:23:22.936222	2015-02-15 14:23:22.936222	\N	\N	\N	\N
115	Candida	Godagod	Cayat	\N	\N	\N	\N	\N	\N	d09ae099689c1a6aee53a2c507609cfe2a5817efc6bafecc09b343498651		09366766167	\N	33633180	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-15 14:25:37.954116	2015-02-15 14:25:37.954116	\N	\N	\N	\N
116	Watson	Lagaban	Pugong	\N	\N	\N	\N	\N	\N	\N		none	\N	30285724	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-05	\N	2015-02-15 14:26:42.499688	2015-02-15 14:26:42.499688	\N	\N	\N	\N
168	Venus	Baucas	Casinto	\N	\N	\N	\N	\N	\N	\N		09251337322	\N	30286140	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-29	\N	2015-02-15 14:28:56.576644	2015-02-15 14:28:56.576644	\N	\N	\N	\N
118	Juliet	Tacio	Godagod	\N	\N	\N	\N	\N	\N	\N		09268553222	\N	30285287	\N	Pantal	Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-15 14:30:21.683299	2015-02-15 14:30:21.683299	\N	\N	\N	\N
127	Portia	Magciano	Gamotlong	\N	\N	\N	\N	\N	\N	\N		none	\N	30286139	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-29	\N	2015-02-15 14:31:16.81736	2015-02-15 14:31:16.81736	\N	\N	\N	\N
119	Jandyma	D	Calpahi	\N	\N	\N	\N	\N	\N	\N		none	\N	30285624	\N	Riverside	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-29	\N	2015-02-15 14:33:29.004038	2015-02-15 14:33:29.004038	\N	\N	\N	\N
120	Melody	a	Aldave	\N	\N	\N	\N	\N	\N	\N		none	\N	30285626	\N	Riverside	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-29	\N	2015-02-15 14:34:21.939894	2015-02-15 14:34:21.939894	\N	\N	\N	\N
121	Eliza	B	Sagywan	\N	\N	\N	\N	\N	\N	eafe229a976a0b559b1be013715c77b79b0b0977681f2c6e3f4d52ccd68f		none	\N	30285625	\N	Riverside	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-29	\N	2015-02-15 14:37:46.804642	2015-02-15 14:38:04.09657	\N	\N	\N	\N
128	Elizabeth	Cuyangan	Tostos	\N	\N	\N	\N	\N	\N	\N		09155793825	\N	30285936	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-15 14:39:38.091889	2015-02-15 14:39:38.091889	\N	\N	\N	\N
196	Virginia	B	Binwihan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Gumhang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 14:40:44.430368	2015-02-15 14:40:44.430368	\N	\N	\N	\N
129	Faustino	Wanawan	Garcia Jr	\N	\N	\N	\N	\N	\N	\N		none	\N	30285366	\N	533 Quirino Avenue	Tambo	\N	Paranaque City	Paranaque City	Tinoc, Ifugao	2014-11-24	\N	2015-02-15 14:42:30.220696	2015-02-15 14:42:30.220696	\N	\N	\N	\N
111	Rita	Lepi	Bugtong	\N	\N	\N	\N	\N	\N	\N		none	\N	30285121	\N		Danggo	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-10-26	\N	2015-02-15 14:44:13.200297	2015-02-15 14:44:13.200297	\N	\N	\N	\N
123	Josephine	P	Aguinao	\N	\N	\N	\N	\N	\N	03e88d54f283d5b75c1afe79480b7b84fd9c53ece5661c0232b434b62649		none	\N	30285627	\N	Riverside	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-29	\N	2015-02-15 14:45:26.278885	2015-02-15 14:45:26.278885	\N	\N	\N	\N
122	Jenny	Pihet	Antonio	\N	\N	\N	\N	\N	\N	375db2913f60299cea2e3d8be383abc5d8fd10d635b9fd623a644a737e49		none	\N	30285628	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-29	\N	2015-02-15 14:46:36.545805	2015-02-15 14:47:00.250738	\N	\N	\N	\N
124	Victoria	Basite	Calpahi	\N	\N	\N	\N	\N	\N	2577a621cabae1171bbe3c929499d74765cfc83f13bdfe17d0b0945e26b6		none	\N	29177943	\N	Manaan	Luhong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-16	\N	2015-02-15 14:48:41.757544	2015-02-15 14:48:41.757544	\N	\N	\N	\N
133	Epifania	B	Binwihan	\N	\N	\N	\N	\N	\N	e8305cc39298526f14a5ccf3bc1ea7bf1da74a49970704f727a6497a55ae		none	\N	30285678	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-29	\N	2015-02-15 14:49:38.829395	2015-02-15 14:49:57.225793	\N	\N	\N	\N
269	Brenda	T	Tobiagon	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:34:46.818986	2015-02-16 05:34:46.818986	\N	\N	\N	\N
172	Cherry Ann	Lupante	Ballagan	\N	\N	\N	\N	\N	\N	ed6dbb8b02d1e6002f235fc0ef716da772e1de20eb1a54bb3d4297cf4374		none	\N	30284587	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-15 14:51:07.469752	2015-02-15 14:51:07.469752	\N	\N	\N	\N
169	Marebeth	Lacbao	Banahan	\N	\N	\N	\N	\N	\N	\N		none	\N	30283092	\N	Ababba	Tukucan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-16	\N	2015-02-15 14:52:24.995744	2015-02-15 14:52:24.995744	\N	\N	\N	\N
134	Mary Jane	Belingon	Pawingi	\N	\N	\N	\N	\N	\N	\N		09361733134	\N	30285794	\N	Batwagan	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-28	\N	2015-02-15 14:54:08.985982	2015-02-15 14:54:08.985982	\N	\N	\N	\N
125	Mialyn	Tumayan	Dayao	\N	\N	\N	\N	\N	\N	\N		none	\N	30285290	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-08	\N	2015-02-15 14:55:13.192201	2015-02-15 14:55:13.192201	\N	\N	\N	\N
126	Jenny	Atos	Dincog	\N	\N	\N	\N	\N	\N	\N		none	\N	30285128	\N		Danggo	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-14	\N	2015-02-15 14:56:36.663573	2015-02-15 14:56:36.663573	\N	\N	\N	\N
20	Analiza	Arison	Nginhayan	\N	\N	\N	\N	\N	\N	\N		none	\N	30286019	\N	Higib	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-26	\N	2015-02-15 14:58:09.476734	2015-02-15 14:58:09.476734	\N	\N	\N	\N
178	Zenaida	Imbudo	Tadao	\N	\N	\N	\N	\N	\N	d42b991b677d46d0bc0a78cf600e78e56fa9ff3c64789658efc80261ff27		09266557261	\N	30285932	\N	Brookside	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-15 14:59:47.219252	2015-02-15 14:59:47.219252	\N	\N	\N	\N
135	Josefa	T	Muhlao	\N	\N	\N	\N	\N	\N	652b066e6c8e49f59662d2a4f5ed13d69bff526ba8ce5175936133bc545e		none	\N	0285768	\N	Batwagan	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-25	\N	2015-02-15 15:00:52.593222	2015-02-15 15:00:52.593222	\N	\N	\N	\N
173	Pauline	K	Lawa	\N	\N	\N	\N	\N	\N	\N		none	\N	30285629	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-30	\N	2015-02-15 15:01:50.265667	2015-02-15 15:01:50.265667	\N	\N	\N	\N
170	Pureza	Dula	Belingon	\N	\N	\N	\N	\N	\N	9ea9154c692eea639ede2edb3883e36ff19c932db36bce8c8d67ff19ac51		none	\N	30286143	\N	Dua-an	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-30	\N	2015-02-15 15:03:02.592024	2015-02-15 15:03:02.592024	\N	\N	\N	\N
174	Abril	Buyagan	Gayaho	\N	\N	\N	\N	\N	\N	\N		09752968415	\N	30285315	\N	Centro	Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-02	\N	2015-02-15 15:04:39.20983	2015-02-15 15:04:39.20983	\N	\N	\N	\N
182	Helen	Agmaliw	Baoy	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Lam-ayan	Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:06:18.424618	2015-02-15 15:06:18.424618	\N	\N	\N	\N
180	Berto	Bahatan	Pinkihan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:07:40.195956	2015-02-15 15:07:40.195956	\N	\N	\N	\N
58	Jonalyn	Caladcadan	Llanga	\N	\N	\N	\N	\N	\N	\N		09067871830	\N	302850909	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-15	\N	2015-02-15 15:09:09.945617	2015-02-15 15:09:09.945617	\N	\N	\N	\N
64	Angelina	Calixto	Locoy	\N	\N	\N	\N	\N	\N	\N		0929-6832-660	\N	30285308	\N		Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-15 15:10:49.720238	2015-02-15 15:10:49.720238	\N	\N	\N	\N
70	Rosemarie	Tindaan	Banaang	\N	\N	\N	\N	\N	\N	\N		none	\N	30285474	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-15 15:12:26.177063	2015-02-15 15:12:26.177063	\N	\N	\N	\N
72	Virginia	A	Dumanop	\N	\N	\N	\N	\N	\N	\N		none	\N	30286063	\N	Amueg	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-20	\N	2015-02-15 15:14:01.577647	2015-02-15 15:14:01.577647	\N	\N	\N	\N
112	Celyn	Aluney	Matso	\N	\N	\N	\N	\N	\N	\N		09272167375	\N	30286131	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-27	\N	2015-02-15 15:15:21.379048	2015-02-15 15:15:21.379048	\N	\N	\N	\N
171	Vaneza	Madiano	Bilagot	\N	\N	\N	\N	\N	\N	\N		none	\N	30286144	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-30	\N	2015-02-15 15:16:22.265616	2015-02-15 15:16:22.265616	\N	\N	\N	\N
132	Moncheline	M	Degorio	\N	\N	\N	\N	\N	\N	\N		none	\N	30284333	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-09-26	\N	2015-02-15 15:17:50.327379	2015-02-15 15:17:50.327379	\N	\N	\N	\N
176	Catherine	Babbacal	Secretario	\N	\N	\N	\N	\N	\N	\N		none	\N	30286132	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-27	\N	2015-02-15 15:19:12.198491	2015-02-15 15:19:19.700688	\N	\N	\N	\N
110	Angelita	Sacla	Hidalgo	\N	\N	\N	\N	\N	\N	\N		none	\N	30282036	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-02-10	\N	2015-02-15 15:20:39.372657	2015-02-15 15:20:39.372657	\N	\N	\N	\N
107	Junia	Tacio	Pilayan	\N	\N	\N	\N	\N	\N	\N		none	\N	3491467	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-11-26	\N	2015-02-15 15:21:55.572781	2015-02-15 15:21:55.572781	\N	\N	\N	\N
131	Leonora	D	Butata	\N	\N	\N	\N	\N	\N	\N		none	\N	3490982	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-09-23	\N	2015-02-15 15:22:58.012538	2015-02-15 15:22:58.012538	\N	\N	\N	\N
179	Johnson	D	Naneng	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:24:20.843129	2015-02-15 15:24:20.843129	\N	\N	\N	\N
181	Jessie Faith	Biniahan	Domingo	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Danggo	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:25:37.191014	2015-02-15 15:25:37.191014	\N	\N	\N	\N
184	Pablo	Maghilo	Ugaldi Jr.	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Danggo	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:26:50.350751	2015-02-15 15:26:50.350751	\N	\N	\N	\N
183	Sherwin	Balassu	Relato	\N	\N	\N	\N	\N	\N	\N		09161685053	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:28:21.605902	2015-02-15 15:28:21.605902	\N	\N	\N	\N
185	Santos	Smith	Halawad	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Luhong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:29:27.972906	2015-02-15 15:29:27.972906	\N	\N	\N	\N
186	Ceasario	Cutiyog	Bahiwag	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:30:39.029865	2015-02-15 15:30:39.029865	\N	\N	\N	\N
187	Aida	Cutiyog	Bahiwag	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:31:35.54551	2015-02-15 15:31:35.54551	\N	\N	\N	\N
188	Alvina	B	Danao	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:32:41.1884	2015-02-15 15:32:41.1884	\N	\N	\N	\N
189	Nena	A	Mucati	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-15 15:33:37.774339	2015-02-15 15:33:44.282703	\N	\N	\N	\N
175	Popoy	Alindoza	Baludda	\N	\N	\N	\N	\N	\N	\N		09269361151	\N	30285654	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-12	\N	2015-02-15 15:34:56.979976	2015-02-15 15:34:56.979976	\N	\N	\N	\N
190	Julieta	B	Polonio	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Tulludan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:26:26.216508	2015-02-16 01:26:26.216508	\N	\N	\N	\N
206	Nancy	D	Banaang	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:27:25.76833	2015-02-16 01:27:25.76833	\N	\N	\N	\N
217	Hector	D	Cdap	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Tulludan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:28:20.852019	2015-02-16 01:28:20.852019	\N	\N	\N	\N
191	Marlyn	T	Paulino	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:29:29.969199	2015-02-16 01:29:29.969199	\N	\N	\N	\N
207	Jona	D	Dimingyay	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:30:41.606204	2015-02-16 01:30:41.606204	\N	\N	\N	\N
192	Joan	A	Kinliyan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:31:52.494187	2015-02-16 01:31:52.494187	\N	\N	\N	\N
193	Georgina	S	Awichen	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:33:18.040854	2015-02-16 01:33:18.040854	\N	\N	\N	\N
208	Analiza	L	Buyya	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:35:40.938823	2015-02-16 01:35:40.938823	\N	\N	\N	\N
195	Agnes	T	Cabutte	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:37:22.053832	2015-02-16 01:37:22.053832	\N	\N	\N	\N
218	Asherlyn	V	Andres	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:39:04.30878	2015-02-16 01:39:04.30878	\N	\N	\N	\N
209	Lourdes	D	Toda	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:41:24.709694	2015-02-16 01:41:24.709694	\N	\N	\N	\N
198	Madonna	B	Salapio	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:42:34.256435	2015-02-16 01:42:34.256435	\N	\N	\N	\N
199	Geronimo	D	Madiano	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:43:38.904575	2015-02-16 01:43:38.904575	\N	\N	\N	\N
201	Violeta	M	Bongtiwon	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:44:56.936515	2015-02-16 01:44:56.936515	\N	\N	\N	\N
210	Evelyn	B	Pigganto	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:45:50.793064	2015-02-16 01:45:50.793064	\N	\N	\N	\N
202	Gunia	B	Hiblawan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:47:12.380407	2015-02-16 01:47:12.380407	\N	\N	\N	\N
194	Pio	Lablabeng	Dangew	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Gumhang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:48:18.395238	2015-02-16 01:48:18.395238	\N	\N	\N	\N
203	Jimmy	P	Lumawig	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:49:15.223698	2015-02-16 01:49:15.223698	\N	\N	\N	\N
204	Aida	N	Paduyao	\N	\N	\N	\N	\N	\N	\N		none	\N	30286363	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-10	\N	2015-02-16 01:50:27.557386	2015-02-16 01:50:27.557386	\N	\N	\N	\N
303	Pepe	Dulnuan	Casinto	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Proper	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 01:51:12.773686	2015-02-16 01:51:12.773686	\N	\N	\N	\N
243	Jonalyn	M	Wanhay	\N	\N	\N	\N	\N	\N	\N		none	\N	30286360	\N		Eheb	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-06	\N	2015-02-16 05:36:54.154439	2015-02-16 05:36:54.154439	\N	\N	\N	\N
296	Garcia	Pablo	Saltino	\N	\N	\N	\N	\N	\N	c99e661ee82b7366b6b6de63695039d14262cdc6c7225de7236800507b5c		none	\N	30285895	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-03	\N	2015-02-16 01:55:17.603121	2015-02-16 01:55:17.603121	\N	\N	\N	\N
305	Glory	Pacsilan	Dulnuan	\N	\N	\N	\N	\N	\N	\N		none	\N	30286364	\N	Pitikan	Luhong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-10	\N	2015-02-16 01:56:24.972013	2015-02-16 01:56:24.972013	\N	\N	\N	\N
252	Selma	C	Bonoy	\N	\N	\N	\N	\N	\N	\N		none	\N	30285895	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-04	\N	2015-02-16 01:57:56.547266	2015-02-16 01:57:56.547266	\N	\N	\N	\N
130	Arnold	M	Bayadang	\N	\N	\N	\N	\N	\N	\N		09269520478	\N	30286086	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-10	\N	2015-02-16 01:59:01.175202	2015-02-16 01:59:01.175202	\N	\N	\N	\N
298	Rita	T	Pinkihan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Banga	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:00:13.897494	2015-02-16 02:00:13.897494	\N	\N	\N	\N
299	Lilian	Pihet	Nginhayan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Banga	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:01:10.344393	2015-02-16 02:01:10.344393	\N	\N	\N	\N
295	Eliza	B	Polito	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:02:01.182262	2015-02-16 02:02:01.182262	\N	\N	\N	\N
300	Satur	Damullog	Nginhayan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Kebkeb	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:03:02.585866	2015-02-16 02:03:02.585866	\N	\N	\N	\N
301	Regine	Casinto	Palangyo	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Kebkeb	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:03:55.345189	2015-02-16 02:03:55.345189	\N	\N	\N	\N
302	Rosing	Minhi	Galwan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Palabayan	Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:06:00.838009	2015-02-16 02:06:00.838009	\N	\N	\N	\N
291	Norma	H	Simeon	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Luhong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:06:52.271234	2015-02-16 02:06:52.271234	\N	\N	\N	\N
292	Remy	B	Benson	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Luhong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:08:53.475263	2015-02-16 02:08:53.475263	\N	\N	\N	\N
290	Mary Ellen	Guyon	Bulintao	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:09:59.048189	2015-02-16 02:09:59.048189	\N	\N	\N	\N
289	Maria	D	Baucas	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:10:45.267438	2015-02-16 02:10:45.267438	\N	\N	\N	\N
287	Jorgina	B	Polista	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao\\	2014-01-01	\N	2015-02-16 02:11:52.419374	2015-02-16 02:11:52.419374	\N	\N	\N	\N
286	Gladys	Pilley	Ramos	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:13:10.876645	2015-02-16 02:13:10.876645	\N	\N	\N	\N
258	Cherryl	D	Carlos	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Eheb	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:14:07.19993	2015-02-16 02:14:07.19993	\N	\N	\N	\N
283	Deborah	C	Ballagan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:14:53.80936	2015-02-16 02:14:53.80936	\N	\N	\N	\N
285	Joel	D	Basilio	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:15:56.960127	2015-02-16 02:15:56.960127	\N	\N	\N	\N
284	Vangie	P	Manuelo	\N	\N	\N	\N	\N	\N	\N		none	\N	30285926	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-10	\N	2015-02-16 02:17:05.354212	2015-02-16 02:17:05.354212	\N	\N	\N	\N
282	Terio	S	Bingit	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:17:56.755352	2015-02-16 02:17:56.755352	\N	\N	\N	\N
280	Jacqueline	B	Abuan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Bawi	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:20:50.866813	2015-02-16 02:20:50.866813	\N	\N	\N	\N
279	Clarita	D	Innad	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:21:51.132816	2015-02-16 02:21:51.132816	\N	\N	\N	\N
215	George	L	Gumangan	\N	\N	\N	\N	\N	\N	\N		none	\N	30285637	\N		Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-16	\N	2015-02-16 02:25:20.307236	2015-02-16 02:25:20.307236	\N	\N	\N	\N
276	Rosita	P	Bellit	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:37:46.548693	2015-02-16 02:37:46.548693	\N	\N	\N	\N
294	David	Tostos	Domingo	\N	\N	\N	\N	\N	\N	\N		none	\N	30284796	\N	Ababba	Tukucan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-12	\N	2015-02-16 02:04:54.004833	2015-02-16 02:39:51.088208	\N	\N	\N	\N
275	Marcela	P	Hidalgo	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Tabuyan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:50:26.758855	2015-02-16 02:50:26.758855	\N	\N	\N	\N
274	Rodelyn	P	Pagaspas	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:51:17.454708	2015-02-16 02:51:17.454708	\N	\N	\N	\N
278	Celso	C	Biniahan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:52:11.032715	2015-02-16 02:52:11.032715	\N	\N	\N	\N
288	Sherly	S	Binay-an	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:53:11.802045	2015-02-16 02:53:11.802045	\N	\N	\N	\N
268	Josie	R	Gullunan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Luhong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:55:09.199843	2015-02-16 02:55:09.199843	\N	\N	\N	\N
271	Geraldine	C	Dalang	\N	\N	\N	\N	\N	\N	\N	none	none	\N	30285317	\N		Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-02	\N	2015-02-16 02:56:50.453705	2015-02-16 02:56:50.453705	\N	\N	\N	\N
267	Maryjane	D	Wahit	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:57:48.904391	2015-02-16 02:57:48.904391	\N	\N	\N	\N
277	Nenita	B	Huldong	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 02:58:53.439066	2015-02-16 02:58:53.439066	\N	\N	\N	\N
266	Lariza	L	Liwan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:00:00.209453	2015-02-16 03:00:00.209453	\N	\N	\N	\N
265	Elvira	B	Wanhay	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Landing	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:01:20.421322	2015-02-16 03:01:20.421322	\N	\N	\N	\N
273	Isabel	B	Saldaan	\N	\N	\N	\N	\N	\N	\N		none	\N	30285312	\N		Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-02	\N	2015-02-16 03:02:33.522569	2015-02-16 03:02:33.522569	\N	\N	\N	\N
264	Jenelita	C	Aluney	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:03:44.974373	2015-02-16 03:03:44.974373	\N	\N	\N	\N
257	Agustin	B	Dupos	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:04:37.528948	2015-02-16 03:04:37.528948	\N	\N	\N	\N
263	Mariano	B	Cutiyog	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Tawang	Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:05:55.25928	2015-02-16 03:05:55.25928	\N	\N	\N	\N
256	Aloysius	T	Dominguez	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:06:53.368021	2015-02-16 03:06:53.368021	\N	\N	\N	\N
255	Junila	S	Marcos	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Eheb	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:14:21.226742	2015-02-16 03:14:21.226742	\N	\N	\N	\N
254	Cela	C	Galwan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:15:13.400758	2015-02-16 03:15:13.400758	\N	\N	\N	\N
262	Joy	Uybaan	Bangdo	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:16:20.180124	2015-02-16 03:16:20.180124	\N	\N	\N	\N
270	Marlyn	P	Bayogao	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:18:47.439825	2015-02-16 03:18:47.439825	\N	\N	\N	\N
253	Concepcion	D	Inguhan	\N	\N	\N	\N	\N	\N	\N		none	\N	30285634	\N		Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-09	\N	2015-02-16 03:17:38.355417	2015-02-16 03:19:47.084501	\N	\N	\N	\N
272	Purita	P	Cabiadan	\N	\N	\N	\N	\N	\N	\N		none	\N	30285317	\N		Ahin	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-02	\N	2015-02-16 03:21:11.482696	2015-02-16 03:21:11.482696	\N	\N	\N	\N
251	Ruby Ann	B	Calya-en	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:22:17.442632	2015-02-16 03:22:17.442632	\N	\N	\N	\N
261	Philip	W	Awihan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Tukucan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:26:01.284495	2015-02-16 03:26:01.284495	\N	\N	\N	\N
250	Gloria	P	Nehyeban	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:27:13.82181	2015-02-16 03:27:13.82181	\N	\N	\N	\N
249	Angela	P	Mayumis	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Eheb	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:28:07.046961	2015-02-16 03:28:07.046961	\N	\N	\N	\N
236	Theresita	G	Alilao	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:29:54.438298	2015-02-16 03:29:54.438298	\N	\N	\N	\N
237	Julie	S	Tacio	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Eheb	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 03:35:40.66425	2015-02-16 03:35:56.898834	\N	\N	\N	\N
281	Marciana	C	Paduyao	\N	\N	\N	\N	\N	\N	\N		none	\N	30285482	\N	Proper	Binablayan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-01-19	\N	2015-02-16 02:54:22.173079	2015-02-16 03:47:52.939789	\N	\N	\N	\N
306	Anita	T	Bongtiwen	\N	\N	\N	\N	\N	\N	\N		none	\N	30286268	\N		Tulludan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-10	\N	2015-02-16 03:56:17.64145	2015-02-16 03:56:17.64145	\N	\N	\N	\N
248	Brenda	C	Lingbanan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:20:58.911305	2015-02-16 05:24:36.103213	\N	\N	\N	\N
260	Lydia	C	Dummang	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Wangwang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:25:56.611174	2015-02-16 05:25:56.611174	\N	\N	\N	\N
247	Feliza	T	Lumauig	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:26:58.508666	2015-02-16 05:26:58.508666	\N	\N	\N	\N
246	Anie Rose	T	Daluyon	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Ap-apid	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:28:07.375881	2015-02-16 05:28:07.375881	\N	\N	\N	\N
259	Olivia	P	Comti	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Eheb	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:31:39.412721	2015-02-16 05:31:39.412721	\N	\N	\N	\N
244	Roger	G	Balinggan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:32:56.690901	2015-02-16 05:32:56.690901	\N	\N	\N	\N
242	Manuela	A	Ngo-oy	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:37:49.831591	2015-02-16 05:37:49.831591	\N	\N	\N	\N
241	Nerisa	A	Macario	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:38:52.200928	2015-02-16 05:38:52.200928	\N	\N	\N	\N
240	Adela	M	Pasigon	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:40:57.644993	2015-02-16 05:40:57.644993	\N	\N	\N	\N
239	Corazon	P	Biniahan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:42:08.333576	2015-02-16 05:42:08.333576	\N	\N	\N	\N
238	Christine	P	Pecon	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Eheb	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:43:31.085156	2015-02-16 05:43:31.085156	\N	\N	\N	\N
233	Jocelyn	B	Tabbangao	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Tulludan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:46:46.056318	2015-02-16 05:46:46.056318	\N	\N	\N	\N
234	Sonia	L	Paay	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Tulludan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:47:44.584669	2015-02-16 05:47:44.584669	\N	\N	\N	\N
232	Nora	E	Lindawan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:49:19.602152	2015-02-16 05:49:19.602152	\N	\N	\N	\N
230	Crisantine	T	Mangibin	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Tulludan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:50:32.594029	2015-02-16 05:50:32.594029	\N	\N	\N	\N
227	Jerry	L	Lindawan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 05:51:31.22349	2015-02-16 05:51:31.22349	\N	\N	\N	\N
226	Marieta	D	Inguhan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:04:28.116122	2015-02-16 06:04:28.116122	\N	\N	\N	\N
225	Mary An	N	Olsim	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:05:56.47845	2015-02-16 06:05:56.47845	\N	\N	\N	\N
229	Janet	M	Puyao	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Tulludan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:08:20.641132	2015-02-16 06:08:20.641132	\N	\N	\N	\N
221	Jocelyn	P	Pedring	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Gumhang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:09:13.840305	2015-02-16 06:09:13.840305	\N	\N	\N	\N
219	Alfredo	S	Ballagan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Ababba	Tukucan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:23:14.04402	2015-02-16 06:23:14.04402	\N	\N	\N	\N
228	Brendalyn	G	Palongya	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Tulludan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:24:19.786357	2015-02-16 06:24:19.786357	\N	\N	\N	\N
220	Gringo	D	Guinsiman	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N	Tupaan	Poblacion	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:25:12.900331	2015-02-16 06:25:12.900331	\N	\N	\N	\N
224	Jucy	L	Paris	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:27:20.283928	2015-02-16 06:27:20.283928	\N	\N	\N	\N
216	Leo	Liganay	Binwihan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:28:16.880542	2015-02-16 06:28:16.880542	\N	\N	\N	\N
213	Jonathan	W	Tindaan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Gumhang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:29:21.299227	2015-02-16 06:29:21.299227	\N	\N	\N	\N
231	Florence	B	Lindawan	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Impugong	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:30:55.300807	2015-02-16 06:30:55.300807	\N	\N	\N	\N
212	Melba	W	Waling	\N	\N	\N	\N	\N	\N	\N		none	\N	none	\N		Gumhang	\N	Tinoc	Ifugao	Tinoc, Ifugao	2014-01-01	\N	2015-02-16 06:32:01.843604	2015-02-16 06:32:01.843604	\N	\N	\N	\N
94	Shirley	Dulnuan	Halip	\N	\N	\N	\N	\N	\N	81cc66d9451511d63cd803fed4a8258bd09942b3a21694b5f8fb6711e6ec		09351885737	\N	none	\N	Kamelbeng	Poblacion	\N	Tinoc	Ifugao	none	0001-01-11	\N	2015-02-14 09:28:33.594978	2015-02-17 03:04:23.678951	halip_shirley.png	image/png	484671	2015-02-17 03:04:22.243166
197	Anabel	A	Apilis	\N	\N	\N	\N	\N	\N	\N		none	\N	30284795	\N	Ababba	Tukucan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-12	\N	2015-02-16 01:40:37.688643	2015-02-17 03:06:45.665862	\N	\N	\N	\N
223	Ereny	A	Dulawan	\N	\N	\N	\N	\N	\N	\N		none	\N	30286271	\N	Alungan	Tulludan	\N	Tinoc	Ifugao	Tinoc, Ifugao	2015-02-11	\N	2015-02-16 01:34:19.422701	2015-02-17 03:20:35.416844	\N	\N	\N	\N
\.


--
-- Name: taxpayers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('taxpayers_id_seq', 62, true);


--
-- Data for Name: type_of_organizations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY type_of_organizations (id, business_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: type_of_organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('type_of_organizations_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, first_name, last_name, mobile_number, profile_image_id, role, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, created_at, updated_at) FROM stdin;
1	Chrisol	Catalino	09201234567	\N	0	chrisol.catalino@tinoc.gov.ph	$2a$10$EWV1nIi8k.6ohGZ9pSyYAuOK319SUiFH2H23DMjwKz8zAttlvHnAC	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	2015-02-14 09:26:58.441575	2015-02-14 09:26:58.441575
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);


--
-- Name: gross_sales_taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY gross_sales_taxes
    ADD CONSTRAINT gross_sales_taxes_pkey PRIMARY KEY (id);


--
-- Name: line_of_businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY line_of_businesses
    ADD CONSTRAINT line_of_businesses_pkey PRIMARY KEY (id);


--
-- Name: mayors_permit_fees_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mayors_permit_fees
    ADD CONSTRAINT mayors_permit_fees_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: pg_search_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pg_search_documents
    ADD CONSTRAINT pg_search_documents_pkey PRIMARY KEY (id);


--
-- Name: police_clearances_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY police_clearances
    ADD CONSTRAINT police_clearances_pkey PRIMARY KEY (id);


--
-- Name: taxpayers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taxpayers
    ADD CONSTRAINT taxpayers_pkey PRIMARY KEY (id);


--
-- Name: type_of_organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY type_of_organizations
    ADD CONSTRAINT type_of_organizations_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_activities_on_owner_id_and_owner_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_owner_id_and_owner_type ON activities USING btree (owner_id, owner_type);


--
-- Name: index_activities_on_recipient_id_and_recipient_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_recipient_id_and_recipient_type ON activities USING btree (recipient_id, recipient_type);


--
-- Name: index_activities_on_trackable_id_and_trackable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_trackable_id_and_trackable_type ON activities USING btree (trackable_id, trackable_type);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

