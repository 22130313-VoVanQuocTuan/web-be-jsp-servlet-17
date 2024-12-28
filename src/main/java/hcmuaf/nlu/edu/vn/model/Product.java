package hcmuaf.nlu.edu.vn.model;

import java.sql.Timestamp;

public class Product {
    private int id;
    private String name;
    private double price;
    private int quantity;
    private String imageUrl;
    private String description;
    private int categoryId;
    private String status;
    private String supplier;
    private String color;
    private String size;
    private String unit;
    private int view;
    private int soldCount;
    private double discountPercent;
    private double discountPrice;
    private Timestamp createDate;
    private Timestamp updateDate;

    public Product() {
    }

    public Product(int id, String name, double price, int quantity, String imageUrl, String description, int categoryId, String status, String supplier, String color, String size, String unit, int view, int soldCount, double discountPercent,double discountPrice, Timestamp createDate, Timestamp updateDate) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
        this.description = description;
        this.categoryId = categoryId;
        this.status = status;
        this.supplier = supplier;
        this.color = color;
        this.size = size;
        this.unit = unit;
        this.view = view;
        this.soldCount = soldCount;
        this.discountPercent = discountPercent;
        this.discountPrice = discountPrice;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public Product(int id,String name, double price, int quantity, String imageUrl, String description, int categoryId, String status, String supplier, String color, String size, String unit, double discountPercent,double discountPrice) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.imageUrl = imageUrl;
        this.description = description;
        this.categoryId = categoryId;
        this.status = status;
        this.supplier = supplier;
        this.color = color;
        this.size = size;
        this.unit = unit;
        this.discountPercent = discountPercent;
        this.discountPrice = discountPrice;

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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public int getSoldCount() {
        return soldCount;
    }

    public void setSoldCount(int soldCount) {
        this.soldCount = soldCount;
    }
    public double getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(double discountPercent) {
        this.discountPercent = discountPercent;
    }
    public double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }
}
