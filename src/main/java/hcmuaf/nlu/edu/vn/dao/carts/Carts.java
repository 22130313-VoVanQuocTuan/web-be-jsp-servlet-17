package hcmuaf.nlu.edu.vn.dao.carts;

import hcmuaf.nlu.edu.vn.model.Product;

import java.util.*;

public class Carts {
    private Map<Integer, CartItems> items;

    public Carts() {
        this.items = new HashMap<>();
    }
    // Thêm sản phẩm vào giỏ hàng
    public void addItem(Product product) {
        if (product == null) {
            return;
        }
        if (items.containsKey(product.getId())) {
            updateQuantity(product.getId(), items.get(product.getId()).getQuantity() + 1);
            return;
        }
        items.put(product.getId(), convert(product));
    }
    // Xóa sản phẩm khỏi giỏ hàng
    public void removeItem(int productId) {
        items.remove(productId);
    }


    // Tính tổng số lượng sản phẩm và tổng giá
    public int getTotalItem() {
        return items.values().stream().mapToInt(CartItems::getQuantity).sum();
    }

    // Tính tổng giá của các sản phẩm trong  giỏ
    public double getTotalPrice() {
        return items.values().stream().mapToDouble(CartItems::getTotalPrice).sum();
    }
    // Tính tổng tiền phí vận chuyển
    public double getTotalPriceShippingFee() {
        double totalPrice = getTotalPrice();
         return totalPrice *  10/100;
    }

    // Cập nhật  số  luợng
    public void updateQuantity(int id, int quantity) {
        if (!items.containsKey(id) || quantity < 1) return;
        CartItems item = items.get(id);
        item.setQuantity(quantity);
        item.setPrice( item.getPrice() * item.getQuantity());
        item.setTotalPrice(item.getTotalPrice() * item.getQuantity());
        item.setDiscountAmount(item.getDiscountAmount() * item.getQuantity());
        items.put(id, item);


    }
    //Lấy ra danh sách sản phẩm trong giỏ
    public List<CartItems> listItems (){
        return new ArrayList<>(items.values());
    }

    //Map product qua cart
    private CartItems convert(Product product) {
        CartItems item = new CartItems();
        item.setId(product.getId());
        item.setImageUrl(product.getImageUrl());
        item.setQuantity(item.getQuantity());
        item.setPrice(product.getPrice() * item.getQuantity());
        item.setTotalPrice(product.getDiscountPrice() * item.getQuantity());
        item.setDiscountAmount((product.getPrice()* product.getDiscountPercent()/100) * item.getQuantity() );
        item.setName(product.getName());
        return item;
    }

}

