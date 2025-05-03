// account.js

// Hàm để lấy và hiển thị thông tin khách hàng
function loadCustomerInfo() {
    $.ajax({
        url: 'informationCustomer',
        type: 'GET',
        success: function(data) {

            // Lấy thông tin khách hàng từ data.info
            var customerInfo = data.info;
            console.log(customerInfo);
            // Cập nhật nội dung HTML
            $('.customer-info p:nth-of-type(1)').html('<strong>Tên:</strong> ' + customerInfo.fullName);
            $('.customer-info p:nth-of-type(2)').html('<strong>Email:</strong> ' + customerInfo.email);
            $('.customer-info p:nth-of-type(3)').html('<strong>Số điện thoại:</strong> ' + customerInfo.phoneNumber);
            $('.customer-info p:nth-of-type(4)').html('<strong>Địa chỉ:</strong> ' + customerInfo.address);
            $('.customer-info p:nth-of-type(5)').html('<strong>Vai trò:</strong> ' + customerInfo.role);
            $('.customer-info p:nth-of-type(6)').html('<strong>Trạng thái:</strong> ' + customerInfo.status);
        },
        error: function(xhr, status, error) {
            console.error('Lỗi:', error);
            alert('Không thể tải thông tin khách hàng. Vui lòng thử lại sau.');
        }
    });
}

// Gọi hàm khi trang được tải
$(document).ready(function() {
    loadCustomerInfo();
});

// Hàm để mở modal và điền dữ liệu hiện tại (tùy chọn)
function openModal1() {
    $('#editInformationModal').show();
    // Tùy chọn: Điền dữ liệu hiện tại vào form
    $.ajax({
        url: 'informationCustomer',
        type: 'GET',

        success: function(data) {
            var customerInfo = data.info;
            $('#name').val(customerInfo.fullName);
            $('#phone').val(customerInfo.phoneNumber);
            $('#address').val(customerInfo.address);
        },
        error: function(xhr, status, error) {
            console.error('Lỗi khi lấy thông tin:', error);
            alert('Không thể tải thông tin để chỉnh sửa.');
        }
    });
}

// Hàm để đóng modal
function closeModal1() {
    $('#editInformationModal').hide();
    $('#editInfoForm')[0].reset(); // Xóa dữ liệu trong form
}

// Xử lý submit form qua AJAX
$(document).ready(function() {
    $('#editInfoForm').on('submit', function(event) {
        event.preventDefault(); // Ngăn submit form mặc định

        $.ajax({
            url: 'update-info',
            type: 'POST',
            data: $(this).serialize(), // Lấy dữ liệu từ form

            success: function(response) {
                if (response.message) {
                   document.getElementById("message").innerHTML = response.message;
                   showAlert()
                    closeModal1(); // Đóng modal
                    loadCustomerInfo(); // Tải lại thông tin khách hàng
                } else {
                    document.getElementById("message").innerHTML = response.message;
                    showAlert();
                    closeModal1();
                }
            },
            error: function(xhr, status, error) {
                console.error('Lỗi:', error);

            }
        });
    });
});