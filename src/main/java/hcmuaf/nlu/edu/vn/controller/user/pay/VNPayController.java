package hcmuaf.nlu.edu.vn.controller.user.pay;

import hcmuaf.nlu.edu.vn.model.OrderDetail;
import hcmuaf.nlu.edu.vn.service.OrderService;
import hcmuaf.nlu.edu.vn.util.VNPayUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "VNPay", value = "/VNPay")
public class VNPayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long amount = Long.parseLong(req.getParameter("amount"));
        int id = Integer.parseInt(req.getParameter("id"));
        String paymentUrl = VNPayUtil.createPaymentUrl(req, amount,id);
        resp.sendRedirect(paymentUrl);
    }
}
