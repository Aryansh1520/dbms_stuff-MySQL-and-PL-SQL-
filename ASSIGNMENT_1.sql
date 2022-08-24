/*
OBJECTIVES ACHIEVED 
CREATE
SHOW
INSERT
UPDATE
DELETE
ALTER
VIEW
SELECT
DROP

CONSTRAINTS:
NOT NULL
DEFAULT
AUTOINCREMENT (NOT IMPLEMENTED) CAN BE USED TO AUTO INCREMENT ROLL NUMBER
*/
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

--DROPPING A COLUMN
ALTER TABLE a3_info DROP COLUMN surname;
/*
+---------+-----------+
| roll_no | name      |
+---------+-----------+
|      37 | INDRANEEL |
|      38 | SHUBHAM   |
|      39 | AKSHAY    |
|      40 | SAKSHI    |
|      41 | KETAN     |
+---------+-----------+
*/
--ADDING A COLUMN
ALTER TABLE a3_info ADD surname VARCHAR(30) DEFAULT = 'SURNAME DELETED';
/*
+---------+-----------+-----------------+
| roll_no | name      | surname         |
+---------+-----------+-----------------+
|      37 | INDRANEEL | SURNAME DELETED |
|      38 | SHUBHAM   | SURNAME DELETED |
|      39 | AKSHAY    | SURNAME DELETED |
|      40 | SAKSHI    | SURNAME DELETED |
|      41 | KETAN     | SURNAME DELETED |
+---------+-----------+-----------------+
*/
--CREATING A VEIW (BASICALLY A VIRTUAL TABLE WHICH INHERITS COLUMNS FROM A TABLE ALREADY PRESENT)

CREATE VIEW veiw_1 AS SELECT roll_no , name FROM a3_info; --(WHERE STATEMENT CAN BE USED HERE)

SELECT * FROM veiw_1;
/*
+---------+-----------+
| roll_no | name      |
+---------+-----------+
|      37 | INDRANEEL |
|      38 | SHUBHAM   |
|      39 | AKSHAY    |
|      40 | SAKSHI    |
|      41 | KETAN     |
+---------+-----------+
*/
SELECT roll_no FROM veiw_1 WHERE name = 'SAKSHI';
/*
+---------+
| roll_no |
+---------+
|      40 |
+---------+
*/



