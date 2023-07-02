--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(60) NOT NULL,
    color character varying(60),
    diameter_in_km integer,
    star_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(120) NOT NULL,
    description text,
    type character varying(120) NOT NULL,
    distance_from_earth_in_mli numeric(8,1),
    number_of_stars character varying(60),
    dominant_color character varying(60)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(120) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer,
    distance_from_planet_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(120) NOT NULL,
    diameter_in_km integer,
    distance_from_star_in_au numeric(6,2),
    mass_in_earth_masses numeric(6,2),
    star_id integer NOT NULL,
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(120) NOT NULL,
    distance_from_earth_in_li numeric(8,2),
    mass_in_solar_masses numeric(8,2),
    color character varying(60),
    temperature_in_kelvin integer,
    galaxy_id integer NOT NULL,
    is_flickering boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Brown', 939, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Gray', 525, 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Blue', 512, 1);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'White', 431, 1);
INSERT INTO public.asteroid VALUES (5, 'Eros', 'Red', 34, 1);
INSERT INTO public.asteroid VALUES (6, 'Gaspra', 'Gray', 18, 1);
INSERT INTO public.asteroid VALUES (7, 'Ida', 'Gray', 56, 1);
INSERT INTO public.asteroid VALUES (8, 'Mathilde', 'Red', 53, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is our home galaxy, a vast spiral galaxy containing billions of stars, planets, and other celestial objects.', 'Spiral', 0.0, 'hundreds of billions', 'milky white');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda, the closest spiral galaxy to the Milky Way, is a massive galaxy with a beautiful spiral structure located about 2.5 million light-years away from us.', 'Spiral', 2.5, 'trillions', 'blue');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Triangulum is the third-largest galaxy in our Local Group. It is a spiral galaxy known for its intricate patterns of dust and gas.', 'Spiral', 3.2, 'billions', 'blue');
INSERT INTO public.galaxy VALUES (4, 'Antennae', 'The Antennae galaxies are a pair of colliding galaxies, exhibiting intense star formation and creating a stunning cosmic collision.', 'Merger', 45.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Eye of Sauron', 'The Eye of Sauron is an unusual irregular galaxy characterized by its distinctive shape, resembling the eye of a cosmic entity from a fantasy world.', 'Irregular', 130.0, 'millions', 'red');
INSERT INTO public.galaxy VALUES (6, 'Medusa Merger', 'Medusa Merger is a galaxy resulting from a collision between two or more galaxies, leaving behind a chaotic and visually striking aftermath.', 'Merger', 100.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Mayall''s Object', 'Mayall''s Object is a unique tidal feature formed by gravitational interactions between galaxies. It showcases the fascinating dynamics of cosmic interactions on a grand scale.', 'Irregular', 200.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Peekaboo', 'Peekaboo is a compact blue dwarf galaxy, characterized by its small size and youthful population of hot, massive stars.', 'Irregular', 22.3, 'millions', 'blue');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 9377);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 23460);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3642, 421700);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 670900);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 10700400);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1882700);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 1221870);
INSERT INTO public.moon VALUES (9, 'Titania', 7, 1578, 435910);
INSERT INTO public.moon VALUES (10, 'Oberon', 7, 1523, 583520);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 2706, 354800);
INSERT INTO public.moon VALUES (12, 'Charon', 9, 1212, 19570);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 504, 238020);
INSERT INTO public.moon VALUES (14, 'Rhea', 6, 1527, 527040);
INSERT INTO public.moon VALUES (15, 'Mimas', 6, 396, 185520);
INSERT INTO public.moon VALUES (16, 'Dione', 6, 1123, 377420);
INSERT INTO public.moon VALUES (17, 'Tethys', 6, 1066, 294600);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 472, 129390);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1158, 191020);
INSERT INTO public.moon VALUES (20, 'Umbriel', 7, 1170, 266300);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 0.39, 0.06, 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 0.72, 0.82, 1, false);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 1.52, 0.11, 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, 5.20, 317.80, 1, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, 9.58, 95.20, 1, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 19.18, 14.50, 1, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, 30.07, 17.10, 1, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 2376, 39.48, 0.00, 1, false);
INSERT INTO public.planet VALUES (10, 'Proxima b', 8012, 0.05, 1.17, 5, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 20996, 1.05, 5.00, 10, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 1.00, 1.00, 1, true);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 8440, 0.35, 1.17, 11, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4.24, 0.12, 'Red', 3042, 1, true);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 643.00, 15.00, 'Red', 3600, 1, true);
INSERT INTO public.star VALUES (8, 'Polaris', 433.00, 4.50, 'Yellow', 6050, 1, true);
INSERT INTO public.star VALUES (1, 'Sun', 0.00, 1.00, 'Yellow', 5778, 1, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 4.37, 1.10, 'Orange', 5790, 1, false);
INSERT INTO public.star VALUES (4, 'Vega', 25.05, 2.10, 'Blue', 9602, 1, false);
INSERT INTO public.star VALUES (3, 'Sirius', 8.60, 2.00, 'White', 9940, 1, false);
INSERT INTO public.star VALUES (7, 'Aldebaran', 65.23, 1.70, 'Orange', 3910, 1, false);
INSERT INTO public.star VALUES (9, 'Bellatrix', 243.00, 8.60, 'Blue', 22000, 1, false);
INSERT INTO public.star VALUES (10, 'Kepler-452', 1402.00, 1.04, 'Yellow', 6273, 1, false);
INSERT INTO public.star VALUES (11, 'Kepler-186', 579.23, 0.54, 'red', 3755, 1, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

