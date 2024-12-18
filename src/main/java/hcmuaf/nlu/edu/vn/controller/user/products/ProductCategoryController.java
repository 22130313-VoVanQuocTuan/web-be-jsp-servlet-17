package hcmuaf.nlu.edu.vn.controller.user.products;

import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductControllerCategory", value = "/product-category")
public class ProductCategoryController extends HttpServlet {
    private ProductService productService = new ProductService();
    public ProductCategoryController() {
        this.productService = new ProductService();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy categoryId từ request
        String categoryIdParam = request.getParameter("categoryId");
        int categoryId;


        try {
            categoryId = Integer.parseInt(categoryIdParam);
        } catch (NumberFormatException | NullPointerException e) {
            // Chuyển hướng về trang chủ hoặc hiển thị thông báo lỗi
            response.sendRedirect("/home-page");
            return;
        }
        try {
            categoryId = Integer.parseInt(categoryIdParam);
        } catch (NumberFormatException | NullPointerException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid categoryId");
            return;
        }
        try {
            // Lấy danh sách sản phẩm theo danh mục
            List<Product> products = productService.getAllProductsCategory(categoryId);
            request.setAttribute("products", products);
            // Forward đến JSP
            request.setAttribute("categoryId", categoryId);
            request.getRequestDispatcher("/users/page/product.jsp").forward(request, response);
        } catch (SQLException e) {
            // Xử lý lỗi truy vấn cơ sở dữ liệu
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}