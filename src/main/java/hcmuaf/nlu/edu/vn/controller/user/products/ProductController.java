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
        List<Promotionals> list = null;
        List<Category> categories = null;
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user != null && !user.getRole().equals("user")) {
            response.sendRedirect(request.getContextPath() + "/logout");
            return;
        }
        String search = request.getParameter("search");
        String name = request.getParameter("name");
        String ajax = request.getParameter("ajax");
        try {
            products = productService.getAllProducts();
            list = productService.getListPromotional();
            categories=productService.getAllCategories();
            if(name != null && !name.isEmpty()) {
                products = productService.getListProductByName(name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // Nếu là AJAX, trả về HTML thay vì JSON
        if ("true".equals(ajax)) {
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();

            for (Product product : products) {
                out.println("<div class='name-cart'>"
                        + "<p style='position: absolute; padding: 8px; background-color: #ff0000; z-index: 5; border-radius: 10px;'>"
                        + product.getDiscountPercent() + "%</p>"
                        + "<a href='product-detail?id=" + product.getId() + "&categoryId=" + product.getCategoryId() + "'>"
                        + "<img src='" + product.getImageUrl() + "' alt='" + product.getName() + "'></a>"
                        + "<h3><a style='color: #110ec6' href='product-detail?id=" + product.getId() + "&categoryId=" + product.getCategoryId() + "'>"
                        + product.getName() + "</a></h3>"
                        + "<p>Giá: <del>" + product.getPrice() + "₫</del></p>"
                        + "<p style='color: #ff0000;'>Giá đã giảm: " + product.getDiscountPrice() + "₫</p>"
                        + "<p>Giảm giá: " + product.getDiscountPercent() + "%</p>"
                        + "<span style='margin-left: 10px;'><i class='fas fa-eye'></i> <span style='font-size: 0.9em;'>" + product.getView() + "</span></span>"
                        + "<span style='margin-left: 20px;'><i class='fas fa-shopping-cart'></i> <span style='font-size: 0.9em;'>" + product.getSoldCount() + "</span></span>"
                        + "<a href='add-cart?id=" + product.getId() + "' class='add-cart'><i class='ri-add-circle-line'></i>Thêm</a>"
                        + "</div>");
            }
        } else {

            session.setAttribute("promotionals", list);
            request.setAttribute("products", products);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("users/page/product.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}