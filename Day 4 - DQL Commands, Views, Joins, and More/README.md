# Institute-for-Health---Database-Series-2022
# Day 4 - DCL Commands, Views, Joins, and More

# Table of Contents
- [✔️ What you will learn](#ifh-introduction)
- [✔️ DCL Commands, Views, Joins](#day-4-queries)
- [✔️ Advance Techniques](#advance-techniques)

## 👉 What you will learn <a name="what-you-will-learn"></a>
	• DCL Commands such as REVOKE and GRANT
	• Creating and dropping views
	• Using inner and outer joins
	• Using set operators (UNION, INTERSECT, EXCEPT)
	• Using subqueries


### <u>NOTE</u>: 

* DCL is data control language, it is used to control user access to data stored in database. 
* GRANT command is used to give permission to user to access the database, tables, views, and other database objects.
* REVOKE command is used to withdraw the access to the database, tables, views, and other database objects.
* Make sure to use hostname while creating user, granting, and revoking permissions. Ex: 'username'@'hostname' instead of just 'username'
* Views are used for security and simplicity. 
* It is not possible to create index on views. Views takes the advantage of indexes created on underlying table. 
* Views do not create physical table with memory footprint, it is only virtual logical table. 
* If underlying table is altered view needs to be modified accordingly. 
* ON clause is interchangeable with USING clause when joining key/ column names are similar.
* If JOIN type is not specified then database defaults to INNER JOIN
* MySQL does not support FULL JOIN but it can be achieved using LEFT JOIN, UNION, and RIGHT JOIN.
* LEFT JOIN is same as LEFT OUTER JOIN and RIGHT JOIN is same as RIGHT OUTER JOIN.
* URL: <a href="https://joins.spathon.com/">https://joins.spathon.com/</a>

<br/>

| System Privileges	| Description
| ----------------- | ----------- | 
| CREATE object	| allows users to create the specified object in their own schema. |
| CREATE ANY object |	allows users to create the specified object in any schema. |
<br/>

<br/>

| Object Privileges | Description
| ----------------- | ----------- | 
| INSERT	| Allows users to insert rows into a table.|
| SELECT    | Allows users to select data from a database object. |
| UPDATE	| Allows user to update data in a table.|
| EXECUTE   | Allows user to execute a stored procedure or a function. |
<br/>


## 👉 DQL Commands, Views, Joins <a name="day-4-queries"></a>
 * Please see day_4_sql_queries.sql file
 
## 👉 Advance Techniques  <a name="advance-techniques"></a>
	• Aggregating results using GROUP BY
	• Restricting groups with the HAVING clause
	• Inner Joins
	• Outer Joins (Left, Right, Full)
	• Joining a table to itself
	• Subqueries


