PGDMP     8    +                x            cooperative    13.1    13.1 i    e           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            f           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            g           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            h           1262    25032    cooperative    DATABASE     h   CREATE DATABASE cooperative WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE cooperative;
                postgres    false            �            1255    25195    is_valid_id(character)    FUNCTION     �   CREATE FUNCTION public.is_valid_id(tc character) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
	BEGIN
		RETURN TRUE; -- TODO: Implement TR identity number validity check
	END;
$$;
 0   DROP FUNCTION public.is_valid_id(tc character);
       public          postgres    false            �            1259    25200    farmers    TABLE     U  CREATE TABLE public.farmers (
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
    DROP TABLE public.farmers;
       public         heap    postgres    false    221            �            1255    25362 $   get_farmers_that_plant_crop(integer)    FUNCTION       CREATE FUNCTION public.get_farmers_that_plant_crop(crop integer) RETURNS TABLE("like" public.farmers)
    LANGUAGE sql
    AS $$
	SELECT Farmers.* FROM FarmCrop,Farms,Farmers WHERE crop = FarmCrop.crop_id AND FarmCrop.farm_id = Farms.id AND Farms.owner_id = Farmers.id;
$$;
 @   DROP FUNCTION public.get_farmers_that_plant_crop(crop integer);
       public          postgres    false    200    200            �            1255    25357 )   get_total_farm_worth_of_farmer(character)    FUNCTION     �   CREATE FUNCTION public.get_total_farm_worth_of_farmer(farmer character) RETURNS numeric
    LANGUAGE sql
    AS $$
	SELECT SUM(area * unit_worth) FROM Farms WHERE owner_id = farmer;
$$;
 G   DROP FUNCTION public.get_total_farm_worth_of_farmer(farmer character);
       public          postgres    false            �            1255    25196    trim_name()    FUNCTION     �   CREATE FUNCTION public.trim_name() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
		NEW.name := TRIM(NEW.name);
		RETURN NEW;
	END;
$$;
 "   DROP FUNCTION public.trim_name();
       public          postgres    false            �            1255    25197    trim_surname()    FUNCTION     �   CREATE FUNCTION public.trim_surname() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
		NEW.surname := TRIM(NEW.surname);
		RETURN NEW;
	END;
$$;
 %   DROP FUNCTION public.trim_surname();
       public          postgres    false            �            1255    25199 !   update_cooperative_member_count()    FUNCTION     �  CREATE FUNCTION public.update_cooperative_member_count() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
		IF (TG_OP = 'INSERT') THEN
			UPDATE Cooperatives SET member_count = (member_count + 1) WHERE Cooperatives.id = NEW.cooperative_id;
			RETURN NEW;
		ELSIF (TG_OP = 'DELETE') THEN
			UPDATE Cooperatives SET member_count = (member_count - 1) WHERE Cooperatives.id = OLD.cooperative_id;
			RETURN OLD;
		END IF;
	END;
$$;
 8   DROP FUNCTION public.update_cooperative_member_count();
       public          postgres    false            �            1255    25198    update_farmer_experience()    FUNCTION     x  CREATE FUNCTION public.update_farmer_experience() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	BEGIN
		IF (TG_OP = 'INSERT') THEN
			UPDATE Farmers SET experience = (Farmers.experience + Crops.experience * NEW.area) FROM Farms, Crops WHERE Farmers.id = Farms.owner_id AND Farms.id = NEW.farm_id AND Crops.id = NEW.crop_id;
			RETURN NEW;
		END IF;
		RETURN NULL;
	END;
