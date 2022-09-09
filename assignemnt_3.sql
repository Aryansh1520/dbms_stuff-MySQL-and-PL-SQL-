/*
OBJECTIVES ACHIEVED 

FOREIGN KEY
INNER JOIN OR 'JOIN' KEYWORD BY DEFAULT
LEFT JOIN
RIGHT JOIN
*/
CREATE DATABASE assignment_2;
SHOW DATABASES;
/*
+--------------------+
| Database           |
+--------------------+
| assignment_1       |
| assignment_2       |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
*/
CREATE TABLE name(roll_no INT NOT NULL, name VARCHAR(30) NOT NULL,PRIMARY KEY (roll_no));
INSERT INTO name VALUES(37 ,'INDRANEEL');
INSERT INTO name VALUES (38 ,'SHUBHAM');
INSERT INTO name VALUES (39 ,'AKSHAY');
INSERT INTO name VALUES (40 ,'SAKSHI');
INSERT INTO name VALUES (41 ,'KETAN');

SELECT * FROM name;
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
CREATE TABLE submission(sr_no INT NOT NULL, assgn_id VARCHAR(30),roll_no INT NOT NULL,PRIMARY KEY(sr_no));
SELECT * FROM submission;
INSERT INTO submission VALUES (1,"YYYY",37);
INSERT INTO submission VALUES (2,"YXYY",37);
INSERT INTO submission VALUES (3,"YXYY",38);
INSERT INTO submission VALUES (4,"YXYY",39);

SELECT * FROM submission;
/*
+-------+----------+---------+
| sr_no | assgn_id | roll_no |
+-------+----------+---------+
|     1 | YYYY     |      37 |
|     2 | YXYY     |      37 |
|     3 | YXYY     |      38 |
|     4 | YXYY     |      39 |
+-------+----------+---------+
*/
--CREATING FORIEGN KEY
ALTER TABLE submission ADD FOREIGN KEY (roll_no) REFERENCES name(roll_no);
desc submission;
/*
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| sr_no    | int         | NO   | PRI | NULL    |       |
| assgn_id | varchar(30) | YES  |     | NULL    |       |
| roll_no  | int         | NO   | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
*/

--innerjoin interpretation
SELECT * FROM name,submission WHERE name.roll_no=submission.roll_no;
/*
+---------+-----------+-------+----------+---------+
| roll_no | name      | sr_no | assgn_id | roll_no |
+---------+-----------+-------+----------+---------+
|      37 | INDRANEEL |     1 | YYYY     |      37 |
|      37 | INDRANEEL |     2 | YXYY     |      37 |
|      38 | SHUBHAM   |     3 | YXYY     |      38 |
|      39 | AKSHAY    |     4 | YXYY     |      39 |
+---------+-----------+-------+----------+---------+
*/
--ACTUAL INNER JOIN SYNTAX
SELECT * FROM name JOIN submission ON name.roll_no=submission.roll_no;
/*
+---------+-----------+-------+----------+---------+
| roll_no | name      | sr_no | assgn_id | roll_no |
+---------+-----------+-------+----------+---------+
|      37 | INDRANEEL |     1 | YYYY     |      37 |
|      37 | INDRANEEL |     2 | YXYY     |      37 |
|      38 | SHUBHAM   |     3 | YXYY     |      38 |
|      39 | AKSHAY    |     4 | YXYY     |      39 |
+---------+-----------+-------+----------+---------+
*/

--SELECTING ONLY RELEVENT FEILDS

SELECT name.roll_no,name,assgn_id FROM name JOIN submission WHERE name.roll_no=submission.roll_no;
/*
+---------+-----------+----------+
| roll_no | name      | assgn_id |
+---------+-----------+----------+
|      37 | INDRANEEL | YYYY     |
|      37 | INDRANEEL | YXYY     |
|      38 | SHUBHAM   | YXYY     |
|      39 | AKSHAY    | YXYY     |
+---------+-----------+----------+
*/
--INNER JOIN ONLY SELECTS RECORDS THAT ARE COMMON IN BOTH TABLES
--IT CAN ALSO BE SAID THAT INNER JOIN ONLY SHOWS THE INTERSECTION BETWEEN 2 TABLES

--LEFT JOIN SELECTS THE INTERSECTION BETWEEN THE 2 TABLES AS WELL AS ALL THE COULMNS AND ROWS SPECIFIED FROM THE LEFT TABLE
--FOR EG

SELECT * FROM name LEFT JOIN submission ON name.roll_no=submission.roll_no;
/*
+---------+-----------+-------+----------+---------+
| roll_no | name      | sr_no | assgn_id | roll_no |
+---------+-----------+-------+----------+---------+
|      37 | INDRANEEL |     1 | YYYY     |      37 |
|      37 | INDRANEEL |     2 | YXYY     |      37 |
|      38 | SHUBHAM   |     3 | YXYY     |      38 |
|      39 | AKSHAY    |     4 | YXYY     |      39 |
|      40 | SAKSHI    |  NULL | NULL     |    NULL |
|      41 | KETAN     |  NULL | NULL     |    NULL |
+---------+-----------+-------+----------+---------+
*/
--SELECTING ONLY RREQUIRED FEILDS

SELECT name.roll_no,name.assgn_id FROM name LEFT JOIN submission ON name.roll_no=submission.roll_no;
/*
+---------+-----------+----------+
| roll_no | name      | assgn_id |
+---------+-----------+----------+
|      37 | INDRANEEL | YYYY     |
|      37 | INDRANEEL | YXYY     |
|      38 | SHUBHAM   | YXYY     |
|      39 | AKSHAY    | YXYY     |
|      40 | SAKSHI    | NULL     |
|      41 | KETAN     | NULL     |
+---------+-----------+----------+
*/
--RIGHT JOIN

SELECT * FROM name RIGHT JOIN submission ON name.roll_no=submission.roll_no;

/*
+---------+-----------+-------+----------+---------+
| roll_no | name      | sr_no | assgn_id | roll_no |
+---------+-----------+-------+----------+---------+
|      37 | INDRANEEL |     1 | YYYY     |      37 |
|      37 | INDRANEEL |     2 | YXYY     |      37 |
|      38 | SHUBHAM   |     3 | YXYY     |      38 |
|      39 | AKSHAY    |     4 | YXYY     |      39 |
+---------+-----------+-------+----------+---------+
*/
--RIGHT TABLE WILL HAVE A KEY OR COLUMN VALUE CORESSPONDING TO THE LEFT TABLE THERFORE NO NULL VALUE IS DISPLAYED;












