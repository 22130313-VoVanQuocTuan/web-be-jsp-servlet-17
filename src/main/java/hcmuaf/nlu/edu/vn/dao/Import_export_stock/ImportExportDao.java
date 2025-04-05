package hcmuaf.nlu.edu.vn.dao.Import_export_stock;

import hcmuaf.nlu.edu.vn.controller.admin.ImportExportStock.ImportStock;
import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Import_Export_Stock;
import hcmuaf.nlu.edu.vn.model.Inventory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ImportExportDao {
    private DBConnect dbConnect;
    public ImportExportDao() {
        dbConnect = new DBConnect();
    }


    // Lấy danah sách nhập xuất kho
    public List<Import_Export_Stock> getListAllImportExportStock() {
        List<Import_Export_Stock> listAllImportExportStock = new ArrayList<>();
        String sql = "select s.id, s.transactionType, s.transactionDate, u.username," +
                "s.note,s.quantity, p.name  from stocktransaction  s JOIN users u ON s.userId = u.id  JOIN products p ON s.productId = p.id  ORDER BY transactionDate DESC";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String transactionType = rs.getString("transactionType");
                Date transactionDate = rs.getDate("transactionDate");
                String username = rs.getString("username");
                String note = rs.getString("note");
                int quantity = rs.getInt("quantity");
                String productName = rs.getString("name");

                Import_Export_Stock importExportStock = new Import_Export_Stock(id, transactionType, transactionDate, username, note, quantity, productName);
                listAllImportExportStock.add(importExportStock);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listAllImportExportStock;
    }

   // Lấy ra so luonh hien tai
    public int getQuantity(String productId) {
        String sql = "select quantity from inventory where productId = ?";
        int quantity = 0;
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, productId); // Sửa lại để truyền productId là chuỗi
            ResultSet rs = ptm.executeQuery();

            // Kiểm tra xem có kết quả không
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi chi tiết nếu có
        }
        return quantity;
    }

    // Lấy ra so luong toi da
    public int getMaximumQuantity(String productId) {
        String sql = "select maximumQuantity from inventory where productId = ?";
        int maximumQuantity = 0;
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, productId); // Sửa lại để truyền productId là chuỗi
            ResultSet rs = ptm.executeQuery();

            // Kiểm tra xem có kết quả không
            if (rs.next()) {
                maximumQuantity = rs.getInt("maximumQuantity");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi chi tiết nếu có
        }
        return maximumQuantity;
    }

    // Cập nhật số lượng khi nhập kho
    public void importStock(String productId, int quantity) {
        String sql = "UPDATE inventory SET quantity = quantity + ? WHERE productId = ?";

        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, quantity);
            ptm.setString(2, productId);

            int rowsAffected = ptm.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Nhập kho thành công!");
            } else {
                System.out.println("Không tìm thấy sản phẩm!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Cập nhật số lượng khi xuất kho
    public void exportStock(String productId, int quantity) {
        String sql = "UPDATE inventory SET quantity = quantity - ? WHERE productId = ?";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setInt(1, quantity);
            ptm.setString(2, productId);

            int rowsAffected = ptm.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Nhập kho thành công!");
            } else {
                System.out.println("Không tìm thấy sản phẩm!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lưu thông tin nhaapj kho

    public void addInfoImportExportStock(String transactionType, String transactionDate, int userId, String note, int quantity, String productId) {
        String sql = "INSERT INTO stocktransaction (transactionType, transactionDate, userId, note, quantity, productId) VALUES (?, ?, ?, ?, ?,?)";
        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, transactionType);
            ptm.setString(2, transactionDate);
            ptm.setInt(3, userId);  // Nhận trực tiếp userId
            ptm.setString(4, note);
            ptm.setInt(5, quantity);
            ptm.setString(6, productId);
            ptm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lưu nhập kho!", e);
        }
    }
    public void updateInventoryStatus(String productId) {
        String sql = "UPDATE inventory " +
                "SET status = CASE " +
                "    WHEN quantity = 0 THEN 'Hết hàng' " +
                "    WHEN quantity <= minimumQuantity THEN 'Sắp hết hàng' " +
                "    WHEN quantity >= maximumQuantity THEN 'Kho quá tải' " +
                "    ELSE 'Còn hàng' " +
                "END " +
                "WHERE productId = ?";

        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, productId);
            ptm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void deleteTransactionStock(String transactionId) {
        String sql = "DELETE  FROM stocktransaction WHERE id = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setInt(1, Integer.parseInt(transactionId));
            ptm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public Inventory getInventoryById(String productId) {
        String sql = "SELECT * FROM inventory WHERE productId = ?";
        Inventory inventory = null;
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1, productId);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {

                int id = rs.getInt("productId");
                String productName = rs.getString("productName");
                int quantity = rs.getInt("quantity");
                String status = rs.getString("status");
                int minimumQuantity = rs.getInt("minimumQuantity");
                int maximumQuantity = rs.getInt("maximumQuantity");
                inventory = new Inventory(id, productName, quantity, status, minimumQuantity, maximumQuantity);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return inventory;
    }
}
