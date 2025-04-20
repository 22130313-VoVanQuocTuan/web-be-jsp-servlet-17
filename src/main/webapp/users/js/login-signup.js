document.addEventListener('DOMContentLoaded', function () {
    invalidationVF(); // gọi 1 lần khi trang vừa load
    invalidation();
    document.getElementById("register-email").addEventListener('input', invalidation)
    document.getElementById("register-username").addEventListener('input', invalidation)
    document.getElementById("register-password").addEventListener('input', invalidation)
    document.getElementById("verification-code").addEventListener('input', invalidationVF)


    // Lấy các phần tử DOM
    const container = document.getElementById('container');

    const loginBtn = document.getElementById('login');
    const homeBtn = document.getElementById('home');
    const homeAltBtn = document.getElementById('HOME');

    const loginForm = document.getElementById('login-form');
    const userGreeting = document.getElementById('user-greeting');
    const usernameDisplay = document.getElementById('username');
    const loginLink = document.getElementById('login-link');
    const signupLink = document.getElementById('signup-link');
    const logoutLink = document.getElementById('logout-link');
    const  registerBtn = document.getElementById('register');


    // Chuyển đổi giao diện giữa đăng ký và đăng nhập
    if (registerBtn && container) {
        registerBtn.addEventListener('click', () => container.classList.add("active"));
    }

    if (loginBtn && container) {
        loginBtn.addEventListener('click', () => container.classList.remove("active"));
    }

    // Điều hướng về trang Home
    if (homeBtn) {
        homeBtn.addEventListener('click', () => window.location.href = '../../home.jsp');
    }

    if (homeAltBtn) {
        homeAltBtn.addEventListener('click', () => window.location.href = '../../home.jsp');
    }


    // Xử lý đăng nhập
    const usernameErrorLog = document.getElementById('username-errorlog');
    const passwordErrorLog = document.getElementById('password-errorlog');

    if (loginForm) {
        loginForm.addEventListener('submit', function (event) {
            event.preventDefault();
            const username = document.getElementById('login-username').value;
            const password = document.getElementById('login-password').value;

            let isValid = true;

            // Kiểm tra tên đăng nhập
            if (username === '') {
                usernameErrorLog.textContent = 'Tên đăng nhập không được để trống';
                usernameErrorLog.style.display = 'block';
                isValid = false;
            } else {
                usernameErrorLog.style.display = 'none';
            }

            // Kiểm tra mật khẩu
            if (password === '') {
                passwordErrorLog.textContent = 'Mật khẩu không được để trống';
                passwordErrorLog.style.display = 'block';
                isValid = false;
            } else {
                passwordErrorLog.style.display = 'none';
            }

            const errorMessageElement = document.getElementById('error-login');

            // Nếu hợp lệ, xử lý đăng nhập
            if (isValid) {
                errorMessageElement.innerText = "";
                loginForm.submit(); // Gửi form nếu hợp lệ
            }
        });
    }

    // Hiển thị thông tin người dùng nếu đã đăng nhập
    const username = usernameDisplay.textContent.trim();
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
})

    function invalidation() {
        const emailInput = document.getElementById('register-email');
        const usernameInput = document.getElementById('register-username');
        const passwordInput = document.getElementById('register-password');
        const submitBtn = document.getElementById('submit-register');

        // Các phần tử hiển thị lỗi (giả định bạn có HTML chứa <small> để hiển thị lỗi)
        const emailError = document.getElementById('email-error');
        const usernameError = document.getElementById('username-error');
        const passwordError = document.getElementById('password-error');

        // Reset lỗi
        emailError.style.display = 'none';
        usernameError.style.display = 'none';
        passwordError.style.display = 'none';


        let isValid = true;

        // Validate email
        const emailValue = emailInput.value.trim();
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(emailValue)) {
            emailError.textContent = 'Email không hợp lệ.';
            emailError.style.display = 'block';
            isValid = false;

        }

        // Validate username
        const usernameValue = usernameInput.value.trim();
        if (usernameValue.length < 3) {
            usernameError.textContent = 'Tên người dùng phải từ 3 ký tự.';
            usernameError.style.display = 'block';
            isValid = false;

        }

        // Validate password
        const passwordValue = passwordInput.value.trim();
        if (passwordValue.length < 6) {
            passwordError.textContent = 'Mật khẩu phải từ 6 ký tự trở lên.';
            passwordError.style.display = 'block';
            isValid = false;

        }

        // Nếu không hợp lệ, ngăn gửi form
        if (!isValid) {
            submitBtn.disabled = true;
            return false;
        }
        submitBtn.disabled = false;
        return true; // hợp lệ thì cho phép submit
    }


    document.getElementById("register-form").addEventListener('submit', function (event) {
        event.preventDefault();  // Ngăn form tự động submit

        const email = document.getElementById('register-email');
        const username = document.getElementById('register-username');
        const password = document.getElementById('register-password');
        const form = document.getElementById("verification-modal");
        $.ajax({
            url: "signup-user",
            type: "POST",
            data: {email: email.value, username: username.value, password: password.value},

            success: function (response) {
                if (response.error) {
                    document.getElementById("message").innerHTML = response.message;
                    showAlert();

                } else {
                    form.style.display = 'block';
                    document.getElementById("email").value = email.value;
                }
            }
        })
    })

    function invalidationVF() {
        const errorSpan = document.getElementById("verification-code-error");
        const code = document.getElementById("verification-code").value.trim();
        const bt = document.getElementById("verify-button");

        if (code.length !== 4 || /\D/.test(code)) {
            errorSpan.textContent = "Vui lòng nhập đủ 4 chữ số hợp lệ";
            bt.disabled = true;
        } else {
            errorSpan.textContent = "";
            bt.disabled = false;
        }
    }

    document.getElementById("verification-form").addEventListener('submit', function (event) {
        event.preventDefault();
        // Lấy từng số từ input
       const codes = document.getElementById("verification-code").value;
       const errorSpan = document.getElementById("verification-code-error");
       const  emailVF = document.getElementById("email").value;

        // Gửi AJAX đến servlet
        $.ajax({
            url: "verify-email",
            type: "POST",
            data: {codes: codes, email: emailVF},
            success: function (response) {
                if (response.error) {
                    errorSpan.textContent = response.message;



                } else {
                    closeFormVF();
                    document.getElementById("message").innerHTML = response.message;
                    showAlert();
                }
            }
        })
    })

   // gửi laị mã code
document.getElementById("reset-password-form").addEventListener("submit", function (event){
    event.preventDefault();
    const  emailVF = document.getElementById("email").value;
    $.ajax({
        url: "reset-code",
        type: "POST",
        data: {email: emailVF},
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                showAlert();
            }else{
                document.getElementById("message").innerHTML = response.message;
                showAlert();
            }
        }

    })
})


    function closeFormVF() {
        document.getElementById("verification-modal").style.display = 'none';
    }



