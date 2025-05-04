document.addEventListener('DOMContentLoaded', function () {
    loadCartItems();
    refreshCart();
    
    // Áp dụng mã giảm giá
    const applyBtn = document.getElementById('apply-btn');
    const voucherInput = document.getElementById('voucher');
    const voucherError = document.getElementById('voucher-error');
    const totalElement = document.getElementById('total');

    applyBtn.addEventListener('click', function () {
        const voucherCode = voucherInput.value.trim();
        const validVoucher = "QWERTYUI";
        const discountAmount = 10000; // Giảm 10.000 ₫

        if (voucherCode === validVoucher) {
            voucherError.textContent = "Bạn được giảm 10.000 ₫";
            voucherError.style.color = 'green';
            voucherError.style.display = 'block';

            let total = parseFloat(totalElement.textContent.replace('₫', '').replace(/\./g, ''));
            total -= discountAmount;
            totalElement.textContent = total.toLocaleString('vi-VN') + ' ₫';
        } else {
            voucherError.textContent = "Mã giảm giá không hợp lệ!";
            voucherError.style.color = 'red';
            voucherError.style.display = 'block';
        }
    });
});

function loadCartItems() {
    $.ajax({
        url: 'cart-items',
        type: 'GET',
        success: function (data) {
            console.log("Dữ liệu nhận về:", data); // <-- Bạn có thấy log không?
            console.log("Kiểu dữ liệu:", typeof data);
            renderCartItems(data);

        },
        error: function (xhr, status, error) {
            console.error("Lỗi AJAX:", error);
        }
    });
}

function renderCartItems(data) {
    const tableCart = document.querySelector("#tableCart tbody");
    tableCart.innerHTML="";

    data.cartItems.forEach(listItems => {
        const row = document.createElement("tr");
         row.innerHTML = `
                <td>${listItems.name}</td>
                <td><img src="${listItems.imageUrl}" alt="${listItems.name}" width="50" height="50"></td>
                <td>
                    <div class="quantity" style="display: flex;" data-id="${listItems.id}">
                        <button class="qty-btn minus-btn">-</button>
                        <input title="input" type="number" value="${listItems.quantity}" class="qty-input" min="1" />
                        <button class="qty-btn plus-btn">+</button>
                    </div>
                </td>
                <td>${listItems.price.toLocaleString()}₫</td>
                <td>${listItems.discountAmount.toLocaleString()}₫</td>
                <td>${listItems.totalPrice.toLocaleString()}₫</td>
                <td><button onclick="openModek(${listItems.id})" class="remove-from-cart-button">Xóa</button></td>
        `;
        tableCart.append(row);
    });
}

$(document).on("click", ".plus-btn, .minus-btn", function () {
    const parentDiv = $(this).closest(".quantity");
    const input = parentDiv.find(".qty-input");
    const id = parentDiv.data("id"); // Lấy id sản phẩm
    let currentQty = parseInt(input.val());

    if ($(this).hasClass("plus-btn")) {
        currentQty++;
    } else {
        if (currentQty > 1) currentQty--;
    }

    input.val(currentQty); // Cập nhật input hiển thị

    // Gửi AJAX lên server để cập nhật số lượng
    $.ajax({
        url: "update-cart",
        type: "GET",
        data: {
            id: id,
            quantity: currentQty
        },
        success: function (res) {
            if (res.status === "success") {
                // Sau khi update xong, gọi lại renderCart để cập nhật lại toàn bộ
                refreshCart();
            } else {
                alert("Lỗi khi cập nhật số lượng.");
            }
        }
    });
});

function refreshCart() {
    $.ajax({
        url: "cart-items",
        type: "GET",
        dataType: 'json',
        success: function (data) {
            renderCartItems(data);
            $("#subtotal .value").text(data.totalPrice.toLocaleString());
            $("#vat .value").text(data.totalShippingFee.toLocaleString());
            $("#total .value").text(data.totalFinalPrice.toLocaleString());
            $("#cart-count").text(data.totalItem);
        }
    });
}

//Xoá sanr pham trong gio hang
function openModek(id) {
    document.getElementById('cartIdDelete').value = id;
    document.getElementById('delete-modal').style.display = 'block';
}

function  closeModals(){
    document.getElementById("delete-modal").style.display = "none";
}

// Xử lý khi nhấn nút "Xóa"
function deleteProduct() {
    let cartId = document.getElementById('cartIdDelete').value;
    $.ajax({
        url: 'cart-remove',
        type: 'GET',
        data: { id: cartId },
        success: function (response) {
            if (response.error) {
                document.getElementById("message").innerHTML = response.message;
                closeModals();
                showAlert();
            }else{
                loadCartItems();
                refreshCart();
                document.getElementById("message").innerHTML = response.message;
                closeModals();
                showAlert();

            }
        }
    })

}