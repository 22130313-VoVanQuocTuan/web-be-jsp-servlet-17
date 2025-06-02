//------------------------------------------------- Hàm hiển thị chi tiết hóa đơn----------------------------------------------------
document.addEventListener("DOMContentLoaded", function () {
    loadInfoCustomer();

    document.getElementById("name").addEventListener("input", validation);
    document.getElementById("phone").addEventListener("input", validation);

})
function validation() {
   let name = document.getElementById("name");
    let phone = document.getElementById("phone");
    let errorName = document.getElementById("errorName");
    let errorPhone = document.getElementById("errorPhone");
   let saveChanges = document.getElementById("saveChanges");

    // Ẩn tất cả lỗi trước khi kiểm tra
    errorName.style.display = "none";
    errorPhone.style.display = "none";

    name.style.border = "1px solid #ccc";
    phone.style.border = "1px solid #ccc";
    saveChanges.disabled = false;

    let isValid = true;

    // Kiểm tra tên: không rỗng, không có số hoặc ký tự đặc biệt
    const nameRegex = /^[A-Za-zÀ-ỹ\s]+$/;
    if (!name.value.trim()) {
        errorName.textContent = "Tên không được để trống";
        errorName.style.display = "block";
        name.style.border = "1px solid red";
        isValid = false;

    } else if (!nameRegex.test(name.value)) {
        errorName.textContent = "Tên chỉ được chứa chữ cái và khoảng trắng";
        errorName.style.display = "block";
        name.style.border = "1px solid red";
        isValid = false;


    }

    // Kiểm tra số điện thoại: không rỗng, đúng định dạng
    const phoneRegex = /^[0-9]{9,11}$/;
    if (!phone.value.trim()) {
        errorPhone.textContent = "Số điện thoại không được để trống";
        errorPhone.style.display = "block";
        phone.style.border = "1px solid red";
        isValid = false;


    } else if (!phoneRegex.test(phone.value)) {
        errorPhone.textContent = "Số điện thoại phải từ 9–11 chữ số";
        errorPhone.style.display = "block";
        phone.style.border = "1px solid red";
        isValid = false;


    }
    if (!isValid){
        saveChanges.disabled= true;
        saveChanges.style.background = "#777373";
    }
    saveChanges.style.background = "#f7d774";
    return isValid; // Dùng để kiểm soát việc submit form

}

// Xác nhận thay đổi thông tin
document.getElementById("editInfoForm").addEventListener("submit", function (event) {
    event.preventDefault();
    const name = document.getElementById("name").value;
    const phone = document.getElementById("phone").value;
    const address = document.getElementById("address").value;
    $.ajax({
        url: "update-info",
        type: "POST",
        data: { fullName: name, phoneNumber: phone, address: address },
        success: function (response){
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModal1();
                showAlert();
            }else{
                loadInfoCustomer();
                document.getElementById("message").innerHTML = response.message;
                closeModal1();
                showAlert();

            }
        }
    })

})

// Hàm đóng modal
function closeModal() {
    document.getElementById('orderDetailModal').style.display = "none";
}

