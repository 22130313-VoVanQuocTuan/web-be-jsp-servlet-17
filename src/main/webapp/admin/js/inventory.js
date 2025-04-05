

document.addEventListener("DOMContentLoaded", function () {
    loadInventory();
    fetchInventory();
    updateStatusColors();
    fetchInventoryNeedImport();
    document.getElementById("importQuantitys").addEventListener("input", checkQuantityExport);
    document.getElementById("importQuantity").addEventListener("input", checkQuantityImport);
    document.getElementById("importQuantitysss").addEventListener("input", validateInputs);
    document.getElementById("importQuantityMin").addEventListener("input", validateInputs);
    document.getElementById("importQuantityMax").addEventListener("input", validateInputs);
});

// cập nhật trạng thái theo màu
function updateStatusColors() {
    document.querySelectorAll(".status")?.forEach(status => {
        let text = status.textContent.trim();
        let colorMap = {
            "Còn hàng": "#00d23c",
            "Hết hàng": "#ff3a3a",
            "Sắp hết hàng": "rgb(255 155 2)",
            "Kho quá tải": "#ff0000"
        };

        if (colorMap[text]) {
            status.style.backgroundColor = colorMap[text];
            status.style.color = "white";
            status.style.padding = "3px 5px";
            status.style.borderRadius = "5px";
        }
    });
}


function openImportModal(productId, productName, quantity) {
    // Hiển thị modal nhập kho
    document.getElementById("importModal").style.display = "block";
    document.getElementById("productId").value = productId;
    document.getElementById("productNames").value = productName;
    document.getElementById("quantityPresent").value = quantity;
}

function openExportModal(productId, productName) {
    // Hiển thị modal nhập kho
    document.getElementById("exportModal").style.display = "block";
    document.getElementById("productIds").value = productId;
    document.getElementById("productNamess").value = productName;
}


// nhập kho
function submitImport() {
    let productId = document.getElementById("productId").value;
    let quantity = document.getElementById("importQuantity").value;
    let note = document.getElementById("note").value;

    $.ajax({
        url: "importInventory",
        type: "POST",
        data: { productId: productId, quantity: quantity, note: note },
        success: function (response) {
            if (response.error) {
                // Hiển thị thông báo lỗi từ server nếu có
                document.getElementById("errorAlert").innerHTML = response.message;
                closeModalImport(); // Đóng modal sau khi thành công
                showAlert();
            } else {
                updateAllTables();
                closeModalImport(); // Đóng modal sau khi thành công
                document.getElementById("errorAlert").innerHTML = response.message;
                showAlert();
            }
        },
        error: function (xhr, status, error) {
            console.error("Lỗi AJAX:", error);
            document.getElementById("errorAlert").innerHTML = "Có lỗi xảy ra khi nhập kho.";
        }
    });
}

// Xuất lkho
function submitExport() {
    let productId = document.getElementById("productIds").value;
    let quantity = document.getElementById("importQuantitys").value;
    let note = document.getElementById("notes").value;

    $.ajax({
        url: "exportInventory",
        type: "POST",
        data: { productId: productId, quantity: quantity, note: note },
        success: function (response) {
            if (response.error) {
                // Hiển thị thông báo lỗi từ server nếu có
                document.getElementById("errorAlert").innerHTML = response.message;
                closeModalExport();
                showAlert();
            } else {
                updateAllTables();
                closeModalExport(); // Đóng modal sau khi thành công
                document.getElementById("errorAlert").innerHTML = response.message;
                showAlert();
            }
        },
        error: function (xhr, status, error) {
            console.error("Lỗi AJAX:", error);
            document.getElementById("errorAlert").innerHTML = "Có lỗi xảy ra khi xuất kho.";
        }
    });
}
function closeModalImport() {
    document.getElementById('importModal').style.display = "none";
    document.getElementById("importQuantity").value = "";
    document.getElementById("note").value = "";
    document.getElementById("error").value = "";
}

function closeModalExport() {
    document.getElementById('exportModal').style.display = "none";
    document.getElementById("importQuantitys").value = "";
    document.getElementById("notes").value = "";
    document.getElementById("error").value = "";
}

function closeModalUpdateInventory() {
    document.getElementById('updateQuantityModal').style.display = "none";
    document.getElementById("error").value = "";
    document.getElementById("importQuantitysss").value = "";
    document.getElementById("importQuantityMin").value = "";
    document.getElementById("importQuantityMax").value = "";
}


