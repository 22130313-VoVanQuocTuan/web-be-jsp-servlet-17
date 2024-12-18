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
<link rel="stylesheet" href="../css/home.css">
<link rel="stylesheet" href="../css/product.css">
<link rel="stylesheet" href="users/css/home.css">
<link rel="stylesheet" href="users/css/product.css">

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
                    <span id="user-greeting" style="display: none; color: #ffffff;">Xin chào, <span
                            id="username"></span>!</span>
                    <a href="../informationCustomer.jsp" class="account-link" id="signup-link" style="display: none;">
                        <i class="fas fa-user-circle"></i> Tài khoản
                    </a>
                    <a href="../login-signup.jsp" id="login-link"><span><i class="fa fa-fw fa-user"></i> Đăng
                            Nhập</span></a>
                    <a href="../login-signup.jsp" id="logout-link" style="display: none;"><span>Đăng Xuất</span></a>
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
                        <a href="/tqh/home-page"><img src="users/img/logo.png" alt="Logo"></a>
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
                            <a href="../cart.jsp">
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
    <div class="conten">
        <div class="left-sidebar">
            <div class="danhmuc"><i class="fa-solid fa-list" style="color: #000000; margin-right: 10px;"></i>Danh mục
            </div>
            <div class="item" data-category="gach-xay-dung">
                <h3><a href="/tqh/product-category?categoryId=1"></i>Gạch xây dựng</a></h3>
            </div>
            <div class="item" data-category="xi-mang-va-vua">
                <h3><a href="/tqh/product-category?categoryId=2">Xi măng và Vữa</a></h3>
            </div>
            <div class="item" data-category="cat-da-va-soi">
                <h3><a href="/tqh/product-category?categoryId=3">Cát, Đá và Sỏi</a></h3>
            </div>
            <div class="item" data-category="thep-va-sat">
                <h3><a href="/tqh/product-category?categoryId=4">Thép và Sắt</a></h3>
            </div>
            <div class="item" data-category="go-va-vat-lieu-go">
                <h3><a href=/tqh/product-category?categoryId=5">Gỗ và Vật liệu gỗ</a></h3>
            </div>
            <div class="item" data-category="son-va-phu-gia">
                <h3><a href="/tqh/product-category?categoryId=6">Sơn và Phụ gia</a></h3>
            </div>
            <div class="item" data-category="ngoi-va-tam-lop">
                <h3><a href="/tqh/product-category?categoryId=7">Ngói và Tấm lợp</a></h3>
            </div>
            <div class="item" data-category="ong-nuoc-va-phu-kien">
                <h3><a href="/tqh/product-category?categoryId=8">Ống nước và Phụ kiện</a></h3>
            </div>
            <div class="item" data-category="thiet-bi-dien-nuoc">
                <h3><a href="/tqh/product-category?categoryId=9">Thiết bị điện nước</a></h3>
            </div>
        </div>

        <!--conten_right-->
        <div class="right">
            <div class="filter">
                <p style=" background-color: #c8c8c8; padding: 10px; border-radius: 5px;font-size: 15px; height: 15px;">Sắp xếp theo
                    <i class="fa-sharp fa-solid fa-arrow-right" style="margin-left: 15px;"></i>
                </p>
                <p class="sort">Phổ biến</p>
                <p class="sort">Mới nhất</p>
                <div class=" sort-price">
                    <p class="sort" style="width: auto;">Bán chạy <i class="fa-solid fa-angle-up fa-rotate-180"
                        style="color: #000000;"></i></p>
                    <div class="dropdown">
                        <ul class="dropdown-content">
                            <li>Giá: Thấp đến cao</li>
                            <li>Giá: Cao đến thấp</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row ps-5" id="product-list">
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.jsp"><img
                            src="/src/Users/img_product/ngoi/NGÓI BITUM CANA ĐỒNG PHẲNG.png" alt="Ngói và tấm lợp"></a>
                    <h3>Ngói BITUM CANA Đồng Phẳng</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:200</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.jsp"><img src="/src/Users/img_product/ngoi/Ngói nóc.png"
                                                         alt="Ngói và tấm lợp"></a>
                    <h3>Ngói Nóc</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ngoi/Ngói Thái SCG dạng sóng M16.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>Ngói Thái SCG dạng sóng M16</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="../product-detail.jsp"><img
                            src="/src/Users/img_product/ngoi/Tấm Cemboard Ốp Trần Vân Gỗ Smartboard Có Rãnh.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>Tấm Cemboard Ốp Trần Vân Gỗ Smartboard Có Rãnh</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="../product-detail.jsp"><img
                            src="/src/Users/img_product/ngoi/Tôn Sáng Sóng Vuông Polycacbonate Tấm.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>Tôn Sáng Sóng Vuông Polycacbonate</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.jsp"><img
                            src="/src/Users/img_product/ngoi/Ngói Thái SCG Elite Series Dạng Sóng Gold.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>Ngói Thái SCG Elite Series Dạng Sóng Gold</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href=""><img
                            src="/src/Users/img_product/ngoi/Ngói Thái SCG Elite Series Dạng Sóng Classic-Xám.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>Ngói Thái SCG Elite Series Dạng Sóng Classic-Xám</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ngoi/Ngói Thái SCG Elite Series Dạng Sóng Classic-Nâu.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>Ngói Thái SCG Elite Series Dạng Sóng Classic-Nâu</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ngoi/Ngói Thái SCG Elite Series Dạng Sóng Classic-Nâu Socola.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>Ngói Thái SCG Elite Series Dạng Sóng Classic-Nâu Socola</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ngoi/NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ngoi/NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý-Đấ tầng.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý-Đá tầng</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ngoi/NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý – DẠNG VẢY CÁ.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý – DẠNG VẢY CÁ</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ngoi/NgoiThaiSCGDangPhang.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>Ngói Thái SCG Dạng Thẳng</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ngoi/Ngói chạc ba chữ Y.png" alt="Ngói và tấm lợp"></a>
                    <h3>Ngói chạc ba chữ Y</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ngoi/Ngói cuối nóc.png" alt="Ngói và tấm lợp"></a>
                    <h3>Ngói cuối nóc</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p> <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ngoi/Ngói cuối rìa.png" alt="Ngói và tấm lợp"></a>
                    <h3>Ngói cuối rìa</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ngoi/NGÓI BITUM PHỦ ĐÁ DẠNG TỔ ONG – MÀU XANH RÊU.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>NGÓI BITUM PHỦ ĐÁ DẠNG TỔ ONG – MÀU XANH RÊU</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ngoi/NGÓI BITUM PHỦ ĐÁ DẠNG VẢY RỒNG – MÀU XANH DƯƠNG.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>NGÓI BITUM PHỦ ĐÁ DẠNG VẢY RỒNG – MÀU XANH DƯƠNG</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ngoi/NGÓI BITUM PHỦ ĐÁ DẠNG ĐỒNG PHẲNG – MÀU XÁM.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>NGÓI BITUM PHỦ ĐÁ DẠNG ĐỒNG PHẲNG – MÀU XÁM</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ngoi/Tấm Lợp Lấy Sáng Polycarbonate Đặc Ruột.png"
                            alt="Ngói và tấm lợp"></a>
                    <h3>Tấm Lợp Lấy Sáng Polycarbonate Đặc Ruột</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>


            </div>

            <!--pagination-->
            <div id="pagination" class="pagination">
                <button id="prev" onclick="changePage(-1)">
                    << </button>
                        <span id="page-info"></span>
                        <button id="next" onclick="changePage(1)">>></button>
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
                    <li><a href="../introduce.jsp">Giới thiệu</a></li>
                    <li><a href="../term_and_services.jsp">Điều khoản và dịch vụ</a></li>
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

    <script src="${pageContext.request.contextPath}/users/js/login-signup.js"></script>
    <script src="${pageContext.request.contextPath}/users/js/product.js"></script>
    <script src="${pageContext.request.contextPath}/users/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/users/js/home.js"></script>

</body>

</html>