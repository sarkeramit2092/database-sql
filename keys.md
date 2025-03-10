# KEYS

Keys in SQL are used to uniquely identify records in a table and establish relationships between tables.

![keys](image-8.png)

# Primary Key
A Primary Key is a column (or a combination of columns) that uniquely identifies each record in a table.

Characteristics of a Primary Key:
✔️ Unique – No two rows can have the same value in the primary key column.
✔️ Not Null – Cannot contain NULL values.
✔️ Only One – Each table can have only one primary key.
✔️ Automatically Indexed – Improves search performance.

Example: Creating a Table with a Primary Key

CREATE TABLE students (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);
rollno is the primary key, ensuring each student has a unique roll number.

# Foreign Key
A Foreign Key is a column that establishes a link between two tables by referencing the Primary Key of another table.

Characteristics of a Foreign Key:
✔️ Maintains Referential Integrity – Ensures data consistency between related tables.
✔️ Allows Duplicates – Unlike primary keys, foreign keys can have duplicate values.
✔️ Can be NULL – Foreign key columns may contain NULL values if the relationship is optional.
✔️ Can be multiple FKs.

Example: Creating a Foreign Key Relationship

CREATE TABLE students (
    rollno INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    student_rollno INT,
    FOREIGN KEY (student_rollno) REFERENCES students(rollno)
);

student_rollno in the courses table is a foreign key that references the rollno column in the students table.
This enforces that every student_rollno in courses must exist in students.


