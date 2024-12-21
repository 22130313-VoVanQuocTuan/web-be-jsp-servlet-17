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

        HttpSession session = req.getSession();

        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/users/page/login-signup.jsp");
            return;
        }
        Carts carts = (Carts) session.getAttribute("cart");
        if (carts == null) {
            // Nếu giỏ hàng không tồn tại, khởi tạo giỏ hàng mới
            carts = new Carts();
            session.setAttribute("cart", carts);
        }

        List<CartItems> listItems = carts.listItems(); // Lấy danh sách CartItems từ Carts

        if (listItems == null || listItems.isEmpty()) {
            req.setAttribute("listItems", null); // Nếu giỏ hàng rỗng
        } else {
            req.setAttribute("listItems", listItems); // Nếu có danh sách các item
        }
        //lấy ra tổng số lượng ,tổng  giá
        double totalPrice =  carts.getTotalPrice();
        req.setAttribute("totalPrice", totalPrice);
        double totalShippingFee = carts.getTotalPriceShippingFee();
        req.setAttribute("totalShippingFee", totalShippingFee);
        double totalFinalPrice = carts.getFinalTotalPrice();
        req.setAttribute("totalFinalPrice", totalFinalPrice);
        int totalItem = carts.getTotalItem();
        req.setAttribute("totalItem", totalItem);
        session.setAttribute("cartItemCount", totalItem); // Lưu số lượng sản phẩm vào session

        req.getRequestDispatcher("/users/page/cart.jsp").forward(req, resp);
    }
}