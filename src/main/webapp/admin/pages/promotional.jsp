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

    <link rel="stylesheet" href="<c:url value="/admin/css/user.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/css/promotional.css"/>">

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
    <!-- jQuery và DataTables JS -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>

</head>

<body>
<style>
    /*CSS đè thêm để chỉnh display data table */
    .dataTables_wrapper .dataTables_filter input {
        border: 2px solid #15283e !important;
        border-radius: 5px !important;
        padding: 8px !important;
        color: #000 !important;
        margin-bottom: 10px !important;
    }

    .toggle-status {
        accent-color: #4CAF50; /* Màu xanh lá */
        width: 18px;
        height: 18px;
    }

    .status-container {
        display: flex;
        align-items: center; /* Căn giữa checkbox và text */
        gap: 8px; /* Tạo khoảng cách giữa checkbox và chữ */
        text-align: center;
        justify-content: center;
        align-content: center;
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
                </a>
            </li>
            <li class="hov active">
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
                    <h2>Danh sách mã ưu đãi</h2>
                </div>
                <div class="list-promotions-content-button">
                    <button id="add_Promotions" onclick="openAddPro()">Thêm ưu đãi</button>
                </div>

                <table id="productTable">
                    <thead>
                    <tr>
                        <td>id</td>
                        <td>Mã ưu đãi</td>
                        <td>Giá trị</td>
                        <td>Ngày bắt đầu</td>
                        <td>Ngày kết thúc</td>
                        <td>Trạng thái</td>
                        <td>Hành động</td>
                    </tr>
                    </thead>

                    <tbody>
                    </tbody>
                </table>


                <!-- Thêm mã ưu đãi mới -->
                <div id="addPromotionModal" class="modal">
                    <div class="modal-content">
                        <h3>Thêm mã ưu đãi mới</h3>
                        <form id="addPromotionForm">
                            <label>Mã ưu đãi:</label>
                            <input type="text" id="promotionCode" name="code" required>

                            <label>Giá trị:</label>
                            <input type="text" id="promotionName" name="value" required>

                            <label>Ngày bắt đầu:</label>
                            <input type="datetime-local" id="promotionDateStart" name="startDate" required>

                            <label>Ngày kết thúc:</label>
                            <input type="datetime-local" id="promotionDateEnd" name="endDate" required>

                            <button type="submit" id="save_Product">Lưu ưu đãi</button>
                            <button type="button" class="close-modal" onclick="closeModalAddPro()">Thoát</button>
                        </form>

                    </div>
                </div>

                <!-- Modal cho chỉnh sửa thông tin  -->
                <div id="editPromotional" class="modal">
                    <div class="modal-content" style="overflow-y: hidden;height: 70%; max-height: 99%;">
                        <h2 style="color: #FFC857" class="modal-title">Chỉnh sửa ưu đãi</h2>
                            <!-- Form chỉnh sửa thông tin -->
                            <form id="editInfoForm">
                                <input type="hidden" name="id" id="promotionId">
                                <div class="mb-3">
                                    <label for="promotionValue" class="form-label">Giá trị:</label>
                                    <input type="number" name="value" class="form-control" id="promotionValue"
                                           placeholder="Nhập giá trị"  required>
                                </div>
                                <div class="mb-3">
                                    <label for="startDate" class="form-label">Ngày bắt đầu:</label>
                                    <input type="datetime-local" name="startDate" class="form-control" id="startDate"
                                           placeholder="Nhập ngày bắt đầu"  required>
                                </div>
                                <div class="mb-3">
                                    <label for="endDate" class="form-label">Ngày kết thúc:</label>
                                    <input type="datetime-local" class="form-control" name="endDate" id="endDate"
                                           placeholder="Nhập ngày kết thúc" required>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" id="saveChanges">Lưu thay đổi</button>
                                    <button type="button" class="close-modal btn btn-secondary " onclick="closeModalUpdatePro()">Hủy</button>
                                </div>
                            </form>

                    </div>
                </div>

                <!-- Modal Xóa ưu đãi -->
                <div id="delete-modal" class="modal">
                    <div class="modal-content">
                        <h3>Xác nhận xóa</h3>
                        <label>Bạn có chắc chắn muốn xóa ưu đãi này?</label>
                        <input type="hidden" id="promotionalId">
                        <div class="button-container">
                            <button id="confirm-delete" class="confirm-delete" onclick="confirmModalDelete()">Xóa</button>
                            <button type="button" class="close-modal" onclick="closeModalDeletePro()">Hủy</button>
                        </div>
                    </div>
                </div>
                <div id="message" class="alert alert-info" style="display: none">
                    <!-- Thông báo lỗi sẽ được chèn vào đây -->
                </div>
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
<script src="<c:url value="/admin/js/promotional.js"/>"></script>

</body>

</html>