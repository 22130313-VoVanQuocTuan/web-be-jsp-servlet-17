document.addEventListener('DOMContentLoaded', function () {
    loadDataPromotional();

});

// cập nhật trạng thái theo màu
function updateStatusColorsPromotional() {
    document.querySelectorAll(".color")?.forEach(status => {
        let text = status.textContent.trim();
        let colorMap = {
            "Hoạt động": "#48fb66",
            "Không hoạt động": "#ff3a3a",

        };

        if (colorMap[text]) {
            status.style.backgroundColor = colorMap[text];
            status.style.color = "white";
            status.style.padding = "3px 5px";
            status.style.borderRadius = "5px";
        }
    });
}
function loadDataPromotional() {
    $.ajax({
        url: 'promotional-list',
        type: 'GET',
        success: function (data){
            renderDataPromotional(data);
        }
    })
}
function renderDataPromotional(data) {
  const tableBody = document.querySelector("#productTable tbody");
  tableBody.innerHTML = "";
  data.forEach(promotion => {
      const row = document.createElement("tr");
      row.innerHTML = `<td>${promotion.id}</td>
                            <td>${promotion.code}</td>
                            <td id="value">${promotion.value.toLocaleString()} đ
                            </td>
                            <td id="sdate">${promotion.startDate.toLocaleString()}</td>
                            <td id="edate">${promotion.endDate.toLocaleString()}</td>
                            <td><span class="color">${promotion.status}</span> </td>
                            <td>
                                <div class="v">
                                    <button class="edit-btn" onclick="openModalUpdate(${promotion.id},'${promotion.value}', '${promotion.startDate}, '${promotion.endDate}')">Sửa</button>
                                    <button class="delete-btn" onclick="openModalDeletePeomotional(${promotion.id});" ">Xóa</button>
                                </div>
                            </td>`;
      tableBody.appendChild(row);

  });

    // Lấy DataTable hiện tại và vẽ lại bảng sau khi cập nhật dữ liệu
    var table = $('#productTable').DataTable();
    table.clear();  // Xóa tất cả các hàng cũ
    table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới vào DataTable
    table.draw();  // Vẽ lại bảng
    updateStatusColorsPromotional(); // Cập nhật màu sau khi tất cả dữ liệu được tải
}
$(document).ready(function () {
    $('#productTable').DataTable({
        "paging": true,         // Hiển thị phân trang
        "searching": true,      // Hiển thị ô tìm kiếm
        "ordering": true,       // Cho phép sắp xếp cột
        "info": true,           // Hiển thị thông tin số lượng dữ liệu
        "lengthMenu": [5, 10, 25, 50, 100], // Số dòng hiển thị mỗi trang
        "language": {
            "lengthMenu": "Hiển thị _MENU_ voucher mỗi trang",
            "zeroRecords": "Không tìm thấy sản phẩm nào",
            "info": "Trang _PAGE_ trên tổng _PAGES_ trang",
            "infoEmpty": "Không có sản phẩm",
            "infoFiltered": "(lọc từ _MAX_ sản phẩm)",
            "search": "Tìm kiếm:",
            "paginate": {
                "first": "Đầu",
                "last": "Cuối",
                "next": "Tiếp",
                "previous": "Trước"
            }
        }
    });
    // Gọi lại hàm cập nhật màu sắc cho trạng thái khi DataTable vẽ lại bảng (chuyển trang, tìm kiếm, sắp xếp)
    $('#productTable').on('draw.dt', function () {
        updateStatusColorsPromotional();
    });
});

function openModalUpdate(id,value, startDate, endDate){
    document.getElementById("updateModal").style.display = "block";
}