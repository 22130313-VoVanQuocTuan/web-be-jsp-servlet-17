package hcmuaf.nlu.edu.vn.model;

public class ItemOrder {
    private int id;
    private double totalPrice;
    private double shippingFee;
    private double discountAmount;
    private String paymentMethod;
    private String paymentStatus;
    private String shippingAddress;
    private int productId;
    private String product_name;
    private int quantity;
    private double item_price;
    private String email;
    private String name;
    private String address;
    private String phone;

    public ItemOrder() {}

    public ItemOrder(int id, double totalPrice, double shippingFee, double discountAmount, String paymentMethod, String paymentStatus, String shippingAddress, int productId, String product_name, int quantity, double item_price, String email, String name, String address, String phone) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.shippingFee = shippingFee;
        this.discountAmount = discountAmount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.shippingAddress = shippingAddress;
        this.productId = productId;
        this.product_name = product_name;
        this.quantity = quantity;
        this.item_price = item_price;
        this.email = email;
        this.name = name;
        this.address = address;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getItem_price() {
        return item_price;
    }

    public void setItem_price(double item_price) {
        this.item_price = item_price;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
