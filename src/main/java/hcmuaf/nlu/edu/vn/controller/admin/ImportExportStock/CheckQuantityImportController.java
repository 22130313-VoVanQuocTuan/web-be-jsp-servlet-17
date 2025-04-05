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

@WebServlet("/check_quantity_import")
public class CheckQuantityImportController  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String quantity = req.getParameter("quantity");
        String quantityPresent = req.getParameter("quantityPresent");
        int quantityPresentInt = Integer.parseInt(quantityPresent);
        ImportExportService importExportService = new ImportExportService();
        int quantityInt = Integer.parseInt(quantity);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try {
            // Kiểm tra số lượng sản phẩm trong kho
            if (quantityInt + quantityPresentInt > importExportService.getMaximumQuantity(productId)) {
                String message = "Số lượng tồn kho quá tải vui lòng nhập ít hơn ";
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