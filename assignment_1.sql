/*ASSIGMENT 1 + VIEW PART OF ASSIGNMENT 2
*/



CREATE DATABASE group_2;
SHOW DATABASES;
/*
+--------------------+
| Database           |
+--------------------+
| group_2            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
*/

USE group_2;
CREATE TABLE student_info (roll_no INT ,name VARCHAR(30),submission_status VARCHAR(30));
INSERT INTO student_info VALUES(26,'PRANJAL','NA');
INSERT INTO student_info VALUES(27,'PRASHANT','NA');
INSERT INTO student_info VALUES(28,'AADARSH','NA');
INSERT INTO student_info VALUES(29,'TEJAS','NA');
INSERT INTO student_info VALUES(30,'OM','NA');
INSERT INTO student_info VALUES(31,'HEMANT','NA');
INSERT INTO student_info VALUES(32,'DHANASHREE','NA');
INSERT INTO student_info VALUES(33,'UTKARSH','NA');

SELECT * FROM student_info;

/*
+---------+------------+-------------------+
| roll_no | name       | submission_status |
+---------+------------+-------------------+
|      26 | PRANJAL    | NA                |
|      27 | PRASHANT   | NA                |
|      28 | AADARSH    | NA                |
|      29 | TEJAS      | NA                |
|      30 | OM         | NA                |
|      31 | HEMANT     | NA                |
|      32 | DHANASHREE | NA                |
|      33 | UTKARSH    | NA                |
+---------+------------+-------------------+
*/
ALTER TABLE student_info ADD PRIMARY KEY(roll_no);

desc student_info;
/*
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| roll_no           | int         | NO   | PRI | NULL    |       |
| name              | varchar(30) | YES  |     | NULL    |       |
| submission_status | varchar(30) | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
*/

ALTER TABLE student_info ADD COLUMN teacher_name VARCHAR(30) DEFAULT  'DEEPALI';

/*
+---------+------------+-------------------+--------------+
| roll_no | name       | submission_status | teacher_name |
+---------+------------+-------------------+--------------+
|      26 | PRANJAL    | NA                | DEEPALI      |
|      27 | PRASHANT   | NA                | DEEPALI      |
|      28 | AADARSH    | NA                | DEEPALI      |
|      29 | TEJAS      | NA                | DEEPALI      |
|      30 | OM         | NA                | DEEPALI      |
|      31 | HEMANT     | NA                | DEEPALI      |
|      32 | DHANASHREE | NA                | DEEPALI      |
|      33 | UTKARSH    | NA                | DEEPALI      |
+---------+------------+-------------------+--------------+

*/

UPDATE student_info SET submission_status = 'COMPLETED' WHERE roll_no = 31;

/*

+---------+------------+-------------------+--------------+
| roll_no | name       | submission_status | teacher_name |
+---------+------------+-------------------+--------------+
|      26 | PRANJAL    | NA                | DEEPALI      |
|      27 | PRASHANT   | NA                | DEEPALI      |
|      28 | AADARSH    | NA                | DEEPALI      |
|      29 | TEJAS      | NA                | DEEPALI      |
|      30 | OM         | NA                | DEEPALI      |
|      31 | HEMANT     | COMPLETED         | DEEPALI      |
|      32 | DHANASHREE | NA                | DEEPALI      |
|      33 | UTKARSH    | NA                | DEEPALI      |
+---------+------------+-------------------+--------------+
*/

UPDATE student_info SET submission_status = 'COMPLETED' WHERE name = 'DHANASHREE';
/*
+---------+------------+-------------------+--------------+
| roll_no | name       | submission_status | teacher_name |
+---------+------------+-------------------+--------------+
|      26 | PRANJAL    | NA                | DEEPALI      |
|      27 | PRASHANT   | NA                | DEEPALI      |
|      28 | AADARSH    | NA                | DEEPALI      |
|      29 | TEJAS      | NA                | DEEPALI      |
|      30 | OM         | NA                | DEEPALI      |
|      31 | HEMANT     | COMPLETED         | DEEPALI      |
|      32 | DHANASHREE | COMPLETED         | DEEPALI      |
|      33 | UTKARSH    | NA                | DEEPALI      |
+---------+------------+-------------------+--------------+
*/

INSERT INTO student_info (roll_no,name,submission_status) VALUES (34,'XYZ','NA');

/*
+---------+------------+-------------------+--------------+
| roll_no | name       | submission_status | teacher_name |
+---------+------------+-------------------+--------------+
|      26 | PRANJAL    | NA                | DEEPALI      |
|      27 | PRASHANT   | NA                | DEEPALI      |
|      28 | AADARSH    | NA                | DEEPALI      |
|      29 | TEJAS      | NA                | DEEPALI      |
|      30 | OM         | NA                | DEEPALI      |
|      31 | HEMANT     | COMPLETED         | DEEPALI      |
|      32 | DHANASHREE | COMPLETED         | DEEPALI      |
|      33 | UTKARSH    | NA                | DEEPALI      |
|      34 | XYZ        | NA                | DEEPALI      |
+---------+------------+-------------------+--------------+
*/

