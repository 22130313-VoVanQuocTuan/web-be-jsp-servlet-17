package hcmuaf.nlu.edu.vn.model;

import java.util.Date;

public class Import_Export_Stock {
    private int id;
    private String transactionType;
    private Date transactionDate;
    private String username;
    private String note;
    private double totalCost;
    private double price;
    private int quantity;
    private String productName;

    public Import_Export_Stock() {
    }

    public Import_Export_Stock(int id, String transactionType, Date transactionDate, String username, String note, double totalCost, double price, int quantity, String productName) {
        this.id = id;
        this.transactionType = transactionType;
        this.transactionDate = transactionDate;
        this.username = username;
        this.note = note;
        this.totalCost = totalCost;
        this.price = price;
        this.quantity = quantity;
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }
}
