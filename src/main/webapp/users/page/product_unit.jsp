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
<style>
    th {
        background: linear-gradient(to right, #891f1f, #15283e);
        color: #ffffff;
    }
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link rel="stylesheet" href="<c:url value="/users/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/users/css/product_unit.css"/>">
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

                        <form action="informationCustomer" method="post">
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
                            <span class="cart-count" id="cart-count">0</span>
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
                        <li class="propClone"><a href="home-page"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; TRANG CHỦ
                        </a></li>
                        <li class="propClone"><a href="product"><i class="fa-brands fa-product-hunt"></i>
                            &nbsp;&nbsp;SẢN PHẨM</a>
                        </li>
                        <li class="propClone"> <a href="cart-items"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp; GIỎ
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

    <div id="section-content-2">
        <table border="1" cellpadding="10" cellspacing="0" style="width: 83%;margin-left: auto;
                         margin-right: auto; text-align: left; border-collapse: collapse;">
            <thead>
                <tr>
                    <th>Danh Mục Sản Phẩm</th>
                    <th>Đơn Vị</th>
                    <th>Gợi Ý Sử Dụng</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Gạch Xây Dựng</td>
                    <td>Viên</td>
                    <td>Dùng cho xây tường, nền, móng, và các công trình kiến trúc khác.</td>
                </tr>
                <tr>
                    <td>Xi Măng và Vữa</td>
                    <td>Bao (50 kg hoặc 40 kg)</td>
                    <td>Được trộn với cát và đá để tạo độ kết dính trong xây dựng.</td>
                </tr>
                <tr>
                    <td>Cát, Đá và Sỏi</td>
                    <td>Khối (m³)</td>
                    <td>Dùng trong bê tông và xây móng.</td>
                </tr>
                <tr>
                    <td>Thép và Sắt</td>
                    <td>Cây (thanh)</td>
                    <td>Làm cốt thép cho bê tông hoặc các khung nhà.</td>
                </tr>
                <tr>
                    <td>Gỗ và Vật Liệu Gỗ</td>
                    <td> m² (mét vuông)</td>
                    <td>Dùng trong sàn nhà, trần nhà, cửa và khung gỗ.</td>
                </tr>
                <tr>
                    <td>Sơn và Phụ Gia</td>
                    <td>Lít hoặc thùng (5 lít, 18 lít)</td>
                    <td>Bảo vệ và trang trí bề mặt công trình.</td>
                </tr>
                <tr>
                    <td>Ngói và Tấm Lợp</td>
                    <td>Viên</td>
                    <td>Lợp mái nhà, bảo vệ công trình khỏi thời tiết.</td>
                </tr>
                <tr>
                    <td>Ống Nước và Phụ Kiện</td>
                    <td>Cái</td>
                    <td>Sử dụng trong hệ thống cấp thoát nước.</td>
                </tr>
                <tr>
                    <td>Thiết Bị Điện Nước</td>
                    <td>Cái, bộ</td>
                    <td>Gồm ổ cắm, công tắc, vòi nước, van khóa.</td>
                </tr>
            </tbody>
        </table>

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
            <li style="list-style-type: none;"><a href="https://www.instagram.com/paq.2012/" target="_blank" rel="noopener"><i
                        class="fab fa-instagram icon" style="color: #f12020;"></i></a></li>
        </div>
        <div id="fb">
            <li style="list-style-type: none;"><a href="https://www.facebook.com/profile.php?id=100044411504061"
                    target="_blank" rel="noopener"><i class="fa-brands fa-facebook-square icon" style="color: #0911ff;"></i></a></li>
        </div>
        <button id="backToTop" title="Quay về đầu trang">⬆</button>

    </div>
    <script src="<c:url value="/users/js/scripts.js"/>" defer></script>
    <script src="<c:url value="/users/js/login-signup.js"/>"></script>
</body>

</html>