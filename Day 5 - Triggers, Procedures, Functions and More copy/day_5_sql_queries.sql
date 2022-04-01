# NOTE: Use code editors or IDEs for syntax highlighting and formatting code.

# Create database 

# Syntax
CREATE DATABASE database_name;

# Example
CREATE DATABASE ifh_database_series;
USE ifh_database_series;

# Drop query syntax
DROP DATABASE IF EXISTS database_name;
DROP TABLE IF EXISTS table_name;

# Example
DROP DATABASE IF EXISTS ifh_database_series;
DROP TABLE IF EXISTS participant;

# Create Table

# Syntax
CREATE TABLE table_name
(
  column_name1 data_type(size) constraint_name,
  column_name2 data_type(size) constraint_name,
  column_name3 data_type(size) constraint_name,
  column_name2 data_type(size) constraint_name,
  column_name3 data_type(size) constraint_name,
  column_name2 data_type(size) constraint_name,
  column_name3 data_type(size) constraint_name,
  ....
);

# Example
CREATE TABLE kinship(
   kinship_id INT NOT NULL AUTO_INCREMENT,
   kinship_name VARCHAR(100),
   PRIMARY KEY (kinship_id)
 );

CREATE TABLE `participant` (
  `participant_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT, # by default it is unique, also can be defined like: `participant_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY
  `family_id` VARCHAR(50) DEFAULT NULL,
  `mock_participant` boolean NOT NULL DEFAULT false,
  `first_name` VARCHAR(50) DEFAULT NULL, 
  `last_name` VARCHAR(50) DEFAULT NULL,
  `other_name` VARCHAR(70) DEFAULT NULL,
  `kinship_id` INT(11) DEFAULT NULL,
  `relationship_with` BIGINT(20) DEFAULT NULL,
  `address_1` TEXT,
  `address_2` TEXT,
  `direction_id` INT(11) DEFAULT NULL,
  `street_name` VARCHAR(80) DEFAULT NULL,
  `street_type_id` int(11) DEFAULT NULL,
  `apt` VARCHAR(50) DEFAULT NULL,
  `city` VARCHAR(30) DEFAULT NULL,
  `state_id` INT(11) DEFAULT NULL,
  `birth_country_id` INT(11) DEFAULT NULL,
  `if_other_birth_country` VARCHAR(191) DEFAULT NULL,
  `zipcode` VARCHAR(10) DEFAULT NULL,
  `home_phone` CHAR(12) DEFAULT NULL,
  `work_phone` CHAR(12) DEFAULT NULL,
  `cell_phone` CHAR(12) DEFAULT NULL,
  `email` VARCHAR(50) DEFAULT NULL UNIQUE,
  `dob` VARCHAR(15) DEFAULT NULL,
  `age` VARCHAR(5) DEFAULT NULL,
  `gender` VARCHAR(15) DEFAULT NULL,
  `comments` VARCHAR(200) DEFAULT NULL,
  `created_by` INT(11) DEFAULT NULL,
  `updated_by` INT(11) DEFAULT NULL,
  `status` BOOLEAN NOT NULL DEFAULT true,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`participant_id`),
  FOREIGN KEY (kinship_id) REFERENCES kinship(kinship_id)
);

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

INSERT INTO `kinship` (`kinship_name`) 
VALUES ('Grandmother');


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
	('11111111', '0', 'Vardan', 'Mendhe', '3', '25 Star St', 'Iselin', '1', '1', 'male', 'vm@test.com');
INSERT INTO `participant` 
	(`family_id`, `mock_participant`, `first_name`, `last_name`, `address_1`, `city`, `state_id`, `birth_country_id`, `gender`, `email`) 
VALUES 
	('11111111', '0', 'Miraya', 'Mendhe', '25 Star St', 'Iselin', '1', '1', 'female', 'mm@test.com');
COMMIT;

# Another practice table

CREATE TABLE employee (
    emp_id      INT  auto_increment NOT NULL, 
    first_name  VARCHAR(14) NOT NULL,
    last_name   VARCHAR(16) NULL,
    manager_id  INT NULL, 
    hire_date   DATE NULL,
    salary      DECIMAL NULL,
    PRIMARY KEY (emp_id)                  					
);

INSERT INTO `employee` (`first_name`, `last_name`, `manager_id`, `hire_date`, `salary`) VALUES ('John', 'Test1', NULL, '2020-08-08', '100');
INSERT INTO `employee` (`first_name`, `last_name`, `manager_id`, `hire_date`, `salary`) VALUES ('Jon', 'Test2', '1', '2020-09-09', '100');
INSERT INTO `employee` (`first_name`, `last_name`, `manager_id`, `hire_date`, `salary`) VALUES ('Sam', 'Test3', '1', '2020-10-10', '100');
INSERT INTO `employee` (`first_name`, `last_name`, `manager_id`, `hire_date`, `salary`) VALUES ('Dinesh', 'Test4', '1', '2020-11-11', '10');


# Create index query

