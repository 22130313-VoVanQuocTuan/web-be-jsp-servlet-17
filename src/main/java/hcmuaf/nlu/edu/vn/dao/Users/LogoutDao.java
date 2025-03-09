package hcmuaf.nlu.edu.vn.dao.Users;

import hcmuaf.nlu.edu.vn.dao.DBConnect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LogoutDao {
    private final DBConnect dbConnect;
    public LogoutDao() {
        dbConnect = new DBConnect();
    }

    // Cập nhật trạng thái
    public boolean UpdateStatusUser(String role, String status, int id) throws SQLException {
        String sql = "UPDATE users " +
                "SET status = CASE WHEN ? IS NOT NULL THEN ? ELSE status END, " +
                "role = CASE WHEN ? IS NOT NULL THEN ? ELSE role END " +
                "WHERE role = 'user' AND id = ?;";

        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, status);
            ptm.setString(2, status);
            ptm.setString(3, role);
            ptm.setString(4, role);
            ptm.setInt(5, id);

            int row = ptm.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            dbConnect.closeConnection(); // Đảm bảo đóng kết nối
        }
    }
}
