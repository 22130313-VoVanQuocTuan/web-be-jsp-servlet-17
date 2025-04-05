package hcmuaf.nlu.edu.vn.controller.admin.ImportExportStock;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.service.ImportExportService;
import hcmuaf.nlu.edu.vn.service.InventoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/check_quantity")
public class CheckQuantityExportImportController  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String quantity = req.getParameter("quantity");
        ImportExportService importExportService = new ImportExportService();
        int quantityInt = Integer.parseInt(quantity);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try {
            // Kiểm tra số lượng sản phẩm trong kho
            if (quantityInt > importExportService.getQuantity(productId) || quantityInt <= 0) {
                String message = "Số lượng xuất đi không vượt quá số lượng trong kho và không nhỏ hơn hoặc bằng 0";
                // Trả về thông báo lỗi dưới dạng JSON
                String jsonResponse = "{\"error\":\"" + message + "\"}";
                resp.getWriter().write(jsonResponse);
            } else {
                // Trả về thông báo thành công
                String jsonResponse = "{\"success\":\"Số lượng hợp lệ\"}";
                resp.getWriter().write(jsonResponse);
            }
        } catch (RuntimeException e) {
            // Trả về lỗi server nếu có exception
            String jsonResponse = "{\"error\":\"Có lỗi xảy ra khi xử lý yêu cầu.\"}";
            resp.getWriter().write(jsonResponse);
        }
    }
}