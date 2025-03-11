CREATE DATABASE IF NOT EXISTS college;

USE college;

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101,"amit",82,"A","Dhaka"),
(102,"shuvo",90,"A","Khulna"),
(103,"mita",95,"A","Dhaka"),
(104,"bob",70,"A","Kolkata"),
(105,"babu",65,"B","Barisal");

SELECT name, marks FROM student;

SELECT DISTINCT city FROM student;

SELECT * from student WHERE marks >80;
SELECT * FROM student where city = "Kolkata";

SELECT * 
FROM student
WHERE marks > 80 AND city = "Dhaka";



