use pc;

--Използвайте две INSERT заявки. Съхранете в базата данни факта, че персонален компютър
--модел 1100 е направен от производителя C, има процесор 2400 MHz, RAM 2048 MB, твърд диск
--500 GB, 52x оптично дисково устройство и струва $299. Нека новият компютър има код 12.

INSERT INTO PRODUCT(MAKER,MODEL,TYPE)
VALUES ('C', '1100', 'PC');

INSERT INTO PC (CODE, MODEL, SPEED, RAM, HD, CD, PRICE)
VALUES (12, '1100', 2400, 2048, 500, '52x', 299);

--Да се изтрие наличната информация в таблицата PC за компютри модел 1100

DELETE FROM PC
WHERE MODEL = '1100';

--Да се изтрият от таблицата Laptop всички лаптопи, направени от производител, който не
--произвежда принтери.DELETE FROM PRODUCTWHERE TYPE = 'Laptop' AND MAKER NOT IN (SELECT MAKERFROM PRODUCT WHERE TYPE = 'Printer');DELETE FROM LAPTOPWHERE MODEL NOT IN (SELECT MODEL FROM PRODUCTWHERE TYPE = 'Laptop');--Производител А купува производител B. На всички продукти на В променете производителя да
--бъде А.UPDATE PRODUCTSET MAKER = 'A'WHERE MAKER ='B';--Да се намали наполовина цената на всеки компютър и да се добавят по 20 GB към всеки твърд диск.UPDATE PCSET PRICE = PRICE/2;UPDATE PCSET HD = HD + 20;--За всеки лаптоп от производител B добавете по един инч към диагонала на екрана.UPDATE LAPTOPSET SCREEN = SCREEN + 1WHERE MODEL IN (SELECT MODEL FROM PRODUCT WHERE MAKER = 'B');