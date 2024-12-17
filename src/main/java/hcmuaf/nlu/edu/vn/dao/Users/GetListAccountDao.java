package hcmuaf.nlu.edu.vn.dao.Users;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Users;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GetListAccount {
    private final DBConnect dbConnect;
    public GetListAccount() {
        dbConnect = new DBConnect();
    }

    //Lấy ra danh sách tài khoản
    public List<Users> getListAccount() {
        List<Users> listAccount = new ArrayList<>();
        String sql = "select * from users";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ResultSet rs = ptm.executeQuery();
            while (rs.next()){
               int id = rs.getInt("id");
               String username = rs.getString("username");
               String email = rs.getString("email");
               String phoneNumber = rs.getString("phoneNumber");
               String status = rs.getString("status");
               

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
