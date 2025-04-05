package hcmuaf.nlu.edu.vn.controller.admin.ImportExportStock;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Import_Export_Stock;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/listImportExportStock")
public class GetListImportExportController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        ImportExportService service = new ImportExportService();
        List<Import_Export_Stock> list = new ArrayList<>();
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null || (!user.getRole().equals("admin") && !user.getRole().equals("owner"))) {
            resp.sendRedirect(req.getContextPath() + "/logout");
            return;
        }

        try {
            list = service.getListAllImportExportStock(); // Lấy danh sách
           Gson gson = new Gson();
           String json = gson.toJson(list);

           resp.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("{\"error\": \"Có lỗi xảy ra khi cập nhật kho.\"}");

        }
        }
}
