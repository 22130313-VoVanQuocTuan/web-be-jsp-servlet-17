package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.dao.carts.CartItems;
import hcmuaf.nlu.edu.vn.dao.carts.Carts;
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
    private final OrderService orderService;
    public ConfirmationController() {
        this.cartService = new CartService();
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra modal được kích hoạt
        String pay = request.getParameter("paymentMethod");
        System.out.println("pay parameter: " + pay);  // Kiểm tra giá trị của "pay"
        HttpSession session = request.getSession();
        AddressShippingService as = new AddressShippingService();

        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        // Xử lý giỏ hàng
        List<CartItems> ci = cartService.getCartFromSession(session).listItems();
        if (ci == null || ci.isEmpty()) {
            request.setAttribute("message", "Giỏ hàng của bạn hiện tại không có sản phẩm nào.");
            request.getRequestDispatcher("/cart-items").forward(request, response);
            return;
        }
        ShippingAddress shippingAddress = as.getInfoShippingAddress(user.getId());
        request.setAttribute("shipping_address", shippingAddress);
        request.setAttribute("itemCart", ci);
        // Chuyển đến trang JSP
        if(pay != null) {
            if (pay.equals("cod")) {
                request.setAttribute("showModalCOD", true); // Thêm thuộc tính hiển thị modal
            }
            if (pay.equals("vnpay")) {
                request.setAttribute("showModalVNPAY", true); // Thêm thuộc tính hiển thị modal
            }
        }
        request.getRequestDispatcher("users/page/confirmation.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request, response);
    }
}