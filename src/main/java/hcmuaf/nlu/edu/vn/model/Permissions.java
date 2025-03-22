package hcmuaf.nlu.edu.vn.model;

public class Permissions {
    private int id;
    private int userId;
    private String module;
    private int canView;
    private int canAdd;
    private int canEdit;
    private int canDelete;

    public Permissions() {
    }

    public Permissions(int id, int userId, String module, int canView, int canAdd, int canEdit, int canDelete) {
        this.id = id;
        this.userId = userId;
        this.module = module;
        this.canView = canView;
        this.canAdd = canAdd;
        this.canEdit = canEdit;
        this.canDelete = canDelete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public int getCanView() {
        return canView;
    }

    public void setCanView(int canView) {
        this.canView = canView;
    }

    public int getCanAdd() {
        return canAdd;
    }

    public void setCanAdd(int canAdd) {
        this.canAdd = canAdd;
    }

    public int getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(int canEdit) {
        this.canEdit = canEdit;
    }

    public int getCanDelete() {
        return canDelete;
    }

    public void setCanDelete(int canDelete) {
        this.canDelete = canDelete;
    }
}
