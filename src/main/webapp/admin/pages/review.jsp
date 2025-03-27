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
    <link rel="stylesheet" href="<c:url value="/admin/css/review.css"/>">

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
                <li class="hov active">
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
                <li>
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
            <div class="review">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Danh sách đánh giá của khách hàng</h2>

                    </div>

                    <table id="reviewTable">
                        <thead>
                            <tr>
                                <td>Mã sản phẩm</td>
                                <td>Mã khách hàng</td>
                                <td>Thông tin đánh giá</td>
                                <td>Ngày đánh giá</td>
                                <td>Hành động</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rating" items="${listRating}">
                            <tr>
                                <td>${rating.productId}</td>
                                <td>${rating.userId}</td>
                                <td>${rating.content}</td>
                                <td>${rating.createdAt}</td>
                                <td class="v">
                                    <button class="delete-btn" data-id="${rating.id}">Xóa</button>
                                </td>
                            </tr>

                            </c:forEach>
                            <!-- Thêm các dòng dữ liệu khác tại đây -->
                        </tbody>
                    </table>
                </div>


            </div>
            <!-- Modal Xóa đánh giá -->
            <div id="delete-modal" class="modal">
                <div class="modal-content">
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
    </div>


    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="<c:url value="/admin/js/index.js"/>"></script>
    <script src ="<c:url value="/admin/js/review.js"/>"></script>

    <script>
        $(document).ready(function () {
            $('#reviewTable').DataTable({
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