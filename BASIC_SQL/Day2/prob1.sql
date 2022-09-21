-- Q1/-
-- Cocoa Confections is a small bakery that sells brownies, cookies, pies, and other
-- delicious treats to customers online. It keeps records of all of its online sales in an
-- SQL database that is automatically populated as customers places orders on its site.
-- In its database, Cocoa Confections has a customers table to keep track of customer
-- contact information, and an orders table to keep track of various orders that those
-- customers have placed. The schema of these tables is as follows:
-- CREATE TABLE customers (
-- customer_id INT PRIMARY KEY,
-- first_name VARCHAR(255) NOT NULL,
-- last_name VARCHAR(255) NOT NULL,
-- email VARCHAR(255) NOT NULL,
-- address VARCHAR(255) DEFAULT NULL,
-- city VARCHAR(255) DEFAULT NULL,
-- state VARCHAR(2) DEFAULT NULL,
-- zip_code VARCHAR(5) DEFAULT NULL
-- );
-- CREATE TABLE orders (
-- order_id INT PRIMARY KEY,
-- customer_id INT NOT NULL,
-- order_placed_date DATE NOT NULL,
-- FOREIGN KEY (customer_id) REFERENCES customers
-- (customer_id)
-- );
-- It's the end of 2016, and the owner of Cocoa Confections wants to write an SQL
-- query that finds the COUNT of orders placed in 2016 by customer e-mail address.
-- She wants to ORDER the results by the COUNT of orders placed in 2016,
-- descending, so that she can personally send thank-you e-mails to Cocoa
-- Confection's top customers by order volume.
-- Can you write a query that will help the owner of Cocoa Confections find the
-- COUNT of all orders placed in 2016, by customer e-mail address, sorted
-- Descending?
-- Sample Input:


-- Customers:
-- +-----------------+---------------+--------------+---------------------+------------+-------------+-------+----------
-- --+
-- | customer_id | first_name | last_name | email | address | city | state | zip_code |
-- +-----------------+---------------+--------------+--------------------+------------+-------------+-------+-----------
-- --+
-- | 1 | abc | a | abc@mail.com | 1st street | chennai | TN | 60001 |
-- | 2 | efg | e | efg@mail.com | 2nd street | Bangalore | KA| 50002 |
-- | 3 | ijk | i | ijk@mail.com | 3nd street | Mumbai | MH | 40002 |
-- +------------------+----------------+------------+--------------------+---------------+-----------+-------+----------
-- +
-- Orders:
-- +-----------+-----------------+--------------------------+
-- | order_id | customer_id | order_placed_date |
-- +-----------+-----------------+--------------------------+
-- | 1 | 1 | 2016-11-11 |
-- | 2 | 1 | 2016-10-01 |
-- | 3 | 2 | 2016-06-01 |
-- | 4 | 2 | 2015-06-01 |
-- | 5 | 1 | 2015-06-01 |
-- +----------+-------------+--------------------------------+
-- Sample OutPut:
-- +--------------------+-----------------+
-- | email | order_count |
-- +--------------------+-----------------+
-- | abc@mail.com | 2 |
-- | efg@mail.com | 1 |
-- +--------------------+----------






create database CocoaConfections;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| basicsqlone        |
| cocoaconfections   |
| dayone             |
| information_schema |
| mysql              |
| org                |
| pallu1sql          |
| performance_schema |
| sys                |
+--------------------+
9 rows in set (0.00 sec)

mysql> use CocoaConfections;
Database changed
mysql> CREATE TABLE customers (
    -> customer_id INT PRIMARY KEY,
    -> first_name VARCHAR(255) NOT NULL,
    -> last_name VARCHAR(255) NOT NULL,
    -> email VARCHAR(255) NOT NULL,
    -> address VARCHAR(255) DEFAULT NULL,
    -> city VARCHAR(255) DEFAULT NULL,
    -> state VARCHAR(2) DEFAULT NULL,
    -> zip_code VARCHAR(5) DEFAULT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE orders (
    -> order_id INT PRIMARY KEY,
    -> customer_id INT NOT NULL,
    -> order_placed_date DATE NOT NULL,
    -> FOREIGN KEY (customer_id) REFERENCES customers
    -> (customer_id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>  INSERT INTO Worker
    ->     -> (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUE
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUE' at line 2
mysql> Insert into Customers(customer_id,first_name,last_name,email,address,city,state,zip_code) values
    -> (1,"abx","a","abc@gmail.com","1st street","chennai","TN",60001),
    -> (2,"efg","e","efg@gmail.com","2nd street","bangalore","ka",50002),
    -> (3,"ijk","i","ijk@gmail.com","3rd street","mumbai","mh",40002);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql> insert into orders values(1 , 1  , '2016-11-11');
Query OK, 1 row affected (0.01 sec)

mysql> insert into orders values(2 , 1  , '2016-10-01');
Query OK, 1 row affected (0.00 sec)

mysql> insert into orders values(3 , 2  , '2016-06-01');
Query OK, 1 row affected (0.00 sec)

mysql> insert into orders values(4, 2  , '2015-06-01');
Query OK, 1 row affected (0.00 sec)

mysql>  insert into orders values(5 , 1  , '2015-06-01');
Query OK, 1 row affected (0.00 sec)



mysql> select
    ->     customers.email, COUNT(*) AS 2016_num_orders
    ->     FROM
    ->     orders
    ->     INNER JOIN
    ->     customers on orders.customer_id = customers.customer_id
    ->     WHERE
    ->     orders.order_placed_date BETWEEN CAST('2016-01-01' AS DATE) AND CAST('2016-12-31' AS DATE)
    ->     GROUP BY
    ->     customers.email
    ->     ORDER BY
    ->     2016_num_orders DESC;
+---------------+-----------------+
| email         | 2016_num_orders |
+---------------+-----------------+
| abc@gmail.com |               2 |
| efg@gmail.com |               1 |
+---------------+-----------------+
2 rows in set (0.00 sec)

mysql>
































