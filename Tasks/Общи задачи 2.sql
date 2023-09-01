--CREATE DATABASE FurnitureCompany;

/*USE FurnitureCompany;

CREATE TABLE Customer(
Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
Customer_Name VARCHAR(50),
Customer_Address VARCHAR(50),
Customer_City VARCHAR(30),
City_Code INT
);

CREATE TABLE Product(
Product_ID INT PRIMARY KEY,
Product_Description VARCHAR(50),
Product_Finish VARCHAR(50),
Standard_Price INT,
Product_Line_ID INT
);

CREATE TABLE Order_T(
Order_ID INT PRIMARY KEY,
Order_Date DATE,
Customer_ID INT
);

CREATE TABLE Order_Line(
Order_ID INT,
Product_ID INT,
Order_Quantity INT
);

ALTER TABLE Order_T
ADD CONSTRAINT cust_id FOREIGN KEY(Customer_ID)
REFERENCES Customer(Customer_ID);

ALTER TABLE Order_Line
ADD CONSTRAINT ord_id FOREIGN KEY(Order_ID)
REFERENCES Order_T(Order_ID);

ALTER TABLE Order_Line
ADD CONSTRAINT prod_id FOREIGN KEY(Product_ID)
REFERENCES Product(Product_ID);

ALTER TABLE Product
ADD CONSTRAINT prod_finish
CHECK (Product_Finish IN ('череша', 'естествен ясен', 'бял ясен', 'червен дъб', 'естествен дъб', 'орех'));

INSERT INTO Product VALUES
(1000, 'офис бюро', 'череша', 195, 10),
(1001, 'директорско бюро', 'червен дъб', 250, 10),
(2000, 'офис стол', 'череша', 75, 20),
(2001, 'директорски стол', 'естествен дъб', 129, 20),
(3000, 'етажерка за книги', 'естествен ясен', 85, 30),
(4000, 'настолна лампа', 'естествен ясен', 35, 40);

insert into CUSTOMER values
('Иван Петров', 'ул. Лавеле 8', 'София', '1000'),
('Камелия Янева', 'ул. Иван Шишман 3', 'Бургас', '8000'),
('Васил Димитров', 'ул. Абаджийска 87', 'Пловдив', '4000'),
('Ани Милева', 'бул. Владислав Варненчик 56', 'Варна','9000');

insert into ORDER_T values
(100, '2013-01-05', 1),
(101, '2013-12-07', 2),
(102, '2014-10-03', 3),
(103, '2014-10-08', 2),
(104, '2015-10-05', 1),
(105, '2015-10-05', 4),
(106, '2015-10-06', 2),
(107, '2016-01-06', 1);insert into ORDER_LINE values
(100, 4000, 1),
(101, 1000, 2),
(101, 2000, 2),
(102, 3000, 1),
(102, 2000, 1),
(106, 4000, 1),
(103, 4000, 1),
(104, 4000, 1),
(105, 4000, 1),
(107, 4000, 1);

SELECT Product.Product_ID, Product.Product_Description, COUNT(ORDER_ID) AS TimesOrdered
FROM PRODUCT JOIN Order_Line ON Product.Product_ID=Order_Line.Product_ID
GROUP BY Product.Product_ID, Product.Product_Description;

SELECT Product.Product_ID, Product.Product_Description, COUNT(ORDER_QUANTITY) AS TotalQuantityOdered
FROM PRODUCT LEFT JOIN Order_Line ON Product.Product_ID=Order_Line.Product_ID
GROUP BY Product.Product_ID, Product.Product_Description;

SELECT Customer.Customer_Name, SUM(STANDARD_PRICE*ORDER_QUANTITY) AS OrderAmount
FROM CUSTOMER JOIN Order_T ON Customer.Customer_ID=Order_T.Customer_ID
JOIN Order_Line ON Order_T.Order_ID=Order_Line.Order_ID
JOIN Product ON Order_Line.Product_ID=Product.Product_ID
GROUP BY Customer.Customer_Name;

USE PC;

SELECT DISTINCT MAKER
FROM PRODUCT
WHERE TYPE='PRINTER' AND MAKER IN (SELECT MAKER
FROM PRODUCT
WHERE TYPE='LAPTOP');

SELECT MAKER
FROM PRODUCT 
WHERE TYPE='PRINTER'
INTERSECT
(SELECT MAKER 
FROM PRODUCT
WHERE TYPE='LAPTOP');

UPDATE PC
SET PRICE=PRICE*0.95
WHERE MODEL IN (SELECT PRODUCT.MODEL
FROM PRODUCT JOIN PC ON product.model=PC.model
GROUP BY MAKER, product.model
HAVING AVG(PC.PRICE)>800);

SELECT HD, MIN(PRICE)
FROM PC
WHERE HD>=10 AND HD <=30
GROUP BY HD;
*/
USE SHIPS;

CREATE VIEW bigger_battles
AS
SELECT BATTLE
FROM OUTCOMES JOIN SHIPS ON SHIP=NAME JOIN CLASSES ON SHIPS.CLASS=CLASSES.CLASS
WHERE BATTLE NOT LIKE 'GUADALCANAL'
GROUP BY BATTLE
HAVING COUNT(SHIP) >= ALL(SELECT COUNT(SHIP)
FROM OUTCOMES JOIN SHIPS ON SHIP=NAME
WHERE BATTLE='GUADALCANAL')
AND COUNT(COUNTRY) >= ALL (SELECT COUNT(COUNTRY) 
FROM OUTCOMES JOIN SHIPS ON SHIP=NAME JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE BATTLE='GUADALCANAL');

DELETE FROM OUTCOMES
WHERE SHIP IN (SELECT SHIP
FROM OUTCOMES
GROUP BY BATTLE,SHIP
HAVING COUNT(SHIP)=1);

USE SHIPS;

INSERT INTO OUTCOMES VALUES 
('Missouri','Surigao Strait', 'sunk'),      
('Missouri','North Cape', 'sunk'),      
('Missouri','North Atlantic', 'ok');

DELETE FROM OUTCOMES
WHERE SHIP IN (SELECT SHIP
FROM OUTCOMES JOIN BATTLES ON BATTLE=NAME
WHERE RESULT='SUNK'
GROUP BY SHIP
HAVING COUNT(DATE) >=2);

CREATE VIEW battles_countries
AS
 SELECT DISTINCT BATTLE,COUNTRY
 FROM OUTCOMES JOIN SHIPS ON SHIP=NAME JOIN CLASSES ON SHIPS.CLASS=CLASSES.CLASS;
 */
SELECT DISTINCT BATTLE
FROM battles_countries
WHERE BATTLE NOT LIKE 'Guadalcanal'
AND COUNTRY IN(SELECT COUNTRY
                 FROM battles_countries
				 WHERE BATTLE='Guadalcanal');

SELECT COUNTRY,COUNT(BATTLE)
FROM CLASSES JOIN SHIPS ON CLASSES.CLASS=SHIPS.CLASS
JOIN OUTCOMES ON SHIP=NAME
GROUP BY COUNTRY;