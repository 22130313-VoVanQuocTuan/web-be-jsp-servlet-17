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
<link rel="stylesheet" href="../css/cart.css">

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
                            <a href="cart.html">
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
                    <li class="propClone"><a href="product.jsp"><i class="fa-brands fa-product-hunt"></i>
                            &nbsp;&nbsp;SẢN PHẨM</a>
                    </li>
                    <li class="propClone"> <a href="cart.html"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp; GIỎ
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

    <div id="section-content-1">
        <div class="cart-container">
            <div class="cart-left">
                <table class="cart-table">
                    <thead style="border-bottom: 2px solid #9e0000;">
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Hình ảnh</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Giá giảm</th>
                            <th>Tổng giá</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="cart-items-container" class="cart-items-container">
                        <tr class="cart-item" data-id="1">
                            <td>Gạch-inax</td>
                            <td><img src="../img_product/gachxaydung/gachdinhdac.png" alt="${product.name}"></td>
                            <td>
                                <div class="quantity">
                                    <button class="qty-btn minus-btn">-</button>
                                    <input title="input" type="number" value="1" class="qty-input" min="1" />
                                    <button class="qty-btn plus-btn">+</button>
                                </div>
                            </td>
                            <td id="price" class="price-after-discount">200.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">20.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">180.000 ₫</td> 
                            <td><button class="remove-from-cart-button">Xóa</button></td>
                        </tr>
                        <tr class="cart-item" data-id="2">
                            <td>Gạch không nung</td>
                            <td><img src="../img_product/gachxaydung/gachkhongnung.png" alt="${product.name}"></td>
                            <td>
                                <div class="quantity">
                                    <button class="qty-btn minus-btn">-</button>
                                    <input title="input" type="number" value="1" class="qty-input" min="1" />
                                    <button class="qty-btn plus-btn">+</button>
                                </div>
                            </td>
                            <td id ="price" class="price-after-discount">200.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">20.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">180.000 ₫</td> 
                            <td><button id="delete" class="remove-from-cart-button">Xóa</button>
                            </td>
                        </tr>
                        <tr class="cart-item" data-id="3">
                            <td>Ngói nóc</td>
                            <td><img src="../img_product/ngoi/Ngói%20cuối%20nóc.png" alt="${product.name}"></td>
                            <td>
                                <div class="quantity">
                                    <button class="qty-btn minus-btn">-</button>
                                    <input title="input" type="number" value="1" class="qty-input" min="1" />
                                    <button class="qty-btn plus-btn">+</button>
                                </div>
                            </td>
                            <td id ="price" class="price-after-discount">200.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">20.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">180.000 ₫</td> 
                            <td><button id="delete" class="remove-from-cart-button">Xóa</button>
                            </td>
                        </tr>
                        <tr class="cart-item" data-id="3">
                            <td>Thép BCL</td>
                            <td><img src="../img_product/thepvasat/image2.png" alt="${product.name}"></td>
                            <td>
                                <div class="quantity">
                                    <button class="qty-btn minus-btn">-</button>
                                    <input title="input" type="number" value="1" class="qty-input" min="1" />
                                    <button class="qty-btn plus-btn">+</button>
                                </div>
                            </td>
                            <td id ="price" class="price-after-discount">200.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">20.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">180.000 ₫</td> 
                            <td><button id="delete" class="remove-from-cart-button">Xóa</button>
                            </td>
                        </tr>
                        <tr class="cart-item" data-id="4">
                            <td>Sơn Dulux</td>
                            <td><img src="../img_product/son/Sơn%20nước%20ngoại%20thất%20Dulux%20Weathershield%20Powerflexx%20Bề%20Mặt.png" alt="${product.name}"></td>
                            <td>
                                <div class="quantity">
                                    <button class="qty-btn minus-btn">-</button>
                                    <input title="input" type="number" value="1" class="qty-input" min="1" />
                                    <button class="qty-btn plus-btn">+</button>
                                </div>
                            </td>
                            <td id ="price" class="price-after-discount">200.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">20.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">180.000 ₫</td> 
                            <td><button id="delete" class="remove-from-cart-button">Xóa</button>
                            </td>
                        </tr>
                        <tr class="cart-item" data-id="5">
                            <td>Gạch không nung</td>
                            <td><img src="../img_product/gachxaydung/gachkhongnung.png" alt="${product.name}"></td>
                            <td>
                                <div class="quantity">
                                    <button class="qty-btn minus-btn">-</button>
                                    <input title="input" type="number" value="1" class="qty-input" min="1" />
                                    <button class="qty-btn plus-btn">+</button>
                                </div>
                            </td>
                            <td id ="price" class="price-after-discount">200.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">20.000 ₫</td> 
                            <td id="total-price" class="total-after-discount">180.000 ₫</td> 
                            <td><button id="delete" class="remove-from-cart-button">Xóa</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="cart-buttons">
                    <a href="product.jsp"><button class="continue-btn">← Tiếp tục xem sản
                            phẩm</button></a>
                </div>
            </div>


            <div class="cart-right">
                <h2>Tổng Sản Phẩm</h2>
                <div class="cart-summary">
                    <div class="summary-item">
                        <span>Tạm tính:</span>
                        <span id="subtotal">180.000₫</span>
                    </div>
                    <div class="summary-item">
                        <span>Phí vận chuyển:</span>
                        <span id="vat">14.400₫</span>
                    </div>
                </div>
                <div class="summary-item total">
                    <span>Tổng cộng:</span>
                    <span id="total">194.400₫</span>
                </div>
                <a href="confirmation.jsp"><button class="checkout-btn">Tiến hành thanh toán</button></a>

                <div class="voucher">
                    <label for="voucher">Phiếu ưu đãi</label>
                    <input type="text" id="voucher" placeholder="Mã ưu đãi" />
                    <button id="apply-btn" class="apply-btn">
                        Áp dụng
                    </button>
                    <span id="voucher-error" class="error-message" style="color: red; display:none;">Mã ưu đãi không hợp lệ hoặc đã hết hạn.</span>

                    <div class="help">
                        <p><i style="font-size: 15px;" class="fas fa-question-circle spinning-icon"></i></p>
                        <p>Nhập mã ưu đãi nếu có.</p>
                        <p>Không có mã vui lòng bỏ qua và tiến hành thanh toán.</p>
                        <p>Mọi thắc mắc xin vui lòng liên hệ với hotline: </p>
                        <p class="blinking-text"
                            style="color: #ff0000; font-size: 15px; font-weight: bold; margin-top: 5px;"> 0386394258</p>
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
            <li style="list-style-type: none;"><a href="https://www.instagram.com/paq.2012/" target="_blank" rel="noopener"><i
                        class="fab fa-instagram icon" style="color: #f12020;"></i></a></li>
        </div>
        <div id="fb">
            <li style="list-style-type: none;"><a href="https://www.facebook.com/profile.php?id=100044411504061"
                    target="_blank" rel="noopener"><i class="fa-brands fa-facebook-square icon" style="color: #0911ff;"></i></a></li>
        </div>
        <button id="backToTop" title="Quay về đầu trang">⬆</button>

    </div>

    <script src="../js/login-signup.js"></script>
    <script src="/src/Users/js/scripts.js" defer></script>
    <script src="/src/Users/js/cart.js" defer></script>
</body>

</html>