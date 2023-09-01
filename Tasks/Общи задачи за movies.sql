use movies;

--Напишете заявка, която извежда заглавие и година на всички филми, които са
--по-дълги от 120 минути и са снимани преди 2000 г. Ако дължината на филма е
--неизвестна, заглавието и годината на този филм също да се изведат.

SELECT TITLE, YEAR,LENGTH
FROM MOVIE
WHERE (lENGTH IS NULL OR LENGTH > 120) AND YEAR < 2000;

--Напишете заявка, която извежда име и пол на всички актьори (мъже и жени),
--чието име започва с 'J' и са родени след 1948 година. Резултатът да бъде
--подреден по име в намаляващ ред.SELECT NAME, GENDERFROM MOVIESTARWHERE BIRTHDATE > 1948 AND NAME LIKE 'J%'ORDER BY NAME DESC;--Напишете заявка, която извежда име на студио и брой на актьорите,
--участвали във филми, които са създадени от това студио.SELECT STUDIONAME, COUNT(DISTINCT STARNAME) AS num_actorsFROM MOVIE JOIN STARSIN ON TITLE=MOVIETITLEGROUP BY STUDIONAME;--Напишете заявка, която за всеки актьор извежда име на актьора и броя на
--филмите, в които актьорът е участвал.SELECT STARNAME, COUNT(DISTINCT MOVIETITLE) AS num_moviesFROM STARSINGROUP BY STARNAME;--Напишете заявка, която за всяко студио извежда име на студиото и заглавие
--на филма, излязъл последно на екран за това студио.

SELECT STUDIONAME,TITLE,YEAR
FROM MOVIE
WHERE STUDIONAME = ANY(SELECT STUDIONAME FROM MOVIE GROUP BY STUDIONAME)
AND YEAR=ANY(SELECT MAX(YEAR) FROM MOVIE GROUP BY STUDIONAME)
ORDER BY STUDIONAME DESC;

--Напишете заявка, която извежда името на най-младия актьор (мъж)

SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'M' 
AND BIRTHDATE = ANY(SELECT MAX(BIRTHDATE) FROM MOVIESTAR WHERE GENDER = 'M');
-------------------------------------------
SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'M' 
AND BIRTHDATE >= ALL(SELECT BIRTHDATE FROM MOVIESTAR WHERE GENDER = 'M');

--Напишете заявка, която извежда име на актьор и име на студио за тези
--актьори, участвали в най-много филми на това студио.

SELECT STUDIONAME, STARNAME, COUNT(DISTINCT TITLE) AS num_movies
FROM MOVIE JOIN STARSIN ON MOVIETITLE = TITLE
GROUP BY STARNAME, STUDIONAME
HAVING COUNT(TITLE) >= ALL(SELECT COUNT(TITLE) 
FROM MOVIE JOIN STARSIN ON TITLE=MOVIETITLE
GROUP BY STUDIONAME,STARNAME);

--Напишете заявка, която извежда заглавие и година на филма, и брой на
--актьорите, участвали в този филм за тези филми с повече от двама актьори.SELECT MOVIETITLE, MOVIEYEAR, COUNT(DISTINCT STARNAME) AS num_actorsFROM STARSINGROUP BY MOVIETITLE, MOVIEYEARHAVING COUNT(DISTINCT STARNAME) > 2;------------------------------------------SELECT MOVIETITLE,MOVIEYEAR,COUNT(STARNAME) AS num_actors
 FROM MOVIE JOIN STARSIN ON TITLE=MOVIETITLE
 GROUP BY MOVIETITLE,MOVIEYEAR
 HAVING COUNT(STARNAME)>=ALL(SELECT COUNT(STARNAME)
							 FROM MOVIE JOIN STARSIN ON TITLE=MOVIETITLE
							 GROUP BY STUDIONAME,MOVIEYEAR);