$$;
 1   DROP FUNCTION public.update_farmer_experience();
       public          postgres    false            �            1259    25301    cooperatives    TABLE     �  CREATE TABLE public.cooperatives (
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
     DROP TABLE public.cooperatives;
       public         heap    postgres    false            �            1259    25363    address_list    VIEW     �   CREATE VIEW public.address_list AS
 SELECT farmers.address
   FROM public.farmers
UNION
 SELECT cooperatives.address
   FROM public.cooperatives;
    DROP VIEW public.address_list;
       public          postgres    false    210    200            �            1259    25220    cities    TABLE     @  CREATE TABLE public.cities (
    code integer NOT NULL,
    name character varying(100) NOT NULL,
    area numeric(100,3) NOT NULL,
    CONSTRAINT cities_area_check CHECK ((area > (0)::numeric)),
    CONSTRAINT cities_code_check CHECK ((code > 0)),
    CONSTRAINT cities_name_check CHECK ((length((name)::text) > 0))
);
    DROP TABLE public.cities;
       public         heap    postgres    false            �            1259    25332    cooperativemember    TABLE     (  CREATE TABLE public.cooperativemember (
    cooperative_id integer NOT NULL,
    member_id character(11) NOT NULL,
    registration timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT cooperativemember_registeration_check CHECK ((registration <= CURRENT_TIMESTAMP))
);
 %   DROP TABLE public.cooperativemember;
       public         heap    postgres    false            �            1259    25299    cooperatives_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cooperatives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cooperatives_id_seq;
       public          postgres    false    210            i           0    0    cooperatives_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.cooperatives_id_seq OWNED BY public.cooperatives.id;
          public          postgres    false    209            �            1259    25272    crops    TABLE     �  CREATE TABLE public.crops (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    category character varying(20) NOT NULL,
    seed_unit_price numeric(100,2),
    crop_standard_price numeric(100,2),
    experience integer,
    CONSTRAINT crops_category_check CHECK ((length((category)::text) > 0)),
    CONSTRAINT crops_name_check CHECK ((length((name)::text) > 0))
);
    DROP TABLE public.crops;
       public         heap    postgres    false            �            1259    25270    crops_id_seq    SEQUENCE     �   CREATE SEQUENCE public.crops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.crops_id_seq;
       public          postgres    false    207            j           0    0    crops_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.crops_id_seq OWNED BY public.crops.id;
          public          postgres    false    206            �            1259    25411    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false            �            1259    25409    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    220            k           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    219            �            1259    25282    farmcrop    TABLE     
  CREATE TABLE public.farmcrop (
    farm_id integer NOT NULL,
    crop_id integer NOT NULL,
    planting_date date DEFAULT CURRENT_DATE NOT NULL,
    area numeric(100,3) NOT NULL,
    CONSTRAINT farmcrop_planting_date_check CHECK ((planting_date <= CURRENT_DATE))
);
    DROP TABLE public.farmcrop;
       public         heap    postgres    false            �            1259    25244    farms    TABLE       CREATE TABLE public.farms (
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
    DROP TABLE public.farms;
       public         heap    postgres    false            �            1259    25242    farms_id_seq    SEQUENCE     �   CREATE SEQUENCE public.farms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.farms_id_seq;
       public          postgres    false    205            l           0    0    farms_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.farms_id_seq OWNED BY public.farms.id;
          public          postgres    false    204            �            1259    25358 "   farms_that_worth_more_than_average    VIEW     �  CREATE VIEW public.farms_that_worth_more_than_average AS
SELECT
    NULL::integer AS id,
    NULL::timestamp without time zone AS registeration,
    NULL::character(11) AS owner_id,
    NULL::integer AS city_code,
    NULL::double precision AS latitude,
    NULL::double precision AS longitude,
    NULL::numeric(100,2) AS area,
    NULL::integer AS soil_type,
    NULL::numeric(100,2) AS unit_worth;
 5   DROP VIEW public.farms_that_worth_more_than_average;
       public          postgres    false            �            1259    25383 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    25381    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    215            m           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    214            �            1259    25402    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         heap    postgres    false            �            1259    25232 	   soiltypes    TABLE     �   CREATE TABLE public.soiltypes (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    CONSTRAINT soiltypes_id_check CHECK ((id >= 0)),
    CONSTRAINT soiltypes_name_check CHECK ((length((name)::text) > 0))
);
    DROP TABLE public.soiltypes;
       public         heap    postgres    false            �            1259    25230    soiltypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.soiltypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.soiltypes_id_seq;
       public          postgres    false    203            n           0    0    soiltypes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.soiltypes_id_seq OWNED BY public.soiltypes.id;
          public          postgres    false    202            �            1259    25391    users    TABLE     x  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    25389    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217            o           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            �           2604    25304    cooperatives id    DEFAULT     r   ALTER TABLE ONLY public.cooperatives ALTER COLUMN id SET DEFAULT nextval('public.cooperatives_id_seq'::regclass);
 >   ALTER TABLE public.cooperatives ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    25275    crops id    DEFAULT     d   ALTER TABLE ONLY public.crops ALTER COLUMN id SET DEFAULT nextval('public.crops_id_seq'::regclass);
 7   ALTER TABLE public.crops ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    25414    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            |           2604    25247    farms id    DEFAULT     d   ALTER TABLE ONLY public.farms ALTER COLUMN id SET DEFAULT nextval('public.farms_id_seq'::regclass);
 7   ALTER TABLE public.farms ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �           2604    25386    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            y           2604    25235    soiltypes id    DEFAULT     l   ALTER TABLE ONLY public.soiltypes ALTER COLUMN id SET DEFAULT nextval('public.soiltypes_id_seq'::regclass);
 ;   ALTER TABLE public.soiltypes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �           2604    25394    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            Q          0    25220    cities 
   TABLE DATA                 public          postgres    false    201   ��       [          0    25332    cooperativemember 
   TABLE DATA                 public          postgres    false    211   ��       Z          0    25301    cooperatives 
   TABLE DATA                 public          postgres    false    210   ^�       W          0    25272    crops 
   TABLE DATA                 public          postgres    false    207   ��       b          0    25411    failed_jobs 
   TABLE DATA                 public          postgres    false    220   K�       X          0    25282    farmcrop 
   TABLE DATA                 public          postgres    false    208   e�       P          0    25200    farmers 
   TABLE DATA                 public          postgres    false    200   �       U          0    25244    farms 
   TABLE DATA                 public          postgres    false    205   ��       ]          0    25383 
   migrations 
   TABLE DATA                 public          postgres    false    215   ��       `          0    25402    password_resets 
   TABLE DATA                 public          postgres    false    218   ��       S          0    25232 	   soiltypes 
   TABLE DATA                 public          postgres    false    203   ��       _          0    25391    users 
   TABLE DATA                 public          postgres    false    217   ��       p           0    0    cooperatives_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.cooperatives_id_seq', 40, true);
          public          postgres    false    209            q           0    0    crops_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.crops_id_seq', 51, true);
          public          postgres    false    206            r           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    219            s           0    0    farms_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.farms_id_seq', 120, true);
          public          postgres    false    204            t           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 3, true);
          public          postgres    false    214            u           0    0    soiltypes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.soiltypes_id_seq', 17, true);
          public          postgres    false    202            v           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    216            �           2606    25229    cities cities_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_name_key;
       public            postgres    false    201            �           2606    25227    cities cities_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (code);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    201            �           2606    25338 (   cooperativemember cooperativemember_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.cooperativemember
    ADD CONSTRAINT cooperativemember_pkey PRIMARY KEY (cooperative_id, member_id);
 R   ALTER TABLE ONLY public.cooperativemember DROP CONSTRAINT cooperativemember_pkey;
       public            postgres    false    211    211            �           2606    25316 #   cooperatives cooperatives_email_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_email_key UNIQUE (email);
 M   ALTER TABLE ONLY public.cooperatives DROP CONSTRAINT cooperatives_email_key;
       public            postgres    false    210            �           2606    25314 "   cooperatives cooperatives_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.cooperatives DROP CONSTRAINT cooperatives_name_key;
       public            postgres    false    210            �           2606    25312    cooperatives cooperatives_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.cooperatives DROP CONSTRAINT cooperatives_pkey;
       public            postgres    false    210            �           2606    25281    crops crops_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.crops
    ADD CONSTRAINT crops_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.crops DROP CONSTRAINT crops_name_key;
       public            postgres    false    207            �           2606    25279    crops crops_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.crops
    ADD CONSTRAINT crops_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.crops DROP CONSTRAINT crops_pkey;
       public            postgres    false    207            �           2606    25420    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    220            �           2606    25422 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    220            �           2606    25288    farmcrop farmcrop_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.farmcrop
    ADD CONSTRAINT farmcrop_pkey PRIMARY KEY (farm_id, crop_id);
 @   ALTER TABLE ONLY public.farmcrop DROP CONSTRAINT farmcrop_pkey;
       public            postgres    false    208    208            �           2606    25219    farmers farmers_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.farmers
    ADD CONSTRAINT farmers_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.farmers DROP CONSTRAINT farmers_email_key;
       public            postgres    false    200            �           2606    25217    farmers farmers_phone_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.farmers
    ADD CONSTRAINT farmers_phone_key UNIQUE (phone);
 C   ALTER TABLE ONLY public.farmers DROP CONSTRAINT farmers_phone_key;
       public            postgres    false    200            �           2606    25215    farmers farmers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.farmers
    ADD CONSTRAINT farmers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.farmers DROP CONSTRAINT farmers_pkey;
       public            postgres    false    200            �           2606    25254    farms farms_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.farms DROP CONSTRAINT farms_pkey;
       public            postgres    false    205            �           2606    25388    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    215            �           2606    25241    soiltypes soiltypes_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.soiltypes
    ADD CONSTRAINT soiltypes_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.soiltypes DROP CONSTRAINT soiltypes_name_key;
       public            postgres    false    203            �           2606    25239    soiltypes soiltypes_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.soiltypes
    ADD CONSTRAINT soiltypes_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.soiltypes DROP CONSTRAINT soiltypes_pkey;
       public            postgres    false    203            �           2606    25401    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    217            �           2606    25399    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            �           1259    25408    password_resets_email_index    INDEX     X   CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);
 /   DROP INDEX public.password_resets_email_index;
       public            postgres    false    218            N           2618    25361 *   farms_that_worth_more_than_average _RETURN    RULE     �  CREATE OR REPLACE VIEW public.farms_that_worth_more_than_average AS
 SELECT farms.id,
    farms.registration AS registeration,
    farms.owner_id,
    farms.city_code,
    farms.latitude,
    farms.longitude,
    farms.area,
    farms.soil_type,
    farms.unit_worth
   FROM public.farms
  GROUP BY farms.owner_id, farms.id
 HAVING ((farms.area * farms.unit_worth) > avg((farms.area * farms.unit_worth)));
 �  CREATE OR REPLACE VIEW public.farms_that_worth_more_than_average AS
SELECT
    NULL::integer AS id,
    NULL::timestamp without time zone AS registeration,
    NULL::character(11) AS owner_id,
    NULL::integer AS city_code,
    NULL::double precision AS latitude,
    NULL::double precision AS longitude,
    NULL::numeric(100,2) AS area,
    NULL::integer AS soil_type,
    NULL::numeric(100,2) AS unit_worth;
       public          postgres    false    205    205    205    205    205    205    2976    205    205    205    212            �           2620    25349 *   cooperativemember cooperative_member_count    TRIGGER     �   CREATE TRIGGER cooperative_member_count BEFORE INSERT OR DELETE ON public.cooperativemember FOR EACH ROW EXECUTE FUNCTION public.update_cooperative_member_count();
 C   DROP TRIGGER cooperative_member_count ON public.cooperativemember;
       public          postgres    false    225    211            �           2620    25350    farmcrop farmer_experience    TRIGGER     �   CREATE TRIGGER farmer_experience BEFORE INSERT ON public.farmcrop FOR EACH ROW EXECUTE FUNCTION public.update_farmer_experience();
 3   DROP TRIGGER farmer_experience ON public.farmcrop;
       public          postgres    false    208    224            �           2620    25353    cities trim_city_name    TRIGGER     �   CREATE TRIGGER trim_city_name BEFORE INSERT OR UPDATE OF name ON public.cities FOR EACH ROW WHEN ((new.name IS NOT NULL)) EXECUTE FUNCTION public.trim_name();
 .   DROP TRIGGER trim_city_name ON public.cities;
       public          postgres    false    222    201    201    201            �           2620    25356 "   cooperatives trim_cooperative_name    TRIGGER     �   CREATE TRIGGER trim_cooperative_name BEFORE INSERT OR UPDATE OF name ON public.cooperatives FOR EACH ROW WHEN ((new.name IS NOT NULL)) EXECUTE FUNCTION public.trim_name();
 ;   DROP TRIGGER trim_cooperative_name ON public.cooperatives;
       public          postgres    false    210    210    210    222            �           2620    25355    crops trim_crop_name    TRIGGER     �   CREATE TRIGGER trim_crop_name BEFORE INSERT OR UPDATE OF name ON public.crops FOR EACH ROW WHEN ((new.name IS NOT NULL)) EXECUTE FUNCTION public.trim_name();
 -   DROP TRIGGER trim_crop_name ON public.crops;
       public          postgres    false    207    207    207    222            �           2620    25351    farmers trim_farmer_name    TRIGGER     �   CREATE TRIGGER trim_farmer_name BEFORE INSERT OR UPDATE OF name ON public.farmers FOR EACH ROW WHEN ((new.name IS NOT NULL)) EXECUTE FUNCTION public.trim_name();
 1   DROP TRIGGER trim_farmer_name ON public.farmers;
       public          postgres    false    200    222    200    200            �           2620    25352    farmers trim_farmer_surname    TRIGGER     �   CREATE TRIGGER trim_farmer_surname BEFORE INSERT OR UPDATE OF surname ON public.farmers FOR EACH ROW WHEN ((new.surname IS NOT NULL)) EXECUTE FUNCTION public.trim_surname();
 4   DROP TRIGGER trim_farmer_surname ON public.farmers;
       public          postgres    false    200    223    200    200            �           2620    25354    soiltypes trim_soil_type_name    TRIGGER     �   CREATE TRIGGER trim_soil_type_name BEFORE INSERT OR UPDATE OF name ON public.soiltypes FOR EACH ROW WHEN ((new.name IS NOT NULL)) EXECUTE FUNCTION public.trim_name();
 6   DROP TRIGGER trim_soil_type_name ON public.soiltypes;
       public          postgres    false    222    203    203    203            �           2606    25339 7   cooperativemember cooperativemember_cooperative_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cooperativemember
    ADD CONSTRAINT cooperativemember_cooperative_id_fkey FOREIGN KEY (cooperative_id) REFERENCES public.cooperatives(id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.cooperativemember DROP CONSTRAINT cooperativemember_cooperative_id_fkey;
       public          postgres    false    210    2988    211            �           2606    25344 2   cooperativemember cooperativemember_member_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cooperativemember
    ADD CONSTRAINT cooperativemember_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.farmers(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.cooperativemember DROP CONSTRAINT cooperativemember_member_id_fkey;
       public          postgres    false    211    200    2966            �           2606    25327 (   cooperatives cooperatives_city_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_city_code_fkey FOREIGN KEY (city_code) REFERENCES public.cities(code) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.cooperatives DROP CONSTRAINT cooperatives_city_code_fkey;
       public          postgres    false    201    210    2970            �           2606    25317 )   cooperatives cooperatives_founder_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_founder_id_fkey FOREIGN KEY (founder_id) REFERENCES public.farmers(id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.cooperatives DROP CONSTRAINT cooperatives_founder_id_fkey;
       public          postgres    false    210    200    2966            �           2606    25322 +   cooperatives cooperatives_president_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cooperatives
    ADD CONSTRAINT cooperatives_president_id_fkey FOREIGN KEY (president_id) REFERENCES public.farmers(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY public.cooperatives DROP CONSTRAINT cooperatives_president_id_fkey;
       public          postgres    false    210    200    2966            �           2606    25294    farmcrop farmcrop_crop_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.farmcrop
    ADD CONSTRAINT farmcrop_crop_id_fkey FOREIGN KEY (crop_id) REFERENCES public.crops(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.farmcrop DROP CONSTRAINT farmcrop_crop_id_fkey;
       public          postgres    false    208    207    2980            �           2606    25289    farmcrop farmcrop_farm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.farmcrop
    ADD CONSTRAINT farmcrop_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES public.farms(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.farmcrop DROP CONSTRAINT farmcrop_farm_id_fkey;
       public          postgres    false    205    208    2976            �           2606    25260    farms farms_city_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_city_code_fkey FOREIGN KEY (city_code) REFERENCES public.cities(code) ON UPDATE CASCADE ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.farms DROP CONSTRAINT farms_city_code_fkey;
       public          postgres    false    2970    205    201            �           2606    25255    farms farms_owner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.farmers(id) ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.farms DROP CONSTRAINT farms_owner_id_fkey;
       public          postgres    false    200    205    2966            �           2606    25265    farms farms_soil_type_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.farms
    ADD CONSTRAINT farms_soil_type_fkey FOREIGN KEY (soil_type) REFERENCES public.soiltypes(id) ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.farms DROP CONSTRAINT farms_soil_type_fkey;
       public          postgres    false    205    2974    203            Q   N  x���Kn�H@�>�vI #��Yň�1<��X	�ٵ$�j�"�&i@���bt��&+�D�k��� 5m<Twի*������bvu���=��&�ޯ��~�vխ��Y��7�*��}������-?����mxs>��)��1�������¦�.lC��VJK�I�}�umR��>$�R1n(T�鐦#�8�B�@ۆ~7��p��6Ä6RPhiCh06��%e�.O���K
�l�k`��2�Y�]�f:�UK�hG�����V��<�-�J�@\�p����#��%�&�@�F#.�f��{.ƴ!�[M��B�=1G��8���]]���H�8I	�^��t,��jEr�{$vi���5f|�ڸo"�ux��S܅�pf`jnh1��uL-��duI4Pcބ�t��bIk䘧}lW8�8w��.���Xh�H�O�#�/�jS��􆑐 �e����#$�1�%�'�1U��Ã	��$�������	�n�
%��t�1DO
Qr�ak�$�$r�?�4@#t^�*F�"7U�q�s�8�Z$2���]�0ݴ2���oK5s�i8�:�g��-�",v۵#��-��������[Z:@��ܛ�&��m�(M�^{E�j1F;ҡ�qݭB	PJO��J ��EW1'I�@�ק�!l��S��T`�Mh�PxB��Ʋ�|}$\d��m�?>^e��BT�Lkl3�:4��CS��hZJ<���hRh����~١�#v��鰆�f��4�q�7r���Z�5>�=ĕ+�)����n��ц�ֈۖ�[ڊ����� �fi�	�"����C�S�y&�M,�:�u�}�pO������[F�2`�"�徃�*��
���U;V;Zt`��?�m�㘾cc�xb����!Ը8jRp�+~��I}F|��%������k�f�g��xq�>U�y~��mm��oJ��-@Z��mYYB__F���B��u#��?�2�������PT��Xh�9��k���F�?�ʋ���T}�ms�۔�zڈ���U���IDZS��Ʒ�tO�R��ݜ{����<e�<��}��#W�s��]�k.�p���������y��P�gtgg��pO
      [   Q  x���;oG�s���(Z���3�H��X�SÒ����w��i�.� y�����ڻ�o^���ܽ~�k�������?�x�|z�����ӧӧw�����y�����~}<}���5��������_~��<c{Qnՙq3�������d-$�}��>���.G���A:��F���oT�iujK�xb'�.�f|L���p�6mL��ᑣ9I�:�����T�L�
bä��G�P`�@z�1�'q��[��Z��@`�H��'d*�[���A]�! #�k	>Ŧd.!\ІVak��!t�Fh�Xp�� C�#X>(�)8H��Pf��<�!a�B<�Ϛ)��F5eV�O�m�`��(�;Xwp��� -��]U� �]��
x���3�K"����	pf$�T�Q���>�-"�lc�[D,�d*�S0�@���D�@7E*�i:)�~�G���Sc����A��ꙈP�6Y�(�{�5�.�dV��L�.D9�4�?
�r"%R�sۑr,a���̻=�\W9��L�8mU����ؠ-
Xr\'��j�Tp 9ׇ�4��Y�d�v�z��� _�rc���jD3��\8-ӈ�ʉW\�2�S9��n�dʬ���b�nҤ��F  ҈`�-3�
�hށ�bI2/�����h�k��:%�����0���==�A�ЬP�JD�L�@VE�A��7�V�}_��*�&f��� Ǹ:"��#� 5�8`H��t0����QF�+��7��1b ������S 
#�� fM=�����q	X�u$
 Q*����M@��$��Y���jGK9��W,����vps�/�'�      Z   ,  x��Z�r�8|�W�ͳU�� H\j_��؉/qٞdw_� 	9�-I�#��){���JS�h�٧O���=^<<�/wO��f;+��d��׮-^|�~+Ǭrk�|�:���׾j�\��=�m������M�bA?��y����������֮(��گg���m������q��~����6�E��������^	�c.�IFGV�D(�Ej�0��jk��)%�C%"c�Ŭ	����=n��3���<TU���Z��/���816�S��vᵚ桥�k���㟣/���x����44�����qb�P�G$Y&��O�dB.9�8��g�e7��v��ճP�1Jx6�vtt�|=ϱ_��3fk����U1���m����W�&P
������=ծ�mg�Z��\�]E��֘H-����Tiiy�N�F�4���!^҉��l�����ߍ�ݺ�K��cvv¤NL
�f����6ϡ^L6.�a�Z4�m5L�huW�|B5~��z�o�1J�X���e&�J�J#�t&S��L�Ì@�Z��{	�{��э[yv�py	��7fm�R�U��J�T�t���� �	.�qU���_�y���Im
`�\EYB�Ʉ�\ҡLbef)�n���E�7���6턥ƌ��ģ�[f���JQB+7i�P��"������Uդ�����ֺ��]��:l7=^i�K�B�,�S*���CNDJ�P	��k��6�bt�rvZԋ�r~ƴ̴�TEf�"�'�ڽMgE��GWzY{_=�rA���h[0!*��Ⱥ�E��8�E�ie�>�$��J��<l����o�u/�Y�F?�&v�rw̾]�L�B�Nϫ�r�'4��U�:,]^�W{�r*_��vёJ�����#+��/�l/�� Oة�[_��!�E��sj_�&/j\��	�z����b�*겨����A�GY��<?f��}�����(��xۍLl��Zʬku�H)�3��q�
	="�bO[��rtS���;g��ݹVn�'�Η��y��`i���4B�v�]�4�1���~���Hmtf�ɨ&3�'���T��������dw�����ەp���abdI�_i	�ͪ�hv&�:�)KȵU¨Β�!�"A��0M��4\.KT�|���J�N���ۦ��A�%Ν���,e;Y��U�n�*��0�F���o`��2����s�)��L$%3�C=�M�����
��ftQ�0NdYo�1c���`�"��~<��H0�Y�6<DhQ���Ψ�]<?�^vRt㟟Qp�I*��*}"�'�MVB�[�*��]�zu��Q���w�{"=��I�~<�zv���~ָ�0��$���8�M�pk� �t�F�왤%���Lϔ�����f�J�&���@�	����%�8z[(�SX����P:�x�cI/�v��û	.{�3���Ä�T�!�J$䝂?�E],����ә���)2Ij���r�3�Ng��S+�<|����U�KC!���F��Y�}`��J�#/��m����<��n�΀7.}]��N|,�Ϡ|
/1Zm�A��;v_��.��_���/�:,���xصRL�
yՐl��-�	�e���w�&���?�Bؔ<��K]J8�$%"��y����l��[���]�{��Fdr,SE|^�}����^���0������f�m?,��[�K2�I�("�H���,�����I�]�M�@�{�t�i����pz<C�n0�+P�L����b�s���D��"t�n?@q�o���W���Xk�P��J�t���	MK�G~�E����8PB��N�5B�N?9�HG�����9��!ȕ�aRBä��(�%i"��V8n�#��J�5��I���e-y7,��@��zp��O��L���v�;�$�?��\>}��ҭ����Y�� �*�+�M��/��]��*u2t�':�1�����yE)�6zL����4S|�%&b���>&%x�?]�9�!�E�����(�Bcڶ�x���4L�}����� �X�Ҥ��R�6\�h�b�	�ɕ���Ǥ/ӄ]���m�|�w��҈1M:P;k�jXhQ1����u��,P��,��e�Iˡ������Y�y,ic�
�ʂ�Z�[�.
h�g����ע���y �4Tu�ٖn���$9�q����<��R<�T#gH�4;��m���Z������.��}� �΁�Ƌ��X��)V�	
�s�N��C����+r,����)�g�r��{��զ�Ş�����f�lc�]��BU�ɚ��t��YL���Ux����������,:p�Z�g�2B�[qǑ)q�=m`ge�����/��p%�'��Lh�iG�?�y��;�-�����<z�h�M?�F�J8纛�z�x.R�z_���h�#�����݆&��{�Ow�riy���s_ff��b�/��Z}�F[�^�}��Ǹ�PZ����2�E��3m4bkBz�;�[�]+�:ZQ��G�ZB�ﾓ��J6���uh%�E*.�		n��c �OF�h"�L���_�Y����dٝG�=OF�~�,�,�aK!�I!�������Ud!���Mw�	��L��!&�Y���;># ;�N�A�I��#]f���e��Sq.2��bTF�N����
(�,��@�T���l��4ppӿ�M� ��Ut_�Ex)�u�&\x]����σ�O�i�rmBOS��i���9��P=G�h�ky����{�ɡV+��)��8�� DB�G�G	��'*�n��<�s t?��Ő��G�|<`�+��K��ȟM�h��	�o���j��`����4~߻y�箯��3"�I��Vt���d��-�1q��-��/�=H6����}�|�@����n��o+7i�n�Z���m�1�߮
ݼ�q�_�k9}T��&R
����)�D_�?�"��^��j�绲����i ��f9��ԍ�K=`��)����|���q���e�3�ݾM���SK�OR�4>B��Kז~GOB�}����W����	���i����+VW7�$'��ry5�ܶ��t�O,�sRZ.P���i@��ՙf�D��S�upO�;��8\�}bB�.����$��Y�$(��3�Q�ɗ�w���Ӱ�o��������NQ���J؁9;�m\ӌ��e�ۏ�$S��˺��_�;]�e�����$�	U����6�������}n�2�bR4J*V�����ō�}�S��,'���]ޞ3z2U��$��ҷ����8HҀ�]4�݄��i�����T�'7p��L
�b�.���D�Q��֍��i|�S3�JFh<X��j)��&7H`8���m�ފոg����G&�����$�4#lS��	:���{y�]�{��M��9�Fvn��nⶾ�)��F���<      W   �  x�ř�n�@@��
�H$�l���zJ�"BZ��h1���^��~�?Q)�^˥��p��;c7b���K+z��y3�L��㇅3�[�w6z��� QŦt.�Uߑ<}'�x*Ԯ�B��L�ǍJ��y����\q������*2W�����s����u�U�<�b���xn�����]����� #��%���n��\|���0�Q��NqFf0�F ̖�����Ú���(�ݖ������k��Z�.�V�;!QD�Rؕ�'����4#�Qź�R�'h�T�<1�)�%�(B�3$3�w��fb}��a�>a�E	f�J�>�C7��n�@�7En�Ui�P�&O\��y��|�ND^��y,�Rɭ����R����:�Y�b|��"����ZUv��h �:�A���VtF��9(zRn���� E�<�!58��)�T�>���G�	Yқ��h�i1�I�C%���C<)F?<���ղ�g��@��=OM�ڦ�k�(@ xU�-I�Ƀ4�A��t��8P�>��8|P�T+�̋��K;���]�(��ҷ�Ĥ=�{͡��=X�6�i���,=�E��,����Ҍ���<�����^%x�c=����5�q4u�0qv�B��X_�S=K���4w�����,@�?Ϲάdn��!=zV������)������_��a�Đ&B+0�v�6h�����N{�C/f#O�]��f�'�24�d�!�{��L!xH���4���S�W ^�/T��<�����| b�7��ew���U����5��Vp�����<3fRz�	;˅B0D&U��7ˠ���Hz���?3��\�F���^����s���Zm�����>t�䵳�O�^C����?����l��ݤ_���?�3�r^v�m[xq��Y&�      b   
   x���          X   l  x��Z��K��+&�3�m�S7��J$^):<���Z���GO䔴�nB��r�\����^��n_�y���������/ׇ�>>��=����}�l���r���������?]|�lׇ��'ۻ��}�z{,��I�l�8Q�Sߙ]6j�=M)=����/��˖���heOeC+%��Зe�=����2!^�����e=���2j���5�:��{�;�aQK��i�J��;AB�Ɗ�~ccj�#�(ڲ�`I�������Օ�Y��J�c���@T��5(�،��s��c��F:��`�մ[2�cbU$�$A�"�Gr�7�*��2�*<)#��<��j:_;U�aFԐl�,���p�1����AD�����0���Ȕ���U*���B4��Nt�U�<+�*�.^ņx�9�c�+Ԟ ��v���bȽ��b��6�9���ba�n�1�:��Y���tUn��E�� �q~:8�!�0.�|��fv1�0uĆ�U����M�Ot�����9�@�W�x�aj�b�q��\8:�F��d� [�Xd����1��n�i�{v��C�b�y�ŕ�`F{]j �}�X}�kET��ۼ$l�Z�7]ИI��݇��� �|�U�'e�n)}�j�M��C�(f��W*��J�-�*�(�����	��D��ݽ�{=�!��ĞB�猂��Ufj/�dg�l]@���eZ�4� E��̛F� ���P)v&�!��["�@�@<�Y�<��R�f�<,���
