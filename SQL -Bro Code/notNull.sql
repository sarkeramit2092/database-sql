CREATE TABLE products(
    product_id INT,
    product_name VARCHAR (25),
    price DECIMAL (4,2) NOT NULL
);

-- As We already have the table

ALTER TABLE products
MODIFY price DECIMAL(4,2) NOT NULL;

INSERT INTO products
VALUES(104,"mouse", NULL);

-- INSERT INTO products VALUES(104,"mouse", NULL)	Error Code: 1048. Column 'price' cannot be null.
-- EVEN 0 "ZERO" is acceptable but it have to be a value except NULL.