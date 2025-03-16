package hcmuaf.nlu.edu.vn.controller.admin.promotional;

import hcmuaf.nlu.edu.vn.service.PromotionalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateStatusPro", value = "/update-status-pro")
public class UpdateStatusPrController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String status = req.getParameter("status");

            PromotionalService promotionalService = new PromotionalService();
            boolean isUpdated = promotionalService.updateStatusProm(id, status);

            String jsonResponse = isUpdated
                    ? "{\"success\": true, \"message\": \"Cập nhật trạng thái thành công!\"}"
                    : "{\"success\": false, \"message\": \"Không tìm thấy mã ưu đãi!\"}";

            resp.getWriter().write(jsonResponse); // Gửi phản hồi về AJAX

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("{\"success\": false, \"message\": \"Lỗi hệ thống!\"}");
        }
    }
}
