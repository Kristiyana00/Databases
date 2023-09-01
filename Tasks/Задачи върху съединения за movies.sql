use movies;

--�������� ������, ����� ������� ����� �� ���������� � ������� ��
--�������, ����������� �� ���������� �� ����� �Star Wars�.

SELECT TITLE, NAME
FROM MOVIE M JOIN MOVIEEXEC ME
ON M.PRODUCERC# = ME.CERT#
WHERE ME.CERT# IN (SELECT PRODUCERC#
FROM MOVIE
WHERE TITLE = 'Star Wars');

--�������� ������, ����� ������� ������� �� ������������ �� �������, �
--����� � �������� �Harrison Ford�SELECT DISTINCT ME.NAMEFROM MOVIE M JOIN STARSIN S ON M.TITLE = S.MOVIETITLE AND M.YEAR = S.MOVIEYEARJOIN MOVIEEXEC ME ON M.PRODUCERC# = ME.CERT#WHERE STARNAME = 'Harrison Ford';--�������� ������, ����� ������� ����� �� �������� � ������� ��
--���������, ��������� ��� �����, ����������� �� ���� ������, ���������
--�� ��� �� ������.SELECT DISTINCT S.NAME, SI.STARNAMEFROM STUDIO S JOIN MOVIE M ON S.NAME = M.STUDIONAMEJOIN STARSIN SI ON M.TITLE = SI.MOVIETITLE AND M.YEAR = SI.MOVIEYEARORDER BY S.NAME;--�������� ������, ����� ������� ������� �� ���������, ��������� ���
--����� �� ���������� � ���-������ ����� ������.SELECT DISTINCT SI.STARNAME, T.NETWORTH, M.TITLEFROM STARSIN SI JOIN MOVIE M ON SI.MOVIETITLE = M.TITLE ANDSI.MOVIEYEAR = M.YEAR JOIN (SELECT CERT#, NETWORTHFROM MOVIEEXECWHERE NETWORTH >= ALL (SELECT NETWORTH FROM MOVIEEXEC)) TON M.PRODUCERC# = T.CERT#;--�������� ������, ����� ������� ������� �� ���������, ����� �� ��
--��������� � ���� ���� ����.SELECT MS.NAME, SI.MOVIETITLEFROM MOVIESTAR MS LEFT JOIN STARSIN SION MS.NAME = SI.STARNAMEWHERE SI.MOVIETITLE IS NULL;