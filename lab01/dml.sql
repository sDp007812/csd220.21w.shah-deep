use csd220_lab1_deepshah;

-- 1.	Change all windowless offices to utility rooms
UPDATE room SET room_type = 'utility' WHERE room_type = 'office';
SELECT * FROM room;

-- 2.	Pick ONE of your buildings.  From ONLY this building, remove all bathrooms that have windows.
DELETE FROM room WHERE room_type = 'bathroom' and room_has_window=1;
SELECT * FROM room;

