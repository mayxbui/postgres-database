
DROP TABLE flight;
DROP TABLE pilot;
DROP TABLE airplane;

CREATE TABLE airplane (
	id 					INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,	
	make 				VARCHAR(50) NOT NULL,
	model 				VARCHAR(50) NOT NULL,
	passenger_capactiy	INT
);

--INSERT Data
INSERT INTO airplane (make, model, passenger_capactiy)
VALUES
	('Boeing', '747', 416),
	('Cessna', '310', 2),
	('Jetstream', '3101', 19),
	('Delta', 'MD-88', 149),
	('Boeing', '737', 215);

CREATE TABLE pilot (
	id 				INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,	
	first_name  	 VARCHAR(50) NOT NULL,
	last_name   	VARCHAR(50) NOT NULL, 
	call_sign		VARCHAR(50),
    license_no   	VARCHAR(50) NOT NULL
);
INSERT INTO pilot (first_name, last_name, call_sign, license_no)
VALUES
	('Pete', 'Mitchell', 'Maverick', '12-34567'),
	('Tom', 'Kazanski', 'Iceman', 'XX-77777'),
	('Nick', 'Bradshaw', 'Goose', '99-98765'),
	('Henry', 'Wolfe', 'Wolfman', '88-33333'),
	('Rick', 'Neven', 'Hollywood', '00-58412');

--create table with foreign key
CREATE TABLE flight (
	id 				INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,	
	airplane_id 	INT,
	pilot_id 		INT,
    CONSTRAINT fk_fight_pilot
        FOREIGN KEY (pilot_id)
            REFERENCES pilot(id)
        ON DELETE CASCADE
            -- NO ACTION: SQL can't perform delete
            -- CASCADE: delete row completely
            -- SET NULL: cell is changed to NULL instead of being delete

);

INSERT INTO flight (airplane_id, pilot_id)
VALUES
	(1,1),
	(2,1),
	(2,2),
	(3,5),
	(3,4);


SELECT * FROM pilot;
SELECT * FROM flight;
DELETE FROM pilot WHERE id = 1;
SELECT * FROM pilot;
SELECT * FROM flight;