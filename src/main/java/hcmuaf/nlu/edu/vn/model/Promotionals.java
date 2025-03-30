package hcmuaf.nlu.edu.vn.model;

import java.sql.Timestamp;

public class Promotionals {
    private int id;
    private String code;
    private double value;
    private Timestamp startDate;
    private Timestamp endDate;
    private String status;

    public Promotionals(String code, double value) {
        this.code = code;
        this.value = value;
    }

    public Promotionals(int id,String code, double value, Timestamp startDate, Timestamp endDate,String status) {
        this.id = id;
        this.code = code;
        this.value = value;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }
    public Promotionals(String code, double value, Timestamp startDate, Timestamp endDate,String status) {

        this.code = code;
        this.value = value;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public Promotionals() {

    }


    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public double getValue() {
        return value;
    }
    public void setValue(double value) {
        this.value = value;
    }
}
