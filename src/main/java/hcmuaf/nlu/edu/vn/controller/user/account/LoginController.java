package hcmuaf.nlu.edu.vn.controller.user.account;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.SessionManager;
import hcmuaf.nlu.edu.vn.service.UserService;
import hcmuaf.nlu.edu.vn.util.logUtil.LogLevel;
import hcmuaf.nlu.edu.vn.util.logUtil.LogUtilDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "login", value = "/login")
public class LoginController extends HttpServlet {
    public static final long LOCK_TIME = 2 * 60 * 1000; // 2 phút
    private static final int MAX_ATTEMPTS = 5;
    private static final Map<String, LoginAttempt> loginAttempts = new HashMap<>();
    private LogUtilDao logUtilDao;

    public LoginController() {
        this.logUtilDao = new LogUtilDao();
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("login".equals(action)) {
            req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, resp);
            return;
        }

        if ("reset".equals(action)) {
            resp.sendRedirect(req.getContextPath() + "/reset-password.jsp");
            return;
        }
        // đăng nhập
        UserService userService = new UserService();
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Kiểm tra nếu tài khoản đang bị khóa
        if (isLocked(username)) {
            req.setAttribute("error_login", "Tài khoản đã bị khóa. Vui lòng thử lại sau 2 phút.");
            req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, resp);
            return;
        }

        try {
            if (userService.login(username, password)) {
                Users user = userService.getUser(username);

                if (user != null && user.getIsEmailVerified() == 1) {
                    if ("Bị đình chỉ".equals(user.getStatus())) {
                        req.setAttribute("error_login", "Tài khoản đã bị cấm");
                        LogUtilDao.log(LogLevel.WARNING, username, req.getRemoteAddr(), "Chưa đăng nhập", "Đăng nhập thất bại");
                        req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, resp);
                        return;
                    }
                    // Xóa số lần nhập sai sau khi đăng nhập thành công
                    resetAttempts(username);
                    // lưu session
                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);
                    // Lưu session vào SessionManager
                    SessionManager.addSession(user.getId(), session);
                    userService.UpdateStatusOrRoleUserLoginLogout("Hoạt động", user.getId());

                    //cập nhật trạng thái
                    userService.UpdateStatusOrRoleUserLoginLogout("Hoạt động", user.getId());

                    // Quay vể trang gần nhất
                     String redirectUrl = (String) session.getAttribute("redirectUrl");
                     if (redirectUrl != null) {
                         session.removeAttribute("redirectUrl"); // Xóa redirectUrl khỏi session
                         resp.sendRedirect(redirectUrl); // Quay về URL trước đó
                     }else
                         if ("admin".equals(user.getRole())  || "owner".equals(user.getRole())) {
                             logUtilDao.log(LogLevel.INFO, user.getUsername(), req.getRemoteAddr(), "Login No", "Login Successful");
                             resp.sendRedirect(req.getContextPath() + "/home");
                         } else if ("user".equals(user.getRole())) {
                             logUtilDao.log(LogLevel.INFO, user.getUsername(), req.getRemoteAddr(), "Login No", "Login Successful");
                             resp.sendRedirect(req.getContextPath() + "/home-page");
                         } else {

                             req.setAttribute("error_login", "Không tìm thấy người dùng");
                             req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, resp);

                     }
                } else {
                    LogUtilDao.log(LogLevel.WARNING, username, req.getRemoteAddr(), "Chưa đăng nhập", "Đăng nhập thất bại");
                    req.setAttribute("error_login", "Tài khoản chưa được xác thực, hoặc không tồn tại");
                    req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, resp);
                }
            } else {
                //  Gọi hàm để tăng số lần nhập sai
                handleFailedAttempt(username, req, resp);
            }
        } catch (SQLException e) {
            req.setAttribute("error_login", "Lỗi hệ thống: " + e.getMessage());
            req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, resp);
        }
    }

    private void handleFailedAttempt(String username, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        LoginAttempt attempt = loginAttempts.getOrDefault(username, new LoginAttempt());
        attempt.incrementAttempts();
        loginAttempts.put(username, attempt);

        if (attempt.getAttempts() >= MAX_ATTEMPTS) {
            attempt.lock();
            req.setAttribute("error_login", "Bạn đã nhập sai quá 5 lần. Tài khoản bị khóa trong 2 phút.");
        } else {
            LogUtilDao.log(LogLevel.WARNING, username, req.getRemoteAddr(), "Chưa đăng nhập", "Đăng nhập thất bại");
            req.setAttribute("error_login", "Tài khoản hoặc mật khẩu không chính xác. Bạn còn " + (MAX_ATTEMPTS - attempt.getAttempts()) + " lần thử.");
        }

        req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, resp);
    }

    private boolean isLocked(String username) {
        LoginAttempt attempt = loginAttempts.get(username);
        return attempt != null && attempt.isLocked();
    }

    private void resetAttempts(String username) {
        loginAttempts.remove(username);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}