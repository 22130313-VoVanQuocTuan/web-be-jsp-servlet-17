package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteOrderDController", value = "/delete-order-infor")
public class DeleteOrderDController extends HttpServlet {
    private final OrderService orderService = new OrderService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        if (orderId != null) {
            try {
                // Kiểm tra và hủy đơn hàng
                boolean isCanceled = orderService.cancelOrder(Integer.parseInt(orderId));
                if (isCanceled) {
                    //Cập nhật số lượng sản phẩm khi huỷ hoá đơn
                    orderService.restoreCountProduct(Integer.parseInt(orderId));
                    request.setAttribute("message", "Đơn hàng đã được hủy thành công!");
                } else {
                    request.setAttribute("message", "Không thể hủy đơn hàng vì đã quá 2 ngày!");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Lỗi khi hủy đơn hàng!");
            }

            // Sau khi hủy, chỉ lấy lại danh sách đơn hàng của người dùng
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            int id = user.getId();

            try {
                // Lấy danh sách đơn hàng của người dùng và thông tin người dùng
                request.setAttribute("orders", orderService.getOrderById(id)); // Lấy danh sách đơn hàng
                request.setAttribute("info", orderService.getInfoUser(id));
            } catch (SQLException e) {
                e.printStackTrace(); // Log lỗi
            }

            // Quay lại trang thông tin người dùng với danh sách đơn hàng
            request.getRequestDispatcher("users/page/informationCustomer.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}