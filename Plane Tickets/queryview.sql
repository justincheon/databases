/* For each customer that’s in CA_NY_Passengers, give that person’s CustID, name and the
number of flights that they have between California airports and New York State airports. In
your result, that last attribute should appear as CA_NY_Total. */

SELECT p.CustID, c.CustName, COUNT(p.FlightNum) as CA_NY_Total
FROM Customers c, CA_NY_Passengers p
WHERE p.CustID = c.CustID
GROUP BY p.CustID, c.CustName;

/* Result of query

 custid |    custname    | ca_ny_total 
--------+----------------+-------------
    114 | Jim Halpert    |           1
    131 | Harvey Spectre |           1
    137 | Drew Powell    |           2
    139 | Sadik Hadzovic |           2
(4 rows)

After running command:
DELETE FROM Tickets WHERE TicketID = 202 or TicketID = 204;

 custid |    custname    | ca_ny_total 
--------+----------------+-------------
    114 | Jim Halpert    |           1
    137 | Drew Powell    |           1
    139 | Sadik Hadzovic |           2
(3 rows)

*/


