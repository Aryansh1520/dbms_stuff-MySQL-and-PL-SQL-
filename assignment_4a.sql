SET SERVEROUT ON
SET VERIFY OFF
/*
CREATE TABLE  borrower(roll_no NUMBER , name VARCHAR2(25), dateofissue DATE,name_of_book VARCHAR2(25), status VARCHAR2(20));

CREATE TABLE fine(roll_no NUMBER,date_of_return DATE,amt NUMBER);

INSERT INTO borrower VALUES(45,'ASHUTOSH',TO_DATE('01-08-2022','DD-MM-YYYY'),'HARRY POTTER','PENDING');
INSERT INTO borrower VALUES(46,'ARYAN',TO_DATE('15-08-2022','DD-MM-YYYY'),'DARK MATTER','PENDING');
INSERT INTO borrower VALUES(47,'ROHAN',TO_DATE('24-08-2022','DD-MM-YYYY'),'SILENT HILL','PENDING');
INSERT INTO borrower VALUES(48,'SANKET',TO_DATE('26-08-2022','DD-MM-YYYY'),'GOD OF WAR','PENDING');
INSERT INTO borrower VALUES(49,'SARTHAK',TO_DATE('09-09-2022','DD-MM-YYYY'),'SPIDER-MAN','PENDING');
*/



DECLARE 
	i_roll_no NUMBER;
	name_of_book VARCHAR2(25);
	no_of_days NUMBER;
	return_date DATE := TO_DATE(SYSDATE,'DD-MM-YYYY');
	temp NUMBER;
	doi DATE;
	fine NUMBER;
BEGIN
	i_roll_no := &i_roll_no;
	name_of_book := '&nameofbook';
	--dbms_output.put_line(return_date);
	SELECT to_date(borrower.dateofissue,'DD-MM-YYYY') INTO doi FROM borrower WHERE borrower.roll_no = i_roll_no AND borrower.name_of_book = name_of_book;
	no_of_days := return_date-doi;
	dbms_output.put_line(no_of_days);
	IF (no_of_days >15 AND no_of_days <=30) THEN
		fine := 5*no_of_days;
		
	ELSIF (no_of_days>30 ) THEN
		temp := no_of_days-30;
		fine := 150 + temp*50;
	END IF;
	dbms_output.put_line(fine);
	INSERT INTO fine VALUES(i_roll_no,return_date,fine);
	UPDATE borrower SET status = 'RETURNED' WHERE borrower.roll_no = i_roll_no;
	
	
END;
/

/*
-----------------------------------------------INPUT---------------------------------------------------------------------------------------------------------
Enter value for i_roll_no: 46
Enter value for nameofbook: DARK MATTER

---------------------------------------------OUTPUT---------------------------------------------------------------------------------------------------------
BORROWER:

   ROLL_NO              NAME 		     DATEOFISSUE        NAME_OF_BOOK                      STATUS
---------- ------------------------- -------- ---------------------------------------------------------------
	45      ASHUTOSH		     01-08-22           HARRY POTTER                      PENDING

	46      ARYAN		             15-08-22           DARK MATTER                       RETURNED

	47      ROHAN		             24-08-22           SILENT HILL                       PENDING

        48      SANKET		             26-08-22           GOD OF WAR                        PENDING

	49      SARTHAK		             09-09-22           SPIDER-MAN                        PENDING
        
---------------------------------------------------------------------------------------------------------------------------------------------------------
FINE:

   ROLL_NO DATEOFRE	AMOUNT
---------- -------- ----------
	46 14-09-22	   150


`````````````````````````````````````````````````````````````````INPUT``````````````````````````````````````````````````````````````````````````````````````````

Enter value for i_roll_no: 45
Enter value for nameofbook: HARRY POTTER

---------------------------------------------------------------OUTPUT--------------------------------------------------------------------------------------------------------
BORROWER:

   ROLL_NO NAME 		     DATEOFIS   NAME_OF_BOOK      STATUS
---------- ------------------------- -------- ---------------------------------------------
	45 ASHUTOSH		     01-08-22   HARRY POTTER      RETURNED

	46 ARYAN		     15-08-22   DARK MATTER       RETURNED

	47 ROHAN		     24-08-22   SILENT HILL       PENDING

	48 SANKET		     26-08-22   GOD OF WAR        PENDING

	49 SARTHAK		     09-09-22   SPIDER-MAN        PENDING
`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
FINE:
   ROLL_NO DATEOFRE	AMOUNT
---------- -------- ----------
	46 14-09-22	   150
	45 14-09-22	   850
