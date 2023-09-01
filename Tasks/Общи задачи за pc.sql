use pc;

--�������� ������, ����� ������� ������ ������ �������, �� ����� ��
--��������� ����� ������������� � 15" �����, ���� � � 11" �����.

SELECT MODEL, CODE, SCREEN
FROM LAPTOP
WHERE SCREEN = 11 OR SCREEN = 15;

--�� �� ������� ���������� ������ ��������, ����� ���� � ��-����� �� ���������� ������, ����������� �� ����� ������������.

SELECT DISTINCT PC.MODEL
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL 
WHERE MAKER IN (SELECT MAKER 
FROM LAPTOP JOIN PRODUCT ON LAPTOP.MODEL = PRODUCT.MODEL
GROUP BY MAKER)
AND PRICE < ANY(SELECT MIN(PRICE) FROM LAPTOP JOIN PRODUCT
ON LAPTOP.MODEL = PRODUCT.MODEL
GROUP BY MAKER);

--���� ����� �������� ���� �� �� �������� � ������� ������������� �
--�������� ����. �� �� ������� ���� ������ ��������, ����� ������ ���� (��
--���������� �� �������������) � ��-����� �� ���-������� ������, �����������
--�� ����� ������������.

SELECT DISTINCT PC.MODEL, AVG(PRICE) AS AvgPrice
FROM PC JOIN PRODUCT P1 ON PC.MODEL = P1.MODEL
GROUP BY PC.MODEL, MAKER
HAVING AVG(PRICE) < ANY(SELECT MIN(PRICE)
FROM LAPTOP JOIN PRODUCT P2 ON P2.MODEL=LAPTOP.MODEL
WHERE P1.MAKER=P2.MAKER);

--�������� ������, ����� ������� �� ����� �������� ��� �� ��������,
--������������ � ���� ��������, ����� ���� ����, ��-������ ��� ����� ��
--��������.

SELECT PC.CODE, MAKER, COUNT(PC.CODE) AS num_pc
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL
JOIN PC P2 ON PC.PRICE<=P2.PRICE AND PRODUCT.MODEL=P2.MODEL
GROUP BY PC.CODE, MAKER;

