package hcmuaf.nlu.edu.vn.controller.admin.log;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.util.logUtil.Log;
import hcmuaf.nlu.edu.vn.util.logUtil.LogUtilDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/listLog")
public class GetListLog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null || (!user.getRole().equals("admin") && !user.getRole().equals("owner"))) {
            resp.sendRedirect(req.getContextPath() + "/logout");
            return;
        }
        List<Log> logs = LogUtilDao.getListLog(); // Lấy dữ liệu từ database
        req.setAttribute("logList", logs);
        req.getRequestDispatcher("/admin/pages/manager_log.jsp").forward(req, resp);
    }
}
