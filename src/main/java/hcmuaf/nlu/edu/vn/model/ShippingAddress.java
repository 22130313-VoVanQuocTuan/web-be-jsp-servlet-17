package hcmuaf.nlu.edu.vn.model;

public class ShippingAddress {
    private int userId;
    private String address;
    private String name;
    private String email;
    private String phoneNumber;
    private String note;

    public ShippingAddress(String email, String name, String address, String phoneNumber, String note) {
        this.address = address;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.note = note;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
