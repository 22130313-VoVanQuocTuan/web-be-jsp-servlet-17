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
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;

@WebServlet(name = "oauth2callback", value = "/oauth2callback")
public class GoogleAuthCallback extends HttpServlet {
    private static final String CLIENT_ID = "1065240946243-5dpg67030e8psab1tqljsj9gmaqhd97n.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "http://localhost:8080/tqh/oauth2callback";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String code = request.getParameter("code");
        String error = request.getParameter("error");

        // Kiểm tra nếu người dùng nhấn "Hủy"
        if (error != null && error.equals("access_denied")) {
            request.setAttribute("error_login", "Bạn đã từ chối quyền truy cập bằng Google.");
            request.getRequestDispatcher("/users/page/login-signup.jsp").forward(request, response);
            return;
        }

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
// Lấy thông tin người dùng từ Google
        Userinfoplus userInfo = oauth2.userinfo().get().execute();
        UserService userService = new UserService();
        System.out.println("User Email: " + userInfo.getEmail());
        try {
            // Kiểm tra xem email đã có trong database chưa
            Users users = userService.findUserByEmailLogin(userInfo.getEmail());

            if (users == null) {
                //Nếu chưa có, tạo tài khoản mới
                userService.addAccountGGFB(userInfo.getName(), "", userInfo.getEmail(), "user");


            }

            //Lấy lại thông tin người dùng sau khi tạo tài khoản
            users = userService.findUserByEmailLogin(userInfo.getEmail());
            // Kiểm tra xem tài khoản có bị đình chỉ không
            if("Bị đình chỉ".equals(users.getStatus()) || "Đang chờ xử lý".equals(users.getStatus())) {
                request.setAttribute("error_login", "Tài khoản đã bị cấm hoặc đang xử lý");
                request.getRequestDispatcher("/users/page/login-signup.jsp").forward(request, response);
                return;
            }

            //Lưu thông tin vào session
            HttpSession session = request.getSession();
            session.setAttribute("user", users);

            //  Cập nhật trạng thái người dùng thành "Hoạt động"
            userService.UpdateStatusOrRoleUserLoginLogout( "Hoạt động", users.getId());

            // Quay về trang trước đó nếu có
            String redirectUrl = (String) session.getAttribute("redirectUrl");
            if (redirectUrl != null) {
                session.removeAttribute("redirectUrl");
                response.sendRedirect(redirectUrl);
                return;
            }

            //  Điều hướng theo vai trò
            String targetPage = "admin".equals(users.getRole()) || "owner".equals(users.getRole()) ? "/home" : "/home-page";
            response.sendRedirect(request.getContextPath() + targetPage);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}