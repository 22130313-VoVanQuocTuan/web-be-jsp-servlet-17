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
                <a href="accounts">
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
                    <a href="accounts?showAll=true" class="btn">Xem Tất Cả</a>
                </div>

                <div class="list-account-content-button">
                    <button id="add_account">Thêm tài khoản</button>
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
                    <c:forEach var="list_account" items="${list_user}">
                        <tr>
                            <td>${list_account.id}</td>
                            <td>${list_account.username}</td>
                            <td>${list_account.email}</td>
                            <td>${list_account.phoneNumber}</td>
                            <td><span class="statusText">${list_account.status} </span></td>
                            <td>${list_account.role}</td>
                            <td>
                                <div class="v">
                                    <c:choose>
                                        <c:when test="${list_account.role eq 'admin'}">
                                            <button style="background: #ccced0 " class="delete-btn"
                                                    data-id="${list_account.id} " disabled>Ko thể xóa
                                            </button>
                                            <button style="background: #ccced0"
                                                    class="edit-btn"
                                                    data-id="${list_account.id}"
                                                    data-status="${list_account.status}"
                                                    data-role="${list_account.role}" disabled>
                                                Sửa
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="delete-btn" data-id="${list_account.id}">Xóa</button>
                                            <button class="edit-btn"
                                                    data-id="${list_account.id}"
                                                    data-status="${list_account.status}"
                                                    data-role="${list_account.role}">
                                                Sửa
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>


        </div>
        <!-- Thêm tài khoản mới -->
        <div id="addAccount" class="modal">
            <div class="modal-content">
                <h3>Thêm tài khoản mới</h3>
                <form id="addAccountForm" action="add-account" method="post">
                    <label for="username">Tên tài khoản:</label>
                    <input type="text" id="username" name="username" required>

                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" required>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>

                    <label for="role">Quyền:</label>
                    <select id="userRole" name="role" required>
                        <option value="">Chọn quyền</option>
                        <option value="admin">admin</option>
                        <option value="user">user</option>
                    </select>
                    <c:if test="${not empty error}">
                        <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                    </c:if>

                    <button id="saveAccountUser" type="submit">Lưu tài khoản</button>
                    <button type="button" class="close-modal">Thoát</button>
                </form>
            </div>
        </div>


        <!-- Modal Xóa tài khoản -->
        <div id="delete-modal" class="modal">
            <div class="modal-content">
                <h3>Xác nhận xóa</h3>
                <label>Bạn có chắc chắn muốn xóa tài khoản này?</label>
                <div class="button-container">
                    <button id="confirm-delete" class="confirm-delete">Xóa</button>
                    <button class="close-modal">Hủy</button>
                </div>
            </div>
        </div>

        <!--Cập nhật trạng thái và quyền -->
        <div id="update" class="modal">
            <div class="modal-content">
                <h3>Cập nhật trạng thái và quyền</h3>
                <form id="updateModal" action="update_status_role" method="post">
                    <input type="hidden" id="userId" name="userId">

                    <label for="status">Trạng thái:</label>
                    <select id="status" name="status" required>
                        <option value="Hoạt động">Hoạt động</option>
                        <option value="Không hoạt động">Không hoạt động</option>
                        <option value="Bị đình chỉ">Bị đình chỉ</option>
                        <option value="Đang chờ xử lý">Đang chờ xử lý</option>
                    </select>

                    <label for="role">Quyền:</label>
                    <select id="role" name="role" required>  <!-- Đã sửa id role -->
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                    </select>
                    <div class="button-container">
                        <button id="saveAccount" type="submit">Lưu thay đổi</button>
                        <button type="button" class="close-modal">Thoát</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="<c:url value="/admin/js/index.js"/>"></script>
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
        $('#userTable').DataTable({
            "paging": true,         // Bật phân trang
            "searching": true,      // Bật tìm kiếm
            "ordering": true,       // Bật sắp xếp
            "info": true,           // Hiển thị thông tin tổng số dòng
            "lengthMenu": [5, 10, 25, 50], // Số dòng hiển thị mỗi trang
            "language": {
                "search": "Tìm kiếm:",
                "lengthMenu": "Hiển thị _MENU_ dòng",
                "info": "Hiển thị _START_ đến _END_ của _TOTAL_ dòng",
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