�h�Н�a�"�Ѓ�&��T��c�L<"�	�L��e�OX��b�68�4�PA�u��2o%��)[���	�Db�J5�F>�׎S�L�` �)����K��Z�$G�g:kK� �j��Uh�ԌH g��<6IO��eX��+�ۙ
B�ͻѴTq$?:$��3����m���Z/�1�D�챱���sD��!YΘ�T����s�1T�w�grDcsRY�������7�_�L�=��:F��\�#��r8����WfjX��R!��,:j+3�әb�Z��S���D��o����D�|��[-����UBV���}3/�|��/�}�{�5�I�(���c�	��cT�0�t��u��� �.һ ���!���Ŏ1��(x`:������G      P      x��\[s�ȱ~篘7��5��9/�勼��%)v�o#r$" �п>�� �Ho�ǃ�$KrI
hv��|���tsG�^�}#O����M|�
mGޖ����e�n��l������t�6?�/��b���Ӣ��BX��zO�|ކ����<���,�#?N/��閼}c�ІR&$}�a���;B����ė�*���>>�XΖ���CN)-(+���Ji��U!����m�>��E�Lg�*�(��|l�U ߛvMn7�:|��g������
�{F,c\�h���w�;���!�����EӶ���M��Џr���|z*��������$�S)�+���uh[����a|��R�(̚���֓�z���e���7u���R�/"�3��s��|�L�48�Hh�2�G�����9�,�I�⳿1�����UK\r����׏/H���%�B��E��uӾ���&l릚���z����('�,�#��q�)�PS�/j��m��K�j�-�� ���(��$
�8���(�O�e�A��GTMS���6�|@�};O�r�'���Á�Xr��ɿ9sNƲ���r�#���s�:���i*��Y�ăJ#S���T�0 	En<2�%_��9LМ5UYw��Ņ��A���Nh=f%�PN"� ?3*��8B�-�a����]XBj&s� /G�CS�t~U��\�ͧ��7�"" -&�ᅜ��);\��S�w�p���c�U θ�ׅ*�=�����D�ooޜ�� ]pу�5H>jX�T[�g�2Lۦ'�f�:u�U���u_/���7���M���v�<��(�/$�j�I��A�,�a���ҧn�HQ9�uF�E��)8��*˟Z�۝>�Mu!�9�ȧ��|n�yGN��Sb��\G�&��5.y��)���tD��;�*b@ӂ�(����f�~��>L�Ɛ�x�13��L�p�۪M���NVeUuӦ}LR��o�zM~��e��CӜVm�7�x�=9�F@�c�J	\'������ǰj�yJ��b֬Î̀QYռ�Խ#@w`�9,��K����Y���䜦��-�2%f w�x(g �J����l�Y��P��8��ڸ1SI��F������� f�*���s�����ܙ:e���u<�m�-�[2�t�|��2��v�nc(�
��o�{r}E���Z0;"Tkጉ���E�"�_�ud�C�n{�﹎"�}d��f�DJ����9� ��~(/����[uN/wz��Q��92��W��픰�>�@�C���t���&>����%�,FN��_3��ԻO���΢~<��G\u�R�(�P?ϡN�M��ʐ����H�,/"0.\�=�~e�d��!"�v���E3�1M�+�@mQHn*�YI޷�P�t�S�����4���Q\�F�eN�^<���@R2z`�l5��Ԁ��`���A�A\�hB�af�`�#�B�P��8!a�'�e�K����"߁ρ�lB���1���ȟ���~�n�H8S(KG�$n�v`�Ş� �� >_�M�>l�����􆷨�wDZ� ��ʿT�'���6َ}� 6�?k�Kr�@�}�VŧU�J�;��KbM�
rީ����Y��v;�[��X/�*��v;�͎B#r
d/M�>[D���I��!L�lI�C����U g~��cĄ�|�1uD����#QZ�ʱ�G�����T0��r�h�N��.�M�7C�K&������yu�ü�C*y����/�v�@V�H���v��Z���	t��v�"��J�c���,�8+.��V	�	�;�'{�˲�?�ahw%�?��Ia(�D)f/��
G2\�I̓:*�E�P$���s�����H�e�X��
܌�|�����a�R5}�
Y��cO�ʌ��P��Bs�X<���H�{�Y���~�G���:Ln}U�szA�թ�q=��;�%��c�Y��G����.üo��.i�;� ����C�,7��0}.��?6� L)�i���~�&@��>��3��b������#a���X#��a��#U�������j��cq��9�=���J��s�-R�j��M��1!)�<��_�v��*���8f�r�j��H���N���tcf�3�gfmt)�YmGJ,�bLaz����8��p�	�Λ����:YdS�US���j�}*r[[}��u(�{�"���\��pqrܧѷ�,�cV�%�!�(c�P�f����a[�K%S�6a>T|#�:�Rde��.�u��YV�p��D���K�B)��\�dԳūz���b�x�?��?�W��ۍ$���şB��β�<׾.3��W��h�����~4�P4
ʱ�:��)n�8jwXu��A��5�v���9���Ҙ�D��4a�(R3��g
@N��;w5�!(��o�';���z�K�`�Ǡ� ��~S�F�1]��:T Z�͟Up��j�O&��Z�Wi�1[ �C��!p���L��G���q�?*��>2=���!�e���akq�c&g��T�r��/�H,���Ʀy�CQ�X!��m���^ p��XX���2��6J1�6��|�:�G#�Oȇ\p!�
}͹(#i6z�`a�,�T���zY��I��H��2T�A.�o���/���Ǟ��k)��7L�Sj)^Ì�l���H�Q�t�����7������2�i}�7j@����{S��T+��l���K[>.�(9@�ɬ���n�����{�ғ���K*�䦁��=�w$ꔘ��;N��@]h���}2�(��BuԆ]Kn�su��q	��$�*�XI�j�9@[Z~4'�0�!��|�nr��?����o�]��(���''% �IK�-���O��N�|�Lns�9�ۛ7�+��]���K�aOߩ�=�����ׂ5�$'�p7@�ԥ�ՙ�k����Ҵ
��X*�Ra��Wl���X%]�r�#�E�k��0��5��Z!X��	�y��G�eY�#6g����Ei��S�2};'P�%I �h_I�e��f�\���s�����9*�=�����B���z��{c�����
��j��X�#��C4��a�?7D	#t!Y�_z,U$�;`fc)ݙ�8��G���>�͏���2�H�G3$ p%��r�9� �#�~�~��e#{ִ-��i�M4!�������b��=�I�W��}B���2SXb�>8.��~��1�J��E�(��4~�� �w���u�u��� �'�yF�䡊Ath���ec9X	m���;�}�ak��>+�R��G�ܡ쵐��@%�Y
w��V;]ͪ^[~%Qh?�U�k~�����_;�u� �*To�7��l��q�T�z�2F���t�SZ}h�r9��M�E)bR�BQ;q�K��[m���)�
��	6����&z�]���*mU�o&:ApG��PCVè[1��T�C�v���Y�z�S*�hn�Z-`hu�nyܸnb��y��|�c��8�3�r�
U���?B�����c�h$1$X\OY�;&5֎F�c#���kS7 ����
�<V�.�S����d�d���W#fȧ8�&_�*+���~"q)-n�X��g	�8xe���
Z�C��$�Q�s��Dig��nm2rٴX+P������i�Z���zZ�)���f�u�o��)F�v!Z�W��Z2+;#����Mo��k�/Fi_׿�L6�B��D�KCo���@�8����r��V�z]��~��\�ٖ����e�\��ܒ���l2��g�Z�Dj��CyDs;�-������+�0'J�j�������M��	��T�iu����H����e1�]���.��v�ȼ�1X�p@�F�D`z��㬷q���w�C�bn������b!5���Z�7�����o�f}��"b9��F��>o��P�Q@�4�eL����N��3��`9DZA;�e�~�4�6� b}۬�K��DE�o~5���ly�u��*�����,��v !c�����@_���.�`t,��d�K��B�- ���t��~tR=ٹ���P�B����n�P�y��$/X텵�qS��)�q����8@��G" �  �Y�L�$��H�%�g���-;�c7��B�yS/�3��Ed����w)��@�����_��i�_��P��]�#��o��j���<��[Fr��m(�jߚN��U��o�%�?˰��3Kr��q�R�M�>���m���u�$"�D�/e��������y�s��_��ڦ�Pl�ōn��Hj7R�I�dε�"c��:�����=��Ϋĉ�C�L��<���+��a��s��m�z�oU��.����:3�����Hm3(T���}���#���,�j���ZH9<H�)n}�mn0����z�l)I-��f����2?˺.��{rw7��tV��(���TPه�'�?¡��4���۩h�����,��E<�_�6��q���U&�������]�����.OIT����E(.4B@��Y��k�ǧ[���ʷ��5�f�K"$��%7"�tu�P���te����%W��J�4��e�W߈��6���4ڲ�#Ǭ�'�'���%b��o��⫵�Bp����y��w�ъ�Ǯ��ː����yb�܊�rJ��(4/0H�7���D�|<���Oh�����ה|-�7�F�A�7���g�">���8�[�æ��5`�W��P�6&5�������]B��HB�Q���b�G����?��빯���O��̆�\�!�2�?�M��^C(rQƃ/�_/�◗��Tl�Gc��H�ǂG8׀���Oj����Y����}��}��� ����;W1���W��kG�
����jv��u>�{�D�ؚKS��HM��b�8�E�9�'�'a�*���_���<ܥ(���fIXầ/���-N���c�H�.�ejv��V�r�3��y�Zq9���8m���̰@�g��8�|�M��vab�0�n[H��SQ�E.O�c5��]8y)�f����n��Ŀ@:}h�f	�G�r6]��cO���ɱ�cF	�t��{C�X���U�mn�[�'��0J��͡���G���T�_�����~mQ�����S�w�֗�8־xL�6�^�@�#���~<�
*�R��ĵEm���)h1�s��9Y�`�:.\*�M�
sO53|�fM(�ՉY�G�ZFZ��|lVy����s�+��@eW��toU�.7q�L��e����˲��u"O�׿�ohO`Q�Q�cw� ��J�+�4��Ұy�      U   -  x��\��]���+f��{!RI��.�P�@�vk���H��q��KR�z��f{�ȼ�-���#}������O�~���=��ۿ~����������W�|~�����~��������>���ݧ7������|��������⫏~�_������ӯ�������7~�����?~��߯���������/1n�7䧔��|iߖ�	2�l�>?mL{��b��W}~��yO��I��*P������^WڏU`��!��aRe�Is��b?���VX1�ؿ�Z1��K��WW�[5y��A8US*���X�5)��Ҡ��>2�(��B�����iI�D[N�����cm�����8����ce�����RbeT�T78���6���Cv������6���J��nŔ-����Zm�q-�����2[��j�T��cr��i�&yZ�TA���G��ZuG?;�4����yBJ���ڒnX�g&�����f��W�J{��� ���~ij�3�#3��3:����Si�\<C�|y1����c�	�Zbq�Y��l�$��́�����@� �np�h�Y��C� g��;���w��pc�P��4�h�J4Ω;6j�&�c�ؖ�r �q+��3�Ͱ@)��RjʕQ9�i������F}j)חCme��&�+�&`�|���ۊ��E5�W¶���Y ��L��T��n��8[��������[�����^�k���6�#VI0Z��y3�5"��]֡R]`qd�N'6�jHD����<��A����~��xk��V88{��4T+�r �T+G�	0�������B�NhD@��@҉>�INL�l��Ҙ�ə��sc(�W�<җ&�)I�H���4?a�X��m��:e��vG�NM�p��j"C_�i��v�e�U)�f���#������x�G�y�8�l=���N�6�kjx}1��Kb��XM&�}��䤝|qvՆk���W3<k��>�SI���׊�I��ŗ&�4\��ՌP__L��lb�h?�0/&x�F5b��ZNTCe�r�� ��>���;�V��A:`���z���͖_!�~`6�{h�'����.�jzXP��ҹ��`���nZ5,`BZqW k[}��MqW�K����[9��Ǚ;��7�C�۬Ȟ}CY�Ag0� ���6Q��uj6Q����0A�$�-|�i�b�W8T��j ��:Y3!u�V��4s�ۖ��1�y�Թ�*�t@�줙{J)�t�|��𠲝��WR�L�.pz:A=��d)7*s�u���l)]`5_O�s9v[�L�l���Nw�7�f�$���Q���&�)�N�W4���������tT��f^`��G���:#�� ZU9K�6�1.�LQ�xl y��ۜ ��G�[hHl��΄�n��n ���)M��������9P0g�9��kq&;����(M����I���Fil2�ry(f� �=���N5j�6�hg�G����	A0�5��
Ē+x-���=L��v��Ë.&�����|ΓCH�@��!g&�J��K�;* �z��Cǀ&?� �)��������A�1Q���t�
]Dc�Qfns�:�7m�vi�3�������׃4��'��S=�HZu,�sc�3��H��4�9�Վ�>�6VτmЦ�)�ݵZ�{m`�˭���� R�q||�{�:�	��NJ�C�ͦ���r�;t0��E=kg�������# �k�Q��B�������Z��\:�@CX[��&y,����ՔtX잻˯PO'v&̜�l�aIs�<����Y���j1ұ@�*� z=H$G�.j�����hn�)Lo.�C��M������^����@��N��&�Cd�v�w���=a�1p�]�Ua-}m��\ Ƹ�'��J51g3H���2��QT�i��M#�D���j�����C�#�Ԗ�dvG^amd�i���sㆯK	N�wؒ�iY��t�^�*�b\:s��}-���64l��>ѵ���򴉁˂���y���,��z�@�����Nw: !t��3^>�5��j���+���0�6;�pp��N��X����٤�u��J|z7���Dܬ�p�Q��KQ�>)��-D\2��H�x���#H�g�9���L7{���Z=����tB�&��U���H��Hx )�4(��5��,t(��A3�t�Čz�#!�\ϥ�G��':Ӎ;6%G�{@���H�s�V^����ytx��gˑ%�������TY K�z�~��K�"l;�7�CVП��@�qS�wq�]n�v',m�7���^i���[M^3:�3Ǩ��[��ԝ�u����a�}-MH�&Ԇͩ�Ӟ08u����w<��MT�,�����}���=�LZq(����4l�ℝ����=]8��0��C��A<=�9%�|:]�b�7~
 �`�`�E�T@�r����S���������lz^��:��]���a�o���9�(m�9|	� �jR��M���I}ݎv㺴�x&�bt��Ɛ�$�~�+:x�plPjqC:>�x0��ݜ��"C��z1-ud�x��ٍ3��lX:��\sh���'����S�,	�#���-���q6o�P���)ы��BH���%k�[[�ii��7�����=A�_lX�%2��]2�+��q�ɮ�]�D^Zড�c��B������k_5�g���*.rZp��rh4��pnNYB��Â�h���t7lgZ �=LH/ݔ8m5o5���i�@����H)M����+\-�Aݣ�S�}cI�(}}1�ˆ:�j�ħ1��A�]��� ��P+8��ch�fM0]����1���;����(l�`�}< ����䈧���bs�����Y��?<<r�n���)^q�a��TqZ�U�0�臹�y���R1�������z�Yq���O�&=t���Lh�sI�X��|$T<�5]7Vfo(���'hD#5���w�B���c�SN����{��.���q����lX@���<]g��.�=��ge�W�qt� �0�j�Dp}��Qq)�<97 �rw'��@�;;m��&�@ăP*;��Y�gSh�(T��@��i�>�}����a�q["�&��<W;�!<�3���J"����|k����@��� �#�x��|K�mA��bB{w�ȫ�~�@R:��Wڧo6��۸�	D`>Z�w�!�iz�pI�PC�@���ᘶ+�v[]��>�<�·p���]��A��ګ2�N�|����o���u���р86�#H��/�p,����8>���c��8�m��i�E�o��x�<��|�|���P��h�^J�=�X���dp�G�0���=e�ٗ'�g���
