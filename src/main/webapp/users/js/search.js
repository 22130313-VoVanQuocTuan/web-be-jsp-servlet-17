document.addEventListener("DOMContentLoaded", function () {
    if (window.location.href.includes("action=product")) {
        // Lấy giá trị keyword từ thuộc tính data-keyword trong thẻ <body>
        const keyword = document.body.getAttribute("data-keyword");
        if (keyword && keyword.trim() !== "") {
            searchByName(keyword);
        } else {
            //  Nếu không có keyword hoặc keyword rỗng, kiểm tra xem hàm loadP có được định nghĩa không
            if (typeof loadP === "function") {
                loadP();
            }
        }
    }
    // Lấy đối tượng input tìm kiếm theo id "search-input"
    const searchInput = document.getElementById("search-input");

    if (searchInput) {
        //  Gắn sự kiện lắng nghe bàn phím (keypress) cho input này
        searchInput.addEventListener("keypress", function (e) {
            if (e.key === "Enter") {
                // Ngăn hành động mặc định (ví dụ gửi form hoặc xuống dòng)
                e.preventDefault();
                triggerSearch();
            }
        });
    }
});

function triggerSearch() {
    const keyword = document.getElementById("search-input").value.trim();
    if (keyword !== "") {
        window.location.href = `turn-page-noLogin?action=product&keyword=${encodeURIComponent(keyword)}`;
    }
}

// Gửi AJAX tới servlet để lấy danh sách sản phẩm theo tên
function searchByName(keyword) {
    window.isFiltering = true;
    $.ajax({
        url: 'search-product',
        type: 'GET',
        data: { name: keyword },
        success: function (data) {
            renderP(data);
            window.isFiltering = false;
        },
        error: function (xhr, status, error) {
            console.error("Lỗi khi tìm kiếm sản phẩm:", error);
            window.isFiltering = false;
        }
    });
}
