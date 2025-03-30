package hcmuaf.nlu.edu.vn.dao.Import_export_stock;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Import_Export_Stock;

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
                "s.note, s.totalCost, s.price, s.quantity, p.name  from stocktransaction  s JOIN users u ON s.userId = u.id  JOIN products p ON s.productId = p.id";

        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String transactionType = rs.getString("transactionType");
                Date transactionDate = rs.getDate("transactionDate");
                String username = rs.getString("username");
                String note = rs.getString("note");
                double totalCost = rs.getDouble("totalCost");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String productName = rs.getString("name");

                Import_Export_Stock importExportStock = new Import_Export_Stock(id, transactionType, transactionDate, username, note, totalCost, price, quantity, productName);
                listAllImportExportStock.add(importExportStock);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listAllImportExportStock;
    }

    // Cập nhật số lượng khi nhập kho
    public void importStock(String productId, int quantity) {
        String sql = "UPDATE products SET quantity = quantity + ? WHERE id = ?";

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
    public void addInfoImportExportStock(String transactionType, String transactionDate, int userId, String note, double totalCost, double price, int quantity, String productId) {
        String sql = "INSERT INTO stocktransaction (transactionType, transactionDate, userId, note, totalCost, price, quantity, productId) VALUES (?, ?, ?, ?, ?,?,?,?)";

        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ptm.setString(1, transactionType);
            ptm.setString(2, transactionDate);
            ptm.setInt(3, userId);  // Nhận trực tiếp userId
            ptm.setString(4, note);
            ptm.setDouble(5, totalCost);
            ptm.setDouble(6, price);
            ptm.setInt(7, quantity);
            ptm.setString(8, productId);


            ptm.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lưu nhập kho!", e);
        }
    }

}
