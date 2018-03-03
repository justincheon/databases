CREATE OR REPLACE FUNCTION deleteUnpaid (deleteCount integer)
returns integer
language plpgsql
as $$
declare
	
	cust_not_A integer;
	count integer := 0;
	deleted_cost integer := 0;
	total_cost integer := 0;

	/*cursor for cost*/
	cost_cursor CURSOR(custID_not_A int) FOR 
		SELECT t.Cost 
		FROM Customers c, Tickets t 
		WHERE t.CustID = custID_not_A
		AND t.Paid = False
		ORDER BY t.Cost DESC 
		FOR UPDATE; 

	/*cursor for custid*/
	cust_cursor CURSOR FOR 
		SELECT CustID 
		FROM Customers
		WHERE Status <> 'A';
	
BEGIN

OPEN cust_cursor;
LOOP
	FETCH FROM cust_cursor INTO cust_not_A;
	EXIT WHEN NOT FOUND;
	OPEN cost_cursor(cust_not_A);
	LOOP
		FETCH FROM cost_cursor INTO deleted_cost;
		IF count = deleteCount OR NOT FOUND THEN
			count := 0;
			EXIT;
		END IF;
		total_cost := total_cost + deleted_cost;
		count := count + 1;
		DELETE FROM Tickets WHERE CURRENT OF cost_cursor;
	END LOOP;
	CLOSE cost_cursor;
END LOOP;
CLOSE cust_cursor;

RETURN total_cost;
END $$;