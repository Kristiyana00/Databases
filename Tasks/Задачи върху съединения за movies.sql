use movies;

--Напишете заявка, която извежда името на продуцента и имената на
--филмите, продуцирани от продуцента на филма ‘Star Wars’.

SELECT TITLE, NAME
FROM MOVIE M JOIN MOVIEEXEC ME
ON M.PRODUCERC# = ME.CERT#
WHERE ME.CERT# IN (SELECT PRODUCERC#
FROM MOVIE
WHERE TITLE = 'Star Wars');

--Напишете заявка, която извежда имената на продуцентите на филмите, в
--които е участвал ‘Harrison Ford’SELECT DISTINCT ME.NAMEFROM MOVIE M JOIN STARSIN S ON M.TITLE = S.MOVIETITLE AND M.YEAR = S.MOVIEYEARJOIN MOVIEEXEC ME ON M.PRODUCERC# = ME.CERT#WHERE STARNAME = 'Harrison Ford';--Напишете заявка, която извежда името на студиото и имената на
--актьорите, участвали във филми, произведени от това студио, подредени
--по име на студио.SELECT DISTINCT S.NAME, SI.STARNAMEFROM STUDIO S JOIN MOVIE M ON S.NAME = M.STUDIONAMEJOIN STARSIN SI ON M.TITLE = SI.MOVIETITLE AND M.YEAR = SI.MOVIEYEARORDER BY S.NAME;--Напишете заявка, която извежда имената на актьорите, участвали във
--филми на продуценти с най-големи нетни активи.SELECT DISTINCT SI.STARNAME, T.NETWORTH, M.TITLEFROM STARSIN SI JOIN MOVIE M ON SI.MOVIETITLE = M.TITLE ANDSI.MOVIEYEAR = M.YEAR JOIN (SELECT CERT#, NETWORTHFROM MOVIEEXECWHERE NETWORTH >= ALL (SELECT NETWORTH FROM MOVIEEXEC)) TON M.PRODUCERC# = T.CERT#;--Напишете заявка, която извежда имената на актьорите, които не са
--участвали в нито един филм.SELECT MS.NAME, SI.MOVIETITLEFROM MOVIESTAR MS LEFT JOIN STARSIN SION MS.NAME = SI.STARNAMEWHERE SI.MOVIETITLE IS NULL;