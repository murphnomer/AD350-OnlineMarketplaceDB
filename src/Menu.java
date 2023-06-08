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
    private final Database db = new Database();

    public Menu() {
        db.connect();
    }

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
     * Print a help message.
     */
    public void help() {

    }

    /**
     * Print information about this application.
     */
    public void about() {
        System.out.println("House-of-Fire-Online-Marketplace");
        System.out.println("---------------------------------");
        System.out.println("For Professor Kyle Bastien");
        System.out.println("Written by Derrek Do, Mike Murphy, Jared Scarr, and Petar Spasic");
        System.out.println();
        System.out.println("Provided as is with no guarantees. Use at your own risk.");
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
            db.close();
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
     * @return - success of the action.
     */
    private void processSelection(int selection) {
        // TODO: replace the below print statements with function calls like case 1
        System.out.println();
        switch (selection) {
            case 1 -> db.getAllProductsInInventory();
            case 2 -> {
                Product prod = getProductFromUser();
                if (prod != null) {
                    db.insertProduct(prod);
                }
            }
            case 3 -> System.out.println("Update inventory of a specific product");
            case 4 -> System.out.println("Delete a product");
            case 5 -> System.out.println("Get the most popular products within a date range");
            case 6 -> System.out.println("Get the least popular products within a date range");
            case 7 -> System.out.println("Get users who have not made a purchase within a date range");
            case 8 -> about();
            case 9 -> help();
            default -> System.out.println("No valid selection made.");
        }
    }

    private Product getProductFromUser() {
        Product prod = null;
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
                prod = new Product(name, type, price, qty_on_hand, desc);
                validInput = true;
            } catch (InputMismatchException e) {
                System.out.println(e);
                System.out.println("The data you provided was an incorrect type for the field please try again.");
            }
        }
        return prod;
    }
}
