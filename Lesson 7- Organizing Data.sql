-- Lesson 7: Organizing Data

-- TABLE Section
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

CREATE TABLE student 
(
	studentid VARCHAR(10) NOT NULL,
	firstname VARCHAR(10) NOT NULL,
	grade DECIMAL(4,2) NOT NULL,
	subject VARCHAR(20) NOT NULL,
	subjectid VARCHAR(10) NOT NULL
)

-- -- END of Table Section

-- INSERT DATA Section
INSERT INTO citizen (citizen_firstname, citizen_lastname, citizen_city, citizen_state, citizen_retirement_date, citizen_year_of_birth) VALUES
('Pushpa', 'Munagala', 'Ashburn', 'VA', '2020-12-10', 1980),
('Aicha', 'Diallo', 'Ashburn', 'VA', '2015-01-10', 1995),
('Dunieski','Otano', 'Miami', 'FL', NULL, 1976),
('Megan', 'Kumar', 'Houston', 'TX', NULL, 2001),
('Yanet', 'Perez', 'Miami', 'FL', NULL, 2000),
('Gayle', 'Jones', 'Bowie', 'MD', '2012-10-10', 1985),
('Sheila', 'McCustion', 'Tupelo', 'MS', '2016-09-09', 1990),
('Daniel', 'Caccavelli', 'Dry Fork', 'VA', NULL, 1992)

INSERT INTO student (studentid, firstname, grade, subject, subjectid) VALUES
('NCI01', 'Pushpa', 98.5, 'Math', '001'),
('NCI01', 'Pushpa', 95.5, 'English', '002'),
('NCI01', 'Pushpa', 90.5, 'Computer Science', '003'),
('NCI02', 'Aicha', 97.2, 'Math', '001'),
('NCI02', 'Aicha', 95.2, 'English', '002'),
('NCI02', 'Aicha', 98.2, 'Computer Science', '003'),
('NCI03', 'Daniel', 95.8, 'Math', '001'),
('NCI03', 'Daniel', 91.8, 'English', '002'),
('NCI03', 'Daniel', 93.8, 'Computer Science', '003'),
('NCI04', 'Robert', 97.8, 'Math', '001'),
('NCI04', 'Robert', 90.1, 'English', '002'),
('NCI04', 'Robert', 95.1, 'Computer Science', '003'),
('NCI05', 'Essie', 90.5, 'Math', '001'),
('NCI05', 'Essie', 96.5, 'English', '002'),
('NCI05', 'Essie', 97.5, 'Computer Science', '003')

-- END of INSERT DATA Section