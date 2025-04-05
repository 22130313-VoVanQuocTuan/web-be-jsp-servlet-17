package hcmuaf.nlu.edu.vn.controller.admin.account;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "addAccount" , value = "/add-account")
public class AddAccountController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String role = req.getParameter("role");

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");


        UserService userService = new UserService();
        try {
            if(userService.addAccount(username, password, email,role)) {
                Users user = userService.getUser(username);
                userService.verifyEmail(email);
                userService.UpdateStatusOrRoleUser(null, "Đang chờ xử lý", user.getId());
                PrintWriter out = resp.getWriter();
                out.println("{\"message\":\"Thêm tài khoản thành công\"}");
                out.flush();
            } else {
                PrintWriter out = resp.getWriter();
                out.println("{\"emailExit\":\"Email hoặc tài khoản đã tồn tại\"}");
                out.flush();
        }
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
    }
}
