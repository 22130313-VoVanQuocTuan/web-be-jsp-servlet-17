package hcmuaf.nlu.edu.vn.controller.user.carts;


import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.model.Users;
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
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        ProductService productService = new ProductService();
        //Gọi hàm lấy ra sản phẩm theo id
        Product pid = productService.getProductById(Integer.parseInt(req.getParameter("id")));
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if(user==null){
            resp.getWriter().write("{\"status\":\"unauthenticated\"}");
            return;
        }
        // gọi hàm thêm vào giỏ hàng
        cartService.addToCart(session, pid);
        resp.getWriter().write("{\"status\":\"success\"}");
    }
}
