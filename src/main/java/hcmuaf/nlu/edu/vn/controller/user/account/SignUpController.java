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
import java.io.PrintWriter;


@WebServlet(name = "signup-user", value = "/signup-user")
public class SignUpController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");



        try {
            Users users = userService.findUserByEmail(email);
            if (users != null) {
                out.println("{\"error\": true, \"message\":\"Email đã tồn tại.\"}");
                out.flush();
                return;
            }

            if (userService.checkUsername(username)) {
                out.println("{\"error\": true, \"message\":\"Tên tài khoản đã tồn tại.\"}");
                out.flush();
                return;
            }

            // Kiểm tra đăng ký
            boolean registrationSuccess = userService.registerUser(email, username, password);
            if (registrationSuccess) {
                out.println("{\"message\":\"Đăng kí thành công! Vui lòng xác thực email.\"}");
            } else {
                out.println("{\"error\": true, \"message\":\"Có lỗi xảy ra khi đăng kí.\"}");
            }
            out.flush();

        } catch (Exception e) {
            out.println("{\"error\": true, \"message\":\"Có lỗi xảy ra khi đăng kí.\"}");
            out.flush();
        }
    }
}




