/* CustID 141 violates foreign key referencing Customers */
INSERT INTO Tickets
VALUES (208,141,'VRD',200,'F17',812.74,False); 

/* AirlineID 'ABC' violates foreign key referencing Airlines */
INSERT INTO Flights
VALUES ('ABC',100,'BWI','SFO','00:00:00','02:00:00'); 

/* AirlineID 'XYZ', FlightNum 101 violates foreign key referencing Flights */
INSERT INTO Tickets
VALUES (209,140,'XYZ',101,'F17',812.74,False); 

/* Meets constraint cost_is_positive */
UPDATE Tickets
SET Cost = 100
WHERE CustID = 100;

/* Violates constraint cost_is_positive */
UPDATE Tickets
SET Cost = -1
WHERE CustID = 100;

/* Meets constraint flights_take_time */
UPDATE Flights
SET ArrivalTime = '01:00:00', 
	DepartureTime = '00:00:00'
WHERE FlightNum = 120;

/* Violates constraint flights_take_time */
UPDATE Flights
SET ArrivalTime = '00:00:00', 
	DepartureTime = '00:00:00'
WHERE FlightNum = 120;

/* Meets constraint check_city */
UPDATE Airports
SET State = 'TN',
	City = 'Knoxville'
WHERE AirportID = 'TYS';

/* Violates constraint check_city */
UPDATE Airports
SET State = 'TN',
	City = 'Nashville'
WHERE AirportID = 'TYS';

/* Meets origin_destination_different */
UPDATE Flights
SET Origin = 'BFL',
	Destination = 'BWI'
WHERE FlightNum = 130;

/* Violates origin_destination_different */
UPDATE Flights
SET Origin = 'BFL',
	Destination = 'BFL'
WHERE FlightNum = 130;
