package hcmuaf.nlu.edu.vn.controller.admin.promotional;

import hcmuaf.nlu.edu.vn.service.PromotionalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "UpdateStatusPro", value = "/update-status-promotional")
public class UpdateStatusPrController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String status = req.getParameter("status");
            String endDateStr = req.getParameter("endDate");

            LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Ho_Chi_Minh"));

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime endDate = LocalDateTime.parse(endDateStr, formatter);
            if(endDate.isAfter(now)) {
                PromotionalService promotionalService = new PromotionalService();
                boolean isUpdated = promotionalService.updateStatusProm(id, status);

                String jsonResponse = isUpdated
                        ? "{\"success\": true, \"message\": \"Cập nhật trạng thái thành công!\"}"
                        : "{\"success\": false, \"message\": \"Không tìm thấy mã ưu đãi!\"}";

                resp.getWriter().write(jsonResponse); // Gửi phản hồi về AJAX
            } else {
                resp.getWriter().write("{\"success\": false, \"message\": \"Ngày kết thúc phải lớn hơn ngày hiện tại!\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("{\"success\": false, \"message\": \"Lỗi hệ thống!\"}");
        }
    }
}