// Hàm để gọi AJAX và lấy danh sách sản phẩm ko bán được
function fetchInventory() {
    // Lấy giá trị ngày từ dropdown
    const days = document.getElementById("days").value;

    // Gửi yêu cầu AJAX tới Servlet
    fetch(`unsold_products?date=${days}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => response.json())  // Chuyển đổi phản hồi JSON
        .then(data => {
            // Xử lý dữ liệu trả về từ Servlet và cập nhật bảng
            updateInventoryTable(data);

        })
        .catch(error => console.error('Error:', error));
}

// Khởi tạo DataTable một lần khi trang tải
$(document).ready(function () {
 $('#inventoryTableUnsold').DataTable({
        paging: true,
        searching: true,
        ordering: true,
        info: true,
        lengthMenu: [5, 10, 25, 50],
        language: {
            search: "Tìm kiếm:",
            lengthMenu: "Hiển thị _MENU_ dòng",
            info: "Trang _PAGE_ trên tổng _PAGES_ trang",
            zeroRecords: "Không tìm thấy kết quả",
            infoEmpty: "Không có dữ liệu",
            paginate: {
                first: "Đầu",
                last: "Cuối",
                next: "Tiếp",
                previous: "Trước"
            }
        },
        columnDefs: [{ targets: 6, orderable: false }]
    });
    // Gọi lại hàm cập nhật màu sắc cho trạng thái khi DataTable vẽ lại bảng (chuyển trang, tìm kiếm, sắp xếp)
    $('#inventoryTableUnsold').on('draw.dt', function () {
        updateStatusColors();
    });
});

function updateInventoryTable(inventoryList) {
    const tableBody = document.querySelector("#inventoryTableUnsold tbody");

    // Xóa dữ liệu cũ trong bảng chỉ khi cần
    tableBody.innerHTML = "";

    // Thêm dữ liệu mới vào bảng
    inventoryList.forEach(item => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${item.productId}</td>
            <td>${item.productName}</td>
            <td id="displayQuantity">${item.quantity}</td>
            <td id="displayMinQuantity">${item.minimumQuantity}</td>
            <td id="displayMaxQuantity">${item.maximumQuantity}</td>
            <td style="width: 134px;"><span class="status">${item.status}</span></td>
            <td class="v" style="display: flex">
                <button class="update-btn" onclick="updateQuantityInventory(${item.productId}, '${item.productName}', '${item.quantity}', '${item.minimumQuantity}', '${item.maximumQuantity}')">Sửa</button>
                <button class="btn btn-success" onclick="openImportModal(${item.productId}, '${item.productName}', '${item.quantity}')">Nhập kho</button>
                <button class="btn btn-success" onclick="openExportModal(${item.productId}, '${item.productName}')">Xuất kho</button>
            </td>
        `;
        tableBody.appendChild(row);
    });

    // Lấy DataTable hiện tại và vẽ lại bảng sau khi cập nhật dữ liệu
    var table = $('#inventoryTableUnsold').DataTable();
    table.clear();  // Xóa tất cả các hàng cũ
    table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới vào DataTable
    table.draw();  // Vẽ lại bảng
    updateStatusColors(); // Cập nhật màu sau khi tất cả dữ liệu được tải
}



// Hàm để gọi AJAX và lấy danh sách sản phẩm cần nhập kho
function fetchInventoryNeedImport() {

    // Gửi yêu cầu AJAX tới Servlet
    fetch(`import_need_products`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => response.json())  // Chuyển đổi phản hồi JSON
        .then(data => {
            // Xử lý dữ liệu trả về từ Servlet và cập nhật bảng
            updateInventoryTableNeedImport(data);

        })
        .catch(error => console.error('Error:', error));
}

