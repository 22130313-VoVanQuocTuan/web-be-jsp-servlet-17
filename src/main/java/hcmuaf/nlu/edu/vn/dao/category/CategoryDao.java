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
    private  final DBConnect dbConnect;
    public CategoryDao() {
        dbConnect = new DBConnect();
    }

    //Lấy danh sách danh mục
    public List<Category> getAllCategory() {
        String sql = "select * from category";
        List<Category> categories = new ArrayList<>();
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
                 ResultSet rs = ptm.executeQuery();
                 while(rs.next()){
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
    // Thêm danh mục
    public boolean addCategory(String name ) {
        String sql = "insert into category (name,   createDate) values (?, NOW())";

        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1, name);

            int row =   ptm.executeUpdate();
            if(row>0){
                return true;
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }


    // Xóa danh mục
    public boolean deleteCategory(int id) {
        String sql = "delete from category where id = ?";
        try(PreparedStatement  ptm = dbConnect.preparedStatement(sql)){
            ptm.setInt(1, id);
            int row =   ptm.executeUpdate();
            if(row>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    //Tìm kiếm theo tên danh mục
    public List<Category> getCategoryByName(String name) {
        String sql = "select * from category where name like ?";
        List<Category> categories = new ArrayList<>();
        // Kiểm tra null hoặc rỗng trước khi tìm kiếm
        if (name == null || name.trim().isEmpty()) {
            return categories; // Trả về danh sách rỗng nếu chuỗi tìm kiếm không hợp lệ
        }

        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, "%" + name.trim() + "%"); // Thêm wildcard % trước và sau từ khóa
            try (ResultSet rs = ptm.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nameCt = rs.getString("name");
                    Timestamp createDate = rs.getTimestamp("createDate");
                    categories.add(new Category(id, nameCt, createDate));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi trong quá trình tìm kiếm danh mục", e);
        }

        return categories;
    }
}
