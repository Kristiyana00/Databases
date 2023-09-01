USE movies;
--�������� ������, ����� ������� ������� �� ���������, ����� �� ���� �
--���������� � ����� ������ ��� 10 �������.
SELECT NAME
FROM MOVIESTAR
WHERE NAME IN (SELECT NAME 
FROM MOVIEEXEC
WHERE NETWORTH > 10000000) AND GENDER = 'F';

--�������� ������, ����� ������� ������� �� ���� ������� (���� � ����),
--����� �� �� ����������.
SELECT NAMEFROM MOVIESTARWHERE NAME NOT IN (SELECT NAME FROM MOVIEEXEC);--�������� ������, ����� ������� ������� �� ������ ����� � �������,
--��-������ �� ��������� �� ����� �Star Wars�SELECT TITLEFROM MOVIEWHERE LENGTH > (SELECT LENGTH FROM MOVIEWHERE TITLE = 'Star Wars');--�������� ������, ����� ������� ������� �� ������������ � ������� ��
--������� �� ������ �����, ����� �� ����������� �� ���������� � �����
--������ ��-������ �� ���� �� �Merv Griffin�

SELECT TITLE, N.NAME
FROM MOVIE M, (SELECT CERT#, NAME
FROM MOVIEEXEC
WHERE NETWORTH > (SELECT NETWORTH
FROM MOVIEEXEC
WHERE NAME ='Merv Griffin')) N
WHERE M.PRODUCERC# = N.CERT#;