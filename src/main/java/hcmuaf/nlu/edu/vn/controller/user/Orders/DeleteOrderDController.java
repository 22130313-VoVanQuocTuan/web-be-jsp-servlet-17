package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "DeleteOrderDController", value = "/delete-order-infor")
public class DeleteOrderDController extends HttpServlet {
    private final OrderService orderService = new OrderService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String orderId = request.getParameter("orderId");
        if (orderId != null) {
            try {
                // Kiểm tra và hủy đơn hàng
                boolean isCanceled = orderService.cancelOrder(Integer.parseInt(orderId));
                if (isCanceled) {
                    PrintWriter out = response.getWriter();
                    out.println("{\"message\":\"Đơn hàng đã được hủy thành công!\"}");
                    out.flush();

                } else {
                    PrintWriter out = response.getWriter();
                    out.println("{\"error\": true, \"message\":\"Không thể hủy đơn hàng vì đã quá 2 ngày!\"}");
                    out.flush();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                PrintWriter out = response.getWriter();
                out.println("{\"error\": true, \"message\":\"Lỗi khi hủy đơn hàng!\"}");
                out.flush();

            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}