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


# Creat view query

# Syntax
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

# Example
CREATE VIEW participant_kinship AS
SELECT first_name, last_name, kinship_name
FROM participant 
JOIN kinship 
ON participant.kinship_id = kinship.kinship_id;

SELECT * FROM participant_kinship;


# Grant query

# syntax
GRANT privilege_name 
ON object_name 
TO {user_name |PUBLIC |role_name} 
[WITH GRANT OPTION]; 


# Example
GRANT SELECT 
ON participant_kinship
TO dinesh;

# Revoke query

# syntax
REVOKE privilege_name 
ON object_name 
FROM {user_name |PUBLIC |role_name} 

# Example
REVOKE SELECT 
ON participant_kinship 
FROM dinesh;

# Query to check available host and users in your database

SELECT host, user FROM mysql.user;

# Create user query

# Syntax
CREATE USER 'username'@'host' IDENTIFIED BY 'password';

# Example
CREATE USER 'dinesh2'@'localhost' IDENTIFIED BY 'password';

# Drop User

# Syntax
DROP USER user_name;

# Example
DROP USER  'dinesh2'@'localhost';

# Grant privileges 

# Syntax
GRANT ALL ON *.* TO 'dinesh2'@'localhost' WITH GRANT OPTION;
flush privileges;

# Example

# Drop Role 

# Syntax 
DROP ROLE role_name;

# Example
DROP ROLE staff_role;


# Create Role 

# Syntax 
CREATE ROLE role_name;
OR 
CREATE ROLE role_name 
[IDENTIFIED BY password]; 

# Example
CREATE ROLE staff_role;

# Grant query for role 

# syntax
GRANT SELECT, INSERT, UPDATE, DELETE ON table_name TO role_name;

# Example
GRANT SELECT, INSERT, UPDATE, DELETE ON participant TO staff_role;

# Grant role to user

# Syntax 
GRANT role_name TO user_name;

# Examples 
GRANT staff_role TO dinesh;

# Join queries

# Inner join

# Syntax 
SELECT column_name_1, column_name_2, column_name_3
FROM table_name_1 
INNER JOIN table_name_2
ON table_name_1.column_name_x = table_name_2.column_name_x;

OR 

SELECT column_name_1, column_name_2, column_name_3
FROM table_name_1 
JOIN table_name_2
ON table_name_1.column_name_x = table_name_2.column_name_x;

OR 

SELECT column_name_1, column_name_2, column_name_3
FROM table_name_1 
JOIN table_name_2
USING (column_name_1);


# Example
SELECT first_name, last_name, kinship_name
FROM participant 
INNER JOIN kinship
ON participant.kinship_id = kinship.kinship_id


# Left join
# Syntax
SELECT column_name_1, column_name_2, column_name_3
FROM table_name_1
LEFT JOIN table_name_2
ON table_name_1.column_name_x = table_name_2.column_name_x;

# Example
SELECT first_name, last_name, kinship_name
FROM participant
LEFT JOIN kinship
ON participant.kinship_id = kinship.kinship_id;


# Right join
# Syntax
SELECT column_name_1, column_name_2, column_name_3, column_name_4, column_name_5
FROM table_name_1
RIGHT JOIN table_name_2
ON table_name_1.column_name_x = table_name_2.column_name_x;

# Example
SELECT first_name, last_name, kinship_name
FROM participant
RIGHT JOIN kinship
ON participant.kinship_id = kinship.kinship_id;

# Self join
# Syntax
SELECT column_name_1, column_name_2, column_name_3 
FROM table_name_1 as t1
SELF JOIN table_name_1 as t2
ON t1.column_name_x = t1.column_name_y;

# Example 
SELECT e.first_name, e.last_name, m.first_name as manager
FROM employee e
JOIN employee m
WHERE  e.manager_id = m.emp_id

SELECT e.manager_id,
       count(*)
FROM employee e,
     employee m
WHERE e.manager_id = m.emp_id
GROUP BY e.manager_id
ORDER BY e.manager_id ASC;


