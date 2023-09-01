USE SHIPS;

--�������� ������, ����� ������� ���� �� ��������� ����� ������

SELECT COUNT(DISTINCT CLASS) AS classNum
FROM CLASSES
WHERE TYPE = 'bb';

--�������� ������, ����� ������� ������� ���� ������ �� ����� ���� ���� �����.

SELECT CLASS, AVG(NUMGUNS) AS avgGuns
FROM CLASSES
WHERE TYPE = 'bb'
GROUP BY CLASS;

--�������� ������, ����� ������� ������� ���� ������ �� ������ ����� ������.

SELECT AVG(NUMGUNS) AS avgGuns
FROM CLASSES
WHERE TYPE = 'BB';

--�������� ������, ����� ������� �� ����� ���� ������� � ���������� ������, �
--����� ����� �� ���������� ���� � ������ �� ����.

SELECT CLASS, MIN(LAUNCHED) AS FirstYear, MAX(LAUNCHED) AS LastYear
FROM SHIPS
GROUP BY CLASS;

--�������� ������, ����� ������� ���� �� ��������, �������� � ����� ������
--�����.

SELECT CLASS, COUNT(RESULT) AS No_Sunk
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE RESULT = 'sunk'
GROUP BY CLASS;

--�������� ������, ����� ������� ���� �� ��������, �������� � ����� ������
--�����, �� ���� ������� � ������ �� 2 ������.

-- ?????????????

SELECT K.CLASS, K.RES
FROM ((SELECT CLASS, COUNT(RESULT) AS Res
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE RESULT = 'sunk'
GROUP BY CLASS, RESULT)
INTERSECT
(SELECT CLASS, COUNT(RESULT) as Res
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
GROUP BY CLASS, RESULT
HAVING COUNT(SHIP) >= 2)) K
GROUP BY CLASS, Res;

--�������� ������, ����� ������� ������� ������� �� �������� �� �������� ��
--����� ������.

SELECT COUNTRY, CONVERT(DECIMAL (9,2), SUM(WEIGHT)/SUM(BR)) AS Avg_bore
FROM
(
SELECT C.COUNTRY, C.CLASS, COUNT(S.NAME) AS BR, COUNT(S.NAME)* C.BORE AS WEIGHT
FROM CLASSES C JOIN SHIPS S ON C.CLASS = S.CLASS
GROUP BY C.COUNTRY, C.CLASS, C.BORE) T
GROUP BY COUNTRY;
------------------------------------------------------------
SELECT COUNTRY, CONVERT(DECIMAL(9,2), AVG(BORE)) AS Avg_bore
FROM CLASSES JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
GROUP BY COUNTRY;
