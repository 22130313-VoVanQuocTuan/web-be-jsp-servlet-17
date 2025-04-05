package hcmuaf.nlu.edu.vn.controller.admin.ImportExportStock;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Inventory;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.ImportExportService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

@WebServlet("/exportInventory")
public class ExportStockController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String quantity = req.getParameter("quantity");
        String note = req.getParameter("note");
        ImportExportService service = new ImportExportService();
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");

        try {
            int quantityInt = Integer.parseInt(quantity);
            service.exportStock(productId, quantityInt);
            service.updateInventoryStatus(productId);
            service.addInfoImportExportStock("Xuất kho", String.valueOf(LocalDateTime.now()), user.getId(), note, quantityInt, productId);


            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("{\"message\":\"Xuất hàng thành công.\"}");
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write("{\"error\": \"Có lỗi xảy ra khi xuất kho.\"}");
        }
    }
}