// Hàm hiển thị sản phẩm cần nhập kho
function updateInventoryTableNeedImport(inventoryList) {
    const tableBody = document.querySelector("#inventoryTableImport tbody");
    tableBody.innerHTML = ""; // Xóa dữ liệu hiện tại trong bảng

    inventoryList.forEach(item => {
        const row = document.createElement("tr");
        row.innerHTML = `
                <td>${item.productId}</td>
                <td>${item.productName}</td>
                <td id="displayQuantity">${item.quantity}</td>
                <td id="displayMinQuantity">${item.minimumQuantity}</td>
                <td id="displayMaxQuantity">${item.maximumQuantity}</td>
                <td  style="width: 134px;"><span class="status">${item.status}</span></td>
                <td class="v" style="display: flex">
                 <button class="update-btn" onclick="updateQuantityInventory(${item.productId},
                                        '${item.productName}', '${item.quantity}', '${item.minimumQuantity}', '${item.maximumQuantity}')" >Sửa</button>
                  <button class="btn btn-success" onclick="openImportModal(${item.productId}, '${item.productName}', '${item.quantity}')">Nhập kho</button>
                    <button class="btn btn-success" onclick="openExportModal(${item.productId}, '${item.productName}')">Xuất kho</button>
                </td>
            `;
        tableBody.appendChild(row);
    });
    // Lấy DataTable hiện tại và vẽ lại bảng sau khi cập nhật dữ liệu
    var table = $('#inventoryTableImport').DataTable();
    table.clear();  // Xóa tất cả các hàng cũ
    table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới vào DataTable
    table.draw();  // Vẽ lại bảng
    updateStatusColors(); // Cập nhật màu sau khi tất cả dữ liệu được tải
}
$(document).ready(function () {
    $('#inventoryTableImport').DataTable({
        paging: true,
        searching: true,
        ordering: true,
        info: true,
        lengthMenu: [5, 10, 25, 50],
        language: {
            search: "Tìm kiếm:",
            lengthMenu: "Hiển thị _MENU_ dòng",
            info: "Trang _PAGE_ trên tổng _PAGES_ trang",
            zeroRecords: "Không tìm thấy kết quả",
            infoEmpty: "Không có dữ liệu",
            paginate: {
                first: "Đầu",
                last: "Cuối",
                next: "Tiếp",
                previous: "Trước"
            }
        },
        "columnDefs": [
            {
                "targets": 6,
                "orderable": false
            }

        ]
    });
    // Gọi lại hàm cập nhật màu sắc cho trạng thái khi DataTable vẽ lại bảng (chuyển trang, tìm kiếm, sắp xếp)
    $('#inventoryTableImport').on('draw.dt', function () {
        updateStatusColors();
    });
});







function checkQuantityExport() {
    let productId = document.getElementById("productIds").value; // Lấy mã sản phẩm
    let quantity = document.getElementById("importQuantitys").value; // Lấy số lượng xuất
    let errorElement = document.getElementById("error");
    const exportBt = document.getElementById("export");
    // Kiểm tra nếu productId và quantity hợp lệ
    if (!productId || !quantity) {
        errorElement.style.display = "inline"; // Hiển thị thông báo lỗi
        errorElement.textContent = "Thông tin không đầy đủ. Vui lòng nhập số lượng.";
        // Disable nút xác nhận khi có lỗi
        exportBt.disabled = true;
        exportBt.style.backgroundColor = "#8e8d87"
    } else {
        // Gửi yêu cầu AJAX đến backend để kiểm tra số lượng
        fetch("check_quantity", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `productId=${productId}&quantity=${quantity}`
        })
            .then(response => response.json()) // Chuyển đổi phản hồi thành JSON
            .then(data => {
                if (data.error) { // Nếu có lỗi trong phản hồi từ server
                    errorElement.style.display = "inline"; // Hiển thị thông báo lỗi
                    errorElement.textContent = data.error; // Hiển thị lỗi từ server
                    exportBt.disabled = true;
                    exportBt.style.backgroundColor = "#8e8d87"
                } else {
                    // Nếu số lượng hợp lệ, ẩn thông báo lỗi
                    errorElement.style.display = "none";
                    exportBt.disabled = false;
                    exportBt.style.backgroundColor = "#f7d774"
                }
            })
            .catch(error => {
                console.error("Có lỗi xảy ra khi kiểm tra số lượng:", error);
            });
    }
}


