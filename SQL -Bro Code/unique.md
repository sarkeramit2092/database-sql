# Unique Constraints in Databases

A **unique constraint** ensures that the values in one or more columns of a table are unique across all rows. This prevents duplicate data while allowing `NULL` values (depending on the database).

---

## 1️⃣ SQL Unique Constraint Syntax

### Creating a Unique Constraint During Table Creation
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE,  -- Ensures email is unique
    username VARCHAR(100),
    CONSTRAINT unique_username UNIQUE (username) -- Alternative way
);
```

### Adding a Unique Constraint to an Existing Table
```sql
ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);
```

### Dropping a Unique Constraint
```sql
ALTER TABLE users DROP CONSTRAINT unique_email;
```

---

## 2️⃣ Unique Constraints in Composite Keys
You can enforce uniqueness on multiple columns.
```sql
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    CONSTRAINT unique_customer_product UNIQUE (customer_id, product_id) -- Ensures a customer can't order the same product twice
);
```

---

## 3️⃣ Handling Unique Constraint Violations
If you try to insert duplicate values into a column with a unique constraint, it will cause an error:
```sql
ERROR: duplicate key value violates unique constraint "unique_email"
```

### Solutions:
- **Use `ON CONFLICT` in PostgreSQL:**
  ```sql
  INSERT INTO users (email, username)
  VALUES ('john@example.com', 'johnny')
  ON CONFLICT (email) DO NOTHING;
  ```
- **Use `IGNORE` in MySQL:**
  ```sql
  INSERT IGNORE INTO users (email, username) VALUES ('john@example.com', 'johnny');
  ```
- **Use `REPLACE` in MySQL:**
  ```sql
  REPLACE INTO users (email, username) VALUES ('john@example.com', 'johnny');
  ```


## 5️⃣ When to Use Unique Constraints?
✅ **Emails, usernames, and national ID numbers** should be unique.  
✅ **Composite unique constraints** are useful for relationships (e.g., user-product orders).  
✅ **Indexing** improves query performance but should be used carefully for write-heavy workloads.  

