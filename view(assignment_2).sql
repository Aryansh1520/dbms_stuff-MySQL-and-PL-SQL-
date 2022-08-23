/*
OBJECTIVES COMPLETED 
CREATE VIEW 
DISPLAY VIEW
UPDATE 
ALTER
*/

CREATE DATABASE view_1;
USE view_1;
CREATE TABLE a3_info(roll_no INT NOT NULL, name VARCHAR(30),cs_lang VARCHAR(30),PRIMARY KEY (roll_no));
INSERT INTO a3_info VALUES(37,'INDRANEEL','SQL');
INSERT INTO a3_info VALUES(38,'SHUBHAM','PYTHON')
INSERT INTO a3_info VALUES(39,'AKSHAY','JAVA');
INSERT INTO a3_info VALUES(40,'SAKSHI','C++');
INSERT INTO a3_info VALUES(41,'KETAN','REACT');
SELECT * FROM a3_info;
/*
+---------+-----------+---------+
| roll_no | name      | cs_lang |
+---------+-----------+---------+
|      37 | INDRANEEL | SQL     |
|      38 | SHUBHAM   | PYTHON  |
|      39 | AKSHAY    | JAVA    |
|      40 | SAKSHI    | C++     |
|      41 | KETAN     | REACT   |
+---------+-----------+---------+
*/
CREATE VIEW temp AS SELECT roll_no , cs_lang FROM a3_info;
SHOW TABLES;
/*
+------------------+
| Tables_in_view_1 |
+------------------+
| a3_info          |
| temp             |
+------------------+
*/
SELECT * FROM temp;
/*
+---------+---------+
| roll_no | cs_lang |
+---------+---------+
|      37 | SQL     |
|      38 | PYTHON  |
|      39 | JAVA    |
|      40 | C++     |
|      41 | REACT   |
+---------+---------+
*/
UPDATE temp SET cs_lang='ANGULAR' WHERE roll_no=41;
/*
+---------+---------+
| roll_no | cs_lang |
+---------+---------+
|      37 | SQL     |
|      38 | PYTHON  |
|      39 | JAVA    |
|      40 | C++     |
|      41 | ANGULAR |
+---------+---------+
*/
ALTER VIEW temp AS SELECT name FROM a3_info;

/*
+-----------+
| name      |
+-----------+
| INDRANEEL |
| SHUBHAM   |
| AKSHAY    |
| SAKSHI    |
| KETAN     |
+-----------+
*/


