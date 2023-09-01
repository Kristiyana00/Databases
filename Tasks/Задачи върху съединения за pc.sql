use pc;

--Напишете заявка, която извежда производител, модел и тип на продукт
--за тези производители, за които съответният продукт не се продава
--(няма го в таблиците PC, Laptop или Printer).

SELECT MAKER, PRODUCT.MODEL, PRODUCT.TYPE
FROM PRODUCT LEFT JOIN PC ON PRODUCT.MODEL = PC.MODEL LEFT JOIN
LAPTOP ON PRODUCT.MODEL = LAPTOP.MODEL LEFT JOIN
PRINTER ON PRODUCT.MODEL = PRINTER.MODEL
WHERE PC.PRICE IS NULL AND LAPTOP.PRICE IS NULL AND PRINTER.PRICE IS NULL;

--------------------------------------------

SELECT P.*
FROM PRODUCT P LEFT JOIN PC ON P.MODEL = PC.MODEL
WHERE P.TYPE = 'PC' AND CODE IS NULL
UNION
SELECT P.*
FROM PRODUCT P LEFT JOIN LAPTOP ON P.MODEL = LAPTOP.MODEL
WHERE P.TYPE = 'Laptop' AND CODE IS NULL
UNION
SELECT P.*
FROM PRODUCT P LEFT JOIN PRINTER ON P.MODEL = PRINTER.MODEL
WHERE P.TYPE = 'Printer' AND CODE IS NULL;

--Намерете всички производители, които правят както лаптопи, така и
--принтери.

SELECT DISTINCT P.MAKER
FROM PRODUCT P JOIN PRODUCT P2 ON P.MAKER = P2.MAKER
WHERE P.TYPE = 'Laptop' AND P2.TYPE = 'Printer';

--Намерете размерите на тези твърди дискове, които се появяват в два
--или повече модела лаптопи.

SELECT DISTINCT L.HD
FROM LAPTOP L JOIN LAPTOP L2 ON L.MODEL > L2.MODEL AND L.HD = L2.HD
ORDER BY 1;

--Намерете всички модели персонални компютри, които нямат регистриран
--производител.

SELECT *
FROM PC LEFT JOIN PRODUCT P ON PC.MODEL = P.MODEL
WHERE P.MODEL IS NULL;