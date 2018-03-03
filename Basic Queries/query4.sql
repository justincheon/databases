SELECT f1.FlightNum as FlightNum1,
	f1.DepartureTime as DepartureTime1, 
	f1.ArrivalTime as ArrivalTime1, 
	f2.Origin as StopOverAirportID, 
	f2.FlightNum as FlightNum2, 
	f2.DepartureTime as DepartureTime2, 
	f2.ArrivalTime as ArrivalTime2
FROM Flights f1, Flights f2
WHERE f1.Origin = 'SFO' AND
	f2.Destination = 'JFK' AND
	f1.Destination = f2.Origin AND
	(f2.DepartureTime - f1.ArrivalTime) >= INTERVAL '30 MINUTES' AND
	(f2.DepartureTime - f1.ArrivalTime) <= INTERVAL '2 HOURS';
