import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

  private static Connection connection;

  private DBUtil() {}

  public static synchronized Connection getConnection() throws DBException {
    if (connection != null) {
      return connection;
    } else {
      try { 
        System.out.println("try a connection!");
		
		// set the db url, username, and password
        String url = "jdbc:mysql://cpsc4620-rlvs2.cobd8enwsupz.us-east-1.rds.amazonaws.com/JDBCtest";
        String username = "dbtester";
        String password = "CPSC4620";


        // get and return connection

        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);
        System.out.println("Got a connection!");
        return connection;
      } catch (SQLException | ClassNotFoundException e) {
        throw new DBException(e);
      }
    }
  }

  public static synchronized void closeConnection() throws DBException {
    if (connection != null) {
      try {
        connection.close();
      } catch (SQLException e) {
        throw new DBException(e);
      } finally {
        connection = null;
      }
    }
  }
}
