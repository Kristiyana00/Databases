-- �� ������ �� ����� Movies
use movies;
--�������� ������, ����� ������� ������ �� ������ �Disney�
SELECT ADDRESS
FROM STUDIO
WHERE NAME = 'DISNEY';

--�������� ������, ����� ������� ��������� ���� �� ������� Jack
--Nicholson

SELECT BIRTHDATE
FROM MOVIESTAR
WHERE NAME = 'Jack Nicholson';

--�������� ������, ����� ������� ������� �� ���������, ����� ��
--��������� ��� ���� �� 1980 ��� ��� ����, � ����� �������� ��� ������
--�Knight�

SELECT STARNAME
FROM STARSIN
WHERE MOVIEYEAR = 1980 OR MOVIETITLE LIKE '%Knight%';

--�������� ������, ����� ������� ������� �� ������������ � �����
--������ ��� 10 000 000 ������SELECT NAMEFROM MOVIEEXECWHERE NETWORTH > 10000000;--�������� ������, ����� ������� ������� �� ���������, ����� �� ����
--��� ������ �� Prefect Rd.

SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'M' OR ADDRESS = 'Prefect Rd.';