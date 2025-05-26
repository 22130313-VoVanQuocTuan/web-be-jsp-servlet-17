package hcmuaf.nlu.edu.vn.controller.admin.order;

import hcmuaf.nlu.edu.vn.model.Orders;
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

@WebServlet(name = "UpdateStatusOrderController", value = "/update-status-order")
public class UpdateStatusOrderController extends HttpServlet {
    private final OrderService orderService;

    public UpdateStatusOrderController() {
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
       String statusOrder = request.getParameter("statusSelect");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        try {
            Orders orders= orderService.getItemOrders(id);
            if("Đã giao".equalsIgnoreCase(statusOrder)){
                orderService.updateOrderStatus(id, "Hoàn thành");
                orderService.updateOrderStatusPay(id, "Đã thanh toán");
            }else{
                orderService.updateOrderStatus(id, statusOrder);
            }

            LogUtilDao.log(LogLevel.INFO, user.getUsername(), request.getRemoteAddr(), orders.getStatus(), statusOrder);
                PrintWriter out = response.getWriter();
                out.println("{\"message\":\"Cập nhật thành công\"}");
                out.flush();


        } catch (SQLException e) {
            e.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("{\"error\": true, \"message\":\"Cập nhật thất bại.\"}");
            out.flush();
        }
    }
}