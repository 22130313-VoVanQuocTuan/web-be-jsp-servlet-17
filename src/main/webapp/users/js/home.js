
// thiết lập chạy chào mừng
document.addEventListener("DOMContentLoaded", function() {
    const textElement = document.getElementById('animatedText');
    const textContent = textElement.textContent;


    let index = 0;
  
    function animateText() {
      if (index < textContent.length) {
        textElement.textContent = textContent.slice(0, index + 1);
        index++;
      } else {
        // Khi hoàn tất, chờ một lúc rồi lặp lại
        index = 0;
        setTimeout(animateText, 1000);  // Nghỉ 1 giây rồi chạy lại
        return;
      }
      setTimeout(animateText, 100); // Tốc độ đánh chữ (100ms mỗi chữ)
    }

    // Bắt đầu chạy hiệu ứng
    animateText();


    const checkCart = document.getElementById('carts');
    checkCart.addEventListener('click', function (event) {
      event.preventDefault(); // Ngăn chặn chuyển hướng mặc định của thẻ <a>
      const session = localStorage.getItem('username'); // Kiểm tra session
      if (session !== null) {
        window.location.href = "../page/cart.jsp"; // Chuyển hướng đến giỏ hàng
      } else {
        window.location.href = "../../src/Users/page/login-signup.jsp"; // Chuyển hướng đến trang đăng nhập
      }
    });
    const checkCart2 = document.getElementById('cartss');
    checkCart2.addEventListener('click', function (event) {
      event.preventDefault(); // Ngăn chặn chuyển hướng mặc định của thẻ <a>
      const session = localStorage.getItem('username'); // Kiểm tra session
      if (session !== null) {
        window.location.href = "../page/cart.jsp"; // Chuyển hướng đến giỏ hàng
      } else {
        window.location.href = "../../src/Users/page/login-signup.jsp"; // Chuyển hướng đến trang đăng nhập
      }
    });

    
   // Lấy tất cả các thẻ có class 'add-to-cart'
const addToCartButtons = document.querySelectorAll('.add-to-cart');

// Lặp qua từng thẻ và gắn sự kiện 'click'
addToCartButtons.forEach(function(button) {
    button.addEventListener('click', function() {
        // Kiểm tra người dùng đã đăng nhập chưa
        const session = localStorage.getItem('username'); // Kiểm tra trong localStorage

        if (session === null) { // Nếu chưa đăng nhập
            // Chuyển hướng đến trang đăng nhập
            window.location.href = "../../src/Users/page/login-signup.jsp";
        } else {
            // Nếu đã đăng nhập, thực hiện thêm vào giỏ hàng
            alert("Đã thêm vào giỏ hàng!");
            // Thêm các thao tác thêm vào giỏ hàng tại đây
        }
    });
});

});

function addCart(id) {
    $.ajax({
        url: "add-cart",
        type: "GET",
        dataType: "json",
        data: {
            id: id,
        },
        success: function (res) {
            if (res.status === "success") {
                $.ajax({
                    url: "cart-items",
                    type: "GET",
                    dataType: 'json',
                    success: function (data) {
                        $("#subtotal .value").text(data.totalPrice.toLocaleString());
                        $("#vat .value").text(data.totalShippingFee.toLocaleString());
                        $("#total .value").text(data.totalFinalPrice.toLocaleString());
                        $("#cart-count").text(data.totalItem);
                        window.location.href = "turn-page?action=cart";
                    }
                });


            } else if (res.status === "unauthenticated") {
                window.location.href = "logout";
            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX lỗi:", error);
            console.log("Chi tiết lỗi:", xhr.responseText);
        }
    });
}





