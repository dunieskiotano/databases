-- Lesson 5: Performing a Conditional Search

-- ------- Table products ---------

CREATE TABLE IF NOT EXISTS products
(
	product_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(20) NOT NULL,
	product_manufacturer VARCHAR(10) NOT NULL,
	product_price DECIMAL(9,2) NOT NULL,
	product_type VARCHAR(15) NOT NULL,
	product_color VARCHAR(10) NOT NULL,
	product_size VARCHAR(10) NOT NULL,
	product_origin VARCHAR(20) NOT NULL,
	product_quantity SMALLINT NOT NULL,
	product_purchase_date VARCHAR(10) 
)

INSERT INTO products (product_name, product_manufacturer, product_price, product_type, product_color, product_size, product_origin, product_quantity, product_purchase_date) VALUES
('MacBook Pro', 'Apple', 4500.99, 'Laptop', 'Silver', '15 Inch', 'USA', 450, '2020-10-10'),
('MacBook Air', 'Apple', 1500.99, 'Laptop', 'Space Gray', '11 Inch', 'USA', 0, '2017-10-10'),
('iPad Pro', 'Apple', 1200.99, 'iPad', 'Silver', '12 Inch', 'USA', 250, '2010-01-01'),
('Data Center', 'AWS', 1453200.99, 'iPad', 'Silver', '12 Inch', 'USA', 250, NULL),
('Toshiba', 'Toshiba', 1256.00, 'Laptop', 'White', '17 Inch', 'USA', 210, '2021-04-12'),
('LG Monitor', 'LG', 1300, 'Monitor', 'Black', '38 Inch', 'USA', 500, NULL)

-- --------------------------------------

-- Multiple Search Condition with multiple operators
-- Return all products whose manufacturer is Apple AND cost is more than $1,200
SELECT product_name, product_price
FROM products 
WHERE product_manufacturer = 'Apple' AND product_price > 1200

drop table products

