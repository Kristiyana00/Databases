use ships;

--�������� ������, ����� ������� ��������, ����� ������ �� � ���-�����
--���� ������.

SELECT DISTINCT COUNTRY
FROM CLASSES
WHERE NUMGUNS >= ALL (SELECT NUMGUNS FROM CLASSES);

--�������� ������, ����� ������� ���������, �� ����� ���� ���� ��
--�������� � ������� � �����.

SELECT DISTINCT CLASS
FROM SHIPS
WHERE NAME = ANY (SELECT SHIP 
FROM OUTCOMES
WHERE RESULT = 'sunk');

--�������� ������, ����� ������� ����� � ����� �� �������� � 16 ������
--������.

SELECT DISTINCT NAME, CLASS
FROM SHIPS
WHERE CLASS IN (SELECT CLASS
FROM CLASSES
WHERE BORE = 16);

--�������� ������, ����� ������� ������� �� �������, � ����� ��
--��������� ������ �� ���� �Kongo�.

SELECT DISTINCT BATTLE
FROM OUTCOMES
WHERE SHIP IN (SELECT NAME
FROM SHIPS
WHERE CLASS = 'Kongo');

--�������� ������, ����� ������� ����� � ����� �� ��������, ����� ����
--������ � ��-����� ��� ����� �� ���� �� �������� ��� ����� �������
--������.

SELECT C1.CLASS, NAME
FROM CLASSES C1, SHIPS S
WHERE NUMGUNS >= ALL (SELECT NUMGUNS FROM CLASSES
WHERE BORE = C1.BORE)
AND S.CLASS = C1.CLASS
ORDER BY C1.CLASS;
