package hcmuaf.nlu.edu.vn.dao.carts;


import java.util.Date;

public class CartItems {
    private int id;
    private int cartId;
    private int productId;
    private int quantity;
    private double price;
    private double totalPrice;
    private double discountAmount;
    private String imageUrl;
    private String name;
    private double shippingFee;


    public CartItems() {
    }
    public CartItems(int id, int cartId, int productId, int quantity, double price, double totalPrice,
                     double discountAmount,String imageUrl, String name, double shippingFee) {
        this.id = id;
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.totalPrice = totalPrice;
        this.discountAmount = discountAmount;
        this.imageUrl = imageUrl;
        this.name = name;
        this.shippingFee = shippingFee;

    }

    public CartItems(String nameItem, int quantityForm, double totalPriceForm) {
        this.name = nameItem;
        this.quantity = quantityForm;
        this.totalPrice = totalPriceForm;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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

        if(quantity < 1){
            quantity = 1;
        }
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

    public double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(double discountAmount) {
        this.discountAmount = discountAmount;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(double shippingFee) {
        this.shippingFee = shippingFee;
    }
}
