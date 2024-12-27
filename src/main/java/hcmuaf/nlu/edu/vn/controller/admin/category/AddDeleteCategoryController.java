package hcmuaf.nlu.edu.vn.controller.admin.category;

import hcmuaf.nlu.edu.vn.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebServlet(name = "AddDelete" , value = "/add-delete-category")
public class AddDeleteCategoryController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryService categoryService = new CategoryService();
        String action = req.getParameter("action");
        if("delete".equals(action)){
            int id = Integer.parseInt(req.getParameter("id"));
            categoryService.deleteCategory(id);
            resp.sendRedirect(req.getContextPath()+"/category");
            return;
        }

        String name = req.getParameter("name");
        if(categoryService.addCategory(name)){
            resp.sendRedirect(req.getContextPath()+"/category");
        }
        else{
            req.setAttribute("error", "có lỗi xảy ra vui lòng thử lại");
            req.getRequestDispatcher("/category").forward(req, resp);
        }



    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
