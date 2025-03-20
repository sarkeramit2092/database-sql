# SQL Concepts: LIMIT, UNION, and SELF JOIN

## 1. LIMIT Clause
The `LIMIT` clause is used to restrict the number of records returned by a query. It is useful for working with large datasets, especially in pagination.

### Example Table: `customers`

| customer_id | first_name | last_name |
|------------|------------|------------|
| 1          | Fred       | Fish       |
| 2          | Larry      | Lobster    |
| 3          | Bubble     | Bass       |
| 4          | Poppy      | Puff       |
| 5          | Sandy      | Cheeks     |
| 6          | Squidward  | Tentacles  |
| 7          | Patrick    | Star       |
| 8          | Eugene     | Krabs      |
| 9          | Sheldon    | Plankton   |
| 10         | Karen      | Plankton   |

### Basic Usage
Retrieve only the first two rows:
```sql
SELECT * FROM customers
LIMIT 2;
```
**Output:**
| customer_id | first_name | last_name |
|------------|------------|------------|
| 1          | Fred       | Fish       |
| 2          | Larry      | Lobster    |

### Sorting with LIMIT
Retrieve the last customer (by `last_name` in descending order):
```sql
SELECT * FROM customers
ORDER BY last_name DESC LIMIT 1;
```

### Pagination Example
Retrieve records for the second page (assuming 5 records per page):
```sql
SELECT * FROM customers
LIMIT 5 OFFSET 5;
```

## 2. UNION Operator
The `UNION` operator combines the results of two or more `SELECT` statements. The number of columns and data types must match in both queries.

### Example Tables: `employees` and `customers`

#### `employees` Table
| employee_id | first_name | last_name  |
|------------|------------|------------|
| 101        | SpongeBob  | SquarePants |
| 102        | Pearl      | Krabs      |
| 103        | Mrs.       | Puff       |
| 104        | Man Ray    | Villain    |

#### UNION Example
Retrieve a list of all people (both employees and customers):
```sql
SELECT first_name, last_name FROM employees
UNION
SELECT first_name, last_name FROM customers;
```
**Output:** (Unique results only)
| first_name  | last_name  |
|------------|------------|
| SpongeBob  | SquarePants |
| Pearl      | Krabs      |
| Mrs.       | Puff       |
| Man Ray    | Villain    |
| Fred       | Fish       |
| Larry      | Lobster    |
| Bubble     | Bass       |
| Poppy      | Puff       |
| Sandy      | Cheeks     |

#### UNION ALL Example
Includes duplicate records:
```sql
SELECT first_name, last_name FROM employees
UNION ALL
SELECT first_name, last_name FROM customers;
```

## 3. SELF JOIN
A `SELF JOIN` is a join of a table to itself. It is commonly used to represent hierarchical relationships.

### Example Table: `customers` (with `referral_id`)
| customer_id | first_name | last_name  | referral_id |
|------------|------------|------------|------------|
| 1          | Fred       | Fish       | NULL       |
| 2          | Larry      | Lobster    | 1          |
| 3          | Bubble     | Bass       | 1          |
| 4          | Poppy      | Puff       | 2          |
| 5          | Sandy      | Cheeks     | 3          |

### SELF JOIN Query
Find customers who were referred by another customer:
```sql
SELECT a.first_name AS Referrer, b.first_name AS Referred_Customer
FROM customers AS a
INNER JOIN customers AS b
ON a.customer_id = b.referral_id;
```
**Output:**
| Referrer   | Referred_Customer |
|------------|------------------|
| Fred       | Larry            |
| Fred       | Bubble           |
| Larry      | Poppy            |
| Bubble     | Sandy            |

---

## Practical

```sql
-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    referral_id INT NULL
);

-- Insert data into customers table
INSERT INTO customers (customer_id, first_name, last_name, referral_id) VALUES
(1, 'Fred', 'Fish', NULL),
(2, 'Larry', 'Lobster', 1),
(3, 'Bubble', 'Bass', 1),
(4, 'Poppy', 'Puff', 2),
(5, 'Sandy', 'Cheeks', 3),
(6, 'Squidward', 'Tentacles', NULL),
(7, 'Patrick', 'Star', NULL),
(8, 'Eugene', 'Krabs', NULL),
(9, 'Sheldon', 'Plankton', NULL),
(10, 'Karen', 'Plankton', NULL);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Insert data into employees table
INSERT INTO employees (employee_id, first_name, last_name) VALUES
(101, 'SpongeBob', 'SquarePants'),
(102, 'Pearl', 'Krabs'),
(103, 'Mrs.', 'Puff'),
(104, 'Man Ray', 'Villain');
```

-- Now you can run the following queries for practice:

1. Using LIMIT:

```sql
SELECT * FROM customers LIMIT 2;
SELECT * FROM customers ORDER BY last_name DESC LIMIT 1;
SELECT * FROM customers LIMIT 5 OFFSET 5;
```
2. Using UNION:

```sql
SELECT first_name, last_name FROM employees
UNION
SELECT first_name, last_name FROM customers;
```
3. Using UNION ALL (includes duplicates):

```sql

SELECT first_name, last_name FROM employees
UNION ALL
SELECT first_name, last_name FROM customers;
```
4. Using SELF JOIN:

```sql

SELECT a.first_name AS Referrer, b.first_name AS Referred_Customer
FROM customers AS a
INNER JOIN customers AS b
ON a.customer_id = b.referral_id;

```