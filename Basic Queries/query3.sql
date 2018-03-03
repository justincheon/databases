SELECT a.AirlineName, f.FlightNum, f.DepartureTime, f.ArrivalTime
FROM Airlines a, Flights f
WHERE f.Origin = 'SFO' AND
		f.Destination = 'JFK' AND
		a.AirlineID = f.AirlineID;
