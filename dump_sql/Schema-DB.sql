
CREATE OR REPLACE FUNCTION is_valid_id(tc char(11)) RETURNS boolean AS $$
	BEGIN
		RETURN TRUE; -- TODO: Implement TR identity number validity check
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION trim_name() RETURNS TRIGGER AS $$
	BEGIN
		NEW.name := TRIM(NEW.name);
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION trim_surname() RETURNS TRIGGER AS $$
	BEGIN
		NEW.surname := TRIM(NEW.surname);
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_farmer_experience() RETURNS TRIGGER AS $$
	BEGIN
		IF (TG_OP = 'INSERT') THEN
			UPDATE Farmers SET experience = (Farmers.experience + Crops.experience * NEW.area) FROM Farms, Crops WHERE Farmers.id = Farms.owner_id AND Farms.id = NEW.farm_id AND Crops.id = NEW.crop_id;
			RETURN NEW;
		END IF;
		RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_cooperative_member_count() RETURNS TRIGGER AS $$
	BEGIN
		IF (TG_OP = 'INSERT') THEN
			UPDATE Cooperatives SET member_count = (member_count + 1) WHERE Cooperatives.id = NEW.cooperative_id;
			RETURN NEW;
		ELSIF (TG_OP = 'DELETE') THEN
			UPDATE Cooperatives SET member_count = (member_count - 1) WHERE Cooperatives.id = OLD.cooperative_id;
			RETURN OLD;
		END IF;
	END;
$$ LANGUAGE plpgsql;

CREATE TABLE Farmers
(
	id            char(11)     PRIMARY KEY CHECK (is_valid_id(id)), -- TR Identity Number
	registration timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP CHECK (registration <= CURRENT_TIMESTAMP),
	name          varchar(100) NOT NULL CHECK (LENGTH(name) > 0),
	surname       varchar(100) NOT NULL CHECK (LENGTH(surname) > 0),
	birthday      date         NOT NULL CHECK (birthday <= CURRENT_DATE),
	phone         varchar(20)  UNIQUE,
	email         varchar(254) UNIQUE,
	address       varchar(500) NOT NULL,
	experience    integer      NOT NULL DEFAULT 0 CHECK (experience >= 0)
);

CREATE TABLE Cities
(
	code integer         PRIMARY KEY CHECK (code > 0),
	name varchar(100)    UNIQUE NOT NULL CHECK (LENGTH(name) > 0),
	area numeric(100, 2) NOT NULL CHECK (area > 0) -- m²
);

CREATE SEQUENCE SoilTypes_id_seq AS integer;
CREATE TABLE SoilTypes
(
	id   integer      PRIMARY KEY DEFAULT NEXTVAL('SoilTypes_id_seq') CHECK (id >= 0),
	name varchar(100) UNIQUE NOT NULL CHECK (LENGTH(name) > 0)
);
ALTER SEQUENCE SoilTypes_id_seq OWNED BY SoilTypes.id;

CREATE TABLE Farms
(
	id            serial           PRIMARY KEY,
	registration timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP CHECK (registration <= CURRENT_TIMESTAMP),
	owner_id      char(11)         REFERENCES Farmers ON DELETE SET NULL,
	city_code     integer          REFERENCES Cities  ON DELETE SET NULL ON UPDATE CASCADE,
	latitude      double precision NOT NULL CHECK (latitude >= -90 AND latitude <= 90), -- degrees [-90°, 90°]
	longitude     double precision NOT NULL CHECK (longitude >= -180 AND longitude <= 180), -- degrees [-180°, 180°]
	area          numeric(100, 2)  NOT NULL CHECK (area > 0), -- m²
	soil_type     integer          REFERENCES SoilTypes ON DELETE SET NULL,
	unit_worth    numeric(100, 2)  NOT NULL -- ₺
);

CREATE TABLE Crops
(
	id                  serial          PRIMARY KEY,
	name                varchar(50)     UNIQUE NOT NULL CHECK (LENGTH(name) > 0),
	category            varchar(20)     NOT NULL CHECK (LENGTH(category) > 0),
	seed_unit_price     numeric(100, 2) , -- ₺/kg
	crop_standard_price numeric(100, 2) , -- ₺/kg
	experience          integer         
);

CREATE TABLE FarmCrop
(
	farm_id       integer            REFERENCES Farms ON DELETE CASCADE,
	crop_id       integer            REFERENCES Crops ON DELETE CASCADE,
	planting_date date               NOT NULL DEFAULT CURRENT_DATE CHECK (planting_date <= CURRENT_DATE),
	PRIMARY KEY   (farm_id, crop_id) ,
	area          numeric(100, 3)    NOT NULL -- m²
);

CREATE TABLE Cooperatives
(
	id                 serial       PRIMARY KEY,
	name               varchar(50)  UNIQUE NOT NULL,
	establishment_date date         NOT NULL DEFAULT CURRENT_DATE,
	founder_id         char(11)     REFERENCES Farmers ON DELETE SET NULL,
	president_id       char(11)     REFERENCES Farmers ON DELETE SET NULL,
	city_code          integer      REFERENCES Cities  ON DELETE SET NULL,
	address            varchar(500) NOT NULL,
	email              varchar(254) UNIQUE NOT NULL,
	member_count       integer      NOT NULL DEFAULT 0 CHECK (member_count >= 0)
);

CREATE TABLE CooperativeMember
(
	cooperative_id integer                     REFERENCES Cooperatives ON DELETE CASCADE,
	member_id      char(11)                    REFERENCES Farmers      ON DELETE CASCADE,
	PRIMARY KEY    (cooperative_id, member_id) ,
	registration  timestamp                   NOT NULL DEFAULT CURRENT_TIMESTAMP CHECK (registration <= CURRENT_TIMESTAMP)
);

CREATE TRIGGER cooperative_member_count
	BEFORE DELETE OR INSERT ON CooperativeMember
	FOR EACH ROW
	EXECUTE PROCEDURE update_cooperative_member_count();

CREATE TRIGGER farmer_experience
	BEFORE INSERT ON FarmCrop
	FOR EACH ROW
	EXECUTE PROCEDURE update_farmer_experience();

CREATE TRIGGER trim_farmer_name
	BEFORE INSERT OR UPDATE OF name ON Farmers
	FOR EACH ROW
	WHEN (NEW.name IS NOT NULL)
	EXECUTE PROCEDURE trim_name();

CREATE TRIGGER trim_farmer_surname
	BEFORE INSERT OR UPDATE OF surname ON Farmers
	FOR EACH ROW
	WHEN (NEW.surname IS NOT NULL)
	EXECUTE PROCEDURE trim_surname();

CREATE TRIGGER trim_city_name
	BEFORE INSERT OR UPDATE OF name ON Cities
	FOR EACH ROW
	WHEN (NEW.name IS NOT NULL)
	EXECUTE PROCEDURE trim_name();

CREATE TRIGGER trim_soil_type_name
	BEFORE INSERT OR UPDATE OF name ON SoilTypes
	FOR EACH ROW
	WHEN (NEW.name IS NOT NULL)
	EXECUTE PROCEDURE trim_name();

CREATE TRIGGER trim_crop_name
	BEFORE INSERT OR UPDATE OF name ON Crops
	FOR EACH ROW
	WHEN (NEW.name IS NOT NULL)
	EXECUTE PROCEDURE trim_name();

CREATE TRIGGER trim_cooperative_name
	BEFORE INSERT OR UPDATE OF name ON Cooperatives
	FOR EACH ROW
	WHEN (NEW.name IS NOT NULL)
	EXECUTE PROCEDURE trim_name();
