package hcmuaf.nlu.edu.vn.controller.user.account;

import hcmuaf.nlu.edu.vn.model.Users;
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

@WebServlet(name = "logout", value = "/logout")
public class LogoutController extends HttpServlet {
    private LogUtilDao logUtilDao;




    private final UserService userService;
    public LogoutController() {
        this.userService = new UserService();
        this.logUtilDao = new LogUtilDao();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

          try{
            HttpSession session = req.getSession();
            Users user = (Users) session.getAttribute("user");
            if (user == null) {
                // Nếu user không tồn
                 req.getRequestDispatcher( "/users/page/login-signup.jsp").forward(req, resp);
                return;
            }
              logUtilDao.log(LogLevel.INFO, user.getUsername(), req.getRemoteAddr(), "Đang đăng nhập", "Đã đăng xuất");
            // Cập nhật trạng thái người dùng thành "Không hoạt động"
            userService.UpdateStatusOrRoleUserLoginLogout("Không hoạt động", user.getId());

            // Hủy session (đăng xuất)
            req.getSession().invalidate();
            // Chuyển hướng tới trang đăng nhập
            req.getRequestDispatcher( "/users/page/login-signup.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý yêu cầu POST nếu cần
        doGet(request, response); // Gọi lại doGet nếu logic giống nhau
    }
}
