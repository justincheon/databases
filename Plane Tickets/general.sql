ALTER TABLE Tickets
ADD CONSTRAINT cost_is_positive
	CHECK (Cost > 0);

ALTER TABLE Flights
ADD CONSTRAINT flights_take_time
	CHECK (ArrivalTime > DepartureTime);

ALTER TABLE Airports
ADD CONSTRAINT check_city
	CHECK (NOT(State = 'TN') OR (City = 'Knoxville')); /* (p->q) is equivalent to (not(p) or q) */

ALTER TABLE Flights
ADD CONSTRAINT origin_destination_different
	CHECK (Origin <> Destination);
