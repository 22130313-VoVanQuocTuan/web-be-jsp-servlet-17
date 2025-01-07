package hcmuaf.nlu.edu.vn.controller.user.pay;

import hcmuaf.nlu.edu.vn.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ConfirmPayment", value = "/confirm-payment")
public class ConfirmPaymentController  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy các tham số từ VNPay trả về
        String vnp_TxnRef = req.getParameter("vnp_TxnRef");
        String vnp_ResponseCode = req.getParameter("vnp_ResponseCode");
        String vnp_Amount = req.getParameter("vnp_Amount");

        // Kiểm tra trạng thái giao dịch
        String message;
        if ("00".equals(vnp_ResponseCode)) {
            message = "Thanh toán thành công! Mã giao dịch: " + vnp_TxnRef;

        } else {
            message = "Thanh toán thất bại! Vui lòng thử lại.";
        }

        // Chuyển các tham số tới JSP để hiển thị
        req.setAttribute("vnp_TxnRef", vnp_TxnRef);
        req.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
        req.setAttribute("vnp_Amount", vnp_Amount);
        req.setAttribute("message", message);


        //lấy id hóa đơn từ session
        HttpSession session = req.getSession();
        int orderId = (Integer) session.getAttribute("orderId");
        OrderService orderService = new OrderService();
        try {
            orderService.updateOrderPaymentStatus(orderId, "Đã thanh toán");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Chuyển tiếp tới file JSP
        req.getRequestDispatcher("users/page/check-pay.jsp").forward(req, resp);
    }
}
