
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
    <link rel="stylesheet" href="<c:url value="/admin/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/css/category.css"/>">
    <!-------------------Thêm jQuery----------------->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!------------------- Thêm DataTables ---------------->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
</head>
<style>
    .add-category {

        margin-bottom: 15px;
        text-align: center;
    }

    .add-category button {
    background-color: #202a3b;
    color: #f1f1f1;
    border-radius: 5px;
    font-size: 17px;
    cursor: pointer;
    padding: 0px 10px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.add-category button:hover {
    transform: scale(1.1); /* Phóng to mà không ảnh hưởng đến bố cục */
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3); /* Thêm hiệu ứng bóng */
}
    .dataTables_wrapper .dataTables_filter input {
        border: 2px solid #1c1919 !important;
        margin-bottom: 10px !important;
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
                    <a href="informationCustomer"> <ion-icon name="person" style="color: #000000; font-size: 25px;"></ion-icon></a>

                </div>
            </div>



            <!-------------------- Danh Sách Chi Tiết người dùng------------------ -->
            <div class="category">
                <div class="recentCategory">
                    <div class="cardHeader">
                        <h2>Danh sách danh mục</h2>
                    </div>
                    <div class="add-category">
                        <p style="font-size: 20px; margin-bottom: 10px;">Thêm danh mục</p>
                        <form action="add-delete-category" method="post">
                        <input type="text" name="name" style="font-size: 17px; border-radius: 5px;" placeholder="Nhập tên danh mục" required>
                            <c:if test="${not empty error}">
                                <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                            </c:if>
                            <button type="submit" >Thêm</button>
                        </form>
                    </div>
                    <table id="categoryTable" class="display">
                        <thead>
                            <tr>
                                <td>id</td>
                                <td>Tên danh mục</td>
                                <td>Ngày tạo</td>

                                <td>Hành động</td>
                            </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="category" items="${list}">
                            <tr>
                                <td>${category.id}</td>
                                <td>${category.name}</td>
                                <td>${category.createDate}</td>

                                <td>
                                    <div class="v">
                                        <button class="delete-btn" data-id="${category.id}">Xóa</button>
                                    </div>
                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                 <!-- Modal Xóa tài khoản -->
                 <div id="delete-modal" class="modal">
                    <div class="modal-content">
                        <h3>Xác nhận xóa</h3>
                        <label>Bạn có chắc chắn muốn xóa danh mục này?</label>
                        <div class="button-container">
                            <button id="confirm-delete" class="confirm-delete">Xóa</button>
                            <button class="close-modal">Hủy</button>
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
    </div>
    <script>
        $(document).ready(function () {
            $('#categoryTable').DataTable({
                "lengthMenu":[5,10,15,20],
                "language": {
                    "search": "Tìm kiếm:",
                    "lengthMenu": "Hiển thị _MENU_ danh mục",
                    "info": "Trang _PAGE_ trên tổng _PAGES_ trang",
                    "paginate": {
                        "first": "Đầu",
                        "last": "Cuối",
                        "next": ">",
                        "previous": "<"
                    },
                    "zeroRecords": "Không tìm thấy danh mục nào",
                    "infoEmpty": "Không có danh mục nào để hiển thị",
                    "infoFiltered": "(Lọc từ _MAX_ danh mục)",
                }
            });
        });
    </script>

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="<c:url value="/admin/js/index.js"/>"></script>
    <script src="<c:url value="/admin/js/category.js"/>"></script>


</body>

</html>