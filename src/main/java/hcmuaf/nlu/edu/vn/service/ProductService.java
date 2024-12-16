package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.products.GetListPDiscountDao;
import hcmuaf.nlu.edu.vn.dao.products.ProductDao;
import hcmuaf.nlu.edu.vn.model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private final GetListPDiscountDao getListPDiscountDao;
    private final ProductDao productDAO = new ProductDao();
    public ProductService() {
        this.getListPDiscountDao = new GetListPDiscountDao();
    }

    //Lấy ra danh  sách sản phẩm khuyến mãi
    public List<Product> getListProductDiscount() {
        return getListPDiscountDao.getistProductDiscount();
    }
    // Lấy ra danh sách tát cả sản phẩm
    public List<Product> getAllProducts() throws SQLException {
        return productDAO.getAllProducts();
    }
    // Lấy ra danh sách tát cả sản phẩm của danh mục
    public List<Product> getAllProductsCategory(int categoryId) throws SQLException  {
        return productDAO.getAllProductsCategory(categoryId);
    }
}
