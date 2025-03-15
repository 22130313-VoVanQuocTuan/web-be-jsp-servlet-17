package hcmuaf.nlu.edu.vn.controller.user.pay;

import hcmuaf.nlu.edu.vn.dao.carts.CartItems;

import hcmuaf.nlu.edu.vn.model.OrderItem;
import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.CartService;
import hcmuaf.nlu.edu.vn.service.OrderService;

import hcmuaf.nlu.edu.vn.util.VNPayUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "VNPay", value = "/payVNPAY")
public class VNPayController extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderService orderService = new OrderService();
        double amount = Double.parseDouble(req.getParameter("amount"));
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");

        // CAPTCHA
        String sessionCaptcha = (String) session.getAttribute("captcha"); // Lấy CAPTCHA từ session
        String userCaptcha = req.getParameter("captcha"); // Lấy CAPTCHA nhập từ form

        System.out.println("Session CAPTCHA: " + sessionCaptcha);
        System.out.println("User nhập CAPTCHA: " + userCaptcha);
        System.out.println("Session ID: " + session.getId());

        if (sessionCaptcha == null) {
            req.setAttribute("captchaError", "Lỗi: CAPTCHA không tồn tại. Vui lòng thử lại.");
            req.setAttribute("showModalVNPAY", true); // Giữ lại modal COD
            req.getRequestDispatcher("users/page/confirmation.jsp").forward(req, resp);
            return;
        }

        if (!sessionCaptcha.equals(userCaptcha)) {
            req.setAttribute("captchaError", "Sai CAPTCHA. Vui lòng nhập lại.");
            req.setAttribute("showModalVNPAY", true); // Giữ lại modal COD
            req.getRequestDispatcher("users/page/confirmation.jsp").forward(req, resp);
            return;
        }

        // Nếu CAPTCHA đúng, tiếp tục xử lý thanh toán...
        session.removeAttribute("captcha"); // Xóa CAPTCHA cũ để tránh nhập lại


        // Sau khi kiểm tra thành công, xóa CAPTCHA khỏi session để tránh nhập lại lần nữa
        session.removeAttribute("captcha_code");


        int userId = user.getId();
        double totalFinalPrice = (double) session.getAttribute("totalFinalPrice");
        double totalShippingFee = (double) session.getAttribute("totalShippingFee");
        double totalDiscount = (double) session.getAttribute("totalDiscount");
        String status = "Đang xử lý";
        String paymentStatus = "Chưa thanh toán";
        String paymentMethod = "VNPay";
        String shippingAddress = req.getParameter("shippingAddress");


        Orders order = new Orders(userId, totalFinalPrice, totalShippingFee, totalDiscount, shippingAddress, paymentMethod, paymentStatus, status);
        try {
            // Lưu đơn hàng vào cơ sở dữ liệu
            Orders o = orderService.addOrder(order); // Trả về ID của đơn hàng vừa tạo
            session.setAttribute("orderId", o.getId());
            if (o != null) {
                // Lưu chi tiết các sản phẩm trong giỏ hàng vào `OrderItem`

                CartService cartService = new CartService();
                List<CartItems> cartItems = cartService.getCartFromSession(session).listItems();
                for (CartItems cartItem : cartItems) {
                    System.out.println(cartItem.getProductId());
                    OrderItem orderItem = new OrderItem(o.getId(), cartItem.getId(), cartItem.getQuantity(),cartItem.getPrice(), cartItem.getTotalPrice(), cartItem.getDiscountAmount());
                    orderService.addOrderItems(orderItem);
                }


            } else {
                // Trường hợp lưu đơn hàng thất bại
                resp.sendRedirect(req.getContextPath() +"/confirmation");
                return;
            }

            // Tạo URL thanh toán VNPay
            String paymentUrl = VNPayUtil.createPaymentUrl(req, amount);
            System.out.println(paymentUrl);

            // Điều hướng người dùng tới URL thanh toán
            resp.sendRedirect(paymentUrl);
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi trong quá trình lưu thông tin đơn hàng.", e);
        }
    }


}