DELETE FROM student_info WHERE name = 'XYZ';

/*
+---------+------------+-------------------+--------------+
| roll_no | name       | submission_status | teacher_name |
+---------+------------+-------------------+--------------+
|      26 | PRANJAL    | NA                | DEEPALI      |
|      27 | PRASHANT   | NA                | DEEPALI      |
|      28 | AADARSH    | NA                | DEEPALI      |
|      29 | TEJAS      | NA                | DEEPALI      |
|      30 | OM         | NA                | DEEPALI      |
|      31 | HEMANT     | COMPLETED         | DEEPALI      |
|      32 | DHANASHREE | COMPLETED         | DEEPALI      |
|      33 | UTKARSH    | NA                | DEEPALI      |
+---------+------------+-------------------+--------------+

*/


CREATE VIEW a_view AS SELECT roll_no , submission_status FROM student_info;
SELECT * FROM a_view;
/*
+---------+-------------------+
| roll_no | submission_status |
+---------+-------------------+
|      26 | NA                |
|      27 | NA                |
|      28 | NA                |
|      29 | NA                |
|      30 | NA                |
|      31 | COMPLETED         |
|      32 | COMPLETED         |
|      33 | NA                |
+---------+-------------------+
*/
ALTER VIEW a_view AS SELECT name FROM student_info;
SELECT * FROM a_view;
/*
+------------+
| name       |
+------------+
| PRANJAL    |
| PRASHANT   |
| AADARSH    |
| TEJAS      |
| OM         |
| HEMANT     |
| DHANASHREE |
| UTKARSH    |
+------------+
*/
UPDATE a_view SET name = 'OM GAWANDE' WHERE name = 'OM';
/*
+------------+
| name       |
+------------+
| PRANJAL    |
| PRASHANT   |
| AADARSH    |
| TEJAS      |
| OM GAWANDE |
| HEMANT     |
| DHANASHREE |
| UTKARSH    |
+------------+
*/
DROP VIEW a_view;


CREATE TABLE set_1 (emp_id INT,name VARCHAR(30),city VARCHAR(30));

CREATE TABLE set_2 (emp_id INT,name VARCHAR(30),country VARCHAR(30));
INSERT INTO set_1 VALUES (001,'ASHUTOSH','PUNE');
INSERT INTO set_1 VALUES (002,'ARYAN','MUMBAI');
INSERT INTO set_1 VALUES (003,'SARTHAK','SURAT');

INSERT INTO set_2 VALUES (001,'ASHUTOSH','INDIA');
INSERT INTO set_2 VALUES (002,'ARYAN','UK');
INSERT INTO set_2 VALUES (003,'SARTHAK','USA');
INSERT INTO set_2 VALUES (004,'YASH','AUSTRALIA');


SELECT * FROM set_1;
/*
+--------+----------+--------+
| emp_id | name     | city   |
+--------+----------+--------+
|      1 | ASHUTOSH | PUNE   |
|      2 | ARYAN    | MUMBAI |
|      3 | SARTHAK  | SURAT  |
+--------+----------+--------+
*/
SELECT * FROM set_2;

/*

+--------+----------+-----------+
| emp_id | name     | country   |
+--------+----------+-----------+
|      1 | ASHUTOSH | INDIA     |
|      2 | ARYAN    | UK        |
|      3 | SARTHAK  | USA       |
|      4 | YASH     | AUSTRALIA |
+--------+----------+-----------+
*/
SELECT * FROM set_1 UNION SELECT * FROM set_2;
/*
+--------+----------+-----------+
| emp_id | name     | city      |
+--------+----------+-----------+
|      1 | ASHUTOSH | PUNE      |
|      2 | ARYAN    | MUMBAI    |
|      3 | SARTHAK  | SURAT     |
|      1 | ASHUTOSH | INDIA     |
|      2 | ARYAN    | UK        |
|      3 | SARTHAK  | USA       |
|      4 | YASH     | AUSTRALIA |
+--------+----------+-----------+

*/
SELECT name FROM set_1 UNION SELECT name from set_2;


/*
+----------+
| name     |
+----------+
| ASHUTOSH |
| ARYAN    |
| SARTHAK  |
| YASH     |
+----------+
*/
SELECT name FROM set_1 UNION ALL SELECT name from set_2;
/*
+----------+
| name     |
+----------+
| ASHUTOSH |
| ARYAN    |
| SARTHAK  |
| ASHUTOSH |
| ARYAN    |
| SARTHAK  |
| YASH     |
+----------+
/*


