package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.controller.admin.ImportExportStock.ImportStock;
import hcmuaf.nlu.edu.vn.dao.Import_export_stock.ImportExportDao;
import hcmuaf.nlu.edu.vn.model.Import_Export_Stock;
import hcmuaf.nlu.edu.vn.model.Inventory;

import java.util.List;

public class ImportExportService {
    private ImportExportDao importExportDao;

    public ImportExportService() {
        importExportDao = new ImportExportDao();
    }

    public List<Import_Export_Stock> getListAllImportExportStock() {
        return importExportDao.getListAllImportExportStock();
    }

    // Nhập kho
    public void importStock(String productId, int quantity) {
        importExportDao.importStock(productId, quantity);
    }

    // Xuất kho
    public void exportStock(String productId, int quantity) {
        importExportDao.exportStock(productId, quantity);
    }

    // Nhập kho
    public void addInfoImportExportStock(String transactionType, String transactionDate, int userId, String note, int quantity, String productId) {

        importExportDao.addInfoImportExportStock(transactionType, transactionDate, userId, note, quantity, productId);
    }

    public void updateInventoryStatus(String productId) {
        importExportDao.updateInventoryStatus(productId);
    }

    // kiểm tra số lượng
    public int getQuantity(String productId) {
        return importExportDao.getQuantity(productId);
    }

    // Lấy ra số lượng tối đa
    public int getMaximumQuantity(String productId) {
        return importExportDao.getMaximumQuantity(productId);
    }

    public void deleteTransactionStock(String transactionId) {
        importExportDao.deleteTransactionStock(transactionId);
    }

    public Inventory getInventoryById(String productId) {
        return importExportDao.getInventoryById(productId);
    }
}


