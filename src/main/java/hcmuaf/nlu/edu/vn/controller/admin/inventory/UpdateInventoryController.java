package hcmuaf.nlu.edu.vn.controller.admin.inventory;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Inventory;
import hcmuaf.nlu.edu.vn.service.ImportExportService;
import hcmuaf.nlu.edu.vn.service.InventoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/updateInventory")
public class UpdateInventoryController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        int quantity = Integer.parseInt(req.getParameter("quantityInput"));
        int minInput = Integer.parseInt(req.getParameter("minInput"));
        int maxInput = Integer.parseInt(req.getParameter("maxInput"));
        System.out.println(productId + " " + quantity + " " + minInput + " " + maxInput);
        InventoryService inventoryService = new InventoryService();

        ImportExportService importExportService = new ImportExportService();
        try {
            inventoryService.updateQuantityInventory(productId, quantity, minInput, maxInput);
            importExportService.updateInventoryStatus(productId);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("{\"message\":\"Cập nhật kho  thành công.\"}");
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write("{\"error\": \"Có lỗi xảy ra khi cập nhật kho.\"}");
        }
    }
}