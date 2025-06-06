package hcmuaf.nlu.edu.vn.controller.admin.order;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.OrderService;
import hcmuaf.nlu.edu.vn.util.logUtil.LogLevel;
import hcmuaf.nlu.edu.vn.util.logUtil.LogUtilDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "DeleteOrderController", value = "/delete-order")
public class DeleteOrderController extends HttpServlet {
    private final OrderService orderService;

    public DeleteOrderController() {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            if (orderService.deleteOrderItem(id) || orderService.getOrderItems(id).isEmpty()) {
                if (orderService.deleteOrder(id)) {
                    LogUtilDao.log(LogLevel.DANGER, user.getUsername(), request.getRemoteAddr(), "đơn hàng có mã:" +id +" chưa xóa", "đã xóa");
                    PrintWriter out = response.getWriter();
                    out.println("{\"message\":\"Xoá thành công\"}");
                    out.flush();
                }else {
                    PrintWriter out = response.getWriter();
                    out.println("{\"error\": true, \"message\":\"Xoá thất bại\"}");
                    out.flush();

            }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
