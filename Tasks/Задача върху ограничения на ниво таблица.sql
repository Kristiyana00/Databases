--CREATE DATABASE Flights

/*Създайте базата от данни Flights и дефинирайте схемата на релациите, като
следвате диаграмата:Airline – код, име, държава
Airport – код, име, държава, град
Airplane – код, тип, брой места, година на производство
Flight – номер на полет, код на авиокомпанията, код на летище на излитане, код на
летище на кацане, час на полета, продължителност на полета, код на самолета
Customer – идентификационен номер, име, фамилия, email адрес
Agency – име, държава, град, телефонен номер
Booking – код, име на агенция, код на авиокомпанията, номер на полет,
идентификационен номер на клиент, дата на резервация, дата на полет, цена,
състояние (потвърдена/ непотвърдена резервация)*/

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

/* За отделните релации задайте подходящи първични ключове
и ограничения за референтна цялостност, напр: */

/*код на авиокомпанията от релациите Flight и Booking трябва да съществува
в релацията Airline;*/

ALTER TABLE Flight
ADD CONSTRAINT airline_op FOREIGN KEY (codeAirline)
REFERENCES Airline(code);

ALTER TABLE Booking
ADD CONSTRAINT airline_code FOREIGN KEY (codeAirline)
REFERENCES Airline(code);

/*код на летище на излитане и код на летище на кацане от релацията Flight
трябва да съществува в релацията Airport;*/

ALTER TABLE Flight
ADD CONSTRAINT flight_depAirport FOREIGN KEY (codeDepAirport)
REFERENCES Airport(code);

ALTER TABLE Flight
ADD CONSTRAINT flight_arrAirport FOREIGN KEY (codeArrAirport)
REFERENCES Airport(code);

/*код на самолета от релацията Flight трябва да съществува в релацията
Airplane;*/

ALTER TABLE Flight
ADD CONSTRAINT airplaneCode FOREIGN KEY (airplane)
REFERENCES Airplane(code);

/*име на агенция от релацията Booking трябва да съществува в релацията
Agency;*/

ALTER TABLE Booking
ADD CONSTRAINT fAgency FOREIGN KEY(agency)
REFERENCES Agency(name);

/*номер на полет от релацията Booking трябва да съществува в релацията
Flight;*/

ALTER TABLE Booking
ADD CONSTRAINT flightNum FOREIGN KEY(fNumber)
REFERENCES Flight(fNumber);

/*идентификационен номер на клиент от релацията Booking трябва да
съществува в релацията Customer;*/

ALTER TABLE Booking
ADD CONSTRAINT custId FOREIGN KEY (cust_id)
REFERENCES Customer(id);

/*Добавяне на примерни данни*/

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

/*името на авиокомпанията от релацията Airline да бъде уникално*/

ALTER TABLE Airline
ADD CONSTRAINT uq_name UNIQUE (name);

/*името на летището от релацията Airport да бъде уникално в рамките на една
и съща държава*/

ALTER TABLE Airport
ADD CONSTRAINT uq_airport_name UNIQUE (name);

/*броят места в самолета от релацията Airplane не трябва да е по-малък или
равен на нула.*/

ALTER TABLE Airplane
ADD CONSTRAINT countSeats CHECK (seats > 0);

/*датата на полета от релацията Booking трябва да бъде след или в деня на
датата на резервация на билета.*/

ALTER TABLE Booking
ADD CONSTRAINT checkDate CHECK (flight_date >= booking_date);

/*проверка за валидност на email-а на клиента от релацията Customer.
Валиден email адрес, съдържа символите @ и точка, като задължително има
поне шест символа.*/

ALTER TABLE Customer
ADD CONSTRAINT checkEmail CHECK (email LIKE '%@%.%');

/*състоянието на резервацията от релацията Booking може да е 0 или 1.*/ALTER TABLE BookingADD CONSTRAINT checkStatus CHECK (status IN ('0','1'));