SET SERVEROUT ON
SET VERIFY OFF
/*
CREATE TABLE o_rollcall(roll_no NUMBER,  name VARCHAR2(25), div VARCHAR2(5));
CREATE TABLE n_rollcall(roll_no NUMBER,  name VARCHAR2(25), div VARCHAR2(5));
INSERT INTO o_rollcall VALUES(45,'ASHUTOSH','A');
INSERT INTO o_rollcall VALUES(46,'ARYAN','A'); 
INSERT INTO o_rollcall VALUES(47,'SANKET','B');
INSERT INTO o_rollcall VALUES(45,'ASHUTOSH','A');
INSERT INTO o_rollcall VALUES(48,'ROHAN','B');
INSERT INTO o_rollcall VALUES(45,'ASHUTOSH','B');
*/
CREATE OR REPLACE PROCEDURE cursor_imp AS
c_r NUMBER;
c_n VARCHAR2(25);
c_d VARCHAR2(5);
cursor c1 (roll NUMBER , n VARCHAR2 , d VARCHAR2) IS SELECT roll_no , COUNT (roll_no),name ,COUNT (name), div, COUNT (div) FROM o_rollcall GROUP BY roll_no,name,div HAVING (COUNT(roll_no)>1) AND (COUNT(name)>1) AND (COUNT(div)>1) ;
temp  c1%rowtype;
BEGIN
	--INSERT INTO n_rollcall SELECT * FROM o_rollcall;
	OPEN c1(c_r,c_n,c_d);
	LOOP
		FETCH c1 INTO temp;
		EXIT WHEN c1%NOTFOUND;
		DELETE FROM n_rollcall WHERE roll_no = temp.roll_no AND name = temp.name AND div = temp.div;
		INSERT INTO n_rollcall VALUES (temp.roll_no,temp.name,temp.div);
		dbms_output.put_line(temp.roll_no||temp.name||temp.div);
	END LOOP;
END;
/

BEGIN
	cursor_imp;
END;

/
