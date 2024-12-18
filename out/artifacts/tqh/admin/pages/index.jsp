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
                    <a href="accounts">
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
                    <a href="category.html">
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

            <!------------------- Thẻ------------------>
            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers">1,504</div>
                        <div class="cardName">Lượt Xem</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="eye-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">80</div>
                        <div class="cardName">Số lượng người dùng</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="cart-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">284</div>
                        <div class="cardName">Nhận Xét</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="chatbubbles-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">10.842.000₫</div>
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
                        <a href="#" class="btn">Xem Tất Cả</a>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <td>Tên</td>
                                <td>Giá</td>
                                <td>Thanh Toán</td>
                                <td>Trạng Thái</td>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>Xi măng SCG-PC40-ELE</td>
                                <td>300.000₫</td>
                                <td>Đã Thanh Toán</td>
                                <td><span class="status delivered">Đã Giao</span></td>
                            </tr>

                            <tr>
                                <td>Sơn Sắt Giả Gỗ Lotus Meta Coat Primer – 1 Sơn Lót + 1 Sơn Phủ</td>
                                <td>431.000₫</td>
                                <td>Chưa Thanh Toán</td>
                                <td><span class="status inProgress">Đang Tiến Hành</span></td>
                            </tr>

                            <tr>
                                <td>Thép cốt bê tông</td>
                                <td>300.000₫</td>
                                <td>Đã Thanh Toán</td>
                                <td><span class="status delivered">Đã Giao</span></td>
                            </tr>

                            <tr>
                                <td>Thép hộp vuông mạ kẽm Sendo</td>
                                <td>600.000₫</td>
                                <td>Chưa Thanh Toán</td>
                                <td><span class="status pending">Đang Chờ</span></td>
                            </tr>

                            <tr>
                                <td>Máy bơm tăng áp A-130 JAK – Panasonic</td>
                                <td>2,150,000₫</td>
                                <td>Đã Thanh Toán</td>
                                <td><span class="status return">Trả Hàng</span></td>
                            </tr>

                            <tr>
                                <td>Đồng hồ điện điện tử LSE LS142 có 1 pha 2 dây</td>
                                <td>200.000₫</td>
                                <td>Chưa Thanh Toán</td>
                                <td><span class="status inProgress">Đang Tiến Hành</span></td>
                            </tr>
                            <tr>
                                <td>Máy nước nóng Beko BWI35S1N-213</td>
                                <td>2.450.000₫</td>
                                <td>Chưa Thanh Toán</td>
                                <td><span class="status inProgress">Đang Tiến Hành</span></td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <!-------------------- Khách Hàng Mới------------------->
                <div class="recentCustomers">
                    <div class="cardHeader">
                        <h2>Khách hàng tiềm năng</h2>
                    </div>
                    <table>
                        <tr>
                            <td width="60px">
                                <a href="account.html">
                                    <ion-icon name="person"
                                        style="color: #1841e4; font-size: 20px; text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);"></ion-icon>
                                </a>
                            </td>
                            <td>
                                <h4>Nguyễn Văn A </h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <a href="account.html">
                                    <ion-icon name="person"
                                        style="color: #1841e4; font-size: 20px; text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);"></ion-icon>
                                </a>
                            </td>
                            <td>
                                <h4>Trần Thị B <br> </h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <a href="account.html">
                                    <ion-icon name="person"
                                        style="color: #1841e4; font-size: 20px; text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);"></ion-icon>
                                </a>
                            </td>
                            <td>
                                <h4>Lê Hoàng C <br> </h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <a href="account.html"> 
                                    <ion-icon name="person" style="color: #1841e4; font-size: 20px; text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);"></ion-icon>
                                  </a>        
                            </td>
                            <td>
                                <h4>Phạm Minh D </h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <a href="account.html"> 
                                    <ion-icon name="person" style="color: #1841e4; font-size: 20px; text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);"></ion-icon>
                                  </a>        
                            </td>
                            <td>
                                <h4>Đỗ Thị E </h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <a href="account.html"> 
                                    <ion-icon name="person" style="color: #1841e4; font-size: 20px; text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);"></ion-icon>
                                  </a>        
                            </td>
                            <td>
                                <h4>Trần Hoàng M </h4>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="<c:url value="/admin/js/index.js"/>"></script>
</body>

</html>