package hcmuaf.nlu.edu.vn.service;

import hcmuaf.nlu.edu.vn.dao.Users.PermissionDao;
import hcmuaf.nlu.edu.vn.model.Permissions;

import java.sql.SQLException;

public class PermissionService {
    private PermissionDao permissionDao;

    public PermissionService() {
        this.permissionDao = new PermissionDao();
    }

    public void updatePermissions(int userId, String module, boolean canView, boolean canAdd, boolean canEdit, boolean canDelete) throws Exception {
        permissionDao.updatePermissions(userId, module, canView,canAdd, canEdit, canDelete);
    }

    // Kiểm tra quyền của user trên module cụ thể
    public boolean hasPermission(int userId, String module, String permissionType) throws SQLException {
        return permissionDao.checkPermission(userId, module, permissionType);
    }
    // Kiểm tra quyền của user trên module cụ thể
    public Permissions getPermissions(int userId, String module) {
        return permissionDao.getPermission(userId, module);
    }
}
