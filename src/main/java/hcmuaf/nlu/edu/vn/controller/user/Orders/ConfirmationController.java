package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.dao.carts.CartItems;
import hcmuaf.nlu.edu.vn.model.ShippingAddress;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.AddressShippingService;
import hcmuaf.nlu.edu.vn.service.OrderService;
import hcmuaf.nlu.edu.vn.service.CartService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ConfirmationController", value = "/confirmation")
public class ConfirmationController extends HttpServlet {
    private final CartService cartService;

    public ConfirmationController() {
        this.cartService = new CartService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        List<CartItems> ci = cartService.getCartFromSession(session).listItems();
        if (ci == null || ci.isEmpty()) {
            // Lưu thông báo vào session hoặc request để hiển thị trên trang
            request.setAttribute("message", "Giỏ hàng của bạn hiện tại không có sản phẩm nào.");
            // Chuyển hướng về trang chủ
            request.getRequestDispatcher("/cart-items").forward(request, response);
            return;
        }

        AddressShippingService as = new AddressShippingService();
        ShippingAddress shippingAddress =  as.getInfoShippingAddress(user.getId());
        request.setAttribute("shippingAddress", shippingAddress);
        request.setAttribute("itemCart", ci);

        request.getRequestDispatcher("users/page/confirmation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request, response);
    }
}