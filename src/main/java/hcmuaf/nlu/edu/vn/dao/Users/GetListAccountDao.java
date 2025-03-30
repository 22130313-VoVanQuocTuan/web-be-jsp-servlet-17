package hcmuaf.nlu.edu.vn.dao.Users;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Users;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GetListAccountDao {
    private final DBConnect dbConnect;
    public GetListAccountDao() {
        dbConnect = new DBConnect();
    }

    //Lấy ra danh sách tài khoản
    public List<Users> getListAccount() {
        List<Users> listAccount = new ArrayList<>();
        String sql = "select * from users  WHERE isDeleted = FALSE OR isDeleted IS NULL";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String status = rs.getString("status");
                String role = rs.getString("role");
                boolean isDeleted = rs.getBoolean("isDeleted");
                Users user = new Users(id, username, email, phoneNumber, status, role,isDeleted);
                listAccount.add(user);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listAccount;
    }
        public boolean restoreUser(int id) {
            String sql = "UPDATE users SET isDeleted = FALSE WHERE id = ?";
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
