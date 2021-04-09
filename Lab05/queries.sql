
drop schema if exists lab05_project;
create schema lab05_project character set utf8mb4;

use lab05_project;

drop table if exists superhero;
drop table if exists skills;
drop table if exists hero_power;

create table if not exists superhero (
    id int not null primary key,
    superhero_name varchar(50) not null unique,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) not null unique
);

create table if not exists skills (
    skill_id int not null primary key,
    skill_name varchar(50) not null unique,
    description varchar(100) not null
);

create table if not exists hero_power (
	superhero_id int not null,
    skill_id int not null,
    CONSTRAINT `fk_hero_power_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `lab05_project`.`skills` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_hero_power_superhero_id` FOREIGN KEY (`superhero_id`) REFERENCES `lab05_project`.`superhero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);                  

insert into superhero values
(1, 'Superman', 'Clark', 'Kent', 'superman@gmail.com'),
(2, 'Batman', 'Bruce', 'Wayne', 'batman@gmail.com'),
(3, 'Flash', 'Barry', 'Allen', 'superspeederflash@gmail.com'),
(4, 'Spiderman', 'Peter', 'Parker', 'peterparker@gmail.com'),
(5, 'Professor X', 'Charles', 'Xavier', 'abcdef4@gmail.com')
;

insert into skills values
(1, 'Flying', 'Superhero can fly by himself.'),
(2, 'Super Speed','Superhero can run a mile in seconds.'),
(3, 'Super Senses','Superhero can hear someone at the door before the dog does.'),
(4, 'Telepathy/ Mind Control', 'Superhero can respond to someone thinking out loud (literally).'),
(6, 'Wealth', 'Superhero is just a normal human but he is using his wealth to gain physical powers to be a SUPERHERO.')
;


insert into hero_powers values
(1, 1),
(1, 2),
(1, 3),
(2, 6),
(3, 2),
(4, 3),
(5, 4),
()
;
