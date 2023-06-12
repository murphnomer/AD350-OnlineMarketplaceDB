package Models;

public class Product {
    private int id = -1;
    private String name;
    private String type;
    private float price;
    private int qty_on_hand;
    private String description;

    public Product(String name, String type, float price, int qty_on_hand, String description) {
        this.name = name;
        this.type = type;
        this.price = price;
        this.qty_on_hand = qty_on_hand;
        this.description = description;
    }

    public Product(int id, String name, String type, float price, int qty_on_hand, String description) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.price = price;
        this.qty_on_hand = qty_on_hand;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQty_on_hand() {
        return qty_on_hand;
    }

    public void setQty_on_hand(int qty_on_hand) {
        this.qty_on_hand = qty_on_hand;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Product{" +
                "name='" + name + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
