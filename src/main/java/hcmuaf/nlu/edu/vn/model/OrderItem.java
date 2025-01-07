package hcmuaf.nlu.edu.vn.model;

import java.sql.Timestamp;
import java.util.Date;

public class OrderItem {
    private int id;
    private int orderId;
    private int productId;
    private String productName;
    private int quantity;
    private double price;
    private double totalPrice;
    private double discount;
    private Date createdAt;
    private Date updatedAt;

    public OrderItem() {}

    public OrderItem(int id, int orderId, int productId, int quantity, double price, double totalPrice, double discount, Date createdAt, Date updatedAt) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.totalPrice = totalPrice;
        this.discount = discount;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    public OrderItem(String productName, int quantity, double price, double discount, double totalPrice) {
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
        this.totalPrice = totalPrice;
    }
    // Constructor
    public OrderItem(int orderId, int productId, int quantity, double price, double totalPrice, double discount) {
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.totalPrice = totalPrice;
        this.discount = discount;
    }
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}
