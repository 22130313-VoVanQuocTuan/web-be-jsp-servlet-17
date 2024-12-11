package hcmuaf.nlu.edu.vn.dao.Users;

import hcmuaf.nlu.edu.vn.dao.DBConnect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LogoutDao {
    private final DBConnect dbConnect;
    public LogoutDao() {
        dbConnect = new DBConnect();
    }

    // Đăng  xuất tài khoản
    public void UpdateStatusUser(String status, int id) throws SQLException {
        String sql = "UPDATE users SET status = ? WHERE id = ?;";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1,status);
            ptm.setInt(2,id);
            ptm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            dbConnect.closeConnection(); // Đảm bảo đóng kết nối sau khi sử dụng
        }
    }
}
