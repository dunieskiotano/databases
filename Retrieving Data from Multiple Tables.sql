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
-- -----------------------

-- MANIPULATE DATA

-- UNION Operator
SELECT movie_main_actor, movie_director
FROM new_movies
UNION ALL
SELECT movie_release_date, movie_name
FROM old_movies

