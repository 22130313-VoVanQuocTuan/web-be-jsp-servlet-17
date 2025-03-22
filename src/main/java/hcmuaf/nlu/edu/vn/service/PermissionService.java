package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.Users.PermissionDao;

public class PermissionService {
    private PermissionDao permissionDao;

    public PermissionService() {
        this.permissionDao = new PermissionDao();
    }

    public void updatePermissions(int userId, String module, boolean canView, boolean canAdd, boolean canEdit, boolean canDelete) throws Exception {
        permissionDao.updatePermissions(userId, module, canView,canAdd, canEdit, canDelete);
    }
}
