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
        Product product = new Product(); // Khởi tạo đối tượng Product
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, id);
            ResultSet rs = ptm.executeQuery();

            if (rs.next()) {
               // Lấy dữ liệu từ ResultSet và thiết lập cho đối tượng Product
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setImageUrl(rs.getString("imageUrl"));
                product.setDescription(rs.getString("description"));
                product.setCategoryId(rs.getString("categoryId"));
                product.setStatus(rs.getString("status"));
                product.setSupplier(rs.getString("supplier"));
                product.setColor(rs.getString("color"));
                product.setSize(rs.getString("size"));
                product.setUnit(rs.getString("unit"));
                product.setView(rs.getInt("view"));
                product.setSoldCount(rs.getInt("soldCount"));
                product.setDiscountPercent(rs.getDouble("discountPercent")*100);
                product.setDiscountPrice(product.getPrice() - (product.getPrice() * product.getDiscountPercent()/100));
                product.setCreateDate(rs.getTimestamp("createDate"));
                product.setUpdateDate(rs.getTimestamp("updateDate"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return product;
    }


}
