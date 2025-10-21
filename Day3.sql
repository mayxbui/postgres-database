DROP TABLE IF EXISTS Product;

CREATE TABLE Product
(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name Varchar(100),
    description Varchar(255)
);

INSERT INTO Product (name, description) VALUES ('Blueberries', 'Fresh blueberries, 1 pint container');
INSERT INTO Product (name, description) VALUES ('Strawberries', 'Fresh strawberries, 1 quart container');
INSERT INTO Product (name, description) VALUES ('Bananas', 'Fresh bananas, sold by the pound');
INSERT INTO Product (name, description) VALUES ('Apples', 'Fresh apples, sold by the pound');
INSERT INTO Product (name, description) VALUES ('Oranges', 'Fresh oranges, sold by the pound');

SELECT * FROM Product;

SELECT name, description FROM Product;

DROP TABLE Product;
