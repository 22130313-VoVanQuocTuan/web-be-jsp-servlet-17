<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng điều khiển Quản trị viên </title>
    <!------------------ Kiểu dáng ------------------>
    <link rel="stylesheet" href="admin/css/style.css">
    <link rel="stylesheet" href="admin/css/order.css">
    <!-------------------Thêm jQuery----------------->
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

    @media print {
        body {
            font-size: 14px; /* Giữ font chữ nhỏ gọn */
            background-color: white; /* Đảm bảo nền trắng khi xuất PDF */
        }

        .modal {
            width: 100%;
            max-width: 800px; /* Giữ kích thước modal hợp lý */
        }

        .order-detail-table {
            width: 100%;
            border-collapse: collapse;
        }

        .order-detail-table th, .order-detail-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .badge {
            display: inline-block;
            padding: 5px 10px;
            color: white;
            border-radius: 4px;
        }

        .badge.success {
            background-color: #28a745; /* Màu xanh của trạng thái thanh toán */
        }
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
                            <img src="<c:url value="/users/img/logo.png"/>" alt="">
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
            <li class="hov active">
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
                <a href="informationCustomer">
                    <ion-icon name="person"
                              style="color: #000000; font-size: 25px;"></ion-icon>
                </a>

            </div>
        </div>

        <!-- Phần chính -->
        <div class="order">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>Danh sách hóa đơn</h2>
                </div>
                <table id="orderTable" class="display">
                    <thead>
                    <tr>
                        <td>Mã đơn hàng</td>
                        <td>Mã khách hàng</td>
                        <td>Ngày đặt hàng</td>
                        <td>Tổng tiền</td>
                        <td>Trạng thái</td>
                        <td>Hình thức thanh toán</td>
                        <td>Trạng thái thanh toán</td>
                        <td>Hành động</td>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>


        </div>
        <!-- Modal Chi tiết đơn hàng -->
        <div id="orderDetailModal" class="modal">
            <div class="modal-content">
                <span class="close-modal">&times;</span>
                <h2 class="modal-title">Chi tiết đơn hàng</h2>
                <div id="orderDetailContent">
                    <!-- Thông tin chi tiết -->
                    <table id="orderDetail" class="order-detail-table">
                        <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Giảm giá</th>
                            <th>Tổng giá</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <div class="order-info">
                        <p><strong>Mã đơn hàng:</strong> <span class="info-highlight" id="modal-order-id"></span></p>
                        <p><strong>Tổng tiền:</strong> <span class="info-highlight" id="modal-total-price"></span></p>
                        <p><strong>Phí giao hàng:</strong> <span class="info-highlight" id="modal-shipping-fee"></span></p>
                        <p><strong>Số tiền giảm giá:</strong> <span class="info-highlight total-price" id="modal-discount-amount"></span></p>
                        <p><strong>Phương thức thanh toán:</strong> <span class="badge success" id="modal-payment-method"></span></p>
                        <p><strong>Trạng thái thanh toán:</strong> <span class="badge success" id="modal-payment-status"></span></p>
                        <p><strong>Địa chỉ:</strong> <span id="modal-address"></span></p>
                        <p><strong>Số lượng:</strong> <span id="modal-quantity"></span></p>
                        <p><strong>Email:</strong> <span id="modal-email"></span></p>
                        <p><strong>Người nhận hàng:</strong> <span id="modal-name"></span></p>
                        <p><strong>Số điện thoại:</strong> <span id="modal-phone"></span></p>
                        <p><strong>Ghi chú:</strong> <span id="modal-note"></span></p>
                        <div class="update-order">
                            <p style="font-size: 16px; margin-bottom: 5px;">Cập nhật trạng thái đơn hàng</p>
                            <form id="orderForm">
                                <input type="hidden" id="orderId" name="id"> <!-- Đảm bảo gửi ID đơn hàng -->

                                <label for="statusSelect">Chọn trạng thái:</label>
                                <select title="choice" id="statusSelect" name="statusPayment"
                                        style="font-size: 11px; border-radius: 5px; padding: 5px; margin-left: 10px; margin-right: 10px;">
                                    <option value="Đã thanh toán">Đã thanh toán</option>
                                    <option value="Chưa thanh toán">Chưa thanh toán</option>
                                </select>

                                <!-- Nút cập nhật -->
                                <button  type="submit" style="margin-top: 10px; padding: 6px 14px; font-size: 14px; background-color: #483033;
                                    color: #f7d774; border: none; border-radius: 5px; cursor: pointer;">
                                    Cập nhật
                                </button>

                            </form>
                            <button id="exportPDF" type="button" style="padding: 7px 8px; background-color: #891f1f; color: white; border: none;margin-top: 15px; border-radius: 5px; cursor: pointer;">
                                Xuất PDF
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Xóa tài khoản -->
        <div id="delete-modal" class="modal">
            <div class="modal-content"  style="margin-top: 10%;">
                <h3>Xác nhận xóa</h3>
                <label>Bạn có chắc chắn muốn xóa hóa đơn này?</label>
                <input type="hidden" id="orderIdDelete">
                <div class="button-container">
                    <button id="confirm-delete" class="confirm-delete" onclick="deleteOrder()">Xóa</button>
                    <button type="button" class="close-modal" onclick="closeModals()">Hủy</button>
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

<script>

</script>

<!-- Thêm thư viện -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("exportPDF").addEventListener("click", function () {
            console.log("Bắt đầu xuất PDF...");

            let modalContent = document.querySelector(".modal-content");
            // Tăng chiều cao modal để đảm bảo toàn bộ nội dung hiển thị
            modalContent.style.maxHeight = "none";
            modalContent.style.overflow = "visible";


            html2canvas(modalContent, { scale: 2 }).then(canvas => {
                let imgData = canvas.toDataURL("image/png");
                const { jsPDF } = window.jspdf;
                let doc = new jsPDF("p", "mm", "a4"); // Khổ A4

                let imgWidth = 190;
                let imgHeight = (canvas.height * imgWidth) / canvas.width;

                doc.addImage(imgData, "PNG", 10, 10, imgWidth, imgHeight);
                doc.save(`HoaDon_${Date.now()}.pdf`); // Xuất file
            });
        });
    });
</script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="<c:url value="/admin/js/configuration.js"/>"></script>
<script src="<c:url value="/admin/js/order.js"/>"></script>

</body>
</html>