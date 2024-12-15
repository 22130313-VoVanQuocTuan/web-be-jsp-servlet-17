package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.products.GetListPDiscountDao;
import hcmuaf.nlu.edu.vn.dao.products.GetProductDao;
import hcmuaf.nlu.edu.vn.model.Product;

import java.util.List;

public class ProductService {
    private final GetListPDiscountDao getListPDiscountDao;
    private final GetProductDao getProductDao;
    public ProductService() {
        this.getListPDiscountDao = new GetListPDiscountDao();
        this.getProductDao = new GetProductDao();
    }
    //Lấy ra danh  sách sản phẩm khuyến mãi
    public List<Product> getListProductDiscount (){
        return getListPDiscountDao.getistProductDiscount();
    }
    public Product getProductById(int id){
        return getProductDao.getProduct(id) ;
    }
}
