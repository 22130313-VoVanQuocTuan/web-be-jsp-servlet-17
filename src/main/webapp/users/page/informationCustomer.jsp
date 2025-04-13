<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vật Liệu Xây Dựng TQH </title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4-beta3/css/all.min.css"/>
<link rel="stylesheet" href="<c:url value="/users/css/informationCustomer.css"/>">
<link rel="stylesheet" href="<c:url value="/users/css/home.css"/>">
<style>
    /* Định kiểu cho các thông báo */
    .alert {
        position: fixed; /* Để thông báo hiển thị cố định trên màn hình */
        top: 50%; /* Đặt thông báo vào giữa màn hình theo chiều dọc */
        left: 50%; /* Đặt thông báo vào giữa màn hình theo chiều ngang */
        transform: translate(-50%, -50%); /* Dịch chuyển lại thông báo để nó chính giữa */
        padding: 15px; /* Đệm để thông báo không dính vào mép */
        text-align: center; /* Căn giữa nội dung trong thông báo */
        font-size: 12px; /* Cỡ chữ lớn hơn */
        font-weight: bold;
        z-index: 9999; /* Đảm bảo thông báo luôn hiển thị phía trên */
        animation: fadeIn 0.5s ease-in-out;
        opacity: 1;
    }

    /* Thông báo thành công */
    .alert-success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }

    /* Thông báo thất bại */
    .alert-danger {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }

    /* Thông báo thông tin */
    .alert-info {
        background-color: #f7d774;
        color: #000000;
        border: 1px solid #bee5eb;
    }

    /* Thông báo cảnh báo */
    .alert-warning {
        background-color: #fff3cd;
        color: #856404;
        border: 1px solid #ffeeba;
    }

    /* Animation cho thông báo khi xuất hiện */
    @keyframes fadeIn {
        0% {
            opacity: 0;
        }
        100% {
            opacity: 1;
        }
    }

    /* Animation cho thông báo khi biến mất */
    @keyframes fadeOut {
        0% {
            opacity: 1;
        }
        100% {
            opacity: 0;
            display: none;
        }
    }

    /* Sử dụng animation fade-out sau 3 giây */
    .fade-out {
        animation: fadeOut 1s ease-in-out forwards;
    }
</style>
<body>
<div id="section-header1">
    <div class="container">
        <div class="banner">
            <div class="top-left">
                <p class="animated-text">
                    <marquee>Chào mừng bạn đến với website của chúng tôi !</marquee>
                </p>
            </div>
            <div class="top-right">
         <span id="user-greeting" style="display: none; color: #ffffff;">
                           Xin chào,  <span
                 id="username">${sessionScope.user.username != null ? sessionScope.user.username : ''}</span>!</span>

                <a href="turn-page?action=infoUser" style="text-decoration: none">
                    <button type="submit" class="account-link" id="signup-link"
                            style="display: none;">
                        <i class="fas fa-user-circle"></i> Tài khoản
                    </button>
                </a>
                <form action="login" method="post">
                    <input name="action" type="hidden" value="login"/>
                    <button type="submit" id="login-link">
                        <span><i class="fa fa-fw fa-user"></i> Đăng Nhập</span>
                    </button>
                </form>
                <form action="logout" method="post">
                    <button type="submit" id="logout-link"
                            style="display: none;"><span>Đăng Xuất</span></button>
                </form>
            </div>
        </div>

    </div>
