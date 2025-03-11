# Arithmetic Operators

+ (Addition)
- (Subtraction)
* (Multiplication)
/ (Division)
% (Modulus - remainder after division)

Example:
SELECT * FROM employees WHERE salary + 5000 > 60000;

# Comparison Operators

= (Equal to)
!= (Not equal to)
> (Greater than)
>= (Greater than or equal to)
< (Less than)
<= (Less than or equal to)

Example:
SELECT * FROM employees WHERE age >= 30;

# Logical Operators

AND (Both conditions must be true)
OR (Either condition can be true)
NOT (Negates the condition)
IN (Matches a value from a list)
BETWEEN (Checks if a value is within a range)
ALL (Compares a value with all values in a subquery)
LIKE (Pattern matching using % and _)
ANY (Compares a value with any value in a subquery)

Examples:
SELECT * FROM customers WHERE city = 'New York' AND age > 25;
SELECT * FROM products WHERE price BETWEEN 100 AND 500;
SELECT * FROM users WHERE name LIKE 'A%';  -- Names starting with 'A'

# Bitwise Operators

& (Bitwise AND)
| (Bitwise OR)

Example:
SELECT * FROM users WHERE permissions & 1 = 1;

## SQL WHERE Clause Examples

### 1. **Comparison Operators**
- Find students who scored more than 80 marks:
  ```sql
  SELECT * FROM student WHERE marks > 80;
  ```
  **Output:**
  ```
  rollno | name  | marks | grade | city  
  -------+-------+-------+-------+-------
  101    | amit  | 82    | A     | Dhaka
  102    | shuvo | 90    | A     | Khulna
  103    | mita  | 95    | A     | Dhaka
  ```

- Find students who are from Dhaka:
  ```sql
  SELECT * FROM student WHERE city = 'Dhaka';
  ```
  **Output:**
  ```
  rollno | name  | marks | grade | city  
  -------+-------+-------+-------+-------
  101    | amit  | 82    | A     | Dhaka
  103    | mita  | 95    | A     | Dhaka
  ```

### 2. **Logical Operators**
- Find students who are from Dhaka **AND** have more than 80 marks:
  ```sql
  SELECT * FROM student WHERE city = 'Dhaka' AND marks > 80;
  ```
  **Output:**
  ```
  rollno | name  | marks | grade | city  
  -------+-------+-------+-------+-------
  103    | mita  | 95    | A     | Dhaka
  ```

- Find students who are from Dhaka **OR** Kolkata:
  ```sql
  SELECT * FROM student WHERE city = 'Dhaka' OR city = 'Kolkata';
  ```
  **Output:**
  ```
  rollno | name  | marks | grade | city  
  -------+-------+-------+-------+-------
  101    | amit  | 82    | A     | Dhaka
  103    | mita  | 95    | A     | Dhaka
  104    | bob   | 70    | A     | Kolkata
  ```

### 3. **IN Operator**
- Find students who are from `Dhaka`, `Khulna`, or `Barisal`:
  ```sql
  SELECT * FROM student WHERE city IN ('Dhaka', 'Khulna', 'Barisal');
  ```
  **Output:**
  ```
  rollno | name  | marks | grade | city  
  -------+-------+-------+-------+-------
  101    | amit  | 82    | A     | Dhaka
  102    | shuvo | 90    | A     | Khulna
  103    | mita  | 95    | A     | Dhaka
  105    | babu  | 65    | B     | Barisal
  ```

### 4. **BETWEEN Operator**
- Find students who scored between 70 and 90 marks:
  ```sql
  SELECT * FROM student WHERE marks BETWEEN 70 AND 90;
  ```
  **Output:**
  ```
  rollno | name  | marks | grade | city  
  -------+-------+-------+-------+-------
  101    | amit  | 82    | A     | Dhaka
  104    | bob   | 70    | A     | Kolkata
  ```

### 5. **LIKE Operator**
- Find students whose name starts with 'b':
  ```sql
  SELECT * FROM student WHERE name LIKE 'b%';
  ```
  **Output:**
  ```
  rollno | name  | marks | grade | city  
  -------+-------+-------+-------+-------
  104    | bob   | 70    | A     | Kolkata
  105    | babu  | 65    | B     | Barisal
  ```

- Find students whose name contains 'it':
  ```sql
  SELECT * FROM student WHERE name LIKE '%it%';
  ```
  **Output:**
  ```
  rollno | name  | marks | grade | city  
  -------+-------+-------+-------+-------
  103    | mita  | 95    | A     | Dhaka
  


### 6. Order by Clause
- To sort in ascending (ASC) or descending order (DESC)

```sql
    SELECT * FROM student ORDER BY city ASC;



