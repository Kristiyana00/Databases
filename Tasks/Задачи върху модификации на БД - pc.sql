use pc;

--����������� ��� INSERT ������. ��������� � ������ ����� �����, �� ���������� ��������
--����� 1100 � �������� �� ������������� C, ��� �������� 2400 MHz, RAM 2048 MB, ����� ����
--500 GB, 52x ������� ������� ���������� � ������ $299. ���� ������ �������� ��� ��� 12.

INSERT INTO PRODUCT(MAKER,MODEL,TYPE)
VALUES ('C', '1100', 'PC');

INSERT INTO PC (CODE, MODEL, SPEED, RAM, HD, CD, PRICE)
VALUES (12, '1100', 2400, 2048, 500, '52x', 299);

--�� �� ������ ��������� ���������� � ��������� PC �� �������� ����� 1100

DELETE FROM PC
WHERE MODEL = '1100';

--�� �� ������� �� ��������� Laptop ������ �������, ��������� �� ������������, ����� ��
--���������� ��������.DELETE FROM PRODUCTWHERE TYPE = 'Laptop' AND MAKER NOT IN (SELECT MAKERFROM PRODUCT WHERE TYPE = 'Printer');DELETE FROM LAPTOPWHERE MODEL NOT IN (SELECT MODEL FROM PRODUCTWHERE TYPE = 'Laptop');--������������ � ������ ������������ B. �� ������ �������� �� � ��������� ������������� ��
--���� �.UPDATE PRODUCTSET MAKER = 'A'WHERE MAKER ='B';--�� �� ������ ���������� ������ �� ����� �������� � �� �� ������� �� 20 GB ��� ����� ����� ����.UPDATE PCSET PRICE = PRICE/2;UPDATE PCSET HD = HD + 20;--�� ����� ������ �� ������������ B �������� �� ���� ��� ��� ��������� �� ������.UPDATE LAPTOPSET SCREEN = SCREEN + 1WHERE MODEL IN (SELECT MODEL FROM PRODUCT WHERE MAKER = 'B');