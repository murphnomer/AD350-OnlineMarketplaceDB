package Views;

import Controllers.mySQLQuery;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Formatter;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * Controller class for the selection menu of the application.
 *
 * @author Jared Scarr
 */
public class Menu {
    private final Scanner scanner = new Scanner(System.in);
    private final int exitStatus = 0;
    private final mySQLQuery controller = new mySQLQuery();

    private final String[] menuItems = {
            "1) Get all Products in inventory",
            "2) Create a new product",
            "3) Update inventory of a specific product",
            "4) Delete a product",
            "5) Get the most popular products within a date range",
            "6) Get the least popular products within a date range",
            "7) Get users who have not made a purchase within a date range",
            "8) Information about this application",
            "9) Help",
            "0) exit"
    };

    /**
     * Constructor for Menu.
     */
    public Menu() {
        controller.initDB();
    }
    /**
     * Print a help message.
     */
    public void help() {

    }

    /**
     * Print information about this application.
     */
    public void about() {
        System.out.println("House-of-Fire-Online-Marketplace");
        System.out.println("---------------------------------\n");
        System.out.println("For Professor Kyle Bastien\n");
        System.out.println("Written by Derrek Do, Mike Murphy, Jared Scarr, and Petar Spasic\n");
        System.out.println("Provided as is with no guarantees. Use at your own risk.\n");
    }

    public void printMainMenu() {
        int selection = -1;
        boolean validInput = false;

        while (!validInput) {
            System.out.println("-----------------------------------------------------------");
            System.out.println("Please select from the following options:");
            for (String menuOption : menuItems) {
                System.out.println(menuOption);
            }
            System.out.println();
            try {
                selection = Integer.parseInt(scanner.nextLine());
                validInput = true;
            } catch (InputMismatchException e) {
                System.out.println("What you entered was not a number.");
            }
        }
        if (selection == exitStatus) {
            controller.closeConnection();
            System.out.println("Thank you for using House-of-Fire-Marketplace! See you again soon!\n");
        } else {
            processSelection(selection);
            System.out.println("\nPress enter to return to the menu");
            scanner.nextLine();
            printMainMenu();
        }
    }

    /**
     * Route the selection to the appropriate function.
     *
     * @param selection - int represents the user's menu selection.
     */
    private void processSelection(int selection) {
        // TODO: replace the below print statements with function calls like other cases
        System.out.println();
        switch (selection) {
            case 1 -> {
                try {
                    ResultSet rs = controller.getProdInInventory();
                    printProductTableResults(rs);
                } catch (SQLException e) {
                    System.out.println("Error processing your request.");
                }
            }
            case 2 -> {
                int rowsAdded = addNewProduct();
                System.out.println(rowsAdded + " added.");
            }
            case 3 -> System.out.println("Update inventory of a specific product");
            case 4 -> System.out.println("Delete a product");
            case 5 -> {
                try {
                    ResultSet rs = controller.mostPopProd();
                    printMostLeastPopResults(rs);
                } catch (SQLException e) {
                    System.out.println("Error processing request");
                }
            }
            case 6 -> {
                try {
                    ResultSet rs = controller.leastPopProd();
                    printMostLeastPopResults(rs);
                } catch (SQLException e) {
                    System.out.println("Error processing request");
                }
            }
            case 7 -> System.out.println("Get users who have not made a purchase within a date range");
            case 8 -> about();
            case 9 -> help();
            default -> System.out.println("No valid selection made.");
        }
    }

    /**
     * Prompt the user for input for a new Product.
     * Attempt to insert the new product into the database.
     * @return - number of rows added
     */
    private int addNewProduct() {
        int rowsAdded = 0;
        boolean validInput = false;
        while (!validInput) {
            try {
                // Get product information
                System.out.print("Product name: ");
                String name = scanner.nextLine();
                System.out.print("Product type: ");
                String type = scanner.nextLine();
                System.out.print("Product price: ");
                float price = Float.parseFloat(scanner.nextLine());
                System.out.print("How many in inventory? ");
                int qty_on_hand = Integer.parseInt(scanner.nextLine());
                System.out.print("Product description: ");
                String desc = scanner.nextLine();
                rowsAdded = controller.insertProduct(name, type, price, qty_on_hand, desc);
                validInput = true;
            } catch (InputMismatchException e) {
                System.out.println("The data you provided was an incorrect type for the field please try again.");
            } catch (SQLException e) {
                System.out.println("Failed to add new product. Please check your inputs and try again.");
            }
        }
        return rowsAdded;
    }

    /**
     * Prints the results of a query to the product table given a result set from a product table query.
     * @param rs - ResultSet from a query to the product table.
     * @throws SQLException - if an error occurs processing the result set.
     */
    private void printProductTableResults(ResultSet rs) throws SQLException {
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
    }

    private void printMostLeastPopResults(ResultSet rs) throws SQLException {
        Formatter fmt = new Formatter();
        fmt.format("%-20s%5s\n", "Name", "Quantity Sold");

        while(rs.next()) {
            fmt.format("%-20s%1s\n",
                    rs.getString(1),
                    rs.getInt(2));
        }
        System.out.println(fmt);
    }
}
