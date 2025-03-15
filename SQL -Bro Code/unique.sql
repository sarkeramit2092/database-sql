-- The unique constraint ensures all values in a column are all different.

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(25) UNIQUE,
    price DECIMAL(4,2)
);

-- If we alredy create the table

ALTER TABLE products
ADD CONSTRAINT 
UNIQUE(product_name);

-- INSERT INTO VALUES

INSERT INTO products (product_id, product_name, price) 
VALUES 
(1, 'Laptop', 99.99),
(2, 'Smartphone', 49.49),
(3, 'Headphones', 89.99),
(4, 'Smartwatch', 69.99),
(5, 'Keyboard', 29.99);

-- If we try to insert a row with a duplicate product_name (since the product_name column is unique), it will result in an ERROR.

INSERT INTO products (product_id, product_name, price) 
VALUES 
(6, 'Laptop', 99.99);  -- This will cause an error because 'Laptop' already exists in the table.


