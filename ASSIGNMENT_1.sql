--creating database
CREATE DATABASE assignment_1;
SHOW DATABASES;             --SHOWS ALL DATABASES

/*
+--------------------+
| Database           |
+--------------------+
| assignment_1       |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
*/

USE assignment_1;           --Start using required database
CREATE TABLE a3_info(roll_no INT PRIMARY KEY, name VARCHAR(30) NOT NULL, surname VARCHAR(30) DEFAULT 'NO SURNAME');    --CREATES TABLE INSIDE A DATABASE NAMED "a3_info"

SHOW TABLES;
/*
+------------------------+
| Tables_in_assignment_1 |
+------------------------+
| a3_info                |
+------------------------+
*/
--INSERTING VALUES
INSERT INTO a3_info VALUES (37, 'INDRANEEL','SARODE');
INSERT INTO a3_info VALUES (38,'SHUBHAM','SHEWALE');
INSERT INTO a3_info VALUES (39,'AKSHAY','CHOBHE');
INSERT INTO a3_info VALUES (40,'SAKSHI','THOMBRE');
INSERT INTO a3_info VALUES (41, 'KETAN','CHAUDHARI');
INSERT INTO a3_info VALUES (42,'ARYAN','');

SELECT * FROM a3_info;
/*
+---------+-----------+-----------+
| roll_no | name      | surname   |
+---------+-----------+-----------+
|      37 | INDRANEEL | SARODE    |
|      38 | SHUBHAM   | SHEWALE   |
|      39 | AKSHAY    | CHOBHE    |
|      40 | SAKSHI    | THOMBRE   |
|      41 | KETAN     | CHAUDHARI |
|      42 | ARYAN     |           |
+---------+-----------+-----------+
*/
UPDATE a3_info SET name ='ARYAN',surname='SHARMA' WHERE roll_no=42;

/*
+---------+-----------+-----------+
| roll_no | name      | surname   |
+---------+-----------+-----------+
|      37 | INDRANEEL | SARODE    |
|      38 | SHUBHAM   | SHEWALE   |
|      39 | AKSHAY    | CHOBHE    |
|      40 | SAKSHI    | THOMBRE   |
|      41 | KETAN     | CHAUDHARI |
|      42 | ARYAN     | SHARMA    |
+---------+-----------+-----------+
*/

--DELETING ENTRY
DELETE FROM a3_info WHERE surname = 'SHARMA';
/*
+---------+-----------+-----------+
| roll_no | name      | surname   |
+---------+-----------+-----------+
|      37 | INDRANEEL | SARODE    |
|      38 | SHUBHAM   | SHEWALE   |
|      39 | AKSHAY    | CHOBHE    |
|      40 | SAKSHI    | THOMBRE   |
|      41 | KETAN     | CHAUDHARI |
+---------+-----------+-----------+
*/
