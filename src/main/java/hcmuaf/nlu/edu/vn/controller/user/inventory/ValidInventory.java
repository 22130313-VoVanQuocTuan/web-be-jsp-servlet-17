package hcmuaf.nlu.edu.vn.controller.user.inventory;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.dao.inventory.InventoryDao;
import hcmuaf.nlu.edu.vn.service.InventoryService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ValidInventory", value = "/check-inventory")
public class ValidInventory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InventoryService service = new InventoryService();
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String productName = request.getParameter("productName");
        int availableQuantity = service.quantityInventory(productId); // Lấy tồn kho hiện tại
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        boolean check = service.isValidInventory(productId, quantity);
        Map<String, Object> result = new HashMap<>();
        result.put("check", check);
        result.put("availableQuantity", availableQuantity);
        result.put("productName", productName);
        if (check) {
            result.put("status", "success");
            result.put("availableQuantity", availableQuantity);
            result.put("productName", productName);
        } else {
            result.put("status", "error");
            result.put("message", "Số lượng mua vượt quá hàng tồn kho");
        }
        String json = new Gson().toJson(result);
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}