use movies;

--�� �� ������ ���������� �� ��������� Nicole Kidman. �� ��� ����� ����, �� � ������ ��
--20.06.1967

INSERT INTO MOVIESTAR (NAME, BIRTHDATE)
VALUES ('Nicole Kidman', '1967-06-20');

--�� �� ������� ������ ���������� � ����� ������ ��� 30 �������

DELETE FROM MOVIEEXEC
WHERE NETWORTH < 30000000;

--�� �� ������ ������������ �� ������ ������� ������, �� ����� �� �� ���� ������.
DELETE FROM MOVIESTAR
WHERE ADDRESS IS NULL;