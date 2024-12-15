package hcmuaf.nlu.edu.vn.model;

import java.util.Date;

public class Orders {
    private int id;
    private int user_id;
    private double totalPrice;
    private double shippingFee;
    private double discountAmount;
    private String status;
    private String paymentMethod;
    private String paymentStatus;
    private String shippingAddress;
    private Date createdAt;
    private Date updatedAt;

    public Orders() {
    }

    public Orders(int id, int user_id, double totalPrice, double shippingFee, double discountAmount, String status, String paymentMethod, String paymentStatus, String shippingAddress, Date createdAt, Date updatedAt) {
        this.id = id;
        this.user_id = user_id;
        this.totalPrice = totalPrice;
        this.shippingFee = shippingFee;
        this.discountAmount = discountAmount;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.shippingAddress = shippingAddress;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public double getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(double shippingFee) {
        this.shippingFee = shippingFee;
    }

    public double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(double discountAmount) {
        this.discountAmount = discountAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
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

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", totalPrice=" + totalPrice +
                ", shippingFee=" + shippingFee +
                ", discountAmount=" + discountAmount +
                ", status='" + status + '\'' +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", paymentStatus='" + paymentStatus + '\'' +
                ", shippingAddress='" + shippingAddress + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}