// Đóng modal khi click ra ngoài modal
window.onclick = function (event) {
    const modal = document.getElementById('orderDetailModal');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
// ---------------------------------------------------------Form Edit Information -----------------------------------------------------


// Đổi mật khâu
function openModalPass() {
    console.log("Modal mở");
    // Hiển thị modal
    document.getElementById('updatePassword').style.display = 'block';
}
document.getElementById("updatePass").addEventListener("submit", function (event) {
    event.preventDefault();
    const email = document.getElementById("email").value;
    const pass = document.getElementById("pass").value;
    const passConFirm = document.getElementById("passConfirm").value;
    $.ajax({
        url: "update-pass",
        type: "POST",
        data: { email: email, pass: pass,  passNew: passConFirm },
        success: function (response) {
            // Ẩn và reset các lỗi trước đó
            document.getElementById("errorEmail").style.display = "none";
            document.getElementById("errorEmail").innerText = "";

            document.getElementById("errorPass").style.display = "none";
            document.getElementById("errorPass").innerText = "";

            document.getElementById("errorPassConfirm").style.display = "none";
            document.getElementById("errorPassConfirm").innerText = "";
            if (response.errorEmail) {
                document.getElementById("errorEmail").style.display = "block";
                document.getElementById("errorEmail").innerHTML = response.errorEmail;
            }else
            if (response.errorPass) {
                document.getElementById("errorPass").style.display = "block";
                document.getElementById("errorPass").innerHTML = response.errorPass;
            }else
            if (response.errorPassNew) {
                document.getElementById("errorPassConfirm").style.display = "block";
                document.getElementById("errorPassConfirm").innerHTML = response.errorPassNew;
            }else{
              document.getElementById("message").innerHTML = response.message;
                loadInfoCustomer();
                closeModal1();
                showAlert();
            }
        }
    })

});

// Chỉnh sửa thông tin
function openModal1() {
    console.log("Modal mở");
    // Hiển thị modal
    document.getElementById('editInformationModal').style.display = 'block';

// Lấy dữ liệu từ phần thông tin khách hàng
    const name = document.querySelector('.customer-info p:nth-child(2) strong').nextSibling.nodeValue.trim();
    const phone = document.querySelector('.customer-info p:nth-child(4) strong').nextSibling.nodeValue.trim();
    const address = document.querySelector('.customer-info p:nth-child(5) strong').nextSibling.nodeValue.trim();
// Gán dữ liệu vào các trường input trong modal
    document.getElementById('name').value = name;
    document.getElementById('phone').value = phone;
    document.getElementById('address').value = address;
}


// Đóng modal
function closeModal1() {
    console.log("Modal đóng");
    document.getElementById('editInformationModal').style.display = 'none';
    document.getElementById('updatePassword').style.display = 'none';
    document.getElementById("email").value = "";
    document.getElementById("pass").value = "";
    document.getElementById("passConfirm").value = "";
    document.getElementById("name").value = "";
    document.getElementById("phone").value = "";
    document.getElementById("address").value = "";


}

function loadInfoCustomer() {
    $.ajax({
        url: "informationCustomer",
        type: "GET",
        success: function (data) {
            renderDataOrder(data.orders);
            renderDataInfo(data.info);
        }

    })
}

function renderDataOrder(data) {
    const tableBody = document.querySelector("#order tbody");

    tableBody.innerHTML = "";
    data.forEach(order => {
        const row = document.createElement("tr");
        row.innerHTML = `
                                <td>${order.id}</td>
                                <td>${order.createdAt}</td>
                                <td><div class="ellipsis">${order.shippingAddress}</div</td>
                                <td>${order.paymentStatus}</td>
                                <td>${order.status}</td>
                                <td>
                                   <button onclick="detailOrder(${order.id})">Xem</button>
                               </td>
                                <td>
                                    <!-- Nút hủy -->
                                    <button id="cancel-order-btn" onclick="openCloseOrder(${order.id})">Hủy đơn</button>
                                </td>
                            
                `;
        tableBody.appendChild(row);
    })
}

function renderDataInfo(data) {
    const html = `
                <h2>Thông tin khách hàng</h2>
            <p><strong>Tên:</strong> ${data.fullName}</p>
            <p><strong>Email:</strong> ${data.email}</p>
            <p><strong>Số điện thoại:</strong> ${data.phoneNumber}</p>
            <p><strong>Địa chỉ:</strong> ${data.address}</p>
            <div style="display: flex">
                <button class="edit-btn" onclick="openModal1()">Chỉnh sửa thông tin</button>
                <button class="editPass" onclick="openModalPass()">Đổi Mật Khẩu</button>
            </div>
     
    `;
    document.getElementById("infoUser").innerHTML = html;
}
function detailOrder(orderId){
    $.ajax({
      url: "informationCustomer?orderId=" + orderId,
      type: "GET",
      success: function (data) {
          renderDetailOrderItem(data.orderItem);
          renderDetailOrderInfo(data.orderInfo);
      }
  });
    document.getElementById("orderDetailModal").style.display = "block";
}
function renderDetailOrderItem(data) {

    const tableBody = document.querySelector("#orderDetail tbody");
    tableBody.innerHTML = "";
    data.forEach(oi => {
        const row = document.createElement("tr");
        row.innerHTML = `<td>${oi.productName}</td>
                        <td>${oi.quantity}</td>
                        <td>${oi.price.toLocaleString()}₫</td>
                        <td>${oi.discount.toLocaleString()}₫</td>
                        <td>${oi.totalPrice.toLocaleString()}₫</td>
                        <td><button type="button"  onclick="openReviewModal('${oi.productId}')">Đánh giá</button></td>`;
        tableBody.appendChild(row);
    })
}
function renderDetailOrderInfo(orderInfo){

    const html = `
    <p><strong>Mã đơn hàng:</strong> <span class="info-highlight">${orderInfo.id}</span></p>
                    <p><strong>Tổng tiền:</strong> <span class="info-highlight">${orderInfo.totalPrice.toLocaleString()} ₫</span></p>
                    <p><strong>Phí giao hàng:</strong> <span class="info-highlight">${orderInfo.shippingFee.toLocaleString()} ₫</span></p>
                    <p><strong>Số tiền giảm giá:</strong> <span class="info-highlight total-price">${orderInfo.discountAmount.toLocaleString()} ₫</span></p>
                    <p><strong>Phương thức thanh toán:</strong> <span
                            class="badge success">${orderInfo.paymentMethod}</span></p>
                    <p><strong>Trạng thái thanh toán:</strong> <span
                            class="badge success">${orderInfo.paymentStatus}</span></p>
                    <p><strong>Trạng thái đơn hàng:</strong><span
                            class="badge success">${orderInfo.status}</span></p>
                    <p><strong>Địa chỉ:</strong>${orderInfo.shippingAddress}</p>
                    <p><strong>Số lượng:</strong>${orderInfo.quantity}</p>
                    <p><strong>Email:</strong>${orderInfo.email}</p>
                    <p><strong>Người nhận hàng:</strong>${orderInfo.name}</p>
                    <p><strong>Số điện thoại:</strong>${orderInfo.phoneNumber}</p>
                    <p><strong>Ghi chú:</strong>${orderInfo.note}</p>
    `;
    document.getElementById("order-info").innerHTML = html;
}

function openCloseOrder(orderId) {
    document.getElementById("orderId").value = orderId;
    document.getElementById("cancelOrderModal").style.display = "block";

}
document.getElementById("cancelOrderForm").addEventListener("submit", function (event){

    event.preventDefault();
    const orderId = document.getElementById("orderId").value;
    console.log(orderId)
    $.ajax({
        url: "delete-order-infor?orderId=" + orderId,
        type: "GET",
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                console.log(response.error);
                closeModalsCancelOrderModal();
                showAlert();
            }else{
                loadInfoCustomer();
                document.getElementById("message").innerHTML = response.message;
                closeModalsCancelOrderModal();
                showAlert();

            }
        }
    })
});

