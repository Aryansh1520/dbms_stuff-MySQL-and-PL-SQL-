SET SERVEROUTPUT ON
CREATE TBALE assignment_3b(radius NUMBER,area NUMBER) --SHOULD BE EXECUTED ONLY ONCE

DECLARE
	radius_var NUMBER;
	area_var NUMBER;
	pi NUMBER := 3.14;
BEGIN
	FOR radius_var IN 5 .. 9 LOOP
		area_var := pi*radius_var*radius_var;
		dbms_output.put_line(area_var);
		INSERT INTO assignment_3b VALUES (radius_var,area_var);
	END LOOP;

END;
/
	
