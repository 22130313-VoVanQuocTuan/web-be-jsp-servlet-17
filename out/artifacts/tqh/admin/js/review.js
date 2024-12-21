document.addEventListener('DOMContentLoaded', function () {
    // Lấy tất cả các nút xóa
    const deleteButtons = document.querySelectorAll('.delete-btn');

    // Hàm hiển thị modal
    function showModal(modalId) {
        const modal = document.getElementById(modalId);
        modal.style.display = 'block';
    }

    // Hàm đóng modal
    function closeModal() {
        const modals = document.querySelectorAll('.modal');
        modals.forEach(modal => modal.style.display = 'none');
    }

    //  Khi nhấn vào nút xóa
    deleteButtons.forEach(button => {
        button.addEventListener('click', function () {
            const row = button.closest('tr');
            const id = button.getAttribute('data-id');
            // Hiển thị modal xóa
            showModal('delete-modal');

            // Xử lý khi nhấn "Xóa" trong modal
            const confirmDeleteButton = document.querySelector('.confirm-delete');
            confirmDeleteButton.onclick = function () {
                // Xóa dòng khỏi bảng
                row.remove();  // Xóa dòng tương ứng trong bảng
                closeModal();  // Đóng modal sau khi xóa
                console.log('Xóa tài khoản với ID:', id);  // Hiển thị ID bị xóa
            };
        });
    });


    // Đóng tất cả các modal khi nhấn nút đóng
    const closeButtons = document.querySelectorAll('.close-modal');
    closeButtons.forEach(button => {
        button.addEventListener('click', closeModal);
    });
});
