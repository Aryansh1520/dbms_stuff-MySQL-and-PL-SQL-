/*
CREATE TABLE lib_tab(book_name VARCHAR2(25),status VARCHAR2(15));
CREATE TABLE library_audit(date_modified DATE, book_name VARCHAR2(25),old_status VARCHAR(15),new_status VARCHAR2(15),action VARCHAR2(25));
*/

CREATE OR REPLACE TRIGGER trigger_1 
AFTER UPDATE OR DELETE OR INSERT ON lib_tab FOR EACH ROW
ENABLE
	BEGIN
		IF UPDATING THEN
			dbms_output.put_line(:OLD.status);
			INSERT INTO library_audit VALUES (SYSDATE,:OLD.book_name,:OLD.status,:NEW.status,'UPDATE');
                ELSIF INSERTING THEN
                         dbms_output.put_line(:NEW.status);
                         INSERT INTO library_audit VALUES (SYSDATE,:NEW.book_name,:OLD.status,:NEW.status,'INSERT');
		ELSE
			dbms_output.put_line(:OLD.book_name||'deleting');
			INSERT INTO library_audit VALUES(SYSDATE,:OLD.book_name,:OLD.status,:NEW.status,'DELETE');
		END IF;
	END;
/
/*
DELETE FROM lib_tab WHERE book_name = 'SILENT HILL';
UPDATE lib_tab SET status = 'UNAVAILABLE' WHERE book_name =  'UNCHARTED';
UPDATE lib_tab SET status = 'PRE-ORDER' WHERE book_name = 'GOD OF WAR';
UPDATE lib_tab SET status = 'AVAILABLE' WHERE book_name = 'UNCHARTED';
INSERT INTO lib_tab VALUES('SPM','UNAVAILABLE');
Select * from library_audit;
Select * from lib_tab;
*/

/*
INSERT INTO lib_tab VALUES('DARK MATTER','AVAILABLE');
INSERT INTO lib_tab VALUES('SILENT HILL','UNAVAILABLE');
INSERT INTO lib_tab VALUES('GOD OF WAR','AVAILABLE');
INSERT INTO lib_tab VALUES('SPIDER-MAN','UNAVAILABLE');
INSERT INTO lib_tab VALUES('UNCHARTED','AVAILABLE');

*/

/*
ORIGINAL lib_tab :
BOOK_NAME		                  STATUS
------------------------- ---------------
DARK MATTER	                AVAILABLE
SILENT HILL		              UNAVAILABLE
GOD OF WAR		              AVAILABLE
SPIDER-MAN		              UNAVAILABLE
UNCHARTED		                AVAILABLE
/*



/*
DELETE FROM lib_tab WHERE book_name = 'SILENT HILL';
UPDATE lib_tab SET status = 'UNAVAILABLE' WHERE book_name =  'UNCHARTED';
UPDATE lib_tab SET status = 'PRE-ORDER' WHERE book_name = 'GOD OF WAR';
*/

/*
OUTPUT
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

DATE_MODIFIED		    BOOK_NAME		   OLD_STATUS	        NEW_STATUS	              ACTION
--------------    ------------		 ----------	 	     -----------	            ----------


16-09-22			   	SILENT HILL		    UNAVAILABLE					                        DELETE

16-09-22 				  UNCHARTED		      AVAILABLE	   	    UNAVAILABLE	              UPDATE

16-09-22 				  GOD OF WAR		    AVAILABLE	   	    PRE-ORDER		              UPDATE

/*

/*
FINAL lib_tab :--------------------------------------------------------------------------------------------------------------------------------------------------------------------

BOOK_NAME		                STATUS
------------------------- ---------------
DARK MATTER		              AVAILABLE
GOD OF WAR		              PRE-ORDER
SPIDER-MAN		              UNAVAILABLE
UNCHARTED		                UNAVAILABLE

*/

