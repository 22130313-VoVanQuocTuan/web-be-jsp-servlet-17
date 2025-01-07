package hcmuaf.nlu.edu.vn.dao.Orders;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.OrderItem;
import hcmuaf.nlu.edu.vn.model.Orders;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddOrderDao {
    final DBConnect dbConnect;
    public AddOrderDao() {
        this.dbConnect = new DBConnect();
    }

    //Thêm hoá đơn
    public boolean addOrder(Orders orders) throws SQLException {
        String query = "INSERT INTO orders (id, userId, totalPrice, shippingFee, discountAmount, status, paymentMethod, paymentStatus, shippingAddress, createdAt, updatedAt) VALUES(?,?,?,?,?,?,?,?,?,NOW(),NOW())";
        try (PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ps.setInt(1, orders.getId());
            ps.setInt(2, orders.getUser_id());
            ps.setDouble(3, orders.getTotalPrice());
            ps.setDouble(4, orders.getShippingFee());
            ps.setDouble(5, orders.getDiscountAmount());
            ps.setString(6, orders.getStatus());
            ps.setString(7, orders.getPaymentMethod());
            ps.setString(8, orders.getPaymentStatus());
            ps.setString(9, orders.getShippingAddress());
            ps.setDate(10, new Date(orders.getCreatedAt().getTime()));
            ps.setDate(11, new Date(orders.getUpdatedAt().getTime()));

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //Them chi tiet hoa don
    public boolean addOrderItem(OrderItem orderItem) {
        String query = "INSERT INTO orderitems (id, orderId, productId, quantity, price, totalPrice, discount, createdAt, updatedAt) VALUES(?,?,?,?,?,?,?,NOW(),NOW())";
        try (PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ps.setInt(1, orderItem.getId());
            ps.setInt(2, orderItem.getOrderId());
            ps.setInt(3, orderItem.getProductId());
            ps.setInt(4, orderItem.getQuantity());
            ps.setDouble(5, orderItem.getPrice());
            ps.setDouble(6, orderItem.getTotalPrice());
            ps.setDouble(7, orderItem.getDiscount());
            ps.setDate(8, new Date(orderItem.getCreatedAt().getTime()));
            ps.setDate(9, new Date(orderItem.getUpdatedAt().getTime()));

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}
