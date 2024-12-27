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
</head>
<body>
<!-- ------------------ Điều hướng -------------------->
<div class="container">
    <div class="navigation">
        <ul>
            <li>
                <a href="index.html">
                        <span class="icon">
                            <img src="/src/Users/img/logo.png" alt="">
                        </span>
                    <span class="title">Bán Vật Liệu Xây Dựng </span>
                </a>
            </li>

            <li>
                <a href="index.html">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                    <span class="title">Trang chủ</span>
                </a>
            </li>

            <li>
                <a href="user.jsp">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                    <span class="title">Khách Hàng</span>
                </a>
            </li>

            <li>
                <a href="products.html">
                        <span class="icon">
                            <ion-icon name="cube-outline"></ion-icon>
                        </span>
                    <span class="title">Sản phẩm</span>
                </a>
            </li>
            <li>
                <a href="order.html">
                        <span class="icon">
                            <ion-icon name="receipt-outline"></ion-icon>
                        </span>
                    <span class="title">Hóa đơn</span>
                </a>
            </li>


            <li>
                <a href="discount.html">
                        <span class="icon">
                            <ion-icon name="help-outline"></ion-icon>
                        </span>
                    <span class="title">Khuyến Mãi</span>
                </a>
            </li>
            <li>
                <a href="promotional.html">
                        <span class="icon">
                            <ion-icon name="pricetag-outline"></ion-icon>
                        </span>
                    <span class="title">Mã giảm giá</span>
                </a>
            </li>

            <li>
                <a href="category.jsp">
                        <span class="icon">
                            <ion-icon name="list-outline"></ion-icon>
                        </span>
                    <span class="title">Danh mục</span>
                </a>
            </li>
            <li>
                <a href="review.html">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                    <span class="title">Review</span>
                </a>
            </li>


            <li>
                <a href="passwordManagement.html">
                        <span class="icon">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                        </span>
                    <span class="title">Tài khoản</span>
                </a>
            </li>

            <li>
                <a href="/src/Users/page/login-signup.jsp">
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

            <div class="search">
                <label>
                    <input type="text" placeholder="Tìm kiếm ở đây">
                    <ion-icon name="search-outline"></ion-icon>
                </label>
            </div>

            <div class="user">
                <a href="passwordManagement.html"> <ion-icon name="person"
                                                             style="color: #000000; font-size: 25px;"></ion-icon></a>

            </div>
        </div>

        <!-- Phần chính -->
        <div class="order">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>Danh sách hóa đơn</h2>
                    <a href="#" class="btn">Xem Tất Cả</a>
                </div>
                <div class="update-order">
                    <p style="font-size: 20px; margin-bottom: 10px;">Cập nhật trạng thái hóa đơn</p>
                    <input type="text" placeholder="Nhập ID hóa cần cập nhật"
                           style="font-size: 15px; padding: 2px; border-radius: 5px;">
                    <select title="choice" id="statusSelect"
                            style="font-size: 15px; border-radius: 5px; padding: 2px;">
                        <option value="active">Đang xử lý</option>
                        <option value="inactive">Đã hoàn thành</option>
                        <option value="pending">Đã hủy</option>

                    </select>
                    <button onclick="updateUserStatus()">Cập nhật trạng thái</button>
                </div>
                <table>
                    <thead>
                    <tr>
                        <td>Mã đơn hàng</td>
                        <td>Mã khách hàng</td>
                        <td>Ngày đặt hàng</td>
                        <td>Tổng tiền</td>
                        <td>Hình thức thanh toán</td>
                        <td>Trạng thái</td>
                        <td>Hành động</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="o" items="${orderList}">
                    <tr>
                        <td>${o.id}</td>
                        <td>${o.user_id}</td>
                        <td><fmt:formatDate value="${o.createdAt}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                        <td><fmt:formatNumber value="${o.totalPrice}" type="number" /></td>
                        <td>${o.paymentMethod}</td>
                        <td>${o.paymentStatus}</td>
                        <td class="v">
                            <button class="view-detail-btn" data-id="${o.id}">Chi tiết</button>
                            <button class="delete-btn" data-id="${o.id}">Xóa</button>
                        </td>
                        <c:if test="${not empty error}">
                            <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                        </c:if>
                    </tr>
                    </c:forEach>

                    <!-- Thêm các dòng dữ liệu khác tại đây -->
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
                    <table class="order-detail-table">
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
                        <c:forEach var="order" items="orderDetail">
                        <tr>
                            <td> Xi măng BC</td>
                            <td>20</td>
                            <td>1.000.000 ₫</td>
                            <td>0 ₫</td>
                            <td>1.000.000 ₫</td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="order-info">
                        <p><strong>Mã đơn hàng:</strong> <span class="info-highlight">22</span></p>
                        <p><strong>Mã khách hàng:</strong> <span class="info-highlight">12</span></p>
                        <p><strong>Ngày đặt hàng:</strong> <span class="info-highlight">2024-12-12</span></p>
                        <p><strong>Tổng tiền:</strong> <span class="info-highlight total-price">2.000.000 ₫</span></p>
                        <p><strong>Trạng thái:</strong> <span class="badge success">Đã thanh toán</span></p>
                        <p><strong>Địa chỉ:</strong> Bình Thạnh</p>
                        <p><strong>Người nhận hàng:</strong> Tuấn</p>
                        <p><strong>Ghi chú:</strong> Giao tới tận nhà cho tôi</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Xóa tài khoản -->
        <div id="delete-modal" class="modal">
            <div class="modal-content">
                <h3>Xác nhận xóa</h3>
                <label>Bạn có chắc chắn muốn xóa hóa đơn này?</label>
                <div class="button-container">
                    <button id="confirm-delete" class="confirm-delete">Xóa</button>
                    <button type="button" class="close-modal">Hủy</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="admin/js/order.js"></script>
<script src="admin/js/index.js"></script>
</body>
</html>