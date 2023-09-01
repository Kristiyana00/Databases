--CREATE DATABASE Electronics

use electronics;

--Дефинирайте следните релации:
--Product (maker, model, type), където:
--модел е низ от точно 4 символа,
--производител е низ от точно 1 символ,
--тип е низ до 7 символа;

CREATE TABLE Product(
maker CHAR,
model CHAR(4),
type VARCHAR(7)
);

--Printer (code, model, price), където:
--код е цяло число,
--модел е низ от точно 4 символа,
--цена с точност до два знака след десетичната запетая;

CREATE TABLE Printer(
code INT,
model CHAR(4),
price DECIMAL(20,2)
);
-- Добавете кортежи с примерни данни към новосъздадените релации
INSERT INTO PRODUCT VALUES('E', '1260', 'PC');

INSERT INTO PRODUCT VALUES('A', '1408', 'Printer');

INSERT INTO PRODUCT VALUES('D', '1288', 'Printer');

INSERT INTO PRODUCT VALUES('A', '1298', 'Laptop');

INSERT INTO PRINTER VALUES(1, '1401', 150);

INSERT INTO PRINTER VALUES(2, '1408', 270);

INSERT INTO PRINTER VALUES(3, '1288', 400);

--Добавете към релацията Printer атрибути:
--type - низ до 6 символа (забележка: type може да приема
--стойност 'laser', 'matrix' или 'jet'),
--color - низ от точно 1 символ, стойност по подразбиране 'n'
--(забележка: color може да приема стойност 'y' или 'n').
ALTER TABLE Printer 
ADD type VARCHAR(6), color CHAR(1);

--) Напишете заявка, която премахва атрибута price от релацията Printer

ALTER TABLE Printer
DROP COLUMN price;

--Изтрийте релациите, които сте създали в Задача 1.

DROP TABLE Printer;

DROP TABLE Product;