package hcmuaf.nlu.edu.vn.dao.Orders;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Orders;

import hcmuaf.nlu.edu.vn.model.ItemOrder;

import hcmuaf.nlu.edu.vn.model.Users;
import org.springframework.security.core.userdetails.User;


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
    public List<Orders> getAllOrders() throws SQLException {
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

    // xem chi tiet hoa don
//    public List<Orders> getOrderById(int id) {
//        List<Orders> orders = new ArrayList<>();
//        String query = "SELECT * FROM orders WHERE user_id = ?";
//        try(PreparedStatement preparedStatement = dbConnect.preparedStatement(query)) {
//            ResultSet rs = preparedStatement.executeQuery();
//            preparedStatement.setInt(1, id);
//            while (rs.next()) {
//                Orders order = new Orders();
//                order.setId(rs.getInt("id"));
//                order.setUser_id(rs.getInt("userId"));
//                order.setStatus(rs.getString("status"));
//                order.setTotalPrice(rs.getDouble("totalPrice"));
//                order.setDiscountAmount(rs.getDouble("discountAmount"));
//                order.setPaymentMethod(rs.getString("paymentMethod"));
//                order.setPaymentStatus(rs.getString("paymentStatus"));
//                order.setShippingFee(rs.getDouble("shippingFee"));
//                order.setShippingAddress(rs.getString("shippingAddress"));
//                order.setCreatedAt(order.getCreatedAt());
//                order.setUpdatedAt(order.getUpdatedAt());
//                orders.add(order);
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//        return orders;
//    }

    public List<ItemOrder> getOrderItems(int id) throws SQLException {
        List<ItemOrder> itemOrders = new ArrayList<>();
        String query = "SELECT o.id, o.totalPrice, o.shippingFee, o.discountAmount, o.paymentMethod, o.paymentStatus, o.shippingAddress, oi.product_id, p.name, oi.quantity, oi.price, as.email, as.name, as.phone_number " +
                "FROM orders o JOIN orderitems oi ON o.id = oi.order_id" +
                "JOIN products p ON oi.product_id = p.id " +
                "JOIN users u ON o.user_id = u.id " +
                "JOIN addressshipping as ON u.id = as.ugitser_id WHERE order_id=?";
        try(PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ItemOrder itemOrder = new ItemOrder();
                itemOrder.setId(rs.getInt("id"));
                itemOrder.setTotalPrice(rs.getDouble("totalPrice"));
                itemOrder.setShippingFee(rs.getDouble("shippingFee"));
                itemOrder.setDiscountAmount(rs.getDouble("discountAmount"));
                itemOrder.setPaymentMethod(rs.getString("paymentMethod"));
                itemOrder.setPaymentStatus(rs.getString("paymentStatus"));
                itemOrder.setShippingAddress(rs.getString("shippingAddress"));
                itemOrder.setProductId(rs.getInt("product_id"));
                itemOrder.setName(rs.getString("product_name"));
                itemOrder.setQuantity(rs.getInt("quantity"));
                itemOrder.setItem_price(rs.getDouble("price"));
                itemOrder.setEmail(rs.getString("email"));
                itemOrder.setName(rs.getString("name"));
                itemOrder.setPhone(rs.getString("phone_number"));
                itemOrder.setAddress(rs.getString("address"));
                itemOrders.add(itemOrder);
            }
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
        return itemOrders;
    }

    // Lấy thông tin user
    public Users getInfoUser (int id){
        String sql = "SELECT fullName, email, phoneNumber, address FROM users WHERE id = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setInt(1, id);
            ResultSet rs = ptm.executeQuery();
            if(rs.next()){
                String fullName = rs.getString("fullName");
                String email = rs.getString("email");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                return new Users(fullName,email, phoneNumber, address);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

}
