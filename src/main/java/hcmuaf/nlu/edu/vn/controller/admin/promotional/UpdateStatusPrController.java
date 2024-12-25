package hcmuaf.nlu.edu.vn.controller.admin.promotional;

import hcmuaf.nlu.edu.vn.service.PromotionalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateStatusPro", value = "/update-status-pro")
public class UpdateStatusPrController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String status = req.getParameter("status");
        PromotionalService promotionalService = new PromotionalService();
        try {
            if (promotionalService.updateStatusProm(id, status)) {
                resp.sendRedirect(req.getContextPath() + "/promotional-list");
            } else {
                req.setAttribute("error", "Thông tin không chính xác");
                req.getRequestDispatcher("/promotional-list").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("error", "Lỗi hệ thống");
            req.getRequestDispatcher("/promotional-list").forward(req, resp);
        }
    }
}
