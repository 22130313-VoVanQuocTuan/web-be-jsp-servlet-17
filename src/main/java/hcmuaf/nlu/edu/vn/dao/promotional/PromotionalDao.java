package hcmuaf.nlu.edu.vn.dao.promotional;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Promotionals;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PromotionalDao {
    private final DBConnect dbConnect;
    public PromotionalDao() {
        dbConnect = new DBConnect();
    }

    //Lấy danh sách ưu đãi
    public List<Promotionals> getListPromotional() {
        String sql = "select * from promotional";
        List<Promotionals> listPro = new ArrayList<>();
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ResultSet rs = ptm.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String code = rs.getString("code");
                double value = rs.getDouble("value");
                Timestamp startDate = rs.getTimestamp("startDate");
                Timestamp endDate = rs.getTimestamp("endDate");
                String status = rs.getString("status");

                Promotionals promotionals = new Promotionals(id,code,value,startDate,endDate,status);

                listPro.add(promotionals);
            }
            return listPro;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    //Thêm ưu đãi
    public boolean addPromotional(String code, double value, Timestamp startDate, Timestamp endDate, String status) {
        String sql = "INSERT INTO promotional (code, value, startDate, endDate, status) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, code);
            ptm.setDouble(2, value);
            ptm.setTimestamp(3, startDate);  // start date
            ptm.setTimestamp(4, endDate);    // end date
            ptm.setString(5, status);

            ptm.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //Xóa ưu đãi
    public boolean deletePromotion(int id) {
        String sql = "DELETE FROM promotional WHERE id = ?";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, id);
            int row = ptm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
