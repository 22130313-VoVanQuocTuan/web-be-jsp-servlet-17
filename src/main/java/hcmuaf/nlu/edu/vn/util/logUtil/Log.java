package hcmuaf.nlu.edu.vn.util.logUtil;

import com.google.api.client.util.DateTime;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Log {
    private int id;
    private String level;
    private String username;
    private Timestamp startLog;
    private String address;
    private String dataBefore;
    private String dataAfter;

    public Log() {
    }

    public Log(int id, String level, String username, Timestamp   startLog, String address, String dataBefore, String dataAfter) {
        this.id = id;
        this.level = level;
        this.username = username;
        this.startLog = startLog;
        this.address = address;
        this.dataBefore = dataBefore;
        this.dataAfter = dataAfter;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Timestamp   getStartLog() {
        return startLog;
    }

    public void setStartLog(Timestamp   startLog) {
        this.startLog = startLog;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDataBefore() {
        return dataBefore;
    }

    public void setDataBefore(String dataBefore) {
        this.dataBefore = dataBefore;
    }

    public String getDataAfter() {
        return dataAfter;
    }

    public void setDataAfter(String dataAfter) {
        this.dataAfter = dataAfter;
    }
}
