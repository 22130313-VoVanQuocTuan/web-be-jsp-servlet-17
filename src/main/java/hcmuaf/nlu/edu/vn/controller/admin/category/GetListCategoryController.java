package hcmuaf.nlu.edu.vn.controller.admin.category;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import hcmuaf.nlu.edu.vn.model.Category;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "ListCategory", value = "/category")
public class GetListCategoryController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        try {
            HttpSession session = req.getSession();
            Users user = (Users) session.getAttribute("user");
            if (user == null || (!user.getRole().equals("admin") && !user.getRole().equals("owner"))) {
                resp.sendRedirect(req.getContextPath() + "/logout");
                return;
            }

            CategoryService categoryService = new CategoryService();
            List<Category> list = categoryService.getAllCategory();

            // Truyền danh sách sản phẩm vào request để hiển thị trong JSP
            Gson gson = new GsonBuilder()
                    .setDateFormat("yyyy-MM-dd HH:mm:ss")
                    .create();
            String json = gson.toJson(list);
            resp.getWriter().write(json);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
