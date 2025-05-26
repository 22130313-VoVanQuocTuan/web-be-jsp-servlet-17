package hcmuaf.nlu.edu.vn.dao.Users;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Users;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

public class AddDeleteUpdateAccountInAdminDao {
    private final DBConnect dbConnect;

    public AddDeleteUpdateAccountInAdminDao() {
        dbConnect = new DBConnect();
    }

    // Thêm tài khoản
    public boolean addAccount(Users user) {
        String sql = "INSERT INTO users (username, password, email, role, status, isEmailVerified, createDate) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, user.getUsername());
            ptm.setString(2, BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            ptm.setString(3, user.getEmail());
            ptm.setString(4, user.getRole());
            ptm.setString(5, user.getStatus());
            ptm.setInt(6, user.getIsEmailVerified());
            // Gán createDate từ user (loại Date) sang Timestamp
            ptm.setTimestamp(7, new java.sql.Timestamp(user.getCreateDate().getTime()));

            int rowsInserted = ptm.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean deleteAccount(int id) {
        String sql = "DELETE FROM users WHERE id = ?";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, id);
            int rowsDeleted = ptm.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean softDeleteUser(int id) {
        String sql = "UPDATE users SET isDeleted = TRUE WHERE id = ?";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, id);
            int rowsUpdated = ptm.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

