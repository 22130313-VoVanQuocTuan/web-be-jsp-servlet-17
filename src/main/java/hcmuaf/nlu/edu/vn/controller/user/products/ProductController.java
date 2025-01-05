package hcmuaf.nlu.edu.vn.controller.user.products;

import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.model.Promotionals;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
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
        List<Product> products = null;
        List<Promotionals> list = null;
        String search = request.getParameter("search");
        String name = request.getParameter("name");
        try {
            products = productService.getAllProducts();
            list = productService.getListPromotional();
            if(search != null && !search.isEmpty()) {
                products = productService.getListProductByName(name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        HttpSession session = request.getSession();
        // Truyền danh sách sản phẩm vào request để hiển thị trong JSP
        session.setAttribute("promotionals", list);
        request.setAttribute("products", products);
        request.getRequestDispatcher("users/page/product.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}