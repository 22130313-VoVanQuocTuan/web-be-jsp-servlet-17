package hcmuaf.nlu.edu.vn.controller.admin.promotional;

import hcmuaf.nlu.edu.vn.service.ProductService;
import hcmuaf.nlu.edu.vn.service.PromotionalService;
import hcmuaf.nlu.edu.vn.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeletePromotional", value = "/delete-promotional")
public class DeletePromotionalController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PromotionalService promotionalService = new PromotionalService();
        int id = Integer.parseInt(req.getParameter("id"));
        if(promotionalService.deletePromotional(id)){
            resp.sendRedirect(req.getContextPath()+"/promotional-list");
        }else{
            req.setAttribute("error", "Xóa ưu đãi thất bại.");
            req.getRequestDispatcher("/promotional-list").forward(req, resp);
        }
    }
}


