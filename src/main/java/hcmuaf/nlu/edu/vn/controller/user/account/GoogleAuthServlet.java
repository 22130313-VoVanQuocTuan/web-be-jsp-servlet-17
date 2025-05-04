package hcmuaf.nlu.edu.vn.controller.user.account;// GoogleAuthServlet.java
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;

import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.Arrays;

@WebServlet(   name = "LoginGG" , value = "/loginGG")
public class GoogleAuthServlet extends HttpServlet {
    private static final String CLIENT_ID = "411211314163-cdglpiehn92eusikjg120u54t4sc18br.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "http://localhost:8888/tqh/oauth2callback";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        GoogleClientSecrets.Details web = new GoogleClientSecrets.Details();
        web.setClientId(CLIENT_ID);
        web.setClientSecret(CLIENT_SECRET);

        GoogleClientSecrets clientSecrets = new GoogleClientSecrets().setWeb(web);

        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                new NetHttpTransport(),
                JacksonFactory.getDefaultInstance(),
                clientSecrets,
                Arrays.asList("https://www.googleapis.com/auth/userinfo.profile",
                        "https://www.googleapis.com/auth/userinfo.email"))
                .setAccessType("offline")
                .setApprovalPrompt("force")
                .build();

        String url = flow.newAuthorizationUrl()
                .setRedirectUri(REDIRECT_URI)
                .build();

        response.sendRedirect(url);
    }
}