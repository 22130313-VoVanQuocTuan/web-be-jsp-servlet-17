document.addEventListener("DOMContentLoaded", function () {
    getCategory();
    loadP();
// Gắn sự kiện cho nút phân trang
    document.getElementById("prev").addEventListener("click", function () {
        changePage(-1);
    });
    document.getElementById("next").addEventListener("click", function () {
        changePage(1);
    });
});

function loadP() {
    if (window.isFiltering) {
        console.log('Bỏ qua loadP vì đang lọc');
        return;
    }
    $.ajax({
        url: 'product',
        type: 'GET',
        success: function (data) {
            console.log(data);
            renderP(data);
        },
        error: function (xhr, status, error) {
            console.error("Lỗi khi tải sản phẩm:", error);
            document.getElementById("product-list").innerHTML = "<p>Đã xảy ra lỗi khi tải sản phẩm.</p>";
        }
    });
}

function renderP(data) {
    let html = '';
    data.forEach(product => {
        html += `
            <div class='name-cart'>
                <p style='position: absolute; padding: 8px; background-color: #ff0000; z-index: 5; border-radius: 10px;'>
                    ${product.discountPercent}%
                </p>
                <a href='product-detail?id=${product.id}&categoryId=${product.categoryId}'>
                    <img src='${product.imageUrl}' alt='${product.name}'></a>
                <h3>
                    <a style='color: #110ec6' href='product-detail?id=${product.id}&categoryId=${product.categoryId}'>
                        ${product.name}</a>
                </h3>
                <p>Giá: <del>${product.price}₫</del></p>
                <p style='color: #ff0000;'>Giá đã giảm: ${product.discountPrice}₫</p>
                <p>Giảm giá: ${product.discountPercent}%</p>
                <span style='margin-left: 10px;'><i class='fas fa-eye'></i> 
                    <span style='font-size: 0.9em;'>${product.view}</span></span>
                <span style='margin-left: 20px;'><i class='fas fa-shopping-cart'></i> 
                    <span style='font-size: 0.9em;'>${product.soldCount}</span></span>
                <a href='add-cart?id=${product.id}' class='add-cart'>
                    <i class='ri-add-circle-line'></i>Thêm</a>
            </div>`;
    });
    document.getElementById("product-list").innerHTML = html;
    displayProducts(currentPage);
}

$(document).on('click', '.filter-link', function (e) {
    e.preventDefault();
    e.stopPropagation(); // Ngăn sự kiện lan tỏa
    const filterValue = $(this).data('filter');
    const categoryId = $('#categoryId').val() || '';

    console.log('Bắt đầu lọc:', filterValue, 'CategoryId:', categoryId);

    // Đánh dấu trạng thái đang lọc
    window.isFiltering = true;

    $.ajax({
        url: `product-filter?filter=${filterValue}&categoryId=${categoryId}`,
        type: 'GET',
        success: function (data) {
            console.log('Dữ liệu lọc nhận được:', data);
            if (data && Array.isArray(data)) {
                renderP(data);
                currentPage = 1;
            } else {
                console.error('Dữ liệu không hợp lệ:', data);
                document.getElementById("product-list").innerHTML = "<p>Dữ liệu lọc không hợp lệ.</p>";
            }
        },
        error: function (xhr, status, error) {
            console.error("Lỗi khi lọc sản phẩm:", error, xhr.status, xhr.responseText);
            document.getElementById("product-list").innerHTML = "<p>Đã xảy ra lỗi khi lọc sản phẩm.</p>";
        },
        complete: function () {
            console.log('Hoàn thành yêu cầu lọc');
            // Reset trạng thái sau 500ms để cho phép các hành vi khác
            setTimeout(() => {
                window.isFiltering = false;
            }, 500);
        }
    });
});

document.addEventListener('click', function (event) {
    // Bỏ qua nếu click vào nút phân trang hoặc container phân trang
    const isClickInsidePagination = event.target.closest('#pagination');
    const isClickInsideItem = event.target.closest('.item');
    if (!isClickInsideItem && !isClickInsidePagination) {
        localStorage.removeItem('selectedCategory');
        items.forEach(el => el.classList.remove('active'));
        loadP();
    }
});

const productsPerPage = 12;
let currentPage = 1;

function displayProducts(page) {
    const products = document.querySelectorAll("#product-list .name-cart");
    const totalPages = Math.ceil(products.length / productsPerPage);

    if (products.length === 0) {
        console.warn("Không có sản phẩm nào để hiển thị.");
        document.getElementById("page-info").textContent = "Trang 1 của 1";
        document.getElementById("prev").disabled = true;
        document.getElementById("next").disabled = true;
        return;
    }

    page = Math.max(1, Math.min(page, totalPages));
    currentPage = page;

    products.forEach((product, index) => {
        product.style.display = "none";
        if (index >= (page - 1) * productsPerPage && index < page * productsPerPage) {
            product.style.display = ""; // Sử dụng giá trị CSS mặc định
        }
    });

    document.getElementById("page-info").textContent = `Trang ${page} của ${totalPages}`;
    document.getElementById("prev").disabled = (page === 1);
    document.getElementById("next").disabled = (page === totalPages);

    console.log(`Hiển thị trang ${page}, tổng số trang: ${totalPages}`);
}

function changePage(offset) {
    displayProducts(currentPage + offset);
}

function getCategory() {
    $.ajax({
        url: 'product-category',
        type: 'GET',
        success: function (data) {
            console.log("Danh mục:", data);
            if (data.categories && data.categories.length > 0) {
                loadCategory(data.categories);
            } else {
                console.warn("Không có danh mục nào được trả về.");
                document.getElementById("category-container").innerHTML = "<p>Không có danh mục nào.</p>";
            }
        },
        error: function (xhr, status, error) {
            console.error("Lỗi khi tải danh mục:", error);
            document.getElementById("category-container").innerHTML = "<p>Đã xảy ra lỗi khi tải danh mục.</p>";
        }
    });
}

function loadCategory(data) {
    let html = '';
    data.forEach(category => {
        html += `
          <h3>
              <button onclick="loadPCategoryById(${category.id})">
                     ${category.name}
              </button>
         </h3>
       `;
    });
    document.getElementById("category-container").innerHTML = html;
}

function loadPCategoryById(id) {
    $.ajax({
        url: "product-category?categoryId=" + id,
        type: "GET",
        success: function (data) {
            console.log(data);
            renderP(data.products);

        },

    });
}

const items = document.querySelectorAll('.left-sidebar .item');

const selectedCategory = localStorage.getItem('selectedCategory');
if (selectedCategory) {
    const selectedItem = document.querySelector(`[data-category="${selectedCategory}"]`);
    if (selectedItem) {
        selectedItem.classList.add('active');
    }
}

items.forEach(item => {
    item.addEventListener('click', function (event) {
        event.preventDefault();
        items.forEach(el => el.classList.remove('active'));
        item.classList.add('active');
        const category = item.getAttribute('data-category');
        localStorage.setItem('selectedCategory', category);
        loadPCategoryById(category);
    });
});

document.addEventListener('click', function (event) {
    const isClickInside = event.target.closest('.item');
    if (!isClickInside) {
        localStorage.removeItem('selectedCategory');
        items.forEach(el => el.classList.remove('active'));
        loadP();
    }
});