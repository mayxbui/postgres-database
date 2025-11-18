-- DROP TABLE IF EXISTS Hub;
SET search_path TO PackageTracking;

CREATE TABLE Hub (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50),
    type VARCHAR(50),
    size INT
);

--DELETE FROM Hub;

INSERT INTO Hub (name, location, type, size) VALUES
("Central Hub", "Atlanta", "Distribution", 12000),
("East Coast Hub", "New York", "Fulfillment", 18000),
("West Logistics Center", "Los Angeles", "Distribution", 15000),
("South Regional Hub", "Dallas", "Sorting", 10000),
("North Gateway", "Chicago", "Distribution", 22000),
("Coastal Hub", "Miami", "Fulfillment", 9000),
("Mountain Hub", "Denver", "Sorting", 11000),
("Pacific Hub", "Seattle", "Distribution", 14000),
("Great Lakes Hub", "Detroit", "Fulfillment", 13000),
("Desert Operations Hub", "Phoenix", "Distribution", 12500),
("Capitol Hub", "Washington DC", "Sorting", 8000),
("Tech Valley Hub", "San Jose", "Fulfillment", 16000),
("Music City Hub", "Nashville", "Distribution", 10500),
("Midwest Sorting Center", "Kansas City", "Sorting", 9500),
("Gulf Coast Hub", "Houston", "Fulfillment", 17500),
("Tri-State Hub", "Philadelphia", "Distribution", 16500),
("New England Hub", "Boston", "Sorting", 8500),
("Valley Distribution Hub", "Fresno", "Distribution", 9000),
("Steel City Hub", "Pittsburgh", "Fulfillment", 12000),
("Riverfront Hub", "Cincinnati", "Sorting", 7800),
("Prairie Hub", "Omaha", "Distribution", 9500),
("Lone Star Hub", "Austin", "Fulfillment", 13200),
("Glacier Hub", "Minneapolis", "Sorting", 11800),
("Canyon Hub", "Salt Lake City", "Distribution", 14200),
("Harbor Hub", "Baltimore", "Fulfillment", 12500);


SELECT * FROM Hub;

-- Show every hub, including those that don’t currently have any packages. Sorting by size in ascending order.
SELECT
    h.name "Hub Name",
    h.location "Hub Location",
    h.type "Hub Type",
    h.size "Hub Size",
    p.status "Package Status",
    p.weight "Package Weight"
FROM Hub h
LEFT JOIN Package p 
    ON h.id = p.hub_id
ORDER BY h.size;


