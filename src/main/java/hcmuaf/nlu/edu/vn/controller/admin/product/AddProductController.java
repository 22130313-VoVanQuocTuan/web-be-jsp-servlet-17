package hcmuaf.nlu.edu.vn.controller.admin.product;

import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddProductController", value = "/add-product")
public class AddProductController extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> errorMessages = new ArrayList<>(); // Danh sách lưu trữ thông báo lỗi

        try {
            // Lấy các tham số từ form
            String name = request.getParameter("name");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantity");
            String imageUrl = request.getParameter("imageUrl");
            String description = request.getParameter("description");
            String categoryIdStr = request.getParameter("categoryId");
            String status = request.getParameter("status");
            String supplier = request.getParameter("supplier");
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            String unit = request.getParameter("unit");
            String discountPercentStr = request.getParameter("discountPercent");

            // Kiểm tra và xử lý null hoặc giá trị trống cho từng trường
            if (name == null || name.trim().isEmpty()) {
                errorMessages.add("Tên sản phẩm không được để trống!");
            }
            if (priceStr == null || priceStr.trim().isEmpty()) {
                errorMessages.add("Giá sản phẩm không được để trống!");
            }
            if (quantityStr == null || quantityStr.trim().isEmpty()) {
                errorMessages.add("Số lượng không được để trống!");
            }
            if (categoryIdStr == null || categoryIdStr.trim().isEmpty()) {
                errorMessages.add("Danh mục không được để trống!");
            }
            if (discountPercentStr == null || discountPercentStr.trim().isEmpty()) {
                discountPercentStr = "0"; // Mặc định là 0 nếu không nhập
            }

            // Chuyển đổi dữ liệu
            double price = Double.parseDouble(priceStr.trim());
            int quantity = Integer.parseInt(quantityStr.trim());
            int categoryId = Integer.parseInt(categoryIdStr.trim());
            double discountPercent = Double.parseDouble(discountPercentStr.trim());

            // Kiểm tra tỷ lệ giảm giá hợp lệ
            if (discountPercent < 0 || discountPercent > 1) {
                errorMessages.add("Tỷ lệ giảm giá không hợp lệ! Phải từ 0 đến 1.");
            }

            // Nếu có lỗi, không tiếp tục thêm sản phẩm
            if (!errorMessages.isEmpty()) {
                List<Product> products = productService.getAllProducts(); // Lấy danh sách sản phẩm mới nhất
                request.setAttribute("products", products); // Đặt danh sách sản phẩm vào request
                request.setAttribute("errors", errorMessages);
                request.getRequestDispatcher("/admin/pages/products.jsp").forward(request, response);
                return;
            }

            // Tạo giá giảm
            double discountPrice = price * (1 - discountPercent);

            // Tạo đối tượng Product
            Product product = new Product(
                    0, name, price, quantity, imageUrl, description, categoryId, status,
                    supplier, color, size, unit, 0, 0, discountPercent, discountPrice,
                    new Timestamp(System.currentTimeMillis()), new Timestamp(System.currentTimeMillis())
            );

            // Gọi ProductService để thêm sản phẩm
            boolean isAdded = productService.addProduct(product);

            // Gửi thông báo thành công hoặc thất bại
            if (isAdded) {
                request.setAttribute("message", "Thêm sản phẩm thành công!");
            } else {
                request.setAttribute("message", "Thêm sản phẩm không thành công.");
            }
        } catch (NumberFormatException e) {
            errorMessages.add("Dữ liệu nhập không hợp lệ! Vui lòng kiểm tra số lượng, giá, hoặc tỷ lệ giảm giá.");
        } catch (Exception e) {
            errorMessages.add("Lỗi: " + e.getMessage());
        }

        // Hiển thị thông báo lỗi nếu có
        if (!errorMessages.isEmpty()) {
            request.setAttribute("errors", errorMessages);
        }
        // Lấy danh sách sản phẩm mới nhất từ cơ sở dữ liệu
        List<Product> products = null;
        try {
            products = productService.getAllProducts();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("products", products);

        // Chuyển hướng về trang sản phẩm
        request.getRequestDispatcher("/admin/pages/products.jsp").forward(request, response);
    }


}