function closeModalsCancelOrderModal(){
    document.getElementById("cancelOrderModal").style.display = "none";
}

function openReviewModal(productId) {
    document.getElementById("productId").value = productId;
    document.getElementById("reviewModal").style.display = "block";
}

function closeModal2() {
    document.getElementById("reviewModal").style.display = "none";
}

$(document).ready(function () {
    $('#ratingForm').submit(function (e) {
        e.preventDefault(); // Ngăn reload trang
        const productId = $('#productId').val();
        const userId = $('#userId').val();
        const content = $('textarea[name="content"]').val();
        console.log("Product ID:", productId);
        console.log("User ID:", userId);
        console.log("Content:", content);
        $.ajax({
            url: 'create-rating',
            type: 'POST',
            data: {
                productId: productId,
                userId: userId,
                content: content
            },
            success: function (response) {
                if (response.status === "success") {
                    $('#ratingResult').css("color", "green").text(response.message || "Đánh giá thành công.");
                    $('#ratingForm')[0].reset(); // Reset form sau khi gửi
                    setTimeout(() => {
                        $('#reviewModal').hide(); // Đóng modal
                        $('#ratingResult').text("");
                    }, 500);
                } else {
                    $('#ratingResult').css("color", "red").text(response.message || "Có lỗi xảy ra.");
                }
            },
            error: function (xhr, status, error) {
                console.error(error);
                $('#ratingResult').css("color", "red").text("Không thể gửi đánh giá. Vui lòng thử lại sau.");
            }
        });
    });
});


