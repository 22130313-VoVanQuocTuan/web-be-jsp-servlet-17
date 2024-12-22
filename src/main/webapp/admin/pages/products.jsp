<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng điều khiển Quản trị viên </title>
    <!------------------ Kiểu dáng ------------------>
    <link rel="stylesheet" href="<c:url value="/admin/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/css/products.css"/>">

</head>


<body>
<!-- ------------------ Điều hướng -------------------->
<div class="container">
    <div class="navigation">
        <ul>
            <li>
                <a href="index.html">
                        <span class="icon">
                            <img src="/src/Users/img/logo.png" alt="">
                        </span>
                    <span class="title">Bán Vật Liệu Xây Dựng </span>
                </a>
            </li>

            <li>
                <a href="index.html">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                    <span class="title">Trang chủ</span>
                </a>
            </li>

            <li>
                <a href="user.jsp">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                    <span class="title">Khách Hàng</span>
                </a>
            </li>

            <li>
                <a href="products.html">
                        <span class="icon">
                            <ion-icon name="cube-outline"></ion-icon>
                        </span>
                    <span class="title">Sản phẩm</span>
                </a>
            </li>
            <li>
                <a href="order.html">
                        <span class="icon">
                            <ion-icon name="receipt-outline"></ion-icon>
                        </span>
                    <span class="title">Hóa đơn</span>
                </a>
            </li>


            <li>
                <a href="discount.html">
                        <span class="icon">
                            <ion-icon name="help-outline"></ion-icon>
                        </span>
                    <span class="title">Khuyến Mãi</span>
                </a>
            </li>
            <li>
                <a href="promotional.html">
                        <span class="icon">
                            <ion-icon name="pricetag-outline"></ion-icon>
                        </span>
                    <span class="title">Mã giảm giá</span>
                </a>
            </li>

            <li>
                <a href="category.html">
                        <span class="icon">
                            <ion-icon name="list-outline"></ion-icon>
                        </span>
                    <span class="title">Danh mục</span>
                </a>
            </li>
            <li>
                <a href="review.html">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                    <span class="title">Review</span>
                </a>
            </li>


            <li>
                <a href="passwordManagement.html">
                        <span class="icon">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                        </span>
                    <span class="title">Tài khoản</span>
                </a>
            </li>

            <li>
                <a href="/src/Users/page/login-signup.jsp">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                    <span class="title" onclick="lockout()">Đăng Xuất</span>
                </a>
            </li>
        </ul>
    </div>
    <!------------------- Chính ------------------>
    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>

            <div class="search">
                <label>
                    <input type="text" placeholder="Tìm kiếm ở đây">
                    <ion-icon name="search-outline"></ion-icon>
                </label>
            </div>

            <div class="user">
                <a href="passwordManagement.html">
                    <ion-icon name="person"
                              style="color: #000000; font-size: 25px;"></ion-icon>
                </a>

            </div>
        </div>

        <!-- Phần chính -->
        <div class="products">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>Danh sách sản phẩm</h2>
                    <a href="#" class="btn">Xem Tất Cả</a>
                </div>
                <div class="list-products-content-button">
                    <button id="add-product">Thêm sản phẩm</button>
                </div>
                <!-- Table products -->
                <table>
                    <thead>
                    <tr>
                        <th>Hình ảnh</th>
                        <th>Mã sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Các sản phẩm sẽ được thêm vào đây -->
                    <c:forEach var="product" items="${products}" begin="0" end="9">
                    <tr>
                        <td><img src="${product.imageUrl}" alt="${product.name}"></td>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td><fmt:formatNumber value="${product.discountPrice}" type="number"
                                              groupingUsed="true"/>₫</td>
                        <td>${product.quantity}</td>
                        <td>${product.status}</td>
                        <td> <fmt:formatDate value="${product.createDate}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                        <td class="v">
                            <button id="edit-product">Sửa</button>
                            <button id="deleteBtn">Xóa</button>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- Toast notification -->
                <div id="toast" class="toast">Thành công!</div>
                <!-- mẫu điền thêm sản phẩm  -->
                <div id="addProductModal" class="modal">
                    <div class="modal-content">
                        <h3>Thêm sản phẩm mới</h3>
                        <form id="addProductForm">
                            <label for="productName">Tên sản phẩm:</label>
                            <input type="text" id="productName">

                            <label for="productPrice">Giá:</label>
                            <input type="text" id="productPrice">

                            <label for="productCategory">Danh mục:</label>
                            <input type="text" id="productCategory">

                            <label for="productStock">Tồn kho:</label>
                            <input type="number" id="productStock">

                            <div class="modal-field">
                                <label for="npp">Nhà phân phối:</label>
                                <input type="text" id="npp" placeholder="Nhập nhà phân phối">
                            </div>
                            <div class="modal-field">
                                <label for="size">Kích thước:</label>
                                <input type="text" id="size" placeholder="Nhập kích thước">
                            </div>

                            <div class="modal-field">
                                <label for="color">Màu sắc:</label>
                                <input type="text" id="color" placeholder="Nhập màu sắc">
                            </div>

                            <div class="modal-field">
                                <label for="unit">Đơn vị tính:</label>
                                <input type="text" id="unit" placeholder="Nhập đơn vị tính">
                            </div>

                            <div class="modal-field">
                                <label for="description">Mô tả:</label>
                                <textarea id="description" rows="3" placeholder="Nhập mô tả sản phẩm"></textarea>
                            </div>
                            <label for="productStatus">Trạng thái:</label>
                            <select id="productStatus">
                                <option value="active">Còn hàng</option>
                                <option value="inactive">Hết hàng</option>
                            </select>

                            <label for="productImage">Hình ảnh:</label>
                            <input type="file" id="productImage">

                            <button id="save-Product">Lưu sản phẩm</button>
                            <button class="close-modal">Thoát</button>
                        </form>
                    </div>
                </div>
                <!-- Modal sửa thông tin sản phẩm -->
                <div id="editProductModal" class="modal">
                    <div class="modal-content">
                        <h3>Sửa sản phẩm</h3>
                        <form id="editProductForm">
                            <label for="productName">Tên sản phẩm:</label>
                            <input type="text" id="productName1">

                            <label for="productPrice">Giá:</label>
                            <input type="text" id="productPrice1">

                            <label for="productCategory">Danh mục:</label>
                            <input type="text" id="productCategory1">

                            <label for="productStock">Tồn kho:</label>
                            <input type="number" id="productStock1">

                            <div class="modal-field">
                                <label for="npp">Nhà phân phối:</label>
                                <input type="text" id="npp1" placeholder="Nhập mã sản phẩm">
                            </div>
                            <div class="modal-field">
                                <label for="size">Kích thước:</label>
                                <input type="text" id="size1" placeholder="Nhập kích thước">
                            </div>

                            <div class="modal-field">
                                <label for="color">Màu sắc:</label>
                                <input type="text" id="color1" placeholder="Nhập màu sắc">
                            </div>

                            <div class="modal-field">
                                <label for="unit">Đơn vị tính:</label>
                                <input type="text" id="unit1" placeholder="Nhập đơn vị tính">
                            </div>

                            <div class="modal-field">
                                <label for="description">Mô tả:</label>
                                <textarea id="description1" rows="3" placeholder="Nhập mô tả sản phẩm"></textarea>
                            </div>
                            <label for="productStatus">Trạng thái:</label>
                            <select id="productStatus1">
                                <option value="active">Còn hàng</option>
                                <option value="inactive">Hết hàng</option>
                            </select>

                            <label for="productImage">Hình ảnh:</label>
                            <input type="file" id="productImage1">

                            <button id="save-Product1">Lưu thay đổi</button>
                            <button class="close_modal">Thoát</button>
                        </form>
                    </div>
                </div>
                <!-- Modal xác nhận xóa -->
                <div id="deleteModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3>Xác nhận xóa</h3>
                        </div>
                        <p>Bạn chắc chắn muốn xóa sản phẩm này?</p>
                        <div class="modal-actions">
                            <button id="confirmDelete" class="confirm-delete">Xóa</button>
                            <button class="close-modal">Hủy</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="<c:url value="/admin/js/order.js"/>"></script>
    <script src="<c:url value="/admin/js/index.js"/>"></script>
    <script src="<c:url value="/admin/js/products.js"/>"></script>
</div>
</body>
</html>