package hcmuaf.nlu.edu.vn.model;

public class Permissions {
    private int id;
    private int userId;
    private String module;
    private boolean canView;
    private boolean canAdd;
    private boolean canEdit;
    private boolean canDelete;

    public Permissions(boolean canView, boolean canAdd, boolean canEdit, boolean canDelete) {
        this.canView = canView;
        this.canAdd = canAdd;
        this.canDelete = canDelete;
        this.canEdit = canEdit;
    }

    public Permissions(int id, int userId, String module, boolean canView, boolean canAdd, boolean canEdit, boolean canDelete) {
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

    public boolean getCanView() {
        return canView;
    }

    public void setCanView(boolean canView) {
        this.canView = canView;
    }

    public boolean getCanAdd() {
        return canAdd;
    }

    public void setCanAdd(boolean canAdd) {
        this.canAdd = canAdd;
    }

    public boolean getCanEdit() {
        return canEdit;
    }

    public void setCanEdit(boolean canEdit) {
        this.canEdit = canEdit;
    }

    public boolean getCanDelete() {
        return canDelete;
    }

    public void setCanDelete(boolean canDelete) {
        this.canDelete = canDelete;
    }
}
