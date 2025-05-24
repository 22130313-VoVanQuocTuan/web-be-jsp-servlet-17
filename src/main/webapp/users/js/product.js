// Biến toàn cục
let currentProducts = []; // Lưu danh sách sản phẩm hiện tại
const productsPerPage = 12;
let currentPage = 1;
let currentCategoryId = null;

function initProductPage(filterCategoryId) {
    document.addEventListener("DOMContentLoaded", function () {
        getCategory();
        const keyword = document.body.getAttribute("data-keyword");
        if (keyword && keyword.trim() !== "") {
            searchByName(keyword);
        } else if (filterCategoryId !== null && filterCategoryId > 0) {
            loadPCategoryById(parseInt(filterCategoryId));
        } else {
            loadP();
        }

        document.getElementById("prev").addEventListener("click", function (e) {
            e.stopPropagation();
            changePage(-1);
        });

        document.getElementById("next").addEventListener("click", function (e) {
            e.stopPropagation();
            changePage(1);
        });
    });
}

// Tải danh sách sản phẩm ban đầu
function loadP() {
    if (window.isFiltering) {
        console.log('Bỏ qua loadP vì đang lọc');
        return;
    }
    $.ajax({
        url: 'product', type: 'GET', success: function (data) {
            console.log(data);
            currentProducts = data; // Lưu danh sách sản phẩm gốc
            renderP(data);
        }, error: function (xhr, status, error) {
            console.error("Lỗi khi tải sản phẩm:", error);
        }
    });
}

// Render danh sách sản phẩm
function renderP(data) {
    currentProducts = data; // Cập nhật danh sách sản phẩm hiện tại
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
                <p>Giá: <del>${product.price.toLocaleString()} ₫</del></p>
                <p style='color: #ff0000;'>Giá đã giảm: ${product.discountPrice.toLocaleString()}₫</p>
                <p>Giảm giá: ${product.discountPercent}%</p>
                <span style='margin-left: 10px;'><i class='fas fa-eye'></i> 
                    <span style='font-size: 0.9em;'>${product.view}</span></span>
                <span style='margin-left: 20px;'><i class='fas fa-shopping-cart'></i> 
                    <span style='font-size: 0.9em;'>${product.soldCount}</span></span>
                 <button class='add-cart' onclick="addCart(${product.id})">
                    <i class='ri-add-circle-line'></i>Thêm</button>
            </div>`;
    });
    document.getElementById("product-list").innerHTML = html;
    displayProducts(currentPage);
}

// Hiển thị sản phẩm theo trang
function displayProducts(page) {
    if (currentCategoryId !== null && !isNaN(currentCategoryId) && currentCategoryId > 0) {
        loadPCategoryById(currentCategoryId);
        return;
    }

    if (!currentProducts || currentProducts.length === 0) {
        console.warn("Không có sản phẩm nào để hiển thị.");
        document.getElementById("product-list").innerHTML = "<p>Không có sản phẩm nào.</p>";
        document.getElementById("page-info").textContent = "Trang 1 của 1";
        document.getElementById("prev").disabled = true;
        document.getElementById("next").disabled = true;
        return;
    }

    const totalPages = Math.ceil(currentProducts.length / productsPerPage);
    page = Math.max(1, Math.min(page, totalPages));
    currentPage = page;

    let html = '';
    const start = (page - 1) * productsPerPage;
    const end = Math.min(start + productsPerPage, currentProducts.length);
    for (let i = start; i < end; i++) {
        const product = currentProducts[i];
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
                <p>Giá: <del>${product.price.toLocaleString()}₫</del></p>
                <p style='color: #ff0000;'>Giá đã giảm: ${product.discountPrice.toLocaleString()}₫</p>
                <p>Giảm giá: ${product.discountPercent}%</p>
                <span style='margin-left: 10px;'><i class='fas fa-eye'></i> 
                    <span style='font-size: 0.9em;'>${product.view}</span></span>
                <span style='margin-left: 20px;'><i class='fas fa-shopping-cart'></i> 
                    <span style='font-size: 0.9em;'>${product.soldCount}</span></span>
                <button type="button" onclick="addCart(${product.id})" class="add-cart" data-id="${product.id}">    
                    <i class='ri-add-circle-line'></i>Thêm</button>
            </div>`;
    }

    document.getElementById("product-list").innerHTML = html;
    document.getElementById("page-info").textContent = `Trang ${page} của ${totalPages}`;
    document.getElementById("prev").disabled = (page === 1);
    document.getElementById("next").disabled = (page === totalPages);

    console.log(`Hiển thị trang ${page}, tổng số trang: ${totalPages}`);
}

