package hcmuaf.nlu.edu.vn.controller.admin.ImportExportStock;

import com.google.api.client.util.DateTime;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.ImportExportService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;

@WebServlet("/import_stock")
public class ImportStock extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String quantity = req.getParameter("quantity");
        String note = req.getParameter("note");
        double price = Double.parseDouble(req.getParameter("price"));
        ImportExportService service = new ImportExportService();
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");

        try{
            int quantityInt = Integer.parseInt(quantity);
            double totalCost = price * quantityInt;
            service.importStock(productId, quantityInt);
            service.addInfoImportExportStock("NHẬP KHO", String.valueOf(LocalDateTime.now()),user.getId(),note, totalCost,price,quantityInt,productId );

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write("{\"redirect\": \"" + req.getContextPath() + "/listImportExportStock\"}");


        }catch(Exception e){
            e.printStackTrace();
        }


    }
}
