package Controllers;
import Databases.mySQLDatabase;
import Models.Product;

import java.sql.ResultSet;
import java.sql.SQLException;


public class mySQLQuery {

    private final mySQLDatabase db = new mySQLDatabase();
    public void initDB() {
        db.connect();
    }

    public ResultSet getProdInInventory() throws SQLException {
        return db.getAllProductsInInventory();
    }

    public int insertProduct(String name, String type, float price, int qty_on_hand, String description) throws SQLException {
        Product prod = new Product(name, type, price, qty_on_hand, description);
        return db.insertProduct(prod);
    }

    public void closeConnection() {
        db.close();
    }
}
