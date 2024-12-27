package hcmuaf.nlu.edu.vn.dao.address_shipping;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.ShippingAddress;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddressSippingDao {
    private final DBConnect dbConnect;
    public AddressSippingDao() {
        dbConnect = new DBConnect();
    }

    // Thêm thông tin giao hàng
    public boolean insertInfoShipping(int userId, String email, String name, String address, String phoneNumber, String note) {
        String sql = "INSERT INTO addressshipping (userId, email, name, address, phoneNumber, note, createDate, updateDate) " +
                "VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, userId);               // Sửa vị trí userId
            ptm.setString(2, email);
            ptm.setString(3, name);
            ptm.setString(4, address);
            ptm.setString(5, phoneNumber);
            ptm.setString(6, note != null ? note : ""); // Xử lý note nếu null

            int rows = ptm.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error inserting shipping info", e);
        }
    }

    // Cập nhật thông tin giao hàng
    public boolean updateInfoShipping(int userId, String email, String name, String address, String phoneNumber, String note) {
        String sql = "UPDATE addressshipping SET email = ?, name = ?, address = ?, phoneNumber = ?, note = ?, updateDate = NOW() WHERE userId = ?";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, email);
            ptm.setString(2, name);
            ptm.setString(3, address);
            ptm.setString(4, phoneNumber);
            ptm.setString(5, note != null ? note : ""); // Xử lý note nếu null
            ptm.setInt(6, userId);

            int rows = ptm.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error updating shipping info", e);
        }
    }

    //Lấy ra thông tin giao hàng
    public ShippingAddress getInfoShipping (int userId) {
        String sql = "SELECT * FROM addressshipping WHERE userId = ?";
        ShippingAddress shippingAddress = null;
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setInt(1, userId);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                String email = rs.getString("email");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phoneNumber");
                String note = rs.getString("note");

              shippingAddress = new ShippingAddress(email, name, address, phoneNumber, note);
            }
            return shippingAddress;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    // Kiểm tra sự tồn tại của thông tin
    public boolean checkInfo (int userId) {
        String sql = "SELECT * FROM addressshipping WHERE userId = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setInt(1, userId);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
