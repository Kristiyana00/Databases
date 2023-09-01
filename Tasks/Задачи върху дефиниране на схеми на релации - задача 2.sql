--CREATE DATABASE Facebook

USE Facebook;

--���� �������� ���� ������� �� Facebook. ������ �� ����� ��������
--������� (���� �� ���������� � ���� �������): 

--Users: �������� ����� (id), email, ������, ���� �� �����������.

CREATE TABLE Users(
id INT IDENTITY,
email VARCHAR(50),
password VARCHAR(10),
reg_date DATE
);

--Friends: ������ �� ������ �� �����������, ����. ��� 12 � ������� �� 21, 25 �
--40, �� ��� ������� (12,21), (12,25), (12,40). 

CREATE TABLE Friends(
friend_1 INT,
friend_2 INT
);

--Walls: ����� �� ����������, ����� �� ���������� ������� �����������,
--����� �� �����������, ����.

CREATE TABLE Walls(
user_number INT,
user_number_sender INT,
message VARCHAR(250),
date DATETIME
);

--Groups: �������� �����, ���, �������� (�� ������������ - ������ ���).

CREATE TABLE Groups(
groupid INT IDENTITY,
name VARCHAR(50),
description VARCHAR(250));

--GroupMembers: ������ �� ���� ����� �� ����� - ����� �� ����������.

CREATE TABLE GroupMembers(
group_number INT,
user_number INT
);

--�������� ������� � �������� ����� ��� ��������������� �������.
