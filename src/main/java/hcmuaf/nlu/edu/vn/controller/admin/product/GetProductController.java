package hcmuaf.nlu.edu.vn.controller.admin.product;

import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "GetProductController", value = "/products-list")
public class GetProductController extends HttpServlet {
    private final ProductService productService;

    public GetProductController() {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Lấy tham số "all" từ request
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null || (!user.getRole().equals("admin") && !user.getRole().equals("owner"))) {
            response.sendRedirect(request.getContextPath() + "/logout");
            return;
        }
        String name = request.getParameter("name");
        try {
            List<Product> products = productService.getAllProducts();
            // Mở modal
            String action = request.getParameter("action");
            if ("show".equals(action)) {
                request.setAttribute("showModal", true);
            }
            // Truyền danh sách sản phẩm vào request để hiển thị trong JSP
            request.setAttribute("products", products);
            request.getRequestDispatcher("/admin/pages/products.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}