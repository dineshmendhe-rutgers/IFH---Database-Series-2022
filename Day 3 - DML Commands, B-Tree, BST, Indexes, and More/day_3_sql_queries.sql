# NOTE: Use code editors or IDEs for syntax highlighting and formatting code.

# Create database 

# Syntax:
CREATE DATABASE database_name;

# Example:
CREATE DATABASE ifh_database_series;

# Indexes and their benefits
DROP TABLE IF EXISTS ifh_emp;
CREATE TABLE ifh_emp
(
	emp_id INT PRIMARY KEY,
	first_name VARCHAR(50),
  last_name VARCHAR(50),
	email VARCHAR(50),
	department VARCHAR(50)
);


# Procedure to add dummy records in the table.
DROP PROCEDURE IF EXISTS addDummyRecords;
DELIMITER //
CREATE PROCEDURE addDummyRecords()
BEGIN
DECLARE i INT UNSIGNED DEFAULT 1;
WHILE i < 10000 DO                    
    INSERT INTO ifh_emp(emp_id, first_name, last_name, email, department)
    SELECT i, concat('Name', i), concat('Last', i), concat('email@test', i),  concat('IFH_dept', i);
    SET i = i + 1;
END WHILE;
COMMIT; 
END //
DELIMITER ;

CALL addDummyRecords();


# Explain execution plan query syntax
EXPLAIN 
SELECT * 
FROM ifh_emp 
WHERE emp_id = 90;

EXPLAIN 
SELECT * 
FROM ifh_emp 
WHERE first_name = "Name9";

# Create non-clustered index syntax
CREATE INDEX index_name ON table_name (column_name ASC);  
CREATE INDEX index_name ON table_name (column_name1, column_name2);

# Example 
CREATE INDEX ix_ifh_emp_name 
ON ifh_emp (first_name ASC);

# Drop index query syntax
DROP INDEX index_name ON table_name;

# Drop index query
DROP INDEX ix_ifh_emp_name ON ifh_emp; 
ALTER TABLE ifh_emp DROP PRIMARY KEY;  
ALTER TABLE ifh_emp DROP INDEX ix_ifh_emp_name 


# Drop query syntax
DROP DATABASE IF EXISTS database_name;
DROP TABLE IF EXISTS table_name;

# Example: 
DROP DATABASE IF EXISTS ifh_database_series;
DROP TABLE IF EXISTS participant;

# Insert query
# Note: Primary key/ ID are set to auto increment, therefore do not need to manually add while inserting record in a table. 

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

INSERT INTO table_name
VALUES (value1, value2, value3, ...);

# Example (Refer day 2 SQL)
INSERT INTO `kinship` (`kinship_name`) 
VALUES ('Father');

INSERT INTO `kinship` (`kinship_name`) 
VALUES ('Mother');

INSERT INTO `kinship` (`kinship_name`) 
VALUES ('Son');

INSERT INTO `kinship` (`kinship_name`) 
VALUES ('Grandfather');


START TRANSACTION;
INSERT INTO `participant` 
     (`participant_id`, `family_id`, `mock_participant`, `first_name`, `last_name`, `kinship_id`, `address_1`, `city`, `state_id`, `birth_country_id`) 
VALUES 
     ('1', '11111111', '1', 'Dinesh', 'Mendhe', '1', '25 Star St', 'Iselin', '1', '1');

INSERT INTO `participant` 
	(`family_id`, `mock_participant`, `first_name`, `last_name`, `kinship_id`, `address_1`, `city`, `state_id`, `birth_country_id`, `gender`) 
VALUES 
	('11111111', '0', 'Akriti', 'Dogra', '2', '25 Star St', 'Iselin', '1', '1', 'female');

INSERT INTO `participant` 
	(`family_id`, `mock_participant`, `first_name`, `last_name`, `kinship_id`, `address_1`, `city`, `state_id`, `birth_country_id`, `gender`, `email`) 
VALUES 
	('11111111', '0', 'Vardan', 'Mendhe', '3', '25 Star St', 'Iselin', '1', '1', 'female', 'vm@test.com');
COMMIT;

# Create index query

# Syntax
  CREATE INDEX index_name
  ON table_name (column1, column2, ...);

# Example:
  CREATE INDEX idx_email
  ON participant (email);

# NOTE: * means all columns. 

# Select query:
# syntax 
  SELECT column_name1, column_name2, ...
  FROM table_name
  WHERE condition
  GROUP BY column_name1, column_name2, ...

# Example:
  SELECT *
  FROM participant
  WHERE first_name = "Dinesh"
        AND last_name = "Mendhe"
  ORDER BY participant_id;

  SELECT DISTINCT(email) 
  FROM participant
  WHERE id < 5;

  SELECT * 
  FROM participant
  WHERE family_id = 11111111;

  SELECT * 
  FROM participant
  WHERE first_name 
  LIKE '%sh';  

  SELECT *
  FROM participant
  WHERE city like '_____n'

  SELECT * 
  FROM participant 
  WHERE other_name IS NULL;

  SELECT * 
  FROM participant 
  WHERE other_name IS NOT NULL;

  SELECT * 
  FROM participant 
  ORDER BY participant_id DESC;

# JOIN query
  SELECT first_name, last_name, kinship_name
  FROM participant
  JOIN kinship
  ON participant.kinship_id = kinship.kinship_id;

# JOIN query using aliases
  SELECT p.first_name as "First Name", p.last_name as "Last Name", k.kinship_name as "Relationship Name"
  FROM participant as p
  JOIN kinship as k
  ON p.kinship_id = k.kinship_id;

# More about NULL
  SELECT 1 IS NULL, 1 IS NOT NULL;

  SELECT 0 IS NULL, 0 IS NOT NULL, '' IS NULL, '' IS NOT NULL;

  SELECT 1 = NULL, 1 <> NULL, 1 < NULL, 1 > NULL;


# CASE query 
  CASE
      WHEN condition1 THEN result1
      WHEN condition2 THEN result2
      WHEN conditionN THEN resultN
      ELSE result
  END;

# CASE Example
  SELECT first_name, last_name, 
CASE
	WHEN mock_participant = 0 THEN "Not Eligible to enroll"
  ELSE "Eligible to enroll"
END AS Eligibility
FROM participant;


# CAST / CONVERT query
CAST(expression AS datatype);  
CONVERT(value, type)

# CAST Example
  SELECT CAST("2022-02-04" AS DATE);
  SELECT CAST(participant_id AS CHAR(50)) AS "Converted to CHAR using CAST function" FROM participant;
  SELECT CONVERT(participant_id, CHAR(50)) AS "Converted to CHAR using CONVERT function" FROM participant;
  SELECT CAST("10:00:00" AS TIME);
  SELECT CAST(3-6 AS SIGNED);  
  SELECT CONVERT("2022-02-04", DATE);