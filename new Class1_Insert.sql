insert into classroom (building, room_number, capacity) values ('Packard', '101', 500);
insert into classroom (building, room_number, capacity) values ('Painter', '514', 10);
insert into classroom (building, room_number, capacity) values ('Taylor', '3128', 70);
insert into classroom (building, room_number, capacity) values ('Watson', '100', 30);
insert into classroom (building, room_number, capacity) values ('Watson', '120', 50);

insert into department(dept_name, building, budget) values ('Biology', 'Watson', 90000);
insert into department(dept_name, building, budget) values ('Comp. Sci.', 'Taylor', 100000);
insert into department(dept_name, building, budget) values ('Elec. Eng.', 'Taylor', 85000);
insert into department(dept_name, building, budget) values ('Finance', 'Painter', 120000);
insert into department(dept_name, building, budget) values ('History', 'Painter', 50000);
insert into department(dept_name, building, budget) values ('Music', 'Packard', 80000);
insert into department(dept_name, building, budget) values ('Physics', 'Watson', 70000);

insert into instructor(id, name, dept_name, salary) values ('10101', 'Srinivasan', 'Comp. Sci.', 65000);
insert into instructor(id, name, dept_name, salary) values ('12121', 'Wu', 'Finance', 90000);
insert into instructor(id, name, dept_name, salary) values ('15151', 'Mozart', 'Music', 40000);
insert into instructor(id, name, dept_name, salary) values ('22222', 'Einstein', 'Physics', 95000);
insert into instructor(id, name, dept_name, salary) values ('32343', 'El Said', 'History', 60000);
insert into instructor(id, name, dept_name, salary) values ('33456', 'Gold', 'Physics', 87000);
insert into instructor(id, name, dept_name, salary) values ('45565', 'Katz', 'Comp. Sci.', 75000);
insert into instructor(id, name, dept_name, salary) values ('58583', 'Califieri', 'History', 62000);
insert into instructor(id, name, dept_name, salary) values ('76543', 'Singh', 'Finance', 80000);
insert into instructor(id, name, dept_name, salary) values ('76766', 'Crick', 'Biology', 72000);
insert into instructor(id, name, dept_name, salary) values ('83821', 'Brandt', 'Comp. Sci.', 92000);
insert into instructor(id, name, dept_name, salary) values ('98345', 'Kim', 'Elec. Eng.', 80000);

insert into student(id, name, dept_name, tot_cred) values ('00128', 'Zhang', 'Comp. Sci.', 102);
insert into student(id, name, dept_name, tot_cred) values ('12345', 'Shankar', 'Comp. Sci.', 32);
insert into student(id, name, dept_name, tot_cred) values ('19991', 'Brandt', 'History', 80);
insert into student(id, name, dept_name, tot_cred) values ('23121', 'Chavez', 'Finance', 110);
insert into student(id, name, dept_name, tot_cred) values ('44553', 'Peltier', 'Physics', 56);
insert into student(id, name, dept_name, tot_cred) values ('45678', 'Levy', 'Physics', 46);
insert into student(id, name, dept_name, tot_cred) values ('54321', 'Williams', 'Comp. Sci.', 54);
insert into student(id, name, dept_name, tot_cred) values ('55739', 'Sanchez', 'Music', 38);
insert into student(id, name, dept_name, tot_cred) values ('70557', 'Snow', 'Physics', 0);
insert into student(id, name, dept_name, tot_cred) values ('76543', 'Brown', 'Comp. Sci.', 58);
insert into student(id, name, dept_name, tot_cred) values ('76653', 'Aoi', 'Elec. Eng.', 60);
insert into student(id, name, dept_name, tot_cred) values ('98765', 'Bourikas', 'Elec. Eng.', 98);
insert into student(id, name, dept_name, tot_cred) values ('98988', 'Tanaka', 'Biology', 120);

