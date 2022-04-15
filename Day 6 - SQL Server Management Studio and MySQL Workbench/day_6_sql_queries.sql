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


