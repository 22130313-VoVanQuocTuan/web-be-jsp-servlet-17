package hcmuaf.nlu.edu.vn.controller.admin.account;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.SessionManager;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "deleteAccount", value = "/delete-account")
public class DeleteAccountController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        UserService userService = new UserService();
        int id = Integer.parseInt(req.getParameter("userId"));
        System.out.println(id);
        if(userService.softDeleteUser(id)){
            // Hủy session nếu tài khoản bị xóa
            SessionManager.invalidateSession(id);
            PrintWriter out = resp.getWriter();
            out.println("{\"message\":\"Xóa thành công\"}");
            out.flush();
        }else{
            PrintWriter out = resp.getWriter();
            out.println("{\"error\": true, \"message\":\"Xóa thất bại.\"}");
            out.flush();

        }
    }
}
