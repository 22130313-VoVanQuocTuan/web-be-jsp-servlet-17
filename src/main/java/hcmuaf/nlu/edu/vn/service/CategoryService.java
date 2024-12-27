package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.category.CategoryDao;
import hcmuaf.nlu.edu.vn.model.Category;

import java.util.List;

public class CategoryService {
    private final CategoryDao categoryDao;
    public CategoryService() {
        categoryDao = new CategoryDao();
    }


    // Thêm danh mục
    public boolean addCategory(String name) {
        return categoryDao.addCategory(name);
    }

    //Xóa danh mục
    public boolean deleteCategory(int id) {
        return categoryDao.deleteCategory(id);
    }

    // lấy danh sách danh mục

    public List<Category> getAllCategory() {
        return categoryDao.getAllCategory();
    }

    // Lấy danh sách theo tên
    public List<Category> getCategory(String name) {
        return categoryDao.getCategoryByName(name);
    }
}
