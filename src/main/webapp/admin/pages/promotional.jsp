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
            <li>
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
            <li class="hov active">
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
                <%--                <div class="update-user">--%>
                <%--                    <p style="font-size: 20px; margin-bottom: 10px;">Cập nhật trạng thái mã ưu đãi</p>--%>
                <%--                    <form action="update-status-pro" method="post">--%>
                <%--                        <input type="text" name="id" placeholder="Nhập ID mã ưu đãi cần cập nhật" required--%>
                <%--                               style="font-size: 15px; padding: 2px; border-radius: 5px;">--%>
                <%--                        <select title="choice" name="status" id="statusSelect" required--%>
                <%--                                style="font-size: 15px; border-radius: 5px; padding: 2px;">--%>
                <%--                            <option value="Hoạt động">Hoạt động</option>--%>
                <%--                            <option value="Không hoạt động">Không hoạt động</option>--%>
                <%--                        </select>--%>
                <%--                        <c:if test="${not empty error}">--%>
                <%--                            <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->--%>
                <%--                        </c:if>--%>
                <%--                        <button type="submit">Cập nhật trạng thái</button>--%>
                <%--                    </form>--%>
                <%--                </div>--%>

                <div class="list-promotions-content-button">
                    <button id="add_Promotions">Thêm ưu đãi</button>
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
                    <c:forEach var="promotion" items="${listPromotional}">
                        <tr>
                            <td>${promotion.id}</td>
                            <td>${promotion.code}</td>
                            <td id="value"><fmt:formatNumber value="${promotion.value}" type="number"
                                                  groupingUsed="true"/>đ
                            </td>
                            <td id="sdate"><fmt:formatDate value="${promotion.startDate}" pattern="dd-MM-yyyy HH:mm"/></td>
                            <td id="edate"><fmt:formatDate value="${promotion.endDate}" pattern="dd-MM-yyyy HH:mm"/></td>
                            <!-- Input ẩn chứa endDate đúng format -->
                            <input type="hidden" class="endDate-hidden"
                                   value="<fmt:formatDate value='${promotion.endDate}' pattern='yyyy-MM-dd\'T\'HH:mm'/>"/>

                            <td>
                                <div class="status-container">
                                    <span class="statusText" style="display: none;">${promotion.status}</span>
                                    <input type="checkbox" class="toggle-status" data-id="${promotion.id}"
                                        ${promotion.status == 'Hoạt động' ? 'checked' : ''}>
                                    <span class="status-text">
                                            ${promotion.status == 'Hoạt động' ? 'Hoạt động' : 'Không hoạt động'}
                                    </span>
                                </div>
                            </td>
                            <td>
                                <div class="v">
                                    <button class="edit-btn" data-up-id="${promotion.id}">Sửa</button>
                                    <button class="delete-btn" data-id="${promotion.id}">Xóa</button>
                                </div>
                            </td>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>


                <!-- Thêm mã ưu đãi mới -->
                <div id="addPromotionModal" class="modal">
                    <div class="modal-content">
                        <h3>Thêm mã ưu đãi mới</h3>
                        <form id="addPromotionForm" action="add-promotional" method="post">
                            <label>Mã ưu đãi:</label>
                            <input type="text" id="promotionCode" name="code" required>

                            <label>Giá trị:</label>
                            <input type="text" id="promotionName" name="value" required>

                            <label>Ngày bắt đầu:</label>
                            <input type="datetime-local" id="promotionDateStart" name="startDate" required>

                            <label>Ngày kết thúc:</label>
                            <input type="datetime-local" id="promotionDateEnd" name="endDate" required>

                            <c:if test="${not empty error}">
                                <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                            </c:if>
                            <button type="submit" id="save_Product">Lưu ưu đãi</button>
                            <button type="button" class="close-modal">Thoát</button>
                        </form>

                    </div>
                </div>

                <!-- Modal cho chỉnh sửa thông tin  -->
                <div id="editPromotional" class="modal">
                    <div class="modal-content">
                        <span class="close-btn " onclick="closeModal1()" &times;></span>
                        <h2 style="color: #FFC857" class="modal-title">Chỉnh sửa ưu đãi</h2>

                            <!-- Form chỉnh sửa thông tin -->
                            <form id="editInfoForm" action="update-promotional" method="POST" >
                                <input type="hidden" name="id" id="promotionId">
                                <div class="mb-3">
                                    <label for="percent" class="form-label">Giá trị:</label>
                                    <input type="number" name="value" class="form-control" id="percent"
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
                                <!-- Thông báo lỗi -->
                                <c:if test="${not empty error}">
                                    <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                                </c:if>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" id="saveChanges">Lưu thay đổi</button>
                                    <button type="button" class="close-modal btn btn-secondary ">Hủy</button>
                                </div>
                            </form>

                    </div>
                </div>

                <!-- Modal Xóa ưu đãi -->
                <div id="delete-modal" class="modal">
                    <div class="modal-content">
                        <h3>Xác nhận xóa</h3>
                        <label>Bạn có chắc chắn muốn xóa ưu đãi này?</label>
                        <div class="button-container">
                            <button id="confirm-delete" class="confirm-delete">Xóa</button>
                            <button type="button" class="close-modal">Hủy</button>
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
<div id="errorMessage"
     style="display: none; color: white; background-color: red; padding: 10px; text-align: center; position: fixed; top: 10px; left: 50%; transform: translateX(-50%); border-radius: 5px;">
    Lỗi hệ thống, vui lòng thử lại!
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="<c:url value="/admin/js/index.js"/>"></script>
<script src="<c:url value="/admin/js/promotional.js"/>"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra nếu cần hiển thị modal
        const showModal = "${showModal}" === "true";
        if (showModal) {
            const modal = document.getElementById('addPromotionModal');
            modal.style.display = 'block';
        }
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra nếu cần hiển thị modal
        const showModal = "${showModal}" === "true";
        if (showModal) {
            const modal = document.getElementById('editPromotional');
            modal.style.display = 'flex';

        }
    });
