--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-01-03 19:55:44

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

--
-- TOC entry 229 (class 1255 OID 25599)
-- Name: get_farmer_own_farm_bigger_than_given(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_farmer_own_farm_bigger_than_given(minimum integer) RETURNS TABLE(name character varying, surname character varying)
    LANGUAGE sql
    AS $$
    SELECT fror.name,fror.surname FROM farmers fror
    WHERE fror.id IN (
        SELECT fm.owner_id as id FROM farmers fr,farms fm 
        WHERE fm.owner_id = fr.id 
        GROUP BY fm.owner_id 
        HAVING (COUNT(fm.owner_id)) > minimum
    )
$$;


--
-- TOC entry 222 (class 1255 OID 25195)
-- Name: is_valid_id(character); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.is_valid_id(tc character) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
	BEGIN
		RETURN TRUE; -- TODO: Implement TR identity number validity check
	END;
$$;


SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 25200)
-- Name: farmers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.farmers (
    id character(11) NOT NULL,
    registration timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    name character varying(100) NOT NULL,
    surname character varying(100) NOT NULL,
    birthday date NOT NULL,
    phone character varying(20),
    email character varying(254),
    address character varying(500) NOT NULL,
    experience integer DEFAULT 0 NOT NULL,
    CONSTRAINT farmers_birthday_check CHECK ((birthday <= CURRENT_DATE)),
    CONSTRAINT farmers_experience_check CHECK ((experience >= 0)),
    CONSTRAINT farmers_id_check CHECK (public.is_valid_id(id)),
    CONSTRAINT farmers_name_check CHECK ((length((name)::text) > 0)),
    CONSTRAINT farmers_registeration_check CHECK ((registration <= CURRENT_TIMESTAMP)),
    CONSTRAINT farmers_surname_check CHECK ((length((surname)::text) > 0))
);


