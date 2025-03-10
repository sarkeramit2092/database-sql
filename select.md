# SQL SELECT Statement

Introduction

The SELECT statement in SQL is used to retrieve data from one or more tables in a database. It allows filtering, sorting, grouping, and joining data to extract meaningful information.

Basic Syntax
=============
SELECT column1, column2, ...
FROM table_name;

Example
========
SELECT name, marks FROM student;

This retrieves the name and marks columns from the student table.

Selecting All Columns
======================
To select all columns from a table, use *:

SELECT * FROM student;

Using WHERE Clause (Filtering Data)
===================================
The WHERE clause is used to filter records based on conditions.

Example:

SELECT * FROM student WHERE marks > 80;

Retrieves students who scored more than 80 marks.

Sorting Data (ORDER BY)
========================
The ORDER BY clause sorts the result set.

Example:

SELECT * FROM student ORDER BY name ASC;

Sorts students by name in ascending order. Use DESC for descending order.

Limiting Results (LIMIT)
==========================
Limits the number of rows returned.

Example:

SELECT * FROM student LIMIT 3;

Returns only the first 3 records.

# Aggregation Functions (COUNT, SUM, AVG, MAX, MIN)
===================================================
SQL provides functions to perform calculations on data.

Example:

SELECT COUNT(*) FROM student;

Returns the total number of students.

# Grouping Data (GROUP BY)

Used to group records that have the same values.

Example:

SELECT city, COUNT(*) FROM student GROUP BY city;

Counts students for each city.

# Filtering Grouped Data (HAVING)

The HAVING clause filters grouped records.

Example:

SELECT grade, COUNT(*) FROM student GROUP BY grade HAVING COUNT(*) > 1;

Returns grades where more than one student has the same grade.

# Joining Tables (JOIN)

Combining data from multiple tables.
----------------------------------------------------------
Example:

CREATE TABLE enrollment (
    rollno INT,
    course VARCHAR(50),
    PRIMARY KEY (rollno, course),
    FOREIGN KEY (rollno) REFERENCES student(rollno)
);

INSERT INTO enrollment (rollno, course) VALUES 
(101, 'Math'),
(102, 'Physics'),
(103, 'Chemistry'),
(104, 'Biology'),
(105, 'History');

SELECT student.name, enrollment.course 
FROM student 
JOIN enrollment ON student.rollno = enrollment.rollno;

This retrieves student names and their enrolled courses.
--------------------------------------------------------------------

# Using LIKE Operator (Pattern Matching)

The LIKE operator is used to search for a specified pattern in a column.

Using % (Wildcard for Multiple Characters):

SELECT * FROM student WHERE name LIKE 'a%';

Retrieves students whose names start with 'a'.

SELECT * FROM student WHERE city LIKE '%a%';

Retrieves students from cities that contain the letter 'a'.

Using _ (Wildcard for a Single Character):

SELECT * FROM student WHERE name LIKE '_m%';

Retrieves students whose second letter is 'm'.

SELECT * FROM student WHERE grade LIKE 'A_';

Retrieves students with grades that start with 'A' and have one more character (e.g., 'A+', 'A-').

Combining % and _:

SELECT * FROM student WHERE name LIKE 'a_%_';

Retrieves students whose names start with 'a', followed by at least two characters.

# Conclusion

The SELECT statement is a powerful tool for querying databases. By using various clauses like WHERE, ORDER BY, GROUP BY, LIKE and JOIN, you can retrieve meaningful insights from your data.