<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng điều khiển Quản trị viên </title>
    <!------------------ Kiểu dáng ------------------>
    <link rel="stylesheet" href="<c:url value="/admin/css/style.css"/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/admin/css/account.css"/>">
</head>
<style>
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

            <li class="hov active">
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
            <li>
                <a href="turn-page?action=log">
                        <span class="icon">
                            <ion-icon name="time-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý nhật ký</span>
                </a>
            </li>


            <li>
                <a href="#" id="logout-link">
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
                <a href="turn-page?action=infoUserAdmin">
                    <ion-icon name="person"
                              style="color: #000000; font-size: 25px;"></ion-icon>
                </a>
            </div>
        </div>

        <!------------------- Thẻ------------------>

        <!-------------------- Danh Sách Chi Tiết Đơn Hàng------------------ -->
        <div class="content">
            <!-- Thông tin khách hàng -->
            <div class="customer-info">
                <h2> THÔNG TIN TÀI KHOẢN</h2>
                <p><strong>Tên:</strong></p>
                <p><strong>Email:</strong></p>
                <p><strong>Số điện thoại:</strong></p>
                <p><strong>Địa chỉ:</strong></p>
                <p><strong>Vai trò:</strong></p>
                <p><strong>Trạng thái:</strong></p>
                <button class="edit-btn" onclick="openModal1()">Chỉnh sửa thông tin</button>
            </div>
        </div>


        <!-- Modal cho chỉnh sửa thông tin  -->
        <div id="editInformationModal" class="modal">
            <div class="modal-content">
                <span class="close-btn " onclick="closeModal1()" &times;></span>
                <h2 class="modal-title">Chỉnh sửa thông tin</h2>

                <div class="editInformationContent">
                    <!-- Form chỉnh sửa thông tin -->
                    <form id="editInfoForm">
                        <div class="mb-3">
                            <label for="name" class="form-label">Tên</label>
                            <input type="text" name="fullName" class="form-control" id="name"
                                   placeholder="Nhập tên của bạn"
                                   required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Số điện thoại</label>
                            <input type="tel" name="phoneNumber" class="form-control" id="phone"
                                   placeholder="Nhập số điện thoại" required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Địa chỉ</label>
                            <textarea class="form-control" name="address" id="address" rows="3"
                                      placeholder="Nhập địa chỉ"
                                      required></textarea>
                        </div>

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" id="saveChanges">Lưu thay đổi</button>
                            <button type="button" class="btn btn-secondary" onclick="closeModal1()">Hủy</button>
                        </div>
                    </form>
                </div>


            </div>
        </div>
        <%-- Kiểm tra xem có thông báo nào không --%>
        <div id="message" class="alert alert-info" style="display: none">
            <!-- Thông báo lỗi sẽ được chèn vào đây -->
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
<script src="<c:url value="/admin/js/account.js"/>"></script>
<script src="<c:url value="/admin/js/noficationOrder.js"/>"></script>
</body>
</html>