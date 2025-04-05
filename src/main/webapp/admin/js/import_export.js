document.addEventListener('DOMContentLoaded', function () {
    fetchHistoryImportExport();

});
function closeModal() {
    document.getElementById('delete-modal').style.display = 'none';
}

// cập nhật trạng thái theo màu
function updateStatusColors() {
    document.querySelectorAll(".color")?.forEach(transactionType => {
        let text = transactionType.textContent.trim();
        let colorMap = {
            "Nhập kho": "#00d23c",
            "Xuất kho": "#ff3a3a",

        };

        if (colorMap[text]) {
            transactionType.style.backgroundColor = colorMap[text];
            transactionType.style.color = "white";
            transactionType.style.padding = "3px 5px";
            transactionType.style.borderRadius = "5px";
        }
    });
}

// mở modal xóa
function  openDeleteTransactionStock(id){
 document.getElementById('delete-modal').style.display = 'block';
 document.getElementById('transactionId').value = id;
}


// xác nhận xóa
function  deleteTransactionStock(){
    let transactionId = document.getElementById('transactionId').value;

    $.ajax({
        "url": "deleteTransactionstock",
        "type": "POST",
        "data": {transactionId: transactionId},

        success: function (response) {
            const messageElement = document.getElementById("message");
            if (response.error) {
                // Hiển thị thông báo lỗi từ server nếu có
                messageElement.innerHTML = response.message;
                fetchHistoryImportExport();
                closeModal()

            } else {
                fetchHistoryImportExport();
                closeModal()
                messageElement.innerHTML = response.message;
                showAlert()

            }
        }
    })
}
function fetchHistoryImportExport(){
    $.ajax({
        url: "listImportExportStock",
        type: "GET",
        success: function (data) {
           renderData(data)
        }
    })
}
function  renderData(data){
    const tableBody = document.querySelector("#transactionTable tbody");
    tableBody.innerHTML = ""; // Xóa dữ liệu hiện tại trong bảng

    data.forEach(item => {
        const row = document.createElement("tr");
        row.innerHTML = `
               <td>
               <span class="color">${item.transactionType}</span></td>
                            <td>${item.productName}</td>
                            <td>${item.quantity}</td>
                            <td>${item.transactionDate}</td>
                            <td>${item.username}</td>
                            <td>${item.note}</td>
                            <td class="v">
                                <button class="delete-btn" onclick="openDeleteTransactionStock(${item.id})">Xóa</button>

              </td>
               `;
        tableBody.appendChild(row);

    });
    // Lấy DataTable hiện tại và vẽ lại bảng sau khi cập nhật dữ liệu
    var table = $('#transactionTable').DataTable();
    table.clear();  // Xóa tất cả các hàng cũ
    table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới vào DataTable
    table.draw();  // Vẽ lại bảng

}


$(document).ready(function () {
    $('#transactionTable').DataTable({
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
                targets: 5,
                orderable: false
            },
            {
                targets: 6,
                orderable: false
            }

        ]
    });
    // Gọi lại hàm cập nhật màu sắc cho trạng thái khi DataTable vẽ lại bảng (chuyển trang, tìm kiếm, sắp xếp)
    $('#transactionTable').on('draw.dt', function () {
        updateStatusColors();
    });
});