function checkQuantityImport() {
    let productId = document.getElementById("productId").value; // Lấy mã sản phẩm
    let quantity = document.getElementById("importQuantity").value; // Lấy số lượng nhập
    let errorElement = document.getElementById("errorImport");
    const importBt = document.getElementById("importBt");
    let quantityPresent = document.getElementById("quantityPresent").value;
    // Kiểm tra nếu productId và quantity hợp lệ

    if (!productId || !quantity) {
        errorElement.style.display = "inline"; // Hiển thị thông báo lỗi
        errorElement.textContent = "Thông tin không đầy đủ. Vui lòng nhập số lượng.";
        // Disable nút xác nhận khi có lỗi
        importBt.disabled = true;
        importBt.style.backgroundColor = "#8e8d87"
    } else {
        // Gửi yêu cầu AJAX đến backend để kiểm tra số lượng
        fetch("check_quantity_import", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `productId=${productId}&quantity=${quantity}&quantityPresent=${quantityPresent}`
        })
            .then(response => response.json()) // Chuyển đổi phản hồi thành JSON
            .then(data => {
                if (data.error) { // Nếu có lỗi trong phản hồi từ server
                    errorElement.style.display = "inline"; // Hiển thị thông báo lỗi
                    errorElement.textContent = data.error; // Hiển thị lỗi từ server
                    importBt.disabled = true;
                    importBt.style.backgroundColor = "#8e8d87"
                } else {
                    // Nếu số lượng hợp lệ, ẩn thông báo lỗi
                    errorElement.style.display = "none";
                    importBt.disabled = false;
                    importBt.style.backgroundColor = "#f7d774"
                }
            })
            .catch(error => {
                console.error("Có lỗi xảy ra khi kiểm tra số lượng:", error);
            });
    }
}

function updateQuantityInventory(productId, productName, quantity, minimumQuantity, maximumQuantity) {
    // Hiển thị modal nhập kho
    document.getElementById("updateQuantityModal").style.display = "block";
    document.getElementById("productIdss").value = productId;
    document.getElementById("productNamesss").value = productName;

    document.getElementById("importQuantitysss").value = quantity;

    document.getElementById("importQuantityMin").value = minimumQuantity;

    document.getElementById("importQuantityMax").value = maximumQuantity;
}

function validateInputs() {
    let quantityInput = document.getElementById("importQuantitysss");
    let minInput = document.getElementById("importQuantityMin");
    let maxInput = document.getElementById("importQuantityMax");

    let errorQuantity = document.getElementById("errorQuantitysss");
    let errorMin = document.getElementById("errorQuantityMin");
    let errorMax = document.getElementById("errorQuantityMax");
    let updateQuantity = document.getElementById("updateQuantity");

    let quantity = parseInt(quantityInput.value);
    let minQuantity = parseInt(minInput.value);
    let maxQuantity = parseInt(maxInput.value);

    // Ẩn tất cả lỗi trước khi kiểm tra
    errorQuantity.style.display = "none";
    errorMin.style.display = "none";
    errorMax.style.display = "none";
    quantityInput.style.border = "1px solid #ccc";
    minInput.style.border = "1px solid #ccc";
    maxInput.style.border = "1px solid #ccc";

    // Kiểm tra quantity không nhỏ hơn min và không lớn hơn max
    if (!isNaN(quantity) && !isNaN(minQuantity) && !isNaN(maxQuantity)) {
        if (quantity < 0) {
            errorQuantity.style.display = "block";
            errorQuantity.innerText = `Số lượng không được nhỏ hơn 0.`;
            quantityInput.style.border = "1px solid red";
            updateQuantity.disabled = true;
        } else if (quantity > maxQuantity) {
            errorQuantity.style.display = "block";
            errorQuantity.innerText = `Số lượng không được lớn hơn ${maxQuantity}.`;
            quantityInput.style.border = "1px solid red";
            updateQuantity.disabled = true;
        } else {
            updateQuantity.disabled = false;
            errorQuantity.style.display = "none";
        }
    }

    // Kiểm tra min không lớn hơn max
    if (!isNaN(minQuantity) && !isNaN(maxQuantity)) {
        if (minQuantity > maxQuantity) {
            errorMin.style.display = "block";
            errorMin.innerText = `Số lượng tối thiểu không được lớn hơn số lượng tối đa.`;
            minInput.style.border = "1px solid red";
            updateQuantity.disabled = true;
        } else if (minQuantity < 0) {
            errorMin.style.display = "block";
            errorMin.innerText = `Số lượng tối thiểu không được nhỏ hơn 0.`;
            minInput.style.border = "1px solid red";
            updateQuantity.disabled = true;

        } else {
            updateQuantity.disabled = false;
            errorQuantity.style.display = "none";
        }
    }

    // Kiểm tra max không nhỏ hơn min
    if (!isNaN(minQuantity) && !isNaN(maxQuantity)) {
        if (maxQuantity < minQuantity) {
            errorMax.style.display = "block";
            errorMax.innerText = `Số lượng tối đa không được nhỏ hơn số lượng tối thiểu.`;
            maxInput.style.border = "1px solid red";
            updateQuantity.disabled = true;
        } else if (maxQuantity < quantity) {
            errorMax.style.display = "block";
            errorMax.innerText = `Số lượng tối đa không được nhỏ hơn số lượng`;
            maxInput.style.border = "1px solid red";
            updateQuantity.disabled = true;
        } else {
            updateQuantity.disabled = false;
            errorQuantity.style.display = "none";
        }
    }


}