insert into course(course_id, title, dept_name, credits) values ('BIO-101', 'Intro. to Biology', 'Biology', 4);
insert into course(course_id, title, dept_name, credits) values ('BIO-301', 'Genetics', 'Biology', 4);
insert into course(course_id, title, dept_name, credits) values ('BIO-399', 'Computational Biology', 'Biology', 3);
insert into course(course_id, title, dept_name, credits) values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4);
insert into course(course_id, title, dept_name, credits) values ('CS-190', 'Game Design', 'Comp. Sci.', 4);
insert into course(course_id, title, dept_name, credits) values ('CS-315', 'Robotics', 'Comp. Sci.', 3);
insert into course(course_id, title, dept_name, credits) values ('CS-319', 'Image Processing', 'Comp. Sci.', 3);
insert into course(course_id, title, dept_name, credits) values ('CS-347', 'Database Concepts', 'Comp. Sci.', 3);
insert into course(course_id, title, dept_name, credits) values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3);
insert into course(course_id, title, dept_name, credits) values ('FIN-201', 'Investment Banking', 'Finance', 3);
insert into course(course_id, title, dept_name, credits) values ('HIS-351', 'World History', 'History', 3);
insert into course(course_id, title, dept_name, credits) values ('MU-199', 'Music Video Production', 'Music', 3);
insert into course(course_id, title, dept_name, credits) values ('PHY-101', 'Physical Principles', 'Physics', 4);

insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('BIO-101', '1', 'Summer', 2017, 'Painter', '514', 'B');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('BIO-301', '1', 'Summer', 2018, 'Painter', '514', 'A');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('CS-101', '1', 'Fall', 2017, 'Packard', '101', 'H');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('CS-101', '1', 'Spring', 2018, 'Packard', '101', 'F');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('CS-190', '1', 'Spring', 2017, 'Taylor', '3128', 'E');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('CS-190', '2', 'Spring', 2017, 'Taylor', '3128', 'A');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('CS-315', '1', 'Spring', 2018, 'Watson', '120', 'D');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('CS-319', '1', 'Spring', 2018, 'Watson', '100', 'B');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('CS-319', '2', 'Spring', 2018, 'Taylor', '3128', 'C');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('CS-347', '1', 'Fall', 2017, 'Taylor', '3128', 'A');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('EE-181', '1', 'Spring', 2017, 'Taylor', '3128', 'C');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('FIN-201', '1', 'Spring', 2018, 'Packard', '101', 'B');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('HIS-351', '1', 'Spring', 2018, 'Painter', '514', 'C');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('MU-199', '1', 'Spring', 2018, 'Packard', '101', 'D');
insert into section(course_id, sec_id, semester, year, building, room_number, time_slot_id) values ('PHY-101', '1', 'Fall', 2017, 'Watson', '100', 'A');

insert into teaches(id, course_id, sec_id, semester, year) values ('10101', 'CS-101', '1', 'Fall', 2017);
insert into teaches(id, course_id, sec_id, semester, year) values ('10101', 'CS-315', '1', 'Spring', 2018);
insert into teaches(id, course_id, sec_id, semester, year) values ('10101', 'CS-347', '1', 'Fall', 2017);
insert into teaches(id, course_id, sec_id, semester, year) values ('12121', 'FIN-201', '1', 'Spring', 2018);
insert into teaches(id, course_id, sec_id, semester, year) values ('15151', 'MU-199', '1', 'Spring', 2018);
insert into teaches(id, course_id, sec_id, semester, year) values ('22222', 'PHY-101', '1', 'Fall', 2017);
insert into teaches(id, course_id, sec_id, semester, year) values ('32343', 'HIS-351', '1', 'Spring', 2018);
insert into teaches(id, course_id, sec_id, semester, year) values ('45565', 'CS-101', '1', 'Spring', 2018);
insert into teaches(id, course_id, sec_id, semester, year) values ('45565', 'CS-319', '1', 'Spring', 2018);
insert into teaches(id, course_id, sec_id, semester, year) values ('76766', 'BIO-101', '1', 'Summer', 2017);
insert into teaches(id, course_id, sec_id, semester, year) values ('76766', 'BIO-301', '1', 'Summer', 2018);
insert into teaches(id, course_id, sec_id, semester, year) values ('83821', 'CS-190', '1', 'Spring', 2017);
insert into teaches(id, course_id, sec_id, semester, year) values ('83821', 'CS-190', '2', 'Spring', 2017);
insert into teaches(id, course_id, sec_id, semester, year) values ('83821', 'CS-319', '2', 'Spring', 2018);
insert into teaches(id, course_id, sec_id, semester, year) values ('98345', 'EE-181', '1', 'Spring', 2017);

