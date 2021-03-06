ALTER TABLE Tickets
	ADD FOREIGN KEY (CustID)
	REFERENCES Customers(CustID)
	ON UPDATE SET DEFAULT
	ON DELETE SET DEFAULT;

ALTER TABLE Flights
	ADD FOREIGN KEY (AirlineID)
	REFERENCES Airlines(AirlineID)
	ON UPDATE SET DEFAULT
	ON DELETE SET DEFAULT;

ALTER TABLE Tickets
	ADD FOREIGN KEY (AirlineID, FlightNum)
	REFERENCES Flights(AirlineID, FlightNum)
	ON UPDATE SET DEFAULT
	ON DELETE SET DEFAULT;