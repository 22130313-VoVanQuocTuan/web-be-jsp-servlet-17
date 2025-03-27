<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng điều khiển Quản trị viên </title>
    <!------------------ Kiểu dáng ------------------>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/admin/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/css/user.css"/>">

    <!-- Thêm jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Thêm DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

</head>
<style>
    .dataTables_wrapper .dataTables_filter input {
        border: 2px solid #1c1919 !important;
        margin-bottom: 10px !important;
    }
    .hov a {
        display: flex;
        align-items: center;
        color: white;
        text-decoration: none;
        border-radius: 30px;
        transition: 0.3s;
    }

    .hov.active a {
        background-color: #FFFFFF;
        color: #4f3131;
        font-weight: bold;
    }
</style>


<body>
<!-- ------------------ Điều hướng -------------------->
<div class="container">
    <div class="navigation">
        <ul>
            <li>
                <a href="home">
                        <span class="icon">
                            <img src="${pageContext.request.contextPath}/users/img/logo.png" alt="">
                        </span>
                    <span class="title">Bán Vật Liệu Xây Dựng </span>
                </a>
            </li>

            <li>
                <a href="home">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                    <span class="title">Trang chủ</span>
                </a>
            </li>

            <li>
                <a href="accounts">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý khách Hàng</span>
                </a>
            </li>

            <li>
                <a href="products-list">
                        <span class="icon">
                            <ion-icon name="cube-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý sản phẩm</span>
                </a>
            </li>
            <li>
                <a href="order-list">
                        <span class="icon">
                            <ion-icon name="receipt-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý hóa đơn</span>
                </a>
            </li>
            <li>
                <a href="promotional-list">
                        <span class="icon">
                            <ion-icon name="pricetag-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý mã giảm giá</span>
                </a>
            </li>

            <li>
                <a href="category">
                        <span class="icon">
                            <ion-icon name="list-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý danh mục</span>
                </a>
            </li>
            <li>
                <a href="list-rating">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý đánh giá</span>
                </a>
            </li>

            <li>
                <a href="informationCustomer">
                        <span class="icon">
                            <ion-icon name="person"></ion-icon>
                        </span>
                    <span class="title">Quản lý tài khoản</span>
                </a>
            </li>
            <li class="hov active">
                <a href="list_admin_owner">
                        <span class="icon">
                            <ion-icon name="settings"></ion-icon>
                        </span>
                    <span class="title">Quản lý quản trị viên</span>
                </a>
            </li>

            <li>
                <a href="logout">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                    <span class="title">Đăng Xuất</span>
                </a>
            </li>
        </ul>
    </div>

    <!------------------- Chính ------------------>
    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>


            <div class="user">
                <a href="informationCustomer">
                    <ion-icon name="person"
                              style="color: #000000; font-size: 25px;"></ion-icon>
                </a>
            </div>
        </div>


        <!-------------------- Danh Sách Chi Tiết người dùng------------------ -->
        <div class="details-user">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>Danh sách người dùng</h2>
                    <a href="accounts?showAll=true" class="btn">Xem Tất Cả</a>
                </div>

                <div class="list-account-content-button">
                    <button id="add_account">Thêm tài khoản</button>
                </div>
                <table id="userTable" class="display">
                    <thead>
                    <tr>
                        <td>id</td>
                        <td>Tên người dùng</td>
                        <td>Email</td>
                        <td>Số điện thoại</td>
                        <td>Trạng thái</td>
                        <td>Vai trò</td>
                        <td>Hành động</td>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="list_account" items="${list_admin_owner}">
                        <tr>
                            <td>${list_account.id}</td>
                            <td>${list_account.username}</td>
                            <td>${list_account.email}</td>
                            <td>${list_account.phoneNumber}</td>
                            <td><span class="statusText">${list_account.status} </span></td>
                            <td>${list_account.role}</td>
                            <td>
                                <div class="v">
                                    <c:choose>


                                        <c:when test="${sessionScope.user.role eq 'owner'}">
                                            <c:choose>
                                                <c:when test="${list_account.role eq 'owner'}">

                                                    <button style="background: #ccced0" class="delete-btn" disabled>Xóa</button>
                                                    <button style="background: #ccced0" class="edit-btn" disabled>Sửa</button>
                                                </c:when>
                                                <c:otherwise>

                                                    <button class="delete-btn" data-id="${list_account.id}">Xóa</button>

                                                    <button class="edit-btn"
                                                            data-id="${list_account.id}"
                                                            data-status="${list_account.status}"
                                                            data-role="${list_account.role}">
                                                        Sửa
                                                    </button>

                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>


                                        <c:when test="${sessionScope.user.role eq 'admin'}">
                                            <c:choose>
                                                <c:when test="${sessionScope.user.id eq list_account.id}">

                                                    <button style="background: #ccced0" class="delete-btn" disabled>Xóa</button>
                                                    <button style="background: #ccced0" class="edit-btn" disabled>Sửa</button>
                                                </c:when>
                                                <c:otherwise>


                                                    <button style="background: #ccced0" class="delete-btn" disabled>Xóa</button>
                                                    <button style="background: #ccced0" class="edit-btn" disabled>Sửa</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="delete-btn" data-id="${list_account.id}">Xóa</button>
                                            <button class="edit-btn"
                                                    data-id="${list_account.id}"
                                                    data-status="${list_account.status}"
                                                    data-role="${list_account.role}">
                                                Sửa
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>


        </div>
        <!-- Thêm tài khoản mới -->
        <div id="addAccount" class="modal">
            <div class="modal-content">
                <h3>Thêm tài khoản mới</h3>
                <form id="addAccountForm" action="add-account" method="post">
                    <label for="username">Tên tài khoản:</label>
                    <input type="text" id="username" name="username" required>

                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" required>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>

                    <label for="userRole">Quyền:</label>
                    <select id="userRole" name="role" required>
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                    </select>
                    <c:if test="${not empty error}">
                        <p style="color: red;">${error}</p>
                    </c:if>

                    <button id="saveAccountUser" type="submit">Lưu tài khoản</button>
                    <button type="button" class="close-modal">Thoát</button>
                </form>
            </div>
        </div>

        <!-- Modal Xóa tài khoản -->
        <div id="delete-modal" class="modal">
            <div class="modal-content">
                <h3>Xác nhận xóa</h3>
                <label>Bạn có chắc chắn muốn xóa tài khoản này?</label>
                <div class="button-container">
                    <button id="confirm-delete" class="confirm-delete">Xóa</button>
                    <button class="close-modal">Hủy</button>
                </div>
            </div>
        </div>

        <!--Cập nhật trạng thái và quyền -->
        <!-- Cập nhật quyền -->
        <div id="updatePermissionsModal" class="modal">
            <div class="modal-content">
                <h3>Cập nhật quyền</h3>
                <form id="updatePermissionsForm" action="update-permissions-admin" method="post">
                    <input type="hidden" id="userId" name="userId">

                    <label for="module">Chức năng:</label>

                    <select id="module" name="module" style="margin-right: 100px">
                        <option value="user">Quản lý khách hàng</option>
                        <option value="product">Quản lý sản phẩm</option>
                        <option value="order">Quản lý đơn hàng</option>
                        <option value="review">Quản lý đánh giá</option>
                        <option value="promotional">Quản lý khuyến mãi</option>
                        <option value="admin">Quản lý quản trị viên</option>
                        <option value="category">Quản lý danh mục</option>
                    </select>


                    <div style="margin-top: 15px;">
                        <label>Quyền:</label>
                        <input type="checkbox" id="canView" name="canView" value="1" ${permissions.canView ? 'checked' : ''}> <label for="canView">Xem</label>
                        <input type="checkbox" id="canAdd" name="canAdd" value="1" ${permissions.canAdd ? 'checked' : ''}> <label for="canAdd">Thêm</label>
                        <input type="checkbox" id="canEdit" name="canEdit" value="1" ${permissions.canEdit ? 'checked' : ''}> <label for="canEdit">Sửa</label>
                        <input type="checkbox" id="canDelete" name="canDelete" value="1" ${permissions.canDelete ? 'checked' : ''}> <label for="canDelete">Xóa</label>

                    </div>

                    <div class="button-container">
                        <button type="submit">Lưu thay đổi</button>
                        <button type="button" class="close-modal">Thoát</button>
                    </div>
                </form>
            </div>
        </div>
        <%-- Kiểm tra xem có thông báo nào không --%>
        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="alert alert-info">
                    ${sessionScope.errorMessage}
            </div>
            <% session.removeAttribute("errorMessage"); %> <!-- Xóa thông báo ngay sau khi hiển thị -->
        </c:if>
    </div>

