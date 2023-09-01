--CREATE DATABASE Flights

/*�������� ������ �� ����� Flights � ����������� ������� �� ���������, ����
�������� ����������:Airline � ���, ���, �������
Airport � ���, ���, �������, ����
Airplane � ���, ���, ���� �����, ������ �� ������������
Flight � ����� �� �����, ��� �� ��������������, ��� �� ������ �� ��������, ��� ��
������ �� ������, ��� �� ������, ��������������� �� ������, ��� �� ��������
Customer � ���������������� �����, ���, �������, email �����
Agency � ���, �������, ����, ��������� �����
Booking � ���, ��� �� �������, ��� �� ��������������, ����� �� �����,
���������������� ����� �� ������, ���� �� ����������, ���� �� �����, ����,
��������� (����������/ ������������ ����������)*/

use Flights;

CREATE TABLE Airline(
code CHAR(2) PRIMARY KEY,
name VARCHAR(30),
country VARCHAR(30)
);

CREATE TABLE Airport(
code CHAR(3) PRIMARY KEY,
name VARCHAR(50),
country VARCHAR(50), 
city VARCHAR(50)
);

CREATE TABLE Airplane(
code INT PRIMARY KEY,
type VARCHAR(50),
seats INT NOT NULL,
year DATETIME
);

CREATE TABLE Flight(
fNumber CHAR(6) PRIMARY KEY,
codeAirline CHAR(2),
codeDepAirport CHAR(3),
codeArrAirport CHAR(3),
fTime TIME,
fDuration INT NOT NULL,
airplane INT NOT NULL
);

CREATE TABLE Customer(
id INT PRIMARY KEY,
fname VARCHAR(15),
lname VARCHAR(15),
email VARCHAR(50)
);

CREATE TABLE Agency(
name VARCHAR(50) PRIMARY KEY,
country VARCHAR(50),
city VARCHAR(50),
phone INT
);

CREATE TABLE Booking(
code CHAR(6),
agency VARCHAR(50),
codeAirline CHAR(2),
fNumber CHAR(6) PRIMARY KEY,
cust_id INT NOT NULL,
booking_date DATETIME,
flight_date DATETIME,
price INT NOT NULL,
status INT NOT NULL
);

/* �� ��������� ������� ������� ��������� �������� �������
� ����������� �� ���������� ����������, ����: */

/*��� �� �������������� �� ��������� Flight � Booking ������ �� ����������
� ��������� Airline;*/

ALTER TABLE Flight
ADD CONSTRAINT airline_op FOREIGN KEY (codeAirline)
REFERENCES Airline(code);

ALTER TABLE Booking
ADD CONSTRAINT airline_code FOREIGN KEY (codeAirline)
REFERENCES Airline(code);

/*��� �� ������ �� �������� � ��� �� ������ �� ������ �� ��������� Flight
������ �� ���������� � ��������� Airport;*/

ALTER TABLE Flight
ADD CONSTRAINT flight_depAirport FOREIGN KEY (codeDepAirport)
REFERENCES Airport(code);

ALTER TABLE Flight
ADD CONSTRAINT flight_arrAirport FOREIGN KEY (codeArrAirport)
REFERENCES Airport(code);

/*��� �� �������� �� ��������� Flight ������ �� ���������� � ���������
Airplane;*/

ALTER TABLE Flight
ADD CONSTRAINT airplaneCode FOREIGN KEY (airplane)
REFERENCES Airplane(code);

/*��� �� ������� �� ��������� Booking ������ �� ���������� � ���������
Agency;*/

ALTER TABLE Booking
ADD CONSTRAINT fAgency FOREIGN KEY(agency)
REFERENCES Agency(name);

/*����� �� ����� �� ��������� Booking ������ �� ���������� � ���������
Flight;*/

ALTER TABLE Booking
ADD CONSTRAINT flightNum FOREIGN KEY(fNumber)
REFERENCES Flight(fNumber);

/*���������������� ����� �� ������ �� ��������� Booking ������ ��
���������� � ��������� Customer;*/

ALTER TABLE Booking
ADD CONSTRAINT custId FOREIGN KEY (cust_id)
REFERENCES Customer(id);

/*�������� �� �������� �����*/

INSERT INTO Airline
VALUES ('AZ', 'Alitalia', 'Italy'),
	('BA', 'British Airways', 'United Kingdom'),
	('LH', 'Lufthansa', 'Germany'),
	('SR', 'Swissair', 'Switzerland'),
	('FB', 'Bulgaria Air', 'Bulgaria'),
	('SU', 'Aeroflot', 'Russian Federation'),
	('AF', 'Air France', 'France'),
	('TK', 'Turkish Airlines', 'Turkey'),
	('AA', 'American Airlines', 'United States'),
	('OA', 'Olympic Air', 'Greece'),
	('A3', 'Aegean Airlines', 'Greece'),
	('ET', 'Ethiopian Airlines', 'Ethiopia'),
	('U2', 'EasyJet', 'United Kingdom'),
	('DL', 'Delta Air Lines', 'France');

