package hcmuaf.nlu.edu.vn.controller.user.products;

import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "list-product", value = "/list-product")
public class GetListPDiscountController extends HttpServlet {
    private  final ProductService productService ;
    public GetListPDiscountController() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Product> products = productService.getListProductDiscount();
            req.setAttribute("products", products);
            req.getRequestDispatcher("home.jsp").forward(req, resp);

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
