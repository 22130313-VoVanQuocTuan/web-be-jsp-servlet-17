package hcmuaf.nlu.edu.vn.controller.user.account;

import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "reset-code", value = "/reset-code")
public class ResetCodeController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        UserService userService = new UserService();
         String email = request.getParameter("email");
        if (email != null) {
            try {
                //Gọi phương thức gửi lại mã code
                userService.sendCode(email);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            out.println("{\"message\":\"Mã xác thực đã được gửi tơí bạn\"}");
            out.flush();
        } else {
            out.println("{\"error\": true, \"message\":\"Có lỗi xảy ra vui lòng thử lại\"}");
            out.flush();
        }

    }
    }

