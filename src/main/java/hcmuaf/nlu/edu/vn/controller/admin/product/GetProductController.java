package hcmuaf.nlu.edu.vn.controller.admin.product;

import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GetProductController", value = "/products-list")
public class GetProductController extends HttpServlet {
    private final ProductService productService;

    public GetProductController() {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = null;
        // Lấy tham số "all" từ request
        String all = request.getParameter("all");
        try {
            // Nếu all=true thì lấy tất cả sản phẩm, ngược lại lấy 10 sản phẩm đầu
            if ("true".equalsIgnoreCase(all)) {
                products = productService.getAllProducts(); // Lấy tất cả sản phẩm
            } else {
                products = productService.getTopProducts(10); // Lấy 10 sản phẩm đầu
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Truyền danh sách sản phẩm vào request để hiển thị trong JSP
        request.setAttribute("products", products);
        request.getRequestDispatcher( "/admin/pages/products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }

}