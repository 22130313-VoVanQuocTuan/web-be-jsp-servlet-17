package hcmuaf.nlu.edu.vn.controller.user.products;

import hcmuaf.nlu.edu.vn.model.Banner;
import hcmuaf.nlu.edu.vn.model.Category;
import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.HomeService;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "home-page", value = "/home-page")
public class HomeController extends HttpServlet {
    private final ProductService productService;
    private final HomeService homeService;

    public HomeController() {
        homeService = new HomeService();
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user != null && !user.getRole().equals("user")) {
            resp.sendRedirect(req.getContextPath() + "/logout");
            return;
        }
        try {
            List<Product> products = productService.getListProductDiscount();
            List<Product> productsCategory = productService.getAllProducts();
            List<Product> productPopular = productService.getPopularProducts();
            List<Banner> bannerSlider = homeService.getListBanner();
            try {
                Banner banner = homeService.getSingleBanner();
                req.setAttribute("banners", banner);
                List<Category> categories = productService.getAllCategories();
                req.setAttribute("categories", categories);
            } catch (Exception e) {
                System.out.println(e.toString());
            }

            // Gửi dữ liệu sản phẩm và categoryId đến JSP để hiển thị
            req.setAttribute("productsCategory", productsCategory);
            req.setAttribute("productPopular", productPopular);
            req.setAttribute("products", products);
            req.setAttribute("banners_Slider", bannerSlider);
            req.getRequestDispatcher("home.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
