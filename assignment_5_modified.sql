SET SERVEROUT ON
SET VERIFY OFF
--CREATE TABLE stud_marks(name VARCHAR2(25),total_marks NUMBER);
--CREATE TABLE result(roll_number NUMBER , name VARCHAR2(25), class VARCHAR2(30));
-- CREATE TABLE ONLY ONCE

CREATE OR REPLACE FUNCTION func_1(r IN NUMBER, n IN VARCHAR2,m IN NUMBER) RETURN VARCHAR2 AS
BEGIN
		procedure_1(r,n,m);
		return 'SUCCESSFULL';
END;
/
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
	   
	  

	

DECLARE
	name_1 VARCHAR2(25);
	roll_no_1 NUMBER;
	marks_1 NUMBER;
	class VARCHAR2(25);

BEGIN
	roll_no_1:=&roll_no_1;
	name_1:='&name_1';
	marks_1:=&marks_1;
	class := func_1(roll_no_1,name_1,marks_1);
	dbms_output.put_line(class);
END;
/
