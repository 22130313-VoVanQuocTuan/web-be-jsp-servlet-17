package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.model.OrderItem;
import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "informationCustomer", value = "/informationCustomer")
public class OrderController extends HttpServlet {
    private final OrderService orderService;

    public OrderController() {
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String orderId = request.getParameter("orderId");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        int id = user.getId();
        try {
            request.setAttribute("orders", orderService.getOrderById(id));
            request.setAttribute("info", orderService.getInfoUser(id));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (orderId != null) {
            int idOrder = Integer.parseInt(orderId);

            try {
                List<OrderItem> orderItems = orderService.getOrderItems(idOrder);
                Orders orderDetail = orderService.getItemOrders(idOrder);
                request.setAttribute("orderInfo", orderDetail);
                request.setAttribute("orderItem", orderItems);
            } catch (SQLException e) {
                throw new RuntimeException(e); // Log rõ lỗi
            }
            System.out.println("showModal: " + request.getAttribute("showModal"));
            request.setAttribute("showModal", true);
            request.getRequestDispatcher("users/page/informationCustomer.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("users/page/informationCustomer.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
}