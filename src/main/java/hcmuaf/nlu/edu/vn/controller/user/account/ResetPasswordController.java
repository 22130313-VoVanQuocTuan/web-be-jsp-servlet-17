package hcmuaf.nlu.edu.vn.controller.user.account;

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
                    req.setAttribute("error", "Invalid action.");
                    req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại.");
            req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
        }
    }

    public void sendEmailResetPass(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // Xử lý yêu cầu gửi email reset mật khẩu
        String email = req.getParameter("email");
        Users user = userService.findUserByEmail(email);
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        if (user != null) {
            // Tạo token reset mật khẩu
            String otp = userService.generateOTP();
            req.setAttribute("otp", otp);

            // Kiểm tra xem token đã tồn tại hay chưa, nếu có thì cập nhật lại
            var resetPassword = userService.findResetTokenByUserId(user.getId());
            if (resetPassword != null) {
                // nếu có tồn tại thì cập nhật
                userService.updateResetTokenForEmail(email, otp);
            } else {
                //  Lưu token mới vào cơ sở dữ liệu
                userService.saveResetOTP(user.getId(), otp);
            }


            // Sửa lại phần email để đảm bảo đường link có thể nhấn vào
            String emailBody = "Mã OTP để lấy lại mật  khẩu của bạn là: " + otp;

            try {
                emailUtil.sendEmailAsync(email, "Lấy lại mật khẩu", emailBody);
                req.setAttribute("error_email", "Email xác thực đã gửi đến bạn");
                req.setAttribute("verificationRequesteds", true); // Đánh dấu yêu cầu xác thực
            } catch (Exception e) {
                req.setAttribute("error_email", "Không thể gửi email, vui lòng thử lại.");
            }

        } else {
            req.setAttribute("error_email", "Email không tồn tại trong hệ thống.");
        }
        req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);

    }

    public void resetPass(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // Lấy token và mật khẩu từ request
        String token = req.getParameter("token");
        String password = req.getParameter("password");

        if (token == null || token.isEmpty()) {
            req.setAttribute("error_token", "Token không hợp lệ.");
            req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
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

            // Chuyển hướng đến trang login
            req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, resp);
        } else {
            req.setAttribute("verificationRequested", true);
            req.setAttribute("error_token", "Token không hợp lệ hoặc đã hết hạn.");
            req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userService = new UserService();

        // Lấy mã xác thực từ các trường nhập liệu và kiểm tra null
        String code1 = req.getParameter("code1") != null ? req.getParameter("code1") : "";
        String code2 = req.getParameter("code2") != null ? req.getParameter("code2") : "";
        String code3 = req.getParameter("code3") != null ? req.getParameter("code3") : "";
        String code4 = req.getParameter("code4") != null ? req.getParameter("code4") : "";

        // Kết hợp các mã thành một chuỗi
        String code = code1 + code2 + code3 + code4;

        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("email");

        if (email == null) {
            req.setAttribute("error_email", "Phiên của bạn đã hết hạn. Vui lòng thử lại.");
            req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
            return; // Dừng phương thức để tránh xử lý tiếp
        }

        if (code.isEmpty()) {
            req.setAttribute("error_email", "Token không hợp lệ.");
            req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
            return;
        }

        try {
            PasswordReset reset = userService.findResetTokenByToken(code);

            if (reset != null && reset.getTokenExpire() != null && reset.getTokenExpire().after(new Timestamp(System.currentTimeMillis()))) {
                req.setAttribute("verificationRequested", true);
                req.setAttribute("token", code);
            } else {
                req.setAttribute("error_email", "Token không hợp lệ hoặc đã hết hạn.");
            }

        } catch (Exception e) {
            req.setAttribute("error_email", "Đã xảy ra lỗi trong quá trình kiểm tra token.");
            e.printStackTrace(); // Log lỗi ra console để debug
        }

        req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
    }
}


