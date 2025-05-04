document.addEventListener("DOMContentLoaded", function () {
    document.getElementById('message').style.display = 'none'; // Ẩn thông báo khi vừa load
    loadDataProduct();
    // Gắn sự kiện cho nút Thoát
    const closeModalButtons = document.querySelectorAll(".close-modal");
    closeModalButtons.forEach(btn => {
        btn.addEventListener("click", function () {
            closeModalEdit();
            closeModalAdd();
            closeModalDelete();
        });
    });
});

// Khởi tạo DataTable một lần khi trang được load
$(document).ready(function() {
    // Kiểm tra nếu DataTable chưa được khởi tạo
    if (!$.fn.dataTable.isDataTable('#productTable')) {
        $('#productTable').DataTable({
            paging: true,         // Hiển thị phân trang
            searching: true,      // Hiển thị ô tìm kiếm
            ordering: true,       // Cho phép sắp xếp cột
            info: true,           // Hiển thị thông tin số lượng dữ liệu
            lengthMenu: [10, 25, 50, 100], // Số dòng hiển thị mỗi trang
            language: {
                lengthMenu: "Hiển thị _MENU_ sản phẩm mỗi trang",
                zeroRecords: "Không tìm thấy sản phẩm nào",
                info: "Trang _PAGE_ trên tổng _PAGES_ trang",
                infoEmpty: "Không có sản phẩm",
                infoFiltered: "(lọc từ _MAX_ sản phẩm)",
                search: "Tìm kiếm:",
                paginate: {
                    first: "Đầu", last: "Cuối", next: "Tiếp", previous: "Trước"
                }
            }
        });
    }
});


