<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng điều khiển Quản trị viên </title>
    <!------------------ Kiểu dáng ------------------>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/user.css">
    
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
                    <a href="user.html">
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
                    <a href="passwordManagement.html"> <ion-icon name="person"
                                                                 style="color: #000000; font-size: 25px;"></ion-icon></a>
                </div>
            </div>


            <!-------------------- Danh Sách Chi Tiết người dùng------------------ -->
            <div class="details-user">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Danh sách người dùng</h2>
                        <a href="#" class="btn">Xem Tất Cả</a>
                    </div>
                    <div class="update-user">
                        <p style="font-size: 20px; margin-bottom: 5px;">Cập nhật trạng thái người dùng</p>
                        <input type="text" placeholder="Nhập ID user cần cập nhật"
                            style="font-size: 15px; padding: 3px; border-radius: 5px;">
                        <select title="choice" id="statusSelect"
                            style="font-size: 15px; border-radius: 5px; padding: 2px;">
                            <option value="active">Hoạt động</option>
                            <option value="inactive">Không hoạt động</option>
                            <option value="pending">Đang chờ xử lý</option>
                            <option value="suspended">Bị đình chỉ</option>
                        </select>
                        <button onclick="updateUserStatus()">Cập nhật trạng thái</button>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <td>id</td>
                                <td>Tên người dùng</td>
                                <td>Email</td>
                                <td>Số điện thoại</td>
                                <td>Trạng thái</td>
                                <td>Vai trò</td>
                                <td>Hành động</td>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>TuanDev</td>
                                <td>22130313@gmail.com</td>
                                <td>0386394258</td>
                                <td><span class="statusText">Hoạt động</span></td>
                                <td>user</td>
                                <td>
                                    <div class="v">
                                        <button class="delete-btn" data-id="1">Xóa</button>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>2</td>
                                <td>TuanDev2</td>
                                <td>122130313@gmail.com</td>
                                <td>0386394258</td>
                                <td><span class="statusText">Không hoạt động</span></td>
                                <td>user</td>
                                <td>
                                    <div class="v">
                                        <button class="delete-btn" data-id="2">Xóa</button>

                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>3</td>
                                <td>TuanDev3</td>
                                <td>322130313@gmail.com</td>

                                <td>0386394258</td>
                                <td><span class="statusText">Hoạt động</span></td>
                                <td>user</td>
                                <td>
                                    <div class="v">
                                        <button class="delete-btn" data-id="3">Xóa</button>

                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>4</td>
                                <td>TuanDev4</td>
                                <td>422130313@gmail.com</td>
                                <td>0386394258</td>
                                <td><span class="statusText">Bị đình chỉ</span></td>
                                <td>user</td>
                                <td>
                                    <div class="v">
                                        <button class="delete-btn" data-id="4">Xóa</button>

                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>5</td>
                                <td>TuanDev5</td>
                                <td>522130313@gmail.com</td>

                                <td>0386394258</td>
                                <td><span class="statusText">Đang chờ xử lý</span></td>
                                <td>user</td>
                                <td>
                                    <div class="v">
                                        <button class="delete-btn" data-id="5">Xóa</button>
                                    </div>
                                </td>

                            </tr>



                        </tbody>
                    </table>
                </div>
                


            </div>

             <!-- Modal Xóa tài khoản -->
        <div id="delete-modal" class="modal">
            <div class="modal-content">
                <h3>Xác nhận xóa</h3>
                <label>Bạn có chắc chắn muốn xóa tài khoản này?</label>
                <div class="button-container">
                    <button class="confirm-delete">Xóa</button>
                    <button class="close-modal">Hủy</button>
                </div>
            </div>
        </div>
        </div>
       
    </div>

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="../js/index.js"></script>
    <script src="../js/passwordManagement.js"></script>


</body>

</html>