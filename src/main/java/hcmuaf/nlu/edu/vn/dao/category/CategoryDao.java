package hcmuaf.nlu.edu.vn.dao.category;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Category;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    private final DBConnect dbConnect;

    public CategoryDao() {
        dbConnect = new DBConnect();
    }

    //Lấy danh sách danh mục
    public List<Category> getAllCategory() {
        String sql = "select * from category  WHERE is_deleted = false";
        List<Category> categories = new ArrayList<>();
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Timestamp createDate = rs.getTimestamp("createDate");

                categories.add(new Category(id, name, createDate));

            }
            return categories;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean isCategoryNameExists(String name) {
        String sql = "SELECT COUNT(*) FROM category WHERE name = ?";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, name);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;  // Trả về true nếu đã tồn tại
            }
        } catch (SQLException e) {
            System.err.println("Error while checking category name: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    // Thêm danh mục
    public boolean addCategory(String name) {
        if (isCategoryNameExists(name)) {
            return false; // Trả về false nếu tên danh mục đã tồn tại
        }
        String sql = "INSERT INTO category (name, createDate) VALUES (?, NOW())";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, name);
            int row = ptm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
            // Log chi tiết lỗi để dễ dàng debug
            System.err.println("Error while adding category: " + e.getMessage());
            e.printStackTrace(); // In chi tiết lỗi ra console
        }
        return false;
    }

    // Xóa danh mục
    public boolean deleteCategory(int id) {
        String sql = "UPDATE category SET is_deleted = true WHERE id = ?";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, id);
            int row = ptm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

}
