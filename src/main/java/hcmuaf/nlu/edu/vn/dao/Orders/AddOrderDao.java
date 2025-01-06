package hcmuaf.nlu.edu.vn.dao.Orders;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.AddressShipping;
import hcmuaf.nlu.edu.vn.model.Orders;
import hcmuaf.nlu.edu.vn.model.Payments;
import hcmuaf.nlu.edu.vn.model.Users;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddOrderDao {
    final DBConnect dbConnect;
    public AddOrderDao() {
        this.dbConnect = new DBConnect();
    }

    public AddressShipping getInfoAddressShipping (int id){
        String sql = "SELECT name, email, phoneNumber, address, note FROM addressshipping WHERE userId = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setInt(1, id);
            ResultSet rs = ptm.executeQuery();
            if(rs.next()){
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                String note = rs.getString("note");
                return new AddressShipping(name ,email, phoneNumber, address, note);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    //Them thanh toan
    public void addPayment(Payments payments) throws SQLException {
        String query = "INSERT INTO payments (id, userId, paymentMethod, paymentStatus, paymentDate, paymentAmount) VALUES(?,?,?,?,?,?)";
        try(PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ps.setInt(1, payments.getId());
            ps.setInt(2, payments.getUserId());
            ps.setString(3, payments.getPaymentMethod());
            ps.setString(4, payments.getPaymentStatus());
            ps.setDate(5, (Date) payments.getPaymentDate());
            ps.setDouble(6, payments.getPaymentAmount());

            ps.executeUpdate();
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
    }

    //Lấy thanh toán ra
    public Payments getPayment(int id) throws SQLException {
        String query = "SELECT * FROM payments WHERE userId = ?";
        try(PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Payments payments = new Payments();
                payments.setId(rs.getInt("id"));
                payments.setUserId(rs.getInt("userId"));
                payments.setPaymentMethod(rs.getString("paymentMethod"));
                payments.setPaymentStatus(rs.getString("paymentStatus"));
                payments.setPaymentDate(rs.getDate("paymentDate"));
                payments.setPaymentAmount(rs.getDouble("paymentAmount"));

                return payments;
            }
        }
        return null;
    }


}
