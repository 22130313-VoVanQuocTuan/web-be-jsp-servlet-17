package hcmuaf.nlu.edu.vn.controller.admin.order;

import hcmuaf.nlu.edu.vn.model.OrderItem;
import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetDetailOrderController", value = "/GetDetailOrder")
public class GetDetailOrderController extends HttpServlet {
    private final OrderService orderService;

    public GetDetailOrderController() {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            List<OrderItem> orderItems = orderService.getOrderItems(id);
            Orders orderDetail = orderService.getItemOrders(id);

            request.setAttribute("orIn", orderDetail);
            request.setAttribute("orIt",orderItems);

            request.setAttribute("showModal", true);
            request.getRequestDispatcher("/order-list").forward(request, response);

        } catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}