# Syntax
  CREATE INDEX index_name
  ON table_name (column1, column2, ...);

# Example:
  CREATE INDEX idx_email
  ON participant (email);


# Creat trigger query

# Syntax
CREATE
    [DEFINER = user]
    TRIGGER [IF NOT EXISTS] trigger_name
    trigger_time trigger_event
    ON tbl_name FOR EACH ROW
    [trigger_order]
    trigger_body

trigger_time: { BEFORE | AFTER }
trigger_event: { INSERT | UPDATE | DELETE }
trigger_order: { FOLLOWS | PRECEDES } other_trigger_name;

# Example 1
DELIMITER //
CREATE TRIGGER salaryCorrection
BEFORE INSERT ON employee
FOR EACH ROW
IF NEW.salary < 0 THEN SET NEW.salary = 0;
END IF; //

OR

DELIMITER //
CREATE TRIGGER salaryCorrection
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
IF NEW.salary < 0 THEN SET NEW.salary = 0;
END IF;
END //
DELIMITER ;

INSERT INTO `employee` (`first_name`, `last_name`, `manager_id`, `hire_date`, `salary`) 
VALUES ('Liam', 'Dempsey', '1', '2020-11-11', '-10');


# Example 2
CREATE TABLE address_history 
  (home_id INT PRIMARY KEY AUTO_INCREMENT, 
  participant_id VARCHAR(10), 
  address_1 VARCHAR(20) DEFAULT NULL, 
  address_2 VARCHAR(20) DEFAULT NULL, 
  city VARCHAR(20) DEFAULT NULL, 
  state_id SMALLINT(2) DEFAULT NULL, 
  autotime DATETIME DEFAULT now()
  );
  
DELIMITER //
CREATE TRIGGER address_history
BEFORE DELETE ON participant
FOR EACH ROW
BEGIN
  INSERT INTO address_history(participant_id, address_1, address_2, city, state_id, autotime)
  VALUES(OLD.participant_id, OLD.address_1, OLD.address_2, OLD.city, OLD.state_id, now());
END //
DELIMITER ;


# Drop trigger query

# syntax
DROP TRIGGER [IF EXISTS] [schema_name.]trigger_name

# Example
DROP TRIGGER IF EXISTS salaryCorrection;


# Create procedure (To view all available procedures run: SHOW PROCEDURE STATUS;)

# syntax
DELIMITER //
CREATE 
[DEFINER = user]
PROCEDURE [IF NOT EXISTS] procedure_name [ (parameter datatype [, parameter datatype]) ]

BEGIN
   declaration_section
   executable_section
END; //
DELIMITER ;

# Procedure parameters
proc_parameter:
    [ IN | OUT | INOUT ] param_name type

IN - The parameter can be referenced by the procedure. The value of the parameter can not be overwritten by the procedure.
OUT - The parameter can not be referenced by the procedure, but the value of the parameter can be overwritten by the procedure.
IN OUT - The parameter can be referenced by the procedure and the value of the parameter can be overwritten by the procedure.

# Example 1
DELIMITER //
CREATE PROCEDURE sp_readEmployeeTbl()
BEGIN
   select * from employee;
END; //
DELIMITER ;

CALL sp_readEmployeeTbl();

# Example 2
DELIMITER //
CREATE PROCEDURE sp_getParticipantKinship()
BEGIN
SELECT first_name, last_name, kinship_name
FROM participant 
INNER JOIN kinship
ON participant.kinship_id = kinship.kinship_id;
END //
DELIMITER ;

CALL sp_getParticipantKinship();

# Example 3
CREATE PROCEDURE square_num (INOUT num INT) set num = num * num;

SET @a = 5;
CALL square_num(@a);
SELECT @a;

# Drop procedure query
DROP PROCEDURE IF EXISTS sp_readEmployeeTbl;


# Create function query (To view all available functions run: SHOW FUNCTION STATUS;)

# syntax
DELIMITER //
CREATE
[DEFINER = user]
FUNCTION [IF NOT EXISTS] function_name [ (parameter datatype [, parameter datatype]) ]
RETURNS return_datatype

BEGIN
   declaration_section
   executable_section
END; //
DELIMITER ;

# Example
DELIMITER //
CREATE FUNCTION fn_getCurrentYear()
RETURNS VARCHAR(4)
DETERMINISTIC
BEGIN
  DECLARE current_year VARCHAR(4);
  SET current_year = year(now()); 
  RETURN current_year;
END; //
DELIMITER ;

SELECT fn_getCurrentYear();


# Drop function query
DROP FUNCTION IF EXISTS fn_getCurrentYear;


# syntax
DROP FUNCTION [ IF EXISTS ] function_name;

# View all system/global variables
SHOW VARIABLES WHERE variable_name LIKE '%';
OR
SHOW VARIABLES;

# Local variable declaration and assignment
# Inside select statement
SELECT @name := "Dinesh Mendhe";

# Using SET keyword
SET @name = "Dinesh G Mendhe";
SELECT @name;

