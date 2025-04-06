package hcmuaf.nlu.edu.vn.controller.admin.category;

import java.io.IOException;
import java.io.PrintWriter;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.CategoryService;
import hcmuaf.nlu.edu.vn.util.logUtil.LogLevel;
import hcmuaf.nlu.edu.vn.util.logUtil.LogUtilDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AddCategory", value = "/add-category")
public class AddCategoryController extends HttpServlet {
    private final LogUtilDao logUtilDao = new LogUtilDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        CategoryService categoryService = new CategoryService();
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        String name = req.getParameter("name");

        try {
            if (name != null && !name.trim().isEmpty()) {
                // Trường hợp thêm mới danh mục
                PrintWriter out = resp.getWriter();
                if (categoryService.addCategory(name)) {
                    out.println("{\"message\": \"Thêm thành công.\"}");
                    out.flush();
                    logUtilDao.log(LogLevel.INFO, user.getUsername(), req.getRemoteAddr(), name, "Danh mục đã được thêm");
                }
                else {
                    out.println("{\"error\": true, \"message\": \"Tên danh mục đã tồn tại.\"}");
                    out.flush();
                }
            } else {
                // Trường hợp dữ liệu không hợp lệ
                PrintWriter out = resp.getWriter();
                out.println("{\"error\": true, \"message\": \"Dữ liệu không hợp lệ.\"}");
                out.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý lỗi nếu có
            PrintWriter out = resp.getWriter();
            out.println("{\"error\": true, \"message\": \"Đã xảy ra lỗi hệ thống.\", \"details\": \"" + e.getMessage() + "\"}");
            out.flush();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}