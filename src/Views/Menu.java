package Views;

import Controllers.mySQLQuery;
import Models.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * Controller class for the selection menu of the application.
 *
 * @author Jared Scarr, Derrek Do, Mike Murphy, and Petar Spasic
 */
public class Menu {
    private final Scanner scanner = new Scanner(System.in);
    private final int exitStatus = 0;
    private final mySQLQuery controller = new mySQLQuery();

    private final String[] menuItems = {
            "1) Get a list of products",
            "2) Create a new product",
            "3) Update on-hand quantity of a specific product",
            "4) Delete a product",
            "5) Get the most popular products within a date range",
            "6) Get the least popular products within a date range",
            "7) Print promotional email list",
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
        System.out.println("The main menu will have a list of numbered options");
        System.out.println("To select an option enter the number next to the description of what you want to accomplish.");
        System.out.println("Your selection must be a number and it must be one of the available menu options.\n");
        System.out.println("---------------------------------\n");
        System.out.println("Further help is available for the specific menu options below.");
        System.out.println("Select one or press any other key to move on.\n");

        for (String menuOption : Arrays.copyOfRange(menuItems, 0, 7)) {
            System.out.println(menuOption);
        }
        String input = scanner.nextLine();
        int intInput = 0;
        try {
            intInput = Integer.parseInt(input);
        } catch (InputMismatchException | NumberFormatException e) {
            System.out.println("What you entered was not a number.");
        }

        switch (intInput) {
            case 1 -> {
                System.out.println(menuItems[intInput - 1]);
                System.out.println("\tDisplays a table of products.");
                System.out.println("\tA second prompt will give the option to see all products or just products\n");
                System.out.println("\tthat are on hand (0 or 1).");
            }
            case 2 -> {
                System.out.println(menuItems[intInput - 1]);
                System.out.println("\tWill prompt you to add each field required to create a new product line by line.");
            }
            case 3 -> {
                System.out.println(menuItems[intInput - 1]);
                System.out.println("\tWill prompt you to update the current inventory of a product.");
                System.out.println("\tThe value will over write what is currently there and not add to it.");
                System.out.println("\tThe id of the product is required to complete this product.");
            }
            case 4 -> {
                System.out.println(menuItems[intInput - 1]);
                System.out.println("\tDelete a product. The id of the product is required.");
            }
            case 5 -> {
                System.out.println(menuItems[intInput - 1]);
                System.out.println("\tYou are prompted for start and end dates that must be in the format Year-Month-Day");
                System.out.println("\t(YYYY-MM-DD) for example 2021-01-01 or 2021-12-25");
                System.out.println("\tThe result is a table of the most popular items in the given date range.");
            }
            case 6 -> {
                System.out.println(menuItems[intInput - 1]);
                System.out.println("\tYou are prompted for start and end dates that must be in the format Year-Month-Day");
                System.out.println("\t(YYYY-MM-DD) for example 2021-01-01 or 2021-12-25");
                System.out.println("\tThe result is a table of the least popular items in the given date range.");
            }
            case 7 -> {
                System.out.println(menuItems[intInput - 1]);
                System.out.println("\tExpects you to enter an integer (1 - 12) representing a month of the year.");
                System.out.println("\tDisplays a list of customers that have not ordered in the selected number of months.");
            }
            default -> System.out.println();
        }
        ;
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

    /**
     * Prints out the main menu.
     */
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
            } catch (InputMismatchException | NumberFormatException e) {
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
        System.out.println();
        try {
            switch (selection) {
                case 1 -> {
                    int minQty = intInput("Enter 0 to list all products or 1 to only list those currently" +
                            " in stock: ");
                    ResultSet rs = controller.getProdInInventory(minQty);
                    printProductTableResults(rs);
                }
                case 2 -> {
                    int rowsAdded = addNewProduct();
                    System.out.println(rowsAdded + " added.");
                }
                case 3 -> {
                    Product product = controller.getProductById(intInput("Enter id of product to update: "));
                    int newQty = intInput("Enter new stock quantity for " + product.getName() + " (Current qty " + product.getQty_on_hand() + "): ");
                    int result = controller.updateStockQuantity(product.getId(), newQty);
                    System.out.println(result > 0 ? "Quantity updated successfully!" : "Product not found!");
                }
                case 4 -> {
                    int idToDelete = intInput("Enter the id of the product to delete: ");
                    int result = controller.deleteProductById(idToDelete);
                    System.out.println(result > 0 ? "The record was successfully deleted." : "The record was not deleted.");
                }
                case 5 -> {
                    ResultSet rs = controller.itemsSold(dateInput(true), dateInput(false), true);
                    printMostLeastPopResults(rs, true);
                }
                case 6 -> {
                    ResultSet rs = controller.itemsSold(dateInput(true), dateInput(false), false);
                    printMostLeastPopResults(rs, false);
                }
                case 7 -> {
                    int numMonths = intInput("Enter number of months since last purchase: ");
                    ResultSet userList = controller.generatePromotionalEmailList(numMonths);
                    printEmailPromotionList(userList);
                }
                case 8 -> about();
                case 9 -> help();
                default -> System.out.println("No valid selection made.");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * Prompt the user for input for a new Product.
     * Attempt to insert the new product into the database.
     *
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
     * Prompt the user for a date input in the provided format.
     *
     * @param start - boolean to tell which date to prompt the user for.
     * @return - user input.
     */
    private String dateInput(boolean start) {
        String dateType = start ? "start" : "end";
        System.out.println("Please enter a " + dateType + " date (YYYY-MM-DD)");
        return scanner.nextLine();
    }

    /**
     * Prompt the user for an integer number of months since last purchase to consider the user for the email
     * promotion list.
     *
     * @return - user input
     */
    private int intInput(String message) {
        System.out.print(message);
        Scanner input = new Scanner(System.in);
        String num = input.nextLine();
        while (!num.matches("^\\d+$")) {
            num = scanner.nextLine();
        }
        return Integer.parseInt(num);

    }

    /**
     * Prints the results of a query to the product table given a result set from a product table query.
     *
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

    /**
     * Print either the most popular or least popular products in a given time range.
     *
     * @param rs    - resultSet.
     * @param isPop - boolean > if isPop us true else <.
     * @throws SQLException - error processing sql statement.
     */
    private void printMostLeastPopResults(ResultSet rs, Boolean isPop) throws SQLException {
        Formatter fmt = new Formatter();
        fmt.format("%-20s%5s\n", "Name", "Quantity Sold");

        if (isPop) {
            System.out.println("\t\tMost Popular Items\n\t\t------------------");
        } else {
            System.out.println("\t\tLeast Popular Items\n\t\t-------------------");
        }

        while (rs.next()) {
            fmt.format("%-20s%1s\n", rs.getString(2), rs.getInt(3));
        }

        System.out.println(fmt);
    }

    /**
     * Prints out a list of users that haven't purchased anything in a while.
     *
     * @param rs - resultSet containing the stale users
     * @throws SQLException
     */
    private void printEmailPromotionList(ResultSet rs) throws SQLException {
        ResultSet pl;
        Formatter fmt = new Formatter();
        fmt.format("%-20s%-20s%-40s%-15s%-20s\n", "First Name", "Last Name", "Email Address", "Last Purchase", "Favorite Products");
        System.out.println("Promotional Email List");
        while (rs.next()) {
            pl = controller.getCommonPurchasesForUser(rs.getInt(1));
            pl.next();
            fmt.format("%-20s%-20s%-40s%-15tF%-20s\n", rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), pl.getString(2));
            while (pl.next()) {
                fmt.format("%-95s%-20s\n", "", pl.getString(2));
            }
        }

        System.out.println(fmt);
    }
}
