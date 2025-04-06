/// ---------------------------Hiển thị js AJAX của banner Slider---------------------------------
$(document).ready(function () {
    $.ajax({
        url: 'home-page',
        method: 'GET',
        success: function (response) {
            console.log(response); // Kiểm tra cấu trúc dữ liệu

            if (response.banners && Array.isArray(response.banners)) {
                var sliderContent = '';
                response.banners.forEach(function (banner) {
                    sliderContent += '<img src="' + banner.image_url + '" alt="banner" style="width:100%; margin-bottom:10px;">';
                });
                $('#slider-wrapper').html(sliderContent);  // Thêm ảnh vào slider-wrapper
            } else {
                alert("Dữ liệu trả về không phải là mảng!");
            }
        },
        error: function () {
            alert('Lỗi tải slider');
        }
    });
});

// Slider image
const rightbtn = document.querySelector('.nut_phai');
const leftbtn = document.querySelector('.nut_trai');
const sliderWrapper = document.querySelector('#slider-wrapper'); // Đảm bảo lấy đúng phần tử chứa ảnh
let index = 0;

rightbtn.addEventListener("click", function () {
    index = (index + 1) % sliderWrapper.children.length;  // Di chuyển qua phải
    updateSlider();
});

leftbtn.addEventListener("click", function () {
    index = (index - 1 + sliderWrapper.children.length) % sliderWrapper.children.length;  // Di chuyển qua trái
    updateSlider();
});

function updateSlider() {
    const offset = -index * 100;  // Tính toán offset
    sliderWrapper.style.transform = `translateX(${offset}%)`;  // Dịch chuyển ảnh
    console.log("Current Index:", index); // Kiểm tra giá trị index
}

// Làm silder image tự chạy.
function imgAuto() {
    index = (index + 1) % sliderWrapper.children.length;  // Tự động di chuyển
    updateSlider();
    console.log(index);
}
setInterval(imgAuto, 5000);  // Mỗi 5 giây, slider tự động chuyển

/// ---------------------------Hiển thị js AJAX của banner ad quảng cáo-----------------------
$(document).ready(function () {
    $.ajax({
        url: "home-page",
        method: "GET",
        success: function (response) {
            console.log(response);
            if (response.error) {
                document.getElementById('message').innerHTML = response.message;
                showAlert();
            } else {
                if (response.banner) {
                    // Cập nhật ảnh cho popup
                    $('#popupBannerImage').attr('src', response.banner.image_url);
                    $('#popupBanner').show();
                } else {
                    alert("Không có banner loại 'ad' để hiển thị.");
                }
            }
        },
        error: function () {
            alert('Lỗi tải banner.');
        }
    })
})

// Hàm đóng popup
function closePopup() {
    $('#popupBanner').hide();
}
