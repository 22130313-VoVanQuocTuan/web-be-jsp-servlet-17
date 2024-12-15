package hcmuaf.nlu.edu.vn.controller.user.products;

import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


 @WebServlet(name = "product", value = "/product-detail")
public class GetProductController extends HttpServlet {
    private  final  ProductService productService ;
    public GetProductController() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            Product product = productService.getProductById(id);
            req.setAttribute("product", product);
            req.getRequestDispatcher("/users/page/product-detail.jsp").forward(req, resp);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

}