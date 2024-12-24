package hcmuaf.nlu.edu.vn.controller.admin.product;

import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteProductController", value = "/delete-product")
public class DeleteProductController extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && productService.deleteProduct(id)) {
            response.sendRedirect("products-list");
        } else {
            // Nếu có lỗi, hiển thị thông báo lỗi và quay lại trang products.jsp
            request.setAttribute("error", "Xóa sản phẩm thất bại");
            request.getRequestDispatcher("/admin/pages/products.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}