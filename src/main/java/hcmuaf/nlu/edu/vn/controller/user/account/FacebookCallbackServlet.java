package hcmuaf.nlu.edu.vn.controller.user.account;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

@WebServlet(name = "FacebookCallbackServlet", value = "/facebook-callback")
public class FacebookCallbackServlet extends HttpServlet {
    private static final String CLIENT_ID = "9471317702914860";
    private static final String CLIENT_SECRET = "acdfd5e2262c69b80f9ff52f879a3558";
    String REDIRECT_URI = OAuthConfigFB.getRedirectUri();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect("login");
            return;
        }
        System.out.println("Callback URL: " + request.getRequestURL() + "?" + request.getQueryString());
        System.out.println("Redirect URI: [" + REDIRECT_URI + "] (length=" + REDIRECT_URI.length() + ")");

        String expected = "https://8424-2402-800-63b7-a928-cd56-8096-309-f756.ngrok-free.app/tqh/facebook-callback";
        System.out.println("Matches expected? " + REDIRECT_URI.equals(expected));

        // Lấy Access Token từ Facebook
        String accessToken = getAccessToken(code);
        if (accessToken == null) {
            response.sendRedirect("login");
            return;
        }
        System.out.println("Code: " + code);
        System.out.println("Access Token: " + accessToken);


        // Lấy thông tin người dùng từ Facebook
        JSONObject userJson = getUserInfo(accessToken);
        if (userJson == null) {
            response.sendRedirect("login");
            return;
        }
        // Lưu thông tin vào session
        storeUserInfoInSession(request, userJson);

        // Chuyển hướng đến trang home-page
        response.sendRedirect("home-page");
    }

    // Lấy Access Token từ Facebook API.
    private String getAccessToken(String code) throws IOException {
        String tokenUrl = "https://graph.facebook.com/v18.0/oauth/access_token" + "?client_id=" + CLIENT_ID + "&redirect_uri=" + REDIRECT_URI + "&client_secret=" + CLIENT_SECRET + "&code=" + code;

        String response = sendHttpRequest(tokenUrl, null);
        if (response == null) return null;

        JSONObject jsonResponse = new JSONObject(response);
        return jsonResponse.optString("access_token", null);



    }

    //     Lấy thông tin người dùng từ Facebook API.
    private JSONObject getUserInfo(String accessToken) throws IOException {
        String userInfoUrl = "https://graph.facebook.com/me?fields=id,name,email,picture";
        String response = sendHttpRequest(userInfoUrl, accessToken);

        return response != null ? new JSONObject(response) : null;
    }


    //     Lưu thông tin người dùng vào session.
    private void storeUserInfoInSession(HttpServletRequest request, JSONObject userJson) {
        String name = userJson.optString("name", "Unknown User");
        String email = userJson.optString("email", null);

        // Nếu email không có, tạo email tạm
        if (email == null) {
            email = "no-email-" + userJson.optString("id", "unknown") + "@facebook.com";
        }

        UserService userService = new UserService();
        try {
            userService.addAccountGGFB(name, "", email, "user");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        Users user = userService.getUserByEmail(email);
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        System.out.println("User JSON: " + userJson.toString());
        System.out.println("User Email: " + email);
        System.out.println("User Name: " + name);
        System.out.println("User from DB: " + user); // Check if it's null
        System.out.println(">>> Redirect URI từ file config: " + REDIRECT_URI);


    }

    //     Gửi HTTP Request đến API.
    private String sendHttpRequest(String urlString, String accessToken) throws IOException {
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");

        // Nếu có access token, thêm vào header
        if (accessToken != null) {
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
        }

        int responseCode = conn.getResponseCode();
        if (responseCode != 200) {
            return null;
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();

        return response.toString();
    }
}
