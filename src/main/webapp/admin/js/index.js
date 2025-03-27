/*Menu*/
let toggle = document.querySelector(".toggle");
let navigation = document.querySelector(".navigation");
let main = document.querySelector(".main");

toggle.onclick = function () {
  navigation.classList.toggle("active");
  main.classList.toggle("active");
};   
/*Logout*/
function lockout(){
    window.location.href = "../../users/page/login-signup.jsp"
}


function updateStatusColors() {
    // Lấy tất cả các phần tử có class là "statusText"
    const statusElements = document.querySelectorAll(".statusText");

    statusElements.forEach((statusElement) => {
        const status = statusElement.textContent.trim(); // Lấy trạng thái hiện tại

        // Đặt màu nền dựa trên trạng thái
        switch (status) {
            case "Hoạt động":
                statusElement.style.backgroundColor = "#34ec34";
                break;
            case "Không hoạt động":
                statusElement.style.backgroundColor = "#cdcdcd";
                break;
            case "Đang chờ xử lý":
                statusElement.style.backgroundColor = "#ffae18";
                break;
            case "Bị đình chỉ":
                statusElement.style.backgroundColor = "#ff3939";
                break;
            default:
                statusElement.style.backgroundColor = ""; // Mặc định không màu
        }
    });
}

// Gọi hàm để áp dụng màu ngay khi trang được tải
document.addEventListener("DOMContentLoaded", updateStatusColors);
// thông báo tắt trong 3s
window.addEventListener('DOMContentLoaded', function () {
    const alert = document.querySelector('.alert');
    if (alert) {
        setTimeout(function () {
            alert.classList.add('fade-out');
        }, 3000);  // 3 giây trước khi bắt đầu hiệu ứng biến mất
    }
});

//Gọi hàm logout
document.addEventListener("DOMContentLoaded", function () {
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
});

