document.addEventListener('DOMContentLoaded', function () {
    // Lấy tất cả các nút chỉnh sửa và xóa
    loadData ();

    // Đóng modal khi nhấn ra ngoài nội dung modal
    window.addEventListener('click', function (event) {
        const modals = document.querySelectorAll('.modal');
        modals.forEach(modal => {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });
    });


});

// Hàm đóng modal
function closeModalCloseRole() {
document.getElementById('delete-modal').style.display = 'none';

}
function closeModalEdit() {
    document.getElementById('updatePermissionsModal').style.display = 'none';

}
function closeModalAdd() {
    document.getElementById('addAccount').style.display = 'none';

}
function openModalAdd(){
    document.getElementById('addAccount').style.display = 'block';
}


function  openCloseRole(userId){
    document.getElementById('delete-modal').style.display = "block";
    document.getElementById('userIdRole').value = userId;
}
function openEditUser(userId) {
    document.getElementById('updatePermissionsModal').style.display= "block";
    document.getElementById('userId').value = userId;


}
function  confirmCloseRole(){
    let userId = document.getElementById('userIdRole').value;
    $.ajax({
        url : "role-account",
        type: "POST",
        data: {userId: userId},
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModalCloseRole();
                showAlert();
            }else{
                document.getElementById("message").innerHTML = response.message;
                closeModalCloseRole();
                showAlert();
                loadData();
            }

        }
    })
}

document.getElementById('updatePermissionsForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Ngăn chặn form reload

    let userId = document.getElementById('userId').value;
    let module = document.getElementById('module').value;
    let canView = document.getElementById('canView').value;
    let canAdd = document.getElementById('canAdd').value;
    let canEdit = document.getElementById('canEdit').value;
    let canDelete = document.getElementById('canDelete').value;

    $.ajax({
        url: 'update-permissions-admin',
        type: 'POST',
        data: {userId: userId, module: module, canView: canView, canAdd: canAdd, canEdit: canEdit, canDelete: canDelete },
        success: function (response) {
            document.getElementById("message").innerHTML = response.message;
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModalEdit();
                showAlert();

            } else {
                document.getElementById("message").innerHTML = response.message;
                loadData();
                closeModalEdit();
                showAlert();
            }
        }
    });
});

document.getElementById('addAccountForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Ngăn chặn form reload

    let username = document.getElementById('username').value;
    let password = document.getElementById('password').value;
    let email = document.getElementById('email').value;
    let userRole = document.getElementById('userRole').value;

    $.ajax({
        url: 'add-account',
        type: 'POST',
        data: { username: username, password: password, email: email, role: userRole },
        success: function (response) {
            document.getElementById("message").innerHTML = response.message;
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModalAdd();
                showAlert();
            } else if (response.emailExit) {
                document.getElementById("emailExit").innerHTML = response.emailExit;
                document.getElementById("emailExit").style.display = 'block';

            } else {
                document.getElementById("message").innerHTML = response.message;
                loadData();
                closeModalAdd();
                showAlert();
            }
        }
    });
});


// cập nhật trạng thái theo màu
function updateStatusColors() {
    document.querySelectorAll(".color")?.forEach(transactionType => {
        let text = transactionType.textContent.trim();
        let colorMap = {
            "Hoạt động": "#00d23c",
            "Không hoạt động": "#abb5af",
            "Bị đình chỉ": "#ff3a3a",
            "Đang chờ xử lý": "#ffaa3a",

        };

        if (colorMap[text]) {
            transactionType.style.backgroundColor = colorMap[text];
            transactionType.style.color = "white";
            transactionType.style.padding = "3px 5px";
            transactionType.style.borderRadius = "5px";
        }
    });
}
function  loadData (){
    $.ajax({
        url: "list_admin_owner",
        type: "GET",
        success: function (data) {
            fetchDataUser(data)
        }
    })
}
function fetchDataUser(data){
    const tableBody = document.querySelector("#userTable tbody");
    tableBody.innerHTML = "";
    data.forEach(item => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${item.id}</td>
            <td>${item.username}</td>
            <td>${item.email}</td>
            <td>${item.phoneNumber || ' '}</td>
            <td><span class="color">${item.status}</span></td>
            <td>${item.role}</td>
            <td>
                <div class="v">
                    ${getActionButtons(item)}
                </div>
            </td>
        `;
        tableBody.appendChild(row);
    });

    // Lấy DataTable hiện tại và vẽ lại bảng sau khi cập nhật dữ liệu
    var table = $('#userTable').DataTable();
    table.clear();  // Xóa tất cả các hàng cũ
    table.rows.add($(tableBody).find('tr'));  // Thêm các hàng mới vào DataTable
    table.draw();  // Vẽ lại bảng
}
$(document).ready(function () {
    $('#userTable').DataTable({
        "paging": true,         // Bật phân trang
        "searching": true,      // Bật tìm kiếm
        "ordering": true,       // Bật sắp xếp
        "info": true,           // Hiển thị thông tin tổng số dòng
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
            },
            columnDefs: [
                {
                    targets: 3,
                    orderable: false
                },
                {
                    targets: 4,
                    orderable: false
                },
                {
                    targets: 5,
                    orderable: false
                },
                {
                    targets: 6,
                    orderable: false
                }

            ]
        }
    });
    $("#userTable").on('draw.dt', function () {
        updateStatusColors();
    })
});

function getActionButtons(item) {
    // Giả sử bạn đã truyền thông tin về role của user từ JSP sang JavaScript.

    // Logic kiểm tra quyền và tạo nút
    if (currentUserRole=== 'owner') {
        if (item.role === "owner")
            buttonsHTML = `
                    <button style="background: #ccced0" class="auth-btn" disabled>Hạ quyền</button>
                    <button style="background: #ccced0" class="edit-btn" disabled>Sửa</button>
                `;
        else{
            buttonsHTML = `
                <button class="auth-btn" onclick="openCloseRole(${item.id})"">Hạ quyền</button>
                <button class="edit-btn" onclick="openEditUser(${item.id})">Sửa</button>
            `;
        }

    }
    else if (item.role === 'admin') {
         buttonsHTML = `
                    <button style="background: #ccced0" class="auth-btn" disabled>Hạ quyền</button>
                    <button style="background: #ccced0" class="edit-btn" disabled>Sửa</button>
                `;

    }

    return buttonsHTML;
}