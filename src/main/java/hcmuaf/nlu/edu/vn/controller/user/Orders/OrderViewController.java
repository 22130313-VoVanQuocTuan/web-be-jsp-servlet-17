package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.model.OrderDetail;
import hcmuaf.nlu.edu.vn.model.OrderItem;
import hcmuaf.nlu.edu.vn.model.Orders;
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
            List<OrderItem> orderItems = orderService.getOrderItems(id);
            OrderDetail orderDetail = orderService.getItemOrders(id);

            request.setAttribute("orderInfo", orderDetail);
            request.setAttribute("orderItem",orderItems);


            HttpSession session = request.getSession();
            session.setAttribute("showModal", true);
            request.getRequestDispatcher("/informationCustomer").forward(request, response);

        } catch (SQLException e) {

            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}