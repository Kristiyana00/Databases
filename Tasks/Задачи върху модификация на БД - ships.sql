use ships;

--��� ��������� ����� ������ �� ����� Nelson - Nelson � Rodney - �� ���� ������� �� ����
--������������ ���� 1927 �. ����� �� ����� 16-������ ������ (bore) � ��������������� �� 34000
--���� (displacement). �������� ���� ����� ��� ������ �� �����.

INSERT INTO SHIPS (NAME, CLASS, LAUNCHED)
VALUES ('Nelson', 'Nelson', 1927), ('Rodney', 'Nelson', 1927);

INSERT INTO CLASSES (CLASS, TYPE, COUNTRY, NUMGUNS, BORE, DISPLACEMENT)
VALUES ('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000);

--�������� �� ��������� Ships ������ ������, ����� �� �������� � �����.

DELETE FROM SHIPS
WHERE NAME IN (SELECT SHIP FROM OUTCOMES WHERE RESULT = 'SUNK');

--��������� ������� � ��������� Classes ����, �� ��������� (bore) �� �� ������� � ���������� (�
--������� � � ������, 1 ��� ~ 2.5 ��) � ����������������� �� �� ������� � �������� ������ (1 �.�.
--= 1.1 �.)

UPDATE CLASSES
SET BORE = BORE*2.5;

UPDATE CLASSES
SET DISPLACEMENT = DISPLACEMENT/1.1;