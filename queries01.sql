Creating a Database:

CREATE DATABASE db_name;
# CREATE DATABASE IF NOT EXISTS db_name;
Example: CREATE DATABASE IF NOT EXISTS college; (Highlighted in blue)
Dropping a Database:

DROP DATABASE db_name; (The word DROP is underlined in red)
# DROP DATABASE IF EXISTS db_name;
Showing Databases and Tables:

SHOW DATABASES;
SHOW TABLES;
-------------------------------------------------------------------------

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

