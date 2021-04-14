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
	manager_id INT NULL
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