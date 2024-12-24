package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.model.ItemOrder;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "OrderView", value = "/OrderView")
public class OrderViewController extends HttpServlet {
    private final OrderService orderService;

    public OrderViewController() {
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        try {
            List<ItemOrder> orderItem = orderService.getItemOrders(id);
            request.setAttribute("orderInfo", orderItem);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("users/page/informationCustomer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}