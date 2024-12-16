package hcmuaf.nlu.edu.vn.controller.user.carts;

import hcmuaf.nlu.edu.vn.service.CartService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "cart-remove", value = "/cart-remove")
public class RemoveCartItems extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CartService service = new CartService();
        int id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        service.removeFromCart(session, id);
        req.getRequestDispatcher( "/cart-items").forward(req, resp);

    }
}
