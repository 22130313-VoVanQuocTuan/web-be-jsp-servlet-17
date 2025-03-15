package hcmuaf.nlu.edu.vn.controller.user.pay;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.imageio.ImageIO;

@WebServlet(name = "GenerateCaptchaController", value ="/generateCaptcha")
public class GenerateCaptchaController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int width = 150, height = 50;
        char[] captchaChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
        StringBuilder captchaStr = new StringBuilder();
        Random rand = new Random();
        for (int i = 0; i < 5; i++) {
            captchaStr.append(captchaChars[rand.nextInt(captchaChars.length)]);
        }

        // Lưu CAPTCHA vào session
        HttpSession session = request.getSession();
        session.setAttribute("captcha", captchaStr.toString());

        // Tạo hình ảnh CAPTCHA
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = img.createGraphics();
        g2d.setFont(new Font("Arial", Font.BOLD, 24));
        g2d.setColor(Color.WHITE);
        g2d.fillRect(0, 0, width, height);
        g2d.setColor(Color.BLACK);
        g2d.drawString(captchaStr.toString(), 20, 35);
        g2d.dispose();

        // Xuất ảnh dưới dạng PNG
        response.setContentType("image/png");
        ImageIO.write(img, "png", response.getOutputStream());
    }
}