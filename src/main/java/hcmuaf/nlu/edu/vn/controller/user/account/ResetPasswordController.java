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
    private final UserService userService;
    private final EmailUtilService emailUtil;

    public ResetPasswordController() {
        this.userService = new UserService();
        this.emailUtil = new EmailUtilService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();
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
                    resp.getWriter().write(gson.toJson(new ResponseMessage(false, "Invalid action.")));
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write(gson.toJson(new ResponseMessage(false, "Có lỗi xảy ra, vui lòng thử lại.")));
        }
    }

    public void sendEmailResetPass(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // Xử lý yêu cầu gửi email reset mật khẩu
        String email = req.getParameter("email");
        Users user = userService.findUserByEmail(email);
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        Gson gson = new Gson();
        ResponseMessage responseMassage;

        if (user != null) {
            // Tạo token reset mật khẩu
            String token = userService.generateResetToken();
            // Kiểm tra xem token đã tồn tại hay chưa, nếu có thì cập nhật lại
            var resetPassword = userService.findResetTokenByUserId(user.getId());
            if (resetPassword != null) {
                // nếu có tồn tại thì cập nhật
                userService.updateResetTokenForEmail(email, token);
            } else {
                //  Lưu token mới vào cơ sở dữ liệu
                userService.saveResetToken(user.getId(), token);
            }

            // Tạo đường dẫn reset mật khẩu với token
            String resetLink = req.getRequestURL().toString() + "?token=" + URLEncoder.encode(token, StandardCharsets.UTF_8);
            // Sửa lại phần email để đảm bảo đường link có thể nhấn vào
            String emailBody = "<html><body>Nhấp vào link này để xác nhận lấy lại mật khẩu: <a href=\"" + resetLink + "\">Reset mật khẩu</a></body></html>";

            try {
                emailUtil.sendEmailAsync(email, "Lấy lại mật khẩu", emailBody);
                responseMassage = new ResponseMessage(true, "Email xác thực đã gửi đến bạn");
            } catch (Exception e) {
                responseMassage = new ResponseMessage(false, "Không thể gửi email, vui lòng thử lại.");
            }

        } else {
            responseMassage = new ResponseMessage(false, "Email không tồn tại trong hệ thống.");
        }
        resp.getWriter().write(gson.toJson(responseMassage));
    }

    public void resetPass(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // Lấy token và mật khẩu từ request
        String token = req.getParameter("token");
        String password = req.getParameter("password");
        Gson gson = new Gson();
        ResponseMessage responseMassage;

        if (token == null || token.isEmpty()) {
            responseMassage = new ResponseMessage(false, "Token không hợp lệ.");
            resp.getWriter().write(gson.toJson(responseMassage));
            return;
        }
        // Kiểm tra token trong cơ sở dữ liệu
        PasswordReset reset = userService.findResetTokenByToken(token);
        if (reset != null && reset.getTokenExpire().after(new Timestamp(System.currentTimeMillis()))) {
            // Mã hóa mật khẩu mới
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            // Cập nhật mật khẩu

            userService.updatePassword(reset.getUserId(), hashedPassword);

            // Vô hiệu hóa token sau khi dùng
            userService.invalidateToken(token);

            responseMassage = new ResponseMessage(true, "Mật khẩu đã được cập nhật.");
        } else {
            responseMassage = new ResponseMessage(false, "Token không hợp lệ hoặc đã hết hạn.");
        }
        resp.getWriter().write(gson.toJson(responseMassage));
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = req.getParameter("token");

        if (token != null && !token.isEmpty()) {
            // Kiểm tra tính hợp lệ của token trong cơ sở dữ liệu
            PasswordReset reset = null;  // Gọi phương thức tìm token
            try {
                reset = userService.findResetTokenByToken(token);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            if (reset != null && reset.getTokenExpire().after(new Timestamp(System.currentTimeMillis()))) {
                // Nếu token hợp lệ và chưa hết hạn
                req.setAttribute("verificationRequested", true);  // Thiết lập flag để hiển thị form đặt lại mật khẩu
                req.setAttribute("token", token);  // Truyền token vào form
            } else {
                // Token không hợp lệ hoặc đã hết hạn
                req.setAttribute("error_email", "Token không hợp lệ hoặc đã hết hạn.");
            }
        } else {
            req.setAttribute("error_email", "Token không hợp lệ.");
        }

        // Chuyển hướng đến trang reset-password.jsp để hiển thị form
        req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
    }
}

