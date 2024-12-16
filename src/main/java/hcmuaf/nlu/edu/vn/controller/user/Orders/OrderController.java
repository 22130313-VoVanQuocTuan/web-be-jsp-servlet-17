package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "informationCustomer", value = "/informationCustomer")
public class OrderController extends HttpServlet {
    private final OrderService orderService;

    public OrderController() {
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("orders", orderService.getAllOrders());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("users/page/informationCustomer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}