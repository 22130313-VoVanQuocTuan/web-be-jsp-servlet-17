
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
    <link rel="stylesheet" href="<c:url value="/admin/css/inventory.css"/>">

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
    .dataTables_wrapper .dataTables_paginate .paginate_button {
        padding: 0px !important;
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
                <a href="turn-page?action=user">
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
            <li class="hov active" >
                <a href="turn-page?action=inventory">
                        <span class="icon">
                            <ion-icon name="storefront-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý tồn kho</span>
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
            <li >
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
    <!-------------------- Chính --------------------->
    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>


            <div class="user">
                <a href="informationCustomer"> <ion-icon name="person" style="color: #000000; font-size: 25px;"></ion-icon></a>

            </div>
        </div>


        <!-- Phần chính -->
        <div class="import_export">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2 style="color: #000000;font-size: 20px;">Danh sách sản phẩm tồn kho</h2>
                 </div>
                <div class="list-products-content-button">
                <a href="turn-page?action=history_import_export"><button id="import_export_stock" style="margin-bottom: 10px; background: #a1e8ff">Xem lịch sử Nhập/Xuất kho</button></a>
                </div>
                <table id="inventoryTable">
                    <thead>
                    <tr>
                        <td>Mã sản phẩm</td>
                        <td>Tên sản phẩm</td>
                        <td>Số lượng</td>
                        <td>Số lượng tối thiểu</td>
                        <td>Số lượng tối đa</td>
                        <td>Trạng thái</td>
                        <td>Hành động</td>
                    </tr>
                    </thead>
                    <tbody>

                    <!-- Thêm các dòng dữ liệu khác tại đây -->
                    </tbody>
                </table>

            </div>
        </div>
        <!-- Sản phẩm khong ban duoc -->
        <div class="import_export">
                <div class="recentOrders">
                <h3 style="color: red">
                    Sản phẩm không bán được trong vòng:
                </h3>
                <select style="width: 70px; margin: 12px 0;"  name="day" id="days" onchange="fetchInventory();">
                    <option value="1">1 ngày</option>
                    <option value="7">1 tuần</option>
                    <option value="15">15 ngày</option>
                    <option value="30">30 ngày</option>
                    <option value="365">1 năm</option>
                </select>

                <table id="inventoryTableUnsold">
                    <thead>
                    <tr>
                        <td>Mã sản phẩm</td>
                        <td>Tên sản phẩm</td>
                        <td>Số lượng</td>
                        <td>Số lượng tối thiểu</td>
                        <td>Số lượng tối đa</td>
                        <td>Trạng thái</td>
                        <td>Hành động</td>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                </div>
            </div>
        <!-- Sản phẩm cần nhập kho -->
        <div class="import_export">
            <div class="recentOrders">
                <h3 style="color: red">
                    Sản phẩm cần nhập kho:
                </h3>


                <table id="inventoryTableImport">
                    <thead>
                    <tr>
                        <td>Mã sản phẩm</td>
                        <td>Tên sản phẩm</td>
                        <td>Số lượng</td>
                        <td>Số lượng tối thiểu</td>
                        <td>Số lượng tối đa</td>
                        <td>Trạng thái</td>
                        <td>Hành động</td>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        </div>
        <!-- Modal cập nhật số lượng -->
        <div id="delete-modal" class="modal">
            <div class="modal-content-i">
                <h3>Xác nhận xóa</h3>
                <label>Bạn có chắc chắn muốn xóa đánh giá này?</label>
                <div class="button-container">
                    <button id="confirm-delete" class="confirm-delete">Xóa</button>
                    <button  class="close-modal">Hủy</button>
                </div>
            </div>
        </div>
    </div>
    <%-- Kiểm tra xem có thông báo nào không --%>
    <c:if test="${not empty sessionScope.errorMessage}">
    <div class="alert alert-info">
            ${sessionScope.errorMessage}
    </div
            <% session.removeAttribute("errorMessage"); %> <!-- Xóa thông báo ngay sau khi hiển thị -->
    </c:if>
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
    <!-- nhập xất kho -->
    <div id="importModal" class="modal">
        <div class="modal-content-i">
            <h3>Nhập kho sản phẩm</h3>
            <div id="importStockForm">
                <input type="hidden" id="quantityPresent">
                <label>Mã sản phẩm:</label>
                <input type="text" id="productId" readonly>

                <label>Tên sản phẩm:</label>
                <input type="text" id="productNames" readonly>

                <label>Số lượng nhập:</label>
                <input type="number" id="importQuantity">
                <!-- Thông báo lỗi sẽ hiển thị ở đây -->
                <span class="error" id="errorImport"></span>
                <label>Ghi chú:</label>
                <input type="text" id="note"></div>
            <button id="importBt" onclick="submitImport()">Xác nhận</button>
            <button type="button" class="close-modal" onclick="closeModalImport()">Thoát</button>
        </div>
    </div>

    <!-- nhập xất kho -->
    <div id="exportModal" class="modal">
        <div class="modal-content-i">
            <h3>Xuất kho sản phẩm</h3>
            <div id="exportStockForm">
                <label>Mã sản phẩm:</label>
                <input type="text" id="productIds" readonly>

                <label>Tên sản phẩm:</label>
                <input type="text" id="productNamess" readonly>


                <label>Số lượng xuất:</label>
                <input type="number" id="importQuantitys">
                <!-- Thông báo lỗi sẽ hiển thị ở đây -->
                <span class="error" id="error"></span>
                <label>Ghi chú:</label>
                <input type="text" id="notes"></div>
            <button id="export" onclick="submitExport()">Xác nhận</button>
            <button type="button" class="close-modal" onclick="closeModalExport()">Thoát</button>
        </div>
    </div>


<!-- Cập nhật kho -->
<div id="updateQuantityModal" class="modal">
    <div class="modal-content-i">
        <h3>Cập nhật số lượng sản phẩm</h3>
        <div id="updateInventoryForm">
            <label>Mã sản phẩm:</label>
            <input type="text" id="productIdss" readonly>
            <label>Tên sản phẩm:</label>
            <input type="text" id="productNamesss" readonly>
            <label>Số lượng:</label>
            <input type="number" id="importQuantitysss">
            <!-- Thông báo lỗi sẽ hiển thị ở đây -->
            <span class="error"  id="errorQuantitysss"></span>
            <label>Số lượng tối thiểu:</label>
            <input type="number" id="importQuantityMin">
            <!-- Thông báo lỗi sẽ hiển thị ở đây -->
            <span class="error" id="errorQuantityMin"></span>
            <label>Số lượng tối đa:</label>
            <input type="number" id="importQuantityMax">
            <!-- Thông báo lỗi sẽ hiển thị ở đây -->
            <span class="error"  id="errorQuantityMax"></span>

        <button id="updateQuantity" onclick="updateQuantity()">Cập nhật</button>
        <button type="button" class="close-modal" onclick="closeModalUpdateInventory()">Thoát</button>
    </div>
</div>
</div>

<div id="errorAlert" class="alert alert-info" style="display: none">
    <!-- Thông báo lỗi sẽ được chèn vào đây -->
</div>



<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>

<script src="<c:url value="/admin/js/index.js"/>"></script>
<script src ="<c:url value="/admin/js/inventory.js"/>"></script>




</body>

</html>