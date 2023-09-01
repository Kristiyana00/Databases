--CREATE DATABASE Electronics

use electronics;

--����������� �������� �������:
--Product (maker, model, type), ������:
--����� � ��� �� ����� 4 �������,
--������������ � ��� �� ����� 1 ������,
--��� � ��� �� 7 �������;

CREATE TABLE Product(
maker CHAR,
model CHAR(4),
type VARCHAR(7)
);

--Printer (code, model, price), ������:
--��� � ���� �����,
--����� � ��� �� ����� 4 �������,
--���� � ������� �� ��� ����� ���� ����������� �������;

CREATE TABLE Printer(
code INT,
model CHAR(4),
price DECIMAL(20,2)
);
-- �������� ������� � �������� ����� ��� ��������������� �������
INSERT INTO PRODUCT VALUES('E', '1260', 'PC');

INSERT INTO PRODUCT VALUES('A', '1408', 'Printer');

INSERT INTO PRODUCT VALUES('D', '1288', 'Printer');

INSERT INTO PRODUCT VALUES('A', '1298', 'Laptop');

INSERT INTO PRINTER VALUES(1, '1401', 150);

INSERT INTO PRINTER VALUES(2, '1408', 270);

INSERT INTO PRINTER VALUES(3, '1288', 400);

--�������� ��� ��������� Printer ��������:
--type - ��� �� 6 ������� (���������: type ���� �� ������
--�������� 'laser', 'matrix' ��� 'jet'),
--color - ��� �� ����� 1 ������, �������� �� ������������ 'n'
--(���������: color ���� �� ������ �������� 'y' ��� 'n').
ALTER TABLE Printer 
ADD type VARCHAR(6), color CHAR(1);

--) �������� ������, ����� �������� �������� price �� ��������� Printer

ALTER TABLE Printer
DROP COLUMN price;

--�������� ���������, ����� ��� ������� � ������ 1.

DROP TABLE Printer;

DROP TABLE Product;