package hcmuaf.nlu.edu.vn.controller.user.account;// GoogleCallbackServlet.java
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.oauth2.Oauth2;
import com.google.api.services.oauth2.model.Userinfoplus;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "oauth2callback", value = "/oauth2callback")
public class GoogleAuthCallback extends HttpServlet {
    private static final String CLIENT_ID = "1065240946243-5dpg67030e8psab1tqljsj9gmaqhd97n.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "http://localhost:8080/tqh/oauth2callback";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String code = request.getParameter("code");

        GoogleClientSecrets.Details web = new GoogleClientSecrets.Details();
        web.setClientId(CLIENT_ID);
        web.setClientSecret(CLIENT_SECRET);

        GoogleClientSecrets clientSecrets = new GoogleClientSecrets().setWeb(web);

        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                new NetHttpTransport(),
                JacksonFactory.getDefaultInstance(),
                clientSecrets,
                Arrays.asList("https://www.googleapis.com/auth/userinfo.profile",
                        "https://www.googleapis.com/auth/userinfo.email"))
                .setAccessType("offline")
                .build();

        // Lấy token từ code
        GoogleTokenResponse tokenResponse = flow.newTokenRequest(code)
                .setRedirectUri(REDIRECT_URI)
                .execute();

        String accessToken = tokenResponse.getAccessToken();
        request.getSession().setAttribute("access_token", accessToken);

        // In accessToken để kiểm tra
        System.out.println("Access Token: " + accessToken);

        // Tạo GoogleCredential với accessToken
        GoogleCredential credential = new GoogleCredential().setAccessToken(accessToken);

        // Tạo Oauth2 client với credential
        Oauth2 oauth2 = new Oauth2.Builder(new NetHttpTransport(), JacksonFactory.getDefaultInstance(), credential)
                .setApplicationName("YourAppName")
                .build();

        // Lấy thông tin người dùng
        Userinfoplus userInfo = oauth2.userinfo().get().execute();

        // Tạo đối tượng User để lưu thông tin
        Users user = new Users();
        user.setUsername(userInfo.getName());
        user.setEmail(userInfo.getEmail());

        UserService userService = new UserService();




        // Lưu vào session
        request.getSession().setAttribute("user", user);

        // In thông tin để kiểm tra
        System.out.println("Name: " + userInfo.getName());
        System.out.println("Email: " + userInfo.getEmail());
        System.out.println("ID: " + userInfo.getId());

        response.sendRedirect(request.getContextPath() + "/home-page");
    }
}
