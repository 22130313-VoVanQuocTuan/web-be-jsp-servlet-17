package hcmuaf.nlu.edu.vn.dao.products;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductFilterDao {
    private DBConnect dbConnect;

    public ProductFilterDao() {
        this.dbConnect = new DBConnect();
    }

    // ----------------- Filter ------------------------------
    // Phương thức lấy sản phẩm phổ biến (được sắp xếp theo số lượng bán)
    public List<Product> getPopularProducts() throws SQLException {
        String sql = "SELECT * FROM products ORDER BY soldCount DESC";
        List<Product> products = new ArrayList<>();
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Product product = mapResultSetToProduct(rs); // Dùng phương thức mapping
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi SQL: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }

    // Phương thức lấy sản phẩm mới nhất (được sắp xếp theo ngày tạo)
    public List<Product> getNewestProducts() throws SQLException {
        String sql = "SELECT * FROM products ORDER BY createDate DESC";
        List<Product> products = new ArrayList<>();
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Product product = mapResultSetToProduct(rs); // Dùng phương thức mapping
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi SQL: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }

    // Lấy ra sản phẩm của danh mục với bộ lọc giá cao đến thấp-giảm dần (theo price)
    public List<Product> getProductsByPriceDescending() throws SQLException {
        String sql = "SELECT * FROM products ORDER BY price DESC";
        List<Product> products = new ArrayList<>();
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Product product = mapResultSetToProduct(rs); // Dùng phương thức mapping
                products.add(product);
            }
        } catch (SQLException e) {
            // Xử lý lỗi
            System.out.println("Lỗi SQL: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }

    // Lấy ra sản phẩm của danh mục với bộ lọc giá cao đến thấp-tăng dần (theo price)
    public List<Product> getProductsByPriceAscending() throws SQLException {
        String sql = "SELECT * FROM products ORDER BY price ASC";
        List<Product> products = new ArrayList<>();
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Product product = mapResultSetToProduct(rs); // Dùng phương thức mapping
                products.add(product);
            }
        } catch (SQLException e) {
            // Xử lý lỗi
            System.out.println("Lỗi SQL: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }


    //  ---------------------------  Filter theo danh mục---------------------------
    // Lấy ra sản phẩm của danh mục với bộ lọc phổ biến (theo soldCount)
    public List<Product> getPopularProductsByCategory(int categoryId) throws SQLException {
        String sql = "SELECT * FROM products WHERE categoryId = ? ORDER BY soldCount DESC";
        List<Product> products = new ArrayList<>();
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            stmt.setInt(1, categoryId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
            }
        }
        return products;
    }

    // Lấy ra sản phẩm của danh mục với bộ lọc mới nhất (theo createDate)
    public List<Product> getNewestProductsByCategory(int categoryId) throws SQLException {
        String sql = "SELECT * FROM products WHERE categoryId = ? ORDER BY createDate DESC";
        List<Product> products = new ArrayList<>();
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            stmt.setInt(1, categoryId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
            }
        }
        return products;
    }

    // Lấy ra sản phẩm của danh mục với bộ lọc giá cao đến thấp-giảm dần (theo price)
    public List<Product> getProductsByPriceDescendingAndCategoryId(int categoryId) throws SQLException {
        String sql = "SELECT * FROM products WHERE categoryId = ? ORDER BY price DESC";
        List<Product> products = new ArrayList<>();
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            stmt.setInt(1, categoryId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Product product = mapResultSetToProduct(rs); // Dùng phương thức mapping
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            // Xử lý lỗi, có thể ném lại exception
            System.out.println("Lỗi SQL: " + e.getMessage());
            e.printStackTrace();
            throw e; // Ném lại exception nếu cần thiết
        }
        return products;
    }

    public List<Product> getProductsByPriceAscendingAndCategoryId(int categoryId) throws SQLException {
        String sql = "SELECT * FROM products WHERE categoryId = ? ORDER BY price ASC";
        List<Product> products = new ArrayList<>();
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            stmt.setInt(1, categoryId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Product product = mapResultSetToProduct(rs); // Dùng phương thức mapping
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            // Xử lý lỗi, có thể ném lại exception
            System.out.println("Lỗi SQL: " + e.getMessage());
            e.printStackTrace();
            throw e; // Ném lại exception nếu cần thiết
        }
        return products;
    }



    // Chuyển đổi (mapping) dữ liệu từ một đối tượng ResultSet
    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setImageUrl(rs.getString("imageUrl"));
        product.setPrice(rs.getDouble("price"));
        product.setQuantity(rs.getInt("quantity"));
        product.setView(rs.getInt("view"));
        product.setSoldCount(rs.getInt("soldCount"));
        product.setDiscountPercent(rs.getDouble("discountPercent") * 100);
        product.setDiscountPrice(product.getPrice() - (product.getPrice() * product.getDiscountPercent() / 100));
        product.setCreateDate(rs.getTimestamp("createDate"));
        return product;
    }
}
