USE csd220_tennis_club;

--	Question-2
INSERT INTO `recreational_member` SELECT player_number,first_name,last_name,sex,year_joined,phone,email  FROM `competitive_member`;

ALTER TABLE recreational_member RENAME TO `member`;

ALTER TABLE `competitive_member` ADD FOREIGN KEY (player_number) REFERENCES `member`(player_number);

ALTER TABLE competitive_member DROP COLUMN first_name, 
	DROP COLUMN last_name, 
    DROP COLUMN	sex, 
    DROP COLUMN phone, 
    DROP COLUMN email, 
    DROP COLUMN year_joined;

--	Question-3
ALTER TABLE `member` ADD active BIT;

--	Question-4
UPDATE `member` SET active = 0 WHERE year_joined < (YEAR(CURDATE())-4);
UPDATE `member` SET active = 1 WHERE year_joined > (YEAR(CURDATE())-5) ; 