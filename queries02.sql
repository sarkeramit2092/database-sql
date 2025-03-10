# General Syntax for Creating a Table:

CREATE TABLE table_name (
    column_name1 datatype constraint,
    column_name2 datatype constraint,
);

This defines the table schema, specifying column names, data types, and constraints.
Example: Creating a Student Table:

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50)
);

1. rollno INT PRIMARY KEY; Primary Key ensures the column is:
Not Null (cannot have NULL values)
Unique (no duplicate values allowed)

2. name VARCHAR(50) defines a column to store student names with a max length of 50 characters.

# Additional Notes:

1. Schema (design): The table structure is referred to as the schema.
2. Constraints:
    Primary Key is both unique and not null.
    Data types define the kind of values stored in each column.


# Select and View all columns

SELECT * FROM table_name;

# INSERT

INSERT INTO table_name
(column_name1,column_name2)
VALUES
(column_value1,column_value2);

INSERT INTO student
(rollno, name)
VALUES
(101,"mita"),
(102,"amit");

INSERT INTO student VALUES (103, "suvra")  #short_form

