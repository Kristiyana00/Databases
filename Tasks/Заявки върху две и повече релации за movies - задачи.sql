USE movies;

--Напишете заявка, която извежда имената на актьорите мъже, участвали във
--филма The Usual Suspects.SELECT STARNAMEFROM STARSIN JOIN MOVIESTAR ON STARNAME = NAMEWHERE GENDER = 'M' AND MOVIETITLE = 'The Usual Suspects';------------------SELECT NAMEFROM STARSIN JOIN MOVIESTAR ON STARNAME = NAMEWHERE MOVIETITLE = 'The Usual Suspects' AND GENDER = 'M';------------------SELECT NAMEFROM MOVIESTARWHERE GENDER = 'M'INTERSECTSELECT STARNAMEFROM STARSINWHERE MOVIETITLE = 'The Usual Suspects';------------------SELECT STARNAMEFROM STARSIN, MOVIESTARWHERE STARNAME = NAME AND GENDER = 'M' AND MOVIETITLE = 'The Usual Suspects';--Напишете заявка, която извежда имената на актьорите, участвали във филми от
--1995, продуцирани от студио MGM.SELECT STARNAMEFROM STARSIN JOIN MOVIE ON MOVIETITLE = TITLE AND MOVIEYEAR = YEARWHERE MOVIEYEAR = 1995 AND STUDIONAME = 'MGM';--Напишете заявка, която извежда имената на продуцентите, които са
--продуцирали филми на студио MGM.SELECT DISTINCT NAMEFROM MOVIE JOIN MOVIEEXEC ON PRODUCERC# = CERT# WHERE STUDIONAME = 'MGM';------------------SELECT DISTINCT NAMEFROM MOVIE,MOVIEEXECWHERE PRODUCERC# = CERT# AND STUDIONAME = 'MGM';--Напишете заявка, която извежда имената на филми с дължина, по-голяма от
--дължината на филма Star Wars.SELECT M1.TITLEFROM MOVIE AS M1 CROSS JOIN MOVIE AS M2WHERE M2.TITLE = 'Star Wars' AND M1.LENGTH > M2.LENGTH;--Напишете заявка, която извежда имената на продуцентите с нетни активи поголеми от тези на Stephen Spielberg.SELECT M1.NAMEFROM MOVIEEXEC AS M1 CROSS JOIN MOVIEEXEC AS M2WHERE M2.NAME = 'Stephen Spielberg' and M1.NETWORTH > M2.NETWORTH;------------------SELECT M1.NAME
FROM MOVIEEXEC AS M1, MOVIEEXEC AS M2
WHERE M1.NETWORTH > M2.NETWORTH AND M2.NAME = 'Stephen Spielberg';

--Напишете заявка, която извежда имената на всички филми, които са
--продуцирани от продуценти с нетни активи по-големи от тези на Stephen
--Spielberg

SELECT MOVIE.TITLE
FROM MOVIE ,MOVIEEXEC AS M1, MOVIEEXEC AS M2
WHERE MOVIE.PRODUCERC# = M2.CERT# AND M1.NAME = 'Stephen Spielberg' AND M2.NETWORTH > M1.NETWORTH;