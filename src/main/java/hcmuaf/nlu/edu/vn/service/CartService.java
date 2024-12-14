package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.carts.Carts;
import hcmuaf.nlu.edu.vn.model.Product;
import jakarta.servlet.http.HttpSession;

public class CartService {
    // Thêm sản phẩm vào giỏ hàng
    public void addToCart(HttpSession session, Product product) {
        Carts cart = getCartFromSession(session);
        if (cart == null) {
            cart = new Carts();
            session.setAttribute("cart", cart);
        }
        cart.addItem(product);
    }

    // Lấy giỏ hàng từ session
    public Carts getCartFromSession(HttpSession session) {
        // Kiểm tra session trước khi lấy giỏ hàng
        if (session == null) {
            return null;
        }
        return (Carts) session.getAttribute("cart");
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public void removeFromCart(HttpSession session, int productId) {
        Carts cart = getCartFromSession(session);
        if (cart != null) {
            cart.removeItem(productId);
        }
    }
}

