SELECT t.FlightNum, t.AirlineID, COUNT(*) as PaidTickets
FROM Tickets t
WHERE Paid = True
GROUP BY t.FlightNum, t.AirlineID;