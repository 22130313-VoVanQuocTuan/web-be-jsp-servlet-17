package hcmuaf.nlu.edu.vn.dao.Users;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Users;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateInfoDao {
    private final DBConnect dbConnect;
    public UpdateInfoDao() {
        dbConnect = new DBConnect();
    }

    //Cập nhật thông tin user
    public void     updateInfo(int id, Users user) {
        String sql = "UPDATE users SET fullName= ? , email =?, phoneNumber =?, address =?  WHERE id =?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1, user.getFullName());
            ptm.setString(2, user.getEmail());
            ptm.setString(3, user.getPhoneNumber());
            ptm.setString(4, user.getAddress());
            ptm.setInt(5, id);

            int rowsUpdated = ptm.executeUpdate(); // Trả về số lượng dòng được cập nhật
            if (rowsUpdated == 0) {
                throw new SQLException("Không tìm thấy người dùng với ID " + id);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi cập nhật thông tin user", e);
        }
    }

}
