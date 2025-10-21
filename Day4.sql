--Insert Data for Homework
DROP

CREATE TABLE NewStudents (
	ID SERIAL PRIMARY KEY,	
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL, 
	GradYear SMALLINT NOT NULL,
	MajorID SMALLINT 
);
--SELECT COUNT(*) FROM NewStudents 
--SELECT * FROM NewStudents 
--DELETE FROM NewStudents
--ALTER SEQUENCE newstudents_id_seq RESTART WITH 1


--chatGPT rows --had to click "continue generating" in the middle.  asked for 100, received 92 rows:
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('John', 'Smith', 2023, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Emma', 'Johnson', 2024, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Michael', 'Williams', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Sophia', 'Brown', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('James', 'Jones', 2022, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Olivia', 'Garcia', 2024, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('William', 'Martinez', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Isabella', 'Hernandez', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Liam', 'Lopez', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Charlotte', 'Gonzalez', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Amelia', 'Wilson', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Benjamin', 'Anderson', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Mia', 'Taylor', 2022, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Ethan', 'Thomas', 2024, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Harper', 'Harris', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Evelyn', 'Clark', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Mason', 'Lewis', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Abigail', 'Lee', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Alexander', 'Walker', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Ella', 'Hall', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Daniel', 'Young', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Scarlett', 'Allen', 2022, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Avery', 'Sanchez', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Sebastian', 'Wright', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Camila', 'King', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Matthew', 'Scott', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Sofia', 'Green', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Jackson', 'Baker', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Aria', 'Adams', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('David', 'Nelson', 2022, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Madison', 'Hill', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Joseph', 'Ramirez', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Luna', 'Campbell', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Asher', 'Mitchell', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Chloe', 'Roberts', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Mateo', 'Carter', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Zoe', 'Phillips', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Samuel', 'Evans', 2022, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Penelope', 'Russell', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Logan', 'Perez', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Aurora', 'Turner', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Gabriel', 'Edwards', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Hannah', 'Collins', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Wyatt', 'Stewart', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Aaliyah', 'Morris', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Luke', 'Nguyen', 2022, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Stella', 'Murphy', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Jack', 'Rivera', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Ellie', 'Cook', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Owen', 'Rogers', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Violet', 'Morgan', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Lincoln', 'Peterson', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Hazel', 'Cooper', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Carter', 'Reed', 2022, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Grace', 'Bailey', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Nathan', 'Bell', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Lily', 'Gutierrez', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Elijah', 'Foster', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Haley', 'Gomez', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Ryan', 'Howard', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Layla', 'Price', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Christopher', 'Bennett', 2022, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Aubrey', 'Simmons', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Christian', 'Sanders', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Riley', 'Hayes', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Levi', 'Bryant', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Nora', 'Diaz', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Aaron', 'Patterson', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Skylar', 'George', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Claire', 'Griffin', 2022, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Thomas', 'Wallace', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Eleanor', 'Hayden', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Charles', 'Palmer', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Adeline', 'Flores', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Mila', 'Washington', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Xavier', 'Long', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Maya', 'Butler', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Eli', 'Howard', 2022, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Gianna', 'Fisher', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Grayson', 'Perry', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Alyssa', 'Morales', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Nolan', 'Kim', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Ariana', 'Myers', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Connor', 'Sullivan', 2023, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Makayla', 'Cruz', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Josiah', 'Ramos', 2022, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Lucy', 'Ortiz', 2023, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Joshua', 'Coleman', 2022, NULL);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Julia', 'Ward', 2024, 1);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Dominic', 'Morgan', 2023, 2);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Vivian', 'Gardner', 2022, 3);
INSERT INTO NewStudents (FirstName, LastName, GradYear, MajorID) VALUES ('Gabriella', 'Fox', 2023, NULL);

--Q1. 2
SELECT COUNT(*) FROM NewStudents WHERE LastName LIKE 'Howard';

--Q2. 78
SELECT ID, LastName, GradYear FROM NewStudents WHERE LastName LIKE 'Howard' ORDER BY GradYear LIMIT 1;

--Q3. 1
SELECT COUNT(*) FROM NewStudents WHERE FirstName LIKE 'John';

--Q4. 8
SELECT COUNT(*) from NewStudents where lastname like 'M%';

--Q5. 58
SELECT COUNT(*) from newstudents where gradyear > 2022;

--Q6. 69
SELECT COUNT(*) from newstudents where gradyear <2024;

--Q7. 23
SELECT COUNT(*) FROM NEWSTUDENTS WHERE MAJORID IS NULL;

--Q8. 41
SELECT count(*) from newstudents where firstname like '%e%';

--Q9. 12
select count(*) from newstudents order by lastname,firstname,gradyear limit 3;

--Q10. 3
SELECT count(*) from newstudents where firstname like '___n';

--Q11. 18
SELECT count(*) FROM newstudents where firstname like '%n';