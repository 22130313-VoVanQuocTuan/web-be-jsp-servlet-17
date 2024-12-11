package hcmuaf.nlu.edu.vn.controller.user.account;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "login", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserService();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            if (userService.login(username, password)) {
                Users user = userService.getUser(username);
                if (user != null && user.getIsEmailVerified() == 1) {
                    //thiết lập session
                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);
                    session.setAttribute("username", user.getUsername()); // Lưu giá trị vào session
                    //Cập  nhật trạng thái
                    userService.UpdateStatusUser("Đang hoạt động",user.getId());
                    resp.sendRedirect(req.getContextPath() + "/home.jsp");
                } else {
                    req.setAttribute("error_login", "Không tìm thấy người dùng");
                    req.getRequestDispatcher("users/page/login-signup.jsp").forward(req, resp);
                }

            } else {
                req.setAttribute("error_login", "Tài khoản hoặc mật khẩu không chính xác");
                req.getRequestDispatcher("users/page/login-signup.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    }
