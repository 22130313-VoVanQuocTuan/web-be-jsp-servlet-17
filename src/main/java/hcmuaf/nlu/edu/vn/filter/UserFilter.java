package hcmuaf.nlu.edu.vn.filter;

import hcmuaf.nlu.edu.vn.model.Users;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "admin-filter", urlPatterns = "/admin/*")
public class UserFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false); // nếu chưa đăng nhập thì ko tạo ra session mới
        Users user = (session != null) ? (Users) session.getAttribute("user") : null;

        if (user == null || !user.getRole().equals("user")) {
            res.sendRedirect(req.getContextPath() + "/users/page/login-signup.jsp"); // Redirect đến trang đăng nếu không phải user
            return;
        }

        chain.doFilter(request, response); // Tiếp tục xử lý nếu là user
    }
    @Override
    public void destroy() {

    }
}

