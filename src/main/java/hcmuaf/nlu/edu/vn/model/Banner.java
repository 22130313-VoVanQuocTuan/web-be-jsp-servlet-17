package hcmuaf.nlu.edu.vn.model;

public class Banner {
    private int id;
    private String image_url;
    private String type;

    public Banner() {
    }

    public Banner(int id ,String image_url, String type) {
        this.id = id;
        this.image_url = image_url;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public String getImage_url() {
        return image_url;
    }

    public String getType() {
        return type;
    }
}
