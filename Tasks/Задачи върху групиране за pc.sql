USE PC;

--Напишете заявка, която извежда средната честота на персоналните компютри

SELECT CONVERT(decimal (20,2), AVG(SPEED)) AS AvgSpeed
FROM PC;

--Напишете заявка, която извежда средния размер на екраните на лаптопите за
--всеки производител.

SELECT MAKER, AVG(SCREEN) AS AvgScreen
FROM PRODUCT JOIN LAPTOP ON PRODUCT.MODEL = LAPTOP.MODEL
GROUP BY PRODUCT.MAKER;

--Напишете заявка, която извежда средната честота на лаптопите с цена над 1000

SELECT CONVERT(DECIMAL (20,2), AVG(SPEED)) AS AvgSpeed
FROM LAPTOP
WHERE PRICE > 1000;

--Напишете заявка, която извежда средната цена на персоналните компютри,
--произведени от производител ‘A’.

SELECT MAKER, CONVERT(DECIMAL (20,2), AVG(PRICE)) AS AvgPrice
FROM PRODUCT JOIN PC ON PRODUCT.MODEL = PC.MODEL
WHERE MAKER = 'A'
GROUP BY MAKER;

--Напишете заявка, която извежда средната цена на персоналните компютри и
--лаптопите за производител ‘B’.

SELECT MAKER, AVG(PRICE) AS AvgPrice
FROM (SELECT MAKER, PRICE
FROM PRODUCT P, PC
WHERE P.MODEL = PC.MODEL AND MAKER = 'B'
UNION ALL
SELECT MAKER, PRICE
FROM PRODUCT P, LAPTOP L
WHERE P.MODEL = L.MODEL AND MAKER = 'B') T
GROUP BY MAKER;

--Напишете заявка, която извежда средната цена на персоналните компютри
--според различните им честоти.SELECT DISTINCT SPEED, AVG(PRICE) AS AvgPriceFROM PCGROUP BY SPEED;--Напишете заявка, която извежда производителите, които са произвели поне 3
--различни персонални компютъра (с различен код).SELECT P.MAKER, COUNT(P.MODEL) AS number_of_pcFROM PC JOIN PRODUCT P ON P.MODEL = PC.MODELWHERE P.TYPE = 'PC'GROUP BY P.MAKERHAVING COUNT(P.MODEL) >= 3;--Напишете заявка, която извежда производителите с най-висока цена на
--персонален компютър.SELECT MAKER, MAX(PRICE) AS priceFROM PRODUCT JOIN PC ON PRODUCT.MODEL = PC.MODELGROUP BY MAKERHAVING MAX(PRICE) >= ALL(SELECT PRICEFROM PRODUCT JOIN PC ON PRODUCT.MODEL = PC.MODEL);--Напишете заявка, която извежда средната цена на персоналните компютри за
--всяка честота по-голяма от 800.SELECT SPEED, AVG(PRICE) AS AvgPriceFROM PCGROUP BY SPEEDHAVING SPEED > 800;--------------------------------------------SELECT SPEED, AVG(PRICE) AS AvgPriceFROM PCWHERE SPEED > 800GROUP BY SPEED;--Напишете заявка, която извежда средния размер на диска на тези персонални
--компютри, произведени от производители, които произвеждат и принтери.
--Резултатът да се изведе за всеки отделен производител.SELECT MAKER, CONVERT(DECIMAL (9,2), AVG(HD)) AS AvgHDDFROM PC JOIN PRODUCT P ON P.MODEL = PC.MODELWHERE MAKER IN (SELECT DISTINCT MAKER FROM PRODUCT WHERE TYPE = 'Printer')GROUP BY MAKER;
