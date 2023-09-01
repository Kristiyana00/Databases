--CREATE DATABASE Facebook

USE Facebook;

--Нека създадем мини вариант на Facebook. Искаме да имаме следните
--релации (може да предложите и друг вариант): 

--Users: уникален номер (id), email, парола, дата на регистрация.

CREATE TABLE Users(
id INT IDENTITY,
email VARCHAR(50),
password VARCHAR(10),
reg_date DATE
);

--Friends: двойки от номера на потребители, напр. ако 12 е приятел на 21, 25 и
--40, ще има кортежи (12,21), (12,25), (12,40). 

CREATE TABLE Friends(
friend_1 INT,
friend_2 INT
);

--Walls: номер на потребител, номер на потребител написал съобщението,
--текст на съобщението, дата.

CREATE TABLE Walls(
user_number INT,
user_number_sender INT,
message VARCHAR(250),
date DATETIME
);

--Groups: уникален номер, име, описание (по подразбиране - празен низ).

CREATE TABLE Groups(
groupid INT IDENTITY,
name VARCHAR(50),
description VARCHAR(250));

--GroupMembers: двойки от вида номер на група - номер на потребител.

CREATE TABLE GroupMembers(
group_number INT,
user_number INT
);

--Добавете кортежи с примерни данни към новосъздадените релации.
