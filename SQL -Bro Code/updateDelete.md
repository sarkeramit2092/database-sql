# SQL: UPDATE, DELETE, AUTOCOMMIT, COMMIT, ROLLBACK

## UPDATE Statement
The `UPDATE` statement is used to modify existing records in a table.

### Syntax:
```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

### Example:
Increase Squidward's hourly pay to 16.50:
```sql
UPDATE employees
SET hourly_pay = 16.50
WHERE first_name = "Squidward" AND last_name = "Tentacles";
```

### Updating Multiple Rows:
Increase everyone's salary by 10%:
```sql
UPDATE employees
SET hourly_pay = hourly_pay * 1.10;
```

## DELETE Statement
The `DELETE` statement removes records from a table.

### Syntax:
```sql
DELETE FROM table_name
WHERE condition;
```

### Example:
Remove Patrick Star from the table:
```sql
DELETE FROM employees
WHERE first_name = "Patrick" AND last_name = "Star";
```

### Deleting Multiple Records:
Remove employees hired before 2022:
```sql
DELETE FROM employees
WHERE hire_date < "2022-01-01";
```

### Delete All Records:
```sql
DELETE FROM employees;  -- Keeps table structure
```
```sql
TRUNCATE TABLE employees;  -- Removes all rows and resets auto-increment
```

## AUTOCOMMIT
By default, most SQL databases use `AUTOCOMMIT`, meaning changes are automatically saved.

### Check AUTOCOMMIT status:
```sql
SELECT @@autocommit;
```

### Disable AUTOCOMMIT (Manual Transactions):
```sql
SET AUTOCOMMIT = 0;
```

## COMMIT & ROLLBACK
- **COMMIT**: Saves all changes made during a transaction.
- **ROLLBACK**: Undoes all changes made during a transaction.

### Using Transactions:
```sql
START TRANSACTION;
UPDATE employees SET hourly_pay = 20.00 WHERE first_name = "Sandy";
DELETE FROM employees WHERE first_name = "Patrick";
COMMIT;  -- Saves changes permanently
```

### Undo Changes (ROLLBACK):
```sql
START TRANSACTION;
DELETE FROM employees WHERE first_name = "Patrick";
ROLLBACK;  -- Patrick is restored
```

### Checking Engine Support for Transactions
Not all databases support `ROLLBACK`. Run this command to check:
```sql
SHOW TABLE STATUS WHERE Name = 'employees';
```
If `Engine = InnoDB`, transactions are supported. If `Engine = MyISAM`, transactions are **not supported**.

## Summary Table
| Command   | Purpose |
|-----------|---------|
| `UPDATE` | Modify existing data |
| `DELETE` | Remove records |
| `AUTOCOMMIT` | Enable/Disable automatic commit |
| `COMMIT` | Save transaction changes permanently |
| `ROLLBACK` | Undo transaction changes |

---
**Note:** Always use `WHERE` conditions in `UPDATE` and `DELETE` statements to prevent modifying all records by mistake!

