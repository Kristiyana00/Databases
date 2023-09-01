USE pc

--�������� ������, ����� ������� ������������� � ��������� �� ��������� �
--������ �� ����� ���� 9 GB.

SELECT MAKER, SPEED
FROM LAPTOP JOIN PRODUCT ON LAPTOP.model = PRODUCT.model
WHERE HD >= 9;

--�������� ������, ����� ������� ����� � ���� �� ����������, ����������� ��
--������������ � ��� B.

SELECT PRODUCT.model,PRICE
FROM PRODUCT JOIN PC ON PRODUCT.model = PC.model
WHERE MAKER = 'B'
UNION
SELECT product.model, PRICE
FROM PRODUCT JOIN LAPTOP ON PRODUCT.MODEL = LAPTOP.MODEL
WHERE MAKER = 'B'
UNION 
SELECT PRODUCT.MODEL, PRICE 
FROM PRODUCT JOIN PRINTER ON PRODUCT.MODEL = PRINTER.MODEL
WHERE MAKER = 'B'
-----------------
(SELECT PRODUCT.MODEL, PRICE
FROM PRODUCT, PC
WHERE PRODUCT.MODEL = PC.MODEL AND MAKER = 'B')
UNION
(SELECT PRODUCT.MODEL, PRICE
FROM PRODUCT, LAPTOP
WHERE PRODUCT.MODEL = LAPTOP.MODEL AND MAKER = 'B')
UNION
(SELECT PRODUCT.MODEL, PRICE
FROM PRODUCT, PRINTER
WHERE PRODUCT.MODEL = PRINTER.MODEL AND MAKER = 'B');

--�������� ������, ����� ������� ���������������, ����� ����������� �������,
--�� �� ����������� ���������� ��������.--�������� ������, ����� ������� ��������� �� ���� �������, ����� �� ���������
--� ���� ��� �������� ���������� ��������� (��� ��������� � �������� ���).SELECT DISTINCT P1.HDFROM PC P1WHERE P1.HD = ANY(SELECT HDFROM PC P2WHERE P1.CODE != P2.CODE);-----------------SELECT DISTINCT PC1.HDFROM PC PC1 JOIN PC PC2 ON PC1.HD = PC2.HDWHERE PC1.CODE <> PC2.CODE--�������� ������, ����� ������� �������� ������ �� ���������� ��������,
--����� ���� ������� ������� � �����. �������� ������ �� �� �������� ���� ��
--������, �������� ���� (i, j), �� �� � (j, i).SELECT DISTINCT PC1.MODEL, PC2.MODELFROM PC PC1 JOIN PC PC2 ON PC1.SPEED = PC2.SPEED AND PC1.RAM = PC2.RAMWHERE PC1.MODEL < PC2.MODEL;--�������� ������, ����� ������� ��������������� �� ���� ��� ��������
--���������� ��������� � ������� ���� 400.SELECT DISTINCT P1.MAKERFROM PC PC1 JOIN PRODUCT P1 ON PC1.MODEL = P1.MODELJOIN PRODUCT P2 ON P1.MAKER = P2.MAKERJOIN PC PC2 ON PC2.MODEL = P2.MODELWHERE PC1.CODE <> PC2.CODE AND PC1.SPEED >= 400 AND PC2.SPEED >= 400;