�6��ROF�ߟV��$��y맨b8Rد�-��T�#���Oߥ=���l|�Bm�m��� ���_&������Dn�0PC�b�n�lYa���&�K`�:S&���2Q�F�'}���{F���[�x�^pge��OǺ�.{��dUh:������dF�?����^k�FB��q�M��@���X-����h�Ҹ���x��RǓq+�2(��y��-v����G�q��q=%��nB�0<�Y!P�b�-cx�a��l������
� Ƞ9:o��(����c��6 ����*p�P7@f����g��b���i7�n,��I"�:�7�N�S���9������#T�0�I��4�L��6��*�FF�fUwR���z|T�      ]   �   x��ͱ
�0��=Oq��$���C��T�����W�D[�__T2�~8�W�M�o�����q������h�{������ѱ�p�le��)!(J��=�<�H8��6�2�X��K��L�Q��|���?��B��W������IEƞ&�j�      `   
   x���          S     x����j�0�w?�mI ��i��B &nR��]SaY
�c�_���%S7��*y){Y�wB�.^m�i�*[��be��e}Dc���X�x���|�p
���hD9�<�?��/��}��-D9G%��֛�g��A��LQ<w=�m�B:��&w����M�FK
�����¦��0ݙ4����Iq�(���#�}W5#M����KC��Ԗ���O5���>Ф;[�|�.I��[0�m>DNR����K�a���� ���f6      _   �   x�u�Ak�@����wL���M#%�4�4�i7�^d�'l7�ʪ-ͯ����f�c�����)�}����,��E��D�>�B������}����2��h�oc��E�:G�uFa�CaQtc�o��O᲎���w?�U����Aa��cEuُK��1�|��t�	^/���ҥQ�k�ͦ"Z��R�Y��xe��+�02�l�@���bEC�<}r�jHP�     