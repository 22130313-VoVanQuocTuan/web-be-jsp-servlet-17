package hcmuaf.nlu.edu.vn.dao.Orders;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.*;


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

//    //Xem danh sách hoá đơn
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

    // Lấy ra hoá đơn
    public List<Orders> getOrderById(int id) {
        List<Orders> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE userId = ?";
        try(PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ps.setInt(1, id);
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

    public OrderDetail getOrderDetail(int id) throws SQLException {

        String query = "SELECT o.id, o.totalPrice, o.shippingFee, o.discountAmount, o.paymentMethod, o.paymentStatus, o.shippingAddress, oi.productId,  Sum(oi.quantity) AS quantity, a.email, a.name, a.phoneNumber " +
                "FROM orders o " +
                "JOIN orderitems oi ON o.id = oi.orderId " +  // Thêm dấu cách sau ON oi.orderId
                "JOIN products p ON oi.productId = p.id " +
                "JOIN users u ON o.userId = u.id " +
                "JOIN addressshipping a ON u.id = a.userId " +
                "WHERE o.id=?";

        OrderDetail orderDetail = null;
        try (PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // Khởi tạo đơn hàng
            int ids = rs.getInt("id");
              double totalPrice = rs.getDouble("totalPrice");
              double shippingFee = rs.getDouble("shippingFee");
              double discountAmount = rs.getDouble("discountAmount");
              String paymentMethod = rs.getString("paymentMethod");
              String paymentStatus = rs.getString("paymentStatus");
              String shippingAddress = rs.getString("shippingAddress");
              int productId = rs.getInt("productId");
              int quantity = rs.getInt("quantity");
              String email = rs.getString("email");
              String name = rs.getString("name");
               String phoneNumber = rs.getString("phoneNumber");

               orderDetail = new OrderDetail(ids, totalPrice, shippingFee,discountAmount,paymentMethod,paymentStatus,shippingAddress,
                      productId, quantity, email,name,phoneNumber);


            }
            return orderDetail;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    //Lấy sản phẩm của hoá đơn
    public List<OrderItem> orderItems(int id) throws SQLException {
        String query = "SELECT * FROM orderitems WHERE orderId = ?";
        try(PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<OrderItem> orderItems = new ArrayList<>();
            while (rs.next()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setProductName(rs.getString("productName"));
                orderItem.setQuantity(rs.getInt("quantity"));
                orderItem.setPrice(rs.getDouble("price"));
                orderItem.setDiscount(rs.getDouble("discount"));
                orderItem.setTotalPrice(rs.getDouble("totalPrice"));

                orderItems.add(orderItem);
            }
            return orderItems;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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

    //Xoá sản phẩm
    public boolean deleteOrder(int id) throws SQLException {
        String query = "DELETE FROM orders WHERE id = ?";
        try(PreparedStatement ps = dbConnect.preparedStatement(query)){
            ps.setInt(1, id);
            int rowDeleted = ps.executeUpdate();
            return rowDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
