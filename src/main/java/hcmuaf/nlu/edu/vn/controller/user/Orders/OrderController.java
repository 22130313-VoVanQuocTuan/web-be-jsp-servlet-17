package hcmuaf.nlu.edu.vn.controller.user.Orders;

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

@WebServlet(name = "informationCustomer", value = "/informationCustomer")
public class OrderController extends HttpServlet {
    private final OrderService orderService;

    public OrderController() {
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        int id = user.getId();
        String orderId = request.getParameter("orderId");

        try {
            if (orderId != null) {
                // Trường hợp gọi chi tiết đơn hàng
                int idOrder = Integer.parseInt(orderId);
                Map<String, Object> dataOrder = new HashMap<>();
                dataOrder.put("orderInfo", orderService.getItemOrders(idOrder));
                dataOrder.put("orderItem", orderService.getOrderItems(idOrder));

                String json = new Gson().toJson(dataOrder);
                response.getWriter().write(json);
            } else {
                // Trường hợp lấy danh sách đơn hàng
                Map<String, Object> data = new HashMap<>();
                data.put("orders", orderService.getOrderById(id));
                data.put("info", orderService.getInfoUser(id));

                String json = new Gson().toJson(data);
                response.getWriter().write(json);
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi xử lý dữ liệu.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
