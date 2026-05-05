-- =========================
-- DATABASE
-- =========================
CREATE DATABASE college_system;
USE college_system;

-- =========================
-- TABLES (DDL)
-- =========================
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    course_id INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    fees INT
);

-- =========================
-- INSERT COURSES
-- =========================
INSERT INTO courses VALUES
(101,'Java',50000),
(102,'Python',40000),
(103,'SQL',30000);

-- =========================
-- INSERT 30 STUDENTS
-- =========================
INSERT INTO students VALUES
(1,'Rohit',20,'Bhopal',101),
(2,'Aman',22,'Indore',102),
(3,'Neha',21,'Delhi',103),
(4,'Priya',23,'Mumbai',101),
(5,'Karan',20,'Pune',102),
(6,'Ankit',24,'Jaipur',103),
(7,'Simran',22,'Chennai',101),
(8,'Rahul',23,'Kolkata',102),
(9,'Pooja',21,'Lucknow',103),
(10,'Vikas',20,'Surat',101),
(11,'Nisha',22,'Nagpur',102),
(12,'Arjun',23,'Noida',103),
(13,'Meena',21,'Agra',101),
(14,'Deepak',24,'Kanpur',102),
(15,'Kavita',22,'Patna',103),
(16,'Suresh',23,'Ranchi',101),
(17,'Ritika',21,'Bhopal',102),
(18,'Tarun',20,'Indore',103),
(19,'Komal',22,'Delhi',101),
(20,'Harsh',23,'Mumbai',102),
(21,'Payal',21,'Pune',103),
(22,'Gaurav',24,'Jaipur',101),
(23,'Shreya',22,'Chennai',102),
(24,'Abhishek',23,'Kolkata',103),
(25,'Tanya',21,'Lucknow',101),
(26,'Mohit',20,'Surat',102),
(27,'Divya',22,'Nagpur',103),
(28,'Yash',23,'Noida',101),
(29,'Anjali',21,'Agra',102),
(30,'Manish',24,'Kanpur',103);

-- =========================
-- DDL QUERIES
-- =========================
ALTER TABLE students ADD email VARCHAR(50);
ALTER TABLE students MODIFY email VARCHAR(100);
ALTER TABLE students DROP COLUMN email;

ALTER TABLE students ADD phone VARCHAR(15);
ALTER TABLE students MODIFY phone VARCHAR(20);
ALTER TABLE students DROP COLUMN phone;

CREATE TABLE teachers(id INT, name VARCHAR(50));
ALTER TABLE teachers ADD salary INT;
ALTER TABLE teachers MODIFY name VARCHAR(100);
ALTER TABLE teachers DROP COLUMN salary;
DROP TABLE teachers;

CREATE TABLE dept(dept_id INT PRIMARY KEY, dept_name VARCHAR(50));
ALTER TABLE dept ADD location VARCHAR(50);
ALTER TABLE dept MODIFY location VARCHAR(100);
ALTER TABLE dept DROP COLUMN location;

CREATE TABLE temp(id INT);
RENAME TABLE temp TO temp_new;
DROP TABLE temp_new;

CREATE TABLE backup LIKE students;
DROP TABLE backup;

ALTER TABLE students ADD marks INT;
ALTER TABLE students MODIFY marks INT DEFAULT 0;
ALTER TABLE students DROP COLUMN marks;

TRUNCATE TABLE dept;

-- =========================
-- DML QUERIES 
-- =========================
SELECT * FROM students;
SELECT student_name FROM students;
SELECT student_name, city FROM students;
SELECT * FROM students WHERE age > 21;
SELECT * FROM students WHERE age < 22;
SELECT * FROM students WHERE city='Bhopal';
SELECT * FROM students WHERE age BETWEEN 20 AND 23;
SELECT * FROM students WHERE city IN ('Delhi','Mumbai');

SELECT COUNT(*) FROM students;
SELECT AVG(age) FROM students;
SELECT MAX(age) FROM students;
SELECT MIN(age) FROM students;

SELECT DISTINCT city FROM students;

SELECT * FROM students ORDER BY age ASC;
SELECT * FROM students ORDER BY age DESC;

SELECT * FROM students LIMIT 5;

SELECT * FROM students WHERE student_name LIKE 'R%';
SELECT * FROM students WHERE student_name LIKE '%a';

SELECT * FROM students WHERE age > 20 AND city='Delhi';
SELECT * FROM students WHERE age > 20 OR city='Mumbai';

UPDATE students SET city='Bangalore' WHERE student_id=1;
UPDATE students SET age=25 WHERE student_id=2;
UPDATE students SET student_name='Rohit Yadav' WHERE student_id=1;

DELETE FROM students WHERE student_id=30;

INSERT INTO students VALUES (31,'Extra',22,'Goa',101);
DELETE FROM students WHERE student_id=31;

-- =========================
-- JOIN QUERIES 
-- =========================
SELECT s.student_name, c.course_name FROM students s
INNER JOIN courses c ON s.course_id=c.course_id;

SELECT s.student_name, c.fees FROM students s
INNER JOIN courses c ON s.course_id=c.course_id;

SELECT * FROM students s LEFT JOIN courses c ON s.course_id=c.course_id;
SELECT * FROM students s RIGHT JOIN courses c ON s.course_id=c.course_id;

SELECT s.student_name FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
WHERE c.course_name='Java';

SELECT s.student_name, c.course_name FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
WHERE s.city='Bhopal';

SELECT s.student_name, c.course_name FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
ORDER BY s.age;

SELECT s.student_name, c.course_name FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
WHERE c.fees>30000;

SELECT COUNT(*) FROM students s
INNER JOIN courses c ON s.course_id=c.course_id;

SELECT s.city, COUNT(*) FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
GROUP BY s.city;

-- =========================
-- SUBQUERIES 
-- =========================
SELECT * FROM students WHERE age=(SELECT MAX(age) FROM students);
SELECT * FROM students WHERE age=(SELECT MIN(age) FROM students);
SELECT * FROM students WHERE age>(SELECT AVG(age) FROM students);

SELECT student_name FROM students WHERE course_id=
(SELECT course_id FROM courses WHERE course_name='Java');

SELECT student_name FROM students WHERE course_id IN
(SELECT course_id FROM courses WHERE fees>30000);

SELECT * FROM students WHERE student_id IN
(SELECT student_id FROM students WHERE city='Delhi');

SELECT * FROM students WHERE age<
(SELECT AVG(age) FROM students);

SELECT student_name FROM students WHERE course_id=
(SELECT course_id FROM courses WHERE fees=
(SELECT MAX(fees) FROM courses));

SELECT * FROM students WHERE student_id NOT IN
(SELECT student_id FROM students WHERE city='Mumbai');

SELECT * FROM students WHERE age=
(SELECT age FROM students WHERE student_name='Rohit Yadav');

-- extra variations
SELECT * FROM students WHERE age IN (SELECT age FROM students WHERE city='Bhopal');
SELECT * FROM students WHERE course_id IN (SELECT course_id FROM courses);
SELECT * FROM students WHERE age > (SELECT MIN(age) FROM students);

