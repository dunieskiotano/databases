-- Lesson 10: Updating/Deleting Tables

-- (ACID)
-- • A - Atomic: Makes sure all operations are successful
-- • C - Consistent: Confirms the database correctly changes states after a transaction has been effectively committed 
-- • I - Isolated: Allows transactions to function autonomously of and visible to each other
-- • D - Durable: Once is there, it's there

-- Doesn't work with DBeaver, but it does with MySQL Workbench
START TRANSACTION;
CREATE TABLE computer
(
	computer_id VARCHAR(10) PRIMARY KEY NOT NULL,
	computer_type VARCHAR(20) NOT NULL,
	computer_manufacturer VARCHAR(20) NOT NULL,
	computer_country_of_origin VARCHAR(15) NOT NULL
)

INSERT INTO computer (computer_id, computer_type, computer_manufacturer, computer_country_of_origin) VALUES
('TD-001', 'Apple', 'Apple', 'China'),
('TD-002', 'Dell', 'Dell', 'Bangladesh')

SELECT * FROM computer;
COMMIT;

-- Delete a record by ID
DELETE FROM computer WHERE computer_id = 'TD-002';

-- Update a record by ID
UPDATE computer SET computer_country_of_origin = 'USA' WHERE computer_id = 'TD-001'

-- Update several fields at the same time
UPDATE computer SET
	computer_type = 'Toshiba',
	computer_manufacturer = 'Toshiba, Inc',
	computer_country_of_origin = 'Japan'
WHERE computer_id = 'TD-001'

