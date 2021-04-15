-- Lesson 9: Indexes

CREATE TABLE exam
( 
	exam_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
	exam_name VARCHAR(10) NOT NULL
)

CREATE TABLE student 
( 
	student_id INT NOT NULL AUTO_INCREMENT,
	student_firstname VARCHAR(15) NOT NULL,
	student_lastname VARCHAR(15) NOT NULL,
	exam_id SMALLINT,
	CONSTRAINT PK_Student PRIMARY KEY (student_id, student_firstname), -- CONSTRAINT + constraint name -> compound key
	FOREIGN KEY (exam_id) REFERENCES exam (exam_id) ON DELETE CASCADE ON UPDATE CASCADE
)

INSERT INTO exam (exam_name) VALUES ('Math')

INSERT INTO student (student_firstname, student_lastname, exam_id) VALUES ('Dunieski', 'Otano', 1)

-- Return student_id, student_fitstname, students_lastname, exam_id, exam_name (INNER JOIN)
SELECT s.student_id "Student ID", s.student_firstname "First Name", s.student_lastname "Last Name", e.exam_id "Exam ID", e.exam_name " Exam Name"
FROM exam e 
INNER JOIN student s ON e.exam_id = s.exam_id

SELECT * FROM exam
SELECT * FROM student

-- More Examples of Join

-- Table customer
CREATE TABLE customer
(
	customerId INT PRIMARY KEY AUTO_INCREMENT,
	customer_firstname VARCHAR(10) NOT NULL,
	customer_lastname VARCHAR(10) NOT NULL
)

-- Junction Table transfer
-- Only contains foreign keys from tables customer and transactions
CREATE TABLE transfer
(
 customerId INT,
 transactionId INT,
 FOREIGN KEY (customerId) REFERENCES customer(customerId),
 FOREIGN KEY (transactionId) REFERENCES transactions (transactionId)
)


-- Table transactions
CREATE TABLE transactions
(
   transactionId INT PRIMARY KEY AUTO_INCREMENT,
   transaction_bank VARCHAR(25) NOT NULL
)


-- INSERT INTO customer, transfer, transactions
INSERT INTO customer (customer_firstname, customer_lastname) VALUES
('Pushpa', 'Munagala'), -- 1
('Aicha', 'Diallo'), -- 2
('Omer', 'Omer'), -- 3
('Daniel', 'Daniel'), -- 4
('Andrew', 'Hopkins'), -- 5
('Yanet', 'Perez') -- 6

INSERT INTO transactions (transaction_bank) VALUES
('Bank Of America'), -- 1
('Chase'), -- 2
('TD Bank'), -- 3
('Wells Fargo'), -- 4
('Capital One'), -- 5
('Barclay'), -- 6
('M&T Bank') -- 7

INSERT INTO transfer (customerId, transactionId) VALUES
(1, 1),
(2, 7),
(3, 2),
(4, 6),
(5, 4),
(6, 3),
(6, 1),
(2, 6),
(1, 7),
(3, 6),
(3, NULL)

-- ------------------

-- INNER JOIN 
SELECT c.customerId, c.customer_firstname, c.customer_lastname, tr.transactionId, tr.transaction_bank
FROM transfer t
INNER JOIN customer c ON t.customerId = c.customerId
INNER JOIN transactions tr ON t.transactionId = tr.transactionId

-- LEFT JOIN 
SELECT c.customerId, c.customer_firstname, c.customer_lastname, tr.transactionId, tr.transaction_bank
FROM transfer t
LEFT JOIN customer c ON t.customerId = c.customerId
LEFT JOIN transactions tr ON t.transactionId = tr.transactionId
