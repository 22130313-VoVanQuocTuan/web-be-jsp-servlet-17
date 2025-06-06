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
<link rel="stylesheet" href="<c:url value="/users/css/introduce.css"/>">

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
                        <span class="cart-count"
                              id="cart-count">${empty sessionScope.cartItemCount ? 0 : sessionScope.cartItemCount}</span>
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
                <li class="propClone"><a href="home-page"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; TRANG CHỦ
                </a></li>
                <li class="propClone"><a href="turn-page-noLogin?action=product"><i
                        class="fa-brands fa-product-hunt"></i>
                    &nbsp;&nbsp;SẢN PHẨM</a>
                </li>
                <li class="propClone"><a href="turn-page?action=cart"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp;
                    GIỎ
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
    <div class="terms-container">
        <h1>Giới thiệu chi tiết về TQH - Trang web bán vật liệu xây dựng nội địa uy tín</h1>
        <p>Chào mừng bạn đến với <strong>TQH</strong>, nền tảng thương mại điện tử chuyên cung cấp các sản phẩm vật
            liệu xây dựng chất lượng cao dành riêng cho thị trường Việt Nam.
            <strong>TQH</strong> ra đời với sứ mệnh đồng hành cùng các nhà thầu, kiến trúc sư, và người tiêu dùng
            trong việc xây dựng và cải tạo các công trình lớn nhỏ, từ nhà ở gia đình đến dự án công nghiệp.
        </p>

        <h2>Tầm nhìn và sứ mệnh của TQH</h2>
        <p><strong>TQH</strong> không chỉ là nơi bạn tìm kiếm các loại vật liệu xây dựng chất lượng mà còn là đối
            tác tin cậy của bạn trong hành trình hiện thực hóa những ý tưởng xây dựng.
            Chúng tôi mong muốn trở thành cầu nối giúp người tiêu dùng dễ dàng tiếp cận các sản phẩm tốt nhất, với
            giá thành hợp lý và dịch vụ chuyên nghiệp.</p>

        <h2>Những sản phẩm chính tại TQH</h2>
        <ul>
            <li><strong>Gạch xây dựng</strong></li>
            <li><strong>Xi măng và vửa</strong></li>
            <li><strong>Cát,đá và sỏi</strong></li>
            <li><strong>Thép và sắt</strong></li>
            <li><strong>Gỗ và vật liệu gỗ</strong></li>
            <li><strong>Sơn và phụ gia</strong></li>
            <li><strong>Ngói và tấm lợp</strong></li>
            <li><strong>Ống nước và phụ kiện</strong></li>
            <li><strong>Thiết bị và điện nước</strong></li>
        </ul>

        <h2>Lý do bạn nên chọn TQH</h2>
        <h3>1. Sản phẩm chất lượng cao, phù hợp với nhu cầu trong nước</h3>
        <p><strong>TQH</strong> cam kết cung cấp các sản phẩm được chọn lọc kỹ lưỡng từ những nhà sản xuất và nhà
            phân phối uy tín tại Việt Nam. Các sản phẩm tại <strong>TQH</strong> phù hợp với điều kiện khí hậu, thổ
            nhưỡng, và yêu cầu xây dựng đặc thù trong nước, đảm bảo độ bền và tính thẩm mỹ cao.</p>

        <h3>2. Giá cả cạnh tranh và minh bạch</h3>
        <p>Tại <strong>TQH</strong>, bạn sẽ luôn nhận được báo giá rõ ràng và cạnh tranh, giúp bạn tối ưu chi phí
            cho mọi công trình. Chúng tôi thường xuyên có các chương trình khuyến mãi, giảm giá hấp dẫn để tri ân
            khách hàng.</p>

        <h3>3. Dịch vụ chuyên nghiệp và tận tâm</h3>
        <ul>
            <li><strong>Hỗ trợ tư vấn:</strong> Đội ngũ nhân viên giàu kinh nghiệm sẵn sàng hỗ trợ bạn trong việc
                lựa chọn sản phẩm phù hợp.
            </li>
            <li><strong>Giao hàng nhanh chóng:</strong> Với mạng lưới vận chuyển phủ sóng toàn quốc, chúng tôi cam
                kết giao hàng đúng thời gian, đảm bảo công trình của bạn không bị gián đoạn.
            </li>
            <li><strong>Chính sách đổi trả linh hoạt:</strong> <strong>TQH</strong> luôn đặt quyền lợi của khách
                hàng lên hàng đầu, với chính sách đổi trả dễ dàng nếu sản phẩm không đạt yêu cầu.
            </li>
        </ul>

        <h2>Phương châm hoạt động của TQH</h2>
        <ul>
            <li><strong>Tận tâm phục vụ:</strong> Mỗi khách hàng đều là đối tác quan trọng, chúng tôi nỗ lực để mang
                lại sự hài lòng tuyệt đối.
            </li>
            <li><strong>Hỗ trợ công trình bền vững:</strong> Chúng tôi cung cấp những vật liệu xây dựng đáp ứng tiêu
                chuẩn quốc gia, góp phần tạo nên những công trình bền vững và thân thiện với môi trường.
            </li>
            <li><strong>Phát triển vì người Việt:</strong> TQH hướng đến phát triển ngành xây dựng nội địa, thúc đẩy
                sự phát triển kinh tế và cộng đồng trong nước.
            </li>
        </ul>

        <h2>TQH - Đối tác xây dựng đáng tin cậy</h2>
        <p>Hãy để <strong>TQH</strong> đồng hành cùng bạn trong hành trình kiến tạo những công trình mơ ước. Truy
            cập ngay
            <a href="https://www.tqh.vn" target="_blank">www.tqh.vn</a> để khám phá hàng nghìn sản phẩm đa dạng và
            trải nghiệm dịch vụ chuyên nghiệp từ đội ngũ của chúng tôi!
        </p>

        <p><strong>TQH – Chất lượng vững bền, giá trị bền lâu!</strong></p>
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
                class="fa-solid fa-phone call" style="color: #02bc15d1;"></i></a></li>
    </div>
    <div>
        <li style="list-style-type: none;"><a href="https://www.instagram.com/paq.2012/" target="_blank"
                                              rel="noopener"><i class="fab fa-instagram icon "
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

<script src="<c:url value="/users/js/scripts.js"/>" defer></script>
<script src="<c:url value="/users/js/search.js"/>"></script>
</body>
</html>