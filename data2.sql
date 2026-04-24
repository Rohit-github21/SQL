--  1. Explain the execution flow of SQL commands in detail. Discuss why SQL commands follow a specific sequence and the purpose behind this order.
-- FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY

SELECT s.student_name, COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.attendance_percentage > 80
GROUP BY s.student_name
HAVING COUNT(e.course_id) > 1
ORDER BY total_courses DESC;

-- 2 Write five SQL queries demonstrating Data Definition Language (DDL) operations.

CREATE DATABASE educoredb;

USE educoredb;

CREATE TABLE students(
 student_id INT PRIMARY KEY AUTO_INCREMENT,
 student_name VARCHAR(50),
 email VARCHAR(50)
);

ALTER TABLE students
MODIFY email VARCHAR(100) NOT NULL;

DROP TABLE students;

-- 3 Provide three SQL queries illustrating Data Manipulation Language (DML) operations.

INSERT INTO students(student_name,email)
VALUES ('Rohit','rohit@gmail.com');

UPDATE students
SET email='newrohit@gmail.com'
WHERE student_id=1;

DELETE FROM students
WHERE student_id=1;


-- 4  Create two tables and demonstrate the application of various types of SQL JOINs including INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.

-- INNER JOIN
SELECT s.student_name, c.course_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id;

-- LEFT JOIN
SELECT s.student_name, e.enroll_id
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id;

-- RIGHT JOIN
SELECT c.course_name, e.enroll_id
FROM courses c
RIGHT JOIN enrollments e ON c.course_id = e.course_id;

-- FULL OUTER JOIN
SELECT s.student_name, e.enroll_id
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
UNION
SELECT s.student_name, e.enroll_id
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id;

-- 5  Compile a comprehensive list of best practices for writing efficient and maintainable SQL queries. Explain with theory and examples.

CREATE INDEX idx_student ON enrollments(student_id);

SELECT student_name FROM students;

SELECT * FROM students WHERE status='Active'; 
