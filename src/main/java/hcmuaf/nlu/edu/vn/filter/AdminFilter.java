package hcmuaf.nlu.edu.vn.filter;

import hcmuaf.nlu.edu.vn.model.Users;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

@WebFilter(filterName = "admin-filter", urlPatterns = {"/add-account", "/delete-account", "/accounts", "/status-account",
"/add-promotional", "/delete-promotional", "/promotional-list"})
public class AdminFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false); // nếu chưa đăng nhập thì ko tạo ra session mới
        Users user = (session != null) ? (Users) session.getAttribute("user") : null;

        if (user == null || !user.getRole().equals("admin")) {
            req.getRequestDispatcher( "/users/page/login-signup.jsp").forward(req, res); // Redirect đến trang lỗi nếu không phải admin
            return;
        }

        chain.doFilter(request, response); // Tiếp tục xử lý nếu là admin
    }
    @Override
    public void destroy() {

    }
}
