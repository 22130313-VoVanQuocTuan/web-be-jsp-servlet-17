//package hcmuaf.nlu.edu.vn.controller.admin.product;
//
//import hcmuaf.nlu.edu.vn.model.Inventory;
//import hcmuaf.nlu.edu.vn.model.Product;
//import hcmuaf.nlu.edu.vn.service.InventoryService;
//import hcmuaf.nlu.edu.vn.service.ProductService;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//
//import java.io.File;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.SQLException;
//import java.sql.Timestamp;
//import java.util.ArrayList;
//import java.util.List;
//
//@WebServlet(name = "AddProductController", value = "/add-product")
//@MultipartConfig(maxFileSize = 10485760, // 10MB
//        maxRequestSize = 20971520, // 20MB
//        fileSizeThreshold = 0 // Kích thước tối thiểu của tệp khi được chuyển vào bộ nhớ
//)
//public class AddProductController extends HttpServlet {
//    private final ProductService productService = new ProductService();
//    private static final String UPLOAD_DIRECTORY = "users/img"; // Đảm bảo rằng thư mục này nằm trong thư mục gốc của frontend
//
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json");
//        List<String> errorMessages = new ArrayList<>(); // Danh sách lưu trữ thông báo lỗi
//        String imageUrl = ""; // Biến lưu đường dẫn ảnh
//        try {
//            // Lấy phần file ảnh từ form
//            Part filePart = request.getPart("imageUrl"); // Lấy phần "image" từ form
//            String fileName = getFileName(filePart);
//
//            // Kiểm tra nếu có file ảnh được tải lên
//            if (fileName != null && !fileName.isEmpty()) {
//                // Đảm bảo thư mục lưu ảnh đã tồn tại
//                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
//                File uploadDir = new File(uploadPath);
//                if (!uploadDir.exists()) {
//                    uploadDir.mkdirs(); // Tạo thư mục nếu chưa tồn tại
//                }
//                System.out.println("Upload path: " + uploadPath); // Kiểm tra đường dẫn
//
//                // Tạo đối tượng File và lưu ảnh vào thư mục
//                File file = new File(uploadPath + File.separator + fileName);
//                filePart.write(file.getAbsolutePath()); // Lưu file vào thư mục gốc của frontend
//                imageUrl = UPLOAD_DIRECTORY + "/" + fileName; // Lưu đường dẫn ảnh vào CSDL
//            }
//
//            // Lấy các tham số từ form
//            String name = request.getParameter("name");
//            String priceStr = request.getParameter("price");
//            String quantityStr = request.getParameter("quantity");
//            String description = request.getParameter("description");
//            String categoryIdStr = request.getParameter("categoryId");
//            String supplier = request.getParameter("supplier");
//            String color = request.getParameter("color");
//            String size = request.getParameter("size");
//            String unit = request.getParameter("unit");
//            int minimumQuantity = Integer.parseInt(request.getParameter("minimumQuantity"));
//            int maximumQuantity = Integer.parseInt(request.getParameter("maximumQuantity"));
//            String discountPercentStr = request.getParameter("discountPercent");
//
//
//            // Kiểm tra và xử lý null hoặc giá trị trống cho từng trường
//            if (name == null || name.trim().isEmpty()) {
//                errorMessages.add("Tên sản phẩm không được để trống!");
//            }
//            if (priceStr == null || priceStr.trim().isEmpty()) {
//                errorMessages.add("Giá sản phẩm không được để trống!");
//            }
//            if (quantityStr == null || quantityStr.trim().isEmpty()) {
//                errorMessages.add("Số lượng không được để trống!");
//            }
//            if (categoryIdStr == null || categoryIdStr.trim().isEmpty()) {
//                errorMessages.add("Danh mục không được để trống!");
//            }
//            if (discountPercentStr == null || discountPercentStr.trim().isEmpty()) {
//                discountPercentStr = "0"; // Mặc định là 0 nếu không nhập
//            }
//
//            // Nếu có lỗi, không tiếp tục thêm sản phẩm
//            if (!errorMessages.isEmpty()) {
//                request.setAttribute("errors", errorMessages);
//                request.getRequestDispatcher("/products-list").forward(request, response);
//                return;
//            }
//            // Chuyển đổi dữ liệu
//            double price = Double.parseDouble(priceStr.trim());
//            int quantity = Integer.parseInt(quantityStr.trim());
//            int categoryId = Integer.parseInt(categoryIdStr.trim());
//            double discountPercent = Double.parseDouble(discountPercentStr.trim());
//
//            // Kiểm tra tỷ lệ giảm giá hợp lệ
//            if (discountPercent < 0 || discountPercent > 1) {
//                errorMessages.add("Tỷ lệ giảm giá không hợp lệ! Phải từ 0 đến 1.");
//            }
//            // Tạo giá giảm
//            double discountPrice = price * (1 - discountPercent);
//
//            // Tạo đối tượng Product
//            Product product = new Product(0, name, price, imageUrl, description, categoryId, supplier, color, size, unit, 0, 0, discountPercent, discountPrice, new Timestamp(System.currentTimeMillis()), new Timestamp(System.currentTimeMillis()));
//
//            // Gọi ProductService để thêm sản phẩm
//            boolean isAdded = productService.addProduct(product);
//
//            if (isAdded) {
//                // Lấy productId vừa được thêm từ database
//                int productId = productService.getLastInsertedProductId(); // Viết thêm hàm này trong ProductService
//                String status = "";
//                if (quantity == 0) {
//                    status = "Hết hàng";
//                } else if (quantity > 0) {
//                    status = "Còn hàng";
//                }
//
//                // Tạo đối tượng Inventory
//                Inventory inventory = new Inventory(productId, name, quantity, status, minimumQuantity, maximumQuantity);
//                // Thêm vào tồn kho
//                InventoryService inventoryService = new InventoryService();
//                inventoryService.addInventory(inventory);
//
//                PrintWriter out = response.getWriter();
//                out.println("{\"message\": \"Thêm sản phẩm thành công.\"}");
//                out.flush();
//
//
//            } else {
//                PrintWriter out = response.getWriter();
//                out.println("{\"error\": true, \"message\": \"Thêm sản phẩm thất bại.\"}");
//                out.flush();
//            }
//        } catch (NumberFormatException e) {
//            errorMessages.add("Dữ liệu nhập không hợp lệ! Vui lòng kiểm tra số lượng, giá, hoặc tỷ lệ giảm giá.");
//        } catch (Exception e) {
//            errorMessages.add("Lỗi: " + e.getMessage());
//        }
//        // Hiển thị thông báo lỗi nếu có
//        if (!errorMessages.isEmpty()) {
//            request.setAttribute("errors", errorMessages);
//        }
//        // Chuyển hướng về trang sản phẩm
//        request.getRequestDispatcher("/products-list").forward(request, response);
//    }
//
//    // Lấy tên file từ Part
//    private String getFileName(Part part) {
//        String contentDisposition = part.getHeader("content-disposition");
//        for (String cd : contentDisposition.split(";")) {
//            if (cd.trim().startsWith("filename")) {
//                String fileName = cd.substring(cd.indexOf("=") + 2, cd.length() - 1);
//                return fileName;
//            }
//        }
//        return null;
//    }
//
//
//}
package hcmuaf.nlu.edu.vn.controller.admin.product;

import hcmuaf.nlu.edu.vn.model.Inventory;
import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.InventoryService;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddProductController", value = "/add-product")
@MultipartConfig(maxFileSize = 10485760, // 10MB
        maxRequestSize = 20971520, // 20MB
        fileSizeThreshold = 0 // Kích thước tối thiểu của tệp khi được chuyển vào bộ nhớ
)
public class AddProductController extends HttpServlet {
    private final ProductService productService = new ProductService();
    private static final String UPLOAD_DIRECTORY = "users/img"; // Đảm bảo rằng thư mục này nằm trong thư mục gốc của frontend

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String imageUrl = ""; // Biến lưu đường dẫn ảnh
        try {
            // Lấy phần file ảnh từ form
            Part filePart = request.getPart("productImage"); // Lấy phần "image" từ form
            String fileName = getFileName(filePart);

            // Kiểm tra nếu có file ảnh được tải lên
            if (fileName != null && !fileName.isEmpty()) {
                // Đảm bảo thư mục lưu ảnh đã tồn tại
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs(); // Tạo thư mục nếu chưa tồn tại
                }

                // Tạo đối tượng File và lưu ảnh vào thư mục
                File file = new File(uploadPath + File.separator + fileName);
                filePart.write(file.getAbsolutePath()); // Lưu file vào thư mục gốc của frontend
                imageUrl = UPLOAD_DIRECTORY + "/" + fileName; // Lưu đường dẫn ảnh vào CSDL
            }

            // Lấy các tham số từ form
            String name = request.getParameter("name");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantity");
            String description = request.getParameter("description");
            String categoryIdStr = request.getParameter("categoryId");
            String supplier = request.getParameter("supplier");
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            String unit = request.getParameter("unit");
            int minimumQuantity = Integer.parseInt(request.getParameter("minimumQuantity"));
            int maximumQuantity = Integer.parseInt(request.getParameter("maximumQuantity"));
            String discountPercentStr = request.getParameter("discountPercent");

            if (discountPercentStr == null || discountPercentStr.trim().isEmpty()) {
                discountPercentStr = "0"; // Mặc định là 0 nếu không nhập
            }

            // Chuyển đổi dữ liệu
            double price = Double.parseDouble(priceStr.trim());
            int quantity = Integer.parseInt(quantityStr.trim());
            int categoryId = Integer.parseInt(categoryIdStr.trim());
            double discountPercent = Double.parseDouble(discountPercentStr.trim());

            // Tạo giá giảm
            double discountPrice = price * (1 - discountPercent);

            // Tạo đối tượng Product
            Product product = new Product(0, name, price, imageUrl, description, categoryId, supplier, color, size, unit, 0, 0, discountPercent, discountPrice, new Timestamp(System.currentTimeMillis()), new Timestamp(System.currentTimeMillis()));

            // Gọi ProductService để thêm sản phẩm
            boolean isAdded = productService.addProduct(product);

            if (isAdded) {
                // Lấy productId vừa được thêm từ database
                int productId = productService.getLastInsertedProductId(); // Viết thêm hàm này trong ProductService

                String status = "";
                if (quantity == 0) {
                    status = "Hết hàng";
                } else if (quantity > 0) {
                    status = "Còn hàng";
                }
                // Tạo đối tượng Inventory
                Inventory inventory = new Inventory(productId, name, quantity, status, minimumQuantity, maximumQuantity);
                // Thêm vào tồn kho
                InventoryService inventoryService = new InventoryService();
                inventoryService.addInventory(inventory);

                PrintWriter out = response.getWriter();
                out.println("{\"message\": \"Thêm sản phẩm thành công.\"}");
                out.flush();
            } else {
                PrintWriter out = response.getWriter();
                out.println("{\"error\": true, \"message\": \"Thêm sản phẩm thất bại.\"}");
                out.flush();
            }
        } catch (NumberFormatException e) {
            PrintWriter out = response.getWriter();
            out.print("{\"error\": true, \"message\": \"Dữ liệu nhập không hợp lệ! Vui lòng kiểm tra số lượng, giá, hoặc tỷ lệ giảm giá.\"}");
            out.flush();
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.print("{\"error\": true, \"message\": \"Dữ liệu nhập không hợp lệ! Vui lòng kiểm tra số lượng, giá, hoặc tỷ lệ giảm giá.\"}");
            out.flush();
        }

    }

    // Lấy tên file từ Part
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String cd : contentDisposition.split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf("=") + 2, cd.length() - 1);
                return fileName;
            }
        }
        return null;
    }
}
