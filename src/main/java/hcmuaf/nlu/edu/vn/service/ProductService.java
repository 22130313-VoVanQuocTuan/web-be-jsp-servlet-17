package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.products.*;

import hcmuaf.nlu.edu.vn.model.Category;
import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.model.Promotionals;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    private final GetListPDiscountDao getListPDiscountDao;

    private final ProductDao productDAO = new ProductDao();
    private final ApplyPromotionalInCartDao promotionalDao;
    private final ProductFilterDao productFilterDao = new ProductFilterDao();

    private final GetProductDao getProductDao;

    public ProductService() {
        this.getListPDiscountDao = new GetListPDiscountDao();
        this.getProductDao = new GetProductDao();
        this.promotionalDao = new ApplyPromotionalInCartDao();
    }

    //Lấy ra danh  sách sản phẩm khuyến mãi
    public List<Product> getListProductDiscount() {
        return getListPDiscountDao.getistProductDiscount();
    }

    // Lấy ra danh sách tát cả sản phẩm
    public List<Product> getAllProducts() throws SQLException {
        return productDAO.getAllProducts();
    }
    public List<Category> getAllCategories() throws SQLException {
        return productDAO.getAllCategories();
    }

    // Lấy ra danh sách tát cả sản phẩm của danh mục
    public List<Product> getAllProductsCategory(int categoryId) throws SQLException {
        return productDAO.getAllProductsCategory(categoryId);
    }

    // Lấy ra sản phẩm theo id
    public Product getProductById(int id) {
        return getProductDao.getProduct(id);
    }

    //Hàm thêm sản phẩm
    public boolean addProduct(Product product) {
        return productDAO.addProduct(product);
    }

    // Phương thức cập nhật thông tin sản phẩm
    public boolean updateProduct(int id,Product product) {
        return productDAO.updateProduct(id,product);
    }

    // Hàm xóa sản phẩm
    public boolean deleteProduct(String id, String realPath) {
        return productDAO.deleteProduct(id,realPath);
    }

    // -------------------Các phương thức filter sản phẩm-------------------------
    // Các sản phẩm phổ biến thoe lượt bán
    public List<Product> getPopularProducts() throws SQLException {
        return productFilterDao.getPopularProducts();
    }

    public List<Product> getNewestProducts() throws SQLException {
        return productFilterDao.getNewestProducts();
    }

    public List<Product> getPopularProductsByCategory(int categoryId) throws SQLException {
        return productFilterDao.getPopularProductsByCategory(categoryId);
    }

    public List<Product> getNewestProductsByCategory(int categoryId) throws SQLException {
        return productFilterDao.getNewestProductsByCategory(categoryId);
    }

    public List<Product> getProductsByPriceDescending() throws SQLException {
        return productFilterDao.getProductsByPriceDescending();
    }

    public List<Product> getProductsByPriceAscending() throws SQLException {
        return productFilterDao.getProductsByPriceAscending();
    }

    public List<Product> getProductsByPriceDescendingAndCategoryId(int categoryId) throws SQLException {
        return productFilterDao.getProductsByPriceDescendingAndCategoryId(categoryId);
    }

    public List<Product> getProductsByPriceAscendingAndCategoryId(int categoryId) throws SQLException {
        return productFilterDao.getProductsByPriceAscendingAndCategoryId(categoryId);
    }

    public List<Promotionals> getListPromotional() {
        return promotionalDao.getListPromotional();

    }

    //Lấy danh sách sản phẩm theo tên tìm kiếm
    public List<Product> getListProductByName(String name) throws SQLException {
        return productDAO.getListProductByName(name);
    }
    // Cập nhật lượt xem khi ấn vào trang chi tiết sản phẩm.
    public boolean updateViewProduct(int id) {
        return productDAO.updateViewProduct( id);
    }

    // Cập nhật lượt bán
    public boolean updateSoldCountProduct(int id,int quantity){
        return productDAO.updateSoldCountProduct(id,quantity);
    }

    public int getLastInsertedProductId() {
        return productDAO.getLastInsertedProductId();
    }
}

