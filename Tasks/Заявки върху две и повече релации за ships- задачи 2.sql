use ships;

--Напишете заявка, която извежда страните, чиито кораби са с най-голям
--брой оръдия.

SELECT DISTINCT COUNTRY
FROM CLASSES
WHERE NUMGUNS >= ALL (SELECT NUMGUNS FROM CLASSES);

--Напишете заявка, която извежда класовете, за които поне един от
--корабите е потънал в битка.

SELECT DISTINCT CLASS
FROM SHIPS
WHERE NAME = ANY (SELECT SHIP 
FROM OUTCOMES
WHERE RESULT = 'sunk');

--Напишете заявка, която извежда името и класа на корабите с 16 инчови
--оръдия.

SELECT DISTINCT NAME, CLASS
FROM SHIPS
WHERE CLASS IN (SELECT CLASS
FROM CLASSES
WHERE BORE = 16);

--Напишете заявка, която извежда имената на битките, в които са
--участвали кораби от клас ‘Kongo’.

SELECT DISTINCT BATTLE
FROM OUTCOMES
WHERE SHIP IN (SELECT NAME
FROM SHIPS
WHERE CLASS = 'Kongo');

--Напишете заявка, която извежда класа и името на корабите, чиито брой
--оръдия е по-голям или равен на този на корабите със същия калибър
--оръдия.

SELECT C1.CLASS, NAME
FROM CLASSES C1, SHIPS S
WHERE NUMGUNS >= ALL (SELECT NUMGUNS FROM CLASSES
WHERE BORE = C1.BORE)
AND S.CLASS = C1.CLASS
ORDER BY C1.CLASS;
