package hcmuaf.nlu.edu.vn.dao.products;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GetProductDao {
    private final DBConnect dbConnect;

    public GetProductDao() {
        dbConnect = new DBConnect();
    }

    public Product getProduct(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        Product product = null; // Khởi tạo giá trị ban đầu là null để kiểm tra sau
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, id); // Gán tham số id vào câu lệnh SQL
            try (ResultSet rs = ptm.executeQuery()) {
                if (rs.next()) {
                    // Nếu tìm thấy sản phẩm, tạo đối tượng Product và thiết lập các giá trị
                    product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setImageUrl(rs.getString("imageUrl"));
                    product.setDescription(rs.getString("description"));
                    product.setCategoryId(rs.getInt("categoryId"));
                    product.setStatus(rs.getString("status"));
                    product.setSupplier(rs.getString("supplier"));
                    product.setColor(rs.getString("color"));
                    product.setSize(rs.getString("size"));
                    product.setUnit(rs.getString("unit"));
                    product.setView(rs.getInt("view"));
                    product.setSoldCount(rs.getInt("soldCount"));

                    double discountPercent = rs.getDouble("discountPercent");
                    product.setDiscountPercent(discountPercent); // Giữ nguyên phần trăm giảm giá
                    product.setDiscountPrice(product.getPrice() - (product.getPrice() * discountPercent / 100)); // Tính giá sau giảm

                    product.setCreateDate(rs.getTimestamp("createDate"));
                    product.setUpdateDate(rs.getTimestamp("updateDate"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error while fetching product with ID: " + id, e);
        }
        return product; // Trả về null nếu không tìm thấy sản phẩm
    }


}
