-- database exactly think of it as a folder. it acts as a container tables. on the other hand would be the files found within the folder. --

CREATE DATABASE myDB;
USE myDB;
DROP DATABASE myDB;

CREATE DATABASE myDB;
USE myDB;
ALTER DATABASE myDB READ ONLY =1; -- read only protection --
DROP DATABASE myDB; -- we may get error --

ALTER DATABASE myDB READ ONLY =1; -- disable read only mode --
DROP DATABASE myDB; -- myDB will be deleted --


-- create table -- 

CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2), 
    hire_date DATE
);
-- DECIMAL(5,2) means a total of 5 digits, with 2 after the decimal (XX.XX).
-- The maximum possible value is 999.99. --

-- shows columns --
SELECT * FROM employees;

-- rename --
RENAME TABLE employees to workers;

-- delete --
DROP TABLE employees;

-- ALTER TABLE --
-- In SQL, ALTER is a command used to modify an existing database object, such as a table, column, or index--

ALTER TABLE employees
ADD phone_number VARCHAR(15);

--- Common Uses of ALTER TABLE ---  
-- Add a column

ALTER TABLE employees ADD email VARCHAR(50);

-- Modify a column (change data type, constraints, etc.)

ALTER TABLE employees MODIFY COLUMN phone_number VARCHAR(20);

-- Rename a column

ALTER TABLE employees RENAME COLUMN phone_number TO contact_number;

-- Change position

ALTER TABLE employees MODIFY email VARCHAR(20) AFTER last_name;

-- Drop (delete) a column

ALTER TABLE employees DROP COLUMN phone_number;

-- Rename a table

ALTER TABLE employees RENAME TO staff;


--- ROWS ---

-- INSERT ROWS --

INSERT INTO employees
value(
    1,
    "Eugene",
    "Krabs",
    25.65,
    "2025-02-02"
);

SELECT * FROM employees;

INSERT INTO employees VALUES
(1, "Eugene", "Krabs", "eugene.krabs@gmail.com", 24.04, "2023-06-15"),
(2, "SpongeBob", "SquarePants", "spongebob@gmail.com", 12.02, "2021-09-01"),
(3, "Patrick", "Star", "patrick.star@gmail.com", 9.62, "2022-04-10"),
(4, "Squidward", "Tentacles", "squidward@gmail.com", 14.42, "2020-02-20"),
(5, "Sandy", "Cheeks", "sandy.cheeks@gmail.com", 19.23, "2021-11-25");

INSERT INTO employees (employee_id, first_name, last_name)
VALUES(6, "Sheldon", "Palankton")

-- SELECT --

SELECT last_name, first_name
FROM employees;

SELECT *
FROM employees
WHERE employee_id = 3;

SELECT *
FROM employees
WHERE last_name = "Cheeks";

SELECT *
FROM employees
WHERE hourly_pay >= 10;

SELECT *
FROM employees
WHERE employee_id != 3;

