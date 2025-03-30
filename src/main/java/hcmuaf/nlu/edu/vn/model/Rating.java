package hcmuaf.nlu.edu.vn.model;

import java.sql.Date;

public class Rating {
    private int id;
    private int productId;
    private int userId;
    private String username;
    private String content;
    private Date createdAt;

    public Rating(int id, int productId, int userId, String content, Date createdAt) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
        this.content = content;
        this.createdAt = createdAt;
    }
    public  Rating(int productId, int userId, String content) {
        this.productId = productId;
        this.userId = userId;
        this.content = content;
    }

    public Rating(int id, int productId, int userId, String username, String content, Date createdAt) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
        this.username = username;
        this.content = content;
        this.createdAt = createdAt;
    }

    public String getUsername() {
        return username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

}
