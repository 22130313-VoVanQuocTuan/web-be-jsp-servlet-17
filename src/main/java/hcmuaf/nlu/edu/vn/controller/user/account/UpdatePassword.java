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

@WebServlet(name = "UpdatePass", value = "/update-pass")
public class UpdatePassword extends HttpServlet {
    private final UserService userService = new UserService(); // Tạo một instance của UserService

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String oldPassword = request.getParameter("pass");
        String newPassword = request.getParameter("passNew");

        if (email == null || email.isEmpty()) {
            request.setAttribute("errorEmail", "Vui lòng nhập email.");
            request.getRequestDispatcher("/informationCustomer").forward(request, response);
            return;
        }
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");


        if (user == null) {
            request.setAttribute("errorEmail", "Email không tồn tại.");
            request.getRequestDispatcher("/informationCustomer").forward(request, response);
        } else {
            try {
                if (!userService.login(user.getUsername(), oldPassword)) {
                    request.setAttribute("errorPass", "Mật khẩu cũ không đúng.");
                    request.getRequestDispatcher("/informationCustomer").forward(request, response);
                } else if (newPassword.length() < 6) {
                    request.setAttribute("errorPassNew", "Mật khẩu mới phải có ít nhất 6 ký tự.");
                    request.getRequestDispatcher("/informationCustomer").forward(request, response);
                } else {
                    userService.updateUserPassword(newPassword, email);
                    request.setAttribute("success", "Cập nhật mật khẩu thành công!");
                    request.getRequestDispatcher("/informationCustomer").forward(request, response);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}

