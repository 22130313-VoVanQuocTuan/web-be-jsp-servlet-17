package hcmuaf.nlu.edu.vn.dao.carts;

import hcmuaf.nlu.edu.vn.model.Product;

import java.util.*;

public class Carts {
    private int id;
    private int userId;
    private int promotionalId;
    private int totalItem;
    private double totalPrice;
    private double discountAmount;
    private double shippingFee;
    private Date createDate;
    private Date updateDate;
    private Map<Integer, CartItems> items;

    public Carts() {
        this.items = new HashMap<>();
    }
    // Thêm sản phẩm vào giỏ hàng
    public boolean addItem(Product product) {
        if(items.containsKey(product.getId())) {
            return updateQuantity(product.getId(), items.get(product.getId()).getQuantity()+1);
        }
        items.put(product.getId(), convert(product));
        return true;
    }
    // Xóa sản phẩm khỏi giỏ hàng
    public void removeItem(int productId) {
        items.remove(productId);
    }

    // Lấy danh sách các sản phẩm trong giỏ hàng
    public Map<Integer, CartItems> getItems() {
        return items;
    }

    // Tính tổng số lượng sản phẩm và tổng giá
    public int getTotalItem() {
        return items.values().stream().mapToInt(CartItems::getQuantity).sum();
    }

    public double getTotalPrice() {
        return items.values().stream().mapToDouble(CartItems::getTotalPrice).sum();
    }

    public boolean updateQuantity(int id , int quantity) {
        if(items.containsKey(id) || quantity <1 ) return false;
        CartItems item = items.get(id);
        item.setQuantity(item.getQuantity() + quantity );
        items.put(id, item);
        return true;

    }
    public List<CartItems> listItems (){
        return new ArrayList<>(items.values());
    }

    private CartItems convert(Product product) {
        CartItems item = new CartItems();
        item.setId(product.getId());
        item.setImageUrl(product.getImageUrl());
        item.setQuantity(1);
        item.setPrice(product.getPrice());
        item.setTotalPrice(product.getPrice());
        item.setDiscountAmount(product.getDiscountPercent());
        item.setName(product.getName());

        return item;
    }



}

