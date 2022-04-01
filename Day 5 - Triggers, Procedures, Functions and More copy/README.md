# Institute-for-Health---Database-Series-2022
# Day 5 - Triggers, procedures, functions, and more.

# Table of Contents
- [✔️ What you will learn](#ifh-introduction)
- [✔️ Triggers, procedures, functions, and subqueries](#day-5-queries)
- [✔️ Advance Techniques](#advance-techniques)

## 👉 What you will learn <a name="what-you-will-learn"></a>
	• Triggers (Before and after insert, before and after update, and before and after delete)
	• Stored procedure
	• Stored function
	• Nested queries

### <u>NOTE</u>: 

* Triggers runs in response to an event such as insert, update, or delete. 
* Triggers should not be overly used. 
* Triggers can be used to enforce data integrity and security when application level business logic not capable of handling it. 
* Stored procedure and stored functions are two classification of stored routines. 
* Stored procedure and functions are API's for the database. 
* All database operations like insert, delete, update, etc are allowed within the stored procedure whereas only select operation is allowed in the function.
* Function must return a result or a value to the caller.
* Transactions can be used in the stored procedure whereas it is not allowed in function. 
* User can call function from select statement whereas stored procedure can not be called from select, having or where clause.
* Stored procedure can call one or more stored functions if required whereas stored function can not call stored procedure.
* Stored procedure supports in, out, in-out parameters whereas function supports only input parameters. 
* RDBMS comes with default set of functions such as string functions, numeric functions, date functions, and aggregate functions.
* There are three variable types local, global and user-defined. 


<br/>

| Stored Function	| Stored Procedure
| ----------------- | ----------- | 
| It is special kind of routine that returns only single value upon execution | It does not return a value but OUT parameter can be used to read value out.|
| Stored function consist of reusable set of SQL statement grouped together to perform a task | Stored procedure also consist of reusable set of SQL statement grouped together to perform a task |
| Function parameter contain only IN parameter | Procedure contains IN, OUT, INOUT parameters  |
| It can be called within SQL statements |	It can not be called within SQL statements  |
<br/>


<br/>

| Global Variable/ System variable	| Local variable
| ----------------- | ----------- | 
| Global variable has scope across all connections and user sessions | Local variable often used in stored procedure and scope is limited to execution context|
<br/>


# Commonly used functions
 * String functions
 * Numeric funtions
 * Date functions

# String functions
<table>
    <tbody>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_ascii.asp">ASCII</a></td>
            <td>Returns the ASCII value for the specific character</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_char_length.asp">CHAR_LENGTH</a></td>
            <td>Returns the length of a string (in characters)</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_character_length.asp">CHARACTER_LENGTH</a></td>
            <td>Returns the length of a string (in characters)</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_concat.asp">CONCAT</a></td>
            <td>Adds two or more expressions together</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_concat_ws.asp">CONCAT_WS</a></td>
            <td>Adds two or more expressions together with a separator</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_field.asp">FIELD</a></td>
            <td>Returns the index position of a value in a list of values</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_find_in_set.asp">FIND_IN_SET</a></td>
            <td>Returns the position of a string within a list of strings</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_format.asp">FORMAT</a></td>
            <td>Formats a number to a format like &quot;#,###,###.##&quot;, rounded to a specified number of decimal places</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_insert.asp">INSERT</a></td>
            <td>Inserts a string within a string at the specified position and for a certain number of characters</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_instr.asp">INSTR</a></td>
            <td>Returns the position of the first occurrence of a string in another string</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_lcase.asp">LCASE</a></td>
            <td>Converts a string to lower-case</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_left.asp">LEFT</a></td>
            <td>Extracts a number of characters from a string (starting from left)</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_length.asp">LENGTH</a></td>
            <td>Returns the length of a string (in bytes)</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_locate.asp">LOCATE</a></td>
            <td>Returns the position of the first occurrence of a substring in a string</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_lower.asp">LOWER</a></td>
            <td>Converts a string to lower-case</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_lpad.asp">LPAD</a></td>
            <td>Left-pads a string with another string, to a certain length</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_ltrim.asp">LTRIM</a></td>
            <td>Removes leading spaces from a string</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_mid.asp">MID</a></td>
            <td>Extracts a substring from a string (starting at any position)</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_position.asp">POSITION</a></td>
            <td>Returns the position of the first occurrence of a substring in a string</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_repeat.asp">REPEAT</a></td>
            <td>Repeats a string as many times as specified</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_replace.asp">REPLACE</a></td>
            <td>Replaces all occurrences of a substring within a string, with a new substring</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_reverse.asp">REVERSE</a></td>
            <td>Reverses a string and returns the result</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_right.asp">RIGHT</a></td>
            <td>Extracts a number of characters from a string (starting from right)</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_rpad.asp">RPAD</a></td>
            <td>Right-pads a string with another string, to a certain length</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_rtrim.asp">RTRIM</a></td>
            <td>Removes trailing spaces from a string</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_space.asp">SPACE</a></td>
            <td>Returns a string of the specified number of space characters</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_strcmp.asp">STRCMP</a></td>
            <td>Compares two strings</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_substr.asp">SUBSTR</a></td>
            <td>Extracts a substring from a string (starting at any position)</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_substring.asp">SUBSTRING</a></td>
            <td>Extracts a substring from a string (starting at any position)</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_substring_index.asp">SUBSTRING_INDEX</a></td>
            <td>Returns a substring of a string before a specified number of delimiter occurs</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_trim.asp">TRIM</a></td>
            <td>Removes leading and trailing spaces from a string</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_ucase.asp">UCASE</a></td>
            <td>Converts a string to upper-case</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_upper.asp">UPPER</a></td>
            <td>Converts a string to upper-case</td>
        </tr>
    </tbody>
</table>


# Numeric funtions 
<table>
    <thead>
        <tr>
            <th>Function</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_abs.asp">ABS</a></td>
            <td>Returns the absolute value of a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_acos.asp">ACOS</a></td>
            <td>Returns the arc cosine of a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_asin.asp">ASIN</a></td>
            <td>Returns the arc sine of a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_atan.asp">ATAN</a></td>
            <td>Returns the arc tangent of one or two numbers</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_atan2.asp">ATAN2</a></td>
            <td>Returns the arc tangent of two numbers</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_avg.asp">AVG</a></td>
            <td>Returns the average value of an expression</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_ceil.asp">CEIL</a></td>
            <td>Returns the smallest integer value that is &gt;= to a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_ceiling.asp">CEILING</a></td>
            <td>Returns the smallest integer value that is &gt;= to a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_cos.asp">COS</a></td>
            <td>Returns the cosine of a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_cot.asp">COT</a></td>
            <td>Returns the cotangent of a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_count.asp">COUNT</a></td>
            <td>Returns the number of records returned by a select query</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_degrees.asp">DEGREES</a></td>
            <td>Converts a value in radians to degrees</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_div.asp">DIV</a></td>
            <td>Used for integer division</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_exp.asp">EXP</a></td>
            <td>Returns e raised to the power of a specified number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_floor.asp">FLOOR</a></td>
            <td>Returns the largest integer value that is &lt;= to a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_greatest.asp">GREATEST</a></td>
            <td>Returns the greatest value of the list of arguments</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_least.asp">LEAST</a></td>
            <td>Returns the smallest value of the list of arguments</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_ln.asp">LN</a></td>
            <td>Returns the natural logarithm of a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_log.asp">LOG</a></td>
            <td>Returns the natural logarithm of a number, or the logarithm of a number to a specified base</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_log10.asp">LOG10</a></td>
            <td>Returns the natural logarithm of a number to base 10</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_log2.asp">LOG2</a></td>
            <td>Returns the natural logarithm of a number to base 2</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_max.asp">MAX</a></td>
            <td>Returns the maximum value in a set of values</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_min.asp">MIN</a></td>
            <td>Returns the minimum value in a set of values</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_mod.asp">MOD</a></td>
            <td>Returns the remainder of a number divided by another number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_pi.asp">PI</a></td>
            <td>Returns the value of PI</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_pow.asp">POW</a></td>
            <td>Returns the value of a number raised to the power of another number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_power.asp">POWER</a></td>
            <td>Returns the value of a number raised to the power of another number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_radians.asp">RADIANS</a></td>
            <td>Converts a degree value into radians</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_rand.asp">RAND</a></td>
            <td>Returns a random number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_round.asp">ROUND</a></td>
            <td>Rounds a number to a specified number of decimal places</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_sign.asp">SIGN</a></td>
            <td>Returns the sign of a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_sin.asp">SIN</a></td>
            <td>Returns the sine of a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_sqrt.asp">SQRT</a></td>
            <td>Returns the square root of a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_sum.asp">SUM</a></td>
            <td>Calculates the sum of a set of values</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_tan.asp">TAN</a></td>
            <td>Returns the tangent of a number</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_truncate.asp">TRUNCATE</a></td>
            <td>Truncates a number to the specified number of decimal places</td>
        </tr>
    </tbody>
</table>


# Date funtions
<table>
    <thead>
        <tr>
            <th>Function</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_adddate.asp">ADDDATE</a></td>
            <td>Adds a time/date interval to a date and then returns the date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_addtime.asp">ADDTIME</a></td>
            <td>Adds a time interval to a time/datetime and then returns the time/datetime</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_curdate.asp">CURDATE</a></td>
            <td>Returns the current date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_current_date.asp">CURRENT_DATE</a></td>
            <td>Returns the current date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_current_time.asp">CURRENT_TIME</a></td>
            <td>Returns the current time</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_current_timestamp.asp">CURRENT_TIMESTAMP</a></td>
            <td>Returns the current date and time</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_curtime.asp">CURTIME</a></td>
            <td>Returns the current time</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_date.asp">DATE</a></td>
            <td>Extracts the date part from a datetime expression</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_datediff.asp">DATEDIFF</a></td>
            <td>Returns the number of days between two date values</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_date_add.asp">DATE_ADD</a></td>
            <td>Adds a time/date interval to a date and then returns the date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_date_format.asp">DATE_FORMAT</a></td>
            <td>Formats a date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_date_sub.asp">DATE_SUB</a></td>
            <td>Subtracts a time/date interval from a date and then returns the date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_day.asp">DAY</a></td>
            <td>Returns the day of the month for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_dayname.asp">DAYNAME</a></td>
            <td>Returns the weekday name for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_dayofmonth.asp">DAYOFMONTH</a></td>
            <td>Returns the day of the month for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_dayofweek.asp">DAYOFWEEK</a></td>
            <td>Returns the weekday index for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_dayofyear.asp">DAYOFYEAR</a></td>
            <td>Returns the day of the year for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_extract.asp">EXTRACT</a></td>
            <td>Extracts a part from a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_from_days.asp">FROM_DAYS</a></td>
            <td>Returns a date from a numeric datevalue</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_hour.asp">HOUR</a></td>
            <td>Returns the hour part for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_last_day.asp">LAST_DAY</a></td>
            <td>Extracts the last day of the month for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_localtime.asp">LOCALTIME</a></td>
            <td>Returns the current date and time</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_localtimestamp.asp">LOCALTIMESTAMP</a></td>
            <td>Returns the current date and time</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_makedate.asp">MAKEDATE</a></td>
            <td>Creates and returns a date based on a year and a number of days value</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_maketime.asp">MAKETIME</a></td>
            <td>Creates and returns a time based on an hour, minute, and second value</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_microsecond.asp">MICROSECOND</a></td>
            <td>Returns the microsecond part of a time/datetime</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_minute.asp">MINUTE</a></td>
            <td>Returns the minute part of a time/datetime</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_month.asp">MONTH</a></td>
            <td>Returns the month part for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_monthname.asp">MONTHNAME</a></td>
            <td>Returns the name of the month for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_now.asp">NOW</a></td>
            <td>Returns the current date and time</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_period_add.asp">PERIOD_ADD</a></td>
            <td>Adds a specified number of months to a period</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_period_diff.asp">PERIOD_DIFF</a></td>
            <td>Returns the difference between two periods</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_quarter.asp">QUARTER</a></td>
            <td>Returns the quarter of the year for a given date value</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_second.asp">SECOND</a></td>
            <td>Returns the seconds part of a time/datetime</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_sec_to_time.asp">SEC_TO_TIME</a></td>
            <td>Returns a time value based on the specified seconds</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_str_to_date.asp">STR_TO_DATE</a></td>
            <td>Returns a date based on a string and a format</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_subdate.asp">SUBDATE</a></td>
            <td>Subtracts a time/date interval from a date and then returns the date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_subtime.asp">SUBTIME</a></td>
            <td>Subtracts a time interval from a datetime and then returns the time/datetime</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_sysdate.asp">SYSDATE</a></td>
            <td>Returns the current date and time</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_time.asp">TIME</a></td>
            <td>Extracts the time part from a given time/datetime</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_time_format.asp">TIME_FORMAT</a></td>
            <td>Formats a time by a specified format</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_time_to_sec.asp">TIME_TO_SEC</a></td>
            <td>Converts a time value into seconds</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_timediff.asp">TIMEDIFF</a></td>
            <td>Returns the difference between two time/datetime expressions</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_timestamp.asp">TIMESTAMP</a></td>
            <td>Returns a datetime value based on a date or datetime value</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_to_days.asp">TO_DAYS</a></td>
            <td>Returns the number of days between a date and date &quot;0000-00-00&quot;</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_week.asp">WEEK</a></td>
            <td>Returns the week number for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_weekday.asp">WEEKDAY</a></td>
            <td>Returns the weekday number for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_weekofyear.asp">WEEKOFYEAR</a></td>
            <td>Returns the week number for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_year.asp">YEAR</a></td>
            <td>Returns the year part for a given date</td>
        </tr>
        <tr>
            <td><a href="https://www.w3schools.com/mysql/func_mysql_yearweek.asp">YEARWEEK</a></td>
            <td>Returns the year and week number for a given date</td>
        </tr>
    </tbody>
</table> 

## 👉 Triggers, procedures, functions, and more. <a name="day-5-queries"></a>
 * Please see day_5_sql_queries.sql file
 
## 👉 Advance Techniques  <a name="advance-techniques"></a>
	• Procedures with IN, OUT and INOUT parameter.
	• One liner procedures and functions


