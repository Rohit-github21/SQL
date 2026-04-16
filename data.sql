-- Create Database
CREATE DATABASE IF NOT EXISTS educoredb;
-- Use Database
USE educoredb;

-- Remove Table from the Database
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS enrollments;

-- Create Table Departments
CREATE TABLE departments(
dept_id INT PRIMARY KEY AUTO_INCREMENT,
dept_name VARCHAR(50) NOT NULL,
dept_code VARCHAR(50) UNIQUE,
building VARCHAR(50) 
);          
-- Create Table Teachers
CREATE TABLE teachers(
teacher_id INT PRIMARY KEY AUTO_INCREMENT,
teacher_name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
phone VARCHAR(50) NOT NULL,
salary DECIMAL(10,2),
hire_date DATE,
designation VARCHAR(50),
dept_id INT,

FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Create Table Students
CREATE TABLE students(
student_id INT PRIMARY KEY AUTO_INCREMENT,
student_name VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
phone VARCHAR(15) NOT NULL,
date_of_birth DATE,
gender VARCHAR(10),
address TEXT,
admission_date DATE,
status VARCHAR(10),
dept_id INT,

FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Create Table Courses
CREATE TABLE courses(
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(50) NOT NULL,
course_code VARCHAR(20) UNIQUE,
credit INT,
duration VARCHAR(20),
fees DECIMAL(10,2),
level VARCHAR(20),
teacher_id INT,
dept_id INT,

FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)

);

-- Create Table Enrollments
CREATE TABLE enrollments(
enroll_id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT,
course_id INT,
enroll_date DATE NOT NULL,
status VARCHAR(20) NOT NULL,
grade VARCHAR(5) NOT NULL,
attendance_percentage DECIMAL(5,2) NOT NULL,

FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (course_id) REFERENCES  courses(course_id)
);

-- Change Datatype
ALTER TABLE teachers
MODIFY salary DECIMAL(10,2) NOT NULL,
MODIFY hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
MODIFY designation VARCHAR(20) NOT NULL;

-- Change the Format of Date
SELECT DATE_FORMAT(date_of_birth, '%d-%m-%Y') AS dob FROM students;
SELECT DATE_FORMAT(admission_date, '%d-%m-%Y') AS admission_date FROM students;
SELECT DATE_FORMAT(enroll_date, '%d-%m-%Y') AS enroll_date FROM enrollments;

-- Change Datatypes
ALTER TABLE students
MODIFY gender VARCHAR(10) NOT NULL,
MODIFY address TEXT NOT NULL,
MODIFY admission_date DATE NOT NULL,
MODIFY status VARCHAR(10) NOT NULL;


-- Insert sample data into departments

INSERT INTO departments (dept_name, dept_code, building) VALUES
('Computer Science', 'CS101', 'Technology Block A'),
('Information Technology', 'IT102', 'Technology Block B'),
('Electronics Engineering', 'EC103', 'Electronics Wing'),
('Electrical Engineering', 'EE104', 'Power House'),
('Mechanical Engineering', 'ME105', 'Workshop Building'),
('Civil Engineering', 'CE106', 'Construction Block'),
('Chemical Engineering', 'CH107', 'Science Complex'),
('Biotechnology', 'BT108', 'Bio Sciences Block'),
('Mathematics', 'MA109', 'Science Block'),
('Physics', 'PH110', 'Science Block'),
('Chemistry', 'CY111', 'Science Complex'),
('Business Administration', 'BA112', 'Management Tower'),
('Commerce', 'CO113', 'Commerce Building'),
('Economics', 'EC114', 'Social Sciences Block'),
('English Literature', 'EN115', 'Humanities Block'),
('History', 'HI116', 'Heritage Building'),
('Political Science', 'PO117', 'Social Sciences Block'),
('Psychology', 'PS118', 'Behavioral Sciences'),
('Law', 'LA119', 'Legal Studies Block'),
('Pharmacy', 'PH120', 'Medical Sciences Building'),
('Aerospace Engineering', 'AE121', 'Space Research Center'),
('Agricultural Science', 'AG122', 'Green House Complex'),
('Architecture', 'AR123', 'Design Studio'),
('Artificial Intelligence', 'AI124', 'Tech Innovation Hub'),
('Automobile Engineering', 'AU125', 'Transport Wing'),
('Biochemistry', 'BC126', 'Life Sciences Block'),
('Biomedical Engineering', 'BM127', 'Medical Tech Center'),
('Ceramic Engineering', 'CE128', 'Material Science Block'),
('Dairy Technology', 'DT129', 'Food Processing Unit'),
('Data Science', 'DS130', 'Analytics Center'),
('Defense Studies', 'DF131', 'Security Studies Block'),
('Dental Sciences', 'DN132', 'Dental College Wing'),
('Earth Sciences', 'ES133', 'Geology Museum'),
('Environmental Science', 'EN134', 'Eco Research Center'),
('Fashion Technology', 'FT135', 'Design Studio');

-- Insert sample data into teachers

INSERT INTO teachers (teacher_name, email, phone, salary, hire_date, designation, dept_id) VALUES
('Dr. Rajesh Sharma', 'rajesh.sharma@educore.edu', '9876543210', 95000.00, '2015-07-20', 'Professor', 1),
('Prof. Sunita Verma', 'sunita.verma@educore.edu', '9876543211', 88000.00, '2016-08-15', 'Professor', 2),
('Dr. Amit Kumar', 'amit.kumar@educore.edu', '9876543212', 75000.00, '2018-01-10', 'Associate Professor', 3),
('Prof. Priya Singh', 'priya.singh@educore.edu', '9876543213', 92000.00, '2014-11-05', 'Professor', 4),
('Dr. Vikram Patel', 'vikram.patel@educore.edu', '9876543214', 82000.00, '2017-03-18', 'Associate Professor', 5),
('Prof. Neha Gupta', 'neha.gupta@educore.edu', '9876543215', 78000.00, '2019-06-22', 'Assistant Professor', 6),
('Dr. Suresh Reddy', 'suresh.reddy@educore.edu', '9876543216', 98000.00, '2013-09-12', 'Professor', 7),
('Prof. Anjali Nair', 'anjali.nair@educore.edu', '9876543217', 86000.00, '2016-12-01', 'Associate Professor', 8),
('Dr. Manoj Joshi', 'manoj.joshi@educore.edu', '9876543218', 72000.00, '2020-02-14', 'Assistant Professor', 9),
('Prof. Kavita Desai', 'kavita.desai@educore.edu', '9876543219', 89000.00, '2015-10-30', 'Professor', 10),
('Dr. Rakesh Mehta', 'rakesh.mehta@educore.edu', '9876543220', 84000.00, '2017-07-19', 'Associate Professor', 11),
('Prof. Swati Choudhary', 'swati.choudhary@educore.edu', '9876543221', 77000.00, '2018-09-25', 'Assistant Professor', 12),
('Dr. Pradeep Yadav', 'pradeep.yadav@educore.edu', '9876543222', 91000.00, '2014-04-17', 'Professor', 13),
('Prof. Meera Krishnan', 'meera.krishnan@educore.edu', '9876543223', 83000.00, '2016-11-11', 'Associate Professor', 14),
('Dr. Arjun Singhania', 'arjun.singhania@educore.edu', '9876543224', 96000.00, '2013-08-08', 'Professor', 15),
('Prof. Deepa Menon', 'deepa.menon@educore.edu', '9876543225', 79000.00, '2019-03-27', 'Assistant Professor', 16),
('Dr. Sanjay Kulkarni', 'sanjay.kulkarni@educore.edu', '9876543226', 87000.00, '2015-12-15', 'Associate Professor', 17),
('Prof. Rekha Bansal', 'rekha.bansal@educore.edu', '9876543227', 81000.00, '2018-05-09', 'Assistant Professor', 18),
('Dr. Alok Saxena', 'alok.saxena@educore.edu', '9876543228', 94000.00, '2014-09-03', 'Professor', 19),
('Prof. Jyoti Mishra', 'jyoti.mishra@educore.edu', '9876543229', 76000.00, '2020-01-20', 'Assistant Professor', 20),
('Dr. Aarav Sharma', 'aarav.sharma@educore.edu', '9988776601', 95000.00, '2014-03-15', 'Professor', 21),
('Prof. Vivaan Gupta', 'vivaan.gupta@educore.edu', '9988776602', 88000.00, '2016-07-20', 'Associate Professor', 22),
('Dr. Aditya Kumar', 'aditya.kumar@educore.edu', '9988776603', 92000.00, '2015-01-10', 'Professor', 23),
('Prof. Anaya Singh', 'anaya.singh@educore.edu', '9988776604', 84000.00, '2017-09-05', 'Associate Professor', 24),
('Dr. Diya Verma', 'diya.verma@educore.edu', '9988776605', 97000.00, '2013-11-18', 'Professor', 25),
('Prof. Kabir Reddy', 'kabir.reddy@educore.edu', '9988776606', 89000.00, '2016-04-22', 'Professor', 26),
('Dr. Myra Nair', 'myra.nair@educore.edu', '9988776607', 86000.00, '2018-02-14', 'Associate Professor', 27),
('Prof. Ayaan Joshi', 'ayaan.joshi@educore.edu', '9988776608', 79000.00, '2019-08-30', 'Assistant Professor', 28),
('Dr. Navya Desai', 'navya.desai@educore.edu', '9988776609', 93000.00, '2014-10-12', 'Professor', 29),
('Prof. Arjun Mehta', 'arjun.mehta@educore.edu', '9988776610', 87000.00, '2017-05-25', 'Associate Professor', 30),
('Dr. Sara Khan', 'sara.khan@educore.edu', '9988776611', 91000.00, '2015-09-08', 'Professor', 31),
('Prof. Rohan Choudhary', 'rohan.choudhary@educore.edu', '9988776612', 82000.00, '2018-12-03', 'Assistant Professor', 32),
('Dr. Zara Sheikh', 'zara.sheikh@educore.edu', '9988776613', 96000.00, '2013-06-17', 'Professor', 33),
('Prof. Aryan Yadav', 'aryan.yadav@educore.edu', '9988776614', 85000.00, '2017-03-29', 'Associate Professor', 34),
('Dr. Inaya Krishnan', 'inaya.krishnan@educore.edu', '9988776615', 78000.00, '2020-01-19', 'Assistant Professor', 35);

-- Insert sample data into students

INSERT INTO students (student_name, email, phone, date_of_birth, gender, address, admission_date, status, dept_id) VALUES
('Aarav Sharma', 'aarav.sharma@student.edu', '9988776655', '2003-05-15', 'Male', '123 Gandhi Nagar, New Delhi', '2021-07-15', 'Active', 1),
('Ananya Verma', 'ananya.verma@student.edu', '9988776656', '2004-02-20', 'Female', '45 Lajpat Nagar, Delhi', '2022-07-15', 'Active', 2),
('Vihaan Kumar', 'vihaan.kumar@student.edu', '9988776657', '2002-11-10', 'Male', '78 Andheri East, Mumbai', '2020-07-15', 'Active', 3),
('Ishita Singh', 'ishita.singh@student.edu', '9988776658', '2003-08-25', 'Female', '12 Salt Lake, Kolkata', '2021-07-15', 'Active', 4),
('Advik Patel', 'advik.patel@student.edu', '9988776659', '2004-03-12', 'Male', '56 Vastrapur, Ahmedabad', '2022-07-15', 'Active', 5),
('Saanvi Gupta', 'saanvi.gupta@student.edu', '9988776660', '2003-07-18', 'Female', '90 Indiranagar, Bangalore', '2021-07-15', 'Active', 6),
('Shaurya Reddy', 'shaurya.reddy@student.edu', '9988776661', '2002-09-05', 'Male', '34 Jubilee Hills, Hyderabad', '2020-07-15', 'Active', 7),
('Anvi Nair', 'anvi.nair@student.edu', '9988776662', '2004-01-30', 'Female', '67 Vazhuthacaud, Trivandrum', '2022-07-15', 'Active', 8),
('Dhruv Joshi', 'dhruv.joshi@student.edu', '9988776663', '2003-12-03', 'Male', '23 Mall Road, Nainital', '2021-07-15', 'Active', 9),
('Myra Desai', 'myra.desai@student.edu', '9988776664', '2004-06-22', 'Female', '89 Fatehgunj, Vadodara', '2022-07-15', 'Active', 10),
('Krishna Mehta', 'krishna.mehta@student.edu', '9988776665', '2002-10-14', 'Male', '45 Marine Drive, Mumbai', '2020-07-15', 'Active', 11),
('Aadhya Choudhary', 'aadhya.choudhary@student.edu', '9988776666', '2003-04-08', 'Female', '78 Vaishali Nagar, Jaipur', '2021-07-15', 'Active', 12),
('Rudra Yadav', 'rudra.yadav@student.edu', '9988776667', '2004-09-19', 'Male', '12 Gomti Nagar, Lucknow', '2022-07-15', 'Active', 13),
('Diya Krishnan', 'diya.krishnan@student.edu', '9988776668', '2003-01-27', 'Female', '56 Anna Nagar, Chennai', '2021-07-15', 'Active', 14),
('Kabir Singhania', 'kabir.singhania@student.edu', '9988776669', '2002-07-11', 'Male', '90 Koregaon Park, Pune', '2020-07-15', 'Active', 15),
('Prisha Menon', 'prisha.menon@student.edu', '9988776670', '2004-11-02', 'Female', '34 Panampilly Nagar, Kochi', '2022-07-15', 'Active', 16),
('Ayaan Kulkarni', 'ayaan.kulkarni@student.edu', '9988776671', '2003-05-29', 'Male', '67 Shivaji Nagar, Pune', '2021-07-15', 'Active', 17),
('Anaya Bansal', 'anaya.bansal@student.edu', '9988776672', '2004-08-14', 'Female', '23 Civil Lines, Agra', '2022-07-15', 'Active', 18),
('Ishaan Saxena', 'ishaan.saxena@student.edu', '9988776673', '2002-12-07', 'Male', '89 Hazratganj, Lucknow', '2020-07-15', 'Active', 19),
('Navya Mishra', 'navya.mishra@student.edu', '9988776674', '2003-03-17', 'Female', '45 Ashok Nagar, Bhopal', '2021-07-15', 'Active', 20),
('Vivaan Gupta', 'vivaan.gupta@student.edu', '8877665501', '2004-01-15', 'Male', '123 Green Park, New Delhi', '2022-07-15', 'Active', 21),
('Anaya Singh', 'anaya.singh@student.edu', '8877665502', '2003-05-20', 'Female', '45 Civil Lines, Mumbai', '2021-07-15', 'Active', 22),
('Aditya Kumar', 'aditya.kumar@student.edu', '8877665503', '2005-03-10', 'Male', '78 Lake Town, Kolkata', '2023-07-15', 'Active', 23),
('Diya Verma', 'diya.verma@student.edu', '8877665504', '2002-11-25', 'Female', '12 Indiranagar, Bangalore', '2020-07-15', 'Active', 24),
('Kabir Reddy', 'kabir.reddy@student.edu', '8877665505', '2004-07-08', 'Male', '56 Jubilee Hills, Hyderabad', '2022-07-15', 'Active', 25),
('Myra Nair', 'myra.nair@student.edu', '8877665506', '2003-09-12', 'Female', '90 Vastrapur, Ahmedabad', '2021-07-15', 'Active', 26),
('Ayaan Joshi', 'ayaan.joshi@student.edu', '8877665507', '2005-02-18', 'Male', '34 Marine Drive, Chennai', '2023-07-15', 'Active', 27),
('Navya Desai', 'navya.desai@student.edu', '8877665508', '2002-06-30', 'Female', '67 Koregaon Park, Pune', '2020-07-15', 'Active', 28),
('Arjun Mehta', 'arjun.mehta@student.edu', '8877665509', '2004-10-22', 'Male', '23 Gomti Nagar, Lucknow', '2022-07-15', 'Active', 29),
('Sara Khan', 'sara.khan@student.edu', '8877665510', '2003-12-05', 'Female', '89 Anna Nagar, Jaipur', '2021-07-15', 'Active', 30),
('Rohan Choudhary', 'rohan.choudhary@student.edu', '8877665511', '2005-04-14', 'Male', '45 Hazratganj, Bhopal', '2023-07-15', 'Active', 31),
('Zara Sheikh', 'zara.sheikh@student.edu', '8877665512', '2002-08-19', 'Female', '78 Vaishali Nagar, Nagpur', '2020-07-15', 'Active', 32),
('Aryan Yadav', 'aryan.yadav@student.edu', '8877665513', '2004-01-28', 'Male', '12 Salt Lake, Chandigarh', '2022-07-15', 'Active', 33),
('Inaya Krishnan', 'inaya.krishnan@student.edu', '8877665514', '2003-06-09', 'Female', '56 Civil Lines, Patna', '2021-07-15', 'Active', 34),
('Reyansh Malhotra', 'reyansh.malhotra@student.edu', '8877665515', '2005-09-16', 'Male', '90 Panampilly Nagar, Kochi', '2023-07-15', 'Active', 35);

-- Insert sample data into courses

INSERT INTO courses (course_name, course_code, credit, duration, fees, level, teacher_id, dept_id) VALUES
('Data Structures', 'CS201', 4, '16 weeks', 15000.00, 'Undergraduate', 1, 1),
('Database Systems', 'CS202', 3, '14 weeks', 14000.00, 'Undergraduate', 1, 1),
('Web Development', 'IT301', 4, '16 weeks', 16000.00, 'Undergraduate', 2, 2),
('Digital Electronics', 'EC101', 3, '15 weeks', 13500.00, 'Undergraduate', 3, 3),
('Power Systems', 'EE201', 4, '16 weeks', 15500.00, 'Undergraduate', 4, 4),
('Thermodynamics', 'ME301', 3, '14 weeks', 14500.00, 'Undergraduate', 5, 5),
('Structural Analysis', 'CE401', 4, '16 weeks', 16500.00, 'Undergraduate', 6, 6),
('Chemical Process', 'CH201', 3, '15 weeks', 14000.00, 'Undergraduate', 7, 7),
('Genetic Engineering', 'BT301', 4, '16 weeks', 17500.00, 'Undergraduate', 8, 8),
('Linear Algebra', 'MA201', 3, '14 weeks', 12500.00, 'Undergraduate', 9, 9),
('Quantum Mechanics', 'PH301', 4, '16 weeks', 15500.00, 'Undergraduate', 10, 10),
('Organic Chemistry', 'CY201', 3, '15 weeks', 14500.00, 'Undergraduate', 11, 11),
('Marketing Management', 'BA101', 3, '12 weeks', 20000.00, 'Postgraduate', 12, 12),
('Financial Accounting', 'CO201', 4, '16 weeks', 16500.00, 'Undergraduate', 13, 13),
('Microeconomics', 'EC301', 3, '14 weeks', 14000.00, 'Undergraduate', 14, 14),
('British Literature', 'EN201', 3, '15 weeks', 13000.00, 'Undergraduate', 15, 15),
('Modern Indian History', 'HI301', 4, '16 weeks', 13500.00, 'Undergraduate', 16, 16),
('International Relations', 'PO201', 3, '14 weeks', 14500.00, 'Undergraduate', 17, 17),
('Cognitive Psychology', 'PS301', 4, '16 weeks', 15000.00, 'Undergraduate', 18, 18),
('Constitutional Law', 'LA201', 4, '18 weeks', 22000.00, 'Postgraduate', 19, 19),
('Rocket Propulsion', 'AE101', 4, '16 weeks', 25000.00, 'Postgraduate', 21, 21),
('Crop Science', 'AG201', 3, '14 weeks', 18000.00, 'Undergraduate', 22, 22),
('Building Design', 'AR301', 4, '18 weeks', 22000.00, 'Undergraduate', 23, 23),
('Machine Learning', 'AI401', 4, '16 weeks', 28000.00, 'Postgraduate', 24, 24),
('Vehicle Dynamics', 'AU501', 3, '15 weeks', 20000.00, 'Undergraduate', 25, 25),
('Metabolic Pathways', 'BC601', 4, '16 weeks', 21000.00, 'Postgraduate', 26, 26),
('Medical Imaging', 'BM701', 3, '14 weeks', 24000.00, 'Postgraduate', 27, 27),
('Material Properties', 'CE801', 3, '15 weeks', 19000.00, 'Undergraduate', 28, 28),
('Dairy Processing', 'DT901', 4, '16 weeks', 18000.00, 'Undergraduate', 29, 29),
('Big Data Analytics', 'DS001', 4, '16 weeks', 27000.00, 'Postgraduate', 30, 30),
('Strategic Studies', 'DF111', 3, '14 weeks', 19000.00, 'Undergraduate', 31, 31),
('Oral Pathology', 'DN121', 4, '18 weeks', 30000.00, 'Postgraduate', 32, 32),
('Climate Change', 'ES131', 3, '15 weeks', 21000.00, 'Undergraduate', 33, 33),
('Ecotoxicology', 'EN141', 3, '15 weeks', 19000.00, 'Postgraduate', 34, 34),
('Fashion Illustration', 'FT151', 4, '16 weeks', 24000.00, 'Undergraduate', 35, 35);

-- Insert sample data into enrollments

INSERT INTO enrollments (student_id, course_id, enroll_date, status, grade, attendance_percentage) VALUES
(1, 1, '2024-01-10', 'Active', 'A', 92.50),
(2, 3, '2024-01-10', 'Active', 'B+', 85.75),
(3, 5, '2024-01-11', 'Active', 'A-', 88.00),
(4, 7, '2024-01-11', 'Active', 'B', 79.50),
(5, 9, '2024-01-12', 'Active', 'A', 94.25),
(6, 11, '2024-01-12', 'Active', 'B+', 82.00),
(7, 13, '2024-01-13', 'Active', 'A-', 90.50),
(8, 15, '2024-01-13', 'Active', 'B', 76.75),
(9, 17, '2024-01-14', 'Active', 'A', 95.00),
(10, 19, '2024-01-14', 'Active', 'B+', 84.50),
(11, 2, '2024-01-15', 'Active', 'A-', 89.75),
(12, 4, '2024-01-15', 'Active', 'B+', 83.25),
(13, 6, '2024-01-16', 'Active', 'A', 91.00),
(14, 8, '2024-01-16', 'Active', 'B', 77.50),
(15, 10, '2024-01-17', 'Active', 'A-', 87.75),
(16, 12, '2024-01-17', 'Active', 'B+', 81.50),
(17, 14, '2024-01-18', 'Active', 'A', 93.25),
(18, 16, '2024-01-18', 'Active', 'B', 78.00),
(19, 18, '2024-01-19', 'Active', 'A-', 86.50),
(20, 20, '2024-01-19', 'Active', 'A', 96.00),
(21, 21, '2024-01-20', 'Active', 'A', 94.00),
(22, 22, '2024-01-20', 'Active', 'B+', 86.50),
(23, 23, '2024-01-21', 'Active', 'A-', 89.75),
(24, 24, '2024-01-21', 'Active', 'A', 92.25),
(25, 25, '2024-01-22', 'Active', 'B', 79.00),
(26, 26, '2024-01-22', 'Active', 'B+', 84.50),
(27, 27, '2024-01-23', 'Active', 'A-', 88.00),
(28, 28, '2024-01-23', 'Active', 'A', 95.50),
(29, 29, '2024-01-24', 'Active', 'B+', 83.75),
(30, 30, '2024-01-24', 'Active', 'A-', 90.25),
(31, 31, '2024-01-25', 'Active', 'B', 77.50),
(32, 32, '2024-01-25', 'Active', 'A', 93.00),
(33, 33, '2024-01-26', 'Active', 'B+', 85.25),
(34, 34, '2024-01-26', 'Active', 'A-', 87.50),
(35, 35, '2024-01-27', 'Active', 'A', 96.00);

-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Truncate child tables first (due to foreign key constraints)
TRUNCATE TABLE enrollments;
TRUNCATE TABLE courses;
TRUNCATE TABLE students;
TRUNCATE TABLE teachers;
TRUNCATE TABLE departments;


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


SELECT 'DEPARTMENTS' AS Table_Name, COUNT(*) AS Total_Record FROM departments
UNION ALL
SELECT 'TEACHER', COUNT(*) FROM teachers
UNION ALL
SELECT 'STUDENTS', COUNT(*) FROM students
UNION ALL
SELECT 'COURSES', COUNT(*) FROM courses
UNION ALL
SELECT 'ENROLLMENTS', COUNT(*) FROM enrollments;



SELECT student_id, student_name, email, phone, gender, status FROM students LIMIT 10;

SELECT t.teacher_id, t.teacher_name, t.designation, d.dept_name
FROM teachers t
JOIN departments d ON t.dept_id = d.dept_id
LIMIT 5;

SELECT e.enroll_id, s.student_name, c.course_name, e.grade, e.attendance_percentage
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
LIMIT 10;

SELECT s.student_name, c.course_name, t.teacher_name, d.dept_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Teachers t ON c.teacher_id = t.teacher_id
JOIN Departments d ON s.dept_id = d.dept_id;













