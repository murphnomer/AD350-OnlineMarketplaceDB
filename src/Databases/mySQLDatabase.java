package Databases;
import java.sql.*;

public class mySQLDatabase {
    private static final String DB_NAME = System.getenv("DB_NAME");
    private static final String USER_NAME = System.getenv("USER_NAME");
    private static final String PASSWORD = System.getenv("PASSWORD");
    private final String connectionUrl = "jdbc:mysql://127.0.0.1:3306/" + DB_NAME;

    private Connection con = null;

    /**
     * Connect to mySQL database.
     * Prerequisite: mySQL ConnectorJ is installed.
     */
    public void connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC driver not found. Add dependency mySQL Connector/J for your operating system.");
            e.printStackTrace();
            return;
        }

        try {
            con = DriverManager.getConnection(connectionUrl, USER_NAME, PASSWORD);
        } catch (SQLException e) {
            System.out.println("Connection failed.");
            System.out.println(e);
        }
    }

    /**
     * Close the connection. If any error occurs the "finally" clause will terminate the connection anyway.
     */
    public void close() {
        try {
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception ignored) {}
            }
        }
    }

    /**
     * Return the connection to this database instance.
     * @return - Connection
     */
    public Connection getConnection() {
        return con;
    }
}
