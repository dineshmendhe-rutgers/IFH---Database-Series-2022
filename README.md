# Institute-for-Health---Database-Series-2022

# Table of Contents

- [📚 Introduction](#ifh-introduction)
- [✍ Naming Convention](#naming-convention)
- [📊 Sample Database and Table structures](#sample-data)
- [🙏 Conclusion](#thank-you)
- [👋 About me/ Connect with me](#about-dinesh)
- [📙 References](#references)

# 👉 Introduction <a name = "ifh-introduction"></a>

The term "relational database" was invented by E. F. Codd at IBM in 1970. Codd introduced the term in his research paper "A Relational Model of Data for Large Shared Data Banks". One well-known definition of what constitutes a relational database system is composed of Codd's 12 rules. However, no commercial implementations of the relational model conform to all of Codd's rules, so the term has gradually come to describe a broader class of database systems, which at a minimum:

- Present the data to the user as relations (a presentation in tabular form, i.e. as a collection of tables with each table consisting of a set of rows and columns);
- Provide relational operators to manipulate the data in tabular form.

### Online editors: 
- http://sqlfiddle.com/
- https://livesql.oracle.com/apex/f?p=590:1000
- https://www.db-fiddle.com/

---

## Terminology

| SQL term        | Relational database term           | Description  |
| ------------- |:-------------:| -----:|
| Row           | Tuple or record or horizontal entity or entity instance| A data set representing a single item |
| Column        | Attribute or field or vertical entity     |   A labeled element of a tuple, e.g. "Address" or "Date of birth" |
| Table | Relation or base relvar or database object or entity   |    A set of tuples sharing the same attributes; a set of columns and rows |
| View or result set | Derived relvar      |    Any set of tuples; a data report from the RDBMS in response to a query |
--- 

# 👉 Naming Convention <a name = "naming-convention"></a>

- Follow the naming convention defined by your organization.
- Do not use reserved keywords/identifiers such as date, class, order, string, function, name, id, etc.
- Avoid abbreviations
- Avoid ""
- Avoid whitespaces
- Use singular words
- Pascal Casing***
- All lowercase and _
- Two tables which may possibly joined together, make column names more specific to remove ambiguity 
- Trigger name dbo.trxxxxUpdate
- Function name dbo.fnxxxxUpdate
- Stored procedure sp_xxxxx

# 👉 Sample Database and Table structures <a name = "sample-data"></a>

## Create Database
```SQL
create database ifh_database;
```

## Create Tables
```SQL
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
```


```SQL
CREATE TABLE `Home` (
  `HomeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Address1` varchar(20) DEFAULT NULL,
  `Address2` varchar(20) DEFAULT NULL,
  `StreetNumber` varchar(10) DEFAULT NULL,
  `StreetDirection` varchar(20) DEFAULT NULL,
  `StreetName` varchar(40) DEFAULT NULL,
  `StreetType` varchar(10) DEFAULT NULL,
  `Apt` varchar(10) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zip` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(30) DEFAULT NULL,
  `TranDate` bigint(20) DEFAULT NULL,
  `Autotime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TranUser` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`HomeID`)
);

CREATE TABLE `User` (
  `UserID` varchar(15) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Type` int(10) unsigned DEFAULT NULL,
  `HomeID` int(10) unsigned NOT NULL,
  `FamilyID` varchar(8) DEFAULT NULL,
  `Kinship` varchar(1) DEFAULT NULL,
  `FirstName` varchar(40) DEFAULT NULL,
  `LastName` varchar(40) DEFAULT NULL,
  `ChineseName` varchar(40) DEFAULT NULL,
  `WorkPhone` varchar(30) DEFAULT NULL,
  `CellPhone` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DobMonth` varchar(2) DEFAULT NULL,
  `DobDay` varchar(2) DEFAULT NULL,
  `DobYear` varchar(4) DEFAULT NULL,
  `Age` varchar(3) DEFAULT NULL,
  `BornCountry` varchar(40) DEFAULT NULL,
  `OtherCountry` varchar(100) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `comment` text,
  `TranDate` bigint(20) DEFAULT NULL,
  `Autotime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`),
  KEY `UserHome` (`HomeID`),
  CONSTRAINT `UserHome` FOREIGN KEY (`HomeID`) REFERENCES `Home` (`HomeID`) ON DELETE CASCADE ON UPDATE CASCADE
);
```

```SQL
CREATE TABLE "candidates" (
"id" INTEGER PRIMARY KEY NOT NULL, 
"first_name" VARCHAR NOT NULL, 
"last_name" VARCHAR NOT NULL , 
"middle_name" VARCHAR, 
"party" VARCHAR NOT NULL );

CREATE TABLE "contributors" (
"id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL, 
"last_name" VARCHAR, 
"first_name" VARCHAR, 
"middle_name" VARCHAR, 
"street_1" VARCHAR, 
"street_2" VARCHAR, 
"city" VARCHAR, 
"state" VARCHAR, 
"zip" VARCHAR, 
"amount" INTEGER, 
"date" DATETIME, 
"candidate_id" INTEGER NOT NULL,
FOREIGN KEY(candidate_id) REFERENCES candidates(id)
);
```

```SQL
create table students(
	id	int not null primary key,
	studentname varchar(50)
);

create table teachers(
	id	int not null primary key,
	teachername varchar(50)
);

create table classes(
	id int not null primary key,
	classname varchar(50)
);

create table classschedules(
	id int not null primary key,
	classId int not null foreign key references classes(id),
	teacherId int not null foreign key references teachers(id),
	fromdate datetime,
	todate datetime
);

create table studentenrollments(
	id int not null primary key,
	studentid int not null foreign key references students(id),
	classscheduleid int not null foreign key references classschedules(id),
	enrolldate datetime,
	grade varchar(10)
);
```

# 👉 Connect with me <a name = "about-dinesh"></a>
 - Email: dmendhe@ifh.rutgers.edu  
 - Phone: (845) 464-5347


 # 👉 References <a name = "references"></a>

 - https://dev.mysql.com/doc/
 - https://docs.microsoft.com/en-us/sql/sql-server/educational-sql-resources?view=sql-server-ver15
 - https://www.geeksforgeeks.org/sql-tutorial/
 - https://www.w3schools.com/sql/default.asp
 - https://docs.oracle.com/cd/B28359_01/nav/portal_4.htm
 - https://joins.spathon.com/
 - https://www.w3schools.com/mysql/mysql_ref_functions.asp