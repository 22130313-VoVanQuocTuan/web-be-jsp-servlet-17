package hcmuaf.nlu.edu.vn.controller.admin.order;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "PendingOrderCountController", value = "/pending-order-count")
public class PendingOrderCountController extends HttpServlet {
    private final OrderService orderService;

    public PendingOrderCountController() {
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra quyền truy cập
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null || (!user.getRole().equals("admin") && !user.getRole().equals("owner"))) {
            response.sendRedirect(request.getContextPath() + "/logout");
            return;
        }

        // Thiết lập phản hồi JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            // Lấy số lượng đơn hàng chưa hoàn thành
            int pendingCount = orderService.getPendingOrderCount();
            response.getWriter().write("{\"pendingCount\": " + pendingCount + "}");
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Lỗi khi lấy số lượng đơn hàng chưa hoàn thành: " + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}