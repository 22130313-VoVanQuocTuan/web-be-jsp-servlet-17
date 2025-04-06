package hcmuaf.nlu.edu.vn.dao.inventory;

import hcmuaf.nlu.edu.vn.dao.DBConnect;
import hcmuaf.nlu.edu.vn.model.Inventory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InventoryDao {
    private DBConnect dbConnect;
    public InventoryDao() {
        dbConnect = new DBConnect();
    }

    public List<Inventory> getAllInventory() {
        List<Inventory> inventoryList = new ArrayList<>();
        String sql = "select * from inventory ";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ResultSet rs = ptm.executeQuery();
            while(rs.next()){
                Inventory inventory = null;
                int id = rs.getInt("productId");
                String name = rs.getString("productName");
                int quantity = rs.getInt("quantity");
                String status = rs.getString("status");
                int minimumQuantity = rs.getInt("minimumQuantity");
                int maximumQuantity = rs.getInt("maximumQuantity");


                inventory = new Inventory(id, name, quantity, status, minimumQuantity, maximumQuantity);
                inventoryList.add(inventory);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return inventoryList;

    }
    // thêm sản phẩm với số lượng
    public void addInventory(Inventory inventory) {
       String sql = "INSERT INTO inventory (productId, productName,  quantity,minimumQuantity,maximumQuantity, status) VALUES (?,? ,?,?,?,?)";
       try (PreparedStatement ptm = dbConnect.preparedStatement(sql)){
           ptm.setInt(1, inventory.getProductId());
           ptm.setString(2, inventory.getProductName());
           ptm.setInt(3, inventory.getQuantity());
           ptm.setInt(4, inventory.getMinimumQuantity());
           ptm.setInt(5, inventory.getMaximumQuantity());
           ptm.setString(6, inventory.getStatus());
           ptm.executeUpdate();

       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
    }

    public void updateNameProduct(int productId, String name) {
        String sql = "UPDATE inventory SET productName = ? WHERE productId = ?";
        try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
            ptm.setString(1, name);
            ptm.setInt(2, productId);
            ptm.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Inventory> getUnsoldInventory(int days) {
        List<Inventory> list = new ArrayList<>();
        String sql = "SELECT i.productId, i.productName, i.quantity, i.status, i.minimumQuantity, i.maximumQuantity " +
                "FROM inventory i " +
                "LEFT JOIN ( " +
                "   SELECT productId, MAX(transactionDate) AS lastSoldDate " +
                "   FROM stocktransaction " +
                "   WHERE transactionType = 'Xuất kho' " +
                "   GROUP BY productId " +
                ") t ON i.productId = t.productId " +
                "WHERE (t.lastSoldDate IS NULL OR DATEDIFF(NOW(), t.lastSoldDate) > ?)";

        try ( PreparedStatement stmt = dbConnect.preparedStatement(sql)) {

            stmt.setInt(1, days);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(new Inventory(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("quantity"),
                        rs.getString("status"),
                        rs.getInt("minimumQuantity"),
                        rs.getInt("maximumQuantity")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }



    public List<Inventory> getProductNeedImport() {
        List<Inventory> list = new ArrayList<>();
        String sql = "SELECT " +
                "    i.productId, " +
                "    i.productName, " +
                "    i.quantity, " +
                "    i.minimumQuantity, " +
                "    i.maximumQuantity, " +
                "    i.status," +
                "    COALESCE(SUM(oi.quantity), 0) AS SoLuongDangXuLy " +
                "FROM " +
                "    inventory i " +
                "LEFT JOIN " +
                "    products p ON i.productId = p.id " +
                "LEFT JOIN " +
                "    orderitems oi ON i.productId = oi.productId " +
                "LEFT JOIN " +
                "   orders o ON oi.orderId = o.id AND o.status = 'Đang xử lý' " +
                "GROUP BY " +
                "  i.productId, i.productName, i.quantity, i.minimumQuantity, i.maximumQuantity, i.status " +
                "HAVING " +
                "    i.quantity < i.minimumQuantity " +
                "    OR SoLuongDangXuLy > i.quantity";

        try (PreparedStatement ptm = dbConnect.preparedStatement(sql)) {
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new Inventory(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("quantity"),
                        rs.getString("status"),
                        rs.getInt("minimumQuantity"),
                        rs.getInt("maximumQuantity")
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public void updateQuantityInventory(String productId, int quantity, int minInput, int maxInput) {
            String sql = "UPDATE inventory " +
                    "SET " +
                    "    quantity = CASE WHEN ? IS NOT NULL THEN ? ELSE quantity END, " +
                    "    minimumQuantity = CASE WHEN ? IS NOT NULL THEN ? ELSE minimumQuantity END, " +
                    "    maximumQuantity = CASE WHEN ? IS NOT NULL THEN ? ELSE maximumQuantity END " +
                    "WHERE productId = ?;";

            try(PreparedStatement ptm = dbConnect.preparedStatement(sql)){
                ptm.setInt(1, quantity);
                ptm.setInt(2, quantity);
                ptm.setInt(3, minInput);
                ptm.setInt(4, minInput);
                ptm.setInt(5, maxInput);
                ptm.setInt(6, maxInput);
                ptm.setString(7, productId);
                ptm.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
    }
}
