Q1
a)  UPDATE employee SET CITY = 'New York' WHERE name = 'Jack'
b) 




Q2
--LOAN TABLE
/*
+---------+-------------+--------+
| loan_no | branch_name | amount |
+---------+-------------+--------+
|       1 | MUMBAI      |    100 |
|       2 | PUNE        |   2000 |
|       3 | AHEMADABAD  |  30000 |
|       4 | PUNE        |    800 |
+---------+-------------+--------+
*/
--Borrower TABLE
/*
+-----------+---------+
| cust_name | loan_no |
+-----------+---------+
| ASHUTOSH  |       1 |
| ARYAN     |       2 |
| SAHIL     |       3 |
| VIRAG     |       4 |
+-----------+---------+
*/

REQUIRED QUERIES

a) SELECT loan.loan_no,Borrower.cust_name,loan.amount FROM loan,Borrower WHERE loan.loan_no = Borrower.loan_no;
b) SELECT  Borrower.cust_name FROM Borrower,loan WHERE loan.loan_no = Borrower.loan_no AND loan.branch_name = 'PUNE' ORDER BY Borrower.cust_name ;
c) SELECT loan.loan_no FROM loan WHERE branch_name = 'PUNE' AND loan.loan_amount >20000;


Q9


