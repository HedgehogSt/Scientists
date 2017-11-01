--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-11-01 22:36:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 190 (class 1259 OID 26533)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE countries (
    id integer NOT NULL,
    country character varying(80) NOT NULL
);


ALTER TABLE countries OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 26531)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO postgres;

--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 189
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- TOC entry 198 (class 1259 OID 26571)
-- Name: discoveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE discoveries (
    id integer NOT NULL,
    discovery character varying(80) NOT NULL,
    year integer NOT NULL,
    opening_area character varying(80) NOT NULL,
    place character varying(180) NOT NULL,
    CONSTRAINT catalogues_year_check CHECK ((year >= 1500))
);


ALTER TABLE discoveries OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 26569)
-- Name: discoveries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE discoveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE discoveries_id_seq OWNER TO postgres;

--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 197
-- Name: discoveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE discoveries_id_seq OWNED BY discoveries.id;


--
-- TOC entry 192 (class 1259 OID 26543)
-- Name: scientific_awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE scientific_awards (
    id integer NOT NULL,
    the_name_of_the_award character varying(80) NOT NULL,
    year integer NOT NULL,
    country_id integer NOT NULL,
    CONSTRAINT catalogues_year_check CHECK ((year >= 1000))
);


ALTER TABLE scientific_awards OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 26541)
-- Name: scientific_awards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE scientific_awards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientific_awards_id_seq OWNER TO postgres;

--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 191
-- Name: scientific_awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE scientific_awards_id_seq OWNED BY scientific_awards.id;


--
-- TOC entry 194 (class 1259 OID 26553)
-- Name: scientific_spheres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE scientific_spheres (
    id integer NOT NULL,
    scientific_sphere character varying(80) NOT NULL
);


ALTER TABLE scientific_spheres OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 26551)
-- Name: scientific_spheres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE scientific_spheres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientific_spheres_id_seq OWNER TO postgres;

--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 193
-- Name: scientific_spheres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE scientific_spheres_id_seq OWNED BY scientific_spheres.id;


--
-- TOC entry 186 (class 1259 OID 26517)
-- Name: scientists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE scientists (
    id integer NOT NULL,
    name_and_surname character varying(80) NOT NULL,
    date_of_birth date NOT NULL,
    date_of_death date NOT NULL,
    town_of_birth_id integer NOT NULL,
    alma_mater character varying(80) NOT NULL,
    CONSTRAINT catalogues_date_of_birth_check CHECK (((date_of_birth <= date_of_death) AND (date_of_birth >= '1300-01-01'::date)))
);


ALTER TABLE scientists OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 26589)
-- Name: scientists_discoveries_relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE scientists_discoveries_relation (
    id integer NOT NULL,
    id_scientist integer NOT NULL,
    id_scientist_discovery integer NOT NULL
);


ALTER TABLE scientists_discoveries_relation OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 26587)
-- Name: scientists_discoveries_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE scientists_discoveries_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientists_discoveries_relation_id_seq OWNER TO postgres;

--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 201
-- Name: scientists_discoveries_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE scientists_discoveries_relation_id_seq OWNED BY scientists_discoveries_relation.id;


--
-- TOC entry 185 (class 1259 OID 26515)
-- Name: scientists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE scientists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientists_id_seq OWNER TO postgres;

--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 185
-- Name: scientists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE scientists_id_seq OWNED BY scientists.id;


--
-- TOC entry 200 (class 1259 OID 26581)
-- Name: scientists_scientific_awards_relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE scientists_scientific_awards_relation (
    id integer NOT NULL,
    id_scientist integer NOT NULL,
    id_scientific_award integer NOT NULL
);


ALTER TABLE scientists_scientific_awards_relation OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 26579)
-- Name: scientists_scientific_awards_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE scientists_scientific_awards_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientists_scientific_awards_relation_id_seq OWNER TO postgres;

--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 199
-- Name: scientists_scientific_awards_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE scientists_scientific_awards_relation_id_seq OWNED BY scientists_scientific_awards_relation.id;


--
-- TOC entry 196 (class 1259 OID 26563)
-- Name: scientists_spheres_relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE scientists_spheres_relation (
    id integer NOT NULL,
    id_scientist integer NOT NULL,
    id_sphere_of_activity integer NOT NULL
);


