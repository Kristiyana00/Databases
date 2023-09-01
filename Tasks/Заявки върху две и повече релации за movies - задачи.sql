USE movies;

--�������� ������, ����� ������� ������� �� ��������� ����, ��������� ���
--����� The Usual Suspects.SELECT STARNAMEFROM STARSIN JOIN MOVIESTAR ON STARNAME = NAMEWHERE GENDER = 'M' AND MOVIETITLE = 'The Usual Suspects';------------------SELECT NAMEFROM STARSIN JOIN MOVIESTAR ON STARNAME = NAMEWHERE MOVIETITLE = 'The Usual Suspects' AND GENDER = 'M';------------------SELECT NAMEFROM MOVIESTARWHERE GENDER = 'M'INTERSECTSELECT STARNAMEFROM STARSINWHERE MOVIETITLE = 'The Usual Suspects';------------------SELECT STARNAMEFROM STARSIN, MOVIESTARWHERE STARNAME = NAME AND GENDER = 'M' AND MOVIETITLE = 'The Usual Suspects';--�������� ������, ����� ������� ������� �� ���������, ��������� ��� ����� ��
--1995, ����������� �� ������ MGM.SELECT STARNAMEFROM STARSIN JOIN MOVIE ON MOVIETITLE = TITLE AND MOVIEYEAR = YEARWHERE MOVIEYEAR = 1995 AND STUDIONAME = 'MGM';--�������� ������, ����� ������� ������� �� ������������, ����� ��
--����������� ����� �� ������ MGM.SELECT DISTINCT NAMEFROM MOVIE JOIN MOVIEEXEC ON PRODUCERC# = CERT# WHERE STUDIONAME = 'MGM';------------------SELECT DISTINCT NAMEFROM MOVIE,MOVIEEXECWHERE PRODUCERC# = CERT# AND STUDIONAME = 'MGM';--�������� ������, ����� ������� ������� �� ����� � �������, ��-������ ��
--��������� �� ����� Star Wars.SELECT M1.TITLEFROM MOVIE AS M1 CROSS JOIN MOVIE AS M2WHERE M2.TITLE = 'Star Wars' AND M1.LENGTH > M2.LENGTH;--�������� ������, ����� ������� ������� �� ������������ � ����� ������ �������� �� ���� �� Stephen Spielberg.SELECT M1.NAMEFROM MOVIEEXEC AS M1 CROSS JOIN MOVIEEXEC AS M2WHERE M2.NAME = 'Stephen Spielberg' and M1.NETWORTH > M2.NETWORTH;------------------SELECT M1.NAME
FROM MOVIEEXEC AS M1, MOVIEEXEC AS M2
WHERE M1.NETWORTH > M2.NETWORTH AND M2.NAME = 'Stephen Spielberg';

--�������� ������, ����� ������� ������� �� ������ �����, ����� ��
--����������� �� ���������� � ����� ������ ��-������ �� ���� �� Stephen
--Spielberg

SELECT MOVIE.TITLE
FROM MOVIE ,MOVIEEXEC AS M1, MOVIEEXEC AS M2
WHERE MOVIE.PRODUCERC# = M2.CERT# AND M1.NAME = 'Stephen Spielberg' AND M2.NETWORTH > M1.NETWORTH;