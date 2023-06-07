import java.sql.*;
import java.util.Formatter;

public class Database {
    private static final String DB_NAME = System.getenv("DB_NAME");
    private static final String USER_NAME = System.getenv("USER_NAME");
    private static final String PASSWORD = System.getenv("PASSWORD");
    private final String connectionUrl = "jdbc:mysql://127.0.0.1:3306/" + DB_NAME;

    private Connection con = null;

    /**
     * Print all products to the console.
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
//            con.close();
        } catch (SQLException e) {
            System.out.println("Connection failed.");
            System.out.println(e);
        }
    }

    public void close() {
        try {
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (con != null) {
                try {
                    con.close();
                    System.out.println("Database Connection Terminated");
                } catch (Exception ignored) {}
            }
        }
    }

    public void getAllProductsInInventory() {
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from product where qty_on_hand > 0");
            Formatter fmt = new Formatter();
            fmt.format("%1s %15s %25s %20s %15s %15s\n", "product_id", "name", "type", "price", "qty_on_hand", "description");

            while (rs.next()) {
                fmt.format("%10s %20s %30s %10s %12s %1s\n",
                        rs.getInt(1), // product_id
                        rs.getString(2), // name
                        rs.getString(3), // type
                        rs.getFloat(5), // price
                        rs.getInt(6), // qty_on_hand
                        "       " + rs.getString(4) // description with left padding added
                );
            }
            System.out.println(fmt);
        } catch (SQLException e) {
            System.out.println("Error when attempting to get products in inventory.");
            System.out.println(e);
        }
    }

}
