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
import java.io.PrintWriter;

@WebServlet(name = "DeletePromotional", value = "/delete-promotional")
public class DeletePromotionalController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PromotionalService promotionalService = new PromotionalService();
        int id = Integer.parseInt(req.getParameter("id"));
        if(promotionalService.deletePromotional(id)){
            PrintWriter out = resp.getWriter();
            out.println("{\"message\": \"Xóa thành công.\"}");
            out.flush();
        }else{
            PrintWriter out = resp.getWriter();
            out.println("{\"error\": true, \"message\":\"Xóa thất bại.\"}");
            out.flush();
        }
    }
}


