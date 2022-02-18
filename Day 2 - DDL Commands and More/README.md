# Institute-for-Health---Database-Series-2022
# Day 2 - DDL Commands and More

# Table of Contents
- [✔️ What you will learn](#ifh-introduction)
- [✔️ Creating a database and tables](#creating-a-Database)
- [✔️ Manipulate Query Results](#manipulate-query-results)
- [✔️ Advance Techniques](#advance-techniques)

## 👉 What you will learn <a name="what-you-will-learn"></a>
	• Create databases and tables, general principles
	• Using indexes, primary key, and foreign keys
	• Writing SQL queries
	• Using inner and outer joins
	• Using set operators (UNION, INTERSECT, EXCEPT)
	• Using subqueries


## 👉 Creating a database and tables <a name="creating-a-Database"></a>
	• Database development methodology
	• Building data models 
		○ Identifying entities and attributes
		○ Isolating keys
		○ Relationships between entities
	• Transforming to physical design
		○ Migrating entities to tables
		○ Selecting primary keys
		○ Defining columns
		○ Building relationships using foreign keys
--- 
Section Description:   

	  => Object which has its own independent existance in the real world called as entity.   
	  => Entity type is collection of entities have common attributes.   
	  => Attributes are the properties which describes the entity.   
	  Domain is set of permitted values. 
	  => Keys are use to uniquely identify row of data in a table, also to maintain data integrity and building relationship between multiple entities. 

	  Types of Keys: 
	  1. Super Key: An atrribute or set of attributes that can be used to identify row of a data in a table is a super key.   
	  2. Candidate Key: It is a minimal set of super key and mostly built using only one attribute.    
	  3. Primary Key: A primary key is candidate key chosen to uniquely identify each row of data in a table. Primary key cannot contain a null value. Each table should contain primary key.   
	  4. Alternate Key: All the candidate key which are not chosen as primary keys called as alternate key.   
	  5. Foreign key: An attribute in a table which is used to define relationship with another table. The data in foreign key field must exactly match data contained in the primary key field of original table.    
	  6. Composite Key: Any key with more than one attribute is called as composite key. 
	  7. Surrogate Key: When there is no natural primary key then surrogate key is used. Surrogate key do not add any meaning to data.  
	  8. Compound Key: If composite key has at-least one attribute which is a foreign key then it is called as Compound Key. 

### Following table structure follows Pascal Case 
### Student Table:
| SID | RegID  | FirstName | LastName | BranchID | Email
| ----------------- | ----------- | ------------------------- | -------------------- | -------------------- | -------------------- 
| 1   | 1111             | Jon | Doe        | 1 |  jon@test.com
| 2   | 1112             | Sam | Smith        | 1 | sam@test.com
| 3   | 1113             | Dinesh    | Mendhe                | 2 | dinesh@test.com
| 4   | 1114            | Akriti     | Dogra                | 2 | akriti@test.com    
   

### Branch Table:
| BranchID | BranchName |
| -------------------- |------------------------- |
| 1 | CS |
| 2 | ETC  |
| 3 | IT |
| 4 | EE |

### Keys:   
* SID
* RegID
* Email
* SID + RegID
* RegID + Email
* Email + SID
* SID + RegID + Email


### <u>NOTE</u>: 
* Index on commonly queried fields. 
* B-tree structure is commonly used for building indexes. Other non popular index types are Fractal Tree, LSM tree, R-Tree, Hash, etc. 
* B-tree structure has O(log n) time complexity / running time. 
* O(log N) basically means time goes up linearly while the n goes up exponentially. 
* User must reevaluate queries that takes more than 500 milliseconds (web applications and website).
* Primary key, Foreign key and Unique contraint creates indexes by default. 
* Primary key provides fastest lookup.
* Equality first and range next.
* Avoid negative clauses (IS NOT, IS NOT NULL, NOT IN, NOT LIKE, etc.) and subqueries to improve performance.
<br/>

## 👉 Basic SQL Queries  <a name="basic-sql-queries"></a>
	• Creating and displaying table structures
	• Inserting records in the table
	• Retrieving column data from a table
	• Selecting unique values
	• Filtering data using WHERE clause
	• Sorting results using ORDER BY
	• Joining multiple tables
	• Using column and table aliases

### <u>NOTE</u>: 
* Primary key does not accept null values whereas Unique key accepts null values. 
* For bulk insert use Transactions. As each insert triggers a reindex.
* Create ERD diagram to get big picture and make sure no two table contains similar column names within the database. Always use unique names to reduce ambiguity while fetching the records using join queries. 
* Use 'IF EXISTS' check before droping database or tables. 
<br/>


## 👉 Manipulate Query Results <a name="manipulate-query-results"></a>
	• Using row functions
		○ Character 
		○ Numeric
		○ Date and Time
		○ Data conversion (CAST and CONVERT) 
	• Using the CASE function
	• Handling Null values
 
## 👉 Advance Techniques  <a name="advance-techniques"></a>
	• Aggregating results using GROUP BY
	• Restricting groups with the HAVING clause
	• Inner Joins
	• Outer Joins (Left, Right, Full)
	• Joining a table to itself
	• Subqueries


