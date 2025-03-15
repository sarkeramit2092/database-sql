-- UPDATE --

UPDATE employees
SET hourly_pay = 10.25
WHERE employee_id = 6;

-- UPDATE MULTIPLE COLUMNS --

UPDATE employees
SET hourly_pay = 10.25,
    hire_date = "2023-01-07"
WHERE employee_id = 6;

-- UPDATE employees SET hourly_pay = 10.25,     hire_date = "2023-01-07" WHERE employee_id = 6	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- Error Code: 1175, which happens because MySQL's safe update mode is enabled. This mode prevents updates or deletions that don’t explicitly reference a primary key or an indexed column in the WHERE clause.

-- Disable Safe Update Mode Temporarily

SET SQL_SAFE_UPDATES = 0;

-- Finally, re-enable safe update mode for safety:

SET SQL_SAFE_UPDATES = 1;

UPDATE employees
SET hire_date = NULL 
WHERE first_name = "Patrick";


-- Becareful -- it will effect on all of the hourly_pay rows

UPDATE employees
SET hourly_pay = 10.25;

-- Dont Do This --

DELETE FROM employees;


