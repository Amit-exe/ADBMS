create table if not exists demo(
id int,
name varchar(30));

insert into demo values(1,"amit");
insert into demo values(2,"apeksha");

select * from demo;

create table Employee(
EMPID int primary key not null,
name varchar(20) not null,
address varchar(20) not null,
designation varchar(20) not null,
salary int not null);

create database sies2;
use sies2;
create table Officer(
EMPID int primary key not null,
name varchar(20) not null,
address varchar(20) not null,
designation varchar(20) not null,
salary int not null);

use sies;

DELIMITER $$
CREATE TRIGGER HF 
AFTER INSERT
ON Employee FOR EACH ROW
BEGIN 
	IF NEW.salary <= 10000 THEN
		insert INTO Worker 
		valueS (NEW.EMPID,NEW.NAME,NEW.ADDRESS, NEW.DESIGNATION,NEW.SALARY);
	else
		insert INTO SIES2.OFFICER 
		valueS (NEW.EMPID,NEW.NAME,NEW.ADDRESS, NEW.DESIGNATION,NEW.SALARY);
	END IF;
    
END $$
DELIMITER ;

insert INTO EMPLOYEE VALUES (1,"AMIT","CHEMBUR","sde",50000);

insert INTO EMPLOYEE VALUES (2,"RAJU","CHEMBUR","sde",5000);

select * FROM WORKER;
SELECT * FROM SIES2.OFFICER;

SELECT * fROM EMPLOYEE;
