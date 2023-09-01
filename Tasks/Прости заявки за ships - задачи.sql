--�� ������ �� ����� SHIPS

USE ships;

--�������� ������, ����� ������� ����� � �������� �� ������ ������� � ������� �� 10 ������.

SELECT CLASS, COUNTRY
FROM CLASSES
WHERE NUMGUNS < 10;

--�������� ������, ����� ������� ������� �� ��������, ������� �� ����
--����� 1918. ������� ��������� shipName �� ��������.

SELECT NAME AS SHIPNAME
FROM SHIPS
WHERE LAUNCHED < 1918;

--�������� ������, ����� ������� ������� �� ��������, �������� � �����
--� ������� �� ����������� �����.

SELECT SHIP, BATTLE
FROM OUTCOMES
WHERE RESULT = 'SUNK';

--�������� ������, ����� ������� ������� �� �������� � ���, ���������
--� ����� �� ������ ����.

SELECT NAME
FROM SHIPS
WHERE NAME = CLASS;

--�������� ������, ����� ������� ������� �� ��������, ����� �������� �
--������� R.

SELECT NAME
FROM SHIPS
WHERE NAME LIKE 'R%';

--�������� ������, ����� ������� ������� �� ��������, ����� �������� 2
--��� ������ ����.

SELECT NAME
FROM SHIPS
WHERE NAME LIKE '% %';