</div>
<div class="fixed">
    <div id="section-header2">
        <div class="container">
            <div class="menu">
                <!-- Logo bên trái -->
                <div class="logo">
                    <a href="home-page"><img src="${pageContext.request.contextPath}/users/img/logo.png" alt="Logo"></a>
                </div>

                <!-- Thanh tìm kiếm ở giữa -->
                <form action="product" method="GET">
                    <div class="search-bar">
                        <input type="hidden" name="search" value="true">
                        <input name="name" type="text" placeholder="Tìm kiếm sản phẩm...">
                        <button type="submit" title="icon"><i class="fa fa-fw fa-search"></i></button>
                    </div>
                </form>

                <!-- Thông tin bên phải -->
                <div class="info">
                    <div class="hotline">
                        <span class="hotline-text">HOTLINE LIÊN HỆ </span>
                        <a href=""> 0905.090.252</a>
                    </div>
                </div>
                <div class="cart">
                    <div class="cart-wrapper">
                        <a href="cart-items">
                            <i class="fas fa-shopping-cart"></i>
                        </a>
                        <span class="cart-count" id="cart-count">${sessionScope.cartItemCount}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="section-nav">
        <div class="container">
            <button class="menu-toggle"><i class="fa-solid fa-bars"></i> Menu</button>
            <ul class="nav navbar-nav navbar-center">
                <li class="propClone">
                    <span class="none-a">
                        <i class="fa-solid fa-list" style="color: #d0cdcd;"></i> &nbsp;&nbsp; DANH MỤC SẢN PHẨM
                    </span>
                    <ul class="items">
                        <c:forEach var="category" items="${categories}">
                            <li>
                                <a href="/tqh/product-category?categoryId=${category.id}">
                                    &nbsp;&nbsp;<i class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;${category.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
                <li class="propClone"><a href="home-page"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; TRANG CHỦ
                </a></li>
                <li class="propClone"><a href="turn-page-noLogin?action=product"><i class="fa-brands fa-product-hunt"></i>
                    &nbsp;&nbsp;SẢN PHẨM</a>
                </li>
                <li class="propClone"><a href="cart-items"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp; GIỎ
                    HÀNG</a>
                </li>
                <li class="propClone">
                    <span class="none-a"> <i class="fa-solid fa-book"></i> &nbsp;&nbsp; HƯỚNG DẪN </span>
                    <ul class="items">
                        <li><a href="turn-page?action=buyingHelp">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;HƯỚNG DẪN
                            MUA HÀNG</a>
                        </li>
                        <li><a href="turn-page?action=productUnit">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;BẢNG ĐƠN VỊ SẢN PHẨM</a>
                        </li>

                        <li><a href="turn-page?action=termAndService">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;ĐIỀU KHOẢN
                            VÀ DỊCH VỤ</a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
</div>

<div id="section-content-1">
    <div class="account-info-page">
        <h1>Thông tin tài khoản</h1>
        <p class="greeting">Xin chào, ${sessionScope.user.username != null ? sessionScope.user.username : ''}</p>

        <div class="content">
            <!-- Đơn hàng gần nhất -->
            <div class="recent-orders">
                <h2>Đơn hàng gần nhất</h2>
                <div class="table-container">
                    <table id="order" >
                        <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Ngày đặt</th>
                            <th>Địa chỉ</th>
                            <th>Tình trạng thanh toán</th>
                            <th>Chi tiết đơn hàng</th>
                            <th>Hành động</th>
                        </tr>
                        </thead>

                        <tbody >
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Thông tin khách hàng -->
            <div class="customer-info" id="infoUser">

            </div>
        </div>

    </div>

    <!-- Modal Hủy đơn hàng -->
    <div id="cancelOrderModal" class="modal">
        <div class="modal-content">
            <h2 class="modal-title">Xác nhận hủy đơn hàng</h2>
            <p class="titles">Bạn chắc chắn muốn hủy đơn hàng này?</p>
            <div class="modal-buttons-dele">
                <form id="cancelOrderForm">
                    <input type="hidden" id="orderId" name="orderId">
                    <button type="submit" class="confirm-delete">Hủy đơn hàng</button>
                </form>
                <button type="button" class="close-modal-dele" id="closeModalBtn" onclick="closeModalsCancelOrderModal()">Đóng</button>
            </div>
        </div>
    </div>

    <!-- Modal Chi tiết đơn hàng -->
    <div id="orderDetailModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h2 class="modal-title">Chi tiết đơn hàng</h2>
            <div id="orderDetailContent">
                <!-- Thông tin chi tiết -->
                <table class="order-detail-table" id="orderDetail">
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

                <div class="order-info" id="order-info" >

                </div>

            </div>
        </div>
    </div>

    <!-- Modal cho chỉnh sửa thông tin  -->
    <div id="editInformationModal" class="modal">
        <div class="modal-content">
            <span class="close-btn " onclick="closeModal1()" &times;></span>
            <h2 class="modal-title">Chỉnh sửa thông tin</h2>

            <div class="editInformationContent">
                <!-- Form chỉnh sửa thông tin -->
                <form id="editInfoForm">
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên</label>
                        <input type="text" name="fullName" class="form-control" id="name" placeholder="Nhập tên của bạn"
                               >
                        <!-- Thông báo lỗi sẽ hiển thị ở đây -->
                        <span class="error"  id="errorName"></span>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Số điện thoại</label>
                        <input type="tel" name="phoneNumber" class="form-control" id="phone"
                               placeholder="Nhập số điện thoại" >
                        <!-- Thông báo lỗi sẽ hiển thị ở đây -->
                        <span class="error"  id="errorPhone"></span>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Địa chỉ</label>
                        <textarea class="form-control" name="address" id="address" rows="3" placeholder="Nhập địa chỉ"
                                  required></textarea>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" id="saveChanges">Lưu thay đổi</button>
                        <button type="button" class="btn btn-secondary" onclick="closeModal1()">Hủy</button>
                    </div>
                </form>
            </div>


        </div>
    </div>

    <div id="updatePassword" class="modal">
        <div class="modal-content">
            <span class="close-btn " onclick="openModalPass()" &times;></span>
            <h2 class="modal-title">Đổi mật khẩu</h2>

            <div class="editInformationContent">
                <!-- Form chỉnh sửa thông tin -->
                <form id="updatePass" >
                    <div class="mb-3">
                        <label for="name" class="form-label">Email</label>
                        <input type="text" name="email" class="form-control" id="email" placeholder="Nhập email của bạn"
                               required>
                        <!-- Thông báo lỗi sẽ hiển thị ở đây -->
                        <span class="error"  id="errorEmail"></span>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Mật khẩu cũ</label>
                        <input type="tel" name="pass" class="form-control" id="pass"
                               placeholder="Mật kẩu cũ" required>
                        <!-- Thông báo lỗi sẽ hiển thị ở đây -->
                        <span class="error"  id="errorPass"></span>
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Mật khẩu mới</label>
                        <input type="tel" name="pass" class="form-control" id="passConfirm" placeholder="Mật khẩu mới"
                                  required>
                        <!-- Thông báo lỗi sẽ hiển thị ở đây -->
                        <span class="error"  id="errorPassConfirm"></span>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" id="saveChangesPass">Lưu thay đổi</button>
                        <button type="button" class="btn btn-secondary" onclick="closeModal1()">Hủy</button>
                    </div>
                </form>
            </div>


        </div>
    </div>
    <%-- Kiểm tra xem có thông báo nào không --%>
    <div id="message" class="alert alert-info" style="display: none">
        <!-- Thông báo lỗi sẽ được chèn vào đây -->
    </div>


</div>

</div>

<div id="section-footer">
    <div class="container">
        <div class="contact-info">
            <h3>Vật Liệu Xây Dựng TQH </h3>
            <p>Địa chỉ: Trường ĐH Nông Lâm TP. HCM</p>
            <p>Điện thoại: 0314 597 812</p>
            <p>Hotline: 0905 090 252</p>
            <p>Email: 22130098@st.hcmuaf.edu.vn</p>
        </div>
        <div class="links">
            <h3>Liên kết</h3>
            <ul>
                <li><a href="turn-page?action=introduce">Giới thiệu</a></li>
                <li><a href="turn-page?action=termAndService">Điều khoản và dịch vụ</a></li>
            </ul>
        </div>
        <div class="social-media">
            <h3>Mạng xã hội</h3>
            <ul>
                <li><a href="https://www.facebook.com/profile.php?id=100044411504061"><i
                        class="fa-brands fa-facebook" style="color: #d1d1d1;"></i></a></li>
                <li><a href="https://www.instagram.com/paq.2012/"><i class="fa-brands fa-instagram-square"
                                                                     style="color: #d1d1d1;"></i></a></li>
                <li><a href="https://x.com/?lang=vi"><i class="fa-brands fa-twitter"
                                                        style="color: #d1d1d1;"></i></a></li>
            </ul>
        </div>
        <div class="copyright">
            <p>© 2024: Tất cả quyền được bảo lưu.</p>
        </div>
    </div>
    <div>
        <li style="list-style-type: none;"><a href="https://zaloweb.me/" target="_blank" rel="noopener"><i
                class="fa-solid fa-phone call" style="color: #02bc15d1;"></i></a></li>
    </div>
    <div>
        <li style="list-style-type: none;"><a href="https://www.instagram.com/paq.2012/" target="_blank"
                                              rel="noopener"><i class="fab fa-instagram icon"
                                                                style="color: #f12020;"></i></a></li>
    </div>
    <div id="fb">
        <li style="list-style-type: none;"><a href="https://www.facebook.com/profile.php?id=100044411504061"
                                              target="_blank" rel="noopener"><i
                class="fa-brands fa-facebook-square icon"
                style="color: #0911ff;"></i></a></li>
    </div>
    <button id="backToTop" title="Quay về đầu trang">⬆</button>
</div>
<script src="<c:url value="/users/js/scripts.js"/>"></script>
<script src="<c:url value="/users/js/login-signup.js"/>"></script>
<script src="<c:url value="/users/js/informationCustomer.js"/>"></script>

</body>
</html>