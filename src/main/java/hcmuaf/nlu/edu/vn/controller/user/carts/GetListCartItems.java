package hcmuaf.nlu.edu.vn.controller.user.carts;

import hcmuaf.nlu.edu.vn.dao.carts.CartItems;
import hcmuaf.nlu.edu.vn.dao.carts.Carts;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "cart-items", value = "/cart-items")
public class GetListCartItems  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Carts carts = (Carts) req.getSession().getAttribute("cart");
        if (session == null || carts == null) {
            resp.sendRedirect(req.getContextPath() + "/users/page/login-signup.jsp");
            return;
        }
        List<CartItems> listItems = carts.listItems(); // Lấy danh sách CartItems từ Carts

        if (listItems == null || listItems.isEmpty()) {
            req.setAttribute("listItems", null); // Nếu giỏ hàng rỗng
        } else {
            req.setAttribute("listItems", listItems); // Nếu có danh sách các item
        }

        req.getRequestDispatcher("/users/page/cart.jsp").forward(req, resp);
    }
}