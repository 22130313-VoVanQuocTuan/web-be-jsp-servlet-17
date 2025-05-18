document.addEventListener('DOMContentLoaded', function () {
    fetchDataLog();

});

function  fetchDataLog(){
    $.ajax({
        url: "listLog",
        type:"GET",
        success: function (data) {
            renderDataLog(data);
        }
    })
}
function renderDataLog(data){
    const tableBody = document.querySelector("#logTable tbody");
    tableBody.innerHTML = "";
    data.forEach(item => {
        const row = document.createElement("tr");
        row.innerHTML = `
                                <td><span class="level">${item.level}</span></td>
                                <td>${item.username}</td>
                                <td>${item.startLog}</td>
                                <td>${item.address}</td>
                                <td>${item.dataBefore}</td>
                                <td>${item.dataAfter}</td>
                                <td class="v">
                                    <button style="color: #000000" class="delete-btn" onclick="openModalDeleteLog(${item.id})">Xóa</button>
                                </td>`;
        tableBody.appendChild(row);
    });
    // Lấy DataTable hiện tại và vẽ lại bảng sau khi cập nhật dữ liệu
    var table = $('#logTable').DataTable();
    table.clear();  // Xóa tất cả các hàng cũ
    table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới vào DataTable
    table.draw();  // Vẽ lại bảng
    updateStatusColorsLog(); // Cập nhật màu sau khi tất cả dữ liệu được tải

}
$(document).ready(function () {
    $('#logTable').DataTable({
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


        },
        "columnDefs": [
            { "orderable": false, "targets": [0, 1, 3, 4, 5, 6] }  // chỉ cho phép sắp xếp cột 2 (startLog)
        ]


    });
    // Gọi lại hàm cập nhật màu sắc cho trạng thái khi DataTable vẽ lại bảng (chuyển trang, tìm kiếm, sắp xếp)
    $('#logTable').on('draw.dt', function () {
        updateStatusColorsLog();
    });
});
// cập nhật trạng thái theo màu
function updateStatusColorsLog() {
    document.querySelectorAll(".level")?.forEach(status => {
        let text = status.textContent.trim();
        let colorMap = {
            "ALERT": "#fb4848",
            "INFO": "#3ae1ff",
            "WARNING": "rgb(255,242,2)",
            "DANGER": "#ed8e22",
            "ERROR": "#ff0000"
        };

        if (colorMap[text]) {
            status.style.backgroundColor = colorMap[text];
            status.style.color = "white";
            status.style.padding = "3px 5px";
            status.style.borderRadius = "5px";
        }
    });
}

function openModalDeleteLog(logId){
    document.getElementById("delete-modal").style.display = "block";
    document.getElementById("logId").value = logId;
}
function closeModalDeleteLog(){
    document.getElementById("delete-modal").style.display = "none";
}

function deleteLog(){
    const logId = document.getElementById("logId").value;
    $.ajax({
        url: "delete-Log",
        type: "POST",
        data: { logId: logId },
        success: function (response) {
            if(response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModalDeleteLog();
                showAlert();

            }else{
                document.getElementById("message").innerHTML= response.message;
                fetchDataLog();
                closeModalDeleteLog();
                showAlert();

            }

        }

    })
}

//Clean log
document.getElementById("cleanLog").addEventListener("submit" , function (event)  {
  event.preventDefault();
    const level = document.getElementById("level").value;
$.ajax({
    url: "cleanLog",
    type: "POST",
    data: {level: level},
    success: function (response) {
        if(response.error) {
            document.getElementById("message").innerHTML = response.message;
            showAlert();

        }else{
            document.getElementById("message").innerHTML= response.message;
            fetchDataLog();
            showAlert();

        }
    }
})

})

