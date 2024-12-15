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
<link rel="stylesheet" href="users/css/home.css">

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
                    <a href="home.jsp"><img src="users/img/logo.png" alt="Logo"></a>
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
                        <span class="none-a"><i class="fa-solid fa-list" style="color: #d0cdcd;"></i> &nbsp;&nbsp; DANH
                            MỤC SẢN
                            PHẨM</span>
                    <ul class="items">
                        <li><a href="users/page/product/gach-xay-dung.jsp">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;GẠCH XÂY
                            DỰNG</a></li>
                        <li><a href="users/page/product/xi-mang-va-vua.jsp">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;XI MĂNG VÀ
                            VỮA</a></li>
                        <li><a href="src/Users/page/product/cat-da-va-soi.html">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;CÁT, ĐÁ VÀ
                            SỎI</a></li>
                        <li><a href="src/Users/page/product/thep-va-sat.html">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;THÉP VÀ
                            SẮT</a></li>
                        <li><a href="src/Users/page/product/go-va-vat-lieu-go.html">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;GỖ VÀ VẬT
                            LIỆU GỖ</a></li>
                        <li><a href="src/Users/page/product/son-va-phu-gia.html">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;SƠN VÀ PHỤ
                            GIA</a></li>
                        <li><a href="src/Users/page/product/ngoi-va-tam-lop.html">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;NGÓI VÀ TẤM
                            LỢP</a></li>
                        <li><a href="src/Users/page/product/ong-nuoc-va-phu-kien.html">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;ỐNG NƯỚC VÀ
                            PHỤ KIỆN</a></li>
                        <li><a href="src/Users/page/product/thiet-bi-dien-nuoc.html">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;THIẾT BỊ
                            ĐIỆN NƯỚC</a></li>
                    </ul>
                </li>
                <li class="propClone"><a href="#"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; TRANG CHỦ </a></li>
                <li class="propClone"><a href="home-page"><i class="fa-brands fa-product-hunt"></i>
                    &nbsp;&nbsp;SẢN PHẨM</a>
                </li>
                <li class="propClone"><a id="" href="cart-items"><i
                        class="fas fa-shopping-cart"></i>&nbsp;&nbsp; GIỎ
                    HÀNG</a>
                </li>
                <li class="propClone">
                    <span class="none-a"> <i class="fa-solid fa-book"></i> &nbsp;&nbsp; HƯỚNG DẪN </span>
                    <ul class="items">
                        <li><a href="users/page/buying-help.jsp">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp; HƯỚNG DẪN
                            MUA HÀNG</a>
                        </li>
                        <li><a href="users/page/product_unit.jsp">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;BẢNG ĐƠN VỊ SẢN PHẨM</a>
                        </li>
                        <li><a href="users/page/term_and_services.jsp">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;ĐIỀU KHOẢN
                            VÀ DỊCH VỤ</a>
                        </li>
                    </ul>
                </li>

            </ul>

        </div>
    </div>
</div>

<div id="section-slider">
    <div class="slide-show-content-container">
        <p class="title-w" id="animatedText">Xây dựng nền móng vững chắc - Khởi tạo những công trình bền vững cùng
            bạn!</p>
        <div class="slide-show-content-image">

            <img src="<c:url value="/users/img/slider1.png"/>" alt="baner">
            <img src="<c:url value="/users/img/slider2.png"/>" alt="baner">
            <img src="<c:url value="/users/img/slider3.png"/>" alt="baner">
            <img src="<c:url value="/users/img/slider4.png"/>" alt="baner">
            <img src="<c:url value="/users/img/slider5.png"/>" alt="baner">
            <img src="<c:url value="/users/img/slider6.png"/>" alt="baner">
        </div>
        .
        <div class="slide-show-content-btn">
            <div class="nut_trai">
                <i class="fa-solid fa-chevron-left"></i>
            </div>
            <div class="nut_phai">
                <i class="fa-solid fa-chevron-right"></i>
            </div>
        </div>
    </div>
