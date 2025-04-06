package hcmuaf.nlu.edu.vn.controller.admin.product;

import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.ProductService;
import hcmuaf.nlu.edu.vn.util.logUtil.LogLevel;
import hcmuaf.nlu.edu.vn.util.logUtil.LogUtilDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "DeleteProductController", value = "/delete-product")
public class DeleteProductController extends HttpServlet {
    private final LogUtilDao logUtilDao = new LogUtilDao();
    private final ProductService productService = new ProductService();

    private static final String UPLOAD_DIRECTORY = "users/img"; // Đảm bảo rằng thư mục này nằm trong thư mục gốc của frontend

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        System.out.println(id);

        //Truyền ServletContext vào productService
        String realPath = getServletContext().getRealPath("")+ File.separator + UPLOAD_DIRECTORY;

        if ( productService.deleteProduct(id,realPath)) {
            try {
                PrintWriter out = response.getWriter();
                out.println("{\"message\": \"Xoá thành công.\"}");
                out.flush();
                logUtilDao.log(LogLevel.WARNING, user.getUsername(), request.getRemoteAddr(), id, "Sản phẩm đã bị xóa");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        } else {
            // Nếu có lỗi, hiển thị thông báo lỗi và quay lại trang products.jsp
            PrintWriter out = response.getWriter();
            out.println("{\"error\": true, \"message\": \"Xóa thất bại.\"}");
            out.flush();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}