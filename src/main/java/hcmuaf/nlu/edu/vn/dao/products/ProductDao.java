package hcmuaf.nlu.edu.vn.dao.products;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private DBConnect dbConnect;

    public ProductDao() {
        this.dbConnect = new DBConnect();
    }

    public List<Product> getAllProducts() throws SQLException {
        String sql = "SELECT * FROM products";
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            List<Product> products = new ArrayList<>();
            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("name"));
                product.setImageUrl(rs.getString("imageUrl"));
                product.setPrice(rs.getDouble("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setView(rs.getInt("view"));
                product.setSoldCount(rs.getInt("soldCount"));
                product.setDiscountPercent(rs.getDouble("discountPercent") * 100);
                product.setDiscountPrice(product.getPrice() - (product.getPrice() * product.getDiscountPercent() / 100));
                products.add(product);
            }
            return products;
        }
    }

    // Lấy ra sản phẩm cảu danh mục dựa vào categoryID

    public List<Product> getAllProductsCategory(int categoryId) throws SQLException {
        String sql = "SELECT * FROM products WHERE categoryId = ?";
        List<Product> products = new ArrayList<>();

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            if (stmt == null) {
                throw new SQLException("Failed to create PreparedStatement");
            }
            stmt.setInt(1, categoryId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setName(rs.getString("name"));
                    product.setImageUrl(rs.getString("imageUrl"));
                    product.setPrice(rs.getDouble("price"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setView(rs.getInt("view"));
                    product.setSoldCount(rs.getInt("soldCount"));
                    product.setDiscountPercent(rs.getDouble("discountPercent")* 100);
                    product.setDiscountPrice(product.getPrice() - (product.getPrice() * product.getDiscountPercent() / 100));
                    products.add(product);
                }
            }
        }
        return products;
    }
}
