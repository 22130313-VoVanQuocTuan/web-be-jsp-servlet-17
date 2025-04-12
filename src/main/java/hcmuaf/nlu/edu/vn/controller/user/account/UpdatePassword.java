package hcmuaf.nlu.edu.vn.controller.user.account;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.awt.image.ImageProducer;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "UpdatePass", value = "/update-pass")
public class UpdatePassword extends HttpServlet {
    private final UserService userService = new UserService(); // Tạo một instance của UserService

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String oldPassword = request.getParameter("pass");
        String newPassword = request.getParameter("passNew");


        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        Map<String, String> message = new HashMap<String, String>();
        if (!user.getEmail().equals(email)) {
               message.put("errorEmail", "Email không tồn tại");

        } else {
            try {
                if (!userService.login(user.getUsername(), oldPassword)) {
                    message.put("errorPass", "Mật khẩu cũ không đúng.");

                } else if (newPassword.length() < 6) {
                    message.put("errorPassNew", "Mật khẩu mới phải có ít nhất 6 ký tự.");

                } else {
                    userService.updateUserPassword(newPassword, email);
                    message.put("message", "Cập nhật mật khẩu thành công!");

                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        String json = new Gson().toJson(message);
        response.getWriter().write(json);
    }
}

