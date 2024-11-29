-- Syntax to drop database
-- DROP DataBaseName

--
-- Syntax to create a database
-- CREATE  DATABASE DataBaseName 


--Syntax to create table
CREATE TABLE IF NOT EXISTS classroom(
building varchar(15) not null,
room_number varchar(7) not null,
capacity numeric(4,0) not null,
-- THE (4,0) the 0 is zero decimal places but if it is 4, 1it ewil be something lie 776.4
primary key (building, room_number)
-- two buildings can have the same room number so it is a composite key ie to make our PK, we join the building and room number to make a new stuff which will be our pk
);

create table if not exists department(
dept_name varchar (20) not null,
building varchar (15) not null,
budget numeric (12,2) not null check (budget > 0),
-- check is a check constraint to check for something if false, it will reject the insertion of the data
primary key (dept_name)
);

create table if not exists instructor(
ID char(5) not null,
name varchar(20) not null,
dept_name varchar(20) not null,
salary numeric(8,2) not null,
primary key(ID),
foreign key (dept_name) references department
-- dept_name is refeerencing the primary key dept_name in department 
)

create table if not exists student(
ID varchar(5) not null,
name varchar(20) not null,
dept_name varchar(20) not null,
tot_cred numeric(3,0) not null check (tot_cred >= 0),
primary key (ID),
foreign key (dept_name) references department on delete set NULL)
-- on delete set null MEANS when you do a delete a department name from department table, set it as NULL
-- NULL is different from zero
	

create table if not exists course(
course_id varchar(7) not null,
title varchar(50) not null,
dept_name varchar(20) not null,
credits numeric(2,0) check (credits > 0),
primary key (course_id),
foreign key (dept_name) references department on delete set null
)

create table if not exists section(
course_id varchar(8) not null,
sec_id varchar(8) not null,
semester varchar(6) not null check (semester in ('Fall', 'Winter', 'Spring',
'Summer')),
year numeric(4,0) not null check (year > 1701 and year < 2100),
building varchar(15) not null,
room_number varchar(7) not null,
time_slot_id varchar(4) not null,
primary key (course_id, sec_id, semester, year),
foreign key (course_id) references course on delete cascade,
-- on delete cascade means 🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀🎀
foreign key (building, room_number) references classroom on delete set null
);


create table if not exists teaches(
ID varchar(5) not null,
course_id varchar(8) not null,
sec_id varchar(8) not null,
semester varchar(6) not null,
year numeric(4,0) not null,
primary key (ID, course_id, sec_id, semester, year),
foreign key (course_id, sec_id, semester, year) references section on delete
cascade,
foreign key (ID) references instructor on delete cascade
);



create table if not exists takes(
	ID varchar(5) not null,
	course_id varchar(8) not null,
	sec_id varchar(8) not null,
	semester varchar(6) not null,
	year numeric(4,0) not null,
	grade varchar(2) not null,
	primary key (ID, course_id, sec_id, semester, year),
	foreign key (course_id, sec_id, semester, year) references section on delete
	cascade,
	foreign key (ID) references student on delete cascade);





-- If you want to do it in PSQL
-- \i path_to_file
-- \i /Users/caleboneyemi/Downloads/605SQL CODES/605SQL2.pdf
-- instead of doing it that way change the / to \
-- \i \Users\caleboneyemi\Downloads\605SQL CODES\605SQL2.pdf
-- change it from pdf to sql




