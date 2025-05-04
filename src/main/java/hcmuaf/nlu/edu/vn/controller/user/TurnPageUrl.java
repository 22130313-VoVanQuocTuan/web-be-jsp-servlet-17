package hcmuaf.nlu.edu.vn.controller.user;

import hcmuaf.nlu.edu.vn.model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "TurnPageLogin", value = "/turn-page")
public class TurnPageUrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if(user==null){
            resp.sendRedirect(req.getContextPath()+"/logout");
            return;
        }
        if("checkpay".equals(action)) {
            req.getRequestDispatcher("/users/page/check-pay.jsp").forward(req, resp);
        }
        if("cart".equals(action)) {
            req.getRequestDispatcher("/users/page/cart.jsp").forward(req, resp);
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
        if("rating".equals(action)) {
            req.getRequestDispatcher("/admin/pages/review.jsp").forward(req, resp);
        }
        if("promotional".equals(action)) {
            req.getRequestDispatcher("/admin/pages/promotional.jsp").forward(req, resp);
        }
        if("product".equals(action)) {
            req.getRequestDispatcher("/admin/pages/products.jsp").forward(req, resp);
        }
        if("order".equals(action)) {
            req.getRequestDispatcher("/admin/pages/order.jsp").forward(req, resp);
        }
        if("home".equals(action)) {
            req.getRequestDispatcher("/admin/pages/index.jsp").forward(req, resp);
        }
        if("categories".equals(action)) {
            req.getRequestDispatcher("/admin/pages/category.jsp").forward(req, resp);
        }
        if("infoUser".equals(action)) {
            req.getRequestDispatcher("/users/page/informationCustomer.jsp").forward(req, resp);
        }
        if("infoUserAdmin".equals(action)) {
            req.getRequestDispatcher("/admin/pages/account.jsp").forward(req, resp);
        }
    }
}
