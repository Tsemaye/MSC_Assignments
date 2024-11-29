-- Lecture 3

-- Note in SQL use '' not ""

-- Cartesian product of instructor and teaches table
Select * from instructor, teaches

-- Cartesian product and the where clause
-- This particular query below is just selecting everything from the instructor
-- and teaches table as long as the id in instructors table is the same as the id in teaches table

select * from instructor, teaches
where instructor.id = teaches.id

-- OR

select * from instructor
join teaches
on instructor.id = teaches.id


-- Aliasing
-- Find the names of all the instructors who have a higher salary 
-- than some instructors in 'Comp. Sci.'

select distinct T.name 
from instructor as T, instructor as S 
where T.salary > S.salary and S.dept_name = 'Comp. Sci.'

-- OR

select distinct name
from instructor
where salary > (
	select min(salary)
	from instructor
	where dept_name = 'Comp. Sci.')

-- By using MIN in the subquery, we ensure that 
-- we're comparing against the lowest salary in the 'Comp. Sci' department.
-- This guarantees that any instructor with a higher salary will meet the condition 
-- and be included in the result set. Remember the question said higher than some not all 
-- so if it's at least higher than the lowest then that's fine



select course_id 
from section
where semester = 'Fall' and year = 



-- LIKE % _
select name from instructor where name like '%ri%'

select name from instructor where name like '%ri'

-- Patterns are case sensitive. 
-- Pattern matching examples:
--'Intro%' matches any string beginning with “Intro”.
--'%ri' matches any string ending with “ri”.
-- '%Comp%' matches any string containing “Comp” as a substring.
--'_ _ _' matches any string of exactly three characters.
--'_ _ _%' matches any string of at least three characters.

select name from instructor where name like '______%'
select name from instructor where name like '______'



-- Order by
-- List in alphabetic order the grades gotten by students from the results (takes table).
select * from takes

select distinct grade 
from takes
order by grade

-- order by is asc automatically, if you want descending, you'd specify

select distinct grade 
from takes
order by grade desc

select dept_name from instructor order by dept_name desc

select name, dept_name from instructor

select name, dept_name from instructor order by name

select name, dept_name from instructor order by dept_name

--Can sort on multiple attributes
select name, dept_name from instructor order by name, dept_name
--When you use two or more attributes in the ORDER BY clause, 
--the result set is sorted first by the first attribute, and then by the second attribute 
--within each group defined by the first attribute.
-- for example: so if we have name "kam" in dept biology and "kan" in dept comp sci, kan will come first


-- Between clause

select name, salary
from instructor

select name, salary 
from instructor where salary between 90000 and 100000


select name, course_id from instructor, teaches 
where (instructor.ID, dept_name) = (teaches.ID,'Biology')

-- OR

select name, course_id from instructor, teaches 
where (instructor.ID = teaches.ID)
and (dept_name = 'Biology')

-- So possible exam questions could be what's the alternative query for this

-- Find courses that ran in Fall 2017 or in Spring 2018
select * from section

/*
select course_id from section
where (semester, year) = ('Fall', 2017)
join
select course_id from section
where (semester, year) = ('Spring', 2018)

Join won't work in this case so we use union
*/

select course_id from section
where (semester, year) = ('Fall', 2017)
union
select course_id from section
where (semester, year) = ('Spring', 2018)
-- where (semester, year) = ('spring', 2018)
-- spring and Spring are not the same thing


-- So the question said in fall "or" in spring so it can be any of the sections fall or spring so we use union
-- but if they say in spring, then you use intersect

select course_id
from section
where (semester, year) = ('Fall', 2017)
intersect
select course_id
from section
where (semester, year) = ('Spring', 2018)
-- So this query just returns the only course representing it with it's id that help in both fall 2017 and spring 2018


-- Except keyword
-- Find courses that ran in Fall 2017 but not in Spring 2018
-- I mean we could just do the regular select, where but since they specified not in spring, we use the except keyword

