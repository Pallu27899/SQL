-- 1. CREATE the following TABLE according to the following information
-- i) TABLE name- DEPOSITE
-- FIELD NAME DATA TYPE SIZE
-- ACTNO VARCHAR 25
-- CNAME VARCHAR 20
-- BNAME VARCHAR 20
-- AMOUNT INT
-- ADATE DATE
-- ii) TABLE name-BRANCH
-- FIELD NAME DATA TYPE SIZE
-- BNAME VARCHAR 20
-- CITY VARCHAR 20
-- iii) TABLE name-CUSTOMER
-- FIELD NAME DATA TYPE SIZE
-- CNAME VARCHAR2 20
-- CITY VARCHAR2 20
-- iv) TABLE name-BORROW
-- FIELD NAME DATA TYPE SIZE
-- LOANNO VARCHAR 5
-- CNAME VARCHAR 20
-- BNAME VARCHAR 20
-- AMOUNT INT

mysql> CREATE TABLE DEPOSITE(actno varchar(25),cname varchar(20),bname varchar(20),amount int,adate date);
Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TABLE BRANCH(bname varchar(20),city varchar(20));
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE CUSTOMER(cname varchar(20),city varchar(20));
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE BORROW(loanno varchar(20),cname varchar(20),bname varchar(20),amount int);
Query OK, 0 rows affected (0.06 sec)

-- 2. Describe the TABLEs which are already CREATEd.
-- A2) BRANCH and CUSTOMER are TABLEs that already CREATEd.


-- 3. Insert the data as for the following


mysql> insert into DEPOSITE values(101,"sunil","mgroad",5000,"1996-04-01");
Query OK, 1 row affected (0.01 sec)

mysql> insert into DEPOSITE values(102,"rahul","karolbagh",3500,"1995-11-17");
Query OK, 1 row affected (0.19 sec)

mysql> insert into DEPOSITE values(103,"madhuri","chandni",1200,"1995-12-17");
Query OK, 1 row affected (0.01 sec)

mysql> insert into DEPOSITE values(104,"pramod","mgroad",3000,"1996-03-27");
Query OK, 1 row affected (0.01 sec)

mysql> insert into DEPOSITE values(105,"sandip","koralbagh",2000,"1996-03-31");
Query OK, 1 row affected (0.01 sec)

mysql> insert into BRANCH values("vrce","nagpur");
Query OK, 1 row affected (0.02 sec)

mysql> insert into BRANCH values("karolbagh","delhi");
Query OK, 1 row affected (0.01 sec)

mysql> insert into BRANCH values("chandni","delhi");
Query OK, 1 row affected (0.01 sec)

mysql> insert into BRANCH values("mgroad","bangalore");
Query OK, 1 row affected (0.01 sec)

mysql> insert into CUSTOMER values("anil","calcuta");
Query OK, 1 row affected (0.02 sec)

mysql> insert into CUSTOMER values("rahul","baroda");
Query OK, 1 row affected (0.02 sec)

mysql> insert into CUSTOMER values("madhuri","nagpur");
Query OK, 1 row affected (0.01 sec)

mysql> insert into CUSTOMER values("pramod","nagpur");
Query OK, 1 row affected (0.01 sec)

mysql> insert into CUSTOMER values("sunil","delhi");
Query OK, 1 row affected (0.02 sec)

