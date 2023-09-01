use ships;

--�������� ������, ����� ������� ������ ������� ���������� �� �����
--�����, ����������� � ������� �� ������� ����. � ��������� �� ������ ��
--�� �������� ���� �������, ����� ����� ������.

SELECT *
FROM SHIPS S RIGHT JOIN CLASSES C ON S.CLASS = C.CLASS
WHERE S.NAME IS NOT NULL;

--��������� ������� ������, ���� ���� ��� �������� � ��������� �
--���������, ����� ����� ������, �� ����������� ������ ��� ������ ���
--���� �������.

SELECT * 
FROM SHIPS S RIGHT JOIN CLASSES C ON S.CLASS = C.CLASS
WHERE S.NAME IS NOT NULL
UNION
SELECT *
FROM SHIPS S RIGHT JOIN CLASSES C ON S.CLASS = C.CLASS
WHERE S.NAME IS NULL AND C.CLASS IN (SELECT NAME FROM SHIPS);

--�� ����� ������ �������� ������� �� ��������, ����� ������ �� ��
--��������� � �����.SELECT DISTINCT C.COUNTRY, S.NAMEFROM CLASSES C JOIN SHIPS S ON C.CLASS = S.CLASSLEFT JOIN OUTCOMES O ON S.NAME = O.SHIPWHERE O.SHIP IS NULL ORDER BY C.COUNTRY;--�������� ������� �� ������ ������ � ���� 7 ������, ������� �� ����
--���� 1916, �� �������� ������������ ������ Ship Name.SELECT DISTINCT NAME AS ShipNameFROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASSWHERE LAUNCHED = 1916 AND NUMGUNS >= 7;--�������� ������� �� ������ �������� � ����� ������, ����� � ���� ��
--���������� �� �������, � ����� �� �� ��������. ��������� ��������� ��
--��� �� �������.

SELECT SHIP, BATTLE, DATE
FROM OUTCOMES JOIN BATTLES ON BATTLE = NAME
WHERE RESULT = 'Sunk'
ORDER BY BATTLE;

--�������� �����, ����������������� � �������� �� ������� �� ���� ��
--������ ������, ����� ���� ������ ��� ���� ������ ����.

SELECT NAME, DISPLACEMENT, LAUNCHED
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE SHIPS.NAME = CLASSES.CLASS
ORDER BY NAME;

--�������� ������ ������� ������, �� ����� ���� ������ �� ���� ���� ����
--�����.

SELECT CLASSES.CLASS, TYPE, COUNTRY, NUMGUNS, BORE, DISPLACEMENT
FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE LAUNCHED IS NULL;

--�������� �����, ����������������� � ���� ������ �� ��������,
--��������� � ������� �North Atlantic�, � ���� � ��������� �� �������.

SELECT NAME, DISPLACEMENT, NUMGUNS, RESULT
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS JOIN
OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE BATTLE = 'North Atlantic';
