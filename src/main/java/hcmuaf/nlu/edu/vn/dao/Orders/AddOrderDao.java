package hcmuaf.nlu.edu.vn.dao.Orders;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.*;

import java.sql.*;

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

    //Thêm hóa đơn
    public Orders addOrder(Orders order) throws SQLException {
        String query = "INSERT INTO Orders (userId, totalPrice, shippingFee, discountAmount, shippingAddress, paymentMethod, paymentStatus, status, createdAt) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";

        try (PreparedStatement ps = dbConnect.preparedStatement(query)) {
            // Gán giá trị cho các tham số của PreparedStatement
            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalPrice());
            ps.setDouble(3, order.getShippingFee());
            ps.setDouble(4, order.getDiscountAmount());
            ps.setString(5, order.getShippingAddress());
            ps.setString(6, order.getPaymentMethod());
            ps.setString(7, order.getPaymentStatus());
            ps.setString(8, order.getStatus());

            // Thực thi câu lệnh insert
            ps.executeUpdate();

            // Lấy ID đơn hàng (orderId) từ cơ sở dữ liệu
            String selectQuery = "SELECT LAST_INSERT_ID()";
            try (PreparedStatement selectPs = dbConnect.preparedStatement(selectQuery);
                 ResultSet rs = selectPs.executeQuery()) {
                if (rs.next()) {
                    int orderId = rs.getInt(1); // Lấy id mới được tạo
                    order.setId(orderId);  // Cập nhật ID cho đối tượng Order
                }
            }
        } catch (SQLException e) {
            System.err.println("Error while inserting order: " + e.getMessage());
            throw e;
        }

        return order;  // Trả về đối tượng Order đã có ID
    }
    // Thêm chi tiết hóa đơn
    public void addOrderItem(OrderItem item) throws SQLException {
        String query = "INSERT INTO orderitems (orderId, productId, quantity, price, totalPrice, discount, createdAt, updatedAt) " +
                "VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())";

        try (PreparedStatement ps = dbConnect.preparedStatement(query)) {
            // Gán các giá trị cho PreparedStatement
            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getProductId());
            ps.setInt(3, item.getQuantity());
            ps.setDouble(4, item.getPrice());
            ps.setDouble(5, item.getTotalPrice());
            ps.setDouble(6, item.getDiscount());

            // Thực thi lệnh SQL
            ps.executeUpdate();
        } catch (SQLException e) {
          e.printStackTrace();
        }
    }



}
