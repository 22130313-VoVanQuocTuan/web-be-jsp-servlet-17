
document.addEventListener("DOMContentLoaded", function() {
    loadRevenueData('month');
    loadDataHome();
    updateStatusColorsHome();

})


// cập nhật trạng thái theo màu
function updateStatusColorsHome() {
    document.querySelectorAll(".status")?.forEach(status => {
        let text = status.textContent.trim();
        let colorMap = {
            "Hoàn thành": "#00d23c",
            "Chưa hoàn thành": "#ff3a3a",
            "Đã thanh toán": "#00d23c",
            "Chưa thanh toán": "#ff3a3a",
            "Đang xử lý": "#ed8e22",
        };

        if (colorMap[text]) {
            status.style.backgroundColor = colorMap[text];
            status.style.color = "white";
            status.style.padding = "3px 5px";
            status.style.borderRadius = "5px";
        }
    });
}




let chartInstance = null; // Đặt ở ngoài để không reset mỗi lần gọi hàm

function loadRevenueData(type) {
    console.log("Fetching revenue for type:", type);
    $.ajax({
        url: "revenue-report",
        type: "GET",
        data: { type: type },
        success: function (data) {
            console.log("Revenue data:", data);
            if (!Array.isArray(data) || data.length === 0) {
                console.warn("No revenue data to render.");
                return;
            }
            renderChart(data, type);
        },
        error: function (xhr, status, error) {
            console.error("Error loading revenue data:", status, error);
            alert("Không thể tải dữ liệu biểu đồ doanh thu.");
        }
    });
}

function renderChart(data, type) {

    const colors = [
        'rgba(255, 99, 132, 0.7)',  // Đỏ hồng
        'rgba(54, 162, 235, 0.7)',  // Xanh dương
        'rgba(255, 206, 86, 0.7)',  // Vàng
        'rgba(75, 192, 192, 0.7)',  // Xanh ngọc
        'rgba(153, 102, 255, 0.7)', // Tím
        'rgba(255, 159, 64, 0.7)',  // Cam
        'rgba(0, 204, 102, 0.7)'    // Xanh lá đậm
    ];

    const labels = data.map(item =>
        type === 'week' ? item.week :
            type === 'month' ? item.month :
                item.year
    );

    const revenues = data.map(item => item.revenue);

    const backgroundColors = labels.map((_, index) => colors[index % colors.length]);
    const borderColors = backgroundColors.map(c => c.replace('0.7', '1'));

    const chartData = {
        labels: labels,
        datasets: [{
            label: 'Doanh thu (VNĐ)',
            data: revenues,
            backgroundColor: backgroundColors,
            borderColor: borderColors,
            borderWidth: 1
        }]
    };

    if (chartInstance) {
        chartInstance.destroy();
    }

    chartInstance = new Chart(document.getElementById('revenueChart'), {
        type: 'bar',
        data: chartData,
        options: {
            responsive: true,
            plugins: {
                legend: { display: false }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

function  loadDataHome(){
    $.ajax({
        url: "home",
        type: "GET",
        success: function (data) {
            console.log("Response data:", data);
            renderDataHomeOrder(data.orderNew);
            renderDataHomeUser(data.users);
            document.getElementById("totalViews").innerHTML = data.totalViews.toLocaleString()|| 0 ;
            document.getElementById("totalUsers").innerHTML = data.totalUsers.toLocaleString() || 0;
            document.getElementById("totalRatings").innerHTML = data.totalRatings.toLocaleString() || 0;
            document.getElementById("totalRevenue").innerHTML = (data.totalSales ? data.totalSales.toLocaleString() : "0") + " ₫";
        }
    })
}

function renderDataHomeOrder(data) {
    console.log(data)
    const tableBody = document.querySelector("#orderTable tbody");
    tableBody.innerHTML = ""; // Clear current rows

    data.forEach(view => {
        const createdAt = new Date(view.createdAt); // Parse string to Date
        const row = document.createElement("tr");
        row.innerHTML = `<td>${view.id}</td>
                         <td>${view.totalPrice.toLocaleString()} ₫</td>
                         <td><span class="status">${view.paymentStatus}</span></td>
                         <td>${createdAt.toLocaleString()}</td>
                         <td><span class="status">${view.status}</span></td>`;
        tableBody.appendChild(row);
    });

    // Lấy DataTable hiện tại và vẽ lại bảng sau khi cập nhật dữ liệu
    const table = $('#orderTable').DataTable();
    table.clear(); // Xóa tất cả các hàng cũ
    table.rows.add(tableBody.querySelectorAll('tr')); // Thêm các hàng mới vào DataTable
    table.draw(); // Vẽ lại bảng
    updateStatusColorsHome(); // Cập nhật màu sắc trạng thái
}

$(document).ready(function () {
    $('#orderTable').DataTable({
        "paging": true, // Tính năng phân trang
        "searching": true, // Tính năng tìm kiếm
        "ordering": true, // Tính năng sắp xếp
        "info": true, // Hiển thị thông tin trang
        "lengthMenu": [5, 10, 25, 50], // Số dòng hiển thị mỗi trang
        "language": {
            "search": "Tìm kiếm:",
            "lengthMenu": "Hiển thị _MENU_ dòng",
            "info": "Trang _PAGE_ trên tổng _PAGES_ trang",
            "zeroRecords": "Không tìm thấy kết quả",
            "infoEmpty": "Không có dữ liệu",
            "paginate": {
                "first": "Đầu",
                "last": "Cuối",
                "next": "Tiếp",
                "previous": "Trước"
            }
        }
    });

    // Gọi lại hàm cập nhật màu sắc cho trạng thái khi DataTable vẽ lại bảng (chuyển trang, tìm kiếm, sắp xếp)
    $('#orderTable').on('draw.dt', function () {
        updateStatusColorsHome();
    });
});

function renderDataHomeUser(data){
    console.log(data)
    const tableBody = document.querySelector("#customerTable tbody");
    tableBody.innerHTML = "";
    data.forEach(user => {
        const row = document.createElement("tr");
        row.innerHTML = `<td width="60px">
                                <a href="accounts">
                                    <ion-icon name="person"
                                              style="color: #1841e4; font-size: 20px; text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);"></ion-icon>
                                </a>
                            </td>
                            <td>
                                <h4>${user.username}</h4>
                            </td>
                            <td>${user.totalPrice.toLocaleString()+" ₫"}</td>`;
        tableBody.appendChild(row);
    })

}


