package hcmuaf.nlu.edu.vn.controller.user.products;

import hcmuaf.nlu.edu.vn.model.Category;
import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.model.Promotionals;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.ProductService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private final ProductService productService;

    public ProductController() {
        this.productService = new ProductService();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products;

        try {
            products = productService.getAllProducts();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            Gson gson = new Gson();
            String json = gson.toJson(products);
            PrintWriter out = response.getWriter();
            out.println(json);
        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}