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


@WebServlet(name = "verify-email", value = "/verify-email")
public class VerifyEmailController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        UserService userService = new UserService();


        // Kết hợp các mã thành một chuỗi
        String code = request.getParameter("codes");
        String email = request.getParameter("email");
        System.out.println(code);
        System.out.println(email);
        try {
            if (userService.isCode(email, code)) {
                if (userService.verifyEmail(email)) {
                    //xóa thông tin xác thực
                    userService.deleteVerifyCode(email);
                    out.println("{\"message\":\"Xác thực thành công\"}");
                    out.flush();
                }
            } else {
                out.println("{\"error\": true, \"message\":\"Mã code ko hợp lệ\"}");

                out.flush();
            }
        } catch (Exception e) {
            out.println("{\"error\": true, \"message\":\"Xác thực thất bại\"}");
            out.flush();
        }

    }



}




