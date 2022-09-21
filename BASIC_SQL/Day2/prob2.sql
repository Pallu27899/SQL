mysql> CREATE DATABASE ORG;
Query OK, 1 row affected (0.02 sec)

mysql> SHOW DATABASES;
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| basicsqlone        |
| dayone             |
| information_schema |
| mysql              |
| org                |
| pallu1sql          |
| performance_schema |
| sys                |
+--------------------+
8 rows in set (0.01 sec)

mysql> USE ORG;
Database changed
mysql> CREATE TABLE Worker (
    -> WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    -> FIRST_NAME CHAR(25),
    -> LAST_NAME CHAR(25),
    -> SALARY INT(15),
    -> JOINING_DATE DATETIME,
    -> DEPARTMENT CHAR(25)
    -> );
Query OK, 0 rows affected, 1 warning (0.09 sec)

mysql> desc worker;
+--------------+----------+------+-----+---------+----------------+
| Field        | Type     | Null | Key | Default | Extra          |
+--------------+----------+------+-----+---------+----------------+
| WORKER_ID    | int      | NO   | PRI | NULL    | auto_increment |
| FIRST_NAME   | char(25) | YES  |     | NULL    |                |
| LAST_NAME    | char(25) | YES  |     | NULL    |                |
| SALARY       | int      | YES  |     | NULL    |                |
| JOINING_DATE | datetime | YES  |     | NULL    |                |
| DEPARTMENT   | char(25) | YES  |     | NULL    |                |
+--------------+----------+------+-----+---------+----------------+
6 rows in set (0.02 sec)

mysql> INSERT INTO Worker
    -> (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    -> (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
    -> (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
    -> (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
    -> (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
    -> (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
    -> (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
    -> (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
Query OK, 8 rows affected, 8 warnings (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 8

mysql> select * from worker;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
8 rows in set (0.00 sec)

mysql> CREATE TABLE Bonus (
    -> WORKER_REF_ID INT,
    -> BONUS_AMOUNT INT(10),
    -> BONUS_DATE DATETIME,
    -> FOREIGN KEY (WORKER_REF_ID)
    -> REFERENCES Worker(WORKER_ID)
    -> ON DELETE CASCADE
    -> );
Query OK, 0 rows affected, 1 warning (0.10 sec)

mysql> INSERT INTO Bonus
    -> (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    -> (001, 5000, '16-02-20'),
    -> (002, 3000, '16-06-11'),
    -> (003, 4000, '16-02-20'),
    -> (001, 4500, '16-02-20'),
    -> (002, 3500, '16-06-11');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from bonus;
+---------------+--------------+---------------------+
| WORKER_REF_ID | BONUS_AMOUNT | BONUS_DATE          |
+---------------+--------------+---------------------+
|             1 |         5000 | 2016-02-20 00:00:00 |
|             2 |         3000 | 2016-06-11 00:00:00 |
|             3 |         4000 | 2016-02-20 00:00:00 |
|             1 |         4500 | 2016-02-20 00:00:00 |
|             2 |         3500 | 2016-06-11 00:00:00 |
+---------------+--------------+---------------------+
5 rows in set (0.00 sec)

mysql> CREATE TABLE Title (
    -> WORKER_REF_ID INT,
    -> WORKER_TITLE CHAR(25),
    -> AFFECTED_FROM DATETIME,
    -> FOREIGN KEY (WORKER_REF_ID)
    -> REFERENCES Worker(WORKER_ID)
    -> ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> INSERT INTO Title
    -> (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    -> (001, 'Manager', '2016-02-20 00:00:00'),
    -> (002, 'Executive', '2016-06-11 00:00:00'),
    -> (008, 'Executive', '2016-06-11 00:00:00'),
    -> (005, 'Manager', '2016-06-11 00:00:00'),
    -> (004, 'Asst. Manager', '2016-06-11 00:00:00'),
    -> (007, 'Executive', '2016-06-11 00:00:00'),
    -> (006, 'Lead', '2016-06-11 00:00:00'),
    -> (003, 'Lead', '2016-06-11 00:00:00');
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from title;
+---------------+---------------+---------------------+
| WORKER_REF_ID | WORKER_TITLE  | AFFECTED_FROM       |
+---------------+---------------+---------------------+
|             1 | Manager       | 2016-02-20 00:00:00 |
|             2 | Executive     | 2016-06-11 00:00:00 |
|             8 | Executive     | 2016-06-11 00:00:00 |
|             5 | Manager       | 2016-06-11 00:00:00 |
|             4 | Asst. Manager | 2016-06-11 00:00:00 |
|             7 | Executive     | 2016-06-11 00:00:00 |
|             6 | Lead          | 2016-06-11 00:00:00 |
|             3 | Lead          | 2016-06-11 00:00:00 |
+---------------+---------------+---------------------+
8 rows in set (0.00 sec)


-- 1. Write an SQL query to show the second highest salary from a Worker table.
mysql> select *from worker  group by salary order by  salary desc limit 1,1;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
+-----------+------------+-----------+--------+---------------------+------------+
1 row in set (0.00 sec)

-- 2. Write an SQL query to determine the 5 highest salary from a Worker table.

mysql> select *from worker  group by salary order by  salary desc limit 5;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
5 rows in set (0.00 sec)


-- 3. Write an SQL query to show only even rows from a Worker table.
mysql> select * from worker where mod(worker_id, 2) = 0 order by worker_id asc;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
4 rows in set (0.01 sec)




-- 4. Write an SQL query to fetch the no. of workers for each department in the descending order from the Worker table.
mysql> select count(worker_id), department from Worker group by department;
+------------------+------------+
| count(worker_id) | department |
+------------------+------------+
|                2 | HR         |
|                4 | Admin      |
|                2 | Account    |
+------------------+------------+
3 rows in set (0.00 sec)




-- 5. Write an SQL query to fetch the list of employees with the same salary from the Worker table.
mysql> SELECT * FROM worker WHERE Salary IN ( SELECT Salary FROM worker GROUP BY Salary  HAVING COUNT(*) > 1);
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
2 rows in set (0.01 sec)