// Chuyển trang
function changePage(offset) {
    displayProducts(currentPage + offset);
}

// Lọc sản phẩm
$(document).on('click', '.filter-link', function (e) {
    e.preventDefault();
    e.stopPropagation();
    const filterValue = $(this).data('filter');
    const categoryId = $('#categoryId').val() || '';

    console.log('Bắt đầu lọc:', filterValue, 'CategoryId:', categoryId);

    window.isFiltering = true;

    $.ajax({
        url: `product-filter?filter=${filterValue}&categoryId=${categoryId}`, type: 'GET', success: function (data) {
            console.log('Dữ liệu lọc nhận được:', data);
            if (data && Array.isArray(data)) {
                currentProducts = data;
                currentPage = 1; // Mặc định về trang 1 sau khi lọc
                renderP(data);
            } else {
                console.error('Dữ liệu không hợp lệ:', data);
                document.getElementById("product-list").innerHTML = "<p>Dữ liệu lọc không hợp lệ.</p>";
            }
        }, error: function (xhr, status, error) {
            console.error("Lỗi khi lọc sản phẩm:", error, xhr.status, xhr.responseText);
            document.getElementById("product-list").innerHTML = "<p>Đã xảy ra lỗi khi lọc sản phẩm.</p>";
        },
    });
});

// Tải danh mục
function getCategory() {
    $.ajax({
        url: 'product-category', type: 'GET', success: function (data) {
            console.log("Danh mục:", data);
            if (data.categories && data.categories.length > 0) {
                loadCategory(data.categories);
            } else {
                console.warn("Không có danh mục nào được trả về.");
                document.getElementById("category-container").innerHTML = "<p>Không có danh mục nào.</p>";
            }
        }, error: function (xhr, status, error) {
            console.error("Lỗi khi tải danh mục:", error);
            document.getElementById("category-container").innerHTML = "<p>Đã xảy ra lỗi khi tải danh mục.</p>";
        }
    });
}

// Render danh mục
function loadCategory(data) {
    let html = '';
    data.forEach(category => {
        html += `
                <h3>
                    <button onclick="loadPCategoryById(${category.id})">
                        ${category.name}
                    </button>
                </h3>`;
    });
    document.getElementById("category-container").innerHTML = html;
}

// laoad sản phẩm theo danh mục
function loadPCategoryById(id) {
    if (window.isFiltering) return; // Ngăn double-call
    console.log('Tải sản phẩm theo danh mục, id:', id);
    currentCategoryId = parseInt(id);
    window.isFiltering = true;

    $.ajax({
        url: `product-category?categoryId=${id}`, type: "GET", success: function (data) {
            console.log('Dữ liệu sản phẩm theo danh mục:', data);
            currentProducts = data.products || data;
            currentPage = 1;
            renderP(currentProducts);
            window.isFiltering = false;
        }, error: function (xhr, status, error) {
            console.error("Lỗi khi tải sản phẩm theo danh mục:", error);
            window.isFiltering = false;
        }
    });
}

// Xử lý sidebar danh mục
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
        currentCategoryId = parseInt(category);
        loadPCategoryById(category);
    });
});

document.addEventListener('click', function (event) {
    const isClickInside = event.target.closest('.item') || event.target.closest('#prev') || event.target.closest('#next');
    if (!isClickInside) {
        localStorage.removeItem('selectedCategory');
        items.forEach(el => el.classList.remove('active'));
        if (currentCategoryId === null) {
            loadP();
        }
    }
});


function addCart(id) {
    $.ajax({
        url: "add-cart", type: "GET", dataType: "json", data: {
            id: id,
        }, success: function (res) {
            if (res.status === "success") {
                $.ajax({
                    url: "cart-items", type: "GET", dataType: 'json', success: function (data) {
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