</div>
<div id="section-content">
    <!-- List Product flash sales -->
    <div class="product-one-content">
        <div class="product-one-content-title">
            <div class="title">
                <h3>Flash Sale !!</h3>
                <span><a class="highlight-text" href="users/page/product.jsp">Xem thêm</a></span>
            </div>
        </div>
        <div class="product-one-content-items">
            <c:forEach var="product" items="${products}">
                <div class="product-one-content-item">
                    <div class="img-product">
                        <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}"><img
                                src="${product.imageUrl}"
                                alt="${product.name}"></a>
                        <span class="sale-box">${product.discountPercent}%</span>
                    </div>
                    <div class="product-title">
                        <div class="name-product"><a href="users/page/product-detail.jsp">${product.name}</a></div>
                        <div class="product-price">
                            <li><fmt:formatNumber value="${product.discountPrice}" type="number" groupingUsed="true" />₫</li>
                            <li><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />₫</li>
                            <a href="add-cart?id=${product.id}" class="add-to-cart">Thêm vào giỏ hàng</a>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
    <!-- SẢN PHẨM BÁN CHẠY -->
    <div class="selling-products-container">
        <div class="imgSale">
            <img src="src/Users/img_product/inax-khuyen-mai-mua-dong.png" alt="">
        </div>
        <div class="selling-products-content">
            <h4><i class="fa-regular fa-gem" style="color: #f8f9fc;"></i>TOP SẢN PHẨM BÁN CHẠY</h4>
            <div class="content-products">
                <c:forEach var="productSelling" items="product-selling">
                <div class="content-product">
                    <div class="img-product"><img src="src/Users/img_product/gachxaydung/gachmen.png" alt="Sản phẩm 1">
                    </div>
                    <div class="nameProduct-price">
                        <li><a href="">Gạch Men 60x60 cm</a></li>
                        <li>Giá: 340.000đ</li>
                    </div>
                </div>
                </c:forEach>

            </div>
        </div>
    </div>
    <!-- List Slider Products 1 -->
    <div class="slider-product-one-content">
        <div class="slider-product-one-content-title">
            <div class="title">
                <h3>Gạch Xây Dựng</h3>
                <span><a class="highlight-text" href="src/Users/page/product/gach-xay-dung.html">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-one-content-container">
            <div class="slider-product-one-content-items-content">
                <div class="slider-product-one-content-items">
                    <div class="slider-product-one-content-item">
                        <div class="img-product">
                            <a href="src/Users/page/product-detail.html"> <img
                                    src="src/Users/img_product/gachxaydung/gach-xay-tuong.png" alt=""></a>
                        </div>
                        <div class="product-title">
                            <div class="name-product"><a href="">Gạch xây tường</a></div>
                            <div class="product-price">
                                <li>150.000₫</li>
                                <button class="add-to-cart">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="slider-product-one-content-btn">
                <div class="nut_trai-1">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-1">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>
    <!-- List Slider Products 2 -->
    <div class="slider-product-two-content">
        <div class="slider-product-two-content-title">
            <div class="title">
                <h3>Xi Măng Và Vữa</h3>
                <span><a class="highlight-text" href="src/Users/page/product/xi-mang-va-vua.html">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-two-content-container">
            <div class="slider-product-two-content-items-content">
                <div class="slider-product-two-content-items">
                    <div class="slider-product-two-content-item">
                        <div class="img-product">
                            <a href="src/Users/page/product-detail.html"> <img
                                    src="/src/Users/img_product/xingmang/image1.png" alt=""></a>
                        </div>
                        <div class="product-title">
                            <div class="name-product"><a href="">Xi măng SCG-PC40-ELE</a></div>
                            <div class="product-price">
                                <li>290.000₫</li>
                                <button class="add-to-cart">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="slider-product-two-content-btn">
                <div class="nut_trai-2">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-2">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>
    <!-- List Slider Products 3 -->
    <div class="slider-product-three-content">
        <div class="slider-product-three-content-title">
            <div class="title">
                <h3>Cát,Đá Và Sỏi</h3>
                <span><a class="highlight-text" href="src/Users/page/product/cat-da-va-soi.html">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-three-content-container">
            <div class="slider-product-three-content-items-content">
                <div class="slider-product-three-content-items">
                    <div class="slider-product-three-content-item">
                        <div class="img-product">
                            <a href="src/Users/page/product-detail.html"> <img
                                    src="/src/Users/img_product/Da_cat_soi/catbetong.png" alt=""></a>
                        </div>
                        <div class="product-title">
                            <div class="name-product"><a href="">Cát bê tông</a></div>
                            <div class="product-price">
                                <li>200.000₫</li>
                                <button class="add-to-cart">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="slider-product-three-content-btn">
                <div class="nut_trai-3">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-3">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>


    <!--List Slider product 4-->
    <div class="slider-product-four-content">
        <div class="slider-product-four-content-title">
            <div class="title">
                <h3>Thép và Sắt</h3>
                <span><a href="src/Users/page/product/thep-va-sat.html" class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-four-content-container">
            <div class="slider-product-four-content-items-content">
                <div class="slider-product-four-content-items">
                    <div class="slider-product-four-content-item">
                        <div class="img-product">
                            <a href="src/Users/page/product-detail.html"> <img
                                    src="src/Users/img_product/thepvasat/image1.png" alt=""></a>
                        </div>
                        <div class="product-title">
                            <div class="name-product"><a href="src/Users/page/product-detail.html">Thép cốt bê tông</a>
                            </div>
                            <div class="product-price">
                                <li>600.000đ</li>
                                <button class="add-to-cart">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="slider-product-four-content-btn">
                <div class="nut_trai-4">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-4">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>

    <!--List Slider product 5-->
    <div class="slider-product-five-content">
        <div class="slider-product-five-content-title">
            <div class="title">
                <h3>Gỗ và Vật liệu gỗ</h3>
                <span><a href="src/Users/page/product/go-va-vat-lieu-go.html" class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-five-content-container">
            <div class="slider-product-five-content-items-content">
                <div class="slider-product-five-content-items">
                    <div class="slider-product-five-content-item">
                        <div class="img-product">
                            <a href="src/Users/page/product-detail.html"><img
                                    src="src/Users/img_product/vat_lieu_go/gobachduong.png" alt=""></a>
                        </div>
                        <div class="product-title">
                            <div class="name-product"><a href="src/Users/page/product-detail.html">Gỗ bạch dương</a>
                            </div>
                            <div class="product-price">
                                <li>1.000.000đ</li>
                                <button class="add-to-cart">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
            <div class="slider-product-five-content-btn">
                <div class="nut_trai-5">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-5">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>


    <!--List Slider product 6-->
    <div class="slider-product-six-content">
        <div class="slider-product-six-content-title">
            <div class="title">
                <h3>Sơn và Phụ gia</h3>
                <span><a href="src/Users/page/product/son-va-phu-gia.html" class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-six-content-container">
            <div class="slider-product-six-content-items-content">
                <div class="slider-product-six-content-items">
                    <div class="slider-product-six-content-item">
                        <div class="img-product">
                            <a href="src/Users/page/product-detail.html"><img
                                    src="src/Users/img_product/son/Phụ%20gia%20chống%20thấm%20BS-8430%20Latex.png"
                                    alt=""></a>
                        </div>
                        <div class="product-title">
                            <div class="name-product"><a href="src/Users/page/product-detail.html">Phụ gia chống thấm
                                BS-8430
                                Latex</a></div>
                            <div class="product-price">
                                <li>890.000đ</li>
                                <button class="add-to-cart">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
            <div class="slider-product-six-content-btn">
                <div class="nut_trai-6">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-6">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>


    <!--List Slider product 7-->
    <div class="slider-product-seven-content">
        <div class="slider-product-seven-content-title">
            <div class="title">
                <h3>Ngói và Tấm lợp</h3>
                <span><a href="src/Users/page/product/ngoi-va-tam-lop.html" class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-seven-content-container">
            <div class="slider-product-seven-content-items-content">
                <div class="slider-product-seven-content-items">
                    <div class="slider-product-seven-content-item">
                        <div class="img-product">
                            <a href="src/Users/page/product-detail.html"><img
                                    src="src/Users/img_product/ngoi/NgoiThaiSCGDangPhang.png" alt=""></a>
                        </div>
                        <div class="product-title">
                            <div class="name-product"><a
                                    href="src/Users/page/product-detail.html">NgoiThaiSCGDangPhang</a></div>
                            <div class="product-price">
                                <li>300.000đ</li>
                                <button class="add-to-cart">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>



                </div>
            </div>

            <div class="slider-product-seven-content-btn">
                <div class="nut_trai-7">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-7">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>

    <!--List Slider product 8-->
    <div class="slider-product-eight-content">
        <div class="slider-product-eight-content-title">
            <div class="title">
                <h3>Ống nước và Phụ kiện</h3>
                <span><a href="src/Users/page/product/ong-nuoc-va-phu-kien.html"
                         class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-eight-content-container">
            <div class="slider-product-eight-content-items-content">
                <div class="slider-product-eight-content-items">
                    <div class="slider-product-eight-content-item">
                        <div class="img-product">
                            <a href="src/Users/page/product-detail.html"><img
                                    src="src/Users/img_product/ong-nuoc-phu-kien/Ống%20nhựa%20mềm%20lõi%20thép%20Ø50mm,%20cuộn%2050m.png"
                                    alt=""></a>
                        </div>
                        <div class="product-title">
                            <div class="name-product"><a href="src/Users/page/product-detail.html">Ống nhựa mềm lõi thép
                                Ø50mm,
                                cuộn
                                50m</a></div>
                            <div class="product-price">
                                <li>300.000đ</li>
                                <button class="add-to-cart">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>



                </div>
            </div>

            <div class="slider-product-eight-content-btn">
                <div class="nut_trai-8">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-8">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>

    <!--List Slider product 9-->
    <div class="slider-product-nine-content">
        <div class="slider-product-nine-content-title">
            <div class="title">
                <h3>Thiết bị điện nước</h3>
                <span><a href="src/Users/page/product/thiet-bi-dien-nuoc.html"
                         class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-nine-content-container">
            <div class="slider-product-nine-content-items-content">
                <div class="slider-product-nine-content-items">
                    <div class="slider-product-nine-content-item">
                        <div class="img-product">
                            <a href="src/Users/page/product-detail.html"> <img
                                    src="src/Users/img_product/thietbi-diennuoc/image1.png" alt=""></a>
                        </div>
                        <div class="product-title">
                            <div class="name-product"><a href="src/Users/page/product-detail.html">Máy bơm tăng áp A-130
                                JAK –
                                Panasonic</a></div>
                            <div class="product-price">
                                <li>600.000đ</li>
                                <button class="add-to-cart">Thêm vào giỏ hàng</button>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
            <div class="slider-product-nine-content-btn">
                <div class="nut_trai-9">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-9">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Banner -->
