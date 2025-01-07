package hcmuaf.nlu.edu.vn.controller.admin.order;

import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
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

        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        try {
            if(orderService.updateOrderStatus(id, status)) {
                response.sendRedirect(request.getContextPath() +"/order-list");
            } else {
                request.setAttribute("error", "Cập nhật không thành công!");
                request.getRequestDispatcher("/order-list").forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}