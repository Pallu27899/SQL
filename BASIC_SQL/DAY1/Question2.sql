
mysql> create table students(name varchar(20), rollno int, branch varchar(20),city varchar(20));
Query OK, 0 rows affected (0.03 sec)

mysql> insert into students values("vijaya", 150,cse,"chennai");
ERROR 1054 (42S22): Unknown column 'cse' in 'field list'
mysql> insert into students values("vijaya", 150,"cse","chennai");
Query OK, 1 row affected (0.00 sec)

mysql> insert into students values("sita", 202,"etc","kolkata");
Query OK, 1 row affected (0.00 sec)

mysql> insert into students values("ravi", 300,"eee","delhi");
Query OK, 1 row affected (0.00 sec)

mysql> insert into students values("basu", 165,"etc","chennai");
Query OK, 1 row affected (0.00 sec)

mysql> insert into students values("rashmi", 107,"etc","rkl");
Query OK, 1 row affected (0.00 sec)

mysql> insert into students values("karan", 117,"bme","bbsr");
Query OK, 1 row affected (0.00 sec)

mysql> insert into students values("rekha", 117,"cse","ctc");
Query OK, 1 row affected (0.00 sec)


mysql> select * from students;
+--------+--------+--------+---------+
| name   | rollno | branch | city    |
+--------+--------+--------+---------+
| vijaya |    150 | cse    | chennai |
| sita   |    202 | etc    | kolkata |
| ravi   |    300 | eee    | delhi   |
| basu   |    165 | etc    | chennai |
| rashmi |    107 | etc    | rkl     |
| karan  |    117 | bme    | bbsr    |
| rekha  |    117 | cse    | ctc     |
+--------+--------+--------+---------+
7 rows in set (0.00 sec)




-- 1. Count the number of students of each department.

mysql> SELECT branch, COUNT(*)  FROM students  GROUP BY branch;
+--------+----------+
| branch | COUNT(*) |
+--------+----------+
| cse    |        2 |
| etc    |        3 |
| eee    |        1 |
| bme    |        1 |
+--------+----------+
4 rows in set (0.01 sec)

-- 2. Count the number of students of each department where the department name starts with ‘E’.
mysql> SELECT  COUNT(*)  FROM students   WHERE branch LIKE "e%" ;
+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+
1 row in set (0.00 sec)


-- 3. Add a field called MARKS to the table STUDENT which can hold a number upto 8 digit length.
mysql> ALTER TABLE students ADD marks int;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0


-- 4. Modify the field :"Name" of the table STUDENT to hold a maximum of 25 character.

mysql> ALTER TABLE students modify COLUMN name varchar(25);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

-- 5. Delete all rows from the table STUDENT where branch is ETC.


mysql> DELETE FROM students WHERE branch="etc";
Query OK, 3 rows affected (0.01 sec)

mysql> select * from students;
+--------+------+--------+---------+-------+
| name   | roll | branch | city    | marks |
+--------+------+--------+---------+-------+
| vijaya |  150 | cse    | chennai |  NULL |
| ravi   |  300 | eee    | delhi   |  NULL |
| karan  |  111 | cse    | ctc     |  NULL |
| rekha  |  117 | bme    | bbsr    |  NULL |
+--------+------+--------+---------+-------+
4 rows in set (0.00 sec)


-- 6. Rename the table STUDENT to STUDINFORMATION.

mysql> ALTER TABLE  students RENAME TO studentsinfo;
Query OK, 0 rows affected (0.03 sec)


-- 7. Delete all the data part from the table STUDENT.

mysql> delete from studentsinfo;
Query OK, 4 rows affected (0.02 sec)

8. Destroy the table STUDENT.
mysql> drop table studentsinfo;
Query OK, 0 rows affected (0.02 sec)
