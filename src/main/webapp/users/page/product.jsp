<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vật Liệu Xây Dựng TQH </title>
</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4-beta3/css/all.min.css" />
<link rel="stylesheet" href="../css/home.css">
<link rel="stylesheet" href="../css/product.css">

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
                    <span id="user-greeting" style="display: none; color: #ffffff;">Xin chào, <span id="username"></span>!</span>
                    <a href="informationCustomer.jsp" class="account-link" id="signup-link" style="display: none;">
                        <i class="fas fa-user-circle"  ></i> Tài khoản
                    </a>
                    <a href="login-signup.jsp" id="login-link"><span><i class="fa fa-fw fa-user"></i> Đăng Nhập</span></a>
                    <a href="login-signup.jsp" id="logout-link" style="display: none;"><span>Đăng Xuất</span></a>
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
                        <a href="../../home.jsp"><img src="../img/logo.png" alt="Logo"></a>
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
                            <li> <a href="product/gach-xay-dung.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;GẠCH XÂY
                                    DỰNG</a></li>
                            <li><a href="product/xi-mang-va-vua.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;XI MĂNG VÀ
                                    VỮA</a></li>
                            <li><a href="product/cat-da-va-soi.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;CÁT, ĐÁ VÀ
                                    SỎI</a></li>
                            <li><a href="product/thep-va-sat.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;THÉP VÀ
                                    SẮT</a></li>
                            <li><a href="product/go-va-vat-lieu-go.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;GỖ VÀ VẬT
                                    LIỆU GỖ</a></li>
                            <li><a href="product/son-va-phu-gia.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;SƠN VÀ PHỤ
                                    GIA</a></li>
                            <li><a href="product/ngoi-va-tam-lop.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;NGÓI VÀ TẤM
                                    LỢP</a></li>
                            <li><a href="product/ong-nuoc-va-phu-kien.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;ỐNG NƯỚC VÀ
                                    PHỤ KIỆN</a></li>
                            <li><a href="product/thiet-bi-dien-nuoc.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;THIẾT BỊ
                                    ĐIỆN NƯỚC</a></li>
                        </ul>
                    </li>
                    <li class="propClone"><a href="../../home.jsp"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; TRANG CHỦ
                        </a></li>
                    <li class="propClone"><a href="product.html"><i class="fa-brands fa-product-hunt"></i>
                            &nbsp;&nbsp;SẢN PHẨM</a>
                    </li>
                    <li class="propClone"> <a id="cartss" href="cart.jsp"><i
                        class="fas fa-shopping-cart"></i>&nbsp;&nbsp; GIỎ
                    HÀNG</a>
            </li>
                    <li class="propClone">
                        <span class="none-a"> <i class="fa-solid fa-book"></i> &nbsp;&nbsp; HƯỚNG DẪN </span>
                        <ul class="items">
                            <li><a href="buying-help.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;HƯỚNG DẪN
                                    MUA HÀNG</a>
                            </li>
                            <li><a href="product_unit.jsp">&nbsp;&nbsp;<i
                                        class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;BẢNG ĐƠN VỊ SẢN PHẨM</a>
                            </li>
                            <li><a href="term_and_services.jsp">&nbsp;&nbsp;<i
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
                <h3><a href="product/gach-xay-dung.jsp "></i>Gạch xây dựng</a></h3>
            </div>
            <div class="item" data-category="xi-mang-va-vua">
                <h3><a href="product/xi-mang-va-vua.jsp">Xi măng và Vữa</a></h3>
            </div>
            <div class="item" data-category="cat-da-va-soi">
                <h3><a href="product/cat-da-va-soi.jsp">Cát, Đá và Sỏi</a></h3>
            </div>
            <div class="item" data-category="thep-va-sat">
                <h3><a href="product/thep-va-sat.jsp">Thép và Sắt</a></h3>
            </div>
            <div class="item" data-category="go-va-vat-lieu-go">
                <h3><a href="product/go-va-vat-lieu-go.jsp">Gỗ và Vật liệu gỗ</a></h3>
            </div>
            <div class="item" data-category="son-va-phu-gia">
                <h3><a href="product/son-va-phu-gia.jsp">Sơn và Phụ gia</a></h3>
            </div>
            <div class="item" data-category="ngoi-va-tam-lop">
                <h3><a href="product/ngoi-va-tam-lop.jsp">Ngói và Tấm lợp</a></h3>
            </div>
            <div class="item" data-category="ong-nuoc-va-phu-kien">
                <h3><a href="product/ong-nuoc-va-phu-kien.jsp">Ống nước và Phụ kiện</a></h3>
            </div>
            <div class="item" data-category="thiet-bi-dien-nuoc">
                <h3><a href="product/thiet-bi-dien-nuoc.jsp">Thiết bị điện nước</a></h3>
            </div>

            <div class="slide-discount">
                <div class="discount">
                    <span class="discount-label">Giảm giá 20%</span>
                    <span class="discount-description">CNNNSDVT</span>
                </div>
                <div class="discount">
                    <span class="discount-label">Giảm giá 15%</span>
                    <span class="discount-description">HKLDCBBB</span>
                </div>
                <div class="discount">
                    <span class="discount-label">Giảm giá 10%</span>
                    <span class="discount-description">GH2DVB56</span>
                </div>
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
                            style="color: #000000; "></i></p>
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

                    <p
                        style="position: absolute; padding: 8px; background-color: #ff0000; z-index: 5; border-radius: 10px;">
                        50%</p>
                    <a href="product-detail.jsp"><img src="../img_product/Da_cat_soi/da12.png" alt="Xi măng"></a>

                    <h3>Đá 1/2</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 100.000₫</p>
                    <p>Giảm giá: 50%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>

                </div>
                <div class="name-cart">
                    <p
                        style="position: absolute; padding: 8px; background-color: #ff0000; z-index: 5; border-radius: 10px;">
                        50%</p>
                    <a href="product-detail.jsp"><img src="../img_product/Da_cat_soi/catden.png" alt="Xi măng"></a>
                    <h3>Cát đen</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 100.000₫</p>
                    <p>Giảm giá: 50%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <p
                        style="position: absolute; padding: 8px; background-color: #ff0000; z-index: 5; border-radius: 10px;">
                        50%</p>
                    <a href="product-detail.jsp"><img src="../img_product/gachxaydung/gachhiephung717.png" alt="Xi măng"></a>
                    <h3>Gạch hiệp phụng</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 100.000₫</p>
                    <p>Giảm giá: 50%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <p
                        style="position: absolute; padding: 8px; background-color: #ff0000; z-index: 5; border-radius: 10px;">
                        50%</p>
                    <a href="product-detail.jsp"><img src="../img_product/son/Sơn%20Lót%20Ngoại%20Thất%20Siêu%20Cao%20Cấp%20Dulux%20Weathershield%20Chống%20Kiềm.png" alt="Xi măng"></a>
                    <h3>Sơn Lót Dulux</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 100.000₫</p>
                    <p>Giảm giá: 50%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <p
                        style="position: absolute; padding: 8px; background-color: #ff0000; z-index: 5; border-radius: 10px;">
                        50%</p>
                    <a href="#"><img src="../img_product/thepvasat/image6.png" alt="Xi măng"></a>
                    <h3>Thép thanh dài</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 100.000₫</p>
                    <p>Giảm giá: 50%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <p
                        style="position: absolute; padding: 8px; background-color: #ff0000; z-index: 5; border-radius: 10px;">
                        50%</p>
                    <a href="#"><img src="../img_product/vat_lieu_go/image1.png" alt="Xi măng"></a>
                    <h3>Gỗ khói</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 100.000₫</p>
                    <p>Giảm giá: 50%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="../img_product/thietbi-diennuoc/image13.png" alt="Xi măng"></a>
                    <h3>Đồng hồ nước</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="../img_product/ngoi/NgoiThaiSCGDangPhang.png" alt="Xi măng"></a>
                    <h3>Ngói thái SCG</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="../img_product/thepvasat/image4.png" alt="Xi măng"></a>
                    <h3>Thép chữ U</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 190.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="../img_product/son/Sơn%20Ngoại%20Thất%20Dulux%20Inspire%20Sắc%20Màu%20Bền%20Đẹp%20Bề%20Mặt.png" alt="Xi măng"></a>
                    <h3>Sơn Dulux Inspire</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 190.000</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img src="../img_product/ngoi/Ngói%20cuối%20rìa.png" alt="Xi măng"></a>
                    <h3>Ngói H2H</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="../img_product/thietbi-diennuoc/image5.png" alt="Xi măng"></a>
                    <h3>Đồng hồ nước K2</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="../img_product/xingmang/ximangpc40.png" alt="Xi măng"></a>
                    <h3>Xi măng</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="../img_product/Da_cat_soi/catxayto.png" alt="Xi măng"></a>
                    <h3>Cát xây tô</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="../img_product/gachxaydung/gachtuynelngocchung.png" alt="Xi măng"></a>
                    <h3>Gạch Tuynel</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="../img_product/thepvasat/image7.png" alt="Xi măng"></a>
                    <h3>Thép khuôn</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="../img_product/gachxaydung/gachtuynel.png" alt="Xi măng"></a>
                    <h3>Gạch đỏ</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="../img_product/thietbi-diennuoc/image13.png" alt="Xi măng"></a>
                    <h3>Đồng hồ PETE</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="../img_product/vat_lieu_go/image8.png" alt="Xi măng"></a>
                    <h3>Gỗ đặc</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="../img_product/thietbi-diennuoc/image6.png" alt="Xi măng"></a>
                    <h3>Bình nước BBV</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: #ff0000;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="cart.jsp" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>


                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/Da_cat_soi/catbetong.png"
                            alt="Xi măng"></a>
                    <h3>Cát bê tông</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/Da_cat_soi/catden.png"
                            alt="Xi măng"></a>
                    <h3>Cát đen</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/catsanlap.png" alt="Xi măng"></a>
                    <h3>Cát san lấp</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/Da_cat_soi/catsong.png"
                            alt="Xi măng"></a>
                    <h3>Cát sông</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/Da_cat_soi/catvang.png"
                            alt="Xi măng"></a>
                    <h3>Cát vàng</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/Da_cat_soi/catxayto.png"
                            alt="Xi măng"></a>
                    <h3>Cát xây tô</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href=""><img src="/src/Users/img_product/Da_cat_soi/da12.png" alt="Đá bi"></a>
                    <h3>Đá bi</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/da24.png" alt="Xi măng"></a>
                    <h3>Đá bi lớn</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/da46.png" alt="Xi măng"></a>
                    <h3>Đá 4/6</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/da57.png" alt="Xi măng"></a>
                    <h3>Đá 5/7</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/dache.png" alt="Xi măng"></a>
                    <h3>Đá chẻ</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/dahoc.png" alt="Xi măng"></a>
                    <h3>Đá hóc</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/dacmthach.png" alt="Xi măng"></a>
                    <h3>Đá thạch</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/dahoacuong.png" alt="Xi măng"></a>
                    <h3>Đá hoa cương</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/daphien.png" alt="Xi măng"></a>
                    <h3>Đá phiến</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/davoi.png" alt="Xi măng"></a>
                    <h3>Đá vôi</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/datrang.png" alt="Xi măng"></a>
                    <h3>Đá trắng</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/damisang.png" alt="Xi măng"></a>
                    <h3>Đá mi sang</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/damibui.png" alt="Xi măng"></a>
                    <h3>Đá mi bui</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/Da_cat_soi/dabazan.png" alt="Xi măng"></a>
                    <h3>Đá bazan</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>

                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/gachxaydung/gachchiulua.png"
                            alt="Xi măng"></a>
                    <h3>Gạch chịu lửa</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/gachxaydung/gachdinhdac.png"
                            alt="Xi măng"></a>
                    <h3>Gạch đinh đặc</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/gachxaydung/gachhiephung717.png"
                            alt="Xi măng"></a>
                    <h3>Gạch hiệp phụng</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachtuynel.png" alt="Xi măng"></a>
                    <h3>Gạch tuynel</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachkhongnung.png" alt="Xi măng"></a>
                    <h3>Gạch không nung</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachtuynelhieuthao.png" alt="Xi măng"></a>
                    <h3>Gạch tuynel hiếu</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachtuynelngocchung.png" alt="Xi măng"></a>
                    <h3>Gạch ngọc chung</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachtuynelngochung.png" alt="Xi măng"></a>
                    <h3>Gạch ngọc hiếu</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachtuynelsangtrongnghia.png"
                            alt="Xi măng"></a>
                    <h3>Gạch trọng nghĩa</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachdanaBU03.png" alt="Xi măng"></a>
                    <h3>Gạch danaBU03</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachdaden.png" alt="Xi măng"></a>
                    <h3>Gạch đá đen</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gach-xay-tuong.png" alt="Xi măng"></a>
                    <h3>Gạch xây tường</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachchiulua.png" alt="Xi măng"></a>
                    <h3>Gạch chịu lửa</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachbong.png" alt="Xi măng"></a>
                    <h3>Gạch bông</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachmen.png" alt="Xi măng"></a>
                    <h3>Gạch men</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 10.000₫</p>
                    <p>Giảm giá: 10%</p> <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachnhua.png" alt="Xi măng"></a>
                    <h3>XGạch nhựa</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachtau.png" alt="Xi măng"></a>
                    <h3>Gạch tàu</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachkinh.png" alt="Xi măng"></a>
                    <h3>Gạch kính</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachtuynel.png" alt="Xi măng"></a>
                    <h3>Gạch tuynel</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/gachxaydung/gachcaosu.png" alt="Xi măng"></a>
                    <h3>Gạch caosu</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>


                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/vat_lieu_go/image1.png"
                            alt="Xi măng"></a>
                    <h3>Gỗ cao cấp</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/vat_lieu_go/image10.png"
                            alt="Xi măng"></a>
                    <h3>Gỗ trắng đặc</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/image11.png" alt="Xi măng"></a>
                    <h3>Gỗ thanh mượt</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/vat_lieu_go/image12.png"
                            alt="Xi măng"></a>
                    <h3>Gỗ đa năng</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/vat_lieu_go/image2.png"
                            alt="Xi măng"></a>
                    <h3>Gỗ thanh trà</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/vat_lieu_go/image3.png"
                            alt="Xi măng"></a>
                    <h3>Gỗ lõi đen </h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href=""><img src="/src/Users/img_product/vat_lieu_go/image4.png" alt="Đá bi"></a>
                    <h3>Gỗ đặc</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/image5.png" alt="Xi măng"></a>
                    <h3>Gỗ phân tầng</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/image6.png" alt="Xi măng"></a>
                    <h3>Gỗ thanh đa</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/image7.png" alt="Xi măng"></a>
                    <h3>Gỗ khối lớn</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/image8.png" alt="Xi măng"></a>
                    <h3>Gỗ khớp vàng</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/image9.png" alt="Xi măng"></a>
                    <h3>Gỗ thanh đen</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/gotro.png" alt="Xi măng"></a>
                    <h3>Gỗ trơ</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/gothong.png" alt="Xi măng"></a>
                    <h3>Gỗ thông</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/gooccho.png" alt="Xi măng"></a>
                    <h3>Gỗ óc chó</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/gohuong.png" alt="Xi măng"></a>
                    <h3>Gỗ hương</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/gohong.png" alt="Xi măng"></a>
                    <h3>Gỗ hồng</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/gocamxe.png" alt="Xi măng"></a>
                    <h3>Gỗ căm xe</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/gocamlai.png" alt="Xi măng"></a>
                    <h3>Gỗ cầm lài</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/vat_lieu_go/gobachduong.png" alt="Xi măng"></a>
                    <h3>Gỗ bạch dương</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>


                 <!-- Sản phẩm 1 đến 18 -->
                 <div class="name-cart">
                    <a href="../product-detail.html"><img
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/ngoi/Ngói nóc.png"
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>


                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/2 inch, áp suất PN20 Bar.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Nối Ren trong PPR Bình Minh Φ20 x 1/2 inch, áp suất PN20 Bar</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Bồn nước inox.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Bồn nước inox</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Co 90 độ trơn phi 21 Nhựa Bình Minh.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Co 90 độ trơn phi 21 Nhựa Bình Minh</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Co 90⁰ Ø6mm dùng cho máy lọc nước RO.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Co 90⁰ Ø6mm dùng cho máy lọc nước RO</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Co giảm PVC phi 60-42.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Co giảm PVC phi 60-42</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Khớp nối sống ( Rắc Co nhựa ) Ø27, Nhựa PVC-U Bình Minh.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Khớp nối sống ( Rắc Co nhựa ) Ø27, Nhựa PVC-U Bình Minh</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href=""><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Nắp khóa, bịt đầu ống loại ren ngoài Ø21 nhựa PVC BÌNH MINH, giá tính theo cái.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Nắp khóa, bịt đầu ống loại ren ngoài Ø21 nhựa PVC BÌNH MINH, giá tính theo cái</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Nắp khóa, bịt đầu ống Ø90 (loại đầu bằng, không ren) nhựa PVC-U Tiền Phong.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Nắp khóa, bịt đầu ống Ø90 (loại đầu bằng, không ren) nhựa PVC-U Tiền Phong</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Nối ren trong Ø21 D cho ống nhựa cứng PVCU Bình Minh.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Nối ren trong Ø21 D cho ống nhựa cứng PVCU Bình Minh</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Nối rút trơn 90 x 42 M , nhựa PVC-U Bình Minh.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Nối rút trơn 90 x 42 M , nhựa PVC-U Bình Minh</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Nối ống chữ T nhựa PVC Bình Minh một đầu ren trong phi 21.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Nối ống chữ T nhựa PVC Bình Minh một đầu ren trong phi 21</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Nối ống dạng T Ø49 D nhựa PVC BÌNH MINH, áp suất PN12 bar.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Nối ống dạng T Ø49 D nhựa PVC BÌNH MINH, áp suất PN12 bar</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ong-nuoc-phu-kien/Phao cơ inox 304 27mm Rossa.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Phao cơ inox 304 27mm Rossa</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ong-nuoc-phu-kien/Van nhựa Ø34 Bình Minh.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Van nhựa Ø34 Bình Minh</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 20 -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Đồng hồ nước Trung Đức phi 49 DN40.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Đồng hồ nước Trung Đức phi 49 DN40</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ong-nuoc-phu-kien/Ống nhựa Bình Minh PVC-U.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Ống nhựa Bình Minh PVC-U</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Ống nhựa mềm lõi thép Ø50mm, cuộn 50m.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Ống nhựa mềm lõi thép Ø50mm, cuộn 50m</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Ống nhựa mềm Ø35mm Luco, cuộn 40m trong suốt.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Ống nhựa mềm Ø35mm Luco, cuộn 40m trong suốt</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/ong-nuoc-phu-kien/Ống nhựa PVC lưới mềm ø25mm Luco, cuộn 50m màu xanh dương.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Ống nhựa PVC lưới mềm ø25mm Luco, cuộn 50m màu xanh dương</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/ong-nuoc-phu-kien/Ống nóng ppr phi 32x5.4mm.png"
                            alt="Ống nước và phụ kiện"></a>
                    <h3>Ống nóng ppr phi 32x5.4mm</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>


                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
                            src="/src/Users/img_product/son/Sơn Nội Thất DULUX AMBIANCE 5 IN1 PEARL GLOW Bóng mờ.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Nội Thất DULUX AMBIANCE 5 IN1 PEARL GLOW Bóng mờ</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img
                            src="/src/Users/img_product/son/Sơn Nội Thất Dulux Ambiance 5in1 Superflexx.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Nội Thất Dulux Ambiance 5in1 Superflexx</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/Sơn Nội Thất Dulux EasyClean Chống Bám Bẩn Kháng Virus.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Nội Thất Dulux EasyClean Chống Bám Bẩn Kháng Virus</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
                            src="/src/Users/img_product/son/Sơn Nội Thất Dulux EasyClean Chống Bám Bẩn.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Nội Thất Dulux EasyClean Chống Bám Bẩn</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
                            src="/src/Users/img_product/son/Sơn Nội Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt Bóng.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Nội Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt Bóng</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img
                            src="/src/Users/img_product/son/Sơn Nội Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt Mờ.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Nội Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt Mờ</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href=""><img
                            src="/src/Users/img_product/son/Sơn Sắt Giả Gỗ Lotus Meta Coat Primer – 1 Sơn Lót + 1 Sơn Phủ.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Sắt Giả Gỗ Lotus Meta Coat Primer – 1 Sơn Lót + 1 Sơn Phủ</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/Sơn nước ngoại thất Dulux Weathershield Bề Mặt .png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn nước ngoại thất Dulux Weathershield Bề Mặt</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/Sơn nước ngoại thất Dulux Weathershield Colour Protect Bề Mặt.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn nước ngoại thất Dulux Weathershield Colour Protect Bề Mặt</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/Sơn nước ngoại thất Dulux Weathershield Powerflexx Bề Mặt.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn nước ngoại thất Dulux Weathershield Powerflexx Bề Mặt</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/Sơn nước ngoại thất Maxilite Tough từ Dulux Bề Mặt.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn nước ngoại thất Maxilite Tough từ Dulux Bề Mặt</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/son/SƠN NƯỚC NGOẠI THẤT SUPERTECH PRO EXTERIOR.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>SƠN NƯỚC NGOẠI THẤT SUPERTECH PRO EXTERIOR</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/Sơn Lót Ngoại Thất Siêu Cao Cấp Dulux Weathershield Chống Kiềm.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Lót Ngoại Thất Siêu Cao Cấp Dulux Weathershield Chống Kiềm</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/Sơn Lót Ngoại Thất Siêu Cao Cấp Dulux Weathershield Powersealer.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Lót Ngoại Thất Siêu Cao Cấp Dulux Weathershield Powersealer</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 20 -->
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/Sơn Ngoại Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Ngoại Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/SƠN LÓT LẤP TIM LÀM MỊN GỖ LOTUS SANDING SEALER.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>SƠN LÓT LẤP TIM LÀM MỊN GỖ LOTUS SANDING SEALER</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/son/Sơn nước nội thất cao cấp TOA Nanoclean.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn nước nội thất cao cấp TOA Nanoclean</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/Sơn nước nội thất sinh học DULUX BETTER LIVING AIR CLEAN.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn nước nội thất sinh học DULUX BETTER LIVING AIR CLEAN</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/son/Phụ gia chống thấm BS-8430 Latex.png"
                            alt="Sơn và phụ gia"></a>
                    <h3><a href="../product-detail.html">Phụ gia chống thấm BS-8430 Latex</a></h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img
                            src="/src/Users/img_product/son/Sơn Nội Thất Cao Cấp Dulux Easyclean Lau Chùi Hiệu Quả Bề Mặt Bóng.png"
                            alt="Sơn và phụ gia"></a>
                    <h3>Sơn Nội Thất Cao Cấp Dulux Easyclean Lau Chùi Hiệu Quả Bề Mặt Bóng</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>


                 <!-- Sản phẩm 1 đến 18 -->
                 <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thepvasat/image1.png"
                            alt="Thep"></a>
                    <h3>Thép cốt bê tông</h3>
                    <p>Giá: <del>300.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 290.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thepvasat/image2.png"
                            alt="Thep"></a>
                    <h3>Thép cuộn SS400</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image3.png" alt="Thep"></a>
                    <h3>Thép thanh vằn </h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image4.png" alt="Thep"></a>
                    <h3>Thanh thép hình I</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image5.png" alt="Thep"></a>
                    <h3>Ống thép mạ kẽm</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image6.png" alt="Thep"></a>
                    <h3>Ống thép hộp</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image7.png" alt="Thep"></a>
                    <h3>Thép hộp chữ nhật</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image8.png" alt="Thep"></a>
                    <h3>Thanh thép chữ A </h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image9.png" alt="Thep"></a>
                    <h3>Cuộn thép đặc biệt</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image10.png" alt="Thep"></a>
                    <h3>Hàng rào sắt</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image11.png" alt="Thep"></a>
                    <h3>Lưới sắt</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image12.png" alt="Thep"></a>
                    <h3>Cuộn thép gai</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image13.png" alt="Thep"></a>
                    <h3>Thép cuộn Pomina</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image14.png" alt="Thep"></a>
                    <h3>Thép hộp vuông mạ kẽm Sendo </h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/thepvasat/image15.png" alt="Thep"></a>
                    <h3>Thép hình chữ V Miền Nam</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>


                 <!-- Sản phẩm 1 đến 18 -->
                 <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image1.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Máy bơm tăng áp A-130 JAK – Panasonic</h3>
                    <p>Giá: <del>2,150,000₫</del></p>
                    <p style="color: red;">Giá đã giảm:1,505,000₫</p>
                    <p>Giảm giá: 30%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image2.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Máy bơm tăng áp Panasonic JAK-100% lõi đồng </h3>
                    <p>Giá: <del>2.500.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 1.750.000₫</p>
                    <p>Giảm giá: 30%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image3.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Máy bơm tăng áp Panasonic JAK- có nắp che mưa </h3>
                    <p>Giá: <del>2,590,000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 1.680.000₫</p>
                    <p>Giảm giá: 35%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image4.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Máy Bơm Đẩy Cao Panasonic GP-350JA-SV5 350W </h3>
                    <p>Giá: <del> 4,490,000₫,</del></p>
                    <p style="color: red;">Giá đã giảm: 2,918,500₫</p>
                    <p>Giảm giá: 35%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image5.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Máy bơm nước đẩy cao Panasonic GP-129JXK-SV5 125W</h3>
                    <p>Giá: <del>1,470,000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 968,000₫</p>
                    <p>Giảm giá: 34%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image6.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Bồn nước inox 1000L Đứng Tân Á Đại Thành</h3>
                    <p>Giá: <del>5.099.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 3.900.000₫</p>
                    <p>Giảm giá: 24%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image7.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Bình nóng lạnh năng lượng mặt trời</h3>
                    <p>Giá: <del>8.200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 6.100.000₫</p>
                    <p>Giảm giá: 25%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image8.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Đồng hồ điện điện tử LSE LS142 có 1 pha 2 dây </h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image9.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Đồng Hồ Điện Một Pha EMIC 10(40A) – Có Giấy Kiểm Định</h3>
                    <p>Giá: <del>250,000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 220,000₫</p>
                    <p>Giảm giá: 12%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image10.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Máy nước nóng Beko BWI35S1N-213</h3>
                    <p>Giá: <del>2.450.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 2.199.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image11.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Máng đèn Anfaco T8 0.6m - 14W</h3>
                    <p>Giá: <del>150.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 120.000₫</p>
                    <p>Giảm giá: 20%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image12.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Đèn LED Duhal âm trần cao cấp KBNL830 30W</h3>
                    <p>Giá: <del>200.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 180.000₫</p>
                    <p>Giảm giá: 20%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image13.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>
                        Công tơ điện 3 pha 4 dây cơ mã LS3E4 chính hãng LSE
                    </h3>
                    <p>Giá: <del>1.750.000₫</del></p>
                    <p style="color: red;">Giá đã giảm:
                        1.312.500₫
                    </p>
                    <p>Giảm giá: 25%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image14.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>Máy bơm tăng áp A-130JTX 150W </h3>
                    <p>Giá: <del>3,412,500đ</del></p>
                    <p style="color: red;">Giá đã giảm: 2,730,000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/thietbi-diennuoc/image15.png"
                            alt="thiet-bi-dien-nuoc"></a>
                    <h3>MCB 3 pha 6A Panasonic</h3>
                    <p>Giá: <del>350.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 329.000₫</p>
                    <p>Giảm giá: 6%</p> <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>


                   <!-- Sản phẩm 1 đến 18 -->
                   <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/xingmang/image1.png"
                            alt="Xi măng"></a>
                    <h3>Xi măng SCG-PC40-ELE</h3>
                    <p>Giá: <del>300.000₫</del></p>
                    <p style="color: red;">Giá đã giảm: 290.000₫</p>
                    <p>Giảm giá: 10%</p>
                    <span style="margin-left: 10px;">
                        <i class="fas fa-eye"></i> <!-- Icon mắt Font Awesome -->
                        <span style="font-size: 0.9em;">50</span> <!-- Số lượt xem -->
                    </span>
                    <span style="margin-left: 20px;">
                        <i class="fas fa-shopping-cart"></i> <!-- Icon giỏ hàng Font Awesome -->
                        <span style="font-size: 0.9em;">đã bán:300</span> <!-- Số lượt mua -->
                    </span>
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/xingmang/image2.png"
                            alt="Xi măng"></a>
                    <h3>Xi măng Victem Hà Tiến</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/image3.png" alt="Xi măng"></a>
                    <h3>Xi măng đa dụng ECO</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/xingmang/ximagfico.png"
                            alt="Xi măng"></a>
                    <h3>Xi măng FICO CEMENT</h3>
                    <p>Giá: <del>195.000₫</del></p>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/xingmang/ximamg allybuild.png"
                            alt="Xi măng"></a>
                    <h3>Xi măng Allyuild</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="../product-detail.html"><img src="/src/Users/img_product/xingmang/ximamgholikem.png"
                            alt="Xi măng"></a>
                    <h3>Xi măng Holcim </h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href=""><img src="/src/Users/img_product/xingmang/ximanginseeeco.png" alt="Đá bi"></a>
                    <h3>Xi măng Inceeco</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximangpc40.png" alt="Xi măng"></a>
                    <h3>Xi măng PCP 40-MS </h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximangtaydo.png" alt="Xi măng"></a>
                    <h3>Xi măng Tây Đô</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximangvicemhalong.png" alt="Xi măng"></a>
                    <h3>Xi măng Viccem Hạ Long</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Sản phẩm 1 đến 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximangvicemhatien.png" alt="Xi măng"></a>
                    <h3>Xi măng Viccem Hà tiên</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximangcampha.png" alt="Xi măng"></a>
                    <h3>Xi măng CẨM PHẢ-NB</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximangchongtham.png" alt="Xi măng"></a>
                    <h3>Xi măng chống thấm SOTIN</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- Tiếp tục tạo các thẻ sản phẩm tương tự -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximanginsee.png" alt="Xi măng"></a>
                    <h3>Xi măng đa dụng INSEE </h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <!-- ... Tạo các thẻ sản phẩm cho đến sản phẩm thứ 18 -->
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximangshahcement.png" alt="Xi măng"></a>
                    <h3>Xi măng SHAH CEMENT</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximangtanthang.png" alt="Xi măng"></a>
                    <h3>Xi măng TẤN THĂNG</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximangthanglong.png" alt="Xi măng"></a>
                    <h3>Xi măng THĂNG LONG</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                </div>
                <div class="name-cart">
                    <a href="#"><img src="/src/Users/img_product/xingmang/ximangunicorn.png" alt="Xi măng"></a>
                    <h3>Xi măng UNICORN-MA</h3>
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
                    <a href="../cart.html" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
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
            <li style="list-style-type: none;"><a href="https://www.instagram.com/paq.2012/" target="_blank" rel="noopener"><i
                        class="fab fa-instagram icon" style="color: #f12020;"></i></a></li>
        </div>
        <div id="fb">
            <li style="list-style-type: none;"><a href="https://www.facebook.com/profile.php?id=100044411504061"
                    target="_blank" rel="noopener"><i class="fa-brands fa-facebook-square icon" style="color: #0911ff;"></i></a></li>
        </div>
        <button id="backToTop" title="Quay về đầu trang">⬆</button>
    </div>

    <script src="../js/product.js"></script>
    <script src="../js/login-signup.js"></script>
    <script src="../js/scripts.js" defer></script>
    <script src="../js/home.js"></script>
</body>

</html>