package hcmuaf.nlu.edu.vn.controller.admin.inventory;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Inventory;
import hcmuaf.nlu.edu.vn.service.InventoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/unsold_products")
public class UnsoldProductsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String day = req.getParameter("date");
        List<Inventory> list;
        int days = Integer.parseInt(day);

        InventoryService inventoryService = new InventoryService();
        list= inventoryService.getUnsoldInventory(days);


        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        new Gson().toJson(list, resp.getWriter());

    }
}
