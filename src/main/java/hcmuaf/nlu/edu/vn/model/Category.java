package hcmuaf.nlu.edu.vn.model;

import java.sql.Timestamp;

public class Category {
    private int id;
    private String name;
    private Timestamp createDate;
    private boolean isDeleted;

    public Category(int id, String name, Timestamp createDate) {
        this.id = id;
        this.name = name;
        this.createDate = createDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDeleted(boolean deleted) {
        isDeleted = deleted;
    }
}
