USE pc

--Напишете заявка, която извежда производителя и честотата на лаптопите с
--размер на диска поне 9 GB.

SELECT MAKER, SPEED
FROM LAPTOP JOIN PRODUCT ON LAPTOP.model = PRODUCT.model
WHERE HD >= 9;

--Напишете заявка, която извежда модел и цена на продуктите, произведени от
--производител с име B.

SELECT PRODUCT.model,PRICE
FROM PRODUCT JOIN PC ON PRODUCT.model = PC.model
WHERE MAKER = 'B'
UNION
SELECT product.model, PRICE
FROM PRODUCT JOIN LAPTOP ON PRODUCT.MODEL = LAPTOP.MODEL
WHERE MAKER = 'B'
UNION 
SELECT PRODUCT.MODEL, PRICE 
FROM PRODUCT JOIN PRINTER ON PRODUCT.MODEL = PRINTER.MODEL
WHERE MAKER = 'B'
-----------------
(SELECT PRODUCT.MODEL, PRICE
FROM PRODUCT, PC
WHERE PRODUCT.MODEL = PC.MODEL AND MAKER = 'B')
UNION
(SELECT PRODUCT.MODEL, PRICE
FROM PRODUCT, LAPTOP
WHERE PRODUCT.MODEL = LAPTOP.MODEL AND MAKER = 'B')
UNION
(SELECT PRODUCT.MODEL, PRICE
FROM PRODUCT, PRINTER
WHERE PRODUCT.MODEL = PRINTER.MODEL AND MAKER = 'B');

--Напишете заявка, която извежда производителите, които произвеждат лаптопи,
--но не произвеждат персонални компютри.--Напишете заявка, която извежда размерите на тези дискове, които се предлагат
--в поне два различни персонални компютъра (два компютъра с различен код).SELECT DISTINCT P1.HDFROM PC P1WHERE P1.HD = ANY(SELECT HDFROM PC P2WHERE P1.CODE != P2.CODE);-----------------SELECT DISTINCT PC1.HDFROM PC PC1 JOIN PC PC2 ON PC1.HD = PC2.HDWHERE PC1.CODE <> PC2.CODE--Напишете заявка, която извежда двойките модели на персонални компютри,
--които имат еднаква честота и памет. Двойките трябва да се показват само по
--веднъж, например само (i, j), но не и (j, i).SELECT DISTINCT PC1.MODEL, PC2.MODELFROM PC PC1 JOIN PC PC2 ON PC1.SPEED = PC2.SPEED AND PC1.RAM = PC2.RAMWHERE PC1.MODEL < PC2.MODEL;--Напишете заявка, която извежда производителите на поне два различни
--персонални компютъра с честота поне 400.SELECT DISTINCT P1.MAKERFROM PC PC1 JOIN PRODUCT P1 ON PC1.MODEL = P1.MODELJOIN PRODUCT P2 ON P1.MAKER = P2.MAKERJOIN PC PC2 ON PC2.MODEL = P2.MODELWHERE PC1.CODE <> PC2.CODE AND PC1.SPEED >= 400 AND PC2.SPEED >= 400;