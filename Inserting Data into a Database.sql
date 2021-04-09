-- Lesson 3: Inserting Data into a Database

-- DDL Commands ---

-- CREATE table named products
CREATE TABLE IF NOT EXISTS products
(
	product_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(20) NOT NULL,
	product_price DECIMAL(9,2) NOT NULL,
	product_type VARCHAR(15) NOT NULL,
	product_color VARCHAR(10) NOT NULL,
	product_size VARCHAR(10) NOT NULL,
	product_origin VARCHAR(20) NOT NULL,
	product_quantity SMALLINT NOT NULL
)

-- ALTER command
-- Adds a column to the products table 
ALTER TABLE products 
ADD COLUMN product_purchase_date VARCHAR(10)

-- Removes a column from the products table
ALTER TABLE products 
DROP COLUMN product_purchase_date

-- Renames a column in the products table
ALTER TABLE products 
RENAME COLUMN product_quantity TO product_qty

-- Change the name of the products table to product
ALTER TABLE products
RENAME TO product

-- TRUNCATE => Empties out the date, but not drop it
TRUNCATE TABLE products

-- DROP=> Drops the table (Remove)
DROP TABLE products


-- Describes a table [skeleton of the table]
-- Displays Table fields, types, key, constraints
DESCRIBE products
-- END OF DDL Commands

-- DML Commands
INSERT INTO products (product_name, product_price, product_type, product_color, product_size, product_origin, product_qty, product_purchase_date) VALUES
('MacBook Pro', 4500.99, 'Laptop', 'Silver', '15 Inch', 'USA', 450, '2020-10-10'),
('MacBook Air', 1500.99, 'Laptop', 'Space Gray', '11 Inch', 'USA', 0, '2017-10-10'),
('iPad Pro', 1200.99, 'iPad', 'Silver', '12 Inch', 'USA', 250, '2010-01-01'),
('Data Center', 1453200.99, 'iPad', 'Silver', '12 Inch', 'USA', 250, NULL)



SELECT * FROM products