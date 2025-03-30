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
            <li>
                <a href="list_admin_owner">
                        <span class="icon">
                            <ion-icon name="settings"></ion-icon>
                        </span>
                    <span class="title">Quản lý quản trị viên</span>
                </a>
            </li>
            <li class="hov active">
                <a href="listLog">
                        <span class="icon">
                            <ion-icon name="time-outline"></ion-icon>
                        </span>
                    <span class="title">Quản lý nhật ký</span>
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
        <div class="log">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>Danh sách lưu trữ log của hệ thống</h2>
                    <form method="post" action="cleanLog">
                        <select name="level">
                            <option value="INFO">INFO</option>
                            <option value="ERROR">ERROR</option>
                            <option value="WARNING">WARNING</option>
                            <option value="DANGER">DANGER</option>
                            <option value="ALERT">ALERT</option>
                        </select>
                        <button  type="submit">Clean</button>
                    </form>
                </div>

                <table id="logTable">
                    <thead>
                    <tr>
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
                       <c:forEach var="log" items="${logList}">
                            <tr>
                                <td>${log.level}</td>
                                <td>${log.username}</td>
                                <td>${log.startLog}</td>
                                <td>${log.address}</td>
                                <td>${log.dataBefore}</td>
                                <td>${log.dataAfter}</td>
                                <td class="v">
                                    <button style="color: #000000" class="delete-btn" data-id="${log.id}">Xóa</button>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
        <!-- Modal Xóa -->
        <div id="delete-modal" class="modal">
            <div class="modal-content">
                <h3>Xác nhận xóa</h3>
                <label>Bạn có chắc chắn muốn xóa thông tin  này?</label>
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
</div>


<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="<c:url value="/admin/js/index.js"/>"></script>
<script src ="<c:url value="/admin/js/manager_log.js"/>"></script>

<script>
    $(document).ready(function () {
        $('#logTable').DataTable({
            "padding" : true,
            "search" : true,
            "ordering" : true,
            "info": true,
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


</body>

</html>