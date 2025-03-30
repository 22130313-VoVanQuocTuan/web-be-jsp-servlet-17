package hcmuaf.nlu.edu.vn.controller.user.products;

import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.model.Rating;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.ProductService;
import hcmuaf.nlu.edu.vn.service.RatingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "product", value = "/product-detail")
public class GetProductDetailController extends HttpServlet {
    private  final  ProductService productService ;
    private  final RatingService ratingService ;
    public GetProductDetailController() {
        productService = new ProductService();
        ratingService = new RatingService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user != null && !user.getRole().equals("user")) {
            resp.sendRedirect(req.getContextPath() + "/logout");
            return;
        }

        // nếu có đánh giá
        String ratingStatus = req.getParameter("rating");
        if ("success".equals(ratingStatus)) {
            req.setAttribute("rating", "Đánh giá thành công");
        } else if ("fail".equals(ratingStatus)) {
            req.setAttribute("rating", "Đánh giá thất bại");
        }
        //KHÔNG CÓ ĐÁNH GIÁ
        try {
            Product product = productService.getProductById(id);
            List<Product> allProductsCategory = productService.getAllProductsCategory(categoryId);
            List<Rating> ratings = ratingService.getRatingsByProductId(id);
            productService.updateViewProduct(id);
            req.setAttribute("product", product);
            req.setAttribute("productCategory", allProductsCategory);
            req.setAttribute("ratings", ratings);
            req.getRequestDispatcher("/users/page/product-detail.jsp").forward(req, resp);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}