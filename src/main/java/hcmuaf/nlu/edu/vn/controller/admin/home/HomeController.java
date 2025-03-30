package hcmuaf.nlu.edu.vn.controller.admin.home;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.dao.products.RevenueDAO;
import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.HomeService;
import hcmuaf.nlu.edu.vn.service.OrderService;
import hcmuaf.nlu.edu.vn.service.ProductService;
import hcmuaf.nlu.edu.vn.service.RevenueService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private final HomeService homeService = new HomeService();
    private final OrderService orderService = new OrderService();
    private final RevenueService revenueService = new RevenueService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String showAll = request.getParameter("showAll");
        String id = request.getParameter("id");

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null || (!user.getRole().equals("admin") && !user.getRole().equals("owner"))) {
            response.sendRedirect(request.getContextPath() + "/logout");
            return;
        }
        // Đoạn tạo biểu đồ doanh thu .
        String type = request.getParameter("type"); // "week" hoặc "month"
        List<Map<String, Object>> revenueData = null;
        try {
            if ("week".equals(type)) {
                revenueData = revenueService.getWeeklyRevenue();
            } else if ("month".equals(type)) {
                revenueData = revenueService.getMonthlyRevenue();
            } else if ("year".equals(type)) {
                revenueData = revenueService.getYearlyRevenue();
            }

            if (revenueData != null) {
                String json = new Gson().toJson(revenueData);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                return; // Trả về JSON, không tiếp tục xử lý JSP
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi lấy dữ liệu biểu đồ: " + e.getMessage());
            return;
        }

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