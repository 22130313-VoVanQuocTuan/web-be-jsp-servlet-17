// lấy các phần tử
const closeModalBtns = document.querySelectorAll(".close-modal");
const deleteBtn = document.getElementById('deleteBtn');
const deleteModal = document.getElementById('deleteModal');
const confirmDeleteBtn = document.getElementById('confirmDelete');
// hiển modal "Xóa"
deleteBtn.addEventListener('click', () => {
    deleteModal.style.display = 'flex';
});
// xác nhận xóa
confirmDeleteBtn.addEventListener('click', () => {
    deleteModal.style.display = 'none';
});
// đóng modal
closeModalBtns.forEach(btn => {
    btn.addEventListener("click", () => {
        deleteModal.style.display = "none";  // Đóng modal đúng
    });
});

// ----------------------------------------------------------------------------------------------------------
//  Thêm sản phẩm
const addProductbtn = document.getElementById("add-product");
const addProductModal = document.getElementById("addProductModal");
const saveProductbtn = document.getElementById("save-Product1");
const toast = document.getElementById("toast")
// => hiển thị modal
addProductbtn.addEventListener("click", () => {
    addProductModal.style.display = "flex";
});
// Xử lý sự kiện khi nhấn "Lưu sản phẩm"
saveProductbtn.addEventListener("click", (event) => {
    event.preventDefault(); // Ngăn chặn hành vi gửi form mặc định
    // Hiển thị thông báo thành công
    toast.classList.add("show");
    // Ẩn thông báo sau 3 giây
    setTimeout(() => {
        toast.classList.remove("show");
    }, 3000);
    // Đóng modal sau khi lưu sản phẩm
    addProductModal.style.display = "none";
});

// ----------------------------------------------------------------------------------------------------------

//Sửa sản phẩm
const editProductbtn = document.getElementById("edit-product");
const editProductModal = document.getElementById("editProductModal");
const saveProductBtn = document.getElementById("save_Product");
// Mở modal thêm sản phẩm
editProductbtn.addEventListener("click", () => {
    addProductModal.style.display = "flex";
});
// Xử lý sự kiện khi nhấn "Lưu sản phẩm"
saveProductBtn.addEventListener("click", (event) => {
    event.preventDefault(); // Ngăn chặn hành vi gửi form mặc định
    editProductModal.style.display = "none";
});