insert into takes(id, course_id, sec_id, semester, year, grade) values ('00128', 'CS-101', '1', 'Fall', 2017, 'A');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('00128', 'CS-347', '1', 'Fall', 2017, 'A-');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('12345', 'CS-101', '1', 'Fall', 2017, 'C');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('12345', 'CS-190', '2', 'Spring', 2017, 'A');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('12345', 'CS-315', '1', 'Spring', 2018, 'A');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('12345', 'CS-347', '1', 'Fall', 2017, 'A');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('19991', 'HIS-351', '1', 'Spring', 2018, 'B');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('23121', 'FIN-201', '1', 'Spring', 2018, 'C+');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('44553', 'PHY-101', '1', 'Fall', 2017, 'B-');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('45678', 'CS-101', '1', 'Fall', 2017, 'F');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('45678', 'CS-101', '1', 'Spring', 2018, 'B+');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('45678', 'CS-319', '1', 'Spring', 2018, 'B');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('54321', 'CS-101', '1', 'Fall', 2017, 'A');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('54321', 'CS-190', '2', 'Spring', 2017, 'B+');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('55739', 'MU-199', '1', 'Spring', 2018, 'A-');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('76543', 'CS-101', '1', 'Fall', 2017, 'A');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('76543', 'CS-319', '2', 'Spring', 2018, 'A');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('76653', 'EE-181', '1', 'Spring', 2017, 'C');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('98765', 'CS-101', '1', 'Fall', 2017, 'C-');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('98765', 'CS-315', '1', 'Spring', 2018, 'B');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('98988', 'BIO-101', '1', 'Summer', 2017, 'A');
insert into takes(id, course_id, sec_id, semester, year, grade) values ('98988', 'BIO-301', '1', 'Summer', 2018, null);



-- The last line above insert into takes(id, course_id, sec_id, semester, year, grade) values ('98988', 'BIO-301', '1', 'Summer', 2018, null);
--It gave the below error
--ERROR:  Failing row contains (98988, BIO-301, 1, Summer, 2018, null).null value in column "grade" of relation "takes" violates not-null constraint 
--ERROR:  null value in column "grade" of relation "takes" violates not-null constraint
--SQL state: 23502
--Detail: Failing row contains (98988, BIO-301, 1, Summer, 2018, null).

-- so we allow grade to take Not Null by running below code then goijg back to run that insert part
alter table takes alter column grade drop not null

-- Now the query has been run successfully

SELECT * FROM classroom

SELECT * FROM takes


SELECT * FROM course

SELECT * FROM course 
WHERE dept_name = 'Biology'
--WHERE dept_name = "Biology"
-- Double quotes is wrong



-- HOMEWORK
-- DOWNLOAD THE SLIDES and solve the exercises there




SELECT * FROM course
SELECT dept_name FROM course


SELECT DISTINCT dept_name FROM course


SELECT * FROM instructor

--Say the salary is annualy and we want to get the monthly input

SELECT id, name, dept_name, salary/12 AS Monthly_Salary FROM instructor
--The above for the salary part, it won't round the figure to round the figure after the regular we do , decimal places

SELECT id, name, dept_name, round(salary/12, 2) AS Rounded_monthly_salary FROM instructor


-- To find all instructors in Comp. Sci. 
SELECT * FROM instructor
WHERE dept_name = 'Comp. Sci.'

-- To find all instructors in Comp. Sci. dept with salary greater than 70K
SELECT * FROM instructor
WHERE dept_name = 'Comp. Sci.' AND salary > 70000

-- To find all instructors in Comp. Sci. dept with salary not equal to 70K != but use <>
SELECT * FROM instructor
WHERE dept_name = 'Comp. Sci.' AND salary <> 70000

--SELECT name FROM instructor WHERE dept_name = 'comp. sci'
--SELECT name FROM instructor WHERE dept_name = "Comp. Sci."
--The above didn't work because of the name in the in '' is case sensitive and "" doesn't work
SELECT name FROM instructor WHERE dept_name = 'Comp. Sci.'


-- Cartesian product ie cross join between two tables
-- Find the Cartesian product instructor X teaches
SELECT * FROM instructor
SELECT * FROM teaches

SELECT * FROM instructor, teaches



select * from instructor, teaches where instructor.id = teaches.id;
--?????????
select * from instructor, teaches where instructor.id <> teaches.id; -- these are lecturers that are not in the teaches table


