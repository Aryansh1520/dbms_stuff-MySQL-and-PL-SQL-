--CREATE TABLE stud_marks(name VARCHAR2(25),total_marks NUMBER);
--CREATE TABLE result(roll_number NUMBER , name VARCHAR2(25), class VARCHAR2(30));

-- CREATE TABLE ONLY ONCE


SET SERVEROUT ON

CREATE OR REPLACE PROCEDURE procedure_1 ( roll_no IN NUMBER, name IN VARCHAR2 ,marks IN NUMBER) AS
	BEGIN
		IF (marks<=1500 and marks>=990) THEN
			DBMS_OUTPUT.PUT_LINE ('DISTINCTION');
			INSERT INTO result VALUES (roll_no,name,'DISTINCTION');
		ELSIF (marks<=989 and marks>=900) THEN
			DBMS_OUTPUT.PUT_LINE ('FIRST CLASS');
			INSERT INTO result VALUES (roll_no,name,'FIRST CLASS');
		ELSIF (marks<=899 and marKs>825) THEN
			DBMS_OUTPUT.PUT_LINE('HIGHER SECOND CLASS');
			INSERT INTO result VALUES (roll_no,name,'HIGHER SECOND CLASS');
		ELSE
			DBMS_OUTPUT.PUT_LINE ('FAIL');
			INSERT INTO result VALUES (roll_no,name,'FAIL');

	    END IF;
	    INSERT INTO stud_marks VALUES (name,marks);
    END procedure_1;
/
BEGIN

			procedure_1(45,'ASHUTOSH',1450);
			procedure_1(46,'ARYAN',950);
			procedure_1(47,'ROHAN',850);
			procedure_1(48,'SARTHAK',750);
END;
/


/*
CONSOLE OUTPUT :

Procedure created.

DISTINCTION
FIRST CLASS
HIGHER SECOND CLASS
FAIL

PL/SQL procedure successfully completed.
*/


/*

ACTUAL DATABASES

STUD_MARKS:

NAME			  TOTAL_MARKS
------------------------- -----------
ASHUTOSH			 1450
ARYAN				  950
ROHAN				  850
SARTHAK 			  750



RESULT:

ROLL_NUMBER NAME		      CLASS
----------- ------------------------- ------------------------------
	 45 ASHUTOSH		      DISTINCTION
	 46 ARYAN		      FIRST CLASS
	 47 ROHAN		      HIGHER SECOND CLASS
	 48 SARTHAK		      FAIL

*/


