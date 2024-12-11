document.addEventListener('DOMContentLoaded', function () {
    // Lấy tất cả các nút chỉnh sửa và xóa
    const editButtons = document.querySelectorAll('.edit-btn');
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

    // Khi nhấn vào nút chỉnh sửa
    editButtons.forEach(button => {
        button.addEventListener('click', function () {
            const row = button.closest('tr');
            const username = row.children[0].textContent;
            const email = row.children[1].textContent;

            // Điền thông tin vào modal chỉnh sửa
            document.getElementById('edit-username').value = username;
            document.getElementById('edit-email').value = email;

            // Lấy giá trị data-id của nút đã nhấn
            const id = button.getAttribute('data-id');
            console.log("button thứ :" + id); // In ra ID, ví dụ: "1"

            // Hiển thị modal chỉnh sửa
            showModal('edit-modal');
        });
    });

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
