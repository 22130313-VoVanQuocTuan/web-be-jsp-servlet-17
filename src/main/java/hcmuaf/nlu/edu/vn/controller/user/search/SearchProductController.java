package hcmuaf.nlu.edu.vn.controller.user.search;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchProductController", value = "/search-product")
public class SearchProductController extends HttpServlet {
    private final ProductService productService = new ProductService(); // bạn đã có

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try {
            List<Product> products = productService.getListProductByName(name);
            Gson gson = new Gson();
            String json = gson.toJson(products);
            resp.getWriter().write(json);
        } catch (SQLException e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"error\": \"Lỗi hệ thống\"}");
        }
    }
}


