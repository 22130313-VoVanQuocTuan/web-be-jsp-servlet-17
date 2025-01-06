package hcmuaf.nlu.edu.vn.controller.user.pay;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ConfirmPayment", value = "/confirm-payment")
public class ConfirmPaymentController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy các tham số từ VNPay trả về
        String vnp_TxnRef = req.getParameter("vnp_TxnRef");
        String vnp_ResponseCode = req.getParameter("vnp_ResponseCode");
        String vnp_Amount = req.getParameter("vnp_Amount");
        // Chuyển các tham số tới JSP để hiển thị
        req.setAttribute("vnp_TxnRef", vnp_TxnRef);
        req.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
        req.setAttribute("vnp_Amount", vnp_Amount);


        req.getRequestDispatcher("/confirm-payment.jsp").forward(req, resp);
    }
}
