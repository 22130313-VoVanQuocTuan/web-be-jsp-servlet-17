package hcmuaf.nlu.edu.vn.dao.Orders;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.*;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
            ResultSet resultSets = ps.executeQuery();
            while (resultSets.next()) {
                int id = resultSets.getInt("id");
                int userid = resultSets.getInt("userId");
                Date createdAt = resultSets.getDate("createdAt");
                double totalPrice = resultSets.getDouble("totalPrice");
                String paymentMethod = resultSets.getString("paymentMethod");
                String paymentStatus = resultSets.getString("paymentStatus");
                String status = resultSets.getString("status");

                Orders order = new Orders(id, userid, createdAt, totalPrice, paymentMethod, paymentStatus, status);

                orders.add(order);
            }
            return orders;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    // Lấy ra hoá đơn
    public List<Orders> getOrderById(int id) {
        List<Orders> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE userId = ?";
        try(PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idd = rs.getInt("id");
                int userid = rs.getInt("userId");
                Date createdAt = rs.getDate("createdAt");
                double totalPrice = rs.getDouble("totalPrice");
                String paymentMethod = rs.getString("paymentMethod");
                String paymentStatus = rs.getString("paymentStatus");
                String status = rs.getString("status");

                Orders order = new Orders(idd, userid, createdAt, totalPrice, paymentMethod, paymentStatus, status);

                orders.add(order);
            }
            return orders;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //Lấy ra chi tiết hoá đơn
    public Orders getOrderDetail(int id) throws SQLException {

        String query = "SELECT o.id, o.totalPrice, o.shippingFee, o.discountAmount, o.paymentMethod, o.paymentStatus, o.shippingAddress, Sum(oi.quantity) AS quantity, a.email, a.name, a.phoneNumber, a.note " +
                "FROM orders o " +
                "JOIN orderitems oi ON o.id = oi.orderId " +
                "JOIN products p ON oi.productId = p.id " +
                "JOIN users u ON o.userId = u.id " +
                "JOIN addressshipping a ON u.id = a.userId " +
                "WHERE o.id=?";

        Orders orderDetail = null;
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
              int quantity = rs.getInt("quantity");
              String email = rs.getString("email");
              String name = rs.getString("name");
               String phoneNumber = rs.getString("phoneNumber");
               String  note = rs.getString("note");

               orderDetail = new Orders(ids, totalPrice, shippingFee, discountAmount, paymentMethod, paymentStatus, shippingAddress, quantity, email, name, phoneNumber, note);

            }
            return orderDetail;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    //Lấy sản phẩm của hoá đơn
    public List<OrderItem> orderItems(int id) throws SQLException {
        String query = "SELECT o.productName, o.quantity, o.price, o.discount, o.totalPrice FROM orderitems o WHERE orderId = ?";
        try(PreparedStatement ps = dbConnect.preparedStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<OrderItem> orderItems = new ArrayList<>();
            while (rs.next()) {

                String productName = rs.getString("productName");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                double discount = rs.getDouble("discount");
                double totalPrice = rs.getDouble("totalPrice");

                OrderItem orderItem = new OrderItem(productName, quantity, price, discount, totalPrice);

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

    //Cập nhật trạng thái đơn hàng
    public boolean updateOrderStatus(int id, String status) throws SQLException {
        String query = "UPDATE orders SET status = ? WHERE id = ?";
        try(PreparedStatement ps = dbConnect.preparedStatement(query)){
            ps.setString(1, status);
            ps.setInt(2, id);
            int rowUpdated = ps.executeUpdate();
            if(rowUpdated > 0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
