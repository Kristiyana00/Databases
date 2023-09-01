use pc;

--Напишете заявка, която извежда всички модели лаптопи, за които се
--предлагат както разновидности с 15" екран, така и с 11" екран.

SELECT MODEL, CODE, SCREEN
FROM LAPTOP
WHERE SCREEN = 11 OR SCREEN = 15;

--Да се изведат различните модели компютри, чиято цена е по-ниска от найевтиния лаптоп, произвеждан от същия производител.

SELECT DISTINCT PC.MODEL
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL 
WHERE MAKER IN (SELECT MAKER 
FROM LAPTOP JOIN PRODUCT ON LAPTOP.MODEL = PRODUCT.MODEL
GROUP BY MAKER)
AND PRICE < ANY(SELECT MIN(PRICE) FROM LAPTOP JOIN PRODUCT
ON LAPTOP.MODEL = PRODUCT.MODEL
GROUP BY MAKER);

--Един модел компютри може да се предлага в няколко разновидности с
--различна цена. Да се изведат тези модели компютри, чиято средна цена (на
--различните му разновидности) е по-ниска от най-евтиния лаптоп, произвеждан
--от същия производител.

SELECT DISTINCT PC.MODEL, AVG(PRICE) AS AvgPrice
FROM PC JOIN PRODUCT P1 ON PC.MODEL = P1.MODEL
GROUP BY PC.MODEL, MAKER
HAVING AVG(PRICE) < ANY(SELECT MIN(PRICE)
FROM LAPTOP JOIN PRODUCT P2 ON P2.MODEL=LAPTOP.MODEL
WHERE P1.MAKER=P2.MAKER);

--Напишете заявка, която извежда за всеки компютър код на продукта,
--производител и брой компютри, които имат цена, по-голяма или равна на
--неговата.

SELECT PC.CODE, MAKER, COUNT(PC.CODE) AS num_pc
FROM PC JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL
JOIN PC P2 ON PC.PRICE<=P2.PRICE AND PRODUCT.MODEL=P2.MODEL
GROUP BY PC.CODE, MAKER;

