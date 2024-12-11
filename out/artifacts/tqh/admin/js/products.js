// lấy các phần tử
const addDetailBtns = document.querySelectorAll("#add_detail");
const modal = document.getElementById("detail_modal");
const closeModalBtns = document.querySelectorAll(".close-modal, #update_detail");

const deleteBtn = document.getElementById('deleteBtn');
const deleteModal = document.getElementById('deleteModal');
const confirmDeleteBtn = document.getElementById('confirmDelete');


// hiển modal "Xóa"
deleteBtn.addEventListener('click', () => {
       deleteModal.style.display = 'flex'; 
});
// xác nhận xóa đóng modal
confirmDeleteBtn.addEventListener('click', () => {
    deleteModal.style.display = 'none';
});
// ---------------------------------------------------------------------------
// mở modal chi tiết snar phẩm
addDetailBtns.forEach(btn => {
    btn.addEventListener("click", () => {
        modal.style.display = "flex";
    });
});

// đóng modal
closeModalBtns.forEach(btn => {
    btn.addEventListener("click", () => {
        modal.style.display = "none";
        deleteModal.style.display = 'none';
    });
});

// Handle "Cập nhật chi tiết" logic here
document.getElementById("update_detail").addEventListener("click", () => {
    // hiển thị thông báo thành công
    const toast = document.getElementById("toast");
    toast.classList.add("show"); 

    // hiển thị thông báo trong 3 giây
    setTimeout(() => {
        toast.classList.remove("show"); 
    }, 3000); 

    // đóng modal chi tiết
    const modal = document.getElementById("detail_modal");
    modal.style.display = "none";
});
// ----------------------------------------------------------------------------------------------------------

// Thêm sản phẩm 
const addProductModal1 = document.getElementById("addProductModal");
const saveProductBtn1 = document.getElementById("save_Product");
const closeModalBtns1 = document.querySelectorAll(".close_modal");
const toast = document.getElementById("toast");

// Mở modal thêm sản phẩm
document.getElementById("add_product").addEventListener("click", () => {
    addProductModal1.style.display = "flex";
});

// Đóng modal khi nhấn nút thoát
closeModalBtns1.forEach(btn => {
    btn.addEventListener("click", () => {
        addProductModal1.style.display = "none";
    });
});

// Xử lý sự kiện khi nhấn "Lưu sản phẩm"
saveProductBtn1.addEventListener("click", (event) => {
    event.preventDefault(); // Ngăn chặn hành vi gửi form mặc định

    // Hiển thị thông báo thành công
    toast.classList.add("show");

    // Ẩn thông báo sau 3 giây
    setTimeout(() => {
        toast.classList.remove("show");
    }, 3000);

    // Đóng modal sau khi lưu sản phẩm
    addProductModal1.style.display = "none";
});
// ----------------------------------------------------------------------------------------------------------

//Sửa sản phẩm 
const editProductModal2 = document.getElementById("editProductModal");
const saveProductBtn2 = document.getElementById("save_Product2");
const closeModalBtns2 = document.querySelectorAll(".close_modal2");

// Mở modal thêm sản phẩm
document.getElementById("edit_product").addEventListener("click", () => {
    editProductModal2.style.display = "flex";
});

// Đóng modal khi nhấn nút thoát
closeModalBtns2.forEach(btn => {
    btn.addEventListener("click", () => {
        editProductModal2.style.display = "none";
    });
});

// Xử lý sự kiện khi nhấn "Lưu sản phẩm"
saveProductBtn2.addEventListener("click", (event) => {
    event.preventDefault(); // Ngăn chặn hành vi gửi form mặc định
    

    // Hiển thị thông báo thành công
    toast.classList.add("show");

    // Ẩn thông báo sau 3 giây
    setTimeout(() => {
        toast.classList.remove("show");
    }, 3000);

    // Đóng modal sau khi lưu sản phẩm
    editProductModal2.style.display = "none";
});