</div>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="<c:url value="/admin/js/index.js"/>"></script>
<script src="<c:url value="/admin/js/passwordManagement.js"/>"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra nếu cần hiển thị modal
        const showModal = "${showModal}" === "true";
        if (showModal) {
            const modal = document.getElementById('addAccount');
            modal.style.display = 'block';
        }
    });
</script>
<script>
    $(document).ready(function () {
        $('#userTable').DataTable({
            "paging": true,         // Bật phân trang
            "searching": true,      // Bật tìm kiếm
            "ordering": true,       // Bật sắp xếp
            "info": true,           // Hiển thị thông tin tổng số dòng
            "lengthMenu": [5, 10, 25, 50], // Số dòng hiển thị mỗi trang
            "language": {
                "search": "Tìm kiếm:",
                "lengthMenu": "Hiển thị _MENU_ dòng",
                "info": "Trang _PAGE_ trên tổng _PAGES_ trang",
                "zeroRecords": "Không tìm thấy kết quả",
                "infoEmpty": "Không có dữ liệu",
                "paginate": {
                    "first": "Đầu",
                    "last": "Cuối",
                    "next": "Tiếp",
                    "previous": "Trước"
                }
            }
        });
    });
</script>
<script>
    $(document).ready(function () {
        $(".edit-btn").click(function () {
            var userId = $(this).data("id");

            var module = $("#module").val(); // Lấy module ban đầu
            $("#userId").val(userId);// Cập nhật userId vào input ẩn
            loadPermissions(userId, module);

            $("#updatePermissionsModal").show();
        });

        $(".close-modal").click(function () {
            $("#updatePermissionsModal").hide();
        });

        $("#module").change(function () {
            var userId = $("#userId").val();
            var module = $(this).val(); // Lấy module mới

            loadPermissions(userId, module);
        });

        function loadPermissions(userId, module) {
            $.ajax({
                url: "get_user_permissions",
                type: "GET",
                data: { userId: userId, module: module }, // Gửi thêm module
                dataType: "json",
                success: function (data) {
                    console.log("Received JSON:", data); // Debug

                    $("#canView").prop("checked", data.canView);
                    $("#canAdd").prop("checked", data.canAdd);
                    $("#canEdit").prop("checked", data.canEdit);
                    $("#canDelete").prop("checked", data.canDelete);
                },
                error: function (xhr, status, error) {
                    console.error("Error:", error);
                    console.error("Response:", xhr.responseText);
                }
            });
        }
    });






</script>

</body>

</html>