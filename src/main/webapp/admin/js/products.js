// lấy các phần tử
const closeModalBtns = document.querySelectorAll(".close-modal");
const deleteBtns = document.querySelectorAll("#deleteBtn");
const deleteModal = document.getElementById('deleteModal');
const confirmDeleteBtn = document.getElementById('confirmDelete');
let productIdToDelete = null;  // Biến để lưu id sản phẩm cần xóa
// Hiển thị modal "Xóa"
deleteBtns.forEach(deleteBtn => {
    deleteBtn.addEventListener('click', (e) => {
        productIdToDelete = e.target.getAttribute('data-product-id');  // Lấy id sản phẩm từ data-product-id
        deleteModal.style.display = 'flex';  // Hiển thị modal
    });
});
// xác nhận xóa
confirmDeleteBtn.addEventListener('click', () => {
    if (productIdToDelete) {
        window.location.href = `/tqh/delete-product?id=${productIdToDelete}`;  // Gửi yêu cầu xóa đến controller
    }
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

const alert = document.querySelector(".alert");
if (alert) {
    alert.style.display = "block";  // Hiển thị thông báo
    setTimeout(() => {
        alert.style.display = "none";  // Ẩn thông báo sau 3 giây
    }, 3000);
}
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