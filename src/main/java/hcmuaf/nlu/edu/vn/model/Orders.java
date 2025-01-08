package hcmuaf.nlu.edu.vn.model;

import java.sql.Timestamp;
import java.util.Date;

public class Orders {
    private int id;
    private int userid;
    private double totalPrice;
    private double shippingFee;
    private double discountAmount;
    private String status;
    private String paymentMethod;
    private String paymentStatus;
    private String shippingAddress;
    private int quantity;
    private String email;
    private String name;
    private String phoneNumber;
    private String note;
    private Date createdAt;
    private Date updatedAt;

    public Orders() {
    }

    public Orders(int id, int userid, Date createdAt,String shippingAddress, double totalPrice, String paymentMethod, String paymentStatus, String status) {
        this.id = id;
        this.userid = userid;
        this.createdAt = createdAt;
        this.shippingAddress = shippingAddress;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.status = status;

    }


    public Orders(int id, double totalPrice, double shippingFee, double discountAmount, String paymentMethod, String paymentStatus, String shippingAddress, int quantity, String email, String name, String phoneNumber, String note) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.shippingFee = shippingFee;
        this.discountAmount = discountAmount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.shippingAddress = shippingAddress;
        this.quantity = quantity;
        this.email = email;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.note = note;
    }
    public Orders(int userid, double totalPrice, double shippingFee, double discountAmount, String shippingAddress, String paymentMethod, String paymentStatus, String status) {

        this.userid = userid;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.status = status;
        this.shippingFee = shippingFee;
        this.discountAmount = discountAmount;
        this.shippingAddress = shippingAddress;

    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userid;
    }

    public void setUserId(int userId) {
        this.userid = userId;
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

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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




