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
    <link rel="stylesheet" href="<c:url value="/admin/css/manager_log.css"/>">

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

    .add-category {

        margin-bottom: 50px;
        text-align: center;
    }

    .add-category button {
        background-color: #2a2185;
        color: #f1f1f1;
        border-radius: 5px;
        font-size: 30px;
        cursor: pointer;
        padding: 5px;
    }

    .hov a {
        display: flex;
        align-items: center;
        color: white;
        text-decoration: none;
        border-radius: 30px;
        transition: 0.3s;
    }

    .hov {
        margin-bottom: 3px;
    }

    .hov.active a {
        background-color: #FFFFFF;
        color: #4f3131;
        font-weight: bold;
    }

    .notification-bell {
        position: relative;
        display: inline-flex;
        align-items: center;
        margin-left: 5px;
    }

    .notification-bell ion-icon {
        font-size: 18px;
    }

    .badge-pending {
        position: absolute;
        top: -6px;
        right: -6px;
        background-color: #ff4444;
        color: white;
        font-size: 9px;
        width: 14px;
        height: 14px;
        line-height: 14px;
        text-align: center;
        border-radius: 50%;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
        display: inline-block;
        font-weight: bold;
        transition: transform 0.3s ease;
    }

    /* Hiệu ứng khi hover */
    .notification-bell:hover .badge-pending {
        transform: scale(1.15);
    }

    /* Ẩn badge khi không có đơn hàng */
    #pending-order-count:empty {
        display: none;
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

            <li>
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
                    <span class="notification-bell">
                        <ion-icon name="notifications-outline"></ion-icon>
                        <span id="pending-order-count" class="badge-pending">0</span>
                    </span>
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
                <a href="turn-page?action=infoUserAdmin">
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
            <li class="hov active">
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
    <!-------------------- Chính --------------------->
    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>


            <div class="user">
                <a href="turn-page?action=infoUserAdmin">
                    <ion-icon name="person" style="color: #000000; font-size: 25px;"></ion-icon>
                </a>

            </div>
        </div>


        <!-- Phần chính -->
        <div class="log">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>DANH SÁCH LƯU TRỮ LOG CỦA HỆ THỐNG</h2>
                    <form id="cleanLog">
                        <select name="level" id="level">
                            <option value="INFO">INFO</option>
                            <option value="ERROR">ERROR</option>
                            <option value="WARNING">WARNING</option>
                            <option value="DANGER">DANGER</option>
                            <option value="ALERT">ALERT</option>
                        </select>
                        <button type="submit">Clean</button>
                    </form>
                </div>

                <table id="logTable">
                    <thead>
                    <tr style=" background: linear-gradient(to right, #4f3131, #15283e); color: #FFFFFF;font-size: 13px;">
                        <th>Level</th>
                        <th>Username</th>
                        <th>Ngày bắt đầu</th>
                        <th>Vị trí</th>
                        <th>Dữ liệu ban đầu</th>
                        <th>Dữ liệu sau thay đổi</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        <!-- Modal Xóa -->
        <div id="delete-modal" class="modal">
            <div class="modal-content">
                <h3>Xác nhận xóa</h3>
                <label>Bạn có chắc chắn muốn xóa thông tin này?</label>
                <input type="hidden" id="logId">
                <div class="button-container">
                    <button id="confirm-delete" class="confirm-delete" onclick="deleteLog()">Xóa</button>
                    <button class="close-modal" onclick="closeModalDeleteLog()">Hủy</button>
                </div>
            </div>
        </div>

        <div id="message" class="alert alert-info" style="display: none">
            <!-- Thông báo lỗi sẽ được chèn vào đây -->
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

</div>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="<c:url value="/admin/js/configuration.js"/>"></script>
<script src="<c:url value="/admin/js/manager_log.js"/>"></script>
<script src="<c:url value="/admin/js/noficationOrder.js"/>"></script>

</body>
</html>