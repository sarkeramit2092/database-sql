# VIEWS

-- a virtual table based on the result of an SQl statement.
-- the fields in a view are fields from one or more real tables in the database
-- they are not real tables, but can be interacted with as if they were real table

-- why not another table?
-- we dont want to repeat data.
-- if one of the employees and another employee attendance if i need to remove an employee i would need to do so in two places.
-- with the view it's always up to date. Any changes to one or more real tables will also update the view.

```sql

CREATE VIEW employee_attendance AS
SELECT first_name, last_name
FROM employees;

SELECT * FROM employee_attendance;

DROP VIEW employee_attendance;

```

# MySQL Indexes

In MySQL, an index is a type of data structure used to find values within a specific column more quickly. It is technically a BTree data structure. MySQL normally performs searches sequentially through a column. If I'm looking for a specific value, MySQL scans each value one by one to see if it matches the search criteria. This does not take much time for small datasets, but for large datasets with millions of transactions, sequential searches can be slow.

We can speed up that process by using an index. By applying an index to a column, selecting or searching takes less time. However, updating takes more time.

## Pros and Cons of Using Indexes
Indexes are beneficial in some cases but can be a drawback in others. It depends on the table:

- **Transactions Table**: Since transactions are updated frequently, an index might not be ideal because updates become slower.
- **Customers Table**: A customers table could benefit from an index because it is updated less frequently. Searching for customers would be faster.

## Viewing Indexes in a Table
To show the current indexes of a table:

```sql
SHOW INDEXES FROM customers;
```

A primary key, such as `customer_id`, is automatically indexed. Searching by `customer_id` is fast, but searching by `last_name` or `first_name` is slower if they are not indexed.

## Creating an Index
To create an index for the `last_name` column:

```sql
CREATE INDEX last_name_idx
ON customers(last_name);
```

To verify the index:

```sql
SHOW INDEXES FROM customers;

SELECT * FROM customers
WHERE last_name = "Puffs";
```

## Multi-Column Index
If we want to search by both `last_name` and `first_name`, we can create a multi-column index:

```sql
CREATE INDEX last_name_first_name_idx
ON customers(last_name, first_name);

SHOW INDEXES FROM customers;
```

### Searching with Multi-Column Index
A search that benefits from this index:

```sql
SELECT * FROM customers
WHERE last_name = "Puff" AND first_name = "Poppy";
```

However, searching only by `first_name` will not use the index effectively:

```sql
SELECT * FROM customers
WHERE first_name = "Poppy";
```

## Dropping an Index
To drop an index:

```sql
ALTER TABLE customers
DROP INDEX last_name_idx;

SHOW INDEXES FROM customers;
```

## Summary
- **Indexes improve search performance but slow down updates.**
- **Use indexes for columns that are searched frequently but updated infrequently.**
- **Multi-column indexes can optimize searches involving multiple columns.**
- **Understanding the sequence of indexed columns is crucial for query optimization.**

# index it's a type of data structure that is used to find values more quickly within a specific column.
MySQL normally searches through a column sequentially the longer the column the more expensive the operation is going to be if you were to apply an index to a column searching and selecting a value takes less time but updating that table takes longer.
Use it if you think a table is a good candidate where you don't update it very often.