INSERT INTO Airport
VALUES	('SVO', 'Sheremetyevo', 'Russian Federation', 'Moscow'),
	('DME', 'Domodedovo', 'Russian Federation', 'Moscow'),
	('SOF', 'Sofia International', 'Bulgaria', 'Sofia'),
	('BOJ', 'Burgas International', 'Bulgaria', 'Burgas'),
	('CDG', 'Charles De Gaulle', 'France', 'Paris'),
	('ORY', 'Orly', 'France', 'Paris'),
	('LBG', 'Le Bourget', 'France', 'Paris'),
	('JFK', 'John F Kennedy International', 'United States','New York'),
	('ORD', 'Chicago O''Hare International', 'United States', 'Chicago'),
	('IST', 'Ataturk International', 'Turkey', 'Istanbul'),
	('ESB', 'Esenboga International', 'Turkey', 'Ankara'),
	('AHN', 'Athens', 'Greece', 'Athens'),
	('FKB', 'Karlsruhe', 'Germany', 'Karlsruhe'),
	('TXL', 'Tegel', 'Germany', 'Berlin'),
	('BER', 'Berlin Metropolitan Area', 'Germany', 'Berlin'),
	('MUC', 'Franz Josef Strauss', 'Germany', 'Munich'),
	('GVA', 'Geneve-Cointrin', 'Switzerland', 'Geneve'),
	('BRN', 'Belp', 'Switzerland', 'Berne'),
	('FCO', 'Leonardo da Vinci International', 'Italy', 'Rome'),
	('LIN', 'Linate', 'Italy', 'Milan'),
	('LHR', 'London Heathrow', 'United Kingdom', 'London');

INSERT INTO Airplane
VALUES	('319', 'Airbus A319', 150, 2003),
	('320', 'Airbus A320', 280, 2013),
	('321', 'Airbus A321', 150, 2018),
	('100', 'Fokker 100', 80, 2000),
	('738', 'Boeing 737-800', 90, 2020),
	('735', 'Boeing 737-800', 90, 2016);

INSERT INTO Flight VALUES  
('FB1363', 'AZ', 'SOF', 'ORY', '12:45', 100, '738'),  
('FB1364', 'AZ', 'CDG', 'SOF', '10:00', 120, '321'),  
('SU2060', 'AZ', 'LBG', 'SOF', '11:10', 110, '738'),  
('SU2061', 'TK', 'SOF', 'JFK', '13:00', 110, '320'),  
('FB363', 'FB', 'SOF', 'ORD', '15:10', 110, '738'),  
('FB364', 'FB', 'LHR', 'SOF', '21:05', 120, '738');

INSERT INTO Customer (ID, FNAME, LNAME, EMAIL)
VALUES	(1, 'Petar', 'Milenov', 'petter@mail.com'),
	(2, 'Dimitar', 'Petrov', 'petrov@mail.com'),
	(3, 'Ivan', 'Ivanov', 'ivanov@mail.com'),
	(4, 'Petar', 'Slavov', 'slavov@mail.com'),
	(5, 'Bogdan', 'Bobov', 'bobov@mail.com'),
	(6, 'Petar', 'Kirov', 'kirov@mail.com'),
	(7, 'Vladimir', 'Petrov', 'vladov@mail.com');

INSERT INTO Agency
VALUES	('Travel One', 'Bulgaria', 'Sofia', '0783482233'),
	('Travel Two', 'Bulgaria', 'Plovdiv', '02882234'),
	('Travel Tour', 'Bulgaria', 'Sofia', NULL),
	('Aerotravel', 'Bulgaria', 'Varna', '02884233'),
	('Aerofly', 'Bulgaria', 'Sofia', '02882533'),
	('Fly Tour', 'Bulgaria', 'Sofia', '02881233');

INSERT INTO Booking VALUES  
('YN298P', 'Travel One', 'FB', 'FB1363', 1, '2013-11-18', '2013-12-25', 300, 0),  
('YA298P', 'Travel Two', 'FB', 'FB1364', 2, '2013-12-18', '2013-12-25', 300, 1),  
('YB298P', 'Travel Tour', 'FB', 'SU2060', 3, '2014-01-18', '2014-02-25', 400, 0),  
('YC298P', 'Travel One', 'FB', 'SU2061', 4, '2014-11-11', '2014-11-25', 350, 0),  
('YD298P', 'Travel Tour', 'FB', 'FB363', 1, '2013-11-03', '2013-12-20', 250, 1),  
('YE298P', 'Aerotravel', 'FB', 'FB364', 2, '2013-11-07', '2013-12-21', 150, 0);

/*����� �� �������������� �� ��������� Airline �� ���� ��������*/

ALTER TABLE Airline
ADD CONSTRAINT uq_name UNIQUE (name);

/*����� �� �������� �� ��������� Airport �� ���� �������� � ������� �� ����
� ���� �������*/

ALTER TABLE Airport
ADD CONSTRAINT uq_airport_name UNIQUE (name);

/*����� ����� � �������� �� ��������� Airplane �� ������ �� � ��-����� ���
����� �� ����.*/

ALTER TABLE Airplane
ADD CONSTRAINT countSeats CHECK (seats > 0);

/*������ �� ������ �� ��������� Booking ������ �� ���� ���� ��� � ���� ��
������ �� ���������� �� ������.*/

ALTER TABLE Booking
ADD CONSTRAINT checkDate CHECK (flight_date >= booking_date);

/*�������� �� ��������� �� email-� �� ������� �� ��������� Customer.
������� email �����, ������� ��������� @ � �����, ���� ������������ ���
���� ���� �������.*/

ALTER TABLE Customer
ADD CONSTRAINT checkEmail CHECK (email LIKE '%@%.%');

/*����������� �� ������������ �� ��������� Booking ���� �� � 0 ��� 1.*/ALTER TABLE BookingADD CONSTRAINT checkStatus CHECK (status IN ('0','1'));