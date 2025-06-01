package hcmuaf.nlu.edu.vn.controller.user.account;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginFBController", value = "/loginFB")
public class LoginFBController extends HttpServlet {
    String CLIENT_ID = OAuthConfigFB.getClientID();
    String REDIRECT_URI = OAuthConfigFB.getRedirectUri();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // URL đăng nhập Facebook
        String loginUrl = "https://www.facebook.com/v18.0/dialog/oauth"
                + "?client_id=" + CLIENT_ID
                + "&redirect_uri=" + REDIRECT_URI
                + "&scope=email,public_profile";
        System.out.println(">>> Redirect URI từ file config: " + REDIRECT_URI);

        // Chuyển hướng đến Facebook
        response.sendRedirect(loginUrl);

    }
}
