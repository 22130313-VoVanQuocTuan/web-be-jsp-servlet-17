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
        int id;
        String statusOrder = request.getParameter("statusOrder");
        String statusPayment = request.getParameter("statusPayment");

        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID đơn hàng không hợp lệ.");
            request.getRequestDispatcher("/order-list").forward(request, response);
            return;
        }

        try {
            boolean isOrderUpdated = orderService.updateOrderStatus(id, statusOrder);
            boolean isPaymentUpdated = orderService.updateOrderPaymentStatus(id, statusPayment);


            if (isOrderUpdated && isPaymentUpdated) {
                request.setAttribute("successStatus", "Cập nhật trạng thái đơn hàng và thanh toán thành công!");
            } else if (isOrderUpdated) {
                request.setAttribute("successStatus", "Cập nhật trạng thái đơn hàng thành công!");
            } else if (isPaymentUpdated) {
                request.setAttribute("successStatus", "Cập nhật trạng thái thanh toán thành công!");
            } else {
                request.setAttribute("error", "Cập nhật không thành công!");
            }
            request.getRequestDispatcher("/order-list").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi khi cập nhật đơn hàng.");
            request.getRequestDispatcher("/order-list").forward(request, response);
        }
    }
}