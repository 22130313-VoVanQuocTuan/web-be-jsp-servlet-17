package hcmuaf.nlu.edu.vn.model;

import javax.print.attribute.standard.PrinterURI;

public class Inventory {
    private int productId;
    private String productName;
    private int quantity;
    private String status;
    private int minimumQuantity;
    private int maximumQuantity;


    public Inventory() {
    }

    public Inventory(int productId, String productName, int quantity, String status, int minimumQuantity, int maximumQuantity) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.status = status;
        this.minimumQuantity = minimumQuantity;
        this.maximumQuantity = maximumQuantity;
    }
    public Inventory(String productName, int quantity, String status) {
        this.productName = productName;
        this.quantity = quantity;
        this.status = status;
    }

    public int getMaximumQuantity() {
        return maximumQuantity;
    }

    public void setMaximumQuantity(int maximumQuantity) {
        this.maximumQuantity = maximumQuantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getMinimumQuantity() {
        return minimumQuantity;
    }

    public void setMinimumQuantity(int minimumQuantity) {
        this.minimumQuantity = minimumQuantity;
    }
}
