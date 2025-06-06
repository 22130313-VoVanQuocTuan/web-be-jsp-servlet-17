package hcmuaf.nlu.edu.vn.dao.Users;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Permissions;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class PermissionDao {
    private final DBConnect dbConnect;


    public PermissionDao() {
        this.dbConnect = new DBConnect();
    }

    public void updatePermissions(int userId, String module, boolean canView, boolean canAdd, boolean canEdit, boolean canDelete) throws Exception {

        String checkSql = "SELECT COUNT(*) FROM permissions WHERE userId = ? AND module = ?";
        String updateSql = "UPDATE permissions SET canView = ?, canAdd = ?, canEdit = ?, canDelete = ? WHERE userId = ? AND module = ?";
        String insertSql = "INSERT INTO permissions (userId, module, canView, canAdd, canEdit, canDelete) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement checkStmt = dbConnect.preparedStatement(checkSql);
             PreparedStatement updateStmt = dbConnect.preparedStatement(updateSql);
             PreparedStatement insertStmt = dbConnect.preparedStatement(insertSql)) {

            // Kiểm tra xem bản ghi đã tồn tại chưa
            checkStmt.setInt(1, userId);
            checkStmt.setString(2, module);
            ResultSet rs = checkStmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                // Nếu bản ghi tồn tại, cập nhật nó
                updateStmt.setBoolean(1, canView);
                updateStmt.setBoolean(2, canAdd);
                updateStmt.setBoolean(3, canEdit);
                updateStmt.setBoolean(4, canDelete);
                updateStmt.setInt(5, userId);
                updateStmt.setString(6, module);
                updateStmt.executeUpdate();
            } else {
                // Nếu chưa tồn tại, chèn mới
                insertStmt.setInt(1, userId);
                insertStmt.setString(2, module);
                insertStmt.setBoolean(3, canView);
                insertStmt.setBoolean(4, canAdd);
                insertStmt.setBoolean(5, canEdit);
                insertStmt.setBoolean(6, canDelete);
                insertStmt.executeUpdate();
            }
        }
    }

    // kiểm tra quyền
    public boolean checkPermission(int userId, String module, String permissionType) throws SQLException {
        String sql = "SELECT " + permissionType + " FROM permissions WHERE userId = ? AND module = ?";

        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setString(2, module);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getBoolean(permissionType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Permissions getPermission(int userId, String module) {
        String query = "SELECT * FROM permissions WHERE userId = ? AND module = ?";
        try ( PreparedStatement ps =  dbConnect.preparedStatement(query)) {
            ps.setInt(1, userId);
            ps.setString(2, module);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Permissions(
                        rs.getBoolean("canView"),
                        rs.getBoolean("canAdd"),
                        rs.getBoolean("canEdit"),
                        rs.getBoolean("canDelete")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
