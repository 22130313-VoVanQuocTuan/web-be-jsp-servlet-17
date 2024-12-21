package hcmuaf.nlu.edu.vn.dao.carts;

import hcmuaf.nlu.edu.vn.dao.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VoucherDao {
    private final DBConnect dbConnect;
    public VoucherDao() {
        dbConnect = new DBConnect();
    }

    //Kiểm tra tiính hợp lệ của mã
    public double checkVoucher(String code) {
        String sql = "SELECT value FROM promotional WHERE code = ? AND status = 'hoạt động' AND startDate <= CURRENT_DATE AND endDate >= CURRENT_DATE";
        double value = 0;
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, code);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                value = rs.getDouble("value");
            }
            return value;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