function updateQuantity() {
    let productId = document.getElementById("productIdss").value;
    let quantityInput = document.getElementById("importQuantitysss").value;
    let minInput = document.getElementById("importQuantityMin").value;
    let maxInput = document.getElementById("importQuantityMax").value;

    $.ajax({
        url: "updateInventory",
        type: "POST",
        data: {
            productId: productId,
            quantityInput: quantityInput,
            minInput: minInput,
            maxInput: maxInput
        },
        success: function (response) {
            if (response.error) {
                // Hiển thị thông báo lỗi từ server nếu có
                document.getElementById("errorAlert").innerHTML = response.message;
                closeModalUpdateInventory();
                showAlert();
            } else {
                updateAllTables();
                closeModalUpdateInventory(); // Đóng modal sau khi thành công
                document.getElementById("errorAlert").innerHTML = response.message;
                showAlert();

            }
        },
        error: function (xhr, status, error) {
            console.error("Lỗi AJAX:", error);
            alert("Lỗi kết nối đến server.");
        }
    });
}
function loadInventory() {

    $.ajax({
        url: "inventory-list",
        type: "GET",

        success: function (data) {
           fetchData(data);

        },
        error: function (xhr, status, error) {
            console.error("Lỗi AJAX:", error);
            alert("Lỗi kết nối đến server.");
        }
    });

}
function  fetchData(data) {
    const tableBody = document.querySelector("#inventoryTable tbody");
    tableBody.innerHTML = ""; // Xóa dữ liệu hiện tại trong bảng

    data.forEach(item => {
        const row = document.createElement("tr");
        row.innerHTML = `
                <td>${item.productId}</td>
                <td>${item.productName}</td>
                <td id="displayQuantity">${item.quantity}</td>
                <td id="displayMinQuantity">${item.minimumQuantity}</td>
                <td id="displayMaxQuantity">${item.maximumQuantity}</td>
                <td  style="width: 134px;"><span class="status">${item.status}</span></td>
                <td class="v" style="display: flex">
                  <button class="update-btn" onclick="updateQuantityInventory(${item.productId},
                                        '${item.productName}', '${item.quantity}', '${item.minimumQuantity}', '${item.maximumQuantity}')" >Sửa</button>
                    <button class="btn btn-success" onclick="openImportModal(${item.productId}, '${item.productName}', '${item.quantity}')">Nhập kho</button>
                    <button class="btn btn-success" onclick="openExportModal(${item.productId}, '${item.productName}')">Xuất kho</button>
                </td>
            `;
        tableBody.appendChild(row);

    });
    // Lấy DataTable hiện tại và vẽ lại bảng sau khi cập nhật dữ liệu
    var table = $('#inventoryTable').DataTable();
    table.clear();  // Xóa tất cả các hàng cũ
    table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới vào DataTable
    table.draw();  // Vẽ lại bảng

}


    $(document).ready(function () {
        $('#inventoryTable').DataTable({
            paging: true,
            searching: true,
            ordering: true,
            info: true,
            lengthMenu: [5, 10, 25, 50],
            language: {
                search: "Tìm kiếm:",
                lengthMenu: "Hiển thị _MENU_ dòng",
                info: "Trang _PAGE_ trên tổng _PAGES_ trang",
                zeroRecords: "Không tìm thấy kết quả",
                infoEmpty: "Không có dữ liệu",
                paginate: {
                    first: "Đầu",
                    last: "Cuối",
                    next: "Tiếp",
                    previous: "Trước"
                }
            },
            columnDefs: [
                {
                    targets: 6,
                    orderable: false
                }

            ]
        });
        // Gọi lại hàm cập nhật màu sắc cho trạng thái khi DataTable vẽ lại bảng (chuyển trang, tìm kiếm, sắp xếp)
        $('#inventoryTable').on('draw.dt', function () {
            updateStatusColors();
        });
    });


function updateAllTables() {
    Promise.all([
        fetchInventory(),
        fetchInventoryNeedImport(),
        loadInventory()
    ]).then(() => {
        updateStatusColors(); // Cập nhật màu sau khi tất cả dữ liệu được tải
    }).catch(error => console.error("Lỗi khi cập nhật bảng:", error));
}

