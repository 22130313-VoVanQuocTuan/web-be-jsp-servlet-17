package hcmuaf.nlu.edu.vn.controller.admin.account;

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
import java.io.PrintWriter;

@WebServlet("/role-account")
public class UpdateRoleController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String id = req.getParameter("userId");
        UserService userService = new UserService();
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        try{
            userService.updateRoleById(id);
            LogUtilDao.log(LogLevel.INFO,user.getUsername(),req.getRemoteAddr(), "User có mã: "+ id+" với quyền Admin", "Có quyền User" );
            int userId = Integer.parseInt(id);
            // Hủy session của người bị hạ quyền
            SessionManager.invalidateSession(userId);
            PrintWriter out = resp.getWriter();
            out.println("{\"message\":\"Hạ quyền thành công\"}");
            out.flush();

        }catch(Exception e){
            e.printStackTrace();
            PrintWriter out = resp.getWriter();
            out.println("{\"error\": true, \"message\":\"Hạ quyền  thất bại.\"}");
            out.flush();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
