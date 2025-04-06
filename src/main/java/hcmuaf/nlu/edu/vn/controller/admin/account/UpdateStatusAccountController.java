package hcmuaf.nlu.edu.vn.controller.admin.account;

import hcmuaf.nlu.edu.vn.service.SessionManager;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "updateStatus" , value = "/update-status-role-account")
public class UpdateStatusAccountController  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("application/json");
       resp.setCharacterEncoding("UTF-8");
        String ids = req.getParameter("userId");
        String status = req.getParameter("status");
        String role = req.getParameter("role");
        int id = Integer.parseInt(ids);

        UserService userService = new UserService();
        try {
            // Gọi phương thức cập nhật trạng thái
            if (userService.UpdateStatusOrRoleUser(role,status, id)) {
                // Hủy session của người bị hạ quyền
                SessionManager.invalidateSession(id);
                PrintWriter out = resp.getWriter();
                out.println("{\"message\":\"Cập nhật thành công\"}");
                out.flush();
            } else {
                PrintWriter out = resp.getWriter();
                out.println("{\"message\":\"Cập nhật không thành công\"}");
                out.flush();
            }
        } catch (SQLException e) {
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