// load data website.
function loadDataProduct() {
    $.ajax({
        url: "products-list", type: "GET",

        success: function (data) {
            fetchDataP(data);
            console.log(data);
        }, error: function (xhr, status, error) {
            console.error("Lỗi AJAX:", error);
            alert("Lỗi kết nối đến server.");
        }
    });

    function fetchDataP(data) {
        const tableBody = document.querySelector("#productTable tbody");
        tableBody.innerHTML = ""; // Xóa dữ liệu hiện tại trong bảng

        data.forEach(product => {
            let formattedDate = "";
            if (product.createDate) {
                formattedDate = formatDateAMPM(product.createDate);
            }
            const row = document.createElement("tr");
            row.innerHTML = `
            <td><img src="${product.imageUrl}" alt="${product.name}" width="50"></td>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price.toLocaleString()}₫</td>
            <td>${product.quantity}</td>
            <td>${product.status}</td>
            <td>${formattedDate}</td>
            <td class="v">
                <button type="button" onclick="openModalEdit(${product.id}, '${product.name}' , '${product.price}' , 
                '${product.categoryId}','${product.discountPercent/100}','${product.supplier}','${product.size}' , '${product.color}',
                '${product.unit}','${product.description}','${product.imageUrl}')">Sửa </button>
                <button id="deleteBtn" class="btn-delete" onclick="openModalDelete(${product.id})" >Xóa</button>
            </td>
        `;
            tableBody.appendChild(row);
        });

        // Làm mới lại DataTable sau khi cập nhật dữ liệu
        const table = $('#productTable').DataTable();
        table.clear();  // Xóa tất cả các hàng cũ
        table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới
        table.draw();  // Vẽ lại bảng
    }

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

// ----------------------------------------------------------------------------------------------------------
//  Thêm sản phẩm
function openModalAdd(id) {
    document.getElementById('addProductModal').style.display = "block";
    document.getElementById('producttId').value = id;
}

document.getElementById('addProductForm').addEventListener("submit", function (event) {
    event.preventDefault();
    // Tạo FormData để gửi các dữ liệu của form (bao gồm cả ảnh)
    var formData = new FormData(this); // lấy trực tiếp từ form
    formData.append("id", document.getElementById('producttId').value);
    formData.append("name", document.getElementById('productName').value);
    formData.append("price", document.getElementById('productPrice').value);
    formData.append("categoryId", document.getElementById('productCategory').value);
    formData.set("discountPercent", document.getElementById('discountPercent').value);
    formData.append("supplier", document.getElementById('npp').value);
    formData.append("size", document.getElementById('size').value);
    formData.append("color", document.getElementById('color').value);
    formData.append("unit", document.getElementById('unit').value);
    formData.append("minimumQuantity", document.getElementById('minimumQuantity').value);
    formData.append("maximumQuantity", document.getElementById('maximumQuantity').value);
    formData.append("description", document.getElementById('description').value);

    // Lấy giá trị từ input file ảnh
    var productImage = document.getElementById("productImage");
    if (productImage.files.length > 0) {
        formData.append("productImage", productImage.files[0]);
    }

    $.ajax({
        url: "add-product",
        type: "POST",
        data: formData,
        processData: false, // Quan trọng: không xử lý dữ liệu tự động
        contentType: false, // Quan trọng: không đặt header content-type
        success: function (response) {
            if (response.error) {
                document.getElementById('message').innerHTML = response.message;
                closeModalAdd();
                showAlert(); // Hiển thị thông báo
            } else {
                document.getElementById('message').innerHTML = response.message;
                closeModalAdd();
                showAlert(); // Hiển thị thông báo
                loadDataProduct();
            }
        },
        error: function (xhr, status, error) {
            // Xử lý lỗi nếu có trong quá trình gửi request
            console.log("Error: " + status + " " + error);
        }
    });
});

function closeModalAdd() {
    document.getElementById('addProductModal').style.display = "none";
}


// ----------------------------------------------------------------------------------------------------------

//Sửa sản phẩm
function openModalEdit(id, name, price, categoryId, discountPercent, supplier, size, color, unit, description, imageUrl) {
    document.getElementById('editProductModal').style.display = "block";
    document.getElementById('productId').value = id;
    document.getElementById('productNameEdit').value = name;
    document.getElementById('productPriceEdit').value = price;
    document.getElementById('productCategoryEdit').value = categoryId;
    document.getElementById('discountPercentEdit').value = discountPercent;
    document.getElementById('nppEdit').value = supplier;
    document.getElementById('sizeEdit').value = size;
    document.getElementById('colorEdit').value = color;
    document.getElementById('unitEdit').value = unit;
    document.getElementById('descriptionEdit').value = description;

    if (imageUrl) {
        var imageElement = document.getElementById('currentImage');
        imageElement.src = imageUrl;  // Đường dẫn ảnh cũ
        imageElement.style.display = 'block'; // Hiển thị ảnh
        document.getElementById('currentImageUrl').value = imageUrl; // Lưu đường dẫn ảnh cũ vào input hidden
    }
}

function closeModalEdit() {
    document.getElementById('editProductModal').style.display = "none";
}

document.getElementById('editProductForm').addEventListener("submit", function (event) {
    event.preventDefault();
    // Tạo FormData để gửi các dữ liệu của form (bao gồm cả ảnh)
    var formData = new FormData();
    const discountPercentEdit = document.getElementById('discountPercentEdit').value;
    formData.append("id", document.getElementById('productId').value);
    formData.append("name", document.getElementById('productNameEdit').value);
    formData.append("price", document.getElementById('productPriceEdit').value);
    formData.append("categoryId", document.getElementById('productCategoryEdit').value);
    formData.append("discountPercent", discountPercentEdit);
    formData.append("supplier", document.getElementById('nppEdit').value);
    formData.append("size", document.getElementById('sizeEdit').value);
    formData.append("color", document.getElementById('colorEdit').value);
    formData.append("unit", document.getElementById('unitEdit').value);
    formData.append("description", document.getElementById('descriptionEdit').value);

    // Nếu có ảnh mới, đính kèm tệp ảnh vào formData

    var imageFile = document.getElementById('productImageEdit').files[0];
    if (imageFile) {
        formData.append("imageUrl", imageFile);  // Nếu có file mới
    } else {
        // Gửi URL ảnh cũ nếu không có ảnh mới
        formData.append("currentImageUrl", document.getElementById("currentImageUrl").value);
    }

    $.ajax({
        url: "edit-product", type: "POST", data: formData, processData: false, // Quan trọng: không xử lý dữ liệu tự động
        contentType: false, // Quan trọng: không đặt header content-type
        success: function (response) {
            if (response.error) {
                document.getElementById('message').innerHTML = response.message;
                closeModalEdit();
                showAlert(); // show thong boa
            } else {
                document.getElementById('message').innerHTML = response.message;
                closeModalEdit();
                showAlert(); // show thong boa
                loadDataProduct();
            }
        }
    })
})

// -----------------------------------------Xóa--------------------------------
function openModalDelete(id) {
    document.getElementById('deleteModal').style.display = "block";
    document.getElementById('productsId').value = id;
}

function confirmDelete() {
    const productId = document.getElementById('productsId').value;
    $.ajax({
            url: "delete-product",
            type: "GET",
            data: {id: productId},
            success: function (response) {
                if (response.error) {
                    document.getElementById('message').innerHTML = response.message;
                    closeModalDelete();
                    showAlert(); // show thong boa
                } else {
                    document.getElementById('message').innerHTML = response.message;
                    closeModalDelete();
                    showAlert(); // show thong boa
                    loadDataProduct();
                }
            }
        }
    )
}
function closeModalDelete() {
    document.getElementById('deleteModal').style.display = "none";
}