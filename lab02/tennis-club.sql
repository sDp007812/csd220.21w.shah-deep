
drop schema if exists lab05_project;
create schema lab05_project character set utf8mb4;

use lab05_project;

drop table if exists superhero;
drop table if exists skills;
drop table if exists hero_power;
-- drop table if exists ;
-- drop table if exists ;
-- drop table if exists ;
-- drop table if exists ;

create table if not exists superhero (
    id int not null primary key,
    superhero_name varchar(50) not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100)
);

create table if not exists skills (
    id int not null primary key,
    description varchar(100) not null
);

create table if not exists hero_power (
    constraint fk_superhero_id foreign key (superhero_id) references superhero(id),
    constraint fk_skill_id foreign key (skill_id) references skills(id)
);                  

insert into superhero (superhero_name, first_name, last_name, email) values
('Superman', 'Abc', 'Xyz', 'abcdef@gmail.com'),
('Batman', 'Abc', 'Xyz', 'abcdef@gmail.com'),
('Wonderwoman', 'Abc', 'Xyz', 'abcdef@gmail.com'),
('Shaktiman', 'Abc', 'Xyz', 'abcdef@gmail.com'),
('Hanuman dada', 'Abc', 'Xyz', 'abcdef@gmail.com'),
('Ganapati data', 'Abc', 'Xyz', 'abcdef@gmail.com'),
('Arjuna', 'Abc', 'Xyz', 'abcdef@gmail.com'),
('Rama', 'Abc', 'Xyz', 'abcdef@gmail.com')
;

insert into competitive_member values
(102, 'Sandy', 'Beach', 'F', '2014', '705-254-6060', 'sb@heehaw.ca', 'PF'),
(103, 'Sam', 'Mannella', 'M', '2013', '705-254-6161', 'sm@heehaw.ca', 'PM'),
(104, 'Douglas', 'Fir', 'M', '2014', '705-254-6262', 'df@heehaw.ca', 'SM'),
(105, 'Helen', 'Earth', 'F', '2014', '705-254-6363', 'hw@heehaw.ca', 'SF'),
(107, 'Betty', 'Misses', 'F', '2014', '705-254-6565', 'bm@heehaw.ca', 'AF'),
(108, 'Phil', 'Itin', 'M', '2014', '705-254-6666', 'pi@heehaw.ca', 'AM'),
(109, 'Frank', 'Furter', 'M', '2015', '705-254-6868', 'ff@heehaw.ca', 'PM'),
(110, 'Stan', 'D\'Overheer', 'M', '2017', '705-254-7777', 'sd@heehaw.ca', 'SM'),
(112, 'Ellie', 'Phant', 'F', '2016', '705-254-7373', 'ep@heehaw.ca', 'PF'),
(113, 'Patty', 'Cake', 'F', '2015', '705-254-8595', 'pc@heehaw.ca', 'SF'),
(114, 'Will', 'Itmatter', 'M', '2013', '705-254-8765', 'wi@heehaw.ca',  'AM'),
(115, 'Scott', 'Ish', 'M', '2015', '705-254-8222', 'st@heehaw.ca', 'PM'),
(116, 'Nick', 'Oftime', 'M', '2015', '705-254-7788', 'no@heehaw.ca', 'PM'),
(117, 'Vic', 'Tory', 'M', '2017', '705-254-7522', 'vt@heehaw.ca', 'PM'),
(118, 'Bonnie', 'Anclyde', 'F', '2016', '705-254-7399', 'ba@heehaw.ca', 'PF'),
(119, 'Brad', 'Enbutter', 'M', '2015', '705-254-8533', 'bn@heehaw.ca', 'SM'),
(120, 'Justin', 'Case', 'M', '2015',  '705-254-8711', 'jc@heehaw.ca', 'AM'),
(121, 'Pete', 'Moss', 'M', '2015', '705-254-8299', 'pm@heehaw.ca', 'PM'),
(125, 'Max', 'Imam', 'M', '2017', '705-254-1513', 'mi@heehaw.ca', 'YM'),
(126, 'Rob', 'Urrey', 'M', '2017', '705-254-8222', 'ru@heehaw.ca', 'YM'),
(127, 'Charlie', 'Horse', 'F', '2018', '705-254-2345', 'ch@heehaw.ca', 'YF'),
(128, 'Tally', 'Ho', 'F', '2018', '705-254-4532', 'th@heehaw.ca', 'YF')
;

insert into recreational_member values
(100, 'Dwayne', 'Pipe', 'M', '2014', '705-254-6334', 'dp@heehaw.ca'),
(101, 'Bob', 'Cat', 'M', '2017', '705-254-6464', 'bc@heehaw.ca'),
(106, 'Sunny', 'Days', 'F', '2013', '705-254-6767', 'sd@heehaw.ca'),
(111, 'Jim', 'Bag', 'M', '2015', '705-254-7575', 'jb@heehaw.ca'),
(122, 'Gerry', 'Mander', 'M', '2015', '705-254-2561', 'gm@heehaw.ca'),
(123, 'Joan', 'Zin', 'F', '2016', '705-254-2561', 'jz@heehaw.ca'),
(124, 'Anne', 'Onimus', 'F', '2016', '705-254-2211', 'ao@heehaw.ca')
;

insert into `match` 
    (`date`, player1_number, player2_number, winner_player_number, winner_sets_won, division_code)
values
('2019-02-02', 127, 128, 128, 3, 'YF'),
('2019-02-03', 125, 126, 125, 2, 'YM'),
('2019-02-02', 102, 112, 102, 2, 'PF'),
('2019-02-03', 103, 109, 109, 2, 'PM'),
('2019-02-03', 104, 110, 110, 3, 'SM'),
('2019-02-10', 105, 113, 105, 2, 'SF'),
('2019-03-01', 113, 105, 113, 3, 'SF'),
('2019-03-01', 120, 108, 120, 2, 'AM'),
('2019-03-07', 118, 112, 112, 3, 'PF'),
('2019-03-08', 119, 110, 110, 2, 'SM'),
('2019-03-08', 118, 102, 118, 2, 'PF'),
('2019-03-09', 113, 105, 105, 3, 'SF'),
#scheduled matches with no players assigned
('2019-03-15', null, null, null, null, 'PM'),
('2019-03-15', null, null, null, null, 'SF'),
('2019-03-16', null, null, null, null, 'PF'),   
('2019-03-16', null, null, null, null, 'SF'),
('2019-03-16', null, null, null, null, 'AF'),   
('2019-03-16', null, null, null, null, 'YF'),
('2019-03-17', null, null, null, null, 'YF'),
('2019-03-17', null, null, null, null, 'YM'),
('2019-03-17', null, null, null, null, 'AF'),
('2019-03-17', null, null, null, null, 'AM'),
('2019-03-17', null, null, null, null, 'PF'),
('2019-03-17', null, null, null, null, 'PM'),
('2019-03-17', null, null, null, null, 'SF'),
('2019-03-17', null, null, null, null, 'SM')
;

insert into coach_assignment (coach_player_number, coachee_player_number) values
(102,107),
(102,105),
(103,104),
(109,104),
(112,113),
(115,119),
(121,119)
;

             