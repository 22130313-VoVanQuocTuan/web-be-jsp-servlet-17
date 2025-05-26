package hcmuaf.nlu.edu.vn.filter;

import hcmuaf.nlu.edu.vn.model.Users;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "user-filter", urlPatterns = {"/add-cart", "/cart-remove", "/cart-items","/create-rating", "/update-info-shipping"})
public class UserFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false); // Không tạo session mới nếu chưa đăng nhập
        Users user = (session != null) ? (Users) session.getAttribute("user") : null;

        if (user == null || !"user".equalsIgnoreCase(user.getRole())) {
            // Nếu là AJAX request thì trả JSON thay vì forward
            String requestedWith = req.getHeader("X-Requested-With");
            boolean isAjax = "XMLHttpRequest".equalsIgnoreCase(requestedWith);

            if (isAjax) {
                res.setContentType("application/json");
                res.setCharacterEncoding("UTF-8");
                res.getWriter().write("{\"status\":\"unauthenticated\"}");
            } else {
                // Lưu URL hiện tại để chuyển hướng sau khi login
                String currentUrl = req.getRequestURI();
                String queryString = req.getQueryString();
                if (queryString != null) {
                    currentUrl += "?" + queryString;
                }
                req.getSession(true).setAttribute("redirectUrl", currentUrl);

                req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, res);
            }
        } else {
            chain.doFilter(request, response); // Nếu đã login, tiếp tục xử lý
        }
    }


    @Override
    public void destroy() {
    }
}
