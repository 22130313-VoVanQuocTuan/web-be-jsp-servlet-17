document.addEventListener("DOMContentLoaded", function () {
    document.getElementById('message').style.display = 'none'; // Ẩn thông báo khi vừa load
    loadDataCategory();
    // Gắn sự kiện cho nút Thoát
    const closeModalButtons = document.querySelectorAll(".close-modal");
    closeModalButtons.forEach(btn => {
        btn.addEventListener("click", function () {
            closeModalDeleteCate();
        });
    });
});
$(document).ready(function () {
    $('#categoryTable').DataTable({
        "lengthMenu": [5, 10, 15, 20],
        "language": {
            "search": "Tìm kiếm:",
            "lengthMenu": "Hiển thị _MENU_ danh mục",
            "info": "Trang _PAGE_ trên tổng _PAGES_ trang",
            "paginate": {
                "first": "Đầu",
                "last": "Cuối",
                "next": ">",
                "previous": "<"
            },
            "zeroRecords": "Không tìm thấy danh mục nào",
            "infoEmpty": "Không có danh mục nào để hiển thị",
            "infoFiltered": "(Lọc từ _MAX_ danh mục)",
        }
    });
});

function loadDataCategory() {
    $.ajax({
        url: "category", type: "GET",
        success: function (data) {
            fetchDataC(data);
            console.log(data);
        }, error: function (xhr, status, error) {
            console.error("Lỗi AJAX:", error);
            alert("Lỗi kết nối đến server.");
        }
    });

    function fetchDataC(data) {
        const tableBody = document.querySelector("#categoryTable tbody");
        tableBody.innerHTML = ""; // Xóa dữ liệu hiện tại trong bảng

        data.forEach(category => {
            let formattedDate = "";
            if (category.createDate) {
                formattedDate = formatDateAMPM(category.createDate);
            }
            const row = document.createElement("tr");
            row.innerHTML = `
                        <tr>
                            <td>${category.id}</td>
                            <td>${category.name}</td>
                            <td>${formattedDate}</td>
                            <td>
                                <div class="v">
                                    <button class="delete-btn" onclick="openModalDeleteCate(${category.id})" >Xóa</button>
                                </div>
                            </td>
                      </tr>
                     `;
            tableBody.appendChild(row);
        });
        // Làm mới lại DataTable sau khi cập nhật dữ liệu
        const table = $('#categoryTable').DataTable();
        table.clear();  // Xóa tất cả các hàng cũ
        table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới
        table.draw();  // Vẽ lại bảng

        // Hàm format AM/PM chuẩn
        function formatDateAMPM(dateStr) {
            const date = new Date(dateStr);
            const day = String(date.getDate()).padStart(2, '0');
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const year = date.getFullYear();

            let hours = date.getHours();
            const minutes = String(date.getMinutes()).padStart(2, '0');
            const seconds = String(date.getSeconds()).padStart(2, '0');
            const ampm = hours >= 12 ? 'PM' : 'AM';

            hours = hours % 12;
            hours = hours ? hours : 12; // 0 giờ thì là 12 AM
            const strHours = String(hours).padStart(2, '0');

            return `${day}-${month}-${year} ${strHours}:${minutes}:${seconds} ${ampm}`;
        }
    }
}

// Thêm danh mục
document.getElementById('addCategoryForm').addEventListener("submit", function (event) {
    event.preventDefault();
    const name = document.getElementById('categoryName').value;

    // Gửi AJAX request để thêm danh mục
    $.ajax({
        url: "add-category",
        type: "POST",
        data: { name: name },  // Chỉ gửi tên danh mục
        dataType: "json",
        success: function (response) {
            console.log("Server response:", response);
            // Kiểm tra phản hồi từ server
            if (response.error) {
                document.getElementById('message').innerHTML = response.message;
                showAlert();
            } else {
                document.getElementById('message').innerHTML = response.message;
                showAlert();
                document.getElementById('categoryName').value = '';
                loadDataCategory();
            }
        },
        error: function (xhr, status, error) {
            console.log("AJAX Error: " + status + " " + error);
            document.getElementById('message').innerHTML = "Có lỗi xảy ra trong quá trình gửi yêu cầu.";
            showAlert();
        }
    });
});

// ----------------------------------- Xóa --------------------------

function openModalDeleteCate(id) {
    document.getElementById('delete-modal').style.display = "block";
    document.getElementById('categoryId').value = id;
}

function confirmDeleteCategory() {
    const categoryId = document.getElementById('categoryId').value;
    $.ajax({
        url: "delete-category",
        type: "POST",
        data: {id: categoryId},
        success: function (response) {
            if (response.error) {
                document.getElementById('message').innerHTML = response.message;
                closeModalDeleteCate();
                showAlert();
            } else {
                document.getElementById('message').innerHTML = response.message;
                closeModalDeleteCate();
                showAlert();
                loadDataCategory();
            }
        }
    })
}

// Hàm đóng modal
function closeModalDeleteCate() {
    document.getElementById('delete-modal').style.display = "none";
}

