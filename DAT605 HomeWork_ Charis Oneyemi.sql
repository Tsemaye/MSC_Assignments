SELECT *
FROM takes

-- Name: Charis Oneyemi
-- Program: MSc Data Science
-- Course: DAT 605

-- Home work: Can the below code be wriiten in a simpler form?
SELECT COUNT(DISTINCT ID)
FROM takes
WHERE (course_id, sec_id, semester, year) IN (
    SELECT course_id, sec_id, semester, year
    FROM teaches
    WHERE teaches.ID = '10101'
)


-- Solution
SELECT COUNT(DISTINCT takes.ID)
FROM takes
JOIN teaches ON takes.course_id = teaches.course_id 
             AND takes.sec_id = teaches.sec_id 
             AND takes.semester = teaches.semester 
             AND takes.year = teaches.year
WHERE teaches.ID = '10101'































