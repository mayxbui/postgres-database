DROP SCHEMA IF EXISTS business;
CREATE SCHEMA business;

CREATE TABLE IF NOT EXISTS business.department (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    region VARCHAR(50),
    number_of_employees INT,
    budget NUMERIC(12, 2)
);

INSERT INTO business.department (name, location, region, number_of_employees, budget)
VALUES
    ('Finance', 'New York Office', 'Northeast', 18, 850000.00),
    ('Human Resources', 'Chicago Office', 'Midwest', 12, 420000.00),
    ('Engineering', 'San Francisco Office', 'West Coast', 45, 2200000.00),
    ('Marketing', 'Los Angeles Office', NULL, 25, 950000.00),
    ('Sales', 'Dallas Office', 'South', NULL, 1200000.00),
    ('Customer Support', 'Phoenix Office', 'Southwest', 22, NULL),
    ('Legal', 'New York Office', 'Northeast', NULL, 770000.00),
    ('Research & Development', 'Seattle Office', 'Northwest', 28, 1800000.00),
    ('Information Technology', 'Austin Office', NULL, 35, 1550000.00),
    ('Operations', 'Atlanta Office', 'Southeast', 27, NULL),
    ('Public Relations', 'Boston Office', 'Northeast', 14, 540000.00),
    ('Procurement', 'Houston Office', 'South', 16, NULL),
    ('Facilities Management', 'Denver Office', NULL, 20, 500000.00),
    ('Training & Development', 'Indianapolis Office', 'Midwest', NULL, 360000.00),
    ('Corporate Strategy', 'Washington DC Office', 'East Coast', 9, 1250000.00);


CREATE TABLE IF NOT EXISTS business.employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    job_title VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES business.department(department_id),
    salary NUMERIC(10, 2) NOT NULL,
    bonus NUMERIC(10, 2)
);

INSERT INTO business.employee 
(first_name, last_name, email, phone_number, job_title, department_id, salary, bonus)
VALUES
    ('Emma', 'Johnson', 'emma.johnson@business.com', '+1-212-555-0112', 'Marketing Manager', 4, 72000.00, 5000.00),
    ('Liam', 'Brown', 'liam.brown@business.com', NULL, 'Software Engineer', 3, 88000.00, NULL),
    ('Olivia', 'Davis', 'olivia.davis@business.com', '+1-312-555-0147', 'HR Specialist', 2, 61000.00, 2500.00),
    ('Noah', 'Miller', 'noah.miller@business.com', '+1-646-555-0185', 'Financial Analyst', 1, 69000.00, NULL),
    ('Ava', 'Wilson', 'ava.wilson@business.com', NULL, 'Sales Representative', 5, 55000.00, 1200.00),
    ('Ethan', 'Moore', 'ethan.moore@business.com', '+1-404-555-0133', 'Operations Coordinator', 10, 64000.00, NULL),
    ('Sophia', 'Taylor', 'sophia.taylor@business.com', '+1-650-555-0172', 'Data Analyst', 3, 73000.00, 1800.00),
    ('Mason', 'Anderson', 'mason.anderson@business.com', '+1-408-555-0108', 'UX Designer', 3, 78000.00, 3200.00),
    ('Isabella', 'Thomas', 'isabella.thomas@business.com', NULL, 'Project Manager', 4, 85000.00, NULL),
    ('Logan', 'Jackson', 'logan.jackson@business.com', '+1-650-555-0136', 'QA Engineer', 3, 69000.00, 900.00),
    ('Mia', 'White', 'mia.white@business.com', '+1-602-555-0198', 'Customer Support Lead', 6, 57000.00, NULL),
    ('Lucas', 'Harris', 'lucas.harris@business.com', '+1-737-555-0124', 'DevOps Engineer', 9, 91000.00, 4000.00),
    ('Amelia', 'Martin', 'amelia.martin@business.com', NULL, 'Business Analyst', 1, 74000.00, NULL),
    ('Elijah', 'Thompson', 'elijah.thompson@business.com', '+1-737-555-0140', 'Systems Administrator', 9, 82000.00, 3500.00),
    ('Harper', 'Garcia', 'harper.garcia@business.com', '+1-213-555-0177', 'Graphic Designer', 4, 62000.00, NULL),
    ('James', 'Martinez', 'james.martinez@business.com', '+1-617-555-0110', 'Content Strategist', 11, 68000.00, 1200.00),
    ('Charlotte', 'Robinson', 'charlotte.robinson@business.com', NULL, 'PR Specialist', 11, 64000.00, 1500.00),
    ('Benjamin', 'Clark', 'benjamin.clark@business.com', '+1-212-555-0191', 'Accountant', 1, 71000.00, NULL),
    ('Evelyn', 'Rodriguez', 'evelyn.rodriguez@business.com', '+1-773-555-0105', 'Administrative Assistant', 2, 52000.00, 800.00),
    ('Henry', 'Lewis', 'henry.lewis@business.com', NULL, 'IT Support Technician', 9, 58000.00, NULL),
    ('Scarlett', 'Lee', 'scarlett.lee@business.com', '+1-213-555-0164', 'Social Media Manager', 4, 66000.00, 1000.00),
    ('Alexander', 'Walker', 'alexander.walker@business.com', '+1-425-555-0102', 'Product Manager', 8, 94000.00, 5500.00),
    ('Grace', 'Hall', 'grace.hall@business.com', NULL, 'Recruiter', 2, 63000.00, NULL),
    ('Daniel', 'Allen', 'daniel.allen@business.com', '+1-212-555-0130', 'Legal Counsel', 7, 102000.00, 6000.00),
    ('Ella', 'Young', 'ella.young@business.com', NULL, 'Executive Assistant', NULL, 59000.00, NULL);


SELECT
    e.employee_id ID,
    e.first_name || ' ' || e.last_name "Full Name",
    e.job_title,
    e.salary,
    d.name Departmet,
    d.location "Office Location"
FROM 
    business.employee e
    JOIN business.department d ON e.department_id = d.department_id;


SELECT 
    d.name Department,
    COUNT(e.employee_id) "Total Employees"
FROM 
    business.employee e
    LEFT JOIN business.department d ON e.department_id = d.department_id
GROUP BY
    d.name
ORDER BY
    "Total Employees" ASC;
