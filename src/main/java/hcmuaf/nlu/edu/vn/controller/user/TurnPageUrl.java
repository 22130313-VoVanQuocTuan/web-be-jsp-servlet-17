package hcmuaf.nlu.edu.vn.controller.user;

import hcmuaf.nlu.edu.vn.model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "TurnPage", value = "/turn-page")
public class TurnPageUrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("buyingHelp".equals(action)) {
            req.getRequestDispatcher("/users/page/buying-help.jsp").forward(req, resp);
        }
        if("termAndService".equals(action)) {
            req.getRequestDispatcher("/users/page/term_and_services.jsp").forward(req, resp);
        }
        if("productUnit".equals(action)) {
            req.getRequestDispatcher("/users/page/product_unit.jsp").forward(req, resp);
        }
        if("introduce".equals(action)) {
            req.getRequestDispatcher("/users/page/introduce.jsp").forward(req, resp);
        }
        if("resetPass".equals(action)) {
            req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
        }
        if("checkpay".equals(action)) {
            req.getRequestDispatcher("/users/page/check-pay.jsp").forward(req, resp);
        }
        if("import_export".equals(action)) {
            req.getRequestDispatcher("/admin/pages/import_export.jsp").forward(req, resp);
        }
        if("inventory".equals(action)) {
            req.getRequestDispatcher("/admin/pages/inventory.jsp").forward(req, resp);
        }
        if("history_import_export".equals(action)) {
            req.getRequestDispatcher("/admin/pages/import_export.jsp").forward(req, resp);
        }
        if("user".equals(action)) {
            req.getRequestDispatcher("/admin/pages/user.jsp").forward(req, resp);
        }
        if("managerOwner".equals(action)) {
            req.getRequestDispatcher("/admin/pages/manager_admin.jsp").forward(req, resp);
        }
        if("log".equals(action)) {
            req.getRequestDispatcher("/admin/pages/manager_log.jsp").forward(req, resp);
        }
    }
}
