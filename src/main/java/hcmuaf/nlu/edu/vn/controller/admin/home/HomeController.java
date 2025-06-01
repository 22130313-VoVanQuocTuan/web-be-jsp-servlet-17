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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private final HomeService homeService = new HomeService();
    private final OrderService orderService = new OrderService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các dữ liệu từ HomeService
            int totalViews = homeService.totalView();
            int totalUsers = homeService.totalAccount();
            int totalRatings = homeService.totalRating();
            double totalSales = homeService.totalSale();
            List<Users> users = homeService.getUser();
            List<Orders> orderNew = homeService.getOrder();

            Map<String, Object> summary = new HashMap<>();
            summary.put("orderNew", orderNew);
            summary.put("users", users);
            summary.put("totalViews", totalViews);
            summary.put("totalUsers", totalUsers);
            summary.put("totalRatings", totalRatings);
            summary.put("totalSales", totalSales);

            String json = new Gson().toJson(summary);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);

        } catch (Exception e) {
            throw new ServletException("Lỗi hiển thị", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}