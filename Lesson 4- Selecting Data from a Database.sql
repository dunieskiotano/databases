-- Lesson 4: Selecting Data from a Database

-- 1. FROM and JOINs
-- 2. WHERE
-- 3. GROUP BY
-- 4. HAVING
-- 5. SELECT 
-- 6. DISTINCT
-- 7. ORDER BY
-- 8. LIMIT / OFFSET


-- Single-line comment
-- SELECT * FROM test


-- Multiple-line comment
/* SELECT custname, city, state
FROM Customers
WHERE state = 'NY' */

-- Print today's date
SELECT DATE(NOW())

-- Extract date's portion of NOW(), year, month, day => Using function EXTRACT()
SELECT DATE(NOW()) AS "Today's date", EXTRACT(YEAR FROM DATE(NOW())) AS "Year", 
EXTRACT(MONTH FROM DATE(NOW())) AS "Month", EXTRACT(DAY FROM DATE(NOW())) AS "Day"

-- Extract time's portion of NOW(), hour, minute, second => Using function EXTRACT()
SELECT TIME(NOW()), EXTRACT(HOUR FROM NOW()) AS "Hour", 
EXTRACT(MINUTE FROM NOW()) AS "Minute", EXTRACT(SECOND FROM NOW()) AS "Second"

-- hey sir, what time is it?, asked the boy. It is 02:17:05 PM  => using function TIME_FORMAT()
SELECT CONCAT('hey sir, what time is it?, asked the boy. It is ', TIME_FORMAT('14:17:05', "%h:%i:%s %p"))

-- Concatenation = joins elements in the function CONCAT()
SELECT CONCAT('My ID is N-', 5)  AS ID

-- CAST() turns a type into another type, CHAR to TIME
SELECT CAST('14:06:10' AS TIME)

SELECT CAST(125.5 AS CHAR)

-- Sample table to test CONCAT()
CREATE TABLE users
(
	firstname TEXT NOT NULL,
	lastname TEXT NOT NULL
)

INSERT INTO users VALUES('Pushpa', 'Munagala'), ('Aicha', 'Diallo')
INSERT INTO users VALUES('Esteban', 'Castro'), ('Angel', 'Martinez')

SELECT * FROM users

-- Using ORDER BY optional clause
SELECT CONCAT(firstname, ' ', lastname) AS "Full Name" FROM users ORDER BY firstname ASC


CREATE TABLE player -- table player
(
	playerId SMALLINT PRIMARY KEY AUTO_INCREMENT,
	player_name VARCHAR(10) NOT NULL,
	player_score SMALLINT NOT NULL,
	player_lastdatePlayed DATE NOT NULL,
	player_TShirtNumber TINYINT NOT NULL,
	player_status VARCHAR(10) NOT NULL
)


