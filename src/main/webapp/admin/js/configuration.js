document.addEventListener("DOMContentLoaded", function() {

    const logoutLink = document.getElementById("logout-link");
    const logoutModal = document.getElementById("logout-modal");
    const confirmLogout = document.getElementById("confirm-logout");
    const cancelLogout = document.getElementById("cancel-logout");
    const mainContent = document.body;

    // Khi nhấn vào "Đăng Xuất", hiện modal và làm mờ nền
    logoutLink.addEventListener("click", function (event) {
        event.preventDefault(); // Ngăn chặn chuyển hướng ngay lập tức
        logoutModal.style.display = "flex"; // Hiển thị modal
        mainContent.classList.add("blur-background");
    });

    // Khi nhấn nút "Hủy", ẩn modal và bỏ hiệu ứng làm mờ
    cancelLogout.addEventListener("click", function () {
        logoutModal.style.display = "none";
        mainContent.classList.remove("blur-background");
    });

    // Khi nhấn nút "Đăng Xuất", chuyển hướng đến trang logout
    confirmLogout.addEventListener("click", function () {
        window.location.href = "logout"; // Chuyển đến trang đăng xuất
    });

    // Khi nhấn bên ngoài modal, ẩn modal và bỏ hiệu ứng làm mờ
    window.addEventListener("click", function (event) {
        if (event.target === logoutModal) {
            logoutModal.style.display = "none";
            mainContent.classList.remove("blur-background");
        }
    });
})
/*Menu*/
let toggle = document.querySelector(".toggle");
let navigation = document.querySelector(".navigation");
let main = document.querySelector(".main");

toggle.onclick = function () {
    navigation.classList.toggle("active");
    main.classList.toggle("active");
};
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