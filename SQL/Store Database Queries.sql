
-- Store Database:
-- Various Queries:


-- DB: Store
-- Table: customers
-- Display the null values in the 'address2' column as "No Address" in the 'customers' table.

SELECT COALESCE(address2, 'No Address') AS address FROM customers;

-- DB: Store
-- Table: customers
-- Retrieve all records from the 'customers' table where 'address2' is not null.

SELECT * FROM customers WHERE address2 IS NOT NULL;

-- DB: Store
-- Table: customers
-- Retrieve records from the 'customers' table, displaying 'lastName' as 'Empty' when 'age' is NULL.

SELECT COALESCE(lastName, 'Empty') AS lastName, * FROM customers WHERE age IS NULL;

-- Database: Store
-- Table: products
-- Create a 'price class' column in the 'products' table based on the product price.
SELECT prod_id, title, price,
    CASE
        WHEN price > 20 THEN 'expensive'
        WHEN price <= 10 THEN 'cheap'
        WHEN price BETWEEN 10 AND 20 THEN 'average'
    END AS "price class"
FROM products;

-- DB: Store
-- Table: orders
-- How many orders were made in January 2004?

SELECT COUNT(orderid) AS january_orders
FROM orders
WHERE DATE_TRUNC('month', orderdate) = DATE '2004-01-01';

