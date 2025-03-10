# SQL Constraints 🚀

Constraints in SQL are rules applied to table columns to enforce data integrity and prevent invalid data entry. They ensure accuracy and reliability in a database.

# Types of SQL Constraints

PRIMARY KEY	    >> Ensures uniqueness and prevents NULL values in a column.
FOREIGN KEY	    >> Establishes a relationship between two tables, maintaining referential integrity.
NOT NULL	    >> Ensures that a column cannot have NULL values.
UNIQUE	        >> Ensures that all values in a column are different.
CHECK	        >> Defines a condition that data in a column must satisfy.
DEFAULT     	>> Assigns a default value to a column if no value is provided.
AUTO_INCREMENT	>>Automatically generates a unique number for each new row (MySQL).

1. PRIMARY KEY Constraint
A PRIMARY KEY uniquely identifies each record in a table.
It cannot be NULL and must be unique.
A table can have only one primary key but can consist of multiple columns (Composite Key).
✅ Example: Creating a Primary Key

CREATE TABLE students (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);
rollno is the primary key, ensuring unique student records.

When a primary key consists of multiple columns, it's called a ## Composite Key ##. This ensures that the combination of values in those columns is unique for each row.

✅ Example: Creating a Composite Primary Key

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id)
);
Explanation:
The student_id and course_id together form the Composite Primary Key.
A student can enroll in multiple courses, and a course can have multiple students.
The combination of student_id and course_id must be unique, ensuring that the same student cannot enroll in the same course multiple times.

2. FOREIGN KEY Constraint
A FOREIGN KEY creates a relationship between two tables.
It references a PRIMARY KEY in another table.
Ensures referential integrity.
✅ Example: Creating a Foreign Key

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
The student_rollno in courses is a FOREIGN KEY referencing rollno in students.

3. NOT NULL Constraint
Ensures that a column cannot contain NULL values.
✅ Example: Applying NOT NULL

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL
);
name and department must have values.

4. UNIQUE Constraint
Ensures that all values in a column are different.
Unlike PRIMARY KEY, a table can have multiple UNIQUE constraints.
✅ Example: Applying UNIQUE

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE
);
email and phone must have unique values.

5. CHECK Constraint
Ensures that column values meet a specified condition.
✅ Example: Applying CHECK

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT CHECK (age >= 18),
    salary DECIMAL(10,2) CHECK (salary > 1000)
);
age must be 18 or above.
salary must be greater than 1000.

6. DEFAULT Constraint
Assigns a default value to a column if no value is provided.
✅ Example: Applying DEFAULT

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    status VARCHAR(20) DEFAULT 'Pending',
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

If no value is provided for status, it defaults to 'Pending'.
order_date automatically stores the current timestamp.

7. AUTO_INCREMENT (MySQL, PostgreSQL)
Automatically increments the value of a column for each new row.
Typically used for PRIMARY KEY columns.
✅ Example: Applying AUTO_INCREMENT

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

Each new product gets an auto-incremented product_id.
Modifying Constraints in an Existing Table

# Adding a Constraint:

ALTER TABLE students ADD CONSTRAINT chk_age CHECK (age >= 18);

# Dropping a Constraint:

ALTER TABLE students DROP CONSTRAINT chk_age;