select course_id  
from section
where (semester, year) = ('Fall', 2017)
except
select course_id  
from section
where (semester, year) = ('Spring', 2018)



/*
Each of the above operations automatically eliminates duplicates
To retain all duplicates use the
union all,
intersect all
except all
*/


select course_id from section
where (semester, year) = ('Fall', 2017)
union all
select course_id from section
where (semester, year) = ('Spring', 2018)


select course_id
from section
where (semester, year) = ('Fall', 2017)
intersect all
select course_id
from section
where (semester, year) = ('Spring', 2018)



select course_id  
from section
where (semester, year) = ('Fall', 2017)
except all
select course_id  
from section
where (semester, year) = ('Spring', 2018)



-- Aggregate functions
-- These functions operate on the multiset of values of a column of a relation, and return a value
-- avg: average value
-- min: minimum value
-- max: maximum value
-- sum: sum of values
-- count: number of values


-- Find the average salary of instructors in the Computer Science department.
select round(avg(salary)) from instructor where dept_name = 'Comp. Sci.'
-- I used the round function or whatever it's called so we don't have lots of values after the decimal point

--Find the total number of instructors who teach a course in the Spring 2018 semester.
select * from teaches

select count(distinct ID) as number_of_instructors
from teaches
where (semester, year) = ('Spring', 2018)


-- If you count w/o distinct, it will count all the duplicates. Like if we want to know the number of genders in a class 
-- with distinct it's just two ie male and female, w/o, it counts the duplicates
select count( ID) as number_of_instructors
from teaches
where (semester, year) = ('Spring', 2018)

select * from course


-- Find the number of tuples in the course relation ie the number of rows in a table
select count(*) from course
-- This counts the number of rows available


-- Find the average salary of instructors in each department 
select dept_name, round(avg(salary)) from instructor group by dept_name

Attributes in select clause outside of aggregate functions must appear in group by list
/*erroneous query 
select dept_name, ID, avg(salary) from instructor group by dept_name;
To fix the error, you need to either:

Include ID in the GROUP BY clause: If you want to see the specific ID for each department's average salary, include ID in the GROUP BY clause. This will give you a row for each department and each ID within that department.
or
Remove ID from the SELECT clause: If you only want the average salary per department and don't need the specific ID, remove ID from the SELECT clause.
*/

-- select dept_name, ID, avg(salary) from instructor group by ID, dept_name;
-- we actually don't need this but just for entertainment pursposes.


-- This shows all the tables in the database

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'


-- Find the names and average salaries of all departments whose average salary is greater than 42000

select * from instructor

/* Select dept_name, round(avg(salary)) as avg_salary
from department
where avg_salary > 42000
NOTE THIS:So this won't work because aggregate functions like avg aren't supported by the where clause
*/


select * from instructor

-- so we use HAVING in place of WHERE
/*
select dept_name, round(avg(salary)) as avg_salary
from instructor
-- having avg_salary > 42000 won't work
having avg(salary) > 42000
This alone won't work, we need the group by and it needs to come before having*/

select dept_name, round(avg(salary)) as avg_salary
from instructor
group by dept_name
having avg(salary) > 42000


-- Note: predicates in the having clause are applied after the formation of groups whereas predicates in the where clause are applied before forming groups
-- Explained better below
-- So when use group by and where, where comes before the group by
-- When using group by and having, having comes after the group by



-- NESTED SUB-QUERIES & Set Membership

-- Find courses offered in Fall 2017 and in Spring 2018.
select * from section
select course_id from section where semester = 'Fall' and year = 2017





select course_id from section where semester = 'Fall' and year = 2017
union
select course_id from section where semester = 'Spring' and year = 2018



-- Joins

select * from takes
select * from student


select s.id, s.name, t.course_id from student as s
left join takes as t 
on s.id = t.id

select s.id, s.name, t.course_id from takes as t
left join student as s 
on s.id = t.id

select s.id, s.name, t.course_id from student as s
right join takes as t 
on s.id = t.id









