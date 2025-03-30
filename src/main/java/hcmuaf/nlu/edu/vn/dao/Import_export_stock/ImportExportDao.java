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
        List<Import_Export_Stock> listAllImportExportStock = null;
        String sql = "select s.id, s.transactionType, s.transactionDate, u.username," +
                "s.note, s.totalCost  from stocktransaction  s JOIN users u ON s.userId = u.id";

        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String transactionType = rs.getString("transactionType");
                Date transactionDate = rs.getDate("transactionDate");
                String username = rs.getString("username");
                String note = rs.getString("note");
                double totalCost = rs.getDouble("totalCost");

                Import_Export_Stock importExportStock = new Import_Export_Stock(id, transactionType, transactionDate, username, note, totalCost);
                listAllImportExportStock.add(importExportStock);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listAllImportExportStock;
    }

}
