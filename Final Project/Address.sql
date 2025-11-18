--DROP TABLE IF EXISTS address;
SET search_path TO PackageTracking;

CREATE TABLE Address (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    street VARCHAR (100),
    city VARCHAR (100),
    state VARCHAR (100),
    country VARCHAR (50),
    zip_code INT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

INSERT INTO Address (street, city, state, country, zip_code, customer_id) VALUES
('123 Maple Ave', 'Atlanta', 'GA', 'USA', 30301, 1),
('450 Oak Street', 'Dallas', 'TX', 'USA', 75201, 2),
('78 Pine Road', 'Miami', 'FL', 'USA', 33101, 3),
('910 Cedar Lane', 'Chicago', 'IL', 'USA', 60601, 4),
('22 Elm Drive', 'Denver', 'CO', 'USA', 80201, 5),
('67 Birch Blvd', 'Seattle', 'WA', 'USA', 98101, 6),
('300 Willow Court', 'Boston', 'MA', 'USA', 02101, 7),
('95 Aspen Way', 'Phoenix', 'AZ', 'USA', 85001, 8),
('140 Redwood St', 'San Diego', 'CA', 'USA', 92101, 9),
('255 Cypress Ave', 'Charlotte', 'NC', 'USA', 28201, 10),
('789 Spruce Street', 'Detroit', 'MI', 'USA', 48201, 11),
('33 Magnolia Blvd', 'Orlando', 'FL', 'USA', 32801, 12),
('501 Palm Avenue', 'Houston', 'TX', 'USA', 77001, 13),
('612 Poplar Road', 'New York', 'NY', 'USA', 10001, 14),
('88 Chestnut Way', 'San Jose', 'CA', 'USA', 95101, 15),
('144 Dogwood Lane', 'Nashville', 'TN', 'USA', 37201, 16),
('209 Hickory Drive', 'Cleveland', 'OH', 'USA', 44101, 17),
('56 Sycamore Street', 'Portland', 'OR', 'USA', 97201, 18),
('900 Walnut Blvd', 'Philadelphia', 'PA', 'USA', 19101, 19),
('71 Fir Road', 'Kansas City', 'MO', 'USA', 64101, 20),
('185 Linden Street', 'Tampa', 'FL', 'USA', 33601, 21),
('432 Juniper Lane', 'Las Vegas', 'NV', 'USA', 89101, 22),
('520 Alder Ave', 'Indianapolis', 'IN', 'USA', 46201, 23),
('690 Beech Blvd', 'Baltimore', 'MD', 'USA', 21201, 24),
('811 Maplewood Court', 'Minneapolis', 'MN', 'USA', 55401, 25);


SELECT * FROM Address;