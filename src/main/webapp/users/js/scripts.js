document.addEventListener("DOMContentLoaded", function () {
    const backToTopButton = document.getElementById("backToTop");
    const userGreeting = document.getElementById('user-greeting');
    const usernameDisplay = document.getElementById('username');
    const loginLink = document.getElementById('login-link');
    const signupLink = document.getElementById('signup-link');
    const logoutLink = document.getElementById('logout-link');
        // Lấy các phần tử
    const menuToggle = document.querySelector('.menu-toggle');
    const navMenu = document.querySelector('.nav');

    // Hiển thị nút khi cuộn xuống
    window.onscroll = function () {
        if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
            backToTopButton.style.display = "block";
        } else {
            backToTopButton.style.display = "none";
        }
    };

    // Quay về đầu trang khi nhấn nút
    backToTopButton.onclick = function () {
        window.scrollTo({ top: 0, behavior: "smooth" });
    };

    // Xử lý sự kiện click vào nút menu
    menuToggle.addEventListener('click', () => {
    navMenu.classList.toggle('active'); // Thêm hoặc xóa lớp "active"
    });


    // Hiển thị thông tin người dùng nếu đã đăng nhập
    const username = usernameDisplay?.dataset.username?.trim() || "";
    console.log(">> Username:", username);
    // Kiểm tra xem username có tồn tại không
    if (username) {
        // Hiển thị thông báo "Xin chào, username!"
        userGreeting.style.display = "inline";
        // Hiển thị các liên kết Logout và Account
        logoutLink.style.display = "inline";
        signupLink.style.display = "inline";
        loginLink.style.display = "none";
    } else {
        // Nếu không có username, ẩn các liên kết Logout và Account
        document.getElementById("user-greeting").style.display = "none";
        document.getElementById("logout-link").style.display = "none";
        document.getElementById("signup-link").style.display = "none";
        document.getElementById("login-link").style.display = "inline";
    }
});

function showAlert() {
    const alert = document.querySelector('.alert');
    if (alert) {
        alert.style.display = 'block'; // Hiển thị thông báo


        alert.classList.remove('fade-out');

        setTimeout(function () {
            alert.classList.add('fade-out'); // Thêm lớp fade-out để làm mờ thông báo
        }, 1000);  // 3 giây trước khi bắt đầu hiệu ứng biến mất

        // Sau khi fade-out hoàn thành, ẩn đi thông báo và có thể tái sử dụng
        alert.addEventListener('transitionend', function() {
            if (alert.classList.contains('fade-out')) {
                alert.style.display = 'none'; // Ẩn đi sau khi hiệu ứng fade-out kết thúc
            }
        });
    }
}

function addCart(id) {
    $.ajax({
        url: "add-cart",
        type: "GET",
        dataType: "json",
        data: {
            id: id,
        },
        success: function (res) {
            if (res.status === "success") {
                $.ajax({
                    url: "cart-items",
                    type: "GET",
                    dataType: 'json',
                    success: function (data) {
                        $("#subtotal .value").text(data.totalPrice.toLocaleString());
                        $("#vat .value").text(data.totalShippingFee.toLocaleString());
                        $("#total .value").text(data.totalFinalPrice.toLocaleString());
                        $("#cart-count").text(data.totalItem);
                        window.location.href = "turn-page?action=cart";
                    }
                });


            } else if (res.status === "unauthenticated") {
                window.location.href = "logout";
            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX lỗi:", error);
            console.log("Chi tiết lỗi:", xhr.responseText);
        }
    });
}