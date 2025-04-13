package hcmuaf.nlu.edu.vn.controller.user.products;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Category;
import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/product-category")
public class ProductCategoryController extends HttpServlet {
    private ProductService productService = new ProductService();

    public ProductCategoryController() {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Lấy categoryId từ request
        String categoryIdParam = request.getParameter("categoryId");
        Map<String, Object> data = new HashMap<>();

        try {
            // Nếu không có categoryId, chỉ trả về danh sách danh mục
            if (categoryIdParam == null || categoryIdParam.trim().isEmpty()) {
                List<Category> categories = productService.getAllCategories();
                data.put("categories", categories);
            } else {
                // Nếu có categoryId, trả về cả sản phẩm và danh mục
                int categoryId = parseCategoryId(categoryIdParam, response);
                if (categoryId == -1) return;

                List<Product> products = productService.getAllProductsCategory(categoryId);
                List<Category> categories = productService.getAllCategories();

                data.put("products", products);
                data.put("categories", categories);
            }

            String json = new Gson().toJson(data);
            response.getWriter().write(json);
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }

    private int parseCategoryId(String categoryIdParam, HttpServletResponse response) throws IOException {
        int categoryId;
        try {
            categoryId = Integer.parseInt(categoryIdParam);
        } catch (NumberFormatException | NullPointerException e) {
            // Nếu categoryId không hợp lệ, trả về -1 và gửi thông báo lỗi
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid categoryId");
            return -1;
        }
        return categoryId;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}