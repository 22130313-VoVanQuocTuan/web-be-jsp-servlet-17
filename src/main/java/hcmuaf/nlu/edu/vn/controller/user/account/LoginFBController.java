package hcmuaf.nlu.edu.vn.controller.user.account;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginFBController", value = "/loginFB")
public class LoginFBController extends HttpServlet {
    private static final String CLIENT_ID = "9471317702914860"; // Thay bằng App ID của bạn
    private static final String REDIRECT_URI = "http://localhost:8080/tqh/facebook-callback";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // URL đăng nhập Facebook
        String loginUrl = "https://www.facebook.com/v18.0/dialog/oauth"
                + "?client_id=" + CLIENT_ID
                + "&redirect_uri=" + REDIRECT_URI
                + "&scope=email,public_profile";

        // Chuyển hướng đến Facebook
        response.sendRedirect(loginUrl);

    }

}
