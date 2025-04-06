document.addEventListener('DOMContentLoaded', function () {
    // Lấy tất cả các nút chỉnh sửa và xóa
    loadData();

    // Hiển thị modal thêm tài khoản
    const addPromotions = document.getElementById('add_account');
    const addPro = document.getElementById('addAccount');
    addPromotions.addEventListener('click', () => {
        addPro.style.display = 'flex';
    });


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
function closeModalDelete() {
    document.getElementById('delete-modal').style.display = 'none';

}
function closeModalEdit() {
    document.getElementById('update').style.display = 'none';

}
function closeModalAdd() {
    document.getElementById('addAccount').style.display = 'none';

}
function openModalAdd(){
    document.getElementById('addAccount').style.display = 'block';
}

function openDeleteModal(userId) {
    document.getElementById('delete-modal').style.display= "block" // Modal xóa tài khoản
    document.getElementById('userIdDelete').value = userId;
    console.log(userId);
}
function openEditModal(userId,status, role) {
    document.getElementById('update').style.display= "block" // Modal xóa tài khoản
    document.getElementById('userId').value = userId;
    document.getElementById('status').value = status;
    document.getElementById('role').value = role;

    console.log(status);
    console.log(role);
}
function deleteUser() {
    let userId = document.getElementById('userIdDelete').value;
    $.ajax({
        url: 'delete-account',
        type: 'GET',
        data: { userId: userId },
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModalDelete();
                showAlert();
            }else{
                document.getElementById("message").innerHTML = response.message;
                loadData();
                closeModalDelete();
                showAlert();
            }
        }
    })

}
document.getElementById('updateModal').addEventListener('submit', function(event) {
    event.preventDefault(); // Ngăn chặn form reload

    let userId = document.getElementById('userId').value;
    let status = document.getElementById('status').value;
    let role = document.getElementById('role').value;

    $.ajax({
        url: 'update-status-role-account',
        type: 'POST',
        data: { userId: userId, status: status, role: role },
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModalEdit();
                showAlert();
            }else{
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
        url: "accounts",
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
    let buttonsHTML = "";

    if (item.role === 'owner') {
        buttonsHTML = `
            <button style="background: #ccced0" class="delete-btn" disabled>Xóa</button>
            <button style="background: #ccced0" class="edit-btn"  disabled>Sửa</button>
        `;
    } else if (item.role === 'admin') {
        if (sessionUser.role === 'owner') {
            if (sessionUser.id === item.id) {
                buttonsHTML = `<button style="background: #ccced0" class="delete-btn" disabled>Xóa</button>`;
            } else {
                buttonsHTML = `
                    <button class="delete-btn" onclick="openDeleteModal(${item.id})">Xóa</button>
                    <button class="edit-btn" onclick="openEditModal(${item.id}, '${item.status}', '${item.role}')">Sửa</button>
                `;
            }
        } else {
            buttonsHTML = `
                <button style="background: #ccced0" class="delete-btn" disabled>Xóa</button>
                <button style="background: #ccced0" class="edit-btn" disabled>Sửa</button>
            `;
        }
    } else {
        buttonsHTML = `
            <button class="delete-btn" onclick="openDeleteModal(${item.id})">Xóa</button>
            <button class="edit-btn" onclick="openEditModal(${item.id}, '${item.status}', '${item.role}')">Sửa</button>
        `;
    }

    return buttonsHTML;

}
