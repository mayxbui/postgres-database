--Create Dataset for INNER JOIN
--Scenario Supplier to restaurants

DROP TABLE if exists PizzaRestaurant;

CREATE TABLE PizzaRestaurant(
	ID SERIAL PRIMARY KEY,
	CompanyName VARCHAR(50) NOT NULL,
  	CompanyCity VARCHAR(30) 
);

--class: what schema did this go into? public bc I didn't specify schema connection to 
INSERT INTO PizzaRestaurant(companyname, companycity) Values ('Papa Johns', 'Greencastle');
INSERT INTO PizzaRestaurant(companyname, companycity) Values ('Donatos', 'Indianapolis');
INSERT INTO PizzaRestaurant(companyname, companycity) Values ('Pizza Hut','San Franciso');
INSERT INTO PizzaRestaurant(companyname, companycity) Values ('Marco''s', 'Boston');		--escape the quotation mark with a 2nd quote
INSERT INTO PizzaRestaurant(companyname, companycity) Values ('Hot Box', 'Chicago');
INSERT INTO PizzaRestaurant(companyname, companycity) Values ('Pizza King', 'San Diego');
INSERT INTO PizzaRestaurant(companyname, companycity) Values ('Noble Romans', 'Baltimore');
-- --DROP TABLE PizzaRestaurant
--SELECT * FROM PizzaRestaurant

CREATE TABLE Foods(
	ID SERIAL PRIMARY KEY,
	ItemName 	VARCHAR(50) NOT NULL,
	UnitsSold	SMALLINT,
	PizzaRestaurantID	INT
);


INSERT INTO Foods(ItemName, UnitsSold, PizzaRestaurantID) 
Values 
	('Large Pizza', 22, 1),
	('Breadsticks', 84, 1),
	('Medium Pizza', 15, 1),
	('Small Pizza', 33, 1),
	('Side Salad', 8, 1),
	('Garlic Knots', 41, 2),
	('Large Pizza', 27, 2),
	('Large Pizza', 104, 3),
	('Large Pizza', 234, 4),
	('Large Pizza', 55, 5),
	('Large Pizza', 123, 6),
	('Large Pizza', 75, 5),
	('Achovy Pizza', 1, 8);
--UPDATE Foods SET PizzaRestaurantID = 8, UnitsSold = 1 WHERE ID = 13
--	('Achovy Pizza', NULL, 13);
--SELECT * FROM Foods;

--Join Table
SELECT companyname, companycity, itemname, unitssold FROM PizzaRestaurant INNER JOIN Foods f ON PizzaRestaurant.id = f.PizzaRestaurantID;




