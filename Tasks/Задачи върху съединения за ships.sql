use ships;

--Напишете заявка, която извежда цялата налична информация за всеки
--кораб, включително и данните за неговия клас. В резултата не трябва да
--се включват тези класове, които нямат кораби.

SELECT *
FROM SHIPS S RIGHT JOIN CLASSES C ON S.CLASS = C.CLASS
WHERE S.NAME IS NOT NULL;

--Повторете горната заявка, като този път включите в резултата и
--класовете, които нямат кораби, но съществуват кораби със същото име
--като тяхното.

SELECT * 
FROM SHIPS S RIGHT JOIN CLASSES C ON S.CLASS = C.CLASS
WHERE S.NAME IS NOT NULL
UNION
SELECT *
FROM SHIPS S RIGHT JOIN CLASSES C ON S.CLASS = C.CLASS
WHERE S.NAME IS NULL AND C.CLASS IN (SELECT NAME FROM SHIPS);

--За всяка страна изведете имената на корабите, които никога не са
--участвали в битка.SELECT DISTINCT C.COUNTRY, S.NAMEFROM CLASSES C JOIN SHIPS S ON C.CLASS = S.CLASSLEFT JOIN OUTCOMES O ON S.NAME = O.SHIPWHERE O.SHIP IS NULL ORDER BY C.COUNTRY;--Намерете имената на всички кораби с поне 7 оръдия, пуснати на вода
--през 1916, но наречете резултатната колона Ship Name.SELECT DISTINCT NAME AS ShipNameFROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASSWHERE LAUNCHED = 1916 AND NUMGUNS >= 7;--Изведете имената на всички потънали в битка кораби, името и дата на
--провеждане на битките, в които те са потънали. Подредете резултата по
--име на битката.

SELECT SHIP, BATTLE, DATE
FROM OUTCOMES JOIN BATTLES ON BATTLE = NAME
WHERE RESULT = 'Sunk'
ORDER BY BATTLE;

--Намерете името, водоизместимостта и годината на пускане на вода на
--всички кораби, които имат същото име като техния клас.

SELECT NAME, DISPLACEMENT, LAUNCHED
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE SHIPS.NAME = CLASSES.CLASS
ORDER BY NAME;

--Намерете всички класове кораби, от които няма пуснат на вода нито един
--кораб.

SELECT CLASSES.CLASS, TYPE, COUNTRY, NUMGUNS, BORE, DISPLACEMENT
FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE LAUNCHED IS NULL;

--Изведете името, водоизместимостта и броя оръдия на корабите,
--участвали в битката ‘North Atlantic’, а също и резултата от битката.

SELECT NAME, DISPLACEMENT, NUMGUNS, RESULT
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS JOIN
OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE BATTLE = 'North Atlantic';
