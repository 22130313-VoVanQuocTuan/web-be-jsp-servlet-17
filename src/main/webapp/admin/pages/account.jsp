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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/admin/css/account.css"/>">
</head>

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
                    <span class="title">Khách Hàng</span>
                </a>
            </li>

            <li>
                <a href="products-list">
                        <span class="icon">
                            <ion-icon name="cube-outline"></ion-icon>
                        </span>
                    <span class="title">Sản phẩm</span>
                </a>
            </li>
            <li>
                <a href="order-list">
                        <span class="icon">
                            <ion-icon name="receipt-outline"></ion-icon>
                        </span>
                    <span class="title">Hóa đơn</span>
                </a>
            </li>

            <li>
                <a href="promotional-list">
                        <span class="icon">
                            <ion-icon name="pricetag-outline"></ion-icon>
                        </span>
                    <span class="title">Mã giảm giá</span>
                </a>
            </li>

            <li>
                <a href="category">
                        <span class="icon">
                            <ion-icon name="list-outline"></ion-icon>
                        </span>
                    <span class="title">Danh mục</span>
                </a>
            </li>
            <li>
                <a href="list-rating">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                    <span class="title">Đánh giá</span>
                </a>
            </li>

            <li>
                <a href="informationCustomer">
                        <span class="icon">
                            <ion-icon name="person"></ion-icon>
                        </span>
                    <span class="title">Tài khoản</span>
                </a>
            </li>
            <li>
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
                    <span class="title" onclick="lockout()">Đăng Xuất</span>
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
                <a href="informationCustomer"> <ion-icon name="person"
                                                             style="color: #000000; font-size: 25px;"></ion-icon></a>
            </div>
        </div>

        <!------------------- Thẻ------------------>

        <!-------------------- Danh Sách Chi Tiết Đơn Hàng------------------ -->
        <div class="content">
            <!-- Thông tin khách hàng -->
            <div class="customer-info">
                <h2>Thông tin tài khoản</h2>
                <p><strong>Tên:</strong>${info.fullName}</p>
                <p><strong>Email:</strong> ${info.email}</p>
                <p><strong>Số điện thoại:</strong>${info.phoneNumber}</p>
                <p><strong>Địa chỉ:</strong> ${info.address}</p>
                <p><strong>Vai trò:</strong> ${info.role}</p>
                <p><strong>Trạng thái:</strong> ${info.status}</p>
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
                    <form id="editInfoForm" action="update-info" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Tên</label>
                            <input type="text" name="fullName" class="form-control" id="name" placeholder="Nhập tên của bạn"
                                   required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Số điện thoại</label>
                            <input type="tel" name="phoneNumber" class="form-control" id="phone"
                                   placeholder="Nhập số điện thoại" required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Địa chỉ</label>
                            <textarea class="form-control" name="address" id="address" rows="3" placeholder="Nhập địa chỉ"
                                      required></textarea>
                        </div>
                        <!-- Thông báo lỗi -->
                        <c:if test="${not empty error}">
                            <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                        </c:if>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" id="saveChanges">Lưu thay đổi</button>
                            <button type="button" class="btn btn-secondary" onclick="closeModal1()">Hủy</button>
                        </div>
                    </form>
                </div>


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
<script src="<c:url value="/users/js/informationCustomer.js"/>"></script>
</body>

</html>