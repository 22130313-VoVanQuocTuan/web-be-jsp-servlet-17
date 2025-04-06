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
                                    <button class="edit-btn" onclick="openModalUpdate(${promotion.id},'${promotion.value}', '${promotion.startDate}', '${promotion.endDate}')">Sửa</button>
                                    <button class="delete-btn" onclick="openModalDeletePromotional(${promotion.id});" ">Xóa</button>
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
    console.log(id, value,startDate,endDate)

    // Chuyển định dạng ngày cho input datetime-local
    function formatDateForInput(dateString) {
        const date = new Date(dateString);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        const hours = String(date.getHours()).padStart(2, '0');
        const minutes = String(date.getMinutes()).padStart(2, '0');
        return `${year}-${month}-${day}T${hours}:${minutes}`;
    }
    document.getElementById("editPromotional").style.display = "block";
    document.getElementById("promotionId").value = id;
    document.getElementById("promotionValue").value = value;
    document.getElementById("startDate").value = formatDateForInput(startDate);
    document.getElementById("endDate").value = formatDateForInput(endDate);

}
function closeModalUpdatePro(){
    document.getElementById("editPromotional").style.display = "none";
    document.getElementById("promotionId").value = "";
    document.getElementById("promotionValue").value = "";
    document.getElementById("startDate").value = "";
    document.getElementById("endDate").value = "";
}
document.getElementById("editInfoForm").addEventListener("submit", function (event) {
    event.preventDefault();
    const id = document.getElementById("promotionId").value;
    const value = document.getElementById("promotionValue").value;
    const startDate = document.getElementById("startDate").value;
    const endDate = document.getElementById("endDate").value;

    $.ajax({
        url: "update-promotional",
        type: "POST",
        data: {id: id, value: value, startDate: startDate, endDate: endDate},
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModalUpdatePro();
                showAlert();
            }else{
                document.getElementById("message").innerHTML= response.message;
                loadDataPromotional();
                closeModalUpdatePro();
                showAlert();
            }
        }
    })
})
function openModalDeletePromotional(id){
        document.getElementById("delete-modal").style.display = "block";
        document.getElementById("promotionalId").value = id;
}
function closeModalDeletePro(){
    document.getElementById("delete-modal").style.display = "none";
}
function confirmModalDelete(){
    const promotionalId = document.getElementById("promotionalId").value;
    $.ajax({
        url: "delete-promotional",
        type: "GET",
        data: { id: promotionalId },
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModalDeletePro();
                showAlert();
            }else{
                document.getElementById("message").innerHTML= response.message;
                loadDataPromotional();
                closeModalDeletePro();
                showAlert();
            }
        }
    })
}
function openAddPro(){
    document.getElementById("addPromotionModal").style.display = "block";

}
function closeModalAddPro(){
    document.getElementById("addPromotionModal").style.display = "none";
    document.getElementById("promotionCode").value = "";
    document.getElementById("promotionName").value="";
    document.getElementById("promotionDateStart").value="";
    document.getElementById("promotionDateEnd").value="";
}
document.getElementById("addPromotionForm").addEventListener("submit", function (event) {
    event.preventDefault();
    const promotionCode = document.getElementById("promotionCode").value;
    const promotionName = document.getElementById("promotionName").value;
    const promotionDateStart = document.getElementById("promotionDateStart").value;
    const promotionDateEnd = document.getElementById("promotionDateEnd").value;

    $.ajax({
        url: "add-promotional",
        type: "POST",
        data: {code: promotionCode, value:promotionName, startDate: promotionDateStart, endDate: promotionDateEnd},
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModalAddPro();
                showAlert();
            }else{
                document.getElementById("message").innerHTML= response.message;
                loadDataPromotional();
                closeModalAddPro();
                showAlert();
            }
        }

    })

})
