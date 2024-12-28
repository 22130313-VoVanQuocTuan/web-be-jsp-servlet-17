package hcmuaf.nlu.edu.vn.dao.products;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Product;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private DBConnect dbConnect;

    public ProductDao() {
        this.dbConnect = new DBConnect();
    }

    // lấy ra danh sách tất cả sản phẩm
    public List<Product> getAllProducts() throws SQLException {
        String sql = "SELECT * FROM products";
        List<Product> products = new ArrayList<>();

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        }
        return products;
    }

    public List<Product> getTop(int limit) throws SQLException {
        String sql = "SELECT * FROM products LIMIT ?";
        try (PreparedStatement statement = dbConnect.preparedStatement(sql)) {
            statement.setInt(1, limit);
            try (ResultSet rs = statement.executeQuery()) {
                List<Product> products = new ArrayList<>();
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
                return products;
            }
        }
    }

    // Lấy ra sản phẩm của danh mục dựa vào categoryID
    public List<Product> getAllProductsCategory(int categoryId) throws SQLException {
        String sql = "SELECT * FROM products WHERE categoryId = ?";
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
        String sql = "INSERT INTO products (name, price, quantity, imageUrl, description, categoryId, status, " +
                "supplier, color, size, unit, view, soldCount, discountPercent, discountPrice, createDate, updateDate) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);) {
            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setInt(3, product.getQuantity());
            stmt.setString(4, product.getImageUrl());
            stmt.setString(5, product.getDescription());
            stmt.setInt(6, product.getCategoryId());
            stmt.setString(7, product.getStatus());
            stmt.setString(8, product.getSupplier());
            stmt.setString(9, product.getColor());
            stmt.setString(10, product.getSize());
            stmt.setString(11, product.getUnit());
            stmt.setInt(12, product.getView());
            stmt.setInt(13, product.getSoldCount());
            stmt.setDouble(14, product.getDiscountPercent());
            stmt.setDouble(15, product.getDiscountPrice());
            stmt.setTimestamp(16, product.getCreateDate());
            stmt.setTimestamp(17, product.getUpdateDate());
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
        String sql = "UPDATE products SET name = ?, price = ?, quantity = ?, imageUrl = ?, description = ?, categoryId = ?, status = ?, supplier = ?, color = ?, size = ?, unit = ?, view = ?, soldCount = ?, discountPercent = ?, discountPrice = ?, updateDate = ? WHERE id = ?";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) { // Đảm bảo PreparedStatement được đóng tự động
            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setInt(3, product.getQuantity());
            stmt.setString(4, product.getImageUrl());
            stmt.setString(5, product.getDescription());
            stmt.setInt(6, product.getCategoryId());
            stmt.setString(7, product.getStatus());
            stmt.setString(8, product.getSupplier());
            stmt.setString(9, product.getColor());
            stmt.setString(10, product.getSize());
            stmt.setString(11, product.getUnit());
            stmt.setInt(12, product.getView());
            stmt.setInt(13, product.getSoldCount());
            stmt.setDouble(14, product.getDiscountPercent());
            stmt.setDouble(15, product.getDiscountPrice());
            stmt.setTimestamp(16, new Timestamp(System.currentTimeMillis())); // Cập nhật thời gian hiện tại
            stmt.setInt(17, id); // Cập nhật ID sản phẩm

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

        // Bước 3: Xóa sản phẩm khỏi cơ sở dữ liệu
        String deleteSql = "DELETE FROM products WHERE id = ?";
        try (PreparedStatement stmt = dbConnect.preparedStatement(deleteSql)) {
            stmt.setString(1, id);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;  // Trả về true nếu xóa thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false;  // Trả về false nếu lỗi khi xóa sản phẩm
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
        product.setCategoryId(rs.getInt("categoryId"));
        product.setView(rs.getInt("view"));
        product.setSoldCount(rs.getInt("soldCount"));
        product.setStatus(rs.getString("status"));
        product.setDiscountPercent(rs.getDouble("discountPercent") * 100);
        product.setDiscountPrice(product.getPrice() - (product.getPrice() * product.getDiscountPercent() / 100));
        product.setCreateDate(rs.getTimestamp("createDate"));
        return product;
    }

    public List<Product> getListProductByName(String name) throws SQLException {
        String sql = "SELECT * FROM products WHERE name LIKE ?";
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

}


