package hcmuaf.nlu.edu.vn.controller.user.account;

import java.io.InputStream;
import java.util.Properties;

public class OAuthConfigFB {
    private static String REDIRECT_URI;

    static {
        try {
            Properties props = new Properties();
            // Load file từ classpath (src/main/resources)
            InputStream input = OAuthConfigFB.class.getClassLoader().getResourceAsStream("oauth.properties");

            if (input != null) {
                props.load(input);
                REDIRECT_URI = props.getProperty("REDIRECT_URI");
                input.close();
                System.out.println("[OK] Đã load oauth.properties thành công: " + REDIRECT_URI);
            } else {
                System.err.println("[ERROR] Không tìm thấy oauth.properties trong classpath.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getRedirectUri() {
        return REDIRECT_URI;
    }
}
