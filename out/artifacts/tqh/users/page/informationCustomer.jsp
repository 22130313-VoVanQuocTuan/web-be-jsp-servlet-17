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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4-beta3/css/all.min.css" />
<link rel="stylesheet" href="<c:url value="/users/css/informationCustomer.css"/>">
<link rel="stylesheet" href="<c:url value="/users/css/home.css"/>">

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

                    <form action="informationCustomer" method="get">
                        <button type="submit" class="account-link" id="signup-link"
                                style="display: none;">
                            <i class="fas fa-user-circle"></i> Tài khoản
                        </button>
                    </form>
                    <form action="login" method="post">
                        <input name="action" type="hidden" value="login" />
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
                        <a href="../../home.jsp"><img src="${pageContext.request.contextPath}/users/img/logo.png" alt="Logo"></a>
                    </div>

                    <!-- Thanh tìm kiếm ở giữa -->
                    <div class="search-bar">
                        <input type="text" placeholder="Tìm kiếm sản phẩm...">
                        <button title="icon"><i class="fa fa-fw fa-search"></i></button>
                    </div>

                    <!-- Thông tin bên phải -->
                    <div class="info">
                        <div class="hotline">
                            <span class="hotline-text">HOTLINE LIÊN HỆ </span>
                            <a href=""> 0905.090.252</a>
                        </div>
                    </div>
                    <div class="cart">
                        <div class="cart-wrapper">
                            <a href="cart.jsp">
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
                        <span class="none-a"><i class="fa-solid fa-list" style="color: #d0cdcd;"></i> &nbsp;&nbsp; DANH
                            MỤC SẢN
                            PHẨM</span>
                        <ul class="items">
                            <li><a href="/tqh/product-category?categoryId=1">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;GẠCH XÂY
                                DỰNG</a></li>
                            <li><a href="/tqh/product-category?categoryId=2">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;XI MĂNG VÀ
                                VỮA</a></li>
                            <li><a href="/tqh/product-category?categoryId=3">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;CÁT, ĐÁ VÀ
                                SỎI</a></li>
                            <li><a href="/tqh/product-category?categoryId=4">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;THÉP VÀ
                                SẮT</a></li>
                            <li><a href="/tqh/product-category?categoryId=5">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;GỖ VÀ VẬT
                                LIỆU GỖ</a></li>
                            <li><a href="/tqh/product-category?categoryId=6">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;SƠN VÀ PHỤ
                                GIA</a></li>
                            <li><a href="/tqh/product-category?categoryId=7">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;NGÓI VÀ TẤM
                                LỢP</a></li>
                            <li><a href="/tqh/product-category?categoryId=8">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;ỐNG NƯỚC VÀ
                                PHỤ KIỆN</a></li>
                            <li><a href="/tqh/product-category?categoryId=9">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;THIẾT BỊ
                                ĐIỆN NƯỚC</a></li>
                        </ul>
                    </li>
                    <li class="propClone"><a href="../../../home.jsp"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; TRANG CHỦ
                    </a></li>
                    <li class="propClone"><a href="../product.jsp"><i class="fa-brands fa-product-hunt"></i>
                        &nbsp;&nbsp;SẢN PHẨM</a>
                    </li>
                    <li class="propClone"> <a href="../cart.jsp"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp; GIỎ
                        HÀNG</a>
                    </li>
                    <li class="propClone">
                        <span class="none-a"> <i class="fa-solid fa-book"></i> &nbsp;&nbsp; HƯỚNG DẪN </span>
                        <ul class="items">
                            <li><a href="../buying-help.jsp">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;HƯỚNG DẪN
                                MUA HÀNG</a>
                            </li>
                            <li><a href="../product_unit.jsp">&nbsp;&nbsp;<i
                                    class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;BẢNG ĐƠN VỊ SẢN PHẨM</a>
                            </li>

                            <li><a href="../term_and_services.jsp">&nbsp;&nbsp;<i
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
                    <table>
                        <thead>
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Ngày đặt</th>
                                <th>Địa chỉ</th>
                                <th>Tình trạng thanh toán</th>
                                <th>Chi tiết đơn hàng</th>
                            </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.createdAt}</td>
                                <td>${order.shippingAddress}</td>
                                <td>${order.paymentStatus}</td>
                                <td>
                                    <button class="view-detail-btn" onclick="showOrderDetail('SP001')">Xem</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>

                <!-- Thông tin khách hàng -->
                <div class="customer-info">
                    <h2>Thông tin khách hàng</h2>
                    <p><strong>Tên:</strong>${info.fullName}</p>
                    <p><strong>Email:</strong> ${info.email}</p>
                    <p><strong>Số điện thoại:</strong>${info.phoneNumber}</p>
                    <p><strong>Địa chỉ:</strong> ${info.address}</p>
                    <button class="edit-btn" onclick="openModal1()">Chỉnh sửa thông tin</button>
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
                            <tr>
                                <td></td>
                                <td>20</td>
                                <td>1.000.000 ₫</td>
                                <td>0 ₫</td>
                                <td>1.000.000 ₫</td>
                            </tr>

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

        <!-- Modal cho chỉnh sửa thông tin  -->
        <div id="editInformationModal" class="modal">
            <div class="modal-content">
                <span class="close-btn " onclick="closeModal1()" &times;></span>
                <h2 class="modal-title">Chỉnh sửa thông tin</h2>

                <div class="editInformationContent">
                    <!-- Form chỉnh sửa thông tin -->
                    <form id="editInfoForm" action="update-info" method="post">
                        <div class="mb-3">
                            <label for="name"  class="form-label">Tên</label>
                            <input type="text" name="fullName" class="form-control" id="name" placeholder="Nhập tên của bạn" required>
                        </div>
                        <div class="mb-3">
                            <label for="email"  class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="Nhập email của bạn" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone"  class="form-label">Số điện thoại</label>
                            <input type="tel" name="phoneNumber" class="form-control" id="phone" placeholder="Nhập số điện thoại" required>
                        </div>
                        <div class="mb-3">
                            <label for="address"  class="form-label">Địa chỉ</label>
                            <textarea class="form-control" name="address" id="address" rows="3" placeholder="Nhập địa chỉ" required></textarea>
                        </div>
                        <!-- Thông báo lỗi -->
                        <div id="error-message" class="error-message">
                            <c:if test="${not empty error_info}">
                                ${error_info}
                            </c:if>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" id="saveChanges">Lưu thay đổi</button>
                            <button type="button" class="btn btn-secondary" onclick="closeModal1()">Hủy</button>
                        </div>
                    </form>
                </div>


            </div>
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
                    <li><a href="introduce.jsp">Giới thiệu</a></li>
                    <li><a href="term_and_services.jsp">Điều khoản và dịch vụ</a></li>
                </ul>
            </div>
            <div class="social-media">
                <h3>Mạng xã hội</h3>
                <ul>
                    <li> <a href="https://www.facebook.com/profile.php?id=100044411504061"><i
                                class="fa-brands fa-facebook" style="color: #d1d1d1;"></i></a></li>
                    <li> <a href="https://www.instagram.com/paq.2012/"><i class="fa-brands fa-instagram-square"
                                style="color: #d1d1d1;"></i></a></li>
                    <li> <a href="https://x.com/?lang=vi"><i class="fa-brands fa-twitter"
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
                    rel="noopener"><i class="fab fa-instagram icon" style="color: #f12020;"></i></a></li>
        </div>
        <div id="fb">
            <li style="list-style-type: none;"><a href="https://www.facebook.com/profile.php?id=100044411504061"
                    target="_blank" rel="noopener"><i class="fa-brands fa-facebook-square icon"
                        style="color: #0911ff;"></i></a></li>
        </div>
        <button id="backToTop" title="Quay về đầu trang">⬆</button>
    </div>
    <script src="<c:url value="/users/js/scripts.js"/>" ></script>
    <script src="<c:url value="/users/js/login-signup.js"/>"></script>
    <script src="<c:url value="/users/js/informationCustomer.js"/>"></script>


</body>

</html>