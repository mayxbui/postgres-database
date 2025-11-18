--DROP TABLE IF EXISTS Tracking;
--DELETE FROM Tracking;
SET search_path TO PackageTracking;

CREATE TABLE Tracking(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    package_id INT,
    hub_id INT,
    location VARCHAR (50),
    status VARCHAR(50),
    active BOOLEAN,
    FOREIGN KEY (package_id) REFERENCES Package(id),
    FOREIGN KEY (hub_id) REFERENCES Hub(id)
);

INSERT INTO Tracking (package_id, hub_id, location, status, active) VALUES
(12, 4, 'Atlanta', 'In Transit', TRUE),
(3, 10, 'New York', 'Delivered', FALSE),
(45, 7, 'Los Angeles', 'In Transit', TRUE),
(67, 18, 'Dallas', 'Delayed', TRUE),
(1, 2, 'Chicago', 'Delivered', FALSE),
(38, 14, 'Miami', 'In Transit', TRUE),
(19, 25, 'Boston', 'In Transit', TRUE),
(22, 16, 'Phoenix', 'Delayed', TRUE),
(57, 1, 'Detroit', 'Delivered', FALSE),
(73, 20, 'Charlotte', 'In Transit', TRUE),
(9, 9, 'Washington DC', 'In Transit', TRUE),
(66, 6, 'San Jose', 'Delivered', FALSE),
(28, 8, 'Nashville', 'In Transit', TRUE),
(74, 12, 'Kansas City', 'In Transit', TRUE),
(25, 5, 'Houston', 'Delivered', FALSE),
(16, 15, 'Philadelphia', 'In Transit', TRUE),
(32, 3, 'Boston', 'Delayed', TRUE),
(51, 21, 'Fresno', 'Delivered', FALSE),
(10, 11, 'Pittsburgh', 'In Transit', TRUE),
(79, 13, 'Cincinnati', 'In Transit', TRUE),
(23, 22, 'Omaha', 'Delivered', FALSE),
(8, 17, 'Austin', 'In Transit', TRUE),
(44, 19, 'Minneapolis', 'Delayed', TRUE),
(59, 24, 'Salt Lake City', 'Delivered', FALSE),
(37, 23, 'Baltimore', 'In Transit', TRUE);

SELECT * FROM Tracking;

--DROP FUNCTION count_by_status()

-- Create a function to count the total number of packages based on status: 'In Transit', 'Delivered', 'Delayed'.
CREATE OR REPLACE FUNCTION count_by_status()
RETURNS TABLE (
    status VARCHAR(50),
    total BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        t.status,
        COUNT(*) total
    FROM Tracking t
    GROUP BY t.status
    ORDER BY total DESC;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM count_by_status();