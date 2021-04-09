select * from mysql.user

create user `lab6`@`localhost` identified by 'deep@12345';

create role 'superuser';

grant all on *.* to 'superuser';

grant 'superuser' to 'lab6'@'localhost';

create user 'lab6'@'%' identified by 'deep@12345';

grant select on *.* to 'lab6'@'%';

drop user 'lab6'@'%';
drop user 'lab6'@'localhost';
drop role 'superuser';
