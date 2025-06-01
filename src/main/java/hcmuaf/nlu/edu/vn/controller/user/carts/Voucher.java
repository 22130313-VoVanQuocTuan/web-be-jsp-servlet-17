package hcmuaf.nlu.edu.vn.controller.user.carts;

import hcmuaf.nlu.edu.vn.dao.carts.Carts;
import hcmuaf.nlu.edu.vn.dao.carts.VoucherDao;
import hcmuaf.nlu.edu.vn.service.CartService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "voucher", value = "/voucher")
public class Voucher extends HttpServlet {
    private CartService cartService;
    public Voucher() {
        cartService = new CartService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        String voucherCode = req.getParameter("voucher").trim();
        HttpSession session = req.getSession();
        Carts carts = (Carts) session.getAttribute("cart");
        PrintWriter out = resp.getWriter();

        if (carts != null) {
            double voucherValue = cartService.applyVoucher(voucherCode);
            if (voucherValue > 0) {
                carts.applyVoucher(voucherValue);
                session.setAttribute("cart", carts); // Lưu giỏ hàng vào session
                String json = "{\"message\":\"Áp dụng mã giảm giá thành công, bạn được giảm " + voucherValue + "đ\"}";
                out.println(json);
            } else {
                out.println("{\"message\":\"Mã giảm giá không hợp lệ hoặc đã hết hạn\"}");
            }
        } else {
            out.println("{\"message\":\"Giỏ hàng không tồn tại\"}");
        }
        out.flush();
    }
}