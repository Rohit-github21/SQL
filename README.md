# SQL
1. Execution Flow of SQL Commands

SQL queries follow a fixed execution order (FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY) because the database needs to first identify the data source, then filter, group, and finally display results.
This sequence ensures efficient processing and avoids unnecessary computations. For example, filtering with WHERE happens before grouping, so only required data is processed.

🔹 2. DDL (Data Definition Language)

DDL commands are used to define and manage database structure.
Commands like CREATE, ALTER, and DROP help in creating tables, modifying columns, and deleting structures.
In your schema (like students, courses, enrollments) , DDL ensures proper design with constraints like PRIMARY KEY, FOREIGN KEY, which maintain data integrity.

🔹 3. DML (Data Manipulation Language)

DML commands are used to manipulate data inside tables.

INSERT → Add data
UPDATE → Modify data
DELETE → Remove data
These operations allow dynamic interaction with the database and are essential for real-world applications.
🔹 4. SQL JOINs

JOINs are used to combine data from multiple tables based on relationships.

INNER JOIN → Only matching records
LEFT JOIN → All left + matching right
RIGHT JOIN → All right + matching left
FULL JOIN → All records from both tables

In your student database, JOINs help connect students, courses, and enrollments to get meaningful results.

🔹 5. Best Practices

Best practices improve performance, readability, and maintainability:

Use indexes for faster queries
Avoid SELECT *
Use filtering (WHERE)
Use proper naming
Normalize tables
Apply constraints
Write clean and readable queries
