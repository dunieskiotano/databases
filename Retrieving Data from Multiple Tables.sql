-- Lesson 8: Retrieving Data from Multiple Tables

-- CREATE TABLES SECTION
CREATE TABLE new_movies
(
	movie_director TEXT NOT NULL,
	movie_main_actor TEXT NOT NULL
)

CREATE TABLE old_movies
(
	movie_name TEXT NOT NULL,
	movie_release_date DATE NOT NULL
)


CREATE TABLE staff
(
	staff_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT NOT NULL,
	phone TEXT NOT NULL,
	manager_id TINYINT NULL
)

CREATE TABLE users
(
	user_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
	firstname TEXT NOT NULL,
	lastname TEXT NOT NULL,
	email TEXT NOT NULL
)


CREATE TABLE orders
(
	order_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE NOT NULL,
	order_total DECIMAL(18,2) NOT NULL,
	user_id SMALLINT,
	product_id SMALLINT,
	FOREIGN KEY (user_id) REFERENCES users (user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES product (product_id) ON UPDATE CASCADE ON DELETE CASCADE	
)


CREATE TABLE product
(
	product_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
	product_name TEXT NOT NULL,
	product_quantity SMALLINT NOT NULL,
	product_price DECIMAL(18,2) NOT NULL
)

-- INSERT SECTION
INSERT INTO new_movies (movie_director, movie_main_actor) VALUES
('Oliver Stone', 'Robert de Niro'),
('Oliver Stone', 'Tom Hanks'),
('Oliver Stone', 'Nicholas Cage'),
('James Cameron', 'Bruce Willis'),
('Steven Spielberg', 'Jennifer Lopez')

INSERT INTO old_movies (movie_name, movie_release_date) VALUES
('Gone with the wind', '1937-10-10'),
('The Wild West', '1920-09-09'),
('The Beauty and the Beast', '1950-07-07'),
('Billy The Beast', '1900-01-01'),
('Why are you so mean to me?', '1810-01-02')

-- Data for users
INSERT INTO users (firstname, lastname, email) VALUES
('Dunieski', 'Otano', 'dunieski@example.com'),
('Orlando', 'Otano', 'orlando@example.com'),
('Yanet', 'Perez', 'yanet@example.com'),
('Martha', 'Ramos', 'martha@example.com'),
('Fernando', 'Acosta', 'fernando@example.com'),
('Mtagui', 'Mohammed', 'mtagui@example.com'),
('Julio', 'Mujica', 'julio@example.com')


-- Data for product
INSERT INTO product (product_name, product_quantity, product_price) VALUES
('iPad', 200, 900.99),
('iPod', 100, 200.99),
('iPhone', 400, 1200.99),
('iMac', 500, 2200.99),
('MacBook Pro', 800, 2500.99),
('Apple Watch', 150, 500.99),
('Dell', 250, 900.99)

INSERT INTO orders (order_date, order_total, user_id, product_id) VALUES
('2010-10-10', 100.00, 1, 2),
('2010-09-09', 345.99, 1, 1),
('2009-08-08', 450.99, 2, 3),
('2019-07-10', 600.00, 3, 2),
('2016-06-10', 300.00, 3, 4),
('2017-07-10', 700.00, 3, 3),
('2020-10-10', 200.00, 4, 1),
('2019-01-01', 1000.00,, 5 5),
('2015-03-03', 1200.00, 4, 5),
('2015-03-03', 1200.00, 6, 5),
('2015-03-03', 1200.00, NULL, 5)

INSERT INTO staff (first_name,last_name, email, phone, manager_id) VALUES
('Fabiola', 'Jackson', 'employee@example1.com', '786-973-2044', NULL),
('Mireya', 'Copeland', 'employee@example2.com','786-973-2045', 1),
('Genna', 'Serrano', 'employee@example3.com','786-973-2046', 2),
('Virgie', 'Wiggins', 'employee@example4.com','786-973-2046', 2),
('Jannette', 'David', 'employee@example5.com','786-973-2047', 1),
('Marcelene', 'Boyer', 'employee@example6.com','786-973-2048', 5),
('Venita', 'Daniel', 'employee@example7.com','786-973-2049', 5),
('Kali', 'Vargas', 'employee@example8.com','786-973-2050', 1),
('Layla', 'Terrell', 'employee@example9.com','786-973-2051', 7),
('Bernandine', 'Houston', 'employee@example10.com','786-973-2052', 7)
-- -----------------------



-- MANIPULATE DATA

-- SELECT 
SELECT * FROM users
SELECT * FROM product 
-- ------

-- UNION Operator
SELECT movie_main_actor, movie_director
FROM new_movies
UNION ALL
SELECT movie_release_date, movie_name
FROM old_movies

-- CROSS JOIN 
SELECT * FROM users
CROSS JOIN orders

-- INNER JOIN
SELECT u.firstname, u.lastname, u.email, o.order_id, o.order_total, p.product_id, p.product_name , p.product_price, p.product_quantity 
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id 
INNER JOIN product p ON p.product_id = o.product_id 

-- CONCATENATION WITH INNER JOIN
SELECT CONCAT(u.firstname, ' bought a(n) ', p.product_name, '  ---------- Order ID =>  ', o.order_id) AS "Order Info"
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id 
INNER JOIN product p ON p.product_id = o.product_id 

-- HOMEWORK
-- 1. Create three tables (student, grades, course)
-- 2. Return the students with all grades and all courses they have taken
-- 3. Create a concatenated string with the info

-- LEFT JOIN
SELECT u.firstname, o.order_id
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id 

-- RIGHT JOIN
SELECT u.firstname, o.order_id
FROM users u
RIGHT JOIN orders o ON u.user_id = o.user_id


/*CREATE TABLE staff
(
	staff_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT NOT NULL,
	phone TEXT NOT NULL,
	manager_id TINYINT NULL
)*/

-- SELF JOIN 
SELECT CONCAT(employee.first_name, ' ', employee.last_name) AS Employee,
CONCAT(manager.first_name, ' ', manager.last_name) AS "Report To"
FROM staff AS employee
LEFT JOIN staff AS manager ON manager.staff_id = employee.manager_id

-- Returns:
Fabiola Jackson	 NULL
Mireya Copeland	Fabiola Jackson
Genna Serrano	Mireya Copeland
Virgie Wiggins	Mireya Copeland
Jannette David	Fabiola Jackson
Marcelene Boyer	Jannette David
Venita Daniel	Jannette David
Kali Vargas	Fabiola Jackson
Layla Terrell	Venita Daniel
Bernandine Houston	Venita Daniel

