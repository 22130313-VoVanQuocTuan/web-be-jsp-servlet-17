package hcmuaf.nlu.edu.vn.controller.user.products;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductFilterController", value = "/product-filter")
public class ProductFilterController extends HttpServlet {

    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String filter = request.getParameter("filter");
        String categoryIdParam = request.getParameter("categoryId");
        System.out.println(categoryIdParam);

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user != null && !user.getRole().equals("user")) {
            response.sendRedirect(request.getContextPath() + "/logout");
            return;
        }
        List<Product> products = new ArrayList<>();
        try {
            // Kiểm tra và thực hiện lọc theo tham số "filter"
            if (filter == null) {
                // Nếu không có filter, hiển thị tất cả sản phẩm (mặc định)
                products = productService.getAllProducts();
            } else {
                switch (filter) {
                    case "popular":
                        // Nếu có categoryId, lọc theo categoryId
                        if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                            int categoryId = Integer.parseInt(categoryIdParam);
                            products = productService.getPopularProductsByCategory(categoryId); // Lọc sản phẩm theo categoryId
                        } else {
                            products = productService.getPopularProducts();
                        }
                        break;
                    case "newest":
                        if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                            int categoryId = Integer.parseInt(categoryIdParam);
                            products = productService.getNewestProductsByCategory(categoryId); // Lọc sản phẩm theo categoryId
                        } else {
                            products = productService.getNewestProducts();
                        }
                        break;
                    case "priceDesc":
                        if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                            int categoryId = Integer.parseInt(categoryIdParam);
                            products = productService.getProductsByPriceDescendingAndCategoryId(categoryId); // Lọc sản phẩm theo categoryId
                        } else {
                            products = productService.getProductsByPriceDescending();
                        }
                        break;
                    case "priceAsc":
                        if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                            int categoryId = Integer.parseInt(categoryIdParam);
                            products = productService.getProductsByPriceAscendingAndCategoryId(categoryId); // Lọc sản phẩm theo categoryId
                        } else {
                            products = productService.getProductsByPriceAscending();
                        }
                        break;

                    default:
                        // Trường hợp không hợp lệ, trả về tất cả sản phẩm
                        products = productService.getAllProducts();
                        break;
                }
            }
            if (products.isEmpty()) {
                request.setAttribute("message", "Không có sản phẩm nào theo bộ lọc này.");
            }

            // Trả về danh sách sản phẩm dưới dạng JSON
            response.getWriter().write(new Gson().toJson(products));  // Sử dụng Gson để chuyển đổi danh sách thành JSON

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi lấy sản phẩm từ cơ sở dữ liệu");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý POST nếu cần
    }
}