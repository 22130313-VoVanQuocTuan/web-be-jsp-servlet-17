document.addEventListener('DOMContentLoaded', function () {
    fetchDataRating()
});

function openDeleteRating(id){
    document.getElementById("delete-modal").style.display = "block";
    document.getElementById("ratingId").value = id;
}
function  closeModelDelete(){
    document.getElementById("delete-modal").style.display = "none";
}
function confirmDelete(){
    const ratingId = document.getElementById("ratingId").value;
    $.ajax({
        url: "delete-rating",
        type: "POST",
        data: { id: ratingId },
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModalDeleteLog();
                showAlert();
            }else{
                document.getElementById("message").innerHTML= response.message;
                fetchDataRating();
                closeModelDelete();
                showAlert();
            }
        }

    })

}
function fetchDataRating(){
    $.ajax({
        url: "list-rating",
        type:"GET",
        success: function (data) {
            renderDataRating(data);
        }
    })
}
function renderDataRating(data){
    const tableBody = document.querySelector("#reviewTable tbody");
    tableBody.innerHTML = "";
    data.forEach(rating => {
        const row = document.createElement("tr");
        row.innerHTML = `
                                 <td>${rating.productId}</td>
                                <td>${rating.userId}</td>
                                <td>${rating.content}</td>
                                <td>${rating.createdAt}</td>
                                <td class="v">
                                    <button class="delete-btn" onclick="openDeleteRating(${rating.id})">Xóa</button>
                                </td>`;
        tableBody.appendChild(row);

    });

    // Lấy DataTable hiện tại và vẽ lại bảng sau khi cập nhật dữ liệu
    var table = $('#reviewTable').DataTable();
    table.clear();  // Xóa tất cả các hàng cũ
    table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới vào DataTable
    table.draw();  // Vẽ lại bảng
    updateStatusColorsLog(); // Cập nhật màu sau khi tất cả dữ liệu được tải
}

$(document).ready(function () {
    $('#reviewTable').DataTable({
        "padding" : true,
        "search" : true,
        "ordering" : true,
        "info": true,
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
    $('#reviewTable').on('draw.dt', function () {
        updateStatusColorsLog();
    });
});


