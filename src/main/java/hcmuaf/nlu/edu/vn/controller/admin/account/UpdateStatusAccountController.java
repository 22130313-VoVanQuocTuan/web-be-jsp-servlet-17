package hcmuaf.nlu.edu.vn.controller.admin.account;

import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "updateStatus" , value = "/update_status_role")
public class UpdateStatusAccountController  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ids = req.getParameter("userId");
        String status = req.getParameter("status");
        String role = req.getParameter("role");

        // Kiểm tra id và status trước khi xử lý
        if (ids == null || ids.trim().isEmpty() || status == null || status.trim().isEmpty()) {
            req.setAttribute("error", "ID hoặc trạng thái không hợp lệ.");
            req.getRequestDispatcher("/accounts").forward(req, resp);
            return;
        }

        int id;
        try {
            id = Integer.parseInt(ids); // Chuyển đổi id sang số nguyên
        } catch (NumberFormatException e) {
            req.setAttribute("error", "ID không phải là số hợp lệ.");
            req.getRequestDispatcher("/accounts").forward(req, resp);
            return;
        }

        UserService userService = new UserService();
        try {
            // Gọi phương thức cập nhật trạng thái
            if (userService.UpdateStatusOrRoleUser(role,status, id)) {
                resp.sendRedirect(req.getContextPath() + "/accounts");
            } else {
                req.setAttribute("error", "Cập nhật trạng thái không thành công.");
                req.getRequestDispatcher("/accounts").forward(req, resp);
            }
        } catch (SQLException e) {
            req.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            req.getRequestDispatcher("/accounts").forward(req, resp);
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}