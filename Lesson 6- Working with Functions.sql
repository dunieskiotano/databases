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
('MacBook Pro', 'Apple', 4500.99),
('MacBook Air', 'Apple', 1500.99),
('iPad Pro', 'Apple', 1200.99),
('Microsoft Surface', 'Microsoft', 1400.99),
('Dell', 'Dell', 1600.99),
('HP XPS360', 'HP', 2400.99),
('Lenovo', 'Lenovo', 2000.99)

-- --- END OF INSERT DATA SECTION ---