/* Indexes are data structures used by the database to improve query performance. Locating all the Tickets on a
particular flight may be slow if we have to search the entire Tickets table. To speed up that search, create an
index named LookUpFlightTickets over the AirlineID and FlightNum columns of the Tickets table. */

CREATE INDEX LookUpFlightTickets ON Tickets(AirlineID, FlightNum);
