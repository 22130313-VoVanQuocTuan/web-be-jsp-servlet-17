
//------------------------------------------------- Hàm hiển thị chi tiết hóa đơn----------------------------------------------------
function showOrderDetail() {
    // Mở modal
    document.getElementById('orderDetailModal').style.display = "block";
}
// Hàm đóng modal
function closeModal() {
    document.getElementById('orderDetailModal').style.display = "none";
}

// Đóng modal khi click ra ngoài modal
window.onclick = function (event) {
    const modal = document.getElementById('orderDetailModal');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
// ---------------------------------------------------------Form Edit Information -----------------------------------------------------
// Mở modal
function openModal1() {
    console.log("Modal mở");
    document.getElementById('editInformationModal').style.display = 'block';
}

// Đóng modal
function closeModal1() {
    console.log("Modal đóng");
    document.getElementById('editInformationModal').style.display = 'none';
}


// Xử lý lưu thay đổi
document.getElementById('saveChanges').addEventListener('click', function () {
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const address = document.getElementById('address').value;

    // Xử lý hoặc lưu thông tin ở đây
    console.log('Thông tin đã được cập nhật:', { name, email, phone, address });

    // Đóng modal
    closeModal1();

    // Thông báo cho người dùng
    alert('Thông tin cá nhân đã được cập nhật!');
});
