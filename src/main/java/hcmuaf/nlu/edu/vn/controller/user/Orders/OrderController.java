package hcmuaf.nlu.edu.vn.controller.user.Orders;

import hcmuaf.nlu.edu.vn.model.OrderItem;
import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "informationCustomer", value = "/informationCustomer")
public class OrderController extends HttpServlet {
    private final OrderService orderService;

    public OrderController() {
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
          // Kiểm tra nếu chưa đăng nhập
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/logout");
            return;
        }

        int id = user.getId();
        String role = user.getRole(); // Giả sử có phương thức getRole()

        try {
            request.setAttribute("orders", orderService.getOrderById(id));
            request.setAttribute("info", orderService.getInfoUser(id));
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi truy vấn dữ liệu.");
            return;
        }

        // Xử lý khi có orderId
        String orderId = request.getParameter("orderId");
        if (orderId != null) {
            try {
                int idOrder = Integer.parseInt(orderId);
                request.setAttribute("orderInfo", orderService.getItemOrders(idOrder));
                request.setAttribute("orderItem", orderService.getOrderItems(idOrder));
                request.setAttribute("showModal", true);
            } catch (SQLException | NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("error", "Lỗi lấy thông tin đơn hàng.");
            }
        }

        // Kiểm tra role và điều hướng trang
        String destinationPage = "users/page/informationCustomer.jsp";
        if ("admin".equalsIgnoreCase(role)  || "owner".equalsIgnoreCase(role)) {
            destinationPage = "admin/pages/account.jsp";
        }
        request.getRequestDispatcher(destinationPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
