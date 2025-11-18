--DROP TABLE IF EXISTS Customer_Package;

SET search_path TO PackageTracking;

CREATE TABLE Customer_Package(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT,
    package_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (package_id) REFERENCES Package(id)
);

INSERT INTO Customer_Package (customer_id, package_id) VALUES
(1, 5), (1, 14), (1, 60), (1, 78),
(2, 2), (2, 9), (2, 42),
(3, 4), (3, 13), (3, 56), (3, 74),
(4, 7), (4, 16), (4, 63),
(5, 1), (5, 28), (5, 38),
(6, 3), (6, 19), (6, 46),
(7, 6), (7, 12), (7, 30), (7, 68),
(8, 8), (8, 20), (8, 37),
(9, 10), (9, 23), (9, 53),
(10, 11), (10, 22), (10, 64),
(11, 15), (11, 31), (11, 41),
(12, 17), (12, 24), (12, 35), (12, 59),
(13, 18), (13, 39),
(14, 21), (14, 27), (14, 47),
(15, 25), (15, 26), (15, 44), (15, 67),
(16, 29), (16, 33), (16, 70),
(17, 32), (17, 40),
(18, 34), (18, 45), (18, 51),
(19, 36), (19, 43), (19, 50), (19, 72),
(20, 48), (20, 52),
(21, 49), (21, 54), (21, 61),
(22, 55), (22, 57), (22, 62),
(23, 58), (23, 65), (23, 73),
(24, 66), (24, 69), (24, 76),
(25, 71), (25, 75), (25, 77), (25, 79), (25, 80);


-- Join Customer Table and Package Table based on Last Name and Package Created Time in ascending order.
SELECT 
    c.last_name,
    c.first_name,
    c.email_address,
    p.id AS package_id,
    p.status,
    p.weight,
    p.created_time
FROM Customer c
    JOIN Customer_Package cp ON c.id = cp.customer_id
    JOIN Package p ON cp.package_id = p.id
ORDER BY c.last_name, p.created_time;


--SELECT * FROM Customer_Package;