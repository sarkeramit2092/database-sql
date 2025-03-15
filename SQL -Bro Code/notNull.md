
# Database Schema: `products`

In this example, we will explain how to add a **NOT NULL** constraint to a column in the `products` table. The table stores information about various products, including `product_id`, `product_name`, and `price`.

### Sample Data Insert

```sql
INSERT INTO products (product_id, product_name, price) 
VALUES 
(1, 'Laptop', 99.99),
(2, 'Smartphone', 49.49),
(3, 'Headphones', 89.99),
(4, 'Smartwatch', 69.99),
(5, 'Keyboard', 29.99);
```

### Add `NOT NULL` Constraint

To ensure that a column does not accept `NULL` values, you can apply a **NOT NULL** constraint. For example, if we want to ensure that the `product_name` column always has a value, we can modify the table structure as follows:

```sql
ALTER TABLE products
MODIFY COLUMN product_name VARCHAR(255) NOT NULL;
```

This command will update the `product_name` column to ensure that no `NULL` values are inserted into it in the future. This constraint will help maintain data integrity by preventing missing product names.
