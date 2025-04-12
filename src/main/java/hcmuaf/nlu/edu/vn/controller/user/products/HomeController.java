package hcmuaf.nlu.edu.vn.controller.user.products;

import com.google.gson.Gson;
import hcmuaf.nlu.edu.vn.model.Promotionals;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        // Kiểm tra nếu là AJAX request thì trả JSON banner
        String requestedWith = req.getHeader("X-Requested-With");
        boolean isAjax = "XMLHttpRequest".equals(requestedWith);

        if (isAjax) {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            List<Banner> bannerSlider = homeService.getListBanner();
            Banner banner = homeService.getSingleBanner();
            Map<String, Object> data = new HashMap<>();
            data.put("banners", bannerSlider);
            data.put("banner", banner);

            Gson gson = new Gson();
            String json = gson.toJson(data);
            resp.getWriter().write(json);
            return;
        }

        if (user != null && !user.getRole().equals("user")) {
            resp.sendRedirect(req.getContextPath() + "/logout");
            session.removeAttribute("redirectUrl");
            return;
        }
        try {
            List<Product> products = productService.getListProductDiscount();
            List<Product> productsCategory = productService.getAllProducts();
            List<Product> productPopular = productService.getPopularProducts();
            List<Promotionals> list = productService.getListPromotional();
            try {
                List<Category> categories = productService.getAllCategories();
                req.setAttribute("categories", categories);
            } catch (Exception e) {
                System.out.println(e.toString());
            }
            session.setAttribute("promotionals", list);

            // Gửi dữ liệu sản phẩm và categoryId đến JSP để hiển thị
            req.setAttribute("productsCategory", productsCategory);
            req.setAttribute("productPopular", productPopular);
            req.setAttribute("products", products);
            req.getRequestDispatcher("home.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
