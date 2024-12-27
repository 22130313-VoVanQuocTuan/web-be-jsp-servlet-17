package hcmuaf.nlu.edu.vn.controller.admin.category;

import hcmuaf.nlu.edu.vn.model.Category;
import hcmuaf.nlu.edu.vn.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "ListCategory", value = "/category")
public class GetListCategoryController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try{
        String showAll = req.getParameter("showAll");
        String search = req.getParameter("search");
        String name = req.getParameter("name");


        CategoryService categoryService = new CategoryService();
        List<Category> list = categoryService.getAllCategory();
        if(search!=null){
            list=categoryService.getCategory(name);

        }
        if (showAll == null) {
            // Hiển thị tối đa 10 mục
            list = list.stream().limit(10).collect(Collectors.toList());
        }
         req.setAttribute("list", list);
         req.getRequestDispatcher("/admin/pages/category.jsp").forward(req, resp);

    }catch (Exception e){
        e.printStackTrace();
        req.getRequestDispatcher("/admin/pages/category.jsp").forward(req, resp);

    }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