<div class="popup-banner" id="popupBanner" style="display: none;">
    <div class="popup-content">
        <!-- Ảnh banner -->
        <img src="users/img/baner.png" alt="Sự kiện ưu đãi" class="banner-image">

        <!-- Nội dung banner -->
        <div class="banner-details">
            <h2 class="banner-title">Sự Kiện Giảm Giá Đặc Biệt Mừng Giáng Sinh</h2>
            <p class="banner-desc">Giảm giá lên đến 50% cho các sản phẩm</p>
            <a href="users/page/product.jsp" class="banner-btn">Mua Ngay</a>
        </div>

        <!-- Nút đóng banner -->
        <div class="closee-button" onclick="closePopup()">
            <i class="fa-solid fa-x"></i>
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
                <li><a href="users/page/introduce.jsp">Giới thiệu</a></li>
                <li><a href="users/page/term_and_services.jsp">Điều khoản và dịch vụ</a></li>
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
<script src="users/js/slider_Image-home.js"></script>
<script src="users/js/slider-products.js"></script>
<script src="users/js/home.js"></script>
<script type="text/javascript" src="users/js/login-signup.js"></script>
<script src="users/js/scripts.js"></script>
<script>
    // Mở banner tự động khi trang tải xong
    window.onload = function () {
        openPopup(); // Gọi hàm mở popup
    };

    function openPopup() {
        // Hiển thị banner và ngừng cuộn trang
        document.getElementById("popupBanner").style.display = "flex";
        document.body.classList.add("no-scroll");
    }

    function closePopup() {
        // Ẩn banner và khôi phục cuộn trang
        document.getElementById("popupBanner").style.display = "none";
        document.body.classList.remove("no-scroll");
    }
</script>


</body>

</html>