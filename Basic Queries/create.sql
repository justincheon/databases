DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;

CREATE TABLE Airlines (
AirlineID CHAR(3) PRIMARY KEY,
AirlineName VARCHAR(30) UNIQUE
);

CREATE TABLE Airports (
AirportID CHAR(3) PRIMARY KEY,
City VARCHAR(30) NOT NULL,
State VARCHAR(30) NOT NULL
);

CREATE TABLE Flights (
AirlineID CHAR(3),
FlightNum INT,
Origin CHAR(3),
Destination CHAR(3),
DepartureTime TIME,
ArrivalTime TIME,
PRIMARY KEY (AirlineID, FlightNum),
UNIQUE (AirlineID, Origin, Destination, DepartureTime)
);

CREATE TABLE Customers (
CustID INT PRIMARY KEY,
CustName VARCHAR(30) NOT NULL,
Status CHAR(1)
);

CREATE TABLE Tickets (
TicketID INT PRIMARY KEY,
CustID INT NOT NULL,
AirlineID CHAR(3),
FlightNum INT,
FlightDate DATE,
SeatNum CHAR(3),
Cost DECIMAL(7,2),
Paid BOOLEAN,
UNIQUE(CustID, AirlineID, FlightNum)
);


