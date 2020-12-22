
CREATE OR REPLACE FUNCTION get_total_farm_worth_of_farmer(farmer char(11)) RETURNS numeric(1000, 2) AS $$
	SELECT SUM(area * unit_worth) FROM Farms WHERE owner_id = farmer;
$$ LANGUAGE sql;

CREATE VIEW farms_that_worth_more_than_average AS SELECT * FROM Farms GROUP BY owner_id, id HAVING (area * unit_worth) > AVG(area * unit_worth);

CREATE OR REPLACE FUNCTION get_farmers_that_plant_crop(crop integer) RETURNS TABLE (LIKE Farmers) AS $$
	SELECT Farmers.* FROM FarmCrop,Farms,Farmers WHERE crop = FarmCrop.crop_id AND FarmCrop.farm_id = Farms.id AND Farms.owner_id = Farmers.id;
$$ LANGUAGE sql;

CREATE VIEW address_list AS
	SELECT address FROM Farmers
	UNION
	SELECT address FROM Cooperatives;
