function placeOrder() {
    // Lấy các giá trị từ các trường nhập liệu
    var email = document.getElementById('email').value;
    var name = document.getElementById('name').value;
    var phone = document.getElementById('phone').value;
    var address = document.getElementById('address').value;



    // Ẩn tất cả thông báo lỗi trước khi kiểm tra
    hideErrorMessages();

    // Kiểm tra xem các trường có bị bỏ trống không
    var isValid = true;

    // Kiểm tra trường email
    if (!email) {
        showError('email', 'Vui lòng nhập email.');
        isValid = false;
    }

    // Kiểm tra trường name
    if (!name) {
        showError('name', 'Vui lòng nhập họ và tên.');
        isValid = false;
    }

    // Kiểm tra trường phone
    if (!phone) {
        showError('phone', 'Vui lòng nhập số điện thoại.');
        isValid = false;
    }

    // Kiểm tra trường address
    if (!address) {
        showError('address', 'Vui lòng nhập địa chỉ.');
        isValid = false;
    }





    if (isValid) {
        document.getElementById('error-message').style.display = 'none'; // Ẩn thông báo lỗi chung

        // Tiến hành xử lý đơn hàng (có thể là mở modal thanh toán hoặc gửi yêu cầu)

        const codForm = document.getElementById('codForm');
        const vnpayForm = document.getElementById('vnpayForm');
        const overlay = document.getElementById('overlay');

        // Kiểm tra xem các phần tử có tồn tại không
        if (!codForm || !vnpayForm || !overlay) {
            console.error('Một hoặc nhiều phần tử không tồn tại!');
            return;
        }

        // Hiển thị overlay và khóa cuộn trang
        overlay.style.display = 'block';



    }
}

// Hàm hiển thị thông báo lỗi dưới các trường
function showError(fieldId, message) {
    var errorElement = document.createElement('div');
    errorElement.classList.add('error-message');
    errorElement.textContent = message;

    var field = document.getElementById(fieldId);
    field.classList.add('error');
    field.parentNode.appendChild(errorElement);
}

// Hàm ẩn tất cả thông báo lỗi
function hideErrorMessages() {
    var errorElements = document.querySelectorAll('.error-message');
    errorElements.forEach(function(element) {
        element.remove();
    });

    var fields = document.querySelectorAll('.error');
    fields.forEach(function(field) {
        field.classList.remove('error');
    });

    document.getElementById('error-message').style.display = 'none'; // Ẩn thông báo lỗi chung
}

// Thêm sự kiện cho nút Đặt hàng
function submitOrder() {
    // Lấy giá trị của phương thức thanh toán đã chọn
    var paymentMethod = document.querySelector('input[name="payment"]:checked');
    console.log("Phương thức đã chọn:", paymentMethod);

    if (!paymentMethod) {
        document.getElementById('error-message').style.display = 'block';
        return;
    }

    paymentMethod = paymentMethod.value;

    // Tạo URL với tham số phương thức thanh toán
    var url = "confirmation?paymentMethod=" + paymentMethod;

    // Chuyển hướng người dùng đến URL với tham số
    window.location.href = url;
}

function  closeModals(){
    document.getElementById("delete-modal").style.display = "none";
}

function confirmValid() {
    window.location.href = "turn-page?action=cart";
}

function showInventoryWarning(productId, availableQuantity) {
    $('#productId').val(productId);
    $('#inventory-warning-msg').text("Số lượng sản phẩm mua đã vượt mức hàng tồn kho!");

    // Cập nhật số lượng còn lại
    $('#inventory-left').text("Chỉ còn lại " + availableQuantity + " sản phẩm trong kho.");

    $('#delete-modal').show();
}

function checkInventoryAllItems() {
    placeOrder();
    const cartItems = document.querySelectorAll('.cart-item');

    cartItems.forEach(item => {
        const productId = item.dataset.productId;
        const quantity = item.dataset.quantity;
        console.log("Sản phẩm", productId);
        console.log("So luognw", quantity);

        $.ajax({
            url: 'check-inventory',
            type: 'Get',
            data: {
                productId: productId,
                quantity: quantity
            },
            success: function(response) {
                if (response.status === 'success') {
                    submitOrder();
                } else {
                    //thì mở model lên
                    showInventoryWarning(productId, response.availableQuantity);
                }
            }
        });
    });
}

