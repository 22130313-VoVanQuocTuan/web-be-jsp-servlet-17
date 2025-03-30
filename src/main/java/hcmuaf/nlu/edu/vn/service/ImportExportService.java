package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.Import_export_stock.ImportExportDao;
import hcmuaf.nlu.edu.vn.model.Import_Export_Stock;

import java.util.List;

public class ImportExportService {
    private ImportExportDao importExportDao ;
    public ImportExportService() {
        importExportDao = new ImportExportDao();
    }

    public List<Import_Export_Stock> getListAllImportExportStock(){
        return importExportDao.getListAllImportExportStock();
    }
}
