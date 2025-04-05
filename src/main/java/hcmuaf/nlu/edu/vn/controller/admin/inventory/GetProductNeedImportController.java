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

@WebServlet("/import_need_products")
public class GetProductNeedImportController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        InventoryService service = new InventoryService();
        List<Inventory> list = null;
        try {
            list = service.getProductNeedImport();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            new Gson().toJson(list, resp.getWriter());
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
