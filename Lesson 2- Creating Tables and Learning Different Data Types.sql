
-- Lesson 2: Creating Tables and Learning Different Data Types

-- This creates a tabled named employee

-- Beginning of the table creation
CREATE TABLE IF NOT EXISTS employee
(
	employee_id SMALLINT PRIMARY KEY AUTO_INCREMENT,         
	employee_firstname VARCHAR(10) NOT NULL,
	employee_lastname VARCHAR(10) NOT NULL,
	employee_phone VARCHAR(10) NOT NULL,     
	employee_salary DECIMAL(18,2) NOT NULL -- 1234567890123456.78   
)

-- This create a table named nci_student
CREATE TABLE nci_student 
(
	std_id VARCHAR(10) PRIMARY KEY,
	firstname VARCHAR(20) NOT NULL,
	lastname VARCHAR(20) NOT NULL,
	class VARCHAR(20) NOT NULL,
	phone VARCHAR(10) NOT NULL,
	email VARCHAR(25) NOT NULL,
	address VARCHAR(100) NOT NULL	
)


-- End of table creation

-- Insert data section
INSERT INTO employee (employee_firstname, employee_lastname, employee_phone, employee_salary) VALUES
('Dunieski', 'Otano', '1234567890', 12345.99)

INSERT INTO nci_student (std_id, firstname, lastname, class, phone, email, address) VALUES
('NCI001', 'Dunieski', 'Otano', 're/Start', '1234567890', 'example@example.com', '1234 SW 4th Ave Miami, FL 33122'),
('NCI002', 'Mtaghi', 'Gui', 'AWS Practitioner','911911911', 'USA@USA@.com', '911 Street, USA'),
('NCI003', 'Bayrakdar', 'Omer', 're/Start', '2026765848', 'hellooo@gmail.com', '3345 Main St. #1940, Alexandria, VA, 22201'),
('NCI004', 'Daniel', 'Caccavelli', 're/Start', '4348675309', 'this@that.com', '1234 Main St. Danville VA 24541'),
('NCI005', 'Joven', 'Poblete', 're/Start', '123456789', 'email@gmail.com', '0000 East St, Washington, DC 20002'),
('NCI006', 'Yasin', 'Tasasiz', 're/Start', '135792468', 'yasin@mail.com', '1234 East St. Ashburn VA 20148'),
('NCI007','Jing', 'wang',  're/Start', '7033896293',  'janeff1110@gmail.com','12334 Carry Lark Ct. ,Fairfax, VA 22033'),
('NCI008', 'Joe', 'Mitchell', 're/Start', '5555555556', 'seequill@email.com', '245 Street Rd City, Maine 64334'),
('NCI009','Rufina', 'Kim', 're/Start','3451230987','testdb@email.com','2222 Freedom sq Chantilly VA 20169'),
('NCI010', 'Pushpa', 'Munagala', 're/Start', '123987675', 'pushpa@pushpa.com', '7888 liberty sq, Ny, 30939'),
('NCI011', 'Andrew', 'Hopkins', 're/start', '0987654321' , 'Database@data.com' , '12345 South Liberty Akron, OH'),
('NCI012', 'Andres', 'Mejia', 're/start', '5435454354', 'Dres@email.com', '12345 HAHAHA st, Aldie, VA')
-- end of insert data section

-- START OF READ SECTION
SELECT employee_id, employee_firstname, employee_lastname, employee_phone, CONCAT('$', employee_salary) AS "Salary" FROM employee
SELECT * FROM nci_student


-- TINYINT => 1 byte, 0 to 255
-- SMALLINT => 2 bytes, -215 (-32,768) to 215-1 (32,767)
-- INT => 4 bytes, -231 (-2,147,483,648) to 231-1 (2,147,483,647
-- BIGINT => 8 bytes, -263 (-9,223,372,036,854,775,808) to 263-1 (9,223,372,036,854,775,807)

-- DECIMAL(18,2) => Precision: 18, scale: 2 
-- 12345678.89 (10,2) => Precision: 10, scale: 2

-- VARCHAR(10), TEXT

-- DATE
-- TIMESTAMP
SELECT '2020-04-06' + INTERVAL 1 day -- returns 2020-04-07
SELECT '2020-04-06' + INTERVAL -1 day -- returns 2020-04-05

-- Adding Intervals using the funcion DATE_ADD(), and subtracting intervals using function DATE_SUB()
SELECT DATE(NOW()) AS "Today's Date", DATE_ADD(DATE(NOW()), INTERVAL + 1 MONTH) AS "1 Month later", 
DATE_SUB(DATE(NOW()), INTERVAL 1 MONTH) AS "1 Month before", DATE_ADD(DATE(NOW()), INTERVAL 1 YEAR) AS "A Year later",
DATE_ADD(DATE(NOW()), INTERVAL 100 YEAR) AS "A Century later"

SELECT CONCAT('Hey Sir, What time is it?', ' Ok, here it is: ', TIME(NOW())) AS "Question"

SELECT NOW() AS "Date & Time", DATE(NOW()) AS "Date Portion", TIME(NOW()) AS "Time Portion"
 
-- This returns:
--     Now               Date Portion     Time Portion
-- 2021-04-09 16:33:00	   2021-04-09	    16:33:00


-- This prints all records starting at 5 (offset) and only print 6 records (limit)
SELECT CONCAT(std_id, '=> OH ', firstname, '. I know where you live now. You dont believe me? Well, here is it. You live @ ', address)  AS "I Know what you did last summer"
FROM nci_student LIMIT 6 OFFSET 4

-- This returns:
-- NCI005=> OH Joven. I know where you live now. You dont believe me? Well, here is it. You live @ 0000 East St, Washington, DC 20002
-- NCI006=> OH Yasin. I know where you live now. You dont believe me? Well, here is it. You live @ 1234 East St. Ashburn VA 20148
-- NCI007=> OH Jing. I know where you live now. You dont believe me? Well, here is it. You live @ 12334 Carry Lark Ct. ,Fairfax, VA 22033
-- NCI008=> OH Joe. I know where you live now. You dont believe me? Well, here is it. You live @ 245 Street Rd City, Maine 64334
-- NCI009=> OH Rufina. I know where you live now. You dont believe me? Well, here is it. You live @ 2222 Freedom sq Chantilly VA 20169
-- NCI010=> OH Pushpa. I know where you live now. You dont believe me? Well, here is it. You live @ 7888 liberty sq, Ny, 30939

-- END OF READ SECTION


