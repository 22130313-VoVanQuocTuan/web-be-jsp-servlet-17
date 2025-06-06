package hcmuaf.nlu.edu.vn.controller.user;

import hcmuaf.nlu.edu.vn.model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "TurnPageNoLogin", value = "/turn-page-noLogin")
public class TurnPageNoLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("buyingHelp".equals(action)) {
            req.getRequestDispatcher("/users/page/buying-help.jsp").forward(req, resp);
        }
        if ("termAndService".equals(action)) {
            req.getRequestDispatcher("/users/page/term_and_services.jsp").forward(req, resp);
        }
        if ("productUnit".equals(action)) {
            req.getRequestDispatcher("/users/page/product_unit.jsp").forward(req, resp);
        }
        if ("introduce".equals(action)) {
            req.getRequestDispatcher("/users/page/introduce.jsp").forward(req, resp);
        }
        if ("resetPass".equals(action)) {
            req.getRequestDispatcher("/users/page/reset-password.jsp").forward(req, resp);
        }
        if ("categories".equals(action)) {
            req.getRequestDispatcher("/users/page/product.jsp").forward(req, resp);
        }
        if ("product".equals(action)) {
            HttpSession session = req.getSession();
            String keyword = req.getParameter("keyword");
            if (keyword != null && !keyword.isEmpty()) {
                req.setAttribute("keyword", keyword); // gửi sang JSP
            }
            String categoryId = req.getParameter("categoryId");
            // Lưu categoryId vào session nếu có
            if (categoryId != null && !categoryId.trim().isEmpty()) {
                try {
                    Integer.parseInt(categoryId);
                    session.setAttribute("filterCategoryId", categoryId);
                } catch (NumberFormatException e) {
                    session.removeAttribute("filterCategoryId"); // Xóa nếu không hợp lệ
                }
            } else {
                session.removeAttribute("filterCategoryId"); // Xóa nếu không có categoryId
            }
            req.getRequestDispatcher("/users/page/product.jsp").forward(req, resp);
        }
    }
}


