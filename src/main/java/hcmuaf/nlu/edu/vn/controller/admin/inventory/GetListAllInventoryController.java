package hcmuaf.nlu.edu.vn.controller.admin.inventory;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Inventory;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.InventoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/inventory-list")
public class GetListAllInventoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        InventoryService service = new InventoryService();

        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null || (!user.getRole().equals("admin") && !user.getRole().equals("owner"))) {
            resp.sendRedirect(req.getContextPath() + "/logout");
            return;
        }

        try {
            List<Inventory> list;

                 // Nếu không có ngày (mặc định), lấy toàn bộ sản phẩm
                list = service.getAllInventory();
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                Gson gson = new Gson();
                String json = gson.toJson(list);
                resp.getWriter().write(json);



        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}