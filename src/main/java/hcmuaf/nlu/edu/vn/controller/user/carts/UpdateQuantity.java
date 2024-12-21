package hcmuaf.nlu.edu.vn.controller.user.carts;

import hcmuaf.nlu.edu.vn.dao.carts.Carts;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "update-cart", value = "/update-cart")
public class UpdateQuantity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Lấy tham số từ request
            String idParam = req.getParameter("id");
            String quantityParam = req.getParameter("quantity");

            if (idParam == null || quantityParam == null) {
                resp.sendRedirect("cart-items"); // Chuyển hướng nếu thiếu tham số
                return;
            }

            int id = Integer.parseInt(idParam);
            int quantity = Integer.parseInt(quantityParam);

            // Đảm bảo số lượng >= 1
            if (quantity < 1) quantity = 1;

            // Lấy giỏ hàng từ session và cập nhật
            HttpSession session = req.getSession();
            Carts carts = (Carts) session.getAttribute("cart");
            if (carts != null) {
                carts.updateQuantity(id, quantity);
            }

            // Chuyển hướng về trang giỏ hàng
            resp.sendRedirect("cart-items");
        } catch (NumberFormatException e) {
            // Xử lý ngoại lệ khi tham số không hợp lệ
            resp.sendRedirect("cart-items");
        }
    }
}