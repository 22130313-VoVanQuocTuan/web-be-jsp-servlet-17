package hcmuaf.nlu.edu.vn.dao.Users;


import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Users;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class LoginDao {
    private final DBConnect dbConnect;

    public LoginDao() {
        this.dbConnect = new DBConnect();
    }



    // Xử lý đăng nhập
    public boolean checkLogin(String username, String password) throws SQLException {
        String sql = "SELECT password FROM users WHERE username=?";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, username);
            try (ResultSet rs = ptm.executeQuery()) {
                if (rs.next()) {
                    String hashedPassword = rs.getString("password");
                    // So sánh mật khẩu nhập vào với mật khẩu đã mã hóa
                    if (BCrypt.checkpw(password, hashedPassword)) {
                        return true; // Đăng nhập thành công
                    }
                }
            }
        }finally {
            dbConnect.closeConnection(); // Đảm bảo đóng kết nối sau khi sử dụng
        }
        return false; // Tên đăng nhập hoặc mật khẩu không đúng
    }

    //Lấy user
    public Users getUser(String username){
        String sql = "SELECT * FROM users WHERE username = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1, username);
            ResultSet rs = ptm.executeQuery();
            Users user = new Users();
            if(rs.next()){
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));
                user.setIsEmailVerified(rs.getInt("isEmailVerified"));
                user.setStatus(rs.getString("status"));
               return user;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            dbConnect.closeConnection(); //  đóng kết nối sau khi sử dụng
        }
    }


    public void updatePassword(String newPassword, String email) throws SQLException {
        String sql = "UPDATE users SET password = ? WHERE email = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1, BCrypt.hashpw(newPassword, BCrypt.gensalt()));
            ptm.setString(2, email);
            ptm.executeUpdate();

        }

    }

    public Map<String, Boolean> getUserPermissions(String userId, String module) {
        Map<String, Boolean> permissions = new HashMap<>();
        String sql = "SELECT canView, canAdd, canEdit, canDelete FROM permissions WHERE userId = ? AND module = ?";
        try (  PreparedStatement stmt = dbConnect.preparedStatement(sql)) {

            stmt.setString(1, userId);
            stmt.setString(2, module);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                permissions.put("canView", rs.getInt("canView") == 1);
                permissions.put("canAdd", rs.getInt("canAdd") == 1);
                permissions.put("canEdit", rs.getInt("canEdit") == 1);
                permissions.put("canDelete", rs.getInt("canDelete") == 1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return permissions;
    }

    // hạ quyền user
    public void updateRoleById(String userId) {
        String sql = "UPDATE users SET role = ? WHERE id = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1, "user");
            ptm.setString(2, userId);
            ptm.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}

