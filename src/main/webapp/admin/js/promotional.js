document.addEventListener('DOMContentLoaded', function () {
    // Lấy tất cả các nút xóa
    const deleteButtons = document.querySelectorAll('.delete-btn');

    // Hàm hiển thị modal
    function showModal(modalId) {
        const modal = document.getElementById(modalId);
        modal.style.display = 'block';
    }

    function formatDateForInput(dateStr) {
        let parts = dateStr.split(' '); // Tách ngày và giờ
        let dateParts = parts[0].split('-'); // Tách ngày-tháng-năm
        return `${dateParts[2]}-${dateParts[1]}-${dateParts[0]}T${parts[1]}`; // Định dạng yyyy-MM-ddTHH:mm
    }


    // Xử lý khi nhấn "Xóa" trong modal
            const confirmDeleteButton = document.querySelector('.confirm-delete');
            document.querySelectorAll('.delete-btn').forEach(function(button) {
                button.addEventListener('click', function(e) {
                    e.preventDefault(); // Ngăn chặn hành động mặc định (như điều hướng lại trang)
                    showModal('delete-modal');
                    const promotionId = this.getAttribute('data-id'); // Lấy ID từ thuộc tính data-id
                    const url = `delete-promotional?id=${promotionId}`; // Đường dẫn xóa tài khoản kèm ID

                    confirmDeleteButton.addEventListener('click', function() {
                        window.location.href = url; // Chuyển hướng đến URL xóa tài khoản
                    });
                });
            });
            // ---------------------------------------------------------Form Edit Information -----------------------------------------------------
            document.querySelectorAll('.edit-btn').forEach(function(button) {
                button.addEventListener('click', function(e) {
                    e.preventDefault(); // Ngăn chặn hành động mặc định
                    showModal('editPromotional');

                    const promotionId = this.getAttribute('data-up-id');
                    document.getElementById('promotionId').value = promotionId;

                    const row = this.closest('tr');
                    const value = row.querySelector('#value').textContent.trim().replace('đ', '').replace(',', '');
                    const startDate = row.querySelector('#sdate').textContent.trim();
                    const endDate = row.querySelector('#edate').textContent.trim();

                    document.getElementById('percent').value = value;
                    document.getElementById('startDate').value = formatDateForInput(startDate);
                    document.getElementById('endDate').value = formatDateForInput(endDate);
                });
            });


    // Đóng tất cả các modal khi nhấn nút đóng
    const closeButtons = document.querySelectorAll('.close-modal');
    closeButtons.forEach(button => {
        button.addEventListener('click', closeModal);
    });
    // Hàm đóng modal
    function closeModal() {
        const modals = document.querySelectorAll('.modal');
        modals.forEach(modal => modal.style.display = 'none');
    }

});

//Thêm sản phẩm
const addPromotions = document.getElementById('add_Promotions');
const addPro = document.getElementById('addPromotionModal')

addPromotions.addEventListener('click', () => {
    addPro.style.display = 'flex';
});