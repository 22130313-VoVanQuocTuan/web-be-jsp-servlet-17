package hcmuaf.nlu.edu.vn.controller.admin.order;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.OrderItem;
import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GetDetailOrderController", value = "/GetDetailOrder")
public class GetDetailOrderController extends HttpServlet {
    private final OrderService orderService;

    public GetDetailOrderController() {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null || (!user.getRole().equals("admin") && !user.getRole().equals("owner"))) {
            response.sendRedirect(request.getContextPath() + "/logout");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        try {
            List<OrderItem> orderItems = orderService.getOrderItems(id);
            Orders orderDetail = orderService.getItemOrders(id);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            Gson gson = new Gson();
            Map<String, Object> result = new HashMap<>();
            result.put("order", orderDetail);
            result.put("items", orderItems);
            String json = gson.toJson(result);
            response.getWriter().write(json);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}