public class Main {

    public static void main(String[] args) {
        Database db = new Database();
        db.connect();
        db.getAllProductsInInventory();
        db.close();
        System.out.println("Application closed. Thanks for using House-of-Fire-MarketPlace!");
    }
}