mysql> insert into BORROW values(201,"anil","vrce",1000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into BORROW values(206,"rahul","karolbagh",5000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into BORROW values(311,"sunil","mgroad",3000);
Query OK, 1 row affected (0.19 sec)

mysql> insert into BORROW values(321,"madhuri","chandni",2000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into BORROW values(375,"pramod","mgroad",8000);
Query OK, 1 row affected (0.01 sec)

-- 4.Retrieve all the records from the TABLE BORROW where amount in between
-- 2000 and 3000.
mysql> select * from BORROW where amount>=2000 and amount<=3000;
+--------+---------+---------+--------+
| loanno | cname   | bname   | amount |
+--------+---------+---------+--------+
| 311    | sunil   | mgroad  |   3000 |
| 321    | madhuri | chandni |   2000 |
+--------+---------+---------+--------+
2 rows in set (0.00 sec)

-- 5. Retrieve the details from the TABLE DEPOSITE
mysql> select * from DEPOSITE;
+-------+---------+-----------+--------+------------+
| actno | cname   | bname     | amount | adate      |
+-------+---------+-----------+--------+------------+
| 100   | anil    | vrce      |   1000 | 1995-03-01 |
| 101   | sunil   | mgroad    |   5000 | 1996-04-01 |
| 102   | rahul   | karolbagh |   3500 | 1995-11-17 |
| 103   | madhuri | chandni   |   1200 | 1995-12-17 |
| 104   | pramod  | mgroad    |   3000 | 1996-03-27 |
| 105   | sandip  | mgroad    |   2000 | 1996-03-31 |
+-------+---------+-----------+--------+------------+
6 rows in set (0.01 sec)

-- 6. Retrieve the CUSTOMER name, account no of DEPOSITE.
mysql> select actno,cname from DEPOSITE;
+-------+---------+
| actno | cname   |
+-------+---------+
| 100   | anil    |
| 101   | sunil   |
| 102   | rahul   |
| 103   | madhuri |
| 104   | pramod  |
| 105   | sandip  |
+-------+---------+
6 rows in set (0.00 sec)

-- 7. Retrieve the name of the CUSTOMER living in NAGPUR.
mysql> select * from CUSTOMER where city="nagpur";
+---------+--------+
| cname   | city   |
+---------+--------+
| madhuri | nagpur |
| pramod  | nagpur |
+---------+--------+
2 rows in set (0.01 sec)

-- 8. Retrieve the name of the CUSTOMERs who opened account after 17-NOV-95.

mysql> select cname from DEPOSITE where adate>"1995-11-17";
+---------+
| cname   |
+---------+
| sunil   |
| madhuri |
| pramod  |
| sandip  |
+---------+
4 rows in set (0.00 sec)

-- 9. Retrieve the account number and amount of the CUSTOMER having account opened between
01-12-95 and 01-06.96.
mysql> select actno,amount from DEPOSITE where adate>"1995-12-01" and adate<"1996-06-01";
+-------+--------+
| actno | amount |
+-------+--------+
| 101   |   5000 |
| 103   |   1200 |
| 104   |   3000 |
| 105   |   2000 |
+-------+--------+
4 rows in set (0.00 sec)


-- jhala dxfgyhsj

-- 10. Retrieve all the records from the TABLE DEPOSITE where CNAME begins
-- with C.

mysql>  SELECT * FROM DEPOSITE  WHERE cNAME LIKE "s%" ;
+-------+--------+--------+--------+------------+
| actno | cname  | bname  | amount | adate      |
+-------+--------+--------+--------+------------+
| 101   | sunil  | mgroad |   5000 | 1996-04-01 |
| 105   | sandip | mgroad |   2000 | 1996-03-31 |
+-------+--------+--------+--------+------------+
2 rows in set (0.00 sec)

-- 11. Retrieve all the records from the TABLE BORROW where 2nd character of
-- CNAME is U.
mysql>  SELECT * FROM DEPOSITE  WHERE cNAME LIKE "_u%" ;
+-------+-------+--------+--------+------------+
| actno | cname | bname  | amount | adate      |
+-------+-------+--------+--------+------------+
| 101   | sunil | mgroad |   5000 | 1996-04-01 |
+-------+-------+--------+--------+------------+
1 row in set (0.00 sec)

-- 12. Retrieve all the records from the TABLE DEPOSITE where BRANCH name is
-- CHANDNI or MGROAD.
mysql> select * from DEPOSITE where bname="chandni" or bname="mgroad";
+-------+---------+---------+--------+------------+
| actno | cname   | bname   | amount | adate      |
+-------+---------+---------+--------+------------+
| 101   | sunil   | mgroad  |   5000 | 1996-04-01 |
| 103   | madhuri | chandni |   1200 | 1995-12-17 |
| 104   | pramod  | mgroad  |   3000 | 1996-03-27 |
| 105   | sandip  | mgroad  |   2000 | 1996-03-31 |
+-------+---------+---------+--------+------------+
4 rows in set (0.00 sec)

-- 13. Retrieve all the records from the TABLE DEPOSITE where BRANCH name is not
-- CHANDNI or MGROAD.
mysql> select * from DEPOSITE where bname!="chandni" and bname!="mgroad";
+-------+-------+-----------+--------+------------+
| actno | cname | bname     | amount | adate      |
+-------+-------+-----------+--------+------------+
| 100   | anil  | vrce      |   1000 | 1995-03-01 |
| 102   | rahul | karolbagh |   3500 | 1995-11-17 |
+-------+-------+-----------+--------+------------+
2 rows in set (0.00 sec)

-- 14. Retrieve all the records from DEPOSITE where amount > 1000 and arrange the CUSTOMER name in
-- ascending order.
mysql> select * from DEPOSITE where amount>1000 order by cname;
+-------+---------+-----------+--------+------------+
| actno | cname   | bname     | amount | adate      |
+-------+---------+-----------+--------+------------+
| 103   | madhuri | chandni   |   1200 | 1995-12-17 |
| 104   | pramod  | mgroad    |   3000 | 1996-03-27 |
| 102   | rahul   | karolbagh |   3500 | 1995-11-17 |
| 105   | sandip  | mgroad    |   2000 | 1996-03-31 |
| 101   | sunil   | mgroad    |   5000 | 1996-04-01 |
+-------+---------+-----------+--------+------------+
5 rows in set (0.00 sec)


-- 15. Retrieve all the records from DEPOSITE where amount > 1000 and arrange the CUSTOMER name in
-- descending order.
mysql> select * from DEPOSITE where amount>1000 order by cname desc;
+-------+---------+-----------+--------+------------+
| actno | cname   | bname     | amount | adate      |
+-------+---------+-----------+--------+------------+
| 101   | sunil   | mgroad    |   5000 | 1996-04-01 |
| 105   | sandip  | mgroad    |   2000 | 1996-03-31 |
| 102   | rahul   | karolbagh |   3500 | 1995-11-17 |
| 104   | pramod  | mgroad    |   3000 | 1996-03-27 |
| 103   | madhuri | chandni   |   1200 | 1995-12-17 |
+-------+---------+-----------+--------+------------+
5 rows in set (0.00 sec)

-- 16. Retrieve CUSTOMER details from BORROW TABLE where the third character of
-- the CUSTOMER name is either ‘A’ or ‘D’.

mysql> select * from BORROW where cNAME LIKE "__a%" or cNAME LIKE "__d%"  ;
+--------+---------+---------+--------+
| loanno | cname   | bname   | amount |
+--------+---------+---------+--------+
| 321    | madhuri | chandni |   2000 |
| 375    | pramod  | mgroad  |   8000 |
+--------+---------+---------+--------+
2 rows in set (0.00 sec)

-- 17. Retrieve all the records from the TABLE BORROW where amount is not
-- between 2000 and 8000.
mysql> select * from BORROW where amount<2000 or amount>8000  ;
+--------+-------+-------+--------+
| loanno | cname | bname | amount |
+--------+-------+-------+--------+
| 201    | anil  | vrce  |   1000 |
+--------+-------+-------+--------+
1 row in set (0.00 sec)


-- 18. Find out the unique records from the TABLE DEPOSITE
mysql> select distinct actno,cname,bname,amount,adate from DEPOSITE;
+-------+---------+-----------+--------+------------+
| actno | cname   | bname     | amount | adate      |
+-------+---------+-----------+--------+------------+
| 100   | anil    | vrce      |   1000 | 1995-03-01 |
| 101   | sunil   | mgroad    |   5000 | 1996-04-01 |
| 102   | rahul   | karolbagh |   3500 | 1995-11-17 |
| 103   | madhuri | chandni   |   1200 | 1995-12-17 |
| 104   | pramod  | mgroad    |   3000 | 1996-03-27 |
| 105   | sandip  | mgroad    |   2000 | 1996-03-31 |
+-------+---------+-----------+--------+------------+
6 rows in set (0.00 sec)


-- 19. Update the amount of all DEPOSITEors in DEPOSITE TABLE by giving them 10% interest (i.e.
-- amount=amount * 0.1) where BRANCH is VRCE.

mysql> update DEPOSITE set amount=amount+amount*0.1 where bname="vrce";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

-- 20. Update the amount of all DEPOSITEors in DEPOSITE TABLE by giving them 10% interest where
-- BRANCH is VRCE and CUSTOMER name ANIL.

mysql> update DEPOSITE set amount=amount+amount*0.1 where bname="vrce" and cname="anil";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

