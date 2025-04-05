package hcmuaf.nlu.edu.vn.controller.admin.ImportExportStock;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.service.ImportExportService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.spec.ECField;

@WebServlet("/deleteTransactionstock")
public class DeleteTransactionStockController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String transactionId = req.getParameter("transactionId");
        ImportExportService service = new ImportExportService();


        try{
            service.deleteTransactionStock(transactionId);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("{\"message\": \"Xóa thành công.\"}");
            out.flush();

        } catch (Exception e) {
                 e.printStackTrace();
        }
    }
}
