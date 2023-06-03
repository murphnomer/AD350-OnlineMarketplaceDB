import java.sql.*;

public class Database {
    private static final String DB_NAME = System.getenv("DB_NAME");
    private static final String USER_NAME = System.getenv("USER_NAME");
    private static final String PASSWORD = System.getenv("PASSWORD");
    private final String connectionUrl = "jdbc:mysql://127.0.0.1:3306/" + DB_NAME;

    public void getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(connectionUrl, USER_NAME, PASSWORD);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from product limit 10");
            while (rs.next())
                System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3));
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (con != null) {
                try {
                    con.close();
                    System.out.println("Database Connection Terminated");
                } catch (Exception e) {}
            }
        }
    }
}
