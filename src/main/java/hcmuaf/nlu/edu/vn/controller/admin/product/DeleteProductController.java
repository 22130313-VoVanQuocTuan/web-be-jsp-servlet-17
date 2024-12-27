package hcmuaf.nlu.edu.vn.controller.admin.product;

import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;

@WebServlet(name = "DeleteProductController", value = "/delete-product")
public class DeleteProductController extends HttpServlet {
    private final ProductService productService = new ProductService();
    private static final String UPLOAD_DIRECTORY = "users/img"; // Đảm bảo rằng thư mục này nằm trong thư mục gốc của frontend

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String all = request.getParameter("all");

        //Truyền ServletContext vào productService
        String realPath = getServletContext().getRealPath("")+ File.separator + UPLOAD_DIRECTORY;

        if (id != null && productService.deleteProduct(id,realPath)) {
            // Nếu có tham số "all", chuyển hướng đến trang "products-list" với all=true để xem tất cả sản phẩm
            if ("true".equalsIgnoreCase(all)) {
                response.sendRedirect("products-list?all=true");
            } else {
                // Nếu không có tham số "all", chuyển hướng đến trang "products-list" với 10 sản phẩm đầu tiên
                response.sendRedirect("products-list");
            }
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