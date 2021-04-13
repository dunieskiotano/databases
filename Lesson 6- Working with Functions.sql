-- Lesson 6: Working with Functions

SELECT TIME(NOW()) -- Nested functions

-- --- TABLE CREATION SECTION ---
CREATE TABLE product 
(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(20) NOT NULL,
	product_manufacturer VARCHAR(10) NOT NULL,
	product_price DECIMAL(10,2) NOT  NULL
)

CREATE TABLE time_test
(
	purchase_date TIMESTAMP NOT NULL,
	post_date DATE NOT NULL
)
-- --- END OF TABLE CREATION SECTION ---

-- --- INSERT DATA SECTION ---
INSERT INTO product (product_name, product_manufacturer, product_price) VALUES
('MacBook Pro', 'Apple', 4500.99), -- max price
('MacBook Air', 'Apple', 1500.99),
('iPad Pro', 'Apple', 1200.99), -- min price
('Microsoft Surface', 'Microsoft', 1400.99),
('Dell', 'Dell', 1600.99),
('HP XPS360', 'HP', 2400.99),
('Lenovo', 'Lenovo', 2000.99)

INSERT INTO time_test VALUES (CURDATE(), '2020-10-20')
-- --- END OF INSERT DATA SECTION ---

-- CURDATE() and CURTIME()
SELECT CURDATE(), DATE(NOW()), CURTIME(), TIME(NOW())

-- MANIPULATE DATA FROM product TABLE

-- Return number of products (rows/records) with the function COUNT() [from product]
SELECT COUNT(*) AS "No of Products" FROM product 

-- Returns average of prices with the function AVG() and ROUND()
SELECT ROUND(AVG(product_price), 2) AS "Product Price Average" FROM product

-- Returns product with the highest price with function MAX()
SELECT MAX(product_price) AS "Maximum Product Price" FROM product 

-- Returns product with the lowest price with function MIN()
SELECT MIN(product_price) AS "Minimum Product Price" FROM product 

-- Returns the total of prices with function SUM()
SELECT SUM(product_price) AS "Total Product Price" FROM product 
