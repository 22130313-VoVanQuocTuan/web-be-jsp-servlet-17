package hcmuaf.nlu.edu.vn.controller.user.carts;


import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.CartService;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "cart", value = "/add-cart")
public class AddCartController extends HttpServlet {
    private final CartService cartService ;
    public AddCartController() {
        this.cartService = new CartService();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService productService = new ProductService();
        //Gọi hàm lấy ra sản phẩm theo id
        Product pid = productService.getProductById(Integer.parseInt(req.getParameter("id")));
        HttpSession session = req.getSession();
        // gọi hàm thêm vào giỏ hàng
        cartService.addToCart(session, pid);
        resp.sendRedirect(req.getContextPath() + "/home-page");
    }
}
