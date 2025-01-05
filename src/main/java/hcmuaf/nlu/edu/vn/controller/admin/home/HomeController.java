package hcmuaf.nlu.edu.vn.controller.admin.home;

import hcmuaf.nlu.edu.vn.service.HomeService;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private final HomeService homeService = new HomeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các dữ liệu từ HomeService
            int totalViews = homeService.totalView();
            int totalUsers = homeService.totalAccount();
            int totalRatings = homeService.totalRating();
            double totalSales = homeService.totalSale();

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