--
-- TOC entry 228 (class 1255 OID 25362)
-- Name: get_farmers_that_plant_crop(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_farmers_that_plant_crop(crop integer) RETURNS TABLE("like" public.farmers)
    LANGUAGE sql
    AS $$
	SELECT public.farmers.* FROM public.farmcrop,public.farms,public.farmers WHERE crop = public.farmcrop.crop_id AND public.farmcrop.farm_id = public.farms.id AND public.farms.owner_id = public.farmers.id;
$$;


--
-- TOC entry 227 (class 1255 OID 25357)
-- Name: get_total_farm_worth_of_farmer(character); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_total_farm_worth_of_farmer(farmer character) RETURNS numeric
    LANGUAGE sql
    AS $$
	SELECT SUM(area * unit_worth) FROM public.farms WHERE owner_id = farmer;
$$;


--
-- TOC entry 223 (class 1255 OID 25196)
-- Name: trim_name(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trim_name() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
		NEW.name := TRIM(NEW.name);
		RETURN NEW;
	END;
$$;


--
-- TOC entry 224 (class 1255 OID 25197)
-- Name: trim_surname(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trim_surname() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
		NEW.surname := TRIM(NEW.surname);
		RETURN NEW;
	END;
$$;


--
-- TOC entry 226 (class 1255 OID 25199)
-- Name: update_cooperative_member_count(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_cooperative_member_count() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
		IF (TG_OP = 'INSERT') THEN
			UPDATE public.cooperatives SET member_count = (member_count + 1) WHERE public.cooperatives.id = NEW.cooperative_id;
			RETURN NEW;
		ELSIF (TG_OP = 'DELETE') THEN
			UPDATE public.cooperatives SET member_count = (member_count - 1) WHERE public.cooperatives.id = OLD.cooperative_id;
			RETURN OLD;
		END IF;
	END;
$$;


--
-- TOC entry 225 (class 1255 OID 25198)
-- Name: update_farmer_experience(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_farmer_experience() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
		IF (TG_OP = 'INSERT') THEN
			UPDATE public.farmers SET experience = (public.farmers.experience + public.crops.experience * NEW.area) FROM public.farms, public.crops WHERE public.farmers.id = public.farms.owner_id AND public.farms.id = NEW.farm_id AND public.crops.id = NEW.crop_id;
			RETURN NEW;
		END IF;
		RETURN NULL;
	END;
$$;


--
-- TOC entry 210 (class 1259 OID 25301)
-- Name: cooperatives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cooperatives (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    establishment_date date DEFAULT CURRENT_DATE NOT NULL,
    founder_id character(11),
    president_id character(11),
    city_code integer,
    address character varying(500) NOT NULL,
    email character varying(254) NOT NULL,
    member_count integer DEFAULT 0 NOT NULL,
    CONSTRAINT cooperatives_member_count_check CHECK ((member_count >= 0))
);


--
-- TOC entry 212 (class 1259 OID 25363)
-- Name: address_list; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.address_list AS
 SELECT farmers.address
   FROM public.farmers
UNION
 SELECT cooperatives.address
   FROM public.cooperatives;


--
-- TOC entry 201 (class 1259 OID 25220)
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    code integer NOT NULL,
    name character varying(100) NOT NULL,
    area numeric(100,3) NOT NULL,
    CONSTRAINT cities_area_check CHECK ((area > (0)::numeric)),
    CONSTRAINT cities_code_check CHECK ((code > 0)),
    CONSTRAINT cities_name_check CHECK ((length((name)::text) > 0))
);


--
-- TOC entry 211 (class 1259 OID 25332)
-- Name: cooperativemember; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cooperativemember (
    cooperative_id integer NOT NULL,
    member_id character(11) NOT NULL,
    registration timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT cooperativemember_registeration_check CHECK ((registration <= CURRENT_TIMESTAMP))
);


--
-- TOC entry 209 (class 1259 OID 25299)
-- Name: cooperatives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cooperatives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 209
-- Name: cooperatives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cooperatives_id_seq OWNED BY public.cooperatives.id;


--
-- TOC entry 207 (class 1259 OID 25272)
-- Name: crops; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crops (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    category character varying(20) NOT NULL,
    seed_unit_price numeric(100,2),
    crop_standard_price numeric(100,2),
    experience integer,
    CONSTRAINT crops_category_check CHECK ((length((category)::text) > 0)),
    CONSTRAINT crops_name_check CHECK ((length((name)::text) > 0))
);


--
-- TOC entry 206 (class 1259 OID 25270)
-- Name: crops_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.crops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 206
-- Name: crops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.crops_id_seq OWNED BY public.crops.id;


--
-- TOC entry 219 (class 1259 OID 25411)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 25409)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 218
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 208 (class 1259 OID 25282)
-- Name: farmcrop; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.farmcrop (
    farm_id integer NOT NULL,
    crop_id integer NOT NULL,
    planting_date date DEFAULT CURRENT_DATE NOT NULL,
    area numeric(100,3) NOT NULL,
    CONSTRAINT farmcrop_planting_date_check CHECK ((planting_date <= CURRENT_DATE))
);


--
-- TOC entry 205 (class 1259 OID 25244)
-- Name: farms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.farms (
    id integer NOT NULL,
    registration timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    owner_id character(11),
    city_code integer,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    area numeric(100,2) NOT NULL,
    soil_type integer,
    unit_worth numeric(100,2) NOT NULL,
    CONSTRAINT farms_area_check CHECK ((area > (0)::numeric)),
    CONSTRAINT farms_latitude_check CHECK (((latitude >= ('-90'::integer)::double precision) AND (latitude <= (90)::double precision))),
    CONSTRAINT farms_longitude_check CHECK (((longitude >= ('-180'::integer)::double precision) AND (longitude <= (180)::double precision))),
    CONSTRAINT farms_registeration_check CHECK ((registration <= CURRENT_TIMESTAMP))
);


--
-- TOC entry 204 (class 1259 OID 25242)
-- Name: farms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.farms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 204
-- Name: farms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.farms_id_seq OWNED BY public.farms.id;


--
-- TOC entry 221 (class 1259 OID 25595)
-- Name: farms_that_worth_more_than_average; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.farms_that_worth_more_than_average AS
 SELECT farms.id AS "Arsa ID",
    farms.owner_id AS "Sahip TC"
   FROM public.farms
  WHERE ((farms.area * farms.unit_worth) < ( SELECT avg((farms_1.area * farms_1.unit_worth)) AS avg
           FROM public.farms farms_1));


--
-- TOC entry 214 (class 1259 OID 25383)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 25381)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 213
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 217 (class 1259 OID 25402)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


--
-- TOC entry 220 (class 1259 OID 25590)
-- Name: planted_information_last_5_year; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.planted_information_last_5_year AS
 SELECT fc.farm_id,
    fc.crop_id,
    fc.planting_date,
    fc.area,
    cr.name
   FROM ((public.farmcrop fc
     LEFT JOIN public.farms fm ON ((fc.farm_id = fm.id)))
     LEFT JOIN public.crops cr ON ((fc.crop_id = cr.id)))
  WHERE (fc.planting_date > (now() - '5 years'::interval));


--
-- TOC entry 203 (class 1259 OID 25232)
-- Name: soiltypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.soiltypes (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    CONSTRAINT soiltypes_id_check CHECK ((id >= 0)),
    CONSTRAINT soiltypes_name_check CHECK ((length((name)::text) > 0))
);


--
-- TOC entry 202 (class 1259 OID 25230)
-- Name: soiltypes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.soiltypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 202
-- Name: soiltypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.soiltypes_id_seq OWNED BY public.soiltypes.id;


--
-- TOC entry 216 (class 1259 OID 25391)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- TOC entry 215 (class 1259 OID 25389)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2956 (class 2604 OID 25304)
-- Name: cooperatives id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cooperatives ALTER COLUMN id SET DEFAULT nextval('public.cooperatives_id_seq'::regclass);


--
-- TOC entry 2951 (class 2604 OID 25275)
-- Name: crops id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crops ALTER COLUMN id SET DEFAULT nextval('public.crops_id_seq'::regclass);


--
-- TOC entry 2964 (class 2604 OID 25414)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2945 (class 2604 OID 25247)
-- Name: farms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farms ALTER COLUMN id SET DEFAULT nextval('public.farms_id_seq'::regclass);


--
-- TOC entry 2962 (class 2604 OID 25386)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2942 (class 2604 OID 25235)
-- Name: soiltypes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.soiltypes ALTER COLUMN id SET DEFAULT nextval('public.soiltypes_id_seq'::regclass);


--
-- TOC entry 2963 (class 2604 OID 25394)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2973 (class 2606 OID 25229)
-- Name: cities cities_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_name_key UNIQUE (name);


--
-- TOC entry 2975 (class 2606 OID 25227)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (code);


--
-- TOC entry 2995 (class 2606 OID 25338)
-- Name: cooperativemember cooperativemember_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cooperativemember
    ADD CONSTRAINT cooperativemember_pkey PRIMARY KEY (cooperative_id, member_id);


--
-- TOC entry 2989 (class 2606 OID 25316)
-- Name: cooperatives cooperatives_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_email_key UNIQUE (email);


--
-- TOC entry 2991 (class 2606 OID 25314)
-- Name: cooperatives cooperatives_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_name_key UNIQUE (name);


--
-- TOC entry 2993 (class 2606 OID 25312)
-- Name: cooperatives cooperatives_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_pkey PRIMARY KEY (id);


--
-- TOC entry 2983 (class 2606 OID 25281)
-- Name: crops crops_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crops
    ADD CONSTRAINT crops_name_key UNIQUE (name);


--
-- TOC entry 2985 (class 2606 OID 25279)
-- Name: crops crops_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crops
    ADD CONSTRAINT crops_pkey PRIMARY KEY (id);


--
-- TOC entry 3004 (class 2606 OID 25420)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3006 (class 2606 OID 25422)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2987 (class 2606 OID 25288)
-- Name: farmcrop farmcrop_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmcrop
    ADD CONSTRAINT farmcrop_pkey PRIMARY KEY (farm_id, crop_id);


--
-- TOC entry 2967 (class 2606 OID 25219)
-- Name: farmers farmers_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmers
    ADD CONSTRAINT farmers_email_key UNIQUE (email);


--
-- TOC entry 2969 (class 2606 OID 25217)
-- Name: farmers farmers_phone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmers
    ADD CONSTRAINT farmers_phone_key UNIQUE (phone);


--
-- TOC entry 2971 (class 2606 OID 25215)
-- Name: farmers farmers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmers
    ADD CONSTRAINT farmers_pkey PRIMARY KEY (id);


--
-- TOC entry 2981 (class 2606 OID 25254)
-- Name: farms farms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_pkey PRIMARY KEY (id);


--
-- TOC entry 2997 (class 2606 OID 25388)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2977 (class 2606 OID 25241)
-- Name: soiltypes soiltypes_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.soiltypes
    ADD CONSTRAINT soiltypes_name_key UNIQUE (name);


--
-- TOC entry 2979 (class 2606 OID 25239)
-- Name: soiltypes soiltypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.soiltypes
    ADD CONSTRAINT soiltypes_pkey PRIMARY KEY (id);


--
-- TOC entry 2999 (class 2606 OID 25401)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3001 (class 2606 OID 25399)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3002 (class 1259 OID 25408)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 3024 (class 2620 OID 25349)
-- Name: cooperativemember cooperative_member_count; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER cooperative_member_count BEFORE INSERT OR DELETE ON public.cooperativemember FOR EACH ROW EXECUTE FUNCTION public.update_cooperative_member_count();


--
-- TOC entry 3022 (class 2620 OID 25350)
-- Name: farmcrop farmer_experience; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER farmer_experience BEFORE INSERT ON public.farmcrop FOR EACH ROW EXECUTE FUNCTION public.update_farmer_experience();


--
-- TOC entry 3019 (class 2620 OID 25353)
-- Name: cities trim_city_name; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trim_city_name BEFORE INSERT OR UPDATE OF name ON public.cities FOR EACH ROW WHEN ((new.name IS NOT NULL)) EXECUTE FUNCTION public.trim_name();


--
-- TOC entry 3023 (class 2620 OID 25356)
-- Name: cooperatives trim_cooperative_name; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trim_cooperative_name BEFORE INSERT OR UPDATE OF name ON public.cooperatives FOR EACH ROW WHEN ((new.name IS NOT NULL)) EXECUTE FUNCTION public.trim_name();


--
-- TOC entry 3021 (class 2620 OID 25355)
-- Name: crops trim_crop_name; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trim_crop_name BEFORE INSERT OR UPDATE OF name ON public.crops FOR EACH ROW WHEN ((new.name IS NOT NULL)) EXECUTE FUNCTION public.trim_name();


--
-- TOC entry 3017 (class 2620 OID 25351)
-- Name: farmers trim_farmer_name; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trim_farmer_name BEFORE INSERT OR UPDATE OF name ON public.farmers FOR EACH ROW WHEN ((new.name IS NOT NULL)) EXECUTE FUNCTION public.trim_name();


--
-- TOC entry 3018 (class 2620 OID 25352)
-- Name: farmers trim_farmer_surname; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trim_farmer_surname BEFORE INSERT OR UPDATE OF surname ON public.farmers FOR EACH ROW WHEN ((new.surname IS NOT NULL)) EXECUTE FUNCTION public.trim_surname();


--
-- TOC entry 3020 (class 2620 OID 25354)
-- Name: soiltypes trim_soil_type_name; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trim_soil_type_name BEFORE INSERT OR UPDATE OF name ON public.soiltypes FOR EACH ROW WHEN ((new.name IS NOT NULL)) EXECUTE FUNCTION public.trim_name();


--
-- TOC entry 3015 (class 2606 OID 25339)
-- Name: cooperativemember cooperativemember_cooperative_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cooperativemember
    ADD CONSTRAINT cooperativemember_cooperative_id_fkey FOREIGN KEY (cooperative_id) REFERENCES public.cooperatives(id) ON DELETE CASCADE;


--
-- TOC entry 3016 (class 2606 OID 25344)
-- Name: cooperativemember cooperativemember_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cooperativemember
    ADD CONSTRAINT cooperativemember_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.farmers(id) ON DELETE CASCADE;


--
-- TOC entry 3014 (class 2606 OID 25327)
-- Name: cooperatives cooperatives_city_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_city_code_fkey FOREIGN KEY (city_code) REFERENCES public.cities(code) ON DELETE SET NULL;


--
-- TOC entry 3012 (class 2606 OID 25317)
-- Name: cooperatives cooperatives_founder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_founder_id_fkey FOREIGN KEY (founder_id) REFERENCES public.farmers(id) ON DELETE SET NULL;


--
-- TOC entry 3013 (class 2606 OID 25322)
-- Name: cooperatives cooperatives_president_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_president_id_fkey FOREIGN KEY (president_id) REFERENCES public.farmers(id) ON DELETE SET NULL;


--
-- TOC entry 3011 (class 2606 OID 25294)
-- Name: farmcrop farmcrop_crop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmcrop
    ADD CONSTRAINT farmcrop_crop_id_fkey FOREIGN KEY (crop_id) REFERENCES public.crops(id) ON DELETE CASCADE;


--
-- TOC entry 3010 (class 2606 OID 25289)
-- Name: farmcrop farmcrop_farm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmcrop
    ADD CONSTRAINT farmcrop_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES public.farms(id) ON DELETE CASCADE;


--
-- TOC entry 3008 (class 2606 OID 25260)
-- Name: farms farms_city_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_city_code_fkey FOREIGN KEY (city_code) REFERENCES public.cities(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3007 (class 2606 OID 25255)
-- Name: farms farms_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.farmers(id) ON DELETE SET NULL;


--
-- TOC entry 3009 (class 2606 OID 25265)
-- Name: farms farms_soil_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_soil_type_fkey FOREIGN KEY (soil_type) REFERENCES public.soiltypes(id) ON DELETE SET NULL;


-- Completed on 2021-01-03 19:55:44

--
-- PostgreSQL database dump complete
--

