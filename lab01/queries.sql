use csd220_lab1_deepshah;

-- 1.	List all the distinct different types of rooms that actually exist in your database data
SELECT DISTINCT room_type FROM room; 

-- 2.	A list of buildings that are open between midnight and 2:00am
SELECT * FROM building WHERE time_opened BETWEEN '00:00:00' AND '02:00:00';

-- 3.	A list of all offices with windows
select * from room where room_type='office' and room_has_window=true;

-- 4.	The number of labs bigger than 500 sq ft
select count(*) as 'Number of Labs' from room where square_footage_of_room>500;

-- 5.	Choose one of your buildings.  How many rooms does it have?
select sum(room_on_floor) as 'No. of rooms in SC' from room where code='SC';

-- 6.	A list of “full room codes”, meaning a single column that 
-- 		lists for each room both the building code and the room number separated by a hyphen.
select concat(code, '-', number_of_room) as 'full room codes' from room; 