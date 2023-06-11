package Controllers;
import Databases.mySQLDatabase;
import Models.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class mySQLQuery {

    private final mySQLDatabase db = new mySQLDatabase();
    private Connection conn;

    /**
     * Constructor.
     * Connect to database.
     * Create a connection.
     */
    public void initDB() {
        db.connect();
        conn = db.getConnection();
    }

    /**
     * Query the product table for all products that have a quantity on hand > 0.
     * Print the results to the console.
     *
     * @return - ResultSet of all products with qty_on_hand > 0.
     */
    public ResultSet getProdInInventory() throws SQLException {
        String query = "select * from product where qty_on_hand > 0";
        PreparedStatement prepStmt = conn.prepareStatement(query);
        return prepStmt.executeQuery();
    }

    /**
     *
     * @param name - String product name.
     * @param type - String product type.
     * @param price - float price of product.
     * @param qty_on_hand - int number of individual units.
     * @param description - description of product.
     * @return - int number of rows added.
     * @throws SQLException - If an error occurs on insert.
     */
    public int insertProduct(String name, String type, float price, int qty_on_hand, String description) throws SQLException {
        Product prod = new Product(name, type, price, qty_on_hand, description);
        String query = "insert into product (name, type, price, qty_on_hand, description) values (?, ?, ?, ?, ?)";
        PreparedStatement prepStmt = conn.prepareStatement(query);
        prepStmt.setString(1, prod.getName());
        prepStmt.setString(2, prod.getType());
        prepStmt.setFloat(3, prod.getPrice());
        prepStmt.setInt(4, prod.getQty_on_hand());
        prepStmt.setString(5, prod.getDescription());
        return prepStmt.executeUpdate();
    }

    /**
     *
     * @param startDate - beginning of date range.
     * @param endDate - end of date range.
     * @param isPop - boolean to check if the query should be for most popular (true) or least (false).
     * @return - ResultSet.
     * @throws SQLException - error processing sql query.
     */
    public ResultSet itemsSold(String startDate, String endDate, boolean isPop) throws SQLException {
        String comparator = isPop ? ">" : "<";
        System.out.println(comparator);
        String query = "select pop.product_Id, pop.name, pop.total, pop.trans_count " +
                "from (" +
                "select totals.product_Id, totals.name, total, trans_count " +
                "from (" +
                "select t.product_Id, prod.name, sum(t.quantity) as total, count(t.product_Id) as trans_count from transaction as t " +
                "inner join product as prod on t.product_Id = prod.product_id " +
                "        where t.purchase_date between '" + startDate + "' and '" + endDate + "' " +
                "group by t.product_Id " +
                ") as totals " +
                ") as pop " +
                "where pop.total " + comparator + " ( " +
                "select avg(range_avg.total) as total_avg " +
                "from ( " +
                "select sum(quantity) total " +
                "from transaction as t " +
                "where t.purchase_date between '" + startDate + "' and '" + endDate + "' " +
                "group by t.product_Id " +
                ") as range_avg " +
                ");";
        PreparedStatement prepStmt = conn.prepareStatement(query);
        return prepStmt.executeQuery();
    }

    /**
     * Close the connection.
     */
    public void closeConnection() {
        db.close();
    }
}
