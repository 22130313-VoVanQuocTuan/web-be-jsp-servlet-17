package hcmuaf.nlu.edu.vn.controller.user.account;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.PasswordReset;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.EmailUtilService;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;

@WebServlet(name = "reset-password", value = "/reset-password")
public class ResetPasswordController extends HttpServlet {
    private final UserService userService = new UserService();
    private final EmailUtilService emailUtil = new EmailUtilService();
    private final Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        try {
            switch (action) {
                case "request":
                    sendEmailResetPass(req, resp);
                    break;
                case "reset":
                    resetPass(req, resp);
                    break;
                default:
                    writeResponse(resp, false, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            writeResponse(resp, false, "Có lỗi xảy ra, vui lòng thử lại.");
        }
    }

    private void sendEmailResetPass(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String email = req.getParameter("email").trim();
        Users user = userService.findUserByEmail(email);
        HttpSession session = req.getSession();
        session.setAttribute("user", user);

        if (user == null) {
            writeResponse(resp, false, "Email không tồn tại trong hệ thống.");
            return;
        }

        String token = userService.generateResetToken();
        String hashedToken = userService.hashToken(token);
        PasswordReset resetPassword = userService.findResetTokenByUserId(user.getId());

        if (resetPassword != null) {
            userService.updateResetTokenForEmail(email, hashedToken);
        } else {
            userService.saveResetToken(user.getId(), hashedToken);
        }

        String encodeEmail = URLEncoder.encode(email, StandardCharsets.UTF_8);
        String resetLink = req.getRequestURL() + "?token=" + URLEncoder.encode(token, StandardCharsets.UTF_8) + "&email=" + encodeEmail;
        String emailBody = "<html><body>Nhấp vào link này để xác nhận lấy lại mật khẩu: <a href=\"" + resetLink + "\">Reset mật khẩu</a></body></html>";

        try {
            emailUtil.sendEmailAsync(email, "Lấy lại mật khẩu", emailBody);
            writeResponse(resp, true, "Email xác thực đã gửi đến bạn");
        } catch (Exception e) {
            writeResponse(resp, false, "Không thể gửi email, vui lòng thử lại.");
        }
    }

    private void resetPass(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String token = req.getParameter("token").trim();
        String email = req.getParameter("email").trim();
        String password = req.getParameter("password");

        if (token == null || token.isEmpty()) {
            writeResponse(resp, false, "Token không hợp lệ.");
            return;
        }

        String hashedInputToken = userService.hashToken(token);
        PasswordReset reset = userService.findResetTokenByEmailAndHashedToken(email, hashedInputToken);

        if (reset != null && reset.getTokenExpire().after(new Timestamp(System.currentTimeMillis()))) {
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            userService.updatePassword(reset.getUserId(), hashedPassword);
            userService.invalidateTokenByEmail(email);
            writeResponse(resp, true, "Mật khẩu đã được cập nhật.");
        } else {
            writeResponse(resp, false, "Token không hợp lệ hoặc đã hết hạn.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = req.getParameter("token");
        String email = req.getParameter("email");

        if (token != null && !token.isEmpty()) {
            try {
                String hashedToken = userService.hashToken(token);
                PasswordReset reset = userService.findResetTokenByEmailAndHashedToken(email, hashedToken);

                if (reset != null && reset.getTokenExpire().after(new Timestamp(System.currentTimeMillis()))) {
                    req.setAttribute("verificationRequested", true);
                    req.setAttribute("token", token);
                } else {
                    req.setAttribute("error_email", "Token không hợp lệ hoặc đã hết hạn.");
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            req.setAttribute("error_email", "Token không hợp lệ.");
        }

        req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
    }

    private void writeResponse(HttpServletResponse resp, boolean success, String message) throws IOException {
        resp.getWriter().write(gson.toJson(new ResponseMessage(success, message)));
    }

    private static class ResponseMessage {
        boolean success;
        String error_email;
        String error_token;

        ResponseMessage(boolean success, String message) {
            this.success = success;
            if (message.contains("Email") || message.contains("email")) {
                this.error_email = message;
            } else {
                this.error_token = message;
            }
        }
    }
}