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

@WebServlet(name = "voucher", value = "/voucher")
public class Voucher extends HttpServlet {
    private CartService cartService;
    public Voucher() {
        cartService = new CartService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy mã giảm giá từ request
        String voucherCode = req.getParameter("voucher").trim();

        // Kiểm tra giỏ hàng từ session
        HttpSession session = req.getSession();
        Carts carts = (Carts) session.getAttribute("cart");

        if (carts != null) {

            double voucherValue = cartService.applyVoucher(voucherCode);

            if (voucherValue > 0) { // Mã giảm giá hợp lệ
                 carts.applyVoucher(voucherValue);
                 req.setAttribute("error_code", "Áp dụng mã giảm giá thành công, bạn được giảm " + voucherValue + " ₫");
            } else {
                req.setAttribute("error_code", "Mã giảm giá không hợp lệ hoặc đã hết hạn!");
            }
        } else {
            req.setAttribute("error_code", "Giỏ hàng trống!");
        }

        // Chuyển hướng về trang giỏ hàng
        req.getRequestDispatcher("/cart-items").forward(req, resp);
    }
}
