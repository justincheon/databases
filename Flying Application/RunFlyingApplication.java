import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the FlyingApplication class
 * in a similar manner to the sample RunStoresApplication.java program.
*/


public class RunFlyingApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username
            // and password for your Postgres account in the arguments of the
            // getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps180-db.lt.ucsc.edu/jjcheon",
                                                     "jjcheon",
                                                     "password_not_included");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the FlyingApplication class
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
            FlyingApplication app = new FlyingApplication(connection);

            /* Write one test of the getAirlinesWithManyFlights method with the numberOfFlights
            argument set to 3. */
            List<String> airlines = app.getAirlinesWithManyFlights(3);

            //print every airline name
            for (String airline : airlines)
                System.out.println(airline);

            /*
            *Output of getAirlinesWithManyFlights
            *when the parameter numberOfFlights is 3.

            American Airlines
            Delta Airlines
            Frontier Airlines
            JetBlue Airways
            Southwest Airlines
            Spirit Airlines
            United Airlines
            Virgin America
            */
            
            /*
            Write one test for the raiseAirlineTicketCosts method that raises the cost of flights
            on AirlineID ‘UAL’ by 25. */
            System.out.println("Tickets raised: " + app.raiseAirlineTicketCosts("UAL", 25));

            /*
            Write two tests for the deleteSomeUnpaidTickets method. The first test should have
            deleteCount value 1. The second test should have deleteCount value 2. Your code
            should print the result (total cost of deleted tickets) returned by each test. Note that
            you need to run the tests in this order, running with deleteCount 1 and then with
            deleteCount 2. The order affects your results.*/
            
            System.out.println("Total cost of deleted tickets 1: " + app.deleteSomeUnpaidTickets(1));
            System.out.println("Total cost of deleted tickets 2: " + app.deleteSomeUnpaidTickets(2));
            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
