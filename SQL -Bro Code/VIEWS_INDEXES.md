-- views
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

In MySQL index is a type of data structure they are used to find values within a specific column more quickly it's technically a BTree data structure. MySQL normally performs searches sequentially through a column if I'm looking for some specific value just scan each value on the way down to see if those values match depending on what I'm looking for. it doesn't really take much time if you have a small data set but imagine if you have millions of transactions searching each transaction one by one is going to take a long time. 

We can speed up that process by using an index by applying an index to a column selecting or searching takes less time. However updating takes a lot more time. 
There are some pros and cons with using an index it really depends on the table; if I'm working with a table of transactions transaction actions are being updated all the time people are constantly making purchases. I don't think our transactions table would be a good candidate for an index we'll be doing a lot of updating but not a lot of searching. 


However with our customers table I think our customers table could benefit we don't update our customers table very often only a new customer comes in every once in a while. let's reduce the time it takes to search for a customer with creating an index. We do have an index with our customer ID already a customer may give you their last name and or first name. let's create an index for these; we'll start with last name though. To show the current indexes of a table:

```sql
SHOW INDEXES FROM customers;

```
We do have one already our customer ID that is the primary key we can search for a customer by their customer ID fairly quickly but not so much by their last name or their first name. 

let's apply an index to those columns. To create an index:

```sql
CREATE INDEX last_name_idx
ON customers(last_name);

```
let's show our indexes again show indexes from customers.


```sql
SHOW INDEXES FROM customers;

SELECT * FROM customers
WHERE last_name = "Puffs";

```
My data set is already very small to begin with there's not going to be a noticeable difference in this example. But if I'm working with a million customers using an index would be a lot faster.

If I were to search by first name instead where last name; it would be slower to search for a customer by their first name compared to their last name that first name doesn't have an index.

We wouldn't search for a customer just by their first name we would do a last name or a last name and a first name that's where multi-column indexes come. Into create a multi-column index:

```sql
CREATE INDEX last_name_first_name_idx
ON customers(last_name, first_name);

SHOW INDEXES FROM customers;

```

If we would like to drop an index:

```sql
ALTER TABLE customers
DROP INDEX last_name_idx;

SHOW INDEXES FROM customers;
```
Now if I want to search for a customer select all from customers where if I were to search for a last name we would benefit by using this multi-column index if I looked for a last name and a first name we would also benefit there's a sequence we would search through any last names first because that's first in the sequence. 

```sql

SELECT * FROM customers
WHERE last_name = "Puff" AND first_name = "Poppy";

```
But if I was to search for just a first name we would not utilize this index.

```sql

SELECT * FROM customers
WHERE first_name = "Poppy";

```

# index it's a type of data structure that is used to find values more quickly within a specific column.
MySQL normally searches through a column sequentially the longer the column the more expensive the operation is going to be if you were to apply an index to a column searching and selecting a value takes less time but updating that table takes longer.
Use it if you think a table is a good candidate where you don't update it very often.