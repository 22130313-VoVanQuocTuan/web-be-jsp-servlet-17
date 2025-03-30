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

    //Cập nhật ưu đãi
    public boolean updatePromotional(int id, double value, Timestamp startTimestamp, Timestamp endTimestamp) {
        String sql = "UPDATE promotional SET value = ?, startDate =?, endDate=? WHERE id = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setDouble(1, value);
            ptm.setTimestamp(2, startTimestamp);
            ptm.setTimestamp(3, endTimestamp);
            ptm.setInt(4,id);
            int row = ptm.executeUpdate();
            if (row > 0) {
                return true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    //Cập nhật trạng thái ưu  đãi
    public boolean updateStatusProm(int id, String status) {
        String sql = "UPDATE promotional SET status = ? WHERE id = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1, status);
            ptm.setInt(2, id);
            int row = ptm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public List<Promotionals> getListPromotionalByValue(double value) {
        String sql = "select * from promotional WHERE value = ?";
        List<Promotionals> listPro = new ArrayList<>();
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setDouble(1, value);
            ResultSet rs = ptm.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String code = rs.getString("code");
                double values = rs.getDouble("value");
                Timestamp startDate = rs.getTimestamp("startDate");
                Timestamp endDate = rs.getTimestamp("endDate");
                String status = rs.getString("status");

                Promotionals promotionals = new Promotionals(id,code,values,startDate,endDate,status);

                listPro.add(promotionals);
            }
            return listPro;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Promotionals getPromotional(int id) throws SQLException {
       String sql = "select * from promotional WHERE id = ?";
       Promotionals promotional = null;
       try (PreparedStatement preparedStatement = dbConnect.preparedStatement(sql)) {
           preparedStatement.setInt(1, id);
           try (ResultSet rs = preparedStatement.executeQuery()) {
               if (rs.next()) {
                   promotional = new Promotionals();
                   promotional.setId(rs.getInt("id"));
                   promotional.setValue(rs.getDouble("value"));
                   promotional.setStartDate(rs.getTimestamp("startDate"));
                   promotional.setEndDate(rs.getTimestamp("endDate"));
               }
           }
       } catch (SQLException e) {
           throw new RuntimeException("Error" + e.getMessage());
       }
        return promotional;
    }
}
