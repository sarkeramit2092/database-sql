# Subqueries in SQL

## What is a Subquery?
A **subquery** (or **nested query**) is a query within another SQL query. The inner query is executed first, and its result is used by the outer query.

### Syntax:
```sql
SELECT column_name(s)
FROM table_name
WHERE column_name OPERATOR (
    SELECT column_name FROM table_name WHERE condition
);
```

## Example 1: Employees with Salary Greater than the Average Salary
### Problem Statement:
List all employees whose salary is greater than the average salary of all employees.

### Steps:
1. Calculate the average salary:
   ```sql
   SELECT avg(salary) FROM employees;
   ```
2. Use the subquery to filter employees:
   ```sql
   SELECT name, salary FROM employees 
   WHERE salary > (SELECT avg(salary) FROM employees);
   ```

### Explanation:
- The subquery `(SELECT avg(salary) FROM employees)` calculates the average salary.
- The outer query selects employees whose salary is greater than the computed average.

---

## Example 2: Finding Employees in the Same Department as a Specific Employee
### Problem Statement:
Find all employees who belong to the same department as "Fahim".

### Steps:
1. Find Fahim's department:
   ```sql
   SELECT depart FROM employees WHERE name = 'fahim';
   ```
2. List all employees in the same department:
   ```sql
   SELECT name, depart FROM employees 
   WHERE depart = (SELECT depart FROM employees WHERE name = 'fahim');
   ```

### Explanation:
- The subquery `(SELECT depart FROM employees WHERE name = 'fahim')` retrieves **Fahim's** department.
- The outer query selects all employees in that department.

---

## Example 3: Find Employees Earning More than a Specific Employee
### Problem Statement:
Retrieve employees who earn more than "Rahim".

### Steps:
1. Find Rahim's salary:
   ```sql
   SELECT salary FROM employees WHERE name = 'Rahim';
   ```
2. List employees earning more than Rahim:
   ```sql
   SELECT name, salary FROM employees 
   WHERE salary > (SELECT salary FROM employees WHERE name = 'Rahim');
   ```

### Explanation:
- The subquery retrieves **Rahim's salary**.
- The outer query lists employees earning more than that amount.

---

## Example 4: Employees in Departments with More than 2 Employees
### Problem Statement:
Find departments that have more than 2 employees and list the employees in those departments.

### Steps:
1. Identify departments with more than 2 employees:
   ```sql
   SELECT depart FROM employees GROUP BY depart HAVING COUNT(*) > 2;
   ```
2. Retrieve employees in those departments:
   ```sql
   SELECT name, depart FROM employees 
   WHERE depart IN (SELECT depart FROM employees GROUP BY depart HAVING COUNT(*) > 2);
   ```

### Explanation:
- The subquery finds departments where the employee count is greater than 2.
- The outer query selects employees in those departments.

---

## Key Points:
- Subqueries execute first and pass their results to the main query.
- They can be used in `WHERE`, `HAVING`, and `FROM` clauses.
- Subqueries should return a single value when used with comparison operators (`=, >, <, >=, <=`).

### **Practice Questions:**
1. Find employees earning the highest salary.
2. Retrieve employees who earn more than "Rahim".
3. List employees who work in the same department as "Karim".
4. Find employees who earn less than the department average salary.
5. List departments where the average salary is greater than 1500.


