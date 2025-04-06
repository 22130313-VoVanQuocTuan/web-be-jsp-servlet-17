package hcmuaf.nlu.edu.vn.controller.admin.promotional;

import hcmuaf.nlu.edu.vn.model.Promotionals;
import hcmuaf.nlu.edu.vn.service.PromotionalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "UpdatePromotional", value = "/update-promotional")
public class UpdatePromotionalController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PromotionalService promotionalService = new PromotionalService();
        int id = Integer.parseInt(req.getParameter("id"));
        double value = Double.parseDouble(req.getParameter("value"));
        String startDateStr = req.getParameter("startDate"); // Ex: "2024-12-25T14:00"
        String endDateStr = req.getParameter("endDate");     // Ex: "2024-12-30T18:30"


        // Sửa lại để dùng "T" như trong chuỗi datetime-local và sử dụng đúng format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime startDate = LocalDateTime.parse(startDateStr, formatter);
        LocalDateTime endDate = LocalDateTime.parse(endDateStr, formatter);

        // Convert thành Timestamp nếu cần
        Timestamp startTimestamp = Timestamp.valueOf(startDate);
        Timestamp endTimestamp = Timestamp.valueOf(endDate);

        if(promotionalService.updatePromotional(id,value, startTimestamp, endTimestamp)){
            // Chuyển hướng đến trang danh sách
            PrintWriter out = resp.getWriter();
            out.println("{\"message\": \"Cập nhật thành công.\"}");
            out.flush();
        }else{
            PrintWriter out = resp.getWriter();
            out.println("{\"error\": true, \"message\":\"Cập nhật thất bại.\"}");
            out.flush();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
