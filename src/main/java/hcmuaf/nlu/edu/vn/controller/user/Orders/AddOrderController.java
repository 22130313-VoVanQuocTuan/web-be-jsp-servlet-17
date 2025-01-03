package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.dao.Orders.AddOrderDao;
import hcmuaf.nlu.edu.vn.dao.carts.CartItems;
import hcmuaf.nlu.edu.vn.dao.carts.Carts;
import hcmuaf.nlu.edu.vn.model.Payments;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.CartService;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AddOrder", value = "/confirmOrder")
public class AddOrderController extends HttpServlet {

    private final OrderService orderService;
    private final CartService cartService;

    public AddOrderController() {
        this.orderService = new OrderService();
        this.cartService = new CartService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Carts carts = (Carts) session.getAttribute("cart");
        Users user = (Users) session.getAttribute("user");
        List<CartItems> cartItems = cartService.getCartFromSession(session).listItems();

        try {

           request.setAttribute("cartItem", cartItems);
           request.setAttribute("payment", orderService.getPayment(user.getId()));
           request.setAttribute("infoAddress", orderService.getInfoAddressShipping(user.getId()));

        } catch (RuntimeException | SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("showModal", true); // Thêm thuộc tính hiển thị modal
        request.getRequestDispatcher("user/page/confirmation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}