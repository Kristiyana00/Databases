use movies;

--�������� ������, ����� ������� �������� � ������ �� ������ �����, ����� ��
--��-����� �� 120 ������ � �� ������� ����� 2000 �. ��� ��������� �� ����� �
--����������, ���������� � �������� �� ���� ���� ���� �� �� �������.

SELECT TITLE, YEAR,LENGTH
FROM MOVIE
WHERE (lENGTH IS NULL OR LENGTH > 120) AND YEAR < 2000;

--�������� ������, ����� ������� ��� � ��� �� ������ ������� (���� � ����),
--����� ��� ������� � 'J' � �� ������ ���� 1948 ������. ���������� �� ����
--�������� �� ��� � ��������� ���.SELECT NAME, GENDERFROM MOVIESTARWHERE BIRTHDATE > 1948 AND NAME LIKE 'J%'ORDER BY NAME DESC;--�������� ������, ����� ������� ��� �� ������ � ���� �� ���������,
--��������� ��� �����, ����� �� ��������� �� ���� ������.SELECT STUDIONAME, COUNT(DISTINCT STARNAME) AS num_actorsFROM MOVIE JOIN STARSIN ON TITLE=MOVIETITLEGROUP BY STUDIONAME;--�������� ������, ����� �� ����� ������ ������� ��� �� ������� � ���� ��
--�������, � ����� �������� � ��������.SELECT STARNAME, COUNT(DISTINCT MOVIETITLE) AS num_moviesFROM STARSINGROUP BY STARNAME;--�������� ������, ����� �� ����� ������ ������� ��� �� �������� � ��������
--�� �����, ������� �������� �� ����� �� ���� ������.

SELECT STUDIONAME,TITLE,YEAR
FROM MOVIE
WHERE STUDIONAME = ANY(SELECT STUDIONAME FROM MOVIE GROUP BY STUDIONAME)
AND YEAR=ANY(SELECT MAX(YEAR) FROM MOVIE GROUP BY STUDIONAME)
ORDER BY STUDIONAME DESC;

--�������� ������, ����� ������� ����� �� ���-������ ������ (���)

SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'M' 
AND BIRTHDATE = ANY(SELECT MAX(BIRTHDATE) FROM MOVIESTAR WHERE GENDER = 'M');
-------------------------------------------
SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'M' 
AND BIRTHDATE >= ALL(SELECT BIRTHDATE FROM MOVIESTAR WHERE GENDER = 'M');

--�������� ������, ����� ������� ��� �� ������ � ��� �� ������ �� ����
--�������, ��������� � ���-����� ����� �� ���� ������.

SELECT STUDIONAME, STARNAME, COUNT(DISTINCT TITLE) AS num_movies
FROM MOVIE JOIN STARSIN ON MOVIETITLE = TITLE
GROUP BY STARNAME, STUDIONAME
HAVING COUNT(TITLE) >= ALL(SELECT COUNT(TITLE) 
FROM MOVIE JOIN STARSIN ON TITLE=MOVIETITLE
GROUP BY STUDIONAME,STARNAME);

--�������� ������, ����� ������� �������� � ������ �� �����, � ���� ��
--���������, ��������� � ���� ���� �� ���� ����� � ������ �� ����� �������.SELECT MOVIETITLE, MOVIEYEAR, COUNT(DISTINCT STARNAME) AS num_actorsFROM STARSINGROUP BY MOVIETITLE, MOVIEYEARHAVING COUNT(DISTINCT STARNAME) > 2;------------------------------------------SELECT MOVIETITLE,MOVIEYEAR,COUNT(STARNAME) AS num_actors
 FROM MOVIE JOIN STARSIN ON TITLE=MOVIETITLE
 GROUP BY MOVIETITLE,MOVIEYEAR
 HAVING COUNT(STARNAME)>=ALL(SELECT COUNT(STARNAME)
							 FROM MOVIE JOIN STARSIN ON TITLE=MOVIETITLE
							 GROUP BY STUDIONAME,MOVIEYEAR);

