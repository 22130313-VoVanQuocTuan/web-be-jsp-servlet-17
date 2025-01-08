package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.dao.Orders.AddOrderDao;
import hcmuaf.nlu.edu.vn.dao.carts.CartItems;
import hcmuaf.nlu.edu.vn.dao.carts.Carts;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.AddressShippingService;
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
    private final AddressShippingService addressShippingService;

    public AddOrderController() {
        this.orderService = new OrderService();
        this.cartService = new CartService();
        this.addressShippingService = new AddressShippingService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String pay = request.getParameter("paymentMethod");
            if (pay.equals("cod")) {
                request.setAttribute("showModalCOD", true); // Thêm thuộc tính hiển thị modal
            }
            if (pay.equals("vnpay")) {
                request.setAttribute("showModalVNPAY", true); // Thêm thuộc tính hiển thị modal
            }

            HttpSession session = request.getSession();
            Carts carts = (Carts) session.getAttribute("cart");
            Users user = (Users) session.getAttribute("user");
            List<CartItems> cartItems = carts.listItems();
              try {
                request.setAttribute("cart", carts);
                request.setAttribute("cartItem", cartItems);
                request.setAttribute("infoAddress", addressShippingService.getInfoShippingAddress(user.getId()));

                  // Chuyển tiếp đến ConfirmationController
                  request.getRequestDispatcher("/confirmation?show=true").forward(request, response);
            } catch (RuntimeException e) {
                throw new RuntimeException(e);
            }


        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}