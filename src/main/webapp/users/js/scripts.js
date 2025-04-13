document.addEventListener("DOMContentLoaded", function () {
    const backToTopButton = document.getElementById("backToTop");

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