ALTER TABLE scientists_spheres_relation OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 26561)
-- Name: scientists_spheres_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE scientists_spheres_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scientists_spheres_relation_id_seq OWNER TO postgres;

--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 195
-- Name: scientists_spheres_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE scientists_spheres_relation_id_seq OWNED BY scientists_spheres_relation.id;


--
-- TOC entry 188 (class 1259 OID 26525)
-- Name: towns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE towns (
    id integer NOT NULL,
    town character varying(80) NOT NULL,
    id_country integer NOT NULL
);


ALTER TABLE towns OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 26523)
-- Name: towns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE towns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE towns_id_seq OWNER TO postgres;

--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 187
-- Name: towns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE towns_id_seq OWNED BY towns.id;


--
-- TOC entry 2052 (class 2604 OID 26536)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- TOC entry 2057 (class 2604 OID 26574)
-- Name: discoveries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discoveries ALTER COLUMN id SET DEFAULT nextval('discoveries_id_seq'::regclass);


--
-- TOC entry 2053 (class 2604 OID 26546)
-- Name: scientific_awards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientific_awards ALTER COLUMN id SET DEFAULT nextval('scientific_awards_id_seq'::regclass);


--
-- TOC entry 2055 (class 2604 OID 26556)
-- Name: scientific_spheres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientific_spheres ALTER COLUMN id SET DEFAULT nextval('scientific_spheres_id_seq'::regclass);


--
-- TOC entry 2049 (class 2604 OID 26520)
-- Name: scientists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists ALTER COLUMN id SET DEFAULT nextval('scientists_id_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 26592)
-- Name: scientists_discoveries_relation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_discoveries_relation ALTER COLUMN id SET DEFAULT nextval('scientists_discoveries_relation_id_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 26584)
-- Name: scientists_scientific_awards_relation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_scientific_awards_relation ALTER COLUMN id SET DEFAULT nextval('scientists_scientific_awards_relation_id_seq'::regclass);


--
-- TOC entry 2056 (class 2604 OID 26566)
-- Name: scientists_spheres_relation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_spheres_relation ALTER COLUMN id SET DEFAULT nextval('scientists_spheres_relation_id_seq'::regclass);


--
-- TOC entry 2051 (class 2604 OID 26528)
-- Name: towns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY towns ALTER COLUMN id SET DEFAULT nextval('towns_id_seq'::regclass);


--
-- TOC entry 2218 (class 0 OID 26533)
-- Dependencies: 190
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO countries VALUES (1, 'Russian_Empire');
INSERT INTO countries VALUES (2, 'Austrian_Empire');
INSERT INTO countries VALUES (3, 'Switzerland');
INSERT INTO countries VALUES (4, 'USA');
INSERT INTO countries VALUES (5, 'New_Zealand');
INSERT INTO countries VALUES (6, 'Germany');
INSERT INTO countries VALUES (7, 'Japan');
INSERT INTO countries VALUES (8, 'RSFSR');
INSERT INTO countries VALUES (9, 'Britain');
INSERT INTO countries VALUES (10, 'France');
INSERT INTO countries VALUES (11, 'Sweden');
INSERT INTO countries VALUES (12, 'Italy');
INSERT INTO countries VALUES (13, 'Israel');
INSERT INTO countries VALUES (14, 'USSR');


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 189
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_id_seq', 14, true);


--
-- TOC entry 2226 (class 0 OID 26571)
-- Dependencies: 198
-- Data for Name: discoveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO discoveries VALUES (1, 'The_Fundamental_Formula_of_Euler', 1740, 'Complex_numbers', 'Introduction_to_the_analysis_of_the_infinitely_small');
INSERT INTO discoveries VALUES (2, 'The_problem_of_rotation_of_a_rigid_body_around_a_fixed_point', 1889, 'Mechanics', 'Acta_Mathematica');
INSERT INTO discoveries VALUES (3, 'Planetary_model_of_the_atom', 1911, 'Atomic_structure', 'The_Scattering_of_?_and_?_Particles_by_Matter_and_the_Structure_of_the_Atom');
INSERT INTO discoveries VALUES (4, 'Tesla_coil', 1896, 'Еlectrical_engineering', 'No');
INSERT INTO discoveries VALUES (5, 'The_periodic_system_of_chemical_elements ', 1869, 'The_dependence_of_the_properties_of_elements_from_their_atomic_mass ', 'The_journal_of_Russian_physico_chemical_society');
INSERT INTO discoveries VALUES (6, 'The_development_of_a_three_part_structural_model_of_the_psyche', 1921, 'Group_psychology_and_the_analysis_human_"I"', 'The_International_Psychoanalytic_Publishing_House');
INSERT INTO discoveries VALUES (7, 'The_origin_of_species ', 1859, 'Natural_selectio_of_organisms ', 'On_the_Origin_of_Species_by_Means_of_Natural_Selection_or_the_Preservation_of_Favoured_Races_in_the_Struggle_for_Life');
INSERT INTO discoveries VALUES (8, 'The_creation_of_the_theory_of_superfluidity_of_liquid helium', 1941, 'Theoretical_physics', 'Theory_of_superfluidity_of_helium_II');
INSERT INTO discoveries VALUES (9, 'The_discovery_of_Radium ', 1898, 'Physics', 'Personal_records');
INSERT INTO discoveries VALUES (10, 'The_equivalence_of_mass_and_energy ', 1907, 'Special relativity', 'About_the_inertia_of_energy_required_by_the_relativity principle');
INSERT INTO discoveries VALUES (11, 'The_discovery_of_Acyclovir ', 1974, 'Pharmacology ', 'No');
INSERT INTO discoveries VALUES (12, 'Becquerel_Rays', 1896, 'Radioactivity', 'Meeting_of_the_Academy');
INSERT INTO discoveries VALUES (13, 'Spontaneous_symmetry_breaking', 2008, 'Subatomic_physics', 'Pontaneous_symmetry_breaking_in_particle_physics:_an_example_of_the_fruitful_exchange_of_ideas');
INSERT INTO discoveries VALUES (14, 'One_of_the_founders_of_laser', 1962, 'Quantum_electronics', 'No');
INSERT INTO discoveries VALUES (15, 'The_founder_of_the_Soviet_school_of_philosophy_of_mathematics', 1930, 'Mathematics', 'Idealism_in_contemporary_philosophy_of_mathematics');
INSERT INTO discoveries VALUES (16, 'Radiochemistry ', 1910, 'Chemistry_ultrarunning_state', 'The_reference_in_article');
INSERT INTO discoveries VALUES (17, 'A_method_of_obtaining_reliable_current', 1891, 'Radiocommunication', 'Public_lecture');
INSERT INTO discoveries VALUES (18, 'Interpretation_of_dreams', 1900, 'Psychoanalysis ', 'Monographic_work');
INSERT INTO discoveries VALUES (19, 'Radioactive_transformations', 1902, 'Nuclear_physics', 'Philosophical Magazine');
INSERT INTO discoveries VALUES (20, 'Radioactivity', 1896, 'Physics', 'The_meeting_of_the_French_Academy_of_Sciences');
INSERT INTO discoveries VALUES (21, 'Controlled_balloon', 1875, 'Aeronautics', 'Russian_technical_society');
INSERT INTO discoveries VALUES (22, 'Quantum_generator', 1954, 'Quantum_electronics', 'The_molecular_oscillator_and_amplifier');
INSERT INTO discoveries VALUES (23, 'Quantum_theory_of_diamagnetism_of_electrons', 1930, 'Physics', 'No');


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 197
-- Name: discoveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('discoveries_id_seq', 23, true);


--
-- TOC entry 2220 (class 0 OID 26543)
-- Dependencies: 192
-- Data for Name: scientific_awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO scientific_awards VALUES (1, 'Nobel_Prize', 1901, 11);
INSERT INTO scientific_awards VALUES (2, 'Copley_medal', 1731, 9);
INSERT INTO scientific_awards VALUES (3, 'The_Wolf_Prize', 1978, 13);
INSERT INTO scientific_awards VALUES (4, 'Davy_medal', 1877, 9);
INSERT INTO scientific_awards VALUES (5, 'IEEE_Edison_Medal', 1909, 4);
INSERT INTO scientific_awards VALUES (6, 'National Medal of Science', 1962, 5);
INSERT INTO scientific_awards VALUES (7, 'Large_gold_medal_named_after_M_V_Lomonosov ', 1959, 14);
INSERT INTO scientific_awards VALUES (8, 'Gold_medal_of_the_Royal_astronomical_society', 1824, 9);
INSERT INTO scientific_awards VALUES (9, 'The_Goethe_Prize', 1927, 6);
INSERT INTO scientific_awards VALUES (10, 'Wollaston_Medal', 1831, 9);
INSERT INTO scientific_awards VALUES (11, 'Medal_Helmholtz', 1892, 6);
INSERT INTO scientific_awards VALUES (12, 'The_John_Scott_Medal', 1822, 4);
INSERT INTO scientific_awards VALUES (13, 'Demidov_prize', 1832, 1);
INSERT INTO scientific_awards VALUES (14, 'Royal_medal', 1826, 9);
INSERT INTO scientific_awards VALUES (15, 'The_Max_Plank_Medal', 1929, 6);
INSERT INTO scientific_awards VALUES (16, 'Medal_of_Matteucci', 1868, 12);
INSERT INTO scientific_awards VALUES (17, 'The_Order_of_Lenin', 1930, 14);
INSERT INTO scientific_awards VALUES (18, 'Lemelson_MIT_Prize', 1995, 4);


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 191
-- Name: scientific_awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('scientific_awards_id_seq', 18, true);


--
-- TOC entry 2222 (class 0 OID 26553)
-- Dependencies: 194
-- Data for Name: scientific_spheres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO scientific_spheres VALUES (1, 'Psyhology');
INSERT INTO scientific_spheres VALUES (2, 'Chemistry');
INSERT INTO scientific_spheres VALUES (3, 'Biology');
INSERT INTO scientific_spheres VALUES (4, 'Mathematics');
INSERT INTO scientific_spheres VALUES (5, 'Physics');
INSERT INTO scientific_spheres VALUES (6, 'Physiology_and_medicine');
INSERT INTO scientific_spheres VALUES (7, 'Theoretical_physics');
INSERT INTO scientific_spheres VALUES (8, 'Radiophysics');
INSERT INTO scientific_spheres VALUES (9, 'Mechanics');


--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 193
-- Name: scientific_spheres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('scientific_spheres_id_seq', 9, true);


--
-- TOC entry 2214 (class 0 OID 26517)
-- Dependencies: 186
-- Data for Name: scientists; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO scientists VALUES (1, 'Leonard_Euler', '1707-04-15', '1783-09-18', 4, 'University_of_Basel');
INSERT INTO scientists VALUES (2, 'Albert_Einshtein', '1879-03-14', '1955-04-18', 3, 'Higher_technical_school_of_Zurich');
INSERT INTO scientists VALUES (3, 'Dmitri_Mendeleev', '1834-01-20', '1907-01-20', 12, 'The_main_pedagogical_Institute');
INSERT INTO scientists VALUES (4, 'Sigmund_Freud', '1856-05-06', '1939-09-23', 11, 'University_of_Vienna');
INSERT INTO scientists VALUES (5, 'Charles_Darwin', '1809-02-12', '1882-04-19', 6, 'Edinburgh_University');
INSERT INTO scientists VALUES (6, 'Lev_Landau', '1908-01-22', '1968-04-01', 13, 'Baku_stateUniversity');
INSERT INTO scientists VALUES (7, 'Marie_Curie', '1867-11-07', '1934-07-04', 2, 'Sorbonne');
INSERT INTO scientists VALUES (8, 'Gertrude_Elion', '1918-01-23', '1999-02-21', 14, 'New_Yourk_University');
INSERT INTO scientists VALUES (9, 'Sofia_Kovalevskaya', '1850-01-15', '1981-02-10', 1, 'Heidelberg_University');
INSERT INTO scientists VALUES (10, 'Nikola_Tesla', '1856-08-30', '1943-01-07', 8, 'Graz_technical_University');
INSERT INTO scientists VALUES (11, 'Ernest_Rutherford', '1871-08-30', '1937-10-19', 5, 'University_of_Canterbury');
INSERT INTO scientists VALUES (12, 'Sofya_Yanovskaya', '1896-01-31', '1966-10-24', 10, 'The_Institute_of_red_professors');
INSERT INTO scientists VALUES (13, 'Nikolay_Basov', '1922-12-14', '2001-07-01', 15, 'Moscow_engineering_physics_Institute');
INSERT INTO scientists VALUES (14, 'Antoine_Becquerel', '1852-12-15', '1908-08-25', 7, 'National_school_of_bridges_and_roads');
INSERT INTO scientists VALUES (15, 'Yoichiro_Nambu', '1921-01-18', '2015-07-05', 9, 'Tokyo_University');


--
-- TOC entry 2230 (class 0 OID 26589)
-- Dependencies: 202
-- Data for Name: scientists_discoveries_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO scientists_discoveries_relation VALUES (1, 1, 1);
INSERT INTO scientists_discoveries_relation VALUES (2, 2, 10);
INSERT INTO scientists_discoveries_relation VALUES (3, 3, 5);
INSERT INTO scientists_discoveries_relation VALUES (4, 3, 21);
INSERT INTO scientists_discoveries_relation VALUES (5, 4, 6);
INSERT INTO scientists_discoveries_relation VALUES (6, 4, 18);
INSERT INTO scientists_discoveries_relation VALUES (7, 5, 7);
INSERT INTO scientists_discoveries_relation VALUES (8, 6, 8);
INSERT INTO scientists_discoveries_relation VALUES (9, 6, 23);
INSERT INTO scientists_discoveries_relation VALUES (10, 7, 9);
INSERT INTO scientists_discoveries_relation VALUES (11, 7, 16);
INSERT INTO scientists_discoveries_relation VALUES (12, 8, 11);
INSERT INTO scientists_discoveries_relation VALUES (13, 9, 2);
INSERT INTO scientists_discoveries_relation VALUES (14, 10, 4);
INSERT INTO scientists_discoveries_relation VALUES (15, 10, 17);
INSERT INTO scientists_discoveries_relation VALUES (16, 11, 3);
INSERT INTO scientists_discoveries_relation VALUES (17, 11, 19);
INSERT INTO scientists_discoveries_relation VALUES (18, 12, 15);
INSERT INTO scientists_discoveries_relation VALUES (19, 13, 14);
INSERT INTO scientists_discoveries_relation VALUES (20, 13, 22);
INSERT INTO scientists_discoveries_relation VALUES (21, 14, 12);
INSERT INTO scientists_discoveries_relation VALUES (22, 14, 20);
INSERT INTO scientists_discoveries_relation VALUES (23, 15, 13);


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 201
-- Name: scientists_discoveries_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('scientists_discoveries_relation_id_seq', 23, true);


--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 185
-- Name: scientists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('scientists_id_seq', 15, true);


--
-- TOC entry 2228 (class 0 OID 26581)
-- Dependencies: 200
-- Data for Name: scientists_scientific_awards_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO scientists_scientific_awards_relation VALUES (1, 2, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (2, 2, 8);
INSERT INTO scientists_scientific_awards_relation VALUES (3, 3, 13);
INSERT INTO scientists_scientific_awards_relation VALUES (4, 3, 4);
INSERT INTO scientists_scientific_awards_relation VALUES (5, 3, 2);
INSERT INTO scientists_scientific_awards_relation VALUES (6, 4, 9);
INSERT INTO scientists_scientific_awards_relation VALUES (7, 5, 14);
INSERT INTO scientists_scientific_awards_relation VALUES (8, 5, 2);
INSERT INTO scientists_scientific_awards_relation VALUES (9, 5, 10);
INSERT INTO scientists_scientific_awards_relation VALUES (10, 6, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (11, 6, 15);
INSERT INTO scientists_scientific_awards_relation VALUES (12, 7, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (13, 8, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (14, 8, 18);
INSERT INTO scientists_scientific_awards_relation VALUES (15, 10, 12);
INSERT INTO scientists_scientific_awards_relation VALUES (16, 10, 15);
INSERT INTO scientists_scientific_awards_relation VALUES (17, 11, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (18, 11, 2);
INSERT INTO scientists_scientific_awards_relation VALUES (19, 11, 16);
INSERT INTO scientists_scientific_awards_relation VALUES (20, 12, 17);
INSERT INTO scientists_scientific_awards_relation VALUES (21, 13, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (22, 13, 7);
INSERT INTO scientists_scientific_awards_relation VALUES (23, 14, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (24, 14, 11);
INSERT INTO scientists_scientific_awards_relation VALUES (25, 15, 1);
INSERT INTO scientists_scientific_awards_relation VALUES (26, 15, 3);
INSERT INTO scientists_scientific_awards_relation VALUES (27, 15, 6);


--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 199
-- Name: scientists_scientific_awards_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('scientists_scientific_awards_relation_id_seq', 27, true);


--
-- TOC entry 2224 (class 0 OID 26563)
-- Dependencies: 196
-- Data for Name: scientists_spheres_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO scientists_spheres_relation VALUES (1, 15, 5);
INSERT INTO scientists_spheres_relation VALUES (2, 14, 5);
INSERT INTO scientists_spheres_relation VALUES (3, 13, 8);
INSERT INTO scientists_spheres_relation VALUES (4, 12, 4);
INSERT INTO scientists_spheres_relation VALUES (5, 11, 5);
INSERT INTO scientists_spheres_relation VALUES (6, 10, 5);
INSERT INTO scientists_spheres_relation VALUES (7, 9, 9);
INSERT INTO scientists_spheres_relation VALUES (8, 8, 2);
INSERT INTO scientists_spheres_relation VALUES (9, 7, 5);
INSERT INTO scientists_spheres_relation VALUES (10, 6, 7);
INSERT INTO scientists_spheres_relation VALUES (11, 5, 3);
INSERT INTO scientists_spheres_relation VALUES (12, 4, 1);
INSERT INTO scientists_spheres_relation VALUES (13, 3, 2);
INSERT INTO scientists_spheres_relation VALUES (14, 2, 7);
INSERT INTO scientists_spheres_relation VALUES (15, 1, 4);


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 195
-- Name: scientists_spheres_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('scientists_spheres_relation_id_seq', 15, true);


--
-- TOC entry 2216 (class 0 OID 26525)
-- Dependencies: 188
-- Data for Name: towns; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO towns VALUES (1, 'Moscow', 1);
INSERT INTO towns VALUES (2, 'Warsaw', 1);
INSERT INTO towns VALUES (3, 'Ulm', 6);
INSERT INTO towns VALUES (4, 'Basel', 3);
INSERT INTO towns VALUES (5, 'Spring Grove', 5);
INSERT INTO towns VALUES (6, 'Shrewsbury', 9);
INSERT INTO towns VALUES (7, 'MParis', 10);
INSERT INTO towns VALUES (8, 'Smiljan', 2);
INSERT INTO towns VALUES (9, 'Tokyo', 7);
INSERT INTO towns VALUES (10, 'Pruzhany', 1);
INSERT INTO towns VALUES (11, 'Frieberg', 2);
INSERT INTO towns VALUES (12, 'Tobolsk', 1);
INSERT INTO towns VALUES (13, 'Baku', 1);
INSERT INTO towns VALUES (14, 'New York', 4);
INSERT INTO towns VALUES (15, 'Usman', 8);


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 187
-- Name: towns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('towns_id_seq', 15, true);


--
-- TOC entry 2066 (class 2606 OID 26540)
-- Name: countries countries_country_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_country_key UNIQUE (country);


--
-- TOC entry 2068 (class 2606 OID 26538)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 2080 (class 2606 OID 26578)
-- Name: discoveries discoveries_discovery_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discoveries
    ADD CONSTRAINT discoveries_discovery_key UNIQUE (discovery);


--
-- TOC entry 2082 (class 2606 OID 26576)
-- Name: discoveries discoveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discoveries
    ADD CONSTRAINT discoveries_pkey PRIMARY KEY (id);


--
-- TOC entry 2070 (class 2606 OID 26548)
-- Name: scientific_awards scientific_awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientific_awards
    ADD CONSTRAINT scientific_awards_pkey PRIMARY KEY (id);


--
-- TOC entry 2072 (class 2606 OID 26550)
-- Name: scientific_awards scientific_awards_the_name_of_the_award_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientific_awards
    ADD CONSTRAINT scientific_awards_the_name_of_the_award_key UNIQUE (the_name_of_the_award);


--
-- TOC entry 2074 (class 2606 OID 26558)
-- Name: scientific_spheres scientific_spheres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientific_spheres
    ADD CONSTRAINT scientific_spheres_pkey PRIMARY KEY (id);


--
-- TOC entry 2076 (class 2606 OID 26560)
-- Name: scientific_spheres scientific_spheres_scientific_sphere_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientific_spheres
    ADD CONSTRAINT scientific_spheres_scientific_sphere_key UNIQUE (scientific_sphere);


--
-- TOC entry 2086 (class 2606 OID 26594)
-- Name: scientists_discoveries_relation scientists_discoveries_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_discoveries_relation
    ADD CONSTRAINT scientists_discoveries_relation_pkey PRIMARY KEY (id);


--
-- TOC entry 2062 (class 2606 OID 26522)
-- Name: scientists scientists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists
    ADD CONSTRAINT scientists_pkey PRIMARY KEY (id);


--
-- TOC entry 2084 (class 2606 OID 26586)
-- Name: scientists_scientific_awards_relation scientists_scientific_awards_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_scientific_awards_relation
    ADD CONSTRAINT scientists_scientific_awards_relation_pkey PRIMARY KEY (id);


--
-- TOC entry 2078 (class 2606 OID 26568)
-- Name: scientists_spheres_relation scientists_spheres_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_spheres_relation
    ADD CONSTRAINT scientists_spheres_relation_pkey PRIMARY KEY (id);


--
-- TOC entry 2064 (class 2606 OID 26530)
-- Name: towns towns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY towns
    ADD CONSTRAINT towns_pkey PRIMARY KEY (id);


--
-- TOC entry 2089 (class 2606 OID 26625)
-- Name: scientific_awards scientific_awards_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientific_awards
    ADD CONSTRAINT scientific_awards_fk0 FOREIGN KEY (country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2094 (class 2606 OID 26615)
-- Name: scientists_discoveries_relation scientists_discoveries_relation_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_discoveries_relation
    ADD CONSTRAINT scientists_discoveries_relation_fk0 FOREIGN KEY (id_scientist) REFERENCES scientists(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2095 (class 2606 OID 26620)
-- Name: scientists_discoveries_relation scientists_discoveries_relation_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_discoveries_relation
    ADD CONSTRAINT scientists_discoveries_relation_fk1 FOREIGN KEY (id_scientist_discovery) REFERENCES discoveries(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2087 (class 2606 OID 26595)
-- Name: scientists scientists_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists
    ADD CONSTRAINT scientists_fk0 FOREIGN KEY (town_of_birth_id) REFERENCES towns(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2092 (class 2606 OID 26630)
-- Name: scientists_scientific_awards_relation scientists_scientific_awards_relation_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_scientific_awards_relation
    ADD CONSTRAINT scientists_scientific_awards_relation_fk0 FOREIGN KEY (id_scientist) REFERENCES scientists(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2093 (class 2606 OID 26635)
-- Name: scientists_scientific_awards_relation scientists_scientific_awards_relation_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_scientific_awards_relation
    ADD CONSTRAINT scientists_scientific_awards_relation_fk1 FOREIGN KEY (id_scientific_award) REFERENCES scientific_awards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2090 (class 2606 OID 26600)
-- Name: scientists_spheres_relation scientists_spheres_relation_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_spheres_relation
    ADD CONSTRAINT scientists_spheres_relation_fk0 FOREIGN KEY (id_scientist) REFERENCES scientists(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2091 (class 2606 OID 26605)
-- Name: scientists_spheres_relation scientists_spheres_relation_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scientists_spheres_relation
    ADD CONSTRAINT scientists_spheres_relation_fk1 FOREIGN KEY (id_sphere_of_activity) REFERENCES scientific_spheres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2088 (class 2606 OID 26610)
-- Name: towns towns_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY towns
    ADD CONSTRAINT towns_fk0 FOREIGN KEY (id_country) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2017-11-01 22:36:53

--
-- PostgreSQL database dump complete
--
