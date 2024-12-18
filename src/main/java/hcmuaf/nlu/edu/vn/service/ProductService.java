package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.products.GetListPDiscountDao;

import hcmuaf.nlu.edu.vn.dao.products.ProductDao;

import hcmuaf.nlu.edu.vn.dao.products.GetProductDao;

import hcmuaf.nlu.edu.vn.dao.products.ProductFilterDao;
import hcmuaf.nlu.edu.vn.model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private final GetListPDiscountDao getListPDiscountDao;

    private final ProductDao productDAO = new ProductDao();
    private final ProductFilterDao productFilterDao = new ProductFilterDao();

    private final GetProductDao getProductDao;

    public ProductService() {
        this.getListPDiscountDao = new GetListPDiscountDao();
        this.getProductDao = new GetProductDao();
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
    public List<Product> getAllProductsCategory(int categoryId) throws SQLException {
        return productDAO.getAllProductsCategory(categoryId);
    }

    // Lấy ra sản phẩm theo id
    public Product getProductById(int id) {
        return getProductDao.getProduct(id);
    }

    // -------------------Các phương thức filter sản phẩm-------------------------
    // Các sản phẩm phổ biến thoe lượt bán
    public List<Product> getPopularProducts() throws SQLException {
        return productFilterDao.getPopularProducts();
    }

    public List<Product> getNewestProducts() throws SQLException {
        return productFilterDao.getNewestProducts();
    }
    public List<Product> getPopularProductsByCategory(int categoryId) throws SQLException{
        return productFilterDao.getPopularProductsByCategory(categoryId);
    }

    public List<Product> getNewestProductsByCategory(int categoryId) throws SQLException{
        return productFilterDao.getNewestProductsByCategory(categoryId);
    }

}

