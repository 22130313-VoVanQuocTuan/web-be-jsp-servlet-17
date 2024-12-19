package hcmuaf.nlu.edu.vn.dao.products;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Product;

import java.sql.Connection;
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
        product.setDiscountPercent(rs.getDouble("discountPercent") * 100);
        product.setDiscountPrice(product.getPrice() - (product.getPrice() * product.getDiscountPercent() / 100));
        product.setCreateDate(rs.getTimestamp("createDate"));
        return product;
    }
}

