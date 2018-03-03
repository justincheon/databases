SELECT DISTINCT c.CustName
FROM Customers c
WHERE c.CustName LIKE 'W%' AND
	c.custID in (SELECT t.custID
				FROM Tickets t
				WHERE t.AirlineID = 'UAL');
	