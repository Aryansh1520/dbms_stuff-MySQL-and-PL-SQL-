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
CREATE VIEW veiw_1 AS SELECT roll_no,cs_lang FROM a3_info;
SELECT * FROM veiw_1;
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
ALTER VIEW veiw_1 AS SELECT name FROM a3_info;
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

