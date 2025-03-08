CREATE DATABASE db_name;

DROP DATABASE db_name;

USE db_name;

CREATE TABLE student (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT NOT NULL
);

-- 
CREATE TABLE table_name (
  column_name1 datatype constraint,
  column_name2 datatype constraint,
  column_name3 datatype constraint
);
--
INSERT INTO student VALUES (1, "Amit", 31);
INSERT INTO student VALUES (2, "Mita", 29);

SELECT * FROM student;

