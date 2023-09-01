CREATE VIEW v_flight
AS
SELECT AIRLINE.NAME, BOOKING.fNumber, COUNT (Booking.cust_id) AS PASSENGERS
FROM AIRLINE JOIN BOOKING ON AIRLINE.CODE = BOOKING.codeAirline
WHERE STATUS=1
GROUP BY AIRLINE.NAME, fNumber;


CREATE VIEW v_agency
AS
SELECT CUSTOMER.fname
FROM CUSTOMER JOIN BOOKING ON ID=cust_id
GROUP BY AGENCY,CUSTOMER.fname
HAVING COUNT(cust_id) >= ALL (SELECT COUNT(cust_id)
FROM Customer JOIN Booking ON ID=cust_id
GROUP BY agency,Customer.fname);


CREATE VIEW v_SF_agencies
AS
SELECT *
FROM Agency
WHERE CITY='Sofia'
WITH CHECK OPTION;


CREATE VIEW v_PH_agencies
AS
SELECT *
FROM Agency
WHERE PHONE IS NULL
WITH CHECK OPTION;


INSERT INTO v_SF_agencies VALUES('T1 Tour', 'Bulgaria', 'Sofia','+359'); 
INSERT INTO v_PH_agencies VALUES('T2 Tour', 'Bulgaria', 'Sofia',null);
INSERT INTO v_SF_agencies VALUES('T3 Tour', 'Bulgaria', 'Varna','+359'); 
INSERT INTO v_PH_agencies VALUES('T4 Tour', 'Bulgaria', 'Varna',null);
INSERT INTO v_PH_agencies VALUES('T4 Tour', 'Bulgaria', 'Sofia','+359'); 