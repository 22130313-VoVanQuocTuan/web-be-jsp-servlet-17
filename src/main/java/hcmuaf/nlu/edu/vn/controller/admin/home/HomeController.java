package hcmuaf.nlu.edu.vn.controller.admin.home;

import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.HomeService;
import hcmuaf.nlu.edu.vn.service.OrderService;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private final HomeService homeService = new HomeService();
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String showAll = request.getParameter("showAll");
        String id = request.getParameter("id");

        try {

            // Lấy các dữ liệu từ HomeService
            int totalViews = homeService.totalView();
            int totalUsers = homeService.totalAccount();
            int totalRatings = homeService.totalRating();
            double totalSales = homeService.totalSale();
            List<Users> users = homeService.getUser();
            List<Orders> orderNew = homeService.getOrder();

            if (search != null) {
                try {
                    int userId = Integer.parseInt(id);
                    orderNew = orderService.getOrderById(userId);
                } catch (NumberFormatException e) {
                    e.printStackTrace();

                }
            }

            // Hiển thị tất cả dữ liệu theo yêu cầu
            if (showAll != null) {
                if (showAll.equals("orders")) {
                    request.setAttribute("viewOrder", orderNew);// Hiển thị tất cả đơn hàng
                    users = users.stream().limit(10).collect(Collectors.toList());
                    request.setAttribute("users", users);
                }
                if (showAll.equals("users")) {
                    request.setAttribute("users", users);// Hiển thị tất cả người dùng
                    orderNew = orderNew.stream().limit(10).collect(Collectors.toList());
                    request.setAttribute("viewOrder", orderNew);
                }
            } else {
                // Mặc định hiển thị tối đa 10 mục
                orderNew = orderNew.stream().limit(10).collect(Collectors.toList());
                request.setAttribute("viewOrder", orderNew);
                users = users.stream().limit(10).collect(Collectors.toList());
                request.setAttribute("users", users);
            }
            // Đặt các giá trị vào request để chuyển đến JSP
            request.setAttribute("totalViews", totalViews);
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalRatings", totalRatings);
            request.setAttribute("totalSales", totalSales);

            // Forward dữ liệu đến trang JSP để hiển thị
            request.getRequestDispatcher("/admin/pages/index.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Lỗi hiển thị", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}