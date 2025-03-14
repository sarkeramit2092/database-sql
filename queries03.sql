SELECT column(s)
FROM table_name
WHERE condition
GROUP BY columns
HAVING condition
ORDER BY columns(s) ASC;

SELECT avg(marks)
FROM student
GROUP BY city;


SELECT city, count(rollno)
FROM student
GROUP BY city
HAVING max(marks)>90;