import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the Flying database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */
public class FlyingApplication {

    private Connection connection;
    
    /*
     * Constructor
     */
    public FlyingApplication(Connection connection) {
        this.connection = connection;
    }
    
    public Connection getConnection()
    {
        return connection;
    }
    
     /**
     * Takes as argument an integer called numberOfFlights.
     * Returns the AirlineName (not the AirlineID) for each Airline that has 
     * at least numberOfFlights different Flights.
     */

    public List<String> getAirlinesWithManyFlights(int numberOfFlights)
    {
    List<String> result = new ArrayList<String>();
        // your code here
        try{
            //select airline name that has numberOfFlights different flights
            PreparedStatement query = connection.prepareStatement(
                "SELECT a.AirlineName " +
                "FROM Airlines a, Flights f " +
                "WHERE a.AirlineID = f.AirlineID " +
                "GROUP BY AirlineName " +
                "HAVING COUNT(DISTINCT f.FlightNum) >= ? "
                );
            query.setInt(1, numberOfFlights);
            ResultSet rs = query.executeQuery();

            //add airline names to result
            while (rs.next()) {
                result.add(rs.getString("AirlineName"));
            }
        }
        catch (SQLException e) {
            System.out.println("SQLException error");
            e.printStackTrace();
            System.exit(-1);
        }
    
        // end of your code
        return result;
    }
    
    
    /**
     * Takes an AirlineID and an increment as arguments, and raises the cost of all 
     * tickets that have that AirlineID by the amount specified in the increment argument. 
     * Of course, there may be many tickets that have that AirlineID.  If there are no 
     * tickets with that name, raiseAirlineTicketCosts should do nothing. The update  
     * should be performed as a single SQL statement.  raiseAirlineTicketCosts should 
     * return the number of tickets whose cost was incremented.
     */

    public int raiseAirlineTicketCosts(String AirlineID, int increment) {
        // your code here; return 0 appears for now to allow this skeleton to compile
        int result = 0;
        try {
            //update cost of a specific AirlineID in Tickets 
            PreparedStatement query = connection.prepareStatement(
                "UPDATE Tickets " +
                "SET Cost = Cost + ? " +
                "WHERE AirlineID = ? " 
            );
            query.setInt(1, increment);
            query.setString(2, AirlineID);

            //executeUpdate will return number of tickets whose cost was incremented
            result = query.executeUpdate();
        
            return result;
        }
        catch (SQLException e) {
            System.out.println("SQLException error");
            e.printStackTrace();
            System.exit(-1);
        }
        return 0; 
        
        // end of your code
    }
    
    
    /**
     * The deleteSomeUnpaidTickets method takes as integer deleteCount as input and invokes 
     * the deleteUnpaid stored function with that argument. The Lab4 assignment gives details 
     * on which unpaid tickets the stored function deleteUnpaid should delete.
     * The method deleteSomeUnpaidTickets must use a single SQL statement to call the stored
     * function, and must return the integer result of the deleteUnpaid stored function.
     */
    public int deleteSomeUnpaidTickets(int deleteCount)
    {
        int storedFunctionResult = 0;
        // your code here
        try {
            PreparedStatement query = connection.prepareStatement(
                "SELECT * FROM deleteUnpaid(?)"
            );
            query.setInt(1,deleteCount);
            ResultSet rs = query.executeQuery();

            //store the value returned from deleteUnpaid
            if (rs.next())
                storedFunctionResult = rs.getInt(1);
        }
        catch (SQLException e) {
            System.out.println("Error in the database");
            e.printStackTrace();
            System.exit(-1);
        }
        // end of your code
        return storedFunctionResult;
        
    }

};
