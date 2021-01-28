-- Creation of 'csd220_lab1_deepshah' DB using specific characteristics
DROP DATABASE IF EXISTS csd220_lab1_deepshah;
CREATE DATABASE csd220_lab1_deepshah 
	CHARACTER SET utf8mb4 
	COLLATE utf8mb4_general_ci;

-- setting 'csd220_lab1_deepshah' DB as a default DB for following statements
use csd220_lab1_deepshah;

-- Creation of 'building' table using specific characteristics
CREATE TABLE building(
	name VARCHAR(45) NOT NULL,
	code CHAR(10) NOT NULL,	
	square_footage INTEGER UNSIGNED NOT NULL,
	number_of_floor TINYINT UNSIGNED NOT NULL,
	time_opened TIME DEFAULT '06:00:00',
	time_locked TIME DEFAULT '22:00:00',
	PRIMARY KEY (code),
	UNIQUE INDEX unique_index_of_name (name)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Creation of 'room' table using specific characteristics
CREATE TABLE room(
	code CHAR(10) NOT NULL,
	number_of_room SMALLINT UNSIGNED NOT NULL,
	room_on_floor SMALLINT UNSIGNED NOT NULL,
	room_type VARCHAR(20) NOT null,
	CONSTRAINT CHECK (room_type in ('classroom','lecture hall','lab','office','bathroom','utility')),
	square_footage_of_room INTEGER UNSIGNED NOT NULL,
	room_has_window BOOLEAN NOT NULL,
	PRIMARY KEY (code, number_of_room),
	FOREIGN KEY (code)
	    REFERENCES csd220_lab1_deepshah.building (code)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- Inserting data in 'building' table
INSERT INTO building (name, code, square_footage, number_of_floor, time_opened, time_locked) VALUES ('Sault College', 'SC',800,4,'07:00:00','23:00:00');
INSERT INTO building (name, code, square_footage, number_of_floor, time_opened) VALUES ('Deep Health Center', 'DHC',300,3,'00:00:00');
INSERT INTO building (name, code, square_footage, number_of_floor, time_opened) VALUES ('Group Health Center', 'GHC',200,2,'08:30:00');
INSERT INTO building (name, code, square_footage, number_of_floor, time_opened, time_locked) VALUES ('Algoma Public Health', 'AHC',100,1,'01:00:00','23:00:00');

-- Inserting data in 'room' table
INSERT INTO room (code, number_of_room, room_on_floor, room_type, square_footage_of_room, room_has_window) VALUES ('SC', 101, 1, 'classroom', 3000, 1);
INSERT INTO room  VALUES ('SC', 102, 1, 'bathroom', 100, 0);
INSERT INTO room  VALUES ('SC', 103, 3, 'office', 300, 1);
INSERT INTO room  VALUES ('SC', 201, 2, 'lecture hall', 500, 1);
INSERT INTO room  VALUES ('SC', 301, 3, 'utility', 50, 0);
INSERT INTO room  VALUES ('SC', 401, 4, 'bathroom', 100, 0);
INSERT INTO room  VALUES ('SC', 501, 5, 'lab', 600, 1);

INSERT INTO room  VALUES ('DHC', 111, 1, 'office', 300, 1);
INSERT INTO room  VALUES ('DHC', 222, 2, 'bathroom', 100, 1);
INSERT INTO room  VALUES ('DHC', 333, 3, 'lab', 300, 1);

INSERT INTO room  VALUES ('GHC', 01, 1, 'office', 200, 1);
INSERT INTO room  VALUES ('GHC', 02, 2, 'bathroom', 50, 0);

INSERT INTO room  VALUES ('AHC', 100, 1, 'office', 100, 0);
-- Deleteing a column from 'building' table to check if it works properly or not
DELETE FROM building WHERE code='GHC';

-- Here, Part-1 completed of Lab-1........ 