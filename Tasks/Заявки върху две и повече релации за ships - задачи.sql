USE SHIPS

--Напишете заявка, която извежда името на корабите с водоизместимост над
--50000.SELECT NAMEFROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASSWHERE DISPLACEMENT > 50000;--Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на
--всички кораби, участвали в битката при Guadalcanal.SELECT SHIPS.NAME, DISPLACEMENT, NUMGUNSFROM OUTCOMES JOIN SHIPS ON OUTCOMES.SHIP = SHIPS.NAMEJOIN CLASSES ON CLASSES.CLASS = SHIPS.CLASSWHERE OUTCOMES.BATTLE = 'Guadalcanal';---------------------SELECT NAME, DISPLACEMENT, NUMGUNSFROM SHIPS,CLASSES,OUTCOMESWHERE OUTCOMES.SHIP = SHIPS.NAME AND CLASSES.CLASS = SHIPS.CLASSAND BATTLE = 'Guadalcanal';--Напишете заявка, която извежда имената на тези държави, които имат както
--бойни кораби, така и бойни крайцери.

SELECT DISTINCT C1.COUNTRY
FROM CLASSES C1 JOIN CLASSES C2 ON C1.COUNTRY = C2.COUNTRY
WHERE C1.TYPE = 'bb' AND C2.TYPE = 'bc';
---------------------
SELECT COUNTRY FROM CLASSES WHERE TYPE = 'bb'
INTERSECT
SELECT COUNTRY FROM CLASSES WHERE TYPE = 'bc';

--Напишете заявка, която извежда имената на тези кораби, които са били
--повредени в една битка, но по-късно са участвали в друга битка.

SELECT O1.SHIP
FROM OUTCOMES O1 
JOIN BATTLES B1 ON O1.BATTLE = B1.NAME
JOIN OUTCOMES O2 ON O1.SHIP = O2.SHIP
JOIN BATTLES B2 ON O2.BATTLE = B2.NAME
WHERE B1.DATE < B2.DATE AND O1.RESULT = 'damaged';