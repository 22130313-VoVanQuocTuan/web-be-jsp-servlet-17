document.addEventListener('DOMContentLoaded', function () {
    // Lấy tất cả các nút chi tiết và xóa
    loadOrder();

});
// cập nhật trạng thái theo màu
function updateStatusColorsOrder() {
    document.querySelectorAll(".color")?.forEach(status => {
        let text = status.textContent.trim();
        let colorMap = {
            "Hoàn thành": "#00d23c",
            "Chưa hoàn thành": "#ff3a3a",
            "Đã thanh toán": "#00d23c",
            "Chưa thanh toán": "#ff3a3a",
        };

        if (colorMap[text]) {
            status.style.backgroundColor = colorMap[text];
            status.style.color = "white";
            status.style.padding = "3px 5px";
            status.style.borderRadius = "5px";
        }
    });
}

function loadOrder() {
    $.ajax({
        url: "order-list",
        type: "GET",

        success: function (data) {
            fetchData(data);
            console.log(data);

        },
        error: function (xhr, status, error) {
            console.error("Lỗi AJAX:", error);
            alert("Lỗi kết nối đến server.");
        }
    });

}

function fetchData(data) {
    const tableBody = document.querySelector("#orderTable tbody");
    tableBody.innerHTML = "";
    const filteredData = data.filter(order => order.status === "Hoàn thành");
    filteredData.forEach(order => {
        const isCompleted = order.status === "Hoàn thành";

        const row = document.createElement("tr");
        row.innerHTML = `
          <td>${order.id}</td>
          <td>${order.userid}</td>
          <td>${order.createdAt.toLocaleString()}</td>
          <td>${order.totalPrice.toLocaleString()}₫</td>
          <td style="width: 130px"><span class="color" >${order.status}</span></td>
          <td>${order.paymentMethod}</td>
          <td style="width: 130px"><span class="color" >${order.paymentStatus}</span></td>
          <td class="v" style="display: flex">
            <button class="view-detail-btn" onclick="openModal(${order.id})">Chi tiết
               </button>
            <button class="delete-btn" onclick="openDeleteModal(${order.id})" ${isCompleted ? 'disabled' : ''}>Xóa</button> 
           </td>
        `;
        tableBody.appendChild(row);
    });
    // Lấy DataTable hiện tại và vẽ lại bảng sau khi cập nhật dữ liệu
    var table = $('#orderTable').DataTable();
    table.clear();  // Xóa tất cả các hàng cũ
    table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới vào DataTable
    table.draw();  // Vẽ lại bảng

}

$(document).ready(function () {
    $('#orderTable').DataTable({
        "paging": true,         // Bật phân trang
        "searching": true,      // Bật tìm kiếm
        "ordering": true,       // Bật sắp xếp
        "info": true,           // Hiển thị thông tin tổng số dòng
        "lengthMenu": [5,10,15,20],
        "language": {
            "lengthMenu": "Hiển thị _MENU_ dòng mỗi trang",
            "zeroRecords": "Không tìm thấy đơn hàng nào",
            "info": "Hiển thị _PAGE_ trên tổng _PAGES_ trang",
            "search": "Tìm kiếm: ",
            "paginate": {
                "first": "Đầu",
                "last": "Cuối",
                "previous": "<",
                "next": ">"
            }
        }
    });
    $('#orderTable').on('draw.dt', function () {
        updateStatusColorsOrder();
    });
});

function openModal(id) {
    // Hiển thị modal
    document.getElementById("orderDetailModal").style.display = "block";
    fetch(`GetDetailOrder?id=${id}`)
        .then(response => response.json())
        .then(data => {
            const order = data.order;
            const items = data.items;

            // Ghi dữ liệu vào bảng chi tiết sản phẩm
            const tableBody = document.querySelector(".order-detail-table tbody");
            tableBody.innerHTML = ""; // Xóa cũ

            items.forEach(item => {
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td>${item.productName}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price.toLocaleString()}₫</td>
                    <td>${item.discount.toLocaleString()}₫</td>
                    <td>${item.totalPrice.toLocaleString()}₫</td>
                `;
                tableBody.appendChild(row);
            });

            // Điền thông tin chi tiết đơn hàng
            document.querySelector(".modal .info-highlight").textContent = order.id;
            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(2) span").textContent = order.totalPrice.toLocaleString() + " ₫";
            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(3) span").textContent = order.shippingFee.toLocaleString() + " ₫";
            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(4) span").textContent = order.discountAmount.toLocaleString() + " ₫";

            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(5) span").textContent = order.paymentMethod;
            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(6) span").textContent = order.paymentStatus;
            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(7)").innerHTML = `<strong>Địa chỉ:</strong> ${order.shippingAddress}`;
            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(8)").innerHTML = `<strong>Số lượng:</strong> ${order.quantity}`;
            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(9)").innerHTML = `<strong>Email:</strong> ${order.email}`;
            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(10)").innerHTML = `<strong>Người nhận hàng:</strong> ${order.name}`;
            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(11)").innerHTML = `<strong>Số điện thoại:</strong> ${order.phoneNumber}`;
            document.querySelector("#orderDetailContent").querySelector("p:nth-of-type(12)").innerHTML = `<strong>Ghi chú:</strong> ${order.note}`;




        })
        .catch(error => {
            console.error("Lỗi khi lấy dữ liệu đơn hàng:", error);
        });
}

// Ẩn modal khi nhấn nút đóng
document.querySelector(".close-modal").addEventListener("click", function () {
    document.getElementById("orderDetailModal").style.display = "none";
});

// Mở modal xác nhận xóa
function openDeleteModal(orderId) {
    document.getElementById('orderIdDelete').value = orderId;
    document.getElementById('delete-modal').style.display = 'block';
}

// Đóng modal khi nhấn nút Hủy
document.querySelector('.close-modal').addEventListener('click', function() {
    document.getElementById('delete-modal').style.display = 'none';
});

// Xử lý khi nhấn nút "Xóa"
function deleteOrder() {
    let orderId = document.getElementById('orderIdDelete').value;
    $.ajax({
        url: 'delete-order',
        type: 'GET',
        data: { id: orderId },
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModals();
                showAlert();
            }else{
                loadOrder();
                document.getElementById("message").innerHTML = response.message;
                closeModals();
                showAlert();

            }
        }
    })

}
function  closeModals(){
    document.getElementById("delete-modal").style.display = "none";
}







