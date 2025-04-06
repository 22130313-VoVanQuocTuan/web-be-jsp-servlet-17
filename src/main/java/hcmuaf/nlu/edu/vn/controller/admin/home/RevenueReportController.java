package hcmuaf.nlu.edu.vn.controller.admin.home;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.service.RevenueService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/revenue-report")
public class RevenueReportController extends HttpServlet {

    private final RevenueService revenueService = new RevenueService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type"); // week | month | year

        List<Map<String, Object>> revenueData = null;
        try {
            switch (type) {
                case "week":
                    revenueData = revenueService.getWeeklyRevenue();
                    break;
                case "month":
                    revenueData = revenueService.getMonthlyRevenue();
                    break;
                case "year":
                    revenueData = revenueService.getYearlyRevenue();
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tham số 'type' không hợp lệ");
                    return;
            }

            String json = new Gson().toJson(revenueData);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi lấy dữ liệu biểu đồ: " + e.getMessage());
        }
    }
}