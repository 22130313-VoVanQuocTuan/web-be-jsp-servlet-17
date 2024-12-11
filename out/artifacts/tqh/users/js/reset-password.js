document.addEventListener('DOMContentLoaded', function() {
    const resetPasswordForm = document.getElementById('reset-password-form');
    const backToLoginLink = document.getElementById('back-to-login');
    // Lắng nghe sự kiện submit form
    if (resetPasswordForm) {
        resetPasswordForm.addEventListener('submit', function (event) {
            event.preventDefault(); // Ngăn chặn gửi form ngay lập tức

            const email = document.getElementById('reset-email').value;
            const errorEmail = document.getElementById('email-error');

            let isValid = true;

            // Kiểm tra nếu email rỗng
            if (email === '') {
                errorEmail.textContent = "Email không được để trống";
                errorEmail.style.display = 'block';
                isValid = false;
            } else {
                errorEmail.style.display = 'block';

            }

            if (isValid) {
                // Nếu hợp lệ, gửi form
                resetPasswordForm.submit();
            }
        });
    }

    const newPasswordForm = document.getElementById('new-password-form');
    const passwordError = document.getElementById('password-error');
    // Khi form đặt lại mật khẩu mới được gửi
    if (newPasswordForm) {
        newPasswordForm.addEventListener('submit', function (event) {
            event.preventDefault();

            const newPassword = document.getElementById('new-password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            const passwordError = document.getElementById('password-error');

            if (newPassword !== confirmPassword) {
                passwordError.style.display = 'block';
                passwordError.textContent = "Mật khẩu không khớp.";
            } else {
                passwordError.style.display = 'none';
                newPasswordForm.submit();
            }
        });
    }

// Ẩn lỗi khi người dùng nhập lại mật khẩu
    document.getElementById('new-password').addEventListener('input', function() {
        passwordError.style.display = 'none';
    });
    document.getElementById('confirm-password').addEventListener('input', function() {
        passwordError.style.display = 'none';
    });

    // Khi người dùng muốn trở lại trang đăng nhập
    backToLoginLink.addEventListener('click', function() {
        window.location.href = "users/page/login-signup.jsp"; // Địa chỉ trang đăng nhập
    });
});
