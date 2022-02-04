
#Create Table

# Syntax: 

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

# Example: 

CREATE TABLE `participant` (
  `participant_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `family_id` varchar(191) DEFAULT NULL,
  `mock_participant` boolean NOT NULL DEFAULT false,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `other_name` varchar(191) DEFAULT NULL,
  `kinship_id` int(11) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `relationship_with` bigint(20) DEFAULT NULL,
  `address_1` text,
  `address_2` text,
  `direction_id` int(11) DEFAULT NULL,
  `street_name` varchar(191) DEFAULT NULL,
  `street_type_id` int(11) DEFAULT NULL,
  `apt` varchar(191) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `birth_country_id` int(11) DEFAULT NULL,
  `if_other_birth_country` varchar(191) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `home_phone` char(12) DEFAULT NULL,
  `work_phone` char(12) DEFAULT NULL,
  `cell_phone` char(12) DEFAULT NULL,
  `dob` varchar(191) DEFAULT NULL,
  `age` varchar(5) DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `comments` varchar(191) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` boolean NOT NULL DEFAULT true,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`participant_id`)
);



# Insert query

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

INSERT INTO table_name
VALUES (value1, value2, value3, ...);

# Example 

INSERT INTO `participant` 
     (`family_id`, `mock_participant`, `first_name`, `last_name`, `kinship_id`, `address_1`, `city`, `state_id`, `birth_country_id`) 
VALUES 
     ('11111111', '1', 'Dinesh', 'Mendhe', '1', '25 Star St', 'Iselin', '1', '1');

INSERT INTO `participant` 
	(`family_id`, `mock_participant`, `first_name`, `last_name`, `kinship_id`, `address_1`, `city`, `state_id`, `birth_country_id`, `gender`) 
VALUES 
	('11111111', '0', 'Akriti', 'Dogra', '1', '25 Star St', 'Iselin', '1', '1', 'female');

# Select query:

# syntax 

SELECT column_name1, column_name2, ...
FROM table_name
WHERE condition
GROUP BY column_name1, column_name2, ...
ORDER BY column_name1, ...;

# Example:

SELECT *
FROM PARTICIPANT
WHERE first_name = "Dinesh"
      AND last_name = "Mendhe"
ORDER BY participant_id;

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
    WHEN gender like "Female" THEN "Greetings 'Madam'"
    ELSE "Greetings 'sir'"
END as "Greeting Text"
FROM participant;


# CAST / CONVERT query

CAST(expression AS datatype);  

# CAST Example

SELECT CAST("2022-02-04" AS DATE);  
SELECT CAST("10:00:00" AS TIME);
SELECT CAST(3-6 AS SIGNED);  
