# SQL Constraints: CHECK, DEFAULT, PRIMARY KEY, FOREIGN KEY

## 1. CHECK Constraint
The `CHECK` constraint ensures that column values meet specific conditions.

### Example:
```sql
CREATE TABLE worker (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE,
    CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00)
);
```
### Explanation:
- `chk_hourly_pay` ensures `hourly_pay` cannot be less than `10.00`.

---

## 2. DEFAULT Constraint
The `DEFAULT` constraint assigns a default value to a column if no value is provided during an insert.

### Example:
```sql
CREATE TABLE worker (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2) DEFAULT 15.00,
    hire_date DATE DEFAULT CURRENT_DATE
);

ALTER TABLE worker
ALTER hourly_pay SET DEFAULT 15.00;

INSERT INTO worker (employee_id, first_name, last_name) 
VALUES 
(2, 'Alice', 'Smith'),
(3, 'Bob', 'Johnson'),
(4, 'Emma', 'Williams'),
(5, 'Michael', 'Brown');

```
### Explanation:
- `hourly_pay` defaults to `15.00` if no value is given.
- `hire_date` defaults to the current date.

### Another Example:
```sql
CREATE TABLE transactions (
    transaction_id INT;
    amount DECIMAL(5,2),
    transaction_time DATETIME DEFAULT NOW()
);

INSERT INTO transactions (transaction_id, amount)
VALUES (1, 4.99);
```
---

## 3. PRIMARY KEY Constraint
The `PRIMARY KEY` constraint uniquely identifies each record in a table.

### Example:
```sql
CREATE TABLE worker (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE
);

ALTER TABLE worker
ADD CONSTRAINT
PRIMARY KEY (employee_id);
```
### Explanation:
- `employee_id` is the **PRIMARY KEY**, meaning:
  - It must be unique.
  - It cannot be `NULL`.
  - A table have only one PRIMARY KEY.

---

## 4. FOREIGN KEY Constraint
The `FOREIGN KEY` constraint ensures referential integrity between two tables.

### Example:
```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE worker (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2) DEFAULT 15.00,
    hire_date DATE DEFAULT CURRENT_DATE,
    department_id INT,
    CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00),
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```
### Explanation:
- `department_id` in `worker` references `department_id` in `departments`.
- This ensures workers are assigned only to valid departments.

---

## 5. Combining All Constraints
We can use `CHECK`, `DEFAULT`, `PRIMARY KEY`, and `FOREIGN KEY` together.

### Example:
```sql
CREATE TABLE worker (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2) DEFAULT 15.00,
    hire_date DATE DEFAULT CURRENT_DATE,
    department_id INT,
    CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00),
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```

### Key Takeaways:
1. **`PRIMARY KEY`** ensures uniqueness of `employee_id`.
2. **`CHECK`** ensures `hourly_pay` is at least `10.00`.
3. **`DEFAULT`** assigns values when none are provided.
4. **`FOREIGN KEY`** ensures referential integrity between `worker` and `departments`.



