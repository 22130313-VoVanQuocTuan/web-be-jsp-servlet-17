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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
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
                <a href="home">
                        <span class="icon">
                           <img src="${pageContext.request.contextPath}/users/img/logo.png" alt="">
                        </span>
                    <span class="title">Bán Vật Liệu Xây Dựng </span>
                </a>
            </li>

            <li class="hov active">
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
                    <div class="numbers">${totalViews}</div>
                    <div class="cardName">Lượt Xem</div>
                </div>

                <div class="iconBx">
                    <ion-icon name="eye-outline"></ion-icon>
                </div>
            </div>

            <a href="accounts" style="text-decoration: none">
                <div class="card">
                    <div>
                        <div class="numbers">${totalUsers}</div>
                        <div class="cardName">Số lượng người dùng</div>
                    </div>

                    <div class="iconBx">
                        <i class="fa-solid fa-users"></i>
                    </div>
                </div>
            </a>

            <a href="list-rating" style="text-decoration: none">
                <div class="card">

                    <div>
                        <div class="numbers">${totalRatings}</div>
                        <div class="cardName">Đánh giá</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="chatbubbles-outline"></ion-icon>
                    </div>
                </div>
            </a>

            <div class="card">
                <div>
                    <div class="numbers"><fmt:formatNumber value="${totalSales}" type="number"/> ₫</div>
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

                <table>
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
                    <c:forEach var="view" items="${viewOrder}">
                        <tr>
                            <td>${view.userId}</td>
                            <td><fmt:formatNumber value="${view.totalPrice}" type="number"/>đ</td>
                            <td>${view.paymentStatus}</td>
                            <td>${view.createdAt}</td>
                            <td>${view.status}</td>
                                <%--                                <td><span class="status delivered">Đã Giao</span></td>--%>
                        </tr>
                    </c:forEach>
                    </tbody>

                </table>
            </div>

            <!-------------------- Khách Hàng Mới------------------->
            <div class="recentCustomers">
                <div class="cardHeader">
                    <h2>Khách hàng tiềm năng</h2>
                    <a href="home?showAll=users" class="btn">Xem Tất Cả</a>
                </div>
                <table>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td width="60px">
                                <a href="accounts">
                                    <ion-icon name="person"
                                              style="color: #1841e4; font-size: 20px; text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);"></ion-icon>
                                </a>
                            </td>
                            <td>
                                <h4>${user.email}</h4>
                            </td>
                        </tr>
                    </c:forEach>


                </table>
            </div>
        </div>
        <%-- -----------------Tạo biểu đồ doanh thu------------------------%>
        <div class="chart-container">
            <h2>Biểu đồ Doanh thu</h2>
            <div class="button-container">
                <button onclick="loadChart('week')">Doanh thu theo tuần</button>
                <button onclick="loadChart('month')">Doanh thu theo tháng</button>
                <button onclick="loadChart('year')">Doanh thu theo năm</button>
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
<script>
    // Biểu đồ doanh thu
    let chartInstance = null;
    // Danh sách màu sắc cố định
    const colors = [
        'rgba(255, 99, 132, 0.7)',  // Đỏ hồng
        'rgba(54, 162, 235, 0.7)',  // Xanh dương
        'rgba(255, 206, 86, 0.7)',  // Vàng
        'rgba(75, 192, 192, 0.7)',  // Xanh ngọc
        'rgba(153, 102, 255, 0.7)', // Tím
        'rgba(255, 159, 64, 0.7)',  // Cam
        'rgba(0, 204, 102, 0.7)'    // Xanh lá đậm
    ];

    function loadChart(type) {
        fetch('home?type=' + type)
            .then(response => response.json())
            .then(data => {
                if (!Array.isArray(data) || data.length === 0) {
                    console.error("Dữ liệu trống hoặc không hợp lệ");
                    return;
                }

                const labels = data.map(item =>
                    type === 'week' ? item.week :
                        type === 'month' ? item.month :
                            item.year);
                const revenues = data.map(item => item.revenue);

                // Gán màu sắc tuần tự từ danh sách
                const backgroundColors = labels.map((_, index) => colors[index % colors.length]);
                const borderColors = backgroundColors.map(c => c.replace('0.7', '1'));

                const chartData = {
                    labels: labels,
                    datasets: [{
                        label: 'Doanh thu (VNĐ)',
                        data: revenues,
                        backgroundColor: backgroundColors,
                        borderColor: borderColors,
                        borderWidth: 1
                    }]
                };

                if (chartInstance) {
                    chartInstance.destroy();
                }

                chartInstance = new Chart(document.getElementById('revenueChart'), {
                    type: 'bar',
                    data: chartData,
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {display: false} // Ẩn chú thích để biểu đồ gọn hơn
                        },
                        scales: {
                            y: {beginAtZero: true}
                        }
                    }
                });
            })
            .catch(error => console.error("Lỗi fetch dữ liệu:", error));
    }

    loadChart('month');
</script>
</body>
</html>