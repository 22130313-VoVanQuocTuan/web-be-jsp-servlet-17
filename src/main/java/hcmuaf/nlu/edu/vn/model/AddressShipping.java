package hcmuaf.nlu.edu.vn.model;

import java.util.Date;

public class AddressShipping {
    private int id;
    private int userId;
    private String address;
    private String name;
    private String email;
    private String phoneNumber;
    private Date createDate;
    private Date updateDate;

    public AddressShipping() {}

    public AddressShipping(int id, int userId, String address, String name, String email, String phoneNumber, Date createDate, Date updateDate) {
        this.id = id;
        this.userId = userId;
        this.address = address;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
