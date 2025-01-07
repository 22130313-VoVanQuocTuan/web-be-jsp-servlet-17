package hcmuaf.nlu.edu.vn.dao.Orders;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.OrderItem;
import hcmuaf.nlu.edu.vn.model.Orders;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class PaymentDao {
    private final DBConnect dbConnect;

    public PaymentDao() {
        this.dbConnect = new DBConnect();
    }

    // Tạo order
    public boolean createOrder( Orders order) {
        String sql = "INSERT INTO orders (userId, totalPrice, shippingFee, discountAmount, status, paymentMethod, paymentStatus, shippingAddress, createdAt, updatedAt) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        try (PreparedStatement stmt = dbConnect.preparedStatement(sql)) {
            stmt.setInt(1, order.getUser_id());
            stmt.setDouble(2, order.getTotalPrice());
            stmt.setDouble(3, order.getShippingFee());
            stmt.setDouble(4, order.getDiscountAmount());
            stmt.setString(5, order.getStatus());
            stmt.setString(6, order.getPaymentMethod());
            stmt.setString(7, order.getPaymentStatus());
            stmt.setString(8, order.getShippingAddress());
            stmt.setTimestamp(9, currentTimestamp);
            stmt.setTimestamp(10, currentTimestamp);

            int rowsAdded = stmt.executeUpdate();
            if (rowsAdded > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        order.setId(generatedKeys.getInt(1)); // Lấy orderId mới tạo ra
                        return true;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // thêm thông tin sản phẩm  từ cart vào  ortheritem
    public boolean addOrderItem(OrderItem orderItem) {
        String sql = "INSERT INTO orderitems (orderId, productId, quantity, price, totalPrice, discount, createdAt, updatedAt) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Lấy thời gian hiện tại
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

        try (PreparedStatement statement = dbConnect.preparedStatement(sql)) {
            // Thiết lập các tham số cho câu lệnh SQL
            statement.setInt(1, orderItem.getId()); // ID đơn hàng
            statement.setInt(2, orderItem.getProductId()); // ID sản phẩm
            statement.setInt(3, orderItem.getQuantity()); // Số lượng
            statement.setDouble(4, orderItem.getPrice()); // Giá
            statement.setDouble(5, orderItem.getTotalPrice()); // Tổng giá
            statement.setDouble(6, orderItem.getDiscount()); // Giảm giá
            statement.setTimestamp(7, currentTimestamp); // Thời gian tạo
            statement.setTimestamp(8, currentTimestamp); // Thời gian cập nhật

            // Thực thi câu lệnh SQL
            int rowsAffected = statement.executeUpdate();

            // Kiểm tra xem có thêm được sản phẩm vào bảng orderitems không
            return rowsAffected > 0;

        } catch (SQLException e) {
            // In lỗi nếu có vấn đề với câu lệnh SQL hoặc kết nối cơ sở dữ liệu
            System.out.println("Lỗi khi thêm sản phẩm vào orderitems: " + e.getMessage());
            return false;
        }
    }

}