-- 🎀🎀🎀List all the lecturers that teach at least one course.🎀🎀🎀

-- The instructor table holds details about the lecturers (instructors), such as their ID and name.
-- The teaches table links instructors to the courses they teach. It contains the following relevant columns:
-- ID: the instructor's ID (foreign key to instructor)
-- course_id, sec_id, semester, year: to identify which course and section the instructor teaches
-- Thus, the query will involve the instructor and teaches tables.

-- SELECT * FROM instructor, teaches

SELECT instructor.id, instructor.name, instructor.dept_name
FROM instructor
JOIN teaches
ON instructor.id = teaches.id





-- Now the above won't give distinct it will duplicate so we add the distinct clause





SELECT DISTINCT instructor.id, instructor.name, instructor.dept_name
FROM instructor
JOIN teaches
ON instructor.id = teaches.id
ORDER BY instructor.id ASC


















-- This last line just ascends order based on the instructor id

-- instructor.ID, instructor.name: This tells SQL to select the ID and name columns from the instructor table explicitly.
-- instructor.ID = teaches.ID: This is the condition that connects the rows between the instructor and teaches tables, matching instructors to the courses they teach.

-- In the instructor table, ID represents the instructor's unique identifier.
-- In the teaches table, ID also represents the instructor's ID, but this could be confusing when SQL needs to determine which table the ID is coming from.

SELECT  DISTINCT dept_name FROM instructor


-- 🎀🎀🎀OR You can just do this
select DISTINCT instructor.id, instructor.name, instructor.dept_name 
from instructor, teaches 
where instructor.id = teaches.id
ORDER BY instructor.id ASC


--🎀🎀🎀 Find the names of all instructors who have a higher salary than some instructors in 'Comp. Sci'🎀🎀🎀
SELECT * FROM instructor
-- This is basically a cartesian product of salary table and itself, we copy it as s and the main as t and compare 
SELECT DISTINCT T.name 
FROM instructor as T
JOIN instructor as S
ON T.salary > S.salary
WHERE S.dept_name = 'Comp. Sci.'


-- 🎀🎀🎀OR You can just do this


SELECT DISTINCT T.name
FROM instructor as T, instructor as S
WHERE T.salary > S.salary AND S.dept_name = 'Comp. Sci.'
-- the S is just for comp sci people

-- Keyword as is optional and may be omitted instructor as T ≡ instructor T


-- The LIKE operator in SQL is used to perform pattern-based string matching. 
-- It allows you to search for strings that match a specific pattern, where the % and _ characters are used as wildcards:

-- %: Matches any sequence of zero or more characters.
-- _: Matches any single character.


-- 🎀🎀🎀Find the names of all instructors whose name includes the substring “ri”🎀🎀🎀
SELECT name FROM instructor WHERE name LIKE '%ri%';
-- question: why is % important as a database admin

-- This query will search for instructors whose names contain the substring "ri" anywhere within the name. 
-- The % characters before and after "ri" indicate that any characters can appear before or after "ri".
-- So, it will match names like "Maria", "Oliver", "Richard", "Henry", etc., as long as they contain the substring "ri".



--This query will return all instructors whose names begin with the letter "S".
SELECT * FROM instructor WHERE name LIKE 'S%'


-- Find instructors whose names end with "in"
SELECT * from instructor where name like '%in'

-- Find instructors whose names have "exactly" six characters:
SELECT * FROM instructor where name like '______'

-- This query matches any string of "at least" six characters
SELECT * FROM instructor where name like '______%'


-- 🎀🎀🎀List in alphabetic order the grades gotten by students from the results (takes table)🎀🎀🎀
SELECT * FROM takes

SELECT grade From takes
ORDER BY grade ASC

SELECT DISTINCT grade From takes
ORDER BY grade ASC 
-- ASC is the default

SELECT DISTINCT grade From takes
ORDER BY grade DESC


-- Find the names of all instructors with salary between $90,000 and $100,000

select * from instructor

select name, salary 
from instructor
where salary between 90000 and 100000
--ie >= 90000 and <=100000




select name, course_id from instructor, teaches 
where (instructor.ID, dept_name) = (teaches.ID,'Biology')













--QUESTIONS
-- Is it case sensitive? 


















