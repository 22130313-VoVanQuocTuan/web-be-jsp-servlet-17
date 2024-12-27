package hcmuaf.nlu.edu.vn.controller.admin.promotional;

import hcmuaf.nlu.edu.vn.model.Promotionals;
import hcmuaf.nlu.edu.vn.service.PromotionalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "listPromotional", value = "/promotional-list")
public class GetListPromotional extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PromotionalService promotionalService = new PromotionalService();
        String showAll = req.getParameter("showAll");
        //tìm kiếm
        String search = req.getParameter("search");
        String valueStr = req.getParameter("value");
        try{
        List<Promotionals> listPromotional = promotionalService.getListPromotional();
            if(search!=null){
                try {
                    double value = Double.parseDouble(valueStr);
                    listPromotional = promotionalService.getListPromotionalByValue(value);
                }catch (NumberFormatException e){
                    e.printStackTrace();

                }
            }
            if (showAll == null) {
                // Hiển thị tối đa 10 mục
                listPromotional = listPromotional.stream().limit(10).collect(Collectors.toList());
            }

        req.setAttribute("listPromotional", listPromotional);
        req.getRequestDispatcher("/admin/pages/promotional.jsp").forward(req, resp);

    }catch (Exception e){
        throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
