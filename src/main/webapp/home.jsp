<%@ page import="hcmuaf.nlu.edu.vn.model.Banner" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vật Liệu Xây Dựng TQH </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4-beta3/css/all.min.css"/>
    <link rel="stylesheet" href="<c:url value="/users/css/home.css"/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    .slide-discount {
        width: 27%;
        margin: auto;
        margin-top: 5%;
        padding: 10px;
        background: linear-gradient(to right, #5a3b3b, #1b334d);
        border-radius: 16px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    }

    .swiper {
        width: 100%;
        height: auto;
    }

    .swiper-slide {
        background-color: transparent;
        text-align: center;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .discount-item {
        background: #f8f1e9;
        color: #a83232;
        padding: 15px;
        margin: 5px;
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        width: 90%;
        max-width: 300px;
    }

    .discount-item:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        background: #ffffff;
    }

    .discount-label {
        font-size: 18px;
        margin-bottom: 6px;
        text-transform: uppercase;
        font-weight: bold;
        color: #2e4a6b;
    }

    .discount-description {
        font-size: 16px;
        color: #a83232;
    }

    .swiper-button-next,
    .swiper-button-prev {
        background-color: #3b4a5e;
        border-radius: 50%;
        padding: 6px;
        width: 40px;
        height: 40px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .swiper-button-next:hover,
    .swiper-button-prev:hover {
        background-color: #4f6a8c;
        transform: scale(1.1);
    }

    .swiper-button-next::after,
    .swiper-button-prev::after {
        color: #f8f1e9;
        font-size: 20px;
    }

    .swiper-pagination-bullet {
        background-color: #f8f1e9 !important;
        opacity: 0.8;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .swiper-pagination-bullet:hover {
        background-color: #d9c8b4 !important;
        transform: scale(1.2);
    }

    .swiper-pagination-bullet-active {
        background-color: #a83232 !important;
        width: 12px;
        height: 12px;
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
                    <a href="home-page"><img src="users/img/logo.png" alt="Logo"></a>
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
                <li class="propClone"><a href="home-page"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; TRANG CHỦ </a>
                </li>
                <li class="propClone"><a href="turn-page-noLogin?action=product"><i
                        class="fa-brands fa-product-hunt"></i>
                    &nbsp;&nbsp;SẢN PHẨM</a>
                </li>
                <li class="propClone"><a id="" href="turn-page?action=cart"><i
                        class="fas fa-shopping-cart"></i>&nbsp;&nbsp; GIỎ
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
<div id="section-slider">
    <div class="slide-show-content-container">
        <p class="title-w" id="animatedText">Xây dựng nền móng vững chắc - Khởi tạo những công trình bền vững cùng
            bạn!</p>
        <div class="slide-show-content-image" id="slider-container">
            <div id="slider-wrapper"></div>
        </div>
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
                <span style="color:red; font-weight: bold; display: none" >(Cache: ${cacheStatus})</span>
                <span><a class="highlight-text" href="turn-page-noLogin?action=product">Xem thêm</a></span>
            </div>
        </div>
        <div class="product-one-content-items">
            <c:forEach var="product" items="${products}" begin="0" end="7">
                <div class="product-one-content-item">
                    <div class="img-product">
                        <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                src="${product.imageUrl}"
                                alt="${product.name}"></a>
                        <span class="sale-box">${product.discountPercent}%</span>
                    </div>
                    <div class="product-title">
                        <div class="name-product"><a
                                href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                        </div>
                        <div class="product-price">
                            <li><fmt:formatNumber value="${product.discountPrice}" type="number"
                                                  groupingUsed="true"/>₫
                            </li>
                            <li><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>₫</li>
                            <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                Thêm vào giỏ hàng
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- SẢN PHẨM BÁN CHẠY -->
    <div class="selling-products-container">
        <div class="slide-discount">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <c:forEach var="promotional" items="${sessionScope.promotionals}" varStatus="status">
                        <c:if test="${status.index % 4 == 0}">
                            <div class="swiper-slide">
                        </c:if>
                        <div class="discount-item">
                            <div class="discount-label">
                                Giảm giá: <fmt:formatNumber value="${promotional.value}" type="number"
                                                            groupingUsed="true"/>₫
                            </div>
                            <div class="discount-description">
                                Mã: ${promotional.code}
                            </div>
                        </div>

                        <c:if test="${(status.index + 1) % 4 == 0 || status.last}">
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>

                <!-- Add Navigation -->
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </div>
        <div class="selling-products-content">
            <h4><i class="fa-regular fa-gem" style="color: #f8f9fc;"></i>TOP SẢN PHẨM BÁN CHẠY</h4>
            <div class="content-products">
                <c:forEach var="product" items="${productPopular}" begin="0" end="3">
                    <div class="content-product">
                        <div class="img-product">
                            <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                    src="${product.imageUrl}"
                                    alt="${product.name}"></a>
                        </div>
                        <div class="nameProduct-price">
                            <li>
                                <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                            </li>
                            <li>Giá: <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>₫
                            </li>
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
                <span><a class="highlight-text" href="/tqh/turn-page-noLogin?action=product&categoryId=1">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-one-content-container">
            <div class="slider-product-one-content-items-content">
                <div class="slider-product-one-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 1}">
                            <div class="slider-product-one-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-one-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 1}">
                            <div class="slider-product-one-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-one-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 1}">
                            <div class="slider-product-one-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-one-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 1}">
                            <div class="slider-product-one-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
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
                <span><a class="highlight-text" href="/tqh/turn-page-noLogin?action=product&categoryId=2">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-two-content-container">
            <div class="slider-product-two-content-items-content">
                <div class="slider-product-two-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 2}">
                            <div class="slider-product-two-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-two-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 2}">
                            <div class="slider-product-two-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-two-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 2}">
                            <div class="slider-product-two-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-two-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 2}">
                            <div class="slider-product-two-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
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
                <span><a class="highlight-text" href="/tqh/turn-page-noLogin?action=product&categoryId=3">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-three-content-container">
            <div class="slider-product-three-content-items-content">
                <div class="slider-product-three-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 3}">
                            <div class="slider-product-three-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-three-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 3}">
                            <div class="slider-product-three-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-three-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 3}">
                            <div class="slider-product-three-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-three-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 3}">
                            <div class="slider-product-three-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
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
                <span><a href="/tqh/turn-page-noLogin?action=product&categoryId=4" class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-four-content-container">
            <div class="slider-product-four-content-items-content">
                <div class="slider-product-four-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 4}">
                            <div class="slider-product-four-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-four-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 4}">
                            <div class="slider-product-four-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-four-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 4}">
                            <div class="slider-product-four-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-four-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 4}">
                            <div class="slider-product-four-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
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
                <span><a href="/tqh/turn-page-noLogin?action=product&categoryId=5" class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-five-content-container">
            <div class="slider-product-five-content-items-content">
                <div class="slider-product-five-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 5}">
                            <div class="slider-product-five-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-five-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 5}">
                            <div class="slider-product-five-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-five-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 5}">
                            <div class="slider-product-five-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-five-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 5}">
                            <div class="slider-product-five-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
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
                <span><a href="/tqh/turn-page-noLogin?action=product&categoryId=6" class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-six-content-container">
            <div class="slider-product-six-content-items-content">
                <div class="slider-product-six-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 6}">
                            <div class="slider-product-six-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-six-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 6}">
                            <div class="slider-product-six-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-six-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 6}">
                            <div class="slider-product-six-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-six-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 6}">
                            <div class="slider-product-six-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
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
                <span><a href="/tqh/turn-page-noLogin?action=product&categoryId=7" class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-seven-content-container">
            <div class="slider-product-seven-content-items-content">
                <div class="slider-product-seven-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 7}">
                            <div class="slider-product-seven-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}g</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-seven-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 7}">
                            <div class="slider-product-seven-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}g</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-seven-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 7}">
                            <div class="slider-product-seven-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}g</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-seven-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 7}">
                            <div class="slider-product-seven-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}g</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
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
                <span><a href="/tqh/turn-page-noLogin?action=product&categoryId=8"
                         class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-eight-content-container">
            <div class="slider-product-eight-content-items-content">
                <div class="slider-product-eight-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 8}">
                            <div class="slider-product-eight-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-eight-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 8}">
                            <div class="slider-product-eight-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-eight-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 8}">
                            <div class="slider-product-eight-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-eight-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 8}">
                            <div class="slider-product-eight-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
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
                <span><a href="/tqh/turn-page-noLogin?action=product&categoryId=9"
                         class="highlight-text">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-nine-content-container">
            <div class="slider-product-nine-content-items-content">
                <div class="slider-product-nine-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 9}">
                            <div class="slider-product-nine-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-nine-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 9}">
                            <div class="slider-product-nine-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-nine-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 9}">
                            <div class="slider-product-nine-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-nine-content-items">
                    <c:forEach var="product" items="${productsCategory}">
                        <c:if test="${product.categoryId == 9}">
                            <div class="slider-product-nine-content-item">
                                <div class="img-product">
                                    <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                            src="${product.imageUrl}"
                                            alt="${product.name}"></a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product"><a
                                            href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                                    </div>
                                    <div class="product-price">
                                        <li><fmt:formatNumber value="${product.price}" type="number"
                                                              groupingUsed="true"/>₫
                                        </li>
                                        <button type="button" onclick="addCart(${product.id})" class="add-to-cart" data-id="${product.id}">
                                            Thêm vào giỏ hàng
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
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
<div class="popup-banner" id="popupBanner" style="display: none;">
    <div class="popup-content">
        <div class="banner-item" style="display: block;">
            <a href="turn-page-noLogin?action=product">
                <img class="banner-image" id="popupBannerImage" src="">
            </a>
        </div>
        <!-- Nút đóng -->
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
                <li><a href="turn-page-noLogin?action=introduce">Giới thiệu</a></li>
                <li><a href="turn-page-noLogin?action=termAndService">Điều khoản và dịch vụ</a></li>
            </ul>
        </div>
        <div class="social-media">
            <h3>Mạng xã hội</h3>
            <ul>
                <li><a href="https://www.facebook.com/profile.php?id=100044411504061"><i
                        class="fa-brands fa-facebook" style="color: #d1d1d1; padding: 15px"></i></a></li>
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
<script src="users/js/scripts.js"></script>
<script src="users/js/search.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let popupBanner = document.getElementById("popupBanner");

        // Mở popup banner
        function openPopup() {
            popupBanner.style.display = "flex";
        }

        // Đóng popup banner
        function closePopup() {
            popupBanner.style.display = "none";
        }

        // Mở popup khi trang tải xong
        window.onload = function () {
            openPopup();
        };

        // Đóng popup khi nhấn nút đóng
        document.querySelector(".closee-button").addEventListener("click", closePopup);
    });
</script>
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script>
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1, // Mỗi slide chỉ chứa 1 nhóm 4 mã giảm giá
        spaceBetween: 10,
        loop: true,
        autoplay: {
            delay: 3000, // Tự động trượt sau 3 giây
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });
</script>
<script>
    <!-- DEBUG INFO - chỉ thấy khi mở Inspect -->
    console.log("Cache Status: ${cacheStatus}");
    console.log("Cache Last Updated: ${lastUpdated} ➡" + new Date(${lastUpdated}));
    console.log(" Current Time: ${currentTime} " + new Date(${currentTime}));
    console.log("Cache Expired After: ${elapsedMinutes} minutes");
</script>
</body>
</html>