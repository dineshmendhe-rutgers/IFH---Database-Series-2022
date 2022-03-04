# Institute-for-Health---Database-Series-2022
# Day 2 - DDL Commands and More

# Table of Contents
- [✔️ What you will learn](#ifh-introduction)
- [✔️ Manipulate Query Results](#manipulate-query-results)
- [✔️ Advance Techniques](#advance-techniques)

## 👉 What you will learn <a name="what-you-will-learn"></a>
	• Revisiting - indexes, primary key, and foreign keys benefits and side effects
	• BST and B-Trees algorithm 
	• Writing Data Manipulation queries
	• Using inner and outer joins
	• Using set operators (UNION, INTERSECT, EXCEPT)
	• Using subqueries


### <u>NOTE</u>: 
* To visualize B-Tree visit <a href="https://www.cs.usfca.edu/~galles/visualization/BTree.html">https://www.cs.usfca.edu/~galles/visualization/BTree.html</a>
* Balanced BST has time complexity O(log (n)) and unbalanced BST has time complexity O(n)
* Although indexes improve the performance but too many indexes may slow down DML queries. 
i.e every insert, delete, and update in the table will need insert, update, and delete in the index as well. 
* There are Clustered and Non-clustered index.
* On a table only one clustered index is allowed whereas multiple non-clustered index can be created (most database max limit is 999). 
* Adding primary key action automatically creates a clustered index.
* Non-clustered index points to the data and clustered index organizes the data/ defines the order in which data is stored.
* Avoid creating index on the column which is not going to be used that often. 
* If you are joining two tables with specific column make sure to create a index on that column.
* Be cognizant on using function on index column, database may ingore already created index because of function application.
* Index (a,b) is not same as index (b,a)
* Creating index on temp table is allowed.
* Avoid negative clauses (IS NOT, IS NOT NULL, NOT IN, NOT LIKE, etc.) and subqueries to improve performance.
* Try to convert <> operator to = operator.
* Avoid SELECT * instead use specific column names.
* Use UNION ALL instead of UNION whenever possible.
<br/>

| Storage Engine	| Allowed Index Types
| ----------------- | ----------- | 
| InnoDB	| BTREE |
| MyISAM	| BTREE |
| MEMORY/HEAP |	HASH, BTREE
<br/>


### <u>B-Tree Properties (B-Tree of order M)</u>: 
* Every node has at most M children
* A non-leaf node with K children contain K-1 keys 
* The root has at least two children if it is not a leaf node
* Every non-leaf node except root has at least M/2 children
* All leaves appear in the same level


## 👉 Manipulate Query Results <a name="manipulate-query-results"></a>
	• Using row functions
	• Using the CASE function
	• Handling Null values
 
## 👉 Advance Techniques  <a name="advance-techniques"></a>
	• Aggregating results using GROUP BY
	• Restricting groups with the HAVING clause
	• Inner Joins
	• Outer Joins (Left, Right, Full)
	• Joining a table to itself
	• Subqueries


