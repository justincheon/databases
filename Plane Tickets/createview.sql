/* Create a view named CA_NY_Passengers that gives the CustID, AirlineID and FlightNum for each customer
that has a ticket on a flight from an airport that’s in California (CA) to an airport that’s in New York State (NY).
AirlineID and FlightNum identify the flight from CA to NY, and a passenger may have several different flights. */


CREATE VIEW CA_NY_Passengers AS
	SELECT t.CustID, t.AirlineID, t.FlightNum
	FROM Tickets t, Flights f, Customers c
	WHERE t.AirlineID = f.AirlineID AND
		  t.FlightNum = f.FlightNum AND 
		  t.CustID = c.CustID AND
		  f.Origin IN (SELECT AirportID
		  			   FROM Airports
		  			   WHERE State = 'CA') AND
		  f.Destination IN (SELECT AirportID
		  			   		FROM Airports
		  			   		WHERE State = 'NY');