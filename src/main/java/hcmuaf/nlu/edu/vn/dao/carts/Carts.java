package hcmuaf.nlu.edu.vn.dao.carts;

import hcmuaf.nlu.edu.vn.model.Product;

import java.util.*;

public class Carts {
    private Map<Integer, CartItems> items;
    private double discountAmount; // Lưu giá trị giảm giá từ voucher

    public Carts() {
        this.items = new HashMap<>();
        this.discountAmount = 0; // Ban đầu không có giảm giá
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
    // Tính tổng giá trị giảm giá
    public double getDiscount() {
        return items.values().stream().mapToDouble(CartItems :: getDiscountAmount).sum() + discountAmount;
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

    // Tính tổng thanh toán cuối cùng
    public double getFinalTotalPrice() {
        double totalPrice = getTotalPrice();
        double shippingFee = getTotalPriceShippingFee();
        return Math.max(0, totalPrice - discountAmount + shippingFee); // Đảm bảo không âm
    }

    // Cập nhật số lượng sản phẩm
    public void updateQuantity(int id, int quantity) {
        if (!items.containsKey(id) || quantity < 1) return;
        CartItems item = items.get(id);

        // Lưu lại giá gốc cho mỗi sản phẩm
        double originalPrice = item.getPrice() / item.getQuantity();
        double originalTotalPrice = item.getTotalPrice() / item.getQuantity();
        double originalDiscount = item.getDiscountAmount() / item.getQuantity();

        // Cập nhật số lượng và tính lại các giá trị khác
        item.setQuantity(quantity);
        item.setPrice(originalPrice * quantity);
        item.setTotalPrice(originalTotalPrice * quantity);
        item.setDiscountAmount(originalDiscount * quantity);

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
        item.setQuantity(1);
        item.setPrice(product.getPrice() * item.getQuantity());
        item.setTotalPrice(product.getPrice()-(product.getPrice()*product.getDiscountPercent()) );
        item.setDiscountAmount((product.getPrice()* product.getDiscountPercent()) * item.getQuantity() );
        item.setName(product.getName());
        return item;
    }


    // Cập nhật giảm giá từ voucher
    public void applyVoucher(double voucherValue) {
        this.discountAmount = voucherValue; // Lưu giá trị giảm giá
    }

    // Getter cho giá trị giảm giá
    public double getDiscountAmount() {
        return discountAmount;
    }
}

