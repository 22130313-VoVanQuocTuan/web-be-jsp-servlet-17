package hcmuaf.nlu.edu.vn.controller.admin.account;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.PermissionService;
import hcmuaf.nlu.edu.vn.service.SessionManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "update_permissions", value = "/update-permissions-admin")
public class UpdatePermissionsController extends HttpServlet {
    private PermissionService permissionService = new PermissionService();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("application/json");
       resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");

        // Kiểm tra nếu không phải OWNER thì chặn lại
        if (user == null || !user.getRole().equals("owner")) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        int userId = Integer.parseInt(req.getParameter("userId"));
        String module = req.getParameter("module");
        String canViewParam = req.getParameter("canView");
        boolean canView = "true".equalsIgnoreCase(canViewParam) ? true : false;

        String canAddParam = req.getParameter("canAdd");
        boolean canAdd = "true".equalsIgnoreCase(canAddParam) ? true : false;

        String canEditParam = req.getParameter("canEdit");
        boolean canEdit = "true".equalsIgnoreCase(canEditParam) ? true : false;

        String canDeleteParam = req.getParameter("canDelete");
        boolean canDelete = "true".equalsIgnoreCase(canDeleteParam) ? true : false;



        // Cập nhật quyền
        try {
            permissionService.updatePermissions(userId, module, canView, canAdd, canEdit, canDelete);
            PrintWriter out = resp.getWriter();
            out.println("{\"message\":\"Cập nhật thành công\"}");
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            PrintWriter out = resp.getWriter();
            out.println("{\"error\": true, \"message\":\"Cập nhật thất bại.\"}");
            out.flush();
        }

    }

}
