# Institute-for-Health---Database-Series-2022
# Day 1 - SQL Basics

# Table of Contents
- [✔️ What you will learn](#ifh-introduction)
- [✔️ Database Fundamentals](#database-fundamentals)

## 👉 What you will learn <a name="what-you-will-learn"></a>
	• Design normalized table structures for relational databases
	• Create databases and tables
	• Using primary and foreign keys
	• Writing SQL queries
	• Using inner and outer joins
	• Using set operators (UNION, INTERSECT, EXCEPT)
	• Using subqueries

## 👉 Database Fundamentals <a name="database-fundamentals"></a>
	• Overview of relational database concepts
	• Relational databases and relational database management system
	• Data normalization

---
Section Description:   

	   Overview:   
	   SQL is a declarative language and it is used to create and manipulate relational databases. It is not about "How" but "What" results the user wants to see without worrying about low-level implementation details. In procedural, object-oriented, or in functional language oftentimes (when prebuilt packages are not imported/used) user needs to define every detailed step on how the program will execute, whereas it is not the same case with SQL as built-in algorithms and optimizers help with the jobs.   

	   Relational Database is optimized location to store and retrive structured data. It also can be viewed as collection of information organized in tables. Relational data often contains data on specific entities. SQL (Structured Query Language) is used for querying the data stored in relational databases.   		
	   
	   Relational database architecture helps to reduce redundancy and increase consistency and accuracy, its structure allows bidirectioinal enforceable relationships, fast retrival, and handling of a large amount of data breeze. They are widely used with web, mobile, and desktop applications to store persistant data. Other features they provide is strong security, backup, replication, performance monitoring, error management, memory management, and report generation.   

	   Fields are also called as “columns” or “attributes”. A set of attributes comprises a record, and a record are also “row” or “tuple”.


	   Cons:   
	   It is not good at handling unstructured data.

	   Normalization:
	   Breaking down the tables into optimized manageable, focused entities to reduce data redundancy, improve data integrity, and to avoid insertion, deletion, and updation anomalies.      

	   First Noramal form:  
		1. Must contain primary key and each row of the table must be unique
		2. A table must not have repeating group of columns  
		3. Each column contains atomic values (a column must not contain composite or multi-valued attributes)   

	   Second Normal Form:   
		1. Must abide by first normal form        
		2. Table should not contain partial dependencies.     
		3. Each table must contain data about only one type of thing.   

	   Third Normal Form:    
	    1. Must abide by second normal form   
		2. Table must not contain transitive functional dependencies i.e all attributes of a table must only depend on primary key of the table directly, and not through transitive linking        
		---

## Data Types

		- CHARACTER [(length)] or CHAR [(length)]
		- VARCHAR (length)
		- BOOLEAN
		- SMALLINT
		- INTEGER or INT
		- DECIMAL [(p[,s])] or DEC [(p[,s])]
		- NUMERIC [(p[,s])]
		- REAL
		- FLOAT(p)
		- DOUBLE PRECISION
		- DATE
		- TIME
		- TIMESTAMP
		- CLOB [(length)] or CHARACTER LARGE OBJECT [(length)] or CHAR LARGE OBJECT [(length)]
		- BLOB [(length)] or BINARY LARGE OBJECT [(length)]
		--- 

### The following is a list of the most frequently used data types.

| Type       | Description                                   | Example Value           |
| ---------- | --------------------------------------------- | ----------------------- |
| int        | Numbers                                       | 5                      |
| float      | Decimal numbers                               | 1.15                    |
| varchar(N) | String with variable maximum of N characters  | "Rutgers"                |
| text       | String with fixed maximum of 65535 characters | "This is a Lorem Ipsum Dummy Text"              |
| datetime   | Store date and time without timezone          | 2022-01-01 22:10:23     |
| timestamp  | Store date with timezone (e.g. last login)    | 2022-01-01 22:10:23 UTC |
| BLOB       | Store binary files                            | an image                |

#### Tips
        1. CHAR is fixed length, always try to use VARCHAR to optimize storage requirement. Although VARCHAR has database engine level overhead to keep track of dynamic size of values for the given attribute, it is still preferred. 
		CHAR only should be used in cases such as phone numbers, zipcodes, SSN, Gender, etc which has defined size and where size requirement does not vary.   

		2. INT/INTEGER is used for storing whole numbers. INT and DECIMAL data types maintains precision because of this behaviour they are preferred wherever accuracy in mathematical calculations matters. FLOAT and DOUBLE should be avoided wherever precision in calculation is required.   
		For currency/money use DECIMAL type.

		3. Always use "" for marking start and end of text field data and use '' for in between words/sentenses. 

		4. Although datetime, date, and time can be stored as string values, always use respective data types such as DATETIME, TIME, DATE, and TIMESTAMP.   
		DATETYPE, DATE, TIME and TIMESTAMP are passed as string value using " or ' quote and similary also used in SQL queries.  

		5. Always think global.

### Valid and Invalid 

		- CHAR(10) or CHARACTER(10)
		* Valid  
		'Race car'  
		'RACECAR'  
		'24865'  
		'1998-10-25'  
		'1998-10-25 ' (Blank characters are truncated)  

		* Invalid  
		24865  
		1998-10-25  
		'Date: 1998-10-25'  


		- VARCHAR(10)
		* Valid  
		'Race car'  
		'RACECAR'  
		'24865'  
		'1998-10-25'  
		'1998-10-25 '  

		* Invalid  
		24865  
		1998-10-25  
		'Date: 1998-10-25'  


		- BOOLEAN
		* Valid  
		TRUE    
		true  
		True  
		False  

		* Invalid**  
		1  
		0  
		Yes  
		No  

		- SMALLINT
		* Valid  
		-32768  
		0  
		-30.3 (digits to the right of the decimal point are truncated)  
		32767  

		* Invalid  
		-33,000,567  
		-32769  
		32768  
		1,897,536,000  

		- INTEGER or INT
		* Valid  
		-2147483648  
		-1025  
		0  
		1025.98 (digits to the right of the decimal point are truncated)  
		2147483647  

		* Invalid
		-1,025,234,000,367  
		-2147483649  
		2147483648  
		1,025,234,000,367  

		- DECIMAL(10,3)
		* Valid  
		1234567  
		1234567.123  
		1234567.1234 (Final digit is truncated)  
		-1234567  
		-1234567.123  
		-1234567.1234 (Final digit is truncated)  

		* Invalid  
		12345678  
		12345678.12  
		12345678.123  
		-12345678  
		-12345678.12  
		-12345678.123  

		- REAL
		* Valid  
		-2345  
		0  
		1E-3  
		1.245  
		123456789012345678901234567890  

		* Invalid
		123,456,789,012,345,678,901,234,567,890,123  

		- DATE
		* Valid  
		DATE '1999-01-01'  
		DATE '2000-2-2'  
		date '0-1-1'  

		* Invalid  
		DATE '1999-13-1'  
		date '2000-2-30'  
		'2000-2-27'  
		date 2000-2-27  


		- TIME
		* Valid  
		TIME '00:00:00'  
		TIME '1:00:00'  
		TIME '23:59:59'  
		time '23:59:59.99'  

		* Invalid
		TIME '00:62:00' 
		TIME '00:3:00'  
		TIME '23:01'  
		'24:01:00'  

		- TIMESTAMP
		* Valid  
		TIMESTAMP `1999-12-31 23:59:59.99' 
		TIMESTAMP `0-01-01 00:00:00'  

		* Invalid  
		1999-00-00 00:00:00  
		TIMESTAMP `1999-01-01 00:64:00'  
---
