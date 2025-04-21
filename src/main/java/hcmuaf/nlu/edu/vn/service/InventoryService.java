package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.inventory.InventoryDao;
import hcmuaf.nlu.edu.vn.model.Inventory;

import java.util.List;

public class InventoryService {
    private InventoryDao inventoryDao;

    public InventoryService() {
        this.inventoryDao = new InventoryDao();
    }

    public List<Inventory> getAllInventory() {
        return inventoryDao.getAllInventory();
    }
    public void addInventory(Inventory inventory) {
        inventoryDao.addInventory(inventory);
    }

    public void updateNameProduct(int productId, String name) {
        inventoryDao.updateNameProduct(productId, name);
    }

    public List<Inventory> getUnsoldInventory(int days) {
        return inventoryDao.getUnsoldInventory(days);
    }

    // Sản phẩm cần nhập kho
    public List<Inventory> getProductNeedImport() {
        return inventoryDao.getProductNeedImport();
    }

    // cập nhật kho
    public void updateQuantityInventory(String productId, int quantity, int minInput, int maxInput) {
        inventoryDao.updateQuantityInventory(productId,quantity,minInput,maxInput);
    }

    //Kiểm tra số lượng hàng tồn kho
    public boolean isValidInventory(int productId, int quantity) {
        return inventoryDao.isProductAvailable(productId, quantity);
    }

    public int quantityInventory(int productId) {
        return inventoryDao.getAvailableQuantity(productId);
    }
}
