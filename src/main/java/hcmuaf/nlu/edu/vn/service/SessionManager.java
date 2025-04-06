package hcmuaf.nlu.edu.vn.service;

import jakarta.servlet.http.HttpSession;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class SessionManager {
    private static final Map<Integer, HttpSession> userSessions = new ConcurrentHashMap<>();

    // Lưu session khi người dùng đăng nhập
    public static void addSession(int userId, HttpSession session) {
        userSessions.put(userId, session);
    }

    // Xóa session khi người dùng bị hạ quyền hoặc xóa tài khoản
    public static void invalidateSession(int userId) {
        HttpSession session = userSessions.get(userId);
            if (session != null) {
                try {
                    session.invalidate();
                } catch (IllegalStateException e) {
                    System.out.println("Session của userId " + userId + " đã bị hủy trước đó.");
                } finally {
                    userSessions.remove(userId);
                }
            }
        }
}

