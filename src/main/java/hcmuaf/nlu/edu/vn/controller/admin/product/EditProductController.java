package hcmuaf.nlu.edu.vn.controller.admin.product;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.InventoryService;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;

@MultipartConfig
@WebServlet(name = "EditProductController ", value = "/edit-product")
public class EditProductController extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        DBConnect dbConnect = new DBConnect();
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String discountPercent = request.getParameter("discountPercent");
            String supplier = request.getParameter("supplier");
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            String unit = request.getParameter("unit");
            String description = request.getParameter("description");



            // Kiểm tra và gán giá trị mặc định cho các trường nếu là null hoặc rỗng
            if (supplier == null || supplier.trim().isEmpty()) {
                supplier = "";
            }
            if (color == null || color.trim().isEmpty()) {
                color = "";
            }
            if (size == null || size.trim().isEmpty()) {
                size = "";
            }
            if (description == null || description.trim().isEmpty()) {
                description = "";
            }
            if (unit == null || unit.trim().isEmpty()) {
                unit = "";
            }

            if (discountPercent == null || discountPercent.trim().isEmpty()) {
                discountPercent = "0"; // Mặc định là 0 nếu không nhập
            }
            double discountPercents = Double.parseDouble(discountPercent.trim())*100;
            double discountPrice = discountPercents * price;
            System.out.println("discountPercent : " + discountPercents);
            System.out.println("discountPrice: " + discountPrice);

            String imageUrl = request.getParameter("currentImageUrl"); // Lấy URL ảnh cũ nếu không có ảnh mới
            Part imagePart = request.getPart("imageUrl");

            Product updateProduct = new Product(productId, name, price, imageUrl, description, categoryId, supplier, color, size, unit, discountPercents, discountPrice);
            InventoryService inventoryService = new InventoryService();
            inventoryService.updateNameProduct(productId, name);

            if (imagePart != null && imagePart.getSize() > 0) {
                // Có ảnh mới → lưu lại ảnh
                String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "users" + File.separator + "img";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                File file = new File(uploadPath + File.separator + fileName);
                imagePart.write(file.getAbsolutePath());
                imageUrl = "users/img/" + fileName;
            }

            ProductService productService = new ProductService();
            try {
                // Cập nhật sản phẩm với hình ảnh mới (hoặc cũ nếu không có hình ảnh mới)
                // imageUrl đến đây đã được cập nhật: nếu không có ảnh mới thì giữ lại ảnh cũ
                updateProduct.setImageUrl(imageUrl);

                // Cập nhật sản phẩm
                boolean isUpdated = productService.updateProduct(productId, updateProduct);
                System.out.println("Update product status: " + isUpdated);
                if (isUpdated) {
                    PrintWriter out = response.getWriter();
                    out.println("{\"message\": \"Cập nhât thành công.\"}");
                    out.flush();
                }
            } catch (Exception e) {
                e.printStackTrace();
                PrintWriter out = response.getWriter();
                out.println("{\"error\": true, \"message\": \"Cập nhật thất bại.\"}");
                out.flush();
            }
        } finally {
            dbConnect.closeConnection();
        }
    }
}

