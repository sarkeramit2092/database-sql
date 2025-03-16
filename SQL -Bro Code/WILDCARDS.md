
# Wildcards in SQL

In SQL, wildcards are used to represent one or more characters in a query, commonly when filtering results with the `LIKE` operator. The two main wildcards are:

1. **`%` (Percent Sign)**: Represents zero, one, or multiple characters.
2. **`_` (Underscore)**: Represents a single character.

## Example SQL Table: `employees`

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

## Wildcard Examples

### 1. Using `%` for Multiple Characters

To find employees whose first name starts with 'S', you can use the `%` wildcard to represent any number of characters after 'S':

```sql
SELECT * FROM employees
WHERE first_name LIKE 'S%';
```

This query will return all employees whose first name starts with the letter 'S', such as **Sandy** and **Spongebob**.

### 2. Using `_` for a Single Character

To find employees whose first name has exactly 4 characters and starts with 'S', you can use the `_` wildcard to represent a single character:

```sql
SELECT * FROM employees
WHERE first_name LIKE 'S___';
```

This query will return only employees whose first name is exactly 4 characters long and starts with 'S', such as **Sandy**.

### 3. Using `%` and `_` Together

You can combine `%` and `_` wildcards. For example, to find employees whose first name starts with 'S' and has a total of 6 characters:

```sql
SELECT * FROM employees
WHERE first_name LIKE 'S_____';
```

This will return only those employees whose first name is exactly 6 characters long and starts with 'S', such as **Spongebob**.

### 4. Using `%` to Match the End of a String

To find employees whose last name ends with 'pants':

```sql
SELECT * FROM employees
WHERE last_name LIKE '%pants';
```

This will return **Spongebob Squarepants** because his last name ends with "pants".

## Summary of Wildcard Usage

- **`%`**: Matches any sequence of characters (including no characters).
- **`_`**: Matches exactly one character.
