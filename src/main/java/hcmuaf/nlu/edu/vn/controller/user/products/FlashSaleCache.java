package hcmuaf.nlu.edu.vn.controller.user.products;

import hcmuaf.nlu.edu.vn.model.Product;
import hcmuaf.nlu.edu.vn.service.ProductService;

import java.util.List;

public class FlashSaleCache {
    private static List<Product> cachedProducts = null;
    private static long lastUpdated = 0;
    private static final long CACHE_DURATION_MS = 3 * 60 * 1000; // 3 phút

    public static List<Product> getCachedFlashSaleProducts() {
        long currentTime = System.currentTimeMillis();
        long cacheExpiredTimeMs = currentTime - lastUpdated;

        // Debug log để kiểm tra giá trị
        System.out.println("Current Time: " + currentTime);
        System.out.println("Last Updated: " + lastUpdated);
        System.out.println("Cache Expired Time (ms): " + cacheExpiredTimeMs);

        if (cachedProducts == null || cacheExpiredTimeMs > CACHE_DURATION_MS) {
            // MISS: Cập nhật cache
            ProductService productService = new ProductService();
            cachedProducts = productService.getListProductDiscount();
            lastUpdated = currentTime;  // Cập nhật lại thời gian
            System.out.println("Cache MISS - Fresh Data Loaded");
        } else {
            // HIT: Sử dụng cache cũ
            System.out.println("Cache HIT");
        }
        return cachedProducts;
    }

    public static long getLastUpdated() {
        return lastUpdated;
    }
}
