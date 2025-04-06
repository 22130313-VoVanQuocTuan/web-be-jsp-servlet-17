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
                <a href="turn-page?action=home">
                        <span class="icon">
                            <img src="${pageContext.request.contextPath}/users/img/logo.png" alt="">
                        </span>
                    <span class="title">Bán Vật Liệu Xây Dựng </span>
                </a>
            </li>

            <li>
                <a href="turn-page?action=home">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                    <span class="title">Trang chủ</span>
                </a>
            </li>

            <li class="hov active">
                <a href="turn-page?action=user">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý khách Hàng</span>
                </a>
            </li>

            <li>
                <a href="turn-page?action=product">
                        <span class="icon">
                            <ion-icon name="cube-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý sản phẩm</span>
                </a>
            </li>
            <li>
                <a href="turn-page?action=inventory">
                        <span class="icon">
                            <ion-icon name="storefront-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý tồn kho</span>
                </a>
            </li>
            <li>
                <a href="turn-page?action=order">
                        <span class="icon">
                            <ion-icon name="receipt-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý hóa đơn</span>
                </a>
            </li>
            <li>
                <a href="turn-page?action=promotional">
                        <span class="icon">
                            <ion-icon name="pricetag-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý mã giảm giá</span>
                </a>
            </li>

            <li>
                <a href="turn-page?action=categories">
                        <span class="icon">
                            <ion-icon name="list-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý danh mục</span>
                </a>
            </li>
            <li>
                <a href="turn-page?action=rating">
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
            <li>
                <a href="turn-page?action=managerOwner">
                        <span class="icon">
                            <ion-icon name="settings"></ion-icon>
                        </span>
                    <span class="title">Quản lý quản trị viên</span>
                </a>
            </li>
            <li>
                <a href="turn-page?action=log">
                        <span class="icon">
                            <ion-icon name="time-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý nhật ký</span>
                </a>
            </li>

            <li>
                <a href="" id="logout-link">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                    <span class="title" id="log-out">Đăng Xuất</span>
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
                </div>
                <div class="list-account-content-button">
                    <button id="add_account" onclick="openModalAdd()">Thêm tài khoản</button>
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

                    </tbody>
                </table>
            </div>
        </div>
        <!-- Thêm tài khoản mới -->
        <div id="addAccount" class="modal">
            <div class="modal-content">
                <h3>Thêm tài khoản mới</h3>
                <form id="addAccountForm">
                    <label for="username">Tên tài khoản:</label>
                    <input type="text" id="username" name="username" required>

                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" required>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>

                    <label for="role">Quyền:</label>
                    <select id="userRole" name="role" required>
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                    </select>
                    <span class="error" id="emailExit" style="display: none"></span>

                    <button id="saveAccountUser" type="submit">Lưu tài khoản</button>
                    <button type="button" class="close-modal" onclick="closeModalAdd()">Thoát</button>
                </form>
            </div>
        </div>

        <!-- Modal Xóa tài khoản -->
        <div id="delete-modal" class="modal">
            <div class="modal-content">
                <h3>Xác nhận xóa</h3>
                <label>Bạn có chắc chắn muốn xóa tài khoản này?</label>
                <input type="hidden" id="userIdDelete">
                <div class="button-container">
                    <button id="confirm-delete" class="confirm-delete" onclick="deleteUser()">Xóa</button>
                    <button class="close-modal" onclick="closeModalDelete()">Hủy</button>
                </div>
            </div>
        </div>
        <%-- Kiểm tra xem có thông báo nào không --%>
        <div id="message" class="alert alert-info" style="display: none">
            <!-- Thông báo lỗi sẽ được chèn vào đây -->
        </div>

        <!--Cập nhật trạng thái và quyền -->
        <div id="update" class="modal">
            <div class="modal-content">
                <h3>Cập nhật trạng thái và quyền</h3>
                <form id="updateModal" >
                    <input type="hidden" id="userId">

                    <label for="status">Trạng thái:</label>
                    <select id="status" name="status">
                        <option value="Hoạt động">Hoạt động</option>
                        <option value="Không hoạt động">Không hoạt động</option>
                        <option value="Bị đình chỉ">Bị đình chỉ</option>
                        <option value="Đang chờ xử lý">Đang chờ xử lý</option>
                    </select>

                    <label for="role">Quyền:</label>
                    <c:choose>
                        <c:when test="${ sessionScope.user.role eq 'owner'}">
                            <select id="role" name="role" required>
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select>
                        </c:when>
                    </c:choose>
                    <div class="button-container">
                        <button id="saveAccount" type="submit">Lưu thay đổi</button>
                        <button type="button" class="close-modal" onclick="closeModalEdit()">Thoát</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Modal Xác Nhận Đăng Xuất -->
    <div id="logout-modal" class="modal">
        <div class="modal-content">
            <h3>Xác nhận đăng xuất</h3>
            <label>Bạn có chắc chắn muốn đăng xuất?</label>
            <div class="button-container">
                <button id="confirm-logout">Đăng Xuất</button>
                <button id="cancel-logout">Hủy</button>
            </div>
        </div>
    </div>
</div>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="<c:url value="/admin/js/configuration.js"/>"></script>
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
        $(".edit-btn").click(function () {
            var userId = $(this).data("id");  // Lấy ID user
            var userStatus = $(this).data("status");  // Lấy trạng thái user
            var userRole = $(this).data("role");  // Lấy quyền user

            // Gán giá trị vào modal
            $("#userId").val(userId);
            $("#status").val(userStatus);
            $("#role").val(userRole);

            // Hiển thị modal
            $("#update").show();
        });

        // Ẩn modal khi bấm "Thoát"
        $(".close-modal").click(function () {
            $("#update").hide();
        });
    });


</script>

</body>

</html>