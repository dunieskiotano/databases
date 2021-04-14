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

SELECT * FROM exam
SELECT * FROM student