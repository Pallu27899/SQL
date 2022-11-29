
-- CREATE TABLE Manufacturers (
--   Code INTEGER,
--   Name VARCHAR(255) NOT NULL,
--   PRIMARY KEY (Code)   
-- );

-- CREATE TABLE Products (
--   Code INTEGER,
--   Name VARCHAR(255) NOT NULL ,
--   Price DECIMAL NOT NULL ,
--   Manufacturer INTEGER NOT NULL,
--   PRIMARY KEY (Code), 
--   FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
-- );

-- INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
-- INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
-- INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
-- INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
-- INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
-- INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

-- INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
-- INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
-- INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
-- INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
-- INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
-- INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
-- INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
-- INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
-- INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
-- INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);






-- 1. Select the names of all the products in the store.

SELECT name from Products;

-- 2. Select the names and the prices of all the products in the store.

SELECT name , price from Products

-- 3. Select the name of the products with a price less than or equal to $200.

SELECT name from Products WHERE price <= 200

-- 4. Select all the products with a price between $60 and $120.

SELECT * from Products WHERE price BETWEEN 60 AND 120

-- 5. Select the name and price in cents (i.e., the price must be multiplied by 100).

select name, price*100 from products;

-- 6. Compute the average price of all the products.

select avg(price) from products;

-- 7. Compute the average price of all products with manufacturer code equal to 2.

select avg(price) from products WHERE Manufacturer = 2

-- 8. Compute the number of products with a price larger than or equal to $180.

select count(*) from products where price>=180;

-- 9. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in 	descending order), and then by name (in ascending order).

select name,price from products where price>=180 ORDER by price DESC, name asc;

-- 10. Select all the data from the products, including all the data for each product's manufacturer.

select p.*, q.name from products p, Manufacturers q where p.manufacturer = q.code;

-- 11. Select the product name, price, and manufacturer name of all the products.

select p.name,p.price, m.name from products p, Manufacturers m where p.manufacturer = m.code;

-- 12. Select the average price of each manufacturer's products, showing only the manufacturer's code.

SELECT AVG(Price), Manufacturer FROM Products GROUP BY Manufacturer;

-- 13. Select the average price of each manufacturer's products, showing the manufacturer's name.



-- 14. Select the names of manufacturer whose products have an average price larger than or equal to $150.

SELECT AVG(Price), Manufacturers.Name FROM Products, Manufacturers WHERE Products.Manufacturer = Manufacturers.Code GROUP BY Manufacturers.Name HAVING AVG(Price) >= 150;

-- 15. Select the name and price of the cheapest product.

Select name,price FROM Products ORDER BY price LIMIT 1

-- 16. Select the name of each manufacturer along with the name and price of its most expensive product.

