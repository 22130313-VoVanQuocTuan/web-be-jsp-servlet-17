package hcmuaf.nlu.edu.vn.util;

import jakarta.servlet.http.HttpServletRequest;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

public class VNPayUtil {
    public static String createPaymentUrl(HttpServletRequest request, long amount, int orderId) {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_OrderInfo = "Thanh toan don hang";
        String vnp_OrderType = "other";
        String vnp_Amount = String.valueOf(amount * 100);
        String vnp_CurrCode = "VND";
        String vnp_Locale = "vn";
        String vnp_TxnRef = UUID.randomUUID().toString();

        // Thời gian tạo giao dịch
        String vnp_CreateDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

        // Thời gian hết hạn (15 phút sau thời gian tạo)
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = new SimpleDateFormat("yyyyMMddHHmmss").format(calendar.getTime());

        String vnp_IpAddr = request.getRemoteAddr();

        String query = "vnp_Version=" + vnp_Version +
                "&vnp_Command=" + vnp_Command +
                "&vnp_TmnCode=" + VNPAYConfig.TMNCODE +
                "&vnp_Amount=" + vnp_Amount +
                "&vnp_CurrCode=" + vnp_CurrCode +
                "&vnp_TxnRef=" + vnp_TxnRef +
                "&vnp_OrderInfo=" + vnp_OrderInfo +
                "&vnp_OrderType=" + vnp_OrderType +
                "&vnp_ReturnUrl=" + VNPAYConfig.RETURN_URL +  "?orderId=" + orderId +
                "&vnp_CreateDate=" + vnp_CreateDate +
                "&vnp_ExpireDate=" + vnp_ExpireDate +
                "&vnp_IpAddr=" + vnp_IpAddr +
                "&vnp_Locale=" + vnp_Locale;

        String vnp_SecureHash = hmacSHA512(VNPAYConfig.HASH_SECRET, query);
        return VNPAYConfig.VNP_URL + "?" + query + "&vnp_SecureHash=" + vnp_SecureHash;
    }

    private static String hmacSHA512(String key, String data) {
        try {
            Mac hmacSHA512 = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmacSHA512.init(secretKey);
            byte[] hash = hmacSHA512.doFinal(data.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            throw new RuntimeException("Error creating HMAC SHA512 hash", e);
        }
    }
}
