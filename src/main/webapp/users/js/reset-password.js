document.addEventListener('DOMContentLoaded', function() {
    // Kiểm tra jQuery
    if (typeof jQuery === 'undefined') {
        console.error('jQuery không được tải. Vui lòng kiểm tra đường dẫn jQuery.');
        alert('jQuery không được tải. Vui lòng kiểm tra console để biết chi tiết.');
        return;
    } else {
        console.log('jQuery đã tải thành công:', jQuery.fn.jquery);
    }

    const resetPasswordForm = document.getElementById('reset-password-form');
    const backToLoginLink = document.getElementById('back-to-login');

    // Xử lý form gửi yêu cầu reset mật khẩu
    if (resetPasswordForm) {
        console.log('resetPasswordForm được tìm thấy.');
        resetPasswordForm.addEventListener('submit', function(event) {
            console.log('Form submit được gọi.');
            event.preventDefault(); // Ngăn submit truyền thống

            const email = document.getElementById('reset-email').value;
            const errorEmail = document.getElementById('email-error');

            let isValid = true;

            // Kiểm tra client-side
            if (email === '') {
                errorEmail.textContent = 'Email không được để trống';
                errorEmail.style.display = 'block';
                isValid = false;
            } else {
                errorEmail.style.display = 'none';
            }
            if (isValid) {
                console.log('Gửi AJAX với email:', email);
                $.ajax({
                    url: '/tqh/reset-password', // Thêm context path
                    type: 'POST',
                    data: {
                        action: 'request',
                        email: email
                    },
                    dataType: 'json',
                    beforeSend: function() {
                        resetPasswordForm.querySelector('button').disabled = true;
                        resetPasswordForm.querySelector('button').textContent = 'Đang gửi...';
                    },
                    success: function(response) {
                        resetPasswordForm.querySelector('button').disabled = false;
                        resetPasswordForm.querySelector('button').textContent = 'Gửi liên kết đặt lại mật khẩu';
                        console.log('AJAX success:', response);
                        if (response.success) {
                            errorEmail.textContent = response.error_email || 'Email xác thực đã gửi đến bạn';
                            errorEmail.style.color = 'green';
                            errorEmail.style.display = 'block';
                        } else {
                            errorEmail.textContent = response.error_email || 'Có lỗi xảy ra, vui lòng thử lại.';
                            errorEmail.style.color = 'red';
                            errorEmail.style.display = 'block';
                        }
                    },
                    error: function(xhr, status, error) {
                        resetPasswordForm.querySelector('button').disabled = false;
                        resetPasswordForm.querySelector('button').textContent = 'Gửi liên kết đặt lại mật khẩu';
                        console.error('AJAX error:', status, error, xhr.responseText);
                        errorEmail.textContent = 'Lỗi hệ thống, vui lòng thử lại sau.';
                        errorEmail.style.color = 'red';
                        errorEmail.style.display = 'block';
                    }
                });
            }
        });
    } else {
        console.error('resetPasswordForm không được tìm thấy.');
    }

    const newPasswordForm = document.getElementById('new-password-form');
    if (newPasswordForm) {
        console.log('newPasswordForm được tìm thấy.');
        newPasswordForm.addEventListener('submit', function(event) {
            console.log('newPasswordForm submit được gọi.');
            event.preventDefault();

            const newPassword = document.getElementById('new-password').value;
            const confirmPassword = document.getElementById('confirm-password').value;
            const token = document.querySelector('input[name="token"]').value;
            const passwordError = document.getElementById('password-error');

            console.log('Token:', token);
            console.log('New Password:', newPassword);

            let valid = true;
            passwordError.textContent = '';

            const newPasswordPattern = /^[a-zA-Z0-9]{5,10}$/;
            if (newPassword === '' || !newPasswordPattern.test(newPassword)) {
                passwordError.textContent = 'Mật khẩu mới phải từ 5-10 ký tự và không chứa ký tự đặc biệt';
                valid = false;
            }

            if (confirmPassword !== newPassword) {
                passwordError.textContent = 'Xác nhận mật khẩu không khớp';
                valid = false;
            }

            if (!token) {
                passwordError.textContent = 'Token không hợp lệ hoặc thiếu.';
                valid = false;
            }

            if (valid) {
                console.log('Gửi AJAX reset password');
                $.ajax({
                    url: '/tqh/reset-password', // Thêm context path
                    type: 'POST',
                    data: {
                        action: 'reset',
                        token: token,
                        password: newPassword
                    },
                    dataType: 'json',
                    beforeSend: function() {
                        newPasswordForm.querySelector('button').disabled = true;
                        newPasswordForm.querySelector('button').textContent = 'Đang cập nhật...';
                    },
                    success: function(response) {
                        newPasswordForm.querySelector('button').disabled = false;
                        newPasswordForm.querySelector('button').textContent = 'Cập nhật mật khẩu';
                        console.log('AJAX success:', response);
                        if (response.success) {
                            window.location.href = '/tqh/login?action=login';
                        } else {
                            passwordError.textContent = response.error_token || 'Token không hợp lệ hoặc đã hết hạn.';
                            passwordError.style.display = 'block';
                        }
                    },
                    error: function(xhr, status, error) {
                        newPasswordForm.querySelector('button').disabled = false;
                        newPasswordForm.querySelector('button').textContent = 'Cập nhật mật khẩu';
                        console.error('AJAX error:', status, error, xhr.responseText);
                        passwordError.textContent = 'Lỗi hệ thống, vui lòng thử lại sau.';
                        passwordError.style.display = 'block';
                    }
                });
            } else {
                passwordError.style.display = 'block';
            }
        });

        document.getElementById('new-password').addEventListener('input', function() {
            document.getElementById('password-error').style.display = 'none';
        });
        document.getElementById('confirm-password').addEventListener('input', function() {
            document.getElementById('password-error').style.display = 'none';
        });
    }

    if (backToLoginLink) {
        backToLoginLink.addEventListener('click', function() {
            window.location.href = '/tqh/login?action=login';
        });
    }
});