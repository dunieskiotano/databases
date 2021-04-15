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

INSERT INTO products (product_name, product_manufacturer, product_price, product_type, product_color, product_size, product_origin, product_quantity, product_purchase_date) VALUES
('Wireless Keyboard', 'LG', 1300.99, 'Monitor', 'Black', '12 Inch', 'USA', 200, NULL),
('Thunderbold 3 Dock', 'OWC', 399.99, 'Dock', 'Silver', '7 Inch', 'USA', 100, '2020-03-01')

-- --------------------------------------

-- Multiple Search Condition with multiple operators
-- Return all products whose manufacturer is Apple AND cost is more than $1,200
SELECT product_name, product_price
FROM products 
WHERE product_manufacturer = 'Apple' AND product_price > 1200

-- Return all products whose manufacturer is Apple OR cost is more than $1,200
SELECT product_name, product_price
FROM products 
WHERE product_manufacturer = 'Apple' OR product_price > 1200

-- TRUE and TRUE => TRUE
-- TRUE and FALSE => FALSE
-- FALSE and FALSE => FALSE
-- TRUE or TRUE => TRUE
-- TRUE or FALSE => TRUE
-- FALSE or FALSE => FALSE

-- Arithmetic Operators
-- Return Product Name, Iterms Purchased, Subtotal, Taxes, and Grade Total
SELECT 
product_name AS "Product Name",
product_price AS "Product Price",
'2' AS "Items Purchased",
product_price * 2 AS "Subtotal",
ROUND(product_price * 0.07, 2) AS Taxes,
ROUND(product_price * 2 + product_price * 0.07, 2) AS "Grand Total"
FROM products

-- Return all products whose price + 200 is greater than $1,600
SELECT * FROM products 
WHERE product_price + 200 > 1600

-- Alias for columns
SELECT p.product_name AS Name
FROM products


-- Query order of execution
-- FROM and JOIN s. The FROM clause, and subsequent JOINs are first executed to determine the total working set of data that is being queried. ...
-- WHERE. ...
-- GROUP BY. ...
-- HAVING. ...
-- SELECT. ...
-- DISTINCT. ...
-- ORDER BY. ...

-- NOT Operator ------
-- Returns products whose manufacturer is not Apple
SELECT * 
FROM products 
WHERE NOT product_manufacturer = 'Apple'

-- AND and NOT Operators
-- Return products whose price is more than $1,000 but their manufacturer is NOT Apple
SELECT * 
FROM products 
WHERE product_price > 1000 AND NOT product_manufacturer = 'Apple' -- To become True, both need to be TRUE, product MUST be > 1000 and manufacture MUST NOT be Apple
-- ---------------------

-- AND and OR Operators -----
-- Return all products with a price > $1,000, but basically returns all products BUT Apple products
SELECT * FROM products 
WHERE NOT product_manufacturer = 'Apple' OR product_name = 'Dell' AND product_price> 1600

-- Return all products, except for Apple or Dell, with price greater than $1,600
SELECT * FROM products 
WHERE NOT (product_manufacturer = 'Apple' OR product_name = 'Dell') AND product_price> 1600

-- Return all products, either Apple or Dell, with a price greater than $1,600
SELECT * FROM products 
WHERE (product_manufacturer = 'Apple' OR product_name = 'Dell') AND product_price> 1600
-- ---------------------------


-- BETWEEN Operations --------
-- Return all products whose price is between $1,300 and $1,700
SELECT * 
FROM products 
WHERE product_price BETWEEN 1300 AND 1700

-- Return all products whose price is NOT between $1,300 and $1,700
SELECT * 
FROM products 
WHERE NOT product_price BETWEEN 1300 AND 1700
-- -----------------------------


CREATE TABLE citizen 
(
	citizen_id INT PRIMARY KEY AUTO_INCREMENT,
	citizen_firstname VARCHAR(10) NOT NULL,
	citizen_lastname VARCHAR(10) NOT NULL,
	citizen_city VARCHAR(15) NOT NULL,
	citizen_state VARCHAR(20) NOT NULL,
	citizen_retirement_date DATE,
	citizen_year_of_birth VARCHAR(4) NOT NULL	
)


INSERT INTO citizen (citizen_firstname, citizen_lastname, citizen_city, citizen_state, citizen_retirement_date, citizen_year_of_birth) VALUES
('Pushpa', 'Munagala', 'Ashburn', 'VA', '2020-12-10', 1980),
('Aicha', 'Diallo', 'Ashburn', 'VA', '2015-01-10', 1995),
('Dunieski','Otano', 'Miami', 'FL', NULL, 1976),
('Megan', 'Kumar', 'Houston', 'TX', NULL, 2001),
('Yanet', 'Perez', 'Miami', 'FL', NULL, 2000),
('Gayle', 'Jones', 'Bowie', 'MD', '2012-10-10', 1985),
('Sheila', 'McCustion', 'Tupelo', 'MS', '2016-09-09', 1990),
('Daniel', 'Caccavelli', 'Dry Fork', 'VA', NULL, 1992)



-- IN Operator ----- 
-- Return only the citizens that live in FL and VA
SELECT * 
FROM citizen
WHERE citizen_state IN ('FL', 'VA')

-- IS NULL Clause
SELECT * 
FROM citizen 
WHERE citizen_city = 'Miami' AND citizen_retirement_date IS NULL 

-- IS NOT NULl Clause
SELECT * 
FROM citizen 
WHERE citizen_retirement_date IS NOT NULL 


-- LIKE Operator
-- Return all cities that start with M
SELECT *
FROM citizen 
WHERE citizen_city LIKE 'M%'

-- Return all cities that end with i
SELECT *
FROM citizen 
WHERE citizen_city LIKE '%i'


-- Return all cities that contain 'ow'
SELECT *
FROM citizen 
WHERE citizen_city LIKE '%ow%'

-- Return all last names that contain 'cca'
SELECT *
FROM citizen 
WHERE citizen_lastname LIKE '%cca%'

-- Return all first names that start with P
SELECT *
FROM citizen 
WHERE citizen_firstname LIKE 'P%'


-- Return all first name that with p
SELECT *
FROM citizen 
WHERE citizen_firstname LIKE 'p%'

SELECT *
FROM citizen 
WHERE LOWER(citizen_firstname) LIKE 'p%'

-- LOWER()
SELECT LOWER('DuniESki')

-- UPPER()
SELECT UPPER('dunieski')

-- Return all first names whose second letter is 'u', the (_) wildcard represents a single character
SELECT *
FROM citizen 
WHERE citizen_firstname LIKE '_u%'

SELECT *
FROM citizen 
WHERE citizen_lastname LIKE 'O__n%'

-- Regular expressions, returns all years that end with a character between 1 and 5
SELECT * 
FROM citizen 
WHERE citizen_year_of_birth REGEXP '^...[1-5]$'

-- Regular expressions, returns all last names with 5 character in length and end with a letter between o and t
SELECT * 
FROM citizen 
WHERE citizen_lastname REGEXP '^....[o-t]$'

-- Regular expressions -- basically all last names
SELECT * 
FROM citizen 
WHERE citizen_lastname REGEXP '^....*$'















