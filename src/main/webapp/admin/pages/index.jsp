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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/admin/css/style.css"/>">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

</head>
<style>
    .dataTables_wrapper .dataTables_filter input {
        border: 2px solid #1c1919 !important;
        margin-bottom: 10px !important;
    }
    .dataTables_wrapper .dataTables_paginate .paginate_button {
        padding: 0px !important;
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

    .chart-container {
        width: 97%;
        margin: 20px auto;
        text-align: center;
        background: #FFFFFF;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #333;
        margin-bottom: 2%;
    }

    .button-container {
        margin-bottom: 15px;
    }

    button {
        background: #4f3131;
        color: white;
        border: none;
        padding: 10px 15px;
        margin: 5px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: 0.3s;
    }

    button:hover {
        background: #6b4646; /* Màu nâu sáng hơn */
        transform: scale(1.05); /* Hiệu ứng phóng to nhẹ */
    }

    canvas {
        max-height: 400px;
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

            <li class="hov active">
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

            <div class="search">
                <form action="home" method="get">
                    <label>
                        <input type="text" name="id" placeholder="Tìm kiếm ở đây">
                        <ion-icon name="search-outline">
                            <button type="submit" style="border: none; background: none; cursor: pointer;"></button>
                        </ion-icon>
                    </label>
                    <input type="hidden" name="search" value="id">
                </form>
            </div>

            <div class="user">
                <a href="informationCustomer">
                    <ion-icon name="person"
                              style="color: #000000; font-size: 25px;"></ion-icon>
                </a>
            </div>
        </div>

        <!------------------- Thẻ------------------>
        <div class="cardBox">
            <div class="card">
                <div>
                    <div class="numbers" id="totalViews"></div>
                    <div class="cardName">Lượt Xem</div>
                </div>

                <div class="iconBx">
                    <ion-icon name="eye-outline"></ion-icon>
                </div>
            </div>

            <a href="turn-page?action=user" style="text-decoration: none">
                <div class="card">
                    <div>
                        <div class="numbers" id="totalUsers"></div>
                        <div class="cardName">Số lượng người dùng</div>
                    </div>

                    <div class="iconBx">
                        <i class="fa-solid fa-users"></i>
                    </div>
                </div>
            </a>

            <a href="turn-page?action=rating" style="text-decoration: none">
                <div class="card">

                    <div>
                        <div class="numbers" id="totalRatings"></div>
                        <div class="cardName">Đánh giá</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="chatbubbles-outline"></ion-icon>
                    </div>
                </div>
            </a>

            <div class="card">
                <div>
                    <div class="numbers" id="totalRevenue"></div>
                    <div class="cardName">Doanh Thu</div>
                </div>

                <div class="iconBx">
                    <ion-icon name="cash-outline"></ion-icon>
                </div>
            </div>
        </div>

        <!-------------------- Danh Sách Chi Tiết Đơn Hàng------------------ -->
        <div class="details">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>Đơn Hàng Gần Đây</h2>
                    <a href="home?showAll=orders" class="btn">Xem Tất Cả</a>
                </div>

                <table id="orderTable">
                    <thead>
                    <tr>
                        <td>Mã đơn hàng</td>
                        <td>Giá</td>
                        <td>Thanh Toán</td>
                        <td>Ngày đặt hàng</td>
                        <td>Trạng Thái</td>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>

                </table>
            </div>

            <!-------------------- Khách Hàng Mới------------------->
            <div class="recentCustomers">
                <div class="cardHeader">
                    <h2>Khách hàng tiềm năng</h2>
                    <a href="home?showAll=users" class="btn">Xem Tất Cả</a>
                </div>
                <table id="customerTable">
                    <tbody>

                    </tbody>


                </table>
            </div>
        </div>
        <%-- -----------------Tạo biểu đồ doanh thu------------------------%>
        <div class="chart-container">
            <h2>Biểu đồ Doanh thu</h2>
            <div class="button-container">
                <button onclick="loadRevenueData('week')">Doanh thu theo tuần</button>
                <button onclick="loadRevenueData('month')">Doanh thu theo tháng</button>
                <button onclick="loadRevenueData('year')">Doanh thu theo năm</button>
            </div>
            <canvas id="revenueChart"></canvas>
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
<script src="<c:url value="/admin/js/index.js"/>"></script>
<script src="<c:url value="/admin/js/configuration.js"/>"></script>

</body>
</html>