package hcmuaf.nlu.edu.vn.dao.Orders;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Orders;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private final DBConnect dbConnect;

    public OrderDao() {
        this.dbConnect = new DBConnect();
    }

    //Xem danh sách hoá đơn
    public List<Orders> getAllOrders() {
        List<Orders> orders = new ArrayList<Orders>();
        String query = "SELECT * FROM orders";
        try(PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                order.setId(rs.getInt("id"));
                order.setUser_id(rs.getInt("userId"));
                order.setStatus(rs.getString("status"));
                order.setTotalPrice(rs.getDouble("totalPrice"));
                order.setDiscountAmount(rs.getDouble("discountAmount"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setPaymentStatus(rs.getString("paymentStatus"));
                order.setShippingFee(rs.getDouble("shippingFee"));
                order.setShippingAddress(rs.getString("shippingAddress"));
                order.setCreatedAt(order.getCreatedAt());
                order.setUpdatedAt(order.getUpdatedAt());
                orders.add(order);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;
    }

}