</script>
<script>
    $(document).ready(function () {
        $('#productTable').DataTable({
            "paging": true,         // Hiển thị phân trang
            "searching": true,      // Hiển thị ô tìm kiếm
            "ordering": true,       // Cho phép sắp xếp cột
            "info": true,           // Hiển thị thông tin số lượng dữ liệu
            "lengthMenu": [5, 10, 25, 50, 100], // Số dòng hiển thị mỗi trang
            "language": {
                "lengthMenu": "Hiển thị _MENU_ voucher mỗi trang",
                "zeroRecords": "Không tìm thấy sản phẩm nào",
                "info": "Trang _PAGE_ trên tổng _PAGES_ trang",
                "infoEmpty": "Không có sản phẩm",
                "infoFiltered": "(lọc từ _MAX_ sản phẩm)",
                "search": "Tìm kiếm:",
                "paginate": {
                    "first": "Đầu",
                    "last": "Cuối",
                    "next": "Tiếp",
                    "previous": "Trước"
                }
            }
        });
    });

    //     Cập nhật trang thái của voicher =AJAX
    $(".toggle-status").on("change", function () {
        let checkbox = $(this);
        let id = checkbox.data("id");
        let endDate = checkbox.closest("tr").find(".endDate-hidden").val();
        let oldStatus = checkbox.is(":checked") ? "Không hoạt động" : "Hoạt động"; // Trạng thái trước khi thay đổi
        let newStatus = checkbox.is(":checked") ? "Hoạt động" : "Không hoạt động";
        if (!endDate) {
            alert("Ngày kết thúc không được để trống!");
            checkbox.prop("checked", !checkbox.prop("checked")); // Quay lại trạng thái ban đầu
            return;
        }

        // Cập nhật ngay trên giao diện (chưa lưu vào server)
        checkbox.next(".status-text").text(newStatus);

        $.ajax({
            url: "/tqh/update-status-promotional",
            type: "POST",
            data: {id: id, status: newStatus, endDate: endDate},
            dataType: "json",
            success: function (response) {
                console.log("Phản hồi từ server:", response);
                if (!response.success) {
                    alert(response.message);
                    checkbox.prop("checked", !checkbox.prop("checked"));
                    if (newStatus != "Hoạt động") {
                        checkbox.next(".status-text").text(newStatus);
                    } else {
                        checkbox.next(".status-text").text(oldStatus);
                    }
                } else {
                    checkbox.next(".status-text").text(newStatus)
                }
            },
            error: function () {
                // Hiển thị thông báo lỗi
                $("#errorMessage").fadeIn().delay(2000).fadeOut();

                // Quay lại trạng thái ban đầu
                checkbox.prop("checked", !checkbox.prop("checked"));
                checkbox.next(".status-text").text(oldStatus);
            }
        });
    });

</script>

</body>

</html>