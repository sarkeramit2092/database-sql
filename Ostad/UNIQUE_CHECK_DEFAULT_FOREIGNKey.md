## 1. Unique Constraint

**Issue: Duplicate Entries**

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    email VARCHAR(100),
    name VARCHAR(100)
);

INSERT INTO employees (emp_id, email, name) 
VALUES (1, 'rahim@gmail.com', 'Rahim');

INSERT INTO employees (emp_id, email, name) 
VALUES (2, 'rahim@gmail.com', 'Rahim');

SELECT * FROM employees;
```

🔹 **Problem:** The same email address (`rahim@gmail.com`) is inserted twice. This is not a good practice as email should be unique.

**Solution: Add UNIQUE Constraint**

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    name VARCHAR(100)
);
```

🔹 **Fix:** The `UNIQUE` constraint ensures that duplicate emails cannot be inserted into the table.

## 2. Default Constraint

```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    stock INT DEFAULT 10
);

INSERT INTO products (product_id, name) 
VALUES (1, 'laptop');

SELECT * FROM products;
```

🔹 **Explanation:**

- The `DEFAULT 10` constraint ensures that if the `stock` column is not explicitly specified during `INSERT`, it will take the default value of 10.

🔹 **Result:**

| product_id | name   | stock |
|------------|--------|-------|
| 1          | laptop | 10    |

## 3. Check Constraint

```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    stock INT CHECK(stock > 0)
);

INSERT INTO products (product_id, name, stock) 
VALUES (1, 'laptop', 10);  -- ✅ Valid

INSERT INTO products (product_id, name, stock) 
VALUES (2, 'laptop', 0);   -- ❌ ERROR: CHECK constraint fails
```

🔹 **Explanation:**

- The `CHECK(stock > 0)` constraint ensures that the `stock` value cannot be zero or negative.

## 4. Foreign Key Constraint

A **foreign key** is used when you need to establish a relationship between two tables to ensure **referential integrity**. It enforces that values in a column (or a set of columns) in one table must match values in the primary key column of another table.

### ✅ **Where to Use a Foreign Key?**

#### One-to-Many Relationships (Most Common)

**Example: An employee belongs to a department**  
The `employees` table should reference the `departments` table.

```sql
CREATE TABLE departments (
    depart_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    depart_id INT,
    FOREIGN KEY (depart_id) REFERENCES departments(depart_id)
);
```
- Here, `depart_id` in `employees` must match an existing `depart_id` in `departments`.
- If you try to insert an employee with a `depart_id` that does not exist in `departments`, it will **fail**.

#### Many-to-Many Relationships

**Example: Students enrolled in multiple courses**  
A junction table (`enrollments`) is needed.

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(100)
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```
- A student can enroll in multiple courses, and a course can have multiple students.
- The `enrollments` table enforces that both `student_id` and `course_id` must exist in their respective tables.

#### Cascading Delete or Update

**Example: Deleting a department removes its employees**  
Use `ON DELETE CASCADE` to automatically remove employees when a department is deleted.

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    depart_id INT,
    FOREIGN KEY (depart_id) REFERENCES departments(depart_id) ON DELETE CASCADE
);
```
- If a department is deleted, all employees in that department are also **deleted** automatically.

### ❌ **Where NOT to Use a Foreign Key**
- **When you don't need strict relationships** (e.g., logging or temporary tables).
- **When working with distributed databases** (foreign keys can slow performance).
- **When using NoSQL databases** (which don't enforce foreign keys).

## Summary

- **Unique Constraint:** Prevents duplicate values (e.g., email in employees).
- **Default Constraint:** Provides a default value when none is specified (e.g., stock in products).
- **Check Constraint:** Ensures column values meet a condition (e.g., stock > 0).
- **Foreign Key Constraint:** Links tables to maintain referential integrity.