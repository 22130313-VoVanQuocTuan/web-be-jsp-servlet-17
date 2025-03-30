package hcmuaf.nlu.edu.vn.filter;


import hcmuaf.nlu.edu.vn.model.Permissions;
import hcmuaf.nlu.edu.vn.model.Users;
import hcmuaf.nlu.edu.vn.service.PermissionService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

@WebFilter(filterName = "admin-filter", urlPatterns = {"/add-account", "/delete-account", "/status-account", "/update-status-role-account","/update-permissions-admin",
"/add-promotional", "/delete-promotional", "/update-status-promotional" ,"/delete-rating"
        , "/add-delete-category" ,"/add-product","/delete-product","/edit-product", "/update-status-order",
        "/delete-order","/delete-Log", "/cleanLog"})
public class AdminFilter implements Filter {
    private PermissionService permissionService;

    public AdminFilter() {
        this.permissionService = new PermissionService();
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        Users user = (session != null) ? (Users) session.getAttribute("user") : null;
        System.out.println("Usser: " + user.getId());

        if (user == null) {
            redirectToLogin(req, res);
            return;
        }

        // Lấy module từ URL
        String requestUri = req.getRequestURI();
        String module = getModuleFromUrl(requestUri);
        System.out.println("Request URI: " + requestUri);
        System.out.println("Mapped Module: " + module);

        PermissionService permissionService = new PermissionService();
        // Lấy quyền từ DB
        Permissions permission = permissionService.getPermissions(user.getId(), module);
        if (permission == null || !hasAccess(permission, requestUri)) {
            // Đặt thông báo vào session
            session.setAttribute("errorMessage", "Bạn không có quyền truy cập chức năng này.");

            // Chuyển hướng về trang trước đó
            res.sendRedirect(req.getHeader("Referer") != null ? req.getHeader("Referer") : req.getContextPath() + "/index.jsp");
            return;
        }

        chain.doFilter(request, response); // Cho phép tiếp tục request
    }


    // Ánh xạ URL sang module
    private String getModuleFromUrl(String requestUri) {
        if (requestUri.contains("account")) return "user";
        if (requestUri.contains("product")) return "product";
        if (requestUri.contains("category")) return "category";
        if (requestUri.contains("order")) return "order";
        if (requestUri.contains("rating") || requestUri.contains("review")) return "review";
        if (requestUri.contains("promotional")) return "promotional";
        if (requestUri.contains("admin")) return "admin";
        if (requestUri.contains("Log")) return "Log";
        return null;
    }

    // Kiểm tra quyền theo hành động
    private boolean hasAccess(Permissions permission, String requestUri) {
        if (requestUri.contains("add")) return permission.getCanAdd();
        if (requestUri.contains("delete") || requestUri.contains("clean")) return permission.getCanDelete();
        if (requestUri.contains("edit") || requestUri.contains("update")) return permission.getCanEdit();
        return permission.getCanView(); // Mặc định cần quyền xem
    }

    // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
    private void redirectToLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getSession(true).setAttribute("redirectUrl", req.getRequestURI());
        req.getRequestDispatcher("/users/page/login-signup.jsp").forward(req, res);
    }
    @Override
    public void destroy() {

    }
}
