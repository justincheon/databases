SELECT DISTINCT f.AirlineID
FROM Flights f
WHERE f.DepartureTime < time '12:00:00'
ORDER BY f.AirlineID;