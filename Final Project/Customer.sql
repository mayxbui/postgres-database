--CREATE SCHEMA PackageTracking;
--DROP TABLE IF EXISTS Customer;
SET search_path TO PackageTracking;

CREATE TABLE Customer(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(50),
    email_address VARCHAR(50),
    gender VARCHAR(10)
);

COPY Customer
FROM 'D:/.Fall25/CSC 480A/Final Project/Package Tracking/customer.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Customer
ORDER BY id;

-- DELETE FROM Customer;

-- Add first name and last name columns.
ALTER TABLE Customer
ADD COLUMN first_name VARCHAR(50),
ADD COLUMN last_name VARCHAR(50),

-- Drop full name column.
ALTER TABLE Customer
DROP COLUMN full_name;

-- Split full name into first name and last name.
UPDATE Customer
SET first_name = split_part(full_name, ' ', 1),
    last_name = split_part(full_name, ' ', array_length(string_to_array(full_name, ' '), 1));

-- Create a view with last name in ascending
CREATE OR REPLACE VIEW customer_view AS
SELECT
    first_name,
    last_name,
    email_address,
    gender
FROM Customer
ORDER BY last_name;

--DROP VIEW customer_view;

SELECT * FROM customer_view;

