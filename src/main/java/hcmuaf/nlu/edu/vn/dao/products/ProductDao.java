package hcmuaf.nlu.edu.vn.dao.products;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Category;
import hcmuaf.nlu.edu.vn.model.Product;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDao {
    private DBConnect dbConnect;

    public ProductDao() {
        this.dbConnect = new DBConnect();
    }

    // lấy ra danh sách tất cả sản phẩm
    public List<Product> getAllProducts() throws SQLException {
        String sql = "SELECT * FROM products p JOIN inventory i ON p.id = i.productId WHERE p.isDeleted = FALSE";
        List<Product> products = new ArrayList<>();

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        }
        return products;
    }
    public List<Category> getAllCategories() throws SQLException {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM category WHERE is_deleted = false";

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                categories.add(new Category(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getTimestamp("createDate")
                ));
            }
        }
        return categories;
    }
    // Lấy ra sản phẩm của danh mục dựa vào categoryID
    public List<Product> getAllProductsCategory(int categoryId) throws SQLException {
        String sql = "SELECT * FROM products p  JOIN inventory i ON p.id = i.productId  WHERE categoryId = ?";
        List<Product> products = new ArrayList<>();

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            stmt.setInt(1, categoryId); // set categoryId =1
            if (stmt == null) {
                throw new SQLException("Failed to create PreparedStatement");
            }
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {

                    products.add(mapResultSetToProduct(rs));
                }
            }
        }
        return products;
    }

    //Hàm thêm sản phẩm
    public boolean addProduct(Product product) {
        // Giá đã giảm
        String sql = "INSERT INTO products (name, price, imageUrl, description, categoryId, " +
                "supplier, color, size, unit, view, soldCount, discountPercent, discountPrice, createDate, updateDate) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);) {
            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setString(3, product.getImageUrl());
            stmt.setString(4, product.getDescription());
            stmt.setInt(5, product.getCategoryId());
            stmt.setString(6, product.getSupplier());
            stmt.setString(7, product.getColor());
            stmt.setString(8, product.getSize());
            stmt.setString(9, product.getUnit());
            stmt.setInt(10, product.getView());
            stmt.setInt(11, product.getSoldCount());
            stmt.setDouble(12, product.getDiscountPercent());
            stmt.setDouble(13, product.getDiscountPrice());
            stmt.setTimestamp(14, product.getCreateDate());
            stmt.setTimestamp(15, product.getUpdateDate());
            // chèn data vào table
            int rowsAdded = stmt.executeUpdate();
            return rowsAdded > 0;// add thành công trả về true k vè false.
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Phương thức cập nhật sản phẩm trong cơ sở dữ liệu
    // Cập nhật thông tin sản phẩm
    public boolean updateProduct(int id, Product product) {
        String sql = "UPDATE products SET name = ?, price = ?, imageUrl = ?, description = ?, categoryId = ?,supplier = ?, color = ?, size = ?, unit = ?, view = ?, soldCount = ?, discountPercent = ?, discountPrice = ?, updateDate = ? WHERE id = ?";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) { // Đảm bảo PreparedStatement được đóng tự động
            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setString(3, product.getImageUrl());
            stmt.setString(4, product.getDescription());
            stmt.setInt(5, product.getCategoryId());
            stmt.setString(6, product.getSupplier());
            stmt.setString(7, product.getColor());
            stmt.setString(8, product.getSize());
            stmt.setString(9, product.getUnit());
            stmt.setInt(10, product.getView());
            stmt.setInt(11, product.getSoldCount());
            stmt.setDouble(12, product.getDiscountPercent());
            stmt.setDouble(13, product.getDiscountPrice());
            stmt.setTimestamp(14, new Timestamp(System.currentTimeMillis())); // Cập nhật thời gian hiện tại
            stmt.setInt(15, id); // Cập nhật ID sản phẩm

            int rowsUpdated = stmt.executeUpdate(); // Thực hiện câu lệnh SQL
            return rowsUpdated > 0; // Trả về true nếu có ít nhất 1 dòng được cập nhật
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Nếu không có dòng nào được cập nhật hoặc có lỗi xảy ra
    }
    
    // Hàm xóa sản phẩm
    public boolean deleteProduct(String id, String realPath) {
        String sql = "SELECT imageUrl FROM products WHERE id = ?";
        String imgUrl = null;
        // Bước 1: Lấy imageUrl từ cơ sở dữ liệu
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                imgUrl = rs.getString("imageUrl");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // Trả về false nếu không lấy được imgUrl
        }

        // Bước 2: Xóa ảnh nếu tồn tại
        if (imgUrl != null && !imgUrl.isEmpty()) {
            // Sử dụng realPath để lấy đường dẫn tuyệt đối đến thư mục ảnh
            String imgPath = realPath + File.separator + imgUrl;
            File imgFile = new File(imgPath);
            if (imgFile.exists()) {
                if (imgFile.delete()) {
                    System.out.println("Đã xóa ảnh: " + imgPath);
                } else {
                    System.out.println("Không thể xóa ảnh: " + imgPath);
                }
            }
        }

        // Bước 3: Cập nhật trạng thái là đã xóa (soft delete)
        String softDeleteSql = "UPDATE products SET isDeleted = TRUE WHERE id = ?";
        try (PreparedStatement stmt = dbConnect.preparedStatement(softDeleteSql)) {
            stmt.setString(1, id);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;  // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Chuyển đổi (mapping) dữ liệu từ một đối tượng ResultSet
    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setImageUrl(rs.getString("imageUrl"));
        product.setPrice(rs.getDouble("price"));
        product.setQuantity(rs.getInt("quantity"));
        product.setSupplier(rs.getString("supplier"));
        product.setColor(rs.getString("color"));
        product.setSize(rs.getString("size"));
        product.setUnit(rs.getString("unit"));
        product.setCategoryId(rs.getInt("categoryId"));
        product.setDescription(rs.getString("description"));
        product.setView(rs.getInt("view"));
        product.setSoldCount(rs.getInt("soldCount"));
        product.setStatus(rs.getString("status"));
        product.setDiscountPercent(rs.getDouble("discountPercent") * 100);
        product.setDiscountPrice(product.getPrice() - (product.getPrice() * product.getDiscountPercent() / 100));
        Timestamp createDate = rs.getTimestamp("createDate");
        if(createDate != null) {
            product.setCreateDate(createDate);
        }
        return product;
    }

    // LẤY RA SANR PHẨM THEO TÊN
    public List<Product> getListProductByName(String name) throws SQLException {
        String sql = "SELECT * FROM products p JOIN inventory i ON p.id = i.productId  WHERE name LIKE ? COLLATE utf8mb4_unicode_ci";
        List<Product> products = new ArrayList<>();
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, "%" + name + "%");
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }

        }
        return products;
    }

    // UPDATE VIEW
    public boolean updateViewProduct(int id) {
        String sql = "UPDATE products SET view = view + 1 WHERE id = ?";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            stmt.setInt(1, id);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Cập nhật số lượng bán
    public boolean updateSoldCountProduct(int id, int quantity) {
        // Sửa câu lệnh SQL: Dùng dấu phẩy để cập nhật nhiều cột
        String sql = "UPDATE products p JOIN inventory i ON p.id = i.productId SET soldCount = soldCount + ?, i.quantity = i.quantity - ? WHERE id = ?";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            stmt.setInt(1, quantity); // Tham số đầu tiên: số lượng cần cộng vào soldCount
            stmt.setInt(2, quantity); // Tham số thứ hai: số lượng cần trừ khỏi quantity
            stmt.setInt(3, id);       // Tham số thứ ba: ID sản phẩm
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;   // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getLastInsertedProductId() {
        String sql = "SELECT MAX(id) FROM products"; // Lấy ID lớn nhất (sản phẩm vừa thêm)
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Trả về -1 nếu có lỗi
    }

}


