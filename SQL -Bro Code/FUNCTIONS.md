## Functions in MySQL

## Tables Overview

### Transactions Table
| transaction_id | amount | customer_id |
|---------------|--------|-------------|
| 1000         | 4.99   | 3           |
| 1001         | 2.89   | 2           |
| 1002         | 3.38   | 3           |
| 1003         | 4.99   | 1           |
| 1004         | 1.00   | NULL        |

### Customers Table
| customer_id | first_name | last_name |
|------------|------------|-----------|
| 1          | Fred       | Fish      |
| 2          | Larry      | Lobster   |
| 3          | Bubble     | Bass      |
| 4          | Poppy      | Puff      |

```sql
-- Creating Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Creating Transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE SET NULL
);
```

A `function` is a stored program that we can pass parameters into to return a value. In MySQL main website documentation has huge list of function.

```sql
SELECT COUNT (amount)
FROM transactions;

SELECT COUNT (amount) AS count
FROM transactions;

SELECT COUNT (amount) AS "today's transactions"
FROM transactions;
```

`COUNT()` function will return all of the rows within this column amount. Like: we have 5 transaction in this table.

```sql
SELECT MAX(amount) AS maximum
FROM transactions;

SELECT MIN(amount) AS minimum
FROM transactions;

SELECT AVG(amount) AS average
FROM transactions;

SELECT SUM(amount) AS sum
FROM transactions;
```

## Tables

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5,2),
    hire_date DATE
);

INSERT INTO employees (employee_id, first_name, last_name, hourly_pay, hire_date) VALUES
(5, 'Sandy', 'Cheeks', 17.25, '2023-01-06'),
(1, 'Eugene', 'Krabs', 25.50, '2023-01-02'),
(6, 'Sheldon', 'Plankton', 10.00, '2023-01-07'),
(3, 'Spongebob', 'Squarepants', 12.50, '2023-01-04'),
(4, 'Patrick', 'Star', 12.50, '2023-01-05'),
(2, 'Squidward', 'Tentacles', 15.00, '2023-01-03');
```


```sql
SELECT CONCAT (first_name, last_name) AS full_name
FROM employees;

SELECT CONCAT (first_name," ", last_name) AS full_name
FROM employees;
```


# Logical Operators: AND OR NOT

Using `logical operators` we can check more than one condition.

```sql
ALTER TABLE employees
ADD COLUMN job VARCHAR(25) AFTER hourly_pay;

UPDATE employees
SET job = "manager"
WHERE employee_id = 1;

UPDATE employees
SET job = "cashier"
WHERE employee_id = 2;

UPDATE employees
SET job = "cook"
WHERE employee_id = 3;

UPDATE employees
SET job = "cook"
WHERE employee_id = 4;

UPDATE employees
SET job = "asst. manager"
WHERE employee_id = 5;

UPDATE employees
SET job = "janitor"
WHERE employee_id = 6;
```

`job = "cook" and hiredate < "2023-01-05"`

# AND

```sql
SELECT *
FROM employees
WHERE hire_date < "2023-01-05" AND job = "cook";
```

# OR

```sql
SELECT *
FROM employees
WHERE job = "cook" or job = "cashier";
```

# NOT - little different, "NOT" basically reverses anything we say.

```sql
SELECT *
FROM employees
WHERE NOT job = "manager";

SELECT *
FROM employees
WHERE NOT job = "manager" AND NOT job = "asst. manager";
```

# BETWEEN

```sql
SELECT *
FROM employees
WHERE hire_date BETWEEN "2023-01-04" AND "2023-01-07";
```

# IN

```sql
SELECT * 
FROM employees
WHERE job IN ("cook","cashier","janitor");
```