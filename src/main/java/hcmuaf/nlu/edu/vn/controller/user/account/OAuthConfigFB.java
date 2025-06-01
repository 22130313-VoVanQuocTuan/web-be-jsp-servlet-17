package hcmuaf.nlu.edu.vn.controller.user.account;

import java.io.InputStream;
import java.util.Properties;

public class OAuthConfigFB {
    private static String CLIENT_ID;
    private static String CLIENT_SECRET;
    private static String REDIRECT_URI;

    static {
        try {
            Properties props = new Properties();
            InputStream input = OAuthConfigFB.class.getClassLoader().getResourceAsStream("oauth.properties");

            if (input != null) {
                props.load(input);
                CLIENT_ID = props.getProperty("CLIENT_ID");
                CLIENT_SECRET = props.getProperty("CLIENT_SECRET");
                REDIRECT_URI = props.getProperty("REDIRECT_URI");
                input.close();
                // Debug log (chỉ giữ lại nếu cần trong dev)
                System.out.println("[OK] Đã load oauth.properties thành công");
            } else {
                System.err.println("[ERROR] Không tìm thấy oauth.properties trong classpath.");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Có thể thay bằng logger nếu dùng log framework
        }
    }

    public static String getClientID() {
        return CLIENT_ID;
    }

    public static String getClientSecret() {
        return CLIENT_SECRET;
    }

    public static String getRedirectUri() {
        return REDIRECT_URI;
    }
}
