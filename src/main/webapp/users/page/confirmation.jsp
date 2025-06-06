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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4-beta3/css/all.min.css"/>
<link rel="stylesheet" href="<c:url value="/users/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/users/css/confirmation.css"/>">
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }

    td {
        padding: 10px;
        text-align: center;
    }

    .image-product {
        width: 100px; /* Điều chỉnh kích thước ảnh nếu cần */
        height: auto;
    }

    .save {
        padding: 4px 20px;
        margin-top: 10px;
        background-color: #1c293d;
        border-radius: 5px;
        border: none;
        color: #ffffff;
        cursor: pointer;
    }

    .save:hover {
        background-color: #007bff;
    }

    .sub .p:hover {
        color: #f12020;
    }
</style>
<body data-keyword="${keyword}">
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
    Xin chào, <span id="username" data-username="${sessionScope.user.username}">${sessionScope.user.username}</span>!
</span>
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
                <div class="search-bar">
                    <input name="name" type="text" placeholder="Tìm kiếm sản phẩm..." id="search-input">
                    <button title="icon" onclick="triggerSearch()"><i class="fa fa-fw fa-search"></i></button>
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
                        <a href="turn-page?action=cart">
                            <i class="fas fa-shopping-cart"></i>
                        </a>
                        <span class="cart-count" id="cart-count">${empty sessionScope.cartItemCount ? 0 : sessionScope.cartItemCount}</span>
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
                        <c:forEach var="category" items="${categories_all}">
                            <li>
                                <a href="/tqh/turn-page-noLogin?action=product&categoryId=${category.id}">
                                    &nbsp;&nbsp;<i class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;${category.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
                <li class="propClone"><a href="home-page"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; TRANG
                    CHỦ
                </a></li>
                <li class="propClone"><a href="turn-page-noLogin?action=product"><i class="fa-brands fa-product-hunt"></i>
                    &nbsp;&nbsp;SẢN PHẨM</a>
                </li>
                <li class="propClone"><a href="turn-page?action=cart"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp; GIỎ
                    HÀNG</a>
                </li>
                <li class="propClone">
                    <span class="none-a"> <i class="fa-solid fa-book"></i> &nbsp;&nbsp; HƯỚNG DẪN </span>
                    <ul class="items">
                        <li><a href="turn-page-noLogin?action=buyingHelp">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;HƯỚNG DẪN
                            MUA HÀNG</a>
                        </li>
                        <li><a href="turn-page-noLogin?action=productUnit">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;BẢNG ĐƠN VỊ SẢN PHẨM</a>
                        </li>

                        <li><a href="turn-page-noLogin?action=termAndService">&nbsp;&nbsp;<i
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
    <div class="index">
        <div class="box1">
            <div class="form-group1">
                <div class="info" style="FONT-SIZE: 20PX;font-weight: bold; margin-bottom: 16px;"> Thông tin nhận hàng</div>
                <form action="update-info-shipping" method="post">
                    <div class="form-group">
                        <input type="email" name="email" id="email" class="back email" placeholder="Email" required
                               value="${shipping_address.email}">
                        <div id="email-error" class="error-message" style="color: red; display: none;">Vui lòng nhập
                            email.
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="text" name="name" id="name" class="back name" placeholder="Họ và tên" required
                               value="${shipping_address.name}">
                        <div id="name-error" class="error-message" style="color: red; display: none;">Vui lòng nhập
                            họ và tên.
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="tel" name="phoneNumber" id="phone" class="back phone" placeholder="Số điện thoại"
                               required value="${shipping_address.phoneNumber}">
                        <div id="phone-error" class="error-message" style="color: red; display: none;">Vui lòng nhập
                            số điện thoại.
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="text" name="address" id="address" class="back address"
                               placeholder="Nhập địa chỉ (tùy chọn)"
                               required value="${shipping_address.address}">
                        <div id="address-error" class="error-message" style="color: red; display: none;">Vui lòng
                            nhập địa chỉ.
                        </div>
                    </div>


                    <div class="form-group">
                        <textarea style="font-family: Arial, Helvetica, sans-serif; width: 95%;" type="text" name="note"
                                  id="note"
                                  class="note" placeholder="Ghi chú (tùy chọn)">${shipping_address.note}</textarea>
                    </div>

                    <%-- Kiểm tra xem có thông báo nào không --%>
                    <div id="message" class="alert alert-info" style="display: none">
                        <!-- Thông báo lỗi sẽ được chèn vào đây -->
                    </div>
                    <button class="save" title="bt" type="submit">Cập nhật</button>

                </form>

            </div>

            <div class="form-group2">
                <div>
                    <div class="pay">Thanh toán</div>

                    <label for="cod-payment">
                        <input type="radio" id="cod-payment" name="payment" value="cod" required>
                        Thanh toán khi giao hàng (COD)
                    </label>
                    <br>
                    <label for="vnpay-payment">
                        <input type="radio" id="vnpay-payment" name="payment" value="vnpay" required>
                        Thanh toán qua VNPay
                    </label>
                    <!-- Thông báo lỗi chung -->
                    <div id="error-message" style=" color: red; display: none; margin-top: 6px;font-size: 8px;
                    font-weight: bold; margin-left: 3px;">Vui lòng chọn phương thức thanh toán.
                    </div>
                </div>
            </div>
        </div>

        <div class="box2">
            <div class="order">Đơn hàng</div>
            <table border="1">
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                </tr>
                <c:forEach var="c" items="${itemCart}">
                    <tr class="cart-item"  data-product-id="${c.productId}"
                        data-quantity="${c.quantity}" data-product-name="${c.name}">
                        <td>${c.name}</td>
                        <td id="cart-quantity">${c.quantity}</td>
                        <td><fmt:formatNumber value="${c.price}" type="number"/>₫</td>
                    </tr>
                </c:forEach>
            </table>
            <div class="totals">
                <div class="total p"></div>
            </div>
            <div class="totals">
                <div class="total p">Giảm giá: <fmt:formatNumber value="${sessionScope.totalDiscount}" type="number"/>₫
                </div>
                <div class="total p">Phí vận chuyển: <fmt:formatNumber value="${sessionScope.totalShippingFee}"
                                                                       type="number"/>₫
                </div>
                <div class="totals">
                    <div class="total p">Tổng cộng: <fmt:formatNumber value="${sessionScope.totalFinalPrice}"
                                                                      type="number"/>₫
                    </div>
                </div>
                <div class="sub">
                    <div class="hrep p"><a href="turn-page?action=cart" style="text-decoration: none;">
                        < Quay về giỏ hàng </a>
                    </div>
                    <a href="#" id="submit-btn">
                        <button class="submit-btn" onclick="checkInventoryAllItems()">Đặt hàng</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div id="delete-modal" class="modals" style="display: none;">
        <div class="modal-content" style="margin-top: 15%;">
            <h3>⚠ Cảnh báo số lượng</h3>
            <label id="inventory-warning-msg">Số lượng sản phẩm mua đã vượt mức hàng tồn kho.</label>

            <p id="product-out-stock" style="margin-top: 10px; font-weight: bold; color: red;"></p>
            <!-- Hiển thị tồn kho còn lại -->
<%--            <p id="inventory-left" style="margin-top: 10px; font-weight: bold; color: red;">--%>
                <!-- Nội dung sẽ được thay bằng JavaScript -->
<%--            </p>--%>

            <input type="hidden" id="productId">
            <div class="button-container">
                <button type="button" class="close-modal" onclick="confirmValid()">Oke</button>
                <button type="button" class="close-modal" onclick="closeModals()">Đóng</button>
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
                <li><a href="turn-page-noLogin?action=introduce">Giới thiệu</a></li>
                <li><a href="turn-page-noLogin?action=termAndService">Điều khoản và dịch vụ</a></li>
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
                class="fa-solid fa-phone call" style="color: rgb(62, 159, 62);"></i></a></li>
    </div>
    <div>
        <li style="list-style-type: none;"><a href="https://www.instagram.com/paq.2012/" target="_blank"
                                              rel="noopener"><i
                class="fab fa-instagram icon" style="color: #f12020;"></i></a></li>
    </div>
    <div id="fb">
        <li style="list-style-type: none;"><a href="https://www.facebook.com/profile.php?id=100044411504061"
                                              target="_blank" rel="noopener"><i
                class="fa-brands fa-facebook-square icon"
                style="color: #0911ff;"></i></a></li>
    </div>
    <button id="backToTop" title="Quay về đầu trang">⬆</button>

</div>
<!-- Overlay tối màn hình -->
<div id="overlay" class="overlay" onclick="closeForm()"></div>
<%--    <!-- Form thanh toán VNPay -->--%>
<c:if test="${showModalVNPAY}">
    <div id="vnpayForm">
        <p class="title">Thanh toán với VNPay <img
                src="https://vinadesign.vn/uploads/images/2023/05/vnpay-logo-vinadesign-25-12-57-55.jpg" alt="">
        </p>
        <form action="payVNPAY" method="post">
            <table border="1">
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th> Giá</th>
                </tr>

                <c:forEach var="cartitem" items="${itemCart}">
                    <tr>
                        <td>${cartitem.name}</td>
                        <td>${cartitem.quantity}</td>
                        <td><fmt:formatNumber value="${cartitem.totalPrice}" type="number"/> ₫</td>
                    </tr>
                    <!-- Input hidden để giữ lại thông tin của mỗi sản phẩm -->
                    <input type="hidden" name="cartItemName" value="${cartitem.name}">
                    <input type="hidden" name="cartItemQuantity" value="${cartitem.quantity}">
                    <input type="hidden" name="cartItemTotalPrice" value="${cartitem.totalPrice}">
                </c:forEach>

            </table>
            <p>Số lượng: ${sessionScope.cartItemCount}</p>
            <p>Tổng giá đã giảm: <fmt:formatNumber value="${sessionScope.totalPrice}" type="number"/>₫</p>
            <p>Phí vận chuyển: <fmt:formatNumber value="${sessionScope.totalShippingFee}" type="number"/> ₫</p>
            <p>Tổng giá: <fmt:formatNumber value="${sessionScope.totalFinalPrice}" type="number"/>₫</p>
            <p>Địa chỉ giao: ${shipping_address.address}</p>
            <p>Email: ${shipping_address.email}</p>
            <p>Tên người nhận: ${shipping_address.name}</p>
            <p>Số điện thoại: ${shipping_address.phoneNumber}</p>
            <p>Ghi chú: ${shipping_address.note}</p>

            <!-- CAPTCHA -->
            <div class="captcha-container">
                <p class ="title">Nhập mã xác nhận:</p>
                <div class="captcha-box">
                    <img src="generateCaptcha" alt="Captcha Image">
                    <input type="text" name="captcha" required placeholder="Nhập mã captcha">
                </div>
                <!-- Thông báo lỗi nếu CAPTCHA sai -->
                <c:if test="${not empty captchaError}">
                    <p class="error-message">${captchaError}</p>
                </c:if>
            </div>

            <div class="but">
                <input type="hidden" name="shippingAddress" value="${shipping_address.address}"/>
                <input type="hidden" name="hidden_email" value="${shipping_address.email}">
                <input type="hidden" name="hidden_name" value="${shipping_address.name}">
                <input type="hidden" name="hidden_phoneNumber" value="${shipping_address.phoneNumber}">
                <input type="hidden" name="hidden_note" value="${shipping_address.note}">
                <input type="hidden" name="amount" value="${sessionScope.totalFinalPrice}"/>
                <button type="submit">Xác nhận đơn hàng</button>
                <button type="button"><a href="confirmation" style="text-decoration: none; color: #FFFFFF">Hủy</a>
                </button>
            </div>
        </form>
    </div>
</c:if>
<!-- Form thanh toán COD -->
<c:if test="${showModalCOD}">
    <div id="codForm" class="modal">
        <p class="title">Thanh toán khi nhận hàng (COD)</p>
        <form action="payCOD" method="post">
            <table border="1">
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                </tr>
                <c:forEach var="cartitem" items="${itemCart}">
                    <tr>
                        <td>${cartitem.name}</td>
                        <td>${cartitem.quantity}</td>
                        <td><fmt:formatNumber value="${cartitem.totalPrice}" type="number"/> đ</td>
                    </tr>

                    <!-- Input hidden để giữ lại thông tin của mỗi sản phẩm -->
                    <input type="hidden" name="cartItemName" value="${cartitem.name}">
                    <input type="hidden" name="cartItemQuantity" value="${cartitem.quantity}">
                    <input type="hidden" name="cartItemTotalPrice" value="${cartitem.totalPrice}">

                </c:forEach>

            </table>
            <p>Số lượng: ${sessionScope.cartItemCount}</p>
            <p>Giá giảm : ${sessionScope.totalDiscount}</p>
            <p>Tổng giá : <fmt:formatNumber value="${sessionScope.totalPrice}" type="number"/> ₫ </p>
            <p>Phí vận chuyển: <fmt:formatNumber value="${sessionScope.totalShippingFee}" type="number"/> ₫</p>
            <p>Tổng giá đã giảm <fmt:formatNumber value="${sessionScope.totalFinalPrice}" type="number"/>₫</p>
            <p>Địa chỉ giao: ${shipping_address.address}</p>
            <p>Email: ${shipping_address.email}</p>
            <p>Tên người nhận: ${shipping_address.name}</p>
            <p>Số điện thoại: ${shipping_address.phoneNumber}</p>
            <p>Ghi chú: ${shipping_address.note}</p>

            <!-- CAPTCHA -->
            <div class="captcha-container">
                <p class ="title">Nhập mã xác nhận:</p>
                <div class="captcha-box">
                    <img src="generateCaptcha" alt="Captcha Image">
                    <input type="text" name="captcha" required placeholder="Nhập mã captcha">
                </div>
                <!-- Thông báo lỗi nếu CAPTCHA sai -->
                <c:if test="${not empty captchaError}">
                    <p class="error-message">${captchaError}</p>
                </c:if>
            </div>

            <div class="but">
                <!-- Thêm các input hidden để gửi thông tin từ session -->
                <input type="hidden" name="shipping_address" value="${shipping_address.address}">
                <input type="hidden" name="hidden_email" value="${shipping_address.email}">
                <input type="hidden" name="hidden_name" value="${shipping_address.name}">
                <input type="hidden" name="hidden_phoneNumber" value="${shipping_address.phoneNumber}">
                <input type="hidden" name="hidden_note" value="${shipping_address.note}">

                <button type="submit">Xác nhận đơn hàng</button>
                <button type="button"><a href="confirmation" style="text-decoration: none; color: #FFFFFF">Hủy</a>
                </button>
            </div>
        </form>
    </div>
</c:if>

<script src="<c:url value="/users/js/comfirmation.js"/>"></script>
<script src="<c:url value="/users/js/scripts.js"/>" defer></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/users/js/search.js"/>"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra nếu cần hiển thị modal
        const showModalCOD = "${showModalCOD}" === "true";
        const showModalVNPAY = "${showModalVNPAY}" === "true";
        const overlay = document.getElementById("overlay");

        if (showModalCOD) {
            const modal = document.getElementById('codForm');
            modal.style.display = 'block';
            overlay.style.display = 'block';
        }
        if (showModalVNPAY) {
            const modal = document.getElementById('vnpayForm');
            modal.style.display = 'block';
            overlay.style.display = 'block';
        }
    });
</script>
</body>
</html>