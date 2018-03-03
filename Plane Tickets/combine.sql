UPDATE Tickets
SET SeatNum = n.SeatNum,
	Paid = False
FROM NewTickets n
WHERE Tickets.TicketID = n.TicketID AND
	  Tickets.CustID = n.CustID AND
	  Tickets.AirlineID = n.AirlineID AND
	  Tickets.FlightNum = n.FlightNum;

INSERT INTO Tickets
SELECT n.TicketID,n.CustID,n.AirlineID,n.FlightNum,n.SeatNum,NULL,False
FROM NewTickets n
WHERE n.TicketID NOT IN (SELECT Tickets.TicketID FROM Tickets);


