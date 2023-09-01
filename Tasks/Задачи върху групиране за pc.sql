USE PC;

--�������� ������, ����� ������� �������� ������� �� ������������ ��������

SELECT CONVERT(decimal (20,2), AVG(SPEED)) AS AvgSpeed
FROM PC;

--�������� ������, ����� ������� ������� ������ �� �������� �� ��������� ��
--����� ������������.

SELECT MAKER, AVG(SCREEN) AS AvgScreen
FROM PRODUCT JOIN LAPTOP ON PRODUCT.MODEL = LAPTOP.MODEL
GROUP BY PRODUCT.MAKER;

--�������� ������, ����� ������� �������� ������� �� ��������� � ���� ��� 1000

SELECT CONVERT(DECIMAL (20,2), AVG(SPEED)) AS AvgSpeed
FROM LAPTOP
WHERE PRICE > 1000;

--�������� ������, ����� ������� �������� ���� �� ������������ ��������,
--����������� �� ������������ �A�.

SELECT MAKER, CONVERT(DECIMAL (20,2), AVG(PRICE)) AS AvgPrice
FROM PRODUCT JOIN PC ON PRODUCT.MODEL = PC.MODEL
WHERE MAKER = 'A'
GROUP BY MAKER;

--�������� ������, ����� ������� �������� ���� �� ������������ �������� �
--��������� �� ������������ �B�.

SELECT MAKER, AVG(PRICE) AS AvgPrice
FROM (SELECT MAKER, PRICE
FROM PRODUCT P, PC
WHERE P.MODEL = PC.MODEL AND MAKER = 'B'
UNION ALL
SELECT MAKER, PRICE
FROM PRODUCT P, LAPTOP L
WHERE P.MODEL = L.MODEL AND MAKER = 'B') T
GROUP BY MAKER;

--�������� ������, ����� ������� �������� ���� �� ������������ ��������
--������ ���������� �� �������.SELECT DISTINCT SPEED, AVG(PRICE) AS AvgPriceFROM PCGROUP BY SPEED;--�������� ������, ����� ������� ���������������, ����� �� ��������� ���� 3
--�������� ���������� ��������� (� �������� ���).SELECT P.MAKER, COUNT(P.MODEL) AS number_of_pcFROM PC JOIN PRODUCT P ON P.MODEL = PC.MODELWHERE P.TYPE = 'PC'GROUP BY P.MAKERHAVING COUNT(P.MODEL) >= 3;--�������� ������, ����� ������� ��������������� � ���-������ ���� ��
--���������� ��������.SELECT MAKER, MAX(PRICE) AS priceFROM PRODUCT JOIN PC ON PRODUCT.MODEL = PC.MODELGROUP BY MAKERHAVING MAX(PRICE) >= ALL(SELECT PRICEFROM PRODUCT JOIN PC ON PRODUCT.MODEL = PC.MODEL);--�������� ������, ����� ������� �������� ���� �� ������������ �������� ��
--����� ������� ��-������ �� 800.SELECT SPEED, AVG(PRICE) AS AvgPriceFROM PCGROUP BY SPEEDHAVING SPEED > 800;--------------------------------------------SELECT SPEED, AVG(PRICE) AS AvgPriceFROM PCWHERE SPEED > 800GROUP BY SPEED;--�������� ������, ����� ������� ������� ������ �� ����� �� ���� ����������
--��������, ����������� �� �������������, ����� ����������� � ��������.
--���������� �� �� ������ �� ����� ������� ������������.SELECT MAKER, CONVERT(DECIMAL (9,2), AVG(HD)) AS AvgHDDFROM PC JOIN PRODUCT P ON P.MODEL = PC.MODELWHERE MAKER IN (SELECT DISTINCT MAKER FROM PRODUCT WHERE TYPE = 'Printer')GROUP BY MAKER;
