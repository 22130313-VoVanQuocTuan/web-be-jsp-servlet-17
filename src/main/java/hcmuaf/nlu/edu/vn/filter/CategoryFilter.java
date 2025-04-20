package hcmuaf.nlu.edu.vn.filter;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import hcmuaf.nlu.edu.vn.model.Category;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*") // Áp dụng filter cho tất cả các request
public class CategoryFilter implements Filter {
    private ProductService productService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        productService = new ProductService();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();

        // Kiểm tra session, nếu chưa có thì lấy danh mục từ database
        if (session.getAttribute("categories") == null) {
            try {
                List<Category> categories = productService.getAllCategories();
                // Lưu danh mục vào session để có thể sử dụng trong toàn bộ trang web
                session.setAttribute("categories_all", categories);
            } catch (SQLException e) {
                throw new ServletException("Lỗi khi lấy danh mục từ database", e);
            }
        }

        chain.doFilter(request, response); // Tiếp tục xử lý request
    }

    @Override
    public void destroy() {
    }
}
