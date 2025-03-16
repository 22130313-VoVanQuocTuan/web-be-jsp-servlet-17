package hcmuaf.nlu.edu.vn.controller.admin.order;

import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "GetOrderItemController", value = "/order-list")
public class GetOrderController extends HttpServlet {
    private final OrderService orderService;

    public GetOrderController() {
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            List<Orders> ordersList = orderService.getAllOrders();

            request.setAttribute("orderList", ordersList);
            request.getRequestDispatcher("admin/pages/order.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}