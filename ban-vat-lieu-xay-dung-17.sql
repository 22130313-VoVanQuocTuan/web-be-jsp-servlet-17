/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : ban-vat-lieu-xay-dung-17

 Target Server Type    : MariaDB
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 16/04/2025 15:28:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addressshipping
-- ----------------------------
DROP TABLE IF EXISTS `addressshipping`;
CREATE TABLE `addressshipping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `updateDate` datetime NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `addressshipping_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of addressshipping
-- ----------------------------
INSERT INTO `addressshipping` VALUES (1, 1, 'linh xuân thủ đứ', 'Huy Lâm', 'lamhuybmt124@gmail.com', '0824646746', '2025-01-05 15:56:53', '2025-01-07 16:06:35', 'Giao tới');
INSERT INTO `addressshipping` VALUES (4, 12, 'wewethoong thanh ', 'Võ Văn Quốc Tuấn-22130313', 'votuan042004@gmail.com', '0324324324', '2025-01-13 15:35:50', '2025-03-16 13:55:31', '');
INSERT INTO `addressshipping` VALUES (9, 14, 'wewethoong thanh dsfffffffffffffffffffffffffffffffffewewtwetrwtretffffffffffffffffffffffffDSFDSF', 'Võ Văn Quốc Tuấn-22130313', 'votuan042004@gmail.com', '0324324324', '2025-03-16 11:25:25', '2025-04-12 14:55:57', '');
INSERT INTO `addressshipping` VALUES (10, 18, 'wewethoong thanh ohnfndhdhdhdhdhdhdhdhdhdhdhhdhdhdhdhdhdhdhdhdhd', 'Võ Văn Quốc Tuấn-22130313', 'votuan042004@gmail.com', '0324324324', '2025-04-03 10:24:28', '2025-04-03 10:24:28', '');
INSERT INTO `addressshipping` VALUES (11, 3, 'wewethoong thanh ohnfndhdhdhdhdhdhdhdhdhdhdhhdhdhdhdhdhdhdhdhdhd', 'Võ Văn Quốc Tuấn-22130313', 'votuan042004@gmail.com', '0324324324', '2025-04-04 22:05:56', '2025-04-04 22:05:56', '');
INSERT INTO `addressshipping` VALUES (12, 19, 'wewethoong thanh ohnfndhdhdhdhdhdhdhdhdhdhdhhdhdhdhdhdhdhdhdhdhd', 'Võ Văn Quốc Tuấn-22130313', 'votuan042004@gmail.com', '0324324324', '2025-04-06 15:25:21', '2025-04-06 15:25:21', '');
INSERT INTO `addressshipping` VALUES (13, 25, 'wewethoong thanh ohnfndhdhdhdhdhdhdhdhdhdhdhhdhdhdhdhdhdhdhdhdhd', 'Võ Văn Quốc Tuấn-22130313', 'votuan042004@gmail.com', '0324324324', '2025-04-13 17:32:21', '2025-04-13 17:32:21', '');

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (1, 'https://engizinsaat.com/images/engizslider/engiz-insaat-48313924.jpg', 'slider');
INSERT INTO `banners` VALUES (2, 'https://neziran.com.tr/wp-content/uploads/2015/03/slider.jpg', 'slider');
INSERT INTO `banners` VALUES (3, 'https://kazgazeta.kz/media/2022/10/28/1527.jpg', 'slider');
INSERT INTO `banners` VALUES (4, 'https://hanazay.net/wp-content/uploads/2023/12/hanazay-slide006.webp', 'slider');
INSERT INTO `banners` VALUES (5, 'https://www.msagroup.org/wp-content/uploads/2020/10/1.jpg', 'slider');
INSERT INTO `banners` VALUES (6, 'https://zhalagash-zharshysy.kz/wp-content/uploads/2022/12/karausyz-kurylys.jpg', 'slider');
INSERT INTO `banners` VALUES (7, 'https://i.pinimg.com/736x/84/47/74/844774b17c3a5f3296765a085d1fa5d1.jpg', 'ad');

-- ----------------------------
-- Table structure for cartitems
-- ----------------------------
DROP TABLE IF EXISTS `cartitems`;
CREATE TABLE `cartitems`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartId` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `price` decimal(18, 2) NULL DEFAULT NULL,
  `totalPrice` decimal(18, 2) NULL DEFAULT NULL,
  `discountAmount` decimal(10, 2) NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `updateDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cartId`(`cartId`) USING BTREE,
  INDEX `productId`(`productId`) USING BTREE,
  CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `carts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cartitems
-- ----------------------------

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `promotionalId` int(11) NULL DEFAULT NULL,
  `totalItem` int(11) NULL DEFAULT NULL,
  `totalPrice` decimal(18, 2) NULL DEFAULT NULL,
  `discountAmount` decimal(10, 2) NULL DEFAULT NULL,
  `shippingFee` decimal(10, 2) NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `updateDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `promotionalId`(`promotionalId`) USING BTREE,
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`promotionalId`) REFERENCES `promotional` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Gạch xây dựng', '2024-01-01 08:00:00', 0);
INSERT INTO `category` VALUES (2, 'Xi măng và Vữa', '2024-02-01 09:00:00', 0);
INSERT INTO `category` VALUES (3, 'Cát,Đá và Sỏi', '2024-03-01 10:00:00', 0);
INSERT INTO `category` VALUES (4, 'Thép và Sắt', '2024-04-01 11:00:00', 0);
INSERT INTO `category` VALUES (5, 'Gỗ và Vật liệu gỗ', '2024-05-01 12:00:00', 0);
INSERT INTO `category` VALUES (6, 'Sơn và Phụ gia', '2024-06-01 13:00:00', 0);
INSERT INTO `category` VALUES (7, 'Ngói và Tấm lợp', '2024-07-01 14:00:00', 0);
INSERT INTO `category` VALUES (8, 'Ống nước và Phụ kiện', '2024-08-01 15:00:00', 0);
INSERT INTO `category` VALUES (9, 'Thiết bị điện nước', '2024-09-01 16:00:00', 0);

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `minimumQuantity` int(11) NULL DEFAULT NULL,
  `maximumQuantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE INDEX `idx_product_id`(`productId`) USING BTREE,
  CONSTRAINT `fk_inventory_product` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (1, 'Gạch chịu lửa', -1, 'Sắp hết hàng', 30, 1000);
INSERT INTO `inventory` VALUES (2, 'Gạch đinh đặc', 476, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (3, 'Gạch Hiệp Phụng', 180, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (4, 'Gạch Tuynel', 178, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (5, 'Gạch không nung', 88, 'Sắp hết hàng', 100, 1000);
INSERT INTO `inventory` VALUES (6, 'Gạch Tuynel Hiếu', 153, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (7, 'Gạch Ngọc Chung', 980, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (8, 'Gạch Ngọc Hiếu', 136, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (9, 'Gạch Trọng Nghĩa', 110, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (10, 'Gạch DanaBU03', 150, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (11, 'Gạch Đá Đen', 180, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (12, 'Gạch Xây Tường', 160, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (13, 'Gạch Bông', 140, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (14, 'Gạch Men', 170, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (15, 'Gạch Nhựa', 110, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (16, 'Gạch Tàu', 190, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (17, 'Xi măng SCG-PC40-ELE', 99, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (18, 'Xi măng Victem Hà Tiến', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (19, 'Xi măng đa dụng ECO', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (20, 'Xi măng FICO CEMENT', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (21, 'Xi măng Allyuild', 99, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (22, 'Xi măng Holcim', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (23, 'Xi măng Inceeco', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (24, 'Xi măng PCP 40-MS', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (25, 'Xi măng Tây Đô', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (26, 'Xi măng Viccem Hạ Long', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (27, 'Xi măng Viccem Hà Tiên', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (28, 'Xi măng CẨM PHẢ-NB', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (29, 'Xi măng chống thấm SOTIN', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (30, 'Xi măng đa dụng INSEE', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (31, 'Xi măng SHAH CEMENT', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (32, 'Xi măng TẤN THĂNG', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (33, 'Xi măng Nghi Sơn', 100, 'Còn hàng', 10, 200);
INSERT INTO `inventory` VALUES (34, 'Thép cốt bê tông', 100, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (35, 'Thép cuộn SS400', 150, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (36, 'Thép thanh vằn', 120, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (37, 'Thanh thép hình I', 100, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (38, 'Ống thép mạ kẽm', 200, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (39, 'Ống thép hộp', 180, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (40, 'Thép hộp chữ nhật', 150, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (41, 'Thanh thép chữ A', 130, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (42, 'Cuộn thép đặc biệt', 140, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (43, 'Hàng rào sắt', 200, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (44, 'Lưới sắt', 220, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (45, 'Cuộn thép gai', 210, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (46, 'Thép cuộn Pomina', 180, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (47, 'Thép hộp vuông mạ kẽm Sendo', 200, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (48, 'Thép hình chữ V Miền Nam', 150, 'Còn hàng', 20, 100);
INSERT INTO `inventory` VALUES (49, 'Ngói BITUM CANA Đồng Phẳng', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (50, 'Ngói Nóc', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (51, 'Ngói Thái SCG dạng sóng M16', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (52, 'Tấm Cemboard Ốp Trần Vân Gỗ Smartboard Có Rãnh', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (53, 'Tôn Sáng Sóng Vuông Polycacbonate', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (54, 'Ngói Thái SCG Elite Series Dạng Sóng Gold', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (55, 'Ngói Thái SCG Elite Series Dạng Sóng Classic-Xám', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (56, 'Ngói Thái SCG Elite Series Dạng Sóng Classic-Nâu', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (57, 'Ngói Thái SCG Elite Series Dạng Sóng Classic-Nâu Socola', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (58, 'NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (59, 'NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý-Đá tầng', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (60, 'Ngói Thái SCG Dạng Thẳng', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (61, 'Ngói chạc ba chữ Y', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (62, 'Ngói cuối nóc', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (63, 'Ngói cuối rìa', 100, 'Còn hàng', 100, 1000);
INSERT INTO `inventory` VALUES (64, 'Nối Ren trong PPR Bình Minh Φ20 x 1/2 inch, áp suất PN20 Bar', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (65, 'Bồn nước inox', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (66, 'Co 90 độ trơn phi 21 Nhựa Bình Minh', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (67, 'Co 90⁰ Ø6mm dùng cho máy lọc nước RO', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (68, 'Co giảm PVC phi 60-42', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (69, 'Khớp nối sống ( Rắc Co nhựa ) Ø27, Nhựa PVC-U Bình Minh', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (70, 'Nắp khóa, bịt đầu ống loại ren ngoài Ø21 nhựa PVC BÌNH MINH, giá tính theo cái', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (71, 'Nắp khóa, bịt đầu ống Ø90 (loại đầu bằng, không ren) nhựa PVC-U Tiền Phong', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (72, 'Nối Ren trong PPR Bình Minh Φ20 x 3/4 inch, áp suất PN20 Bar', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (73, 'Nắp khóa, bịt đầu ống loại ren ngoài Ø32 nhựa PVC BÌNH MINH, giá tính theo cái', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (74, 'Khớp nối sống ( Rắc Co nhựa ) Ø45, Nhựa PVC-U Bình Minh', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (75, 'Bồn nước inox 500L', 90, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (76, 'Ống nhựa PVC Ø50mm, dài 6m', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (77, 'Ống nước PVC Ø40mm, dài 4m', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (78, 'Nối Ren trong PPR Bình Minh Φ25 x 3/4 inch, áp suất PN20 Bar', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (79, 'Nối ren trong Ø21 D cho ống nhựa cứng PVC BÌNH MINH', 300, 'Còn hàng', 10, 100);
INSERT INTO `inventory` VALUES (80, 'Máy bơm tăng áp A-130 JAK – Panasonic', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (81, 'Máy bơm tăng áp Panasonic JAK-100% lõi đồng', 120, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (82, 'Máy bơm tăng áp Panasonic JAK- có nắp che mưa', 135, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (83, 'Máy Bơm Đẩy Cao Panasonic GP-350JA-SV5 350W', 200, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (84, 'Máy bơm nước đẩy cao Panasonic GP-129JXK-SV5 125W', 179, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (85, 'Bồn nước inox 1000L Đứng Tân Á Đại Thành', 50, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (86, 'Bình nóng lạnh năng lượng mặt trời', 70, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (87, 'Đồng hồ điện điện tử LSE LS142 có 1 pha 2 dây', 300, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (88, 'Đồng Hồ Điện Một Pha EMIC 10(40A) – Có Giấy Kiểm Định', 250, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (89, 'Máy nước nóng Beko BWI35S1N-213', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (90, 'Máng đèn Anfaco T8 0.6m - 14W', 150, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (91, 'Đèn LED Duhal âm trần cao cấp KBNL830 30W', 200, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (92, 'Công tơ điện 3 pha 4 dây cơ mã LS3E4 chính hãng LSE', 120, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (93, 'Máy bơm tăng áp A-130JTX 150W', 180, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (96, 'Cát bê tông', 100, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (97, 'Cát đen', 100, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (98, 'Cát san lấp', 100, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (99, 'Cát sông', 50, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (100, 'Cát vàng', 50, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (101, 'Đá 1x2', 50, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (102, 'Đá 4x6', 50, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (103, 'Đá dăm', 50, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (104, 'Đá sỏi', 50, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (109, 'Cát bê tông 2', 100, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (110, 'Cát sông 2', 50, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (111, 'Cát đen 2', 100, 'Còn hàng', 3, 10);
INSERT INTO `inventory` VALUES (112, 'Gỗ cao cấp', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (113, 'Gỗ trắng đặc', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (114, 'Gỗ thanh mượt', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (115, 'Gỗ đa năng', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (116, 'Gỗ thanh trà', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (117, 'Gỗ lõi đen', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (118, 'Gỗ đặc', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (119, 'Gỗ phân tầng', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (120, 'Gỗ thanh đa', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (121, 'Gỗ khối lớn', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (122, 'Gỗ khớp vàng', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (123, 'Gỗ thanh đen', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (124, 'Gỗ trơ', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (125, 'Gỗ thông', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (126, 'Gỗ óc chó', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (127, 'Gỗ hương', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (128, 'Gỗ hồng', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (129, 'Gỗ căm xe', 100, 'Còn hàng', 10, 50);
INSERT INTO `inventory` VALUES (130, 'Sơn Nội Thất DULUX AMBIANCE 5 IN1 PEARL GLOW Bóng mờ', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (131, 'Sơn Nội Thất Dulux Ambiance 5in1 Superflexx', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (132, 'Sơn Nội Thất Dulux EasyClean Chống Bám Bẩn Kháng Virus', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (133, 'Sơn Nội Thất Dulux EasyClean Chống Bám Bẩn', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (134, 'Sơn Nội Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt Bóng', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (135, 'Sơn Nội Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt Mờ', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (136, 'Sơn Sắt Giả Gỗ Lotus Meta Coat Primer – 1 Sơn Lót + 1 Sơn Phủ', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (137, 'Sơn nước ngoại thất Dulux Weathershield Bề Mặt', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (138, 'Sơn nước ngoại thất Dulux Weathershield Colour Protect Bề Mặt', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (139, 'Sơn nước ngoại thất Dulux Weathershield Powerflexx Bề Mặt', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (140, 'Sơn nước ngoại thất Maxilite Tough từ Dulux Bề Mặt', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (141, 'SƠN NƯỚC NGOẠI THẤT SUPERTECH PRO EXTERIOR', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (142, 'Sơn Lót Ngoại Thất Siêu Cao Cấp Dulux Weathershield Chống Kiềm', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (143, 'Sơn Lót Ngoại Thất Siêu Cao Cấp Dulux Weathershield Protection', 50, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (144, 'Sơn Ngoại Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt', 100, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (145, 'SƠN LÓT LẤP TIM LÀM MỊN GỖ LOTUS SANDING SEALER', 200, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (146, 'Sơn nước nội thất cao cấp TOA Nanoclean', 150, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (147, 'Sơn nước nội thất sinh học DULUX BETTER LIVING AIR CLEAN', 120, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (148, 'Phụ gia chống thấm BS-8430 Latex', 100, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (149, 'Sơn Nội Thất Cao Cấp Dulux Easyclean Lau Chùi Hiệu Quả Bề Mặt Bóng', 180, 'Còn hàng', 20, 30);
INSERT INTO `inventory` VALUES (156, 'Đá', 20, 'Còn hàng', 34, 50);
INSERT INTO `inventory` VALUES (157, 'Đá123', 50, 'Còn hàng', 34, 50);

-- ----------------------------
-- Table structure for loghistory
-- ----------------------------
DROP TABLE IF EXISTS `loghistory`;
CREATE TABLE `loghistory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `startLog` datetime NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dataBefore` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dataAfter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 650 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loghistory
-- ----------------------------
INSERT INTO `loghistory` VALUES (514, 'INFO', 'tuan', '2025-04-06 01:12:58', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (515, 'INFO', 'tuan', '2025-04-06 01:14:59', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (516, 'INFO', 'tuan', '2025-04-06 01:56:57', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (517, 'INFO', 'tuan', '2025-04-06 01:58:01', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (518, 'INFO', 'tuan', '2025-04-06 01:59:14', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (519, 'INFO', 'tuan', '2025-04-06 09:40:31', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (520, 'INFO', 'tuan', '2025-04-06 09:47:41', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (521, 'INFO', 'tuan', '2025-04-06 09:47:54', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (522, 'WARNING', 'Admin', '2025-04-06 09:48:01', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (523, 'INFO', 'Huy', '2025-04-06 09:48:42', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (524, 'INFO', 'Huy', '2025-04-06 09:49:24', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (525, 'INFO', 'tuan', '2025-04-06 09:49:38', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (526, 'INFO', 'tuan', '2025-04-06 10:33:09', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (527, 'INFO', 'tuan', '2025-04-06 10:37:35', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (528, 'INFO', 'tuan', '2025-04-06 10:40:02', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (529, 'INFO', 'tuan', '2025-04-06 10:44:31', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (530, 'INFO', 'tuan', '2025-04-06 10:48:25', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (531, 'INFO', 'tuan', '2025-04-06 10:54:40', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (532, 'INFO', 'tuan', '2025-04-06 11:01:18', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (533, 'INFO', 'tuan', '2025-04-06 11:06:24', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (534, 'INFO', 'tuan', '2025-04-06 11:07:30', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (535, 'INFO', 'tuan', '2025-04-06 11:09:30', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (536, 'INFO', 'tuan', '2025-04-06 11:11:17', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (537, 'INFO', 'tuan', '2025-04-06 11:13:56', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (538, 'INFO', 'tuan', '2025-04-06 11:21:41', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (539, 'INFO', 'tuan', '2025-04-06 11:32:15', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (540, 'INFO', 'tuan', '2025-04-06 11:33:17', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (542, 'INFO', 'tuan', '2025-04-06 11:45:01', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (543, 'INFO', 'tuan', '2025-04-06 11:45:01', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (544, 'INFO', 'tuan', '2025-04-06 11:51:33', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (545, 'INFO', 'tuan', '2025-04-06 11:55:46', '0:0:0:0:0:0:0:1', '156', 'Sản phẩm đã bị xóa');
INSERT INTO `loghistory` VALUES (546, 'WARNING', 'tuan', '2025-04-06 12:52:14', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (547, 'INFO', 'tuan', '2025-04-06 12:52:19', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (548, 'INFO', 'tuan', '2025-04-06 13:30:42', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (549, 'INFO', 'tuan', '2025-04-06 13:34:41', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (550, 'INFO', 'tuan', '2025-04-06 13:46:51', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (551, 'INFO', 'tuan', '2025-04-06 14:03:02', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (552, 'INFO', 'tuan', '2025-04-06 14:18:22', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (553, 'INFO', 'tuan', '2025-04-06 14:20:37', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (554, 'INFO', 'tuan', '2025-04-06 14:26:30', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (555, 'INFO', 'tuan', '2025-04-06 14:28:21', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (556, 'INFO', 'tuan', '2025-04-06 14:41:46', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (557, 'INFO', 'tuan', '2025-04-06 14:51:10', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (558, 'INFO', 'tuan', '2025-04-06 14:55:07', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (559, 'INFO', 'tuan', '2025-04-06 14:57:01', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (560, 'INFO', 'tuan', '2025-04-06 14:59:08', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (561, 'INFO', 'tuan', '2025-04-06 15:12:27', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (562, 'INFO', 'tuan', '2025-04-06 15:17:57', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (563, 'INFO', 'tuan', '2025-04-06 15:19:43', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (564, 'INFO', 'tuan', '2025-04-06 15:22:55', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (565, 'INFO', 'tuan', '2025-04-06 15:24:04', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (566, 'WARNING', 'tuan121', '2025-04-06 15:24:28', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (567, 'WARNING', 'tuan121', '2025-04-06 15:24:38', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (568, 'WARNING', 'tuan121', '2025-04-06 15:24:46', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (569, 'WARNING', 'tuan121', '2025-04-06 15:24:55', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (570, 'INFO', 'tuan121', '2025-04-06 15:25:05', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (571, 'INFO', 'tuan121', '2025-04-06 15:25:54', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (572, 'INFO', 'tuan', '2025-04-06 15:26:03', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (573, 'INFO', 'tuan', '2025-04-06 15:40:03', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (574, 'INFO', 'tuan', '2025-04-06 15:44:38', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (575, 'INFO', 'tuan', '2025-04-06 15:52:30', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (576, 'INFO', 'tuan', '2025-04-06 15:55:19', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (577, 'INFO', 'tuan', '2025-04-06 15:58:27', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (578, 'INFO', 'tuan', '2025-04-06 15:59:54', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (579, 'INFO', 'tuan', '2025-04-06 16:02:08', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (580, 'INFO', 'tuan', '2025-04-06 16:13:54', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (581, 'INFO', 'tuan', '2025-04-06 16:15:33', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (582, 'INFO', 'tuan', '2025-04-06 16:15:41', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (583, 'INFO', 'tuan', '2025-04-06 16:17:06', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (584, 'INFO', 'tuan', '2025-04-06 16:23:09', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (585, 'INFO', 'tuan121', '2025-04-06 16:32:28', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (586, 'INFO', 'tuan121', '2025-04-06 16:32:51', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (587, 'INFO', 'tuan', '2025-04-06 16:33:01', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (588, 'INFO', 'tuan', '2025-04-06 16:37:58', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (589, 'INFO', 'tuan', '2025-04-06 16:40:24', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (590, 'INFO', 'tuan', '2025-04-06 16:41:51', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (591, 'INFO', 'tuan', '2025-04-06 16:46:08', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (592, 'INFO', 'tuan', '2025-04-08 17:24:37', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (593, 'INFO', 'tuan', '2025-04-08 17:24:51', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (594, 'INFO', 'tuan', '2025-04-08 17:25:47', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (595, 'INFO', 'tuan121', '2025-04-08 17:26:01', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (596, 'INFO', 'tuan121', '2025-04-08 17:27:02', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (597, 'INFO', 'tuan', '2025-04-08 17:27:21', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (598, 'INFO', 'tuan121', '2025-04-08 17:27:40', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (599, 'INFO', 'tuan', '2025-04-10 19:44:14', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (600, 'INFO', 'Huy', '2025-04-12 09:32:41', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (601, 'INFO', 'tuan', '2025-04-12 11:30:42', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (602, 'INFO', 'tuan', '2025-04-12 11:30:49', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (603, 'INFO', 'Huy', '2025-04-12 11:30:55', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (604, 'WARNING', 'Huy', '2025-04-12 11:37:26', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (605, 'INFO', 'Huy', '2025-04-12 11:37:32', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (606, 'WARNING', 'Huy', '2025-04-12 11:38:49', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (607, 'INFO', 'Huy', '2025-04-12 11:38:55', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (608, 'INFO', 'Huy', '2025-04-12 11:40:19', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (609, 'INFO', 'Huy', '2025-04-12 11:43:29', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (610, 'INFO', 'Huy', '2025-04-12 11:50:58', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (611, 'INFO', 'Huy', '2025-04-12 11:54:20', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (612, 'INFO', 'Huy', '2025-04-12 12:00:14', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (613, 'INFO', 'Huy', '2025-04-12 12:03:09', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (614, 'INFO', 'Huy', '2025-04-12 12:07:55', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (615, 'INFO', 'Huy', '2025-04-12 12:12:54', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (616, 'INFO', 'Huy', '2025-04-12 12:16:56', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (617, 'INFO', 'Huy', '2025-04-12 12:19:08', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (618, 'INFO', 'Huy', '2025-04-12 12:21:40', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (619, 'INFO', 'Huy', '2025-04-12 12:23:37', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (620, 'INFO', 'Huy', '2025-04-12 12:46:34', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (621, 'INFO', 'Huy', '2025-04-12 12:49:03', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (622, 'WARNING', 'Huy', '2025-04-12 12:53:34', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (623, 'INFO', 'Huy', '2025-04-12 12:53:39', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (624, 'INFO', 'Huy', '2025-04-12 12:58:18', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (625, 'INFO', 'Huy', '2025-04-12 13:05:30', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (626, 'INFO', 'Huy', '2025-04-12 13:11:16', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (627, 'WARNING', 'Huy', '2025-04-12 13:37:17', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (628, 'WARNING', 'Huy', '2025-04-12 13:37:22', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (629, 'INFO', 'Huy', '2025-04-12 13:37:28', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (630, 'WARNING', 'Huy', '2025-04-12 13:40:15', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (631, 'INFO', 'Huy', '2025-04-12 13:40:20', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (632, 'WARNING', 'Huy', '2025-04-12 13:44:20', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (633, 'WARNING', 'Huy', '2025-04-12 13:44:25', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (634, 'INFO', 'Huy', '2025-04-12 13:44:30', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (635, 'INFO', 'Huy', '2025-04-12 14:44:56', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (636, 'INFO', 'Huy', '2025-04-12 14:45:02', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (637, 'WARNING', 'tuan', '2025-04-12 14:45:51', '0:0:0:0:0:0:0:1', 'Chưa đăng nhập', 'Đăng nhập thất bại');
INSERT INTO `loghistory` VALUES (638, 'INFO', 'tuan', '2025-04-12 14:45:59', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (639, 'INFO', 'tuan', '2025-04-12 14:46:16', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (640, 'INFO', 'Tuấn Võ', '2025-04-12 14:47:18', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (641, 'INFO', 'tuan', '2025-04-12 14:47:24', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (642, 'INFO', 'tuan', '2025-04-12 14:47:58', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (643, 'INFO', 'tuan', '2025-04-13 16:38:18', '0:0:0:0:0:0:0:1', 'Login No', 'Login Successful');
INSERT INTO `loghistory` VALUES (644, 'INFO', 'tuan', '2025-04-13 16:39:07', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (645, 'INFO', 'Huy', '2025-04-13 16:48:55', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (646, 'INFO', 'Huy', '2025-04-13 16:53:17', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (647, 'INFO', 'Diệp Lâm', '2025-04-13 17:01:52', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (648, 'INFO', 'Diệp Lâm', '2025-04-13 17:02:09', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');
INSERT INTO `loghistory` VALUES (649, 'INFO', 'Diệp Lâm', '2025-04-13 17:32:55', '0:0:0:0:0:0:0:1', 'Đang đăng nhập', 'Đã đăng xuất');

-- ----------------------------
-- Table structure for orderitems
-- ----------------------------
DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE `orderitems`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `totalPrice` decimal(10, 2) NULL DEFAULT NULL,
  `discount` decimal(10, 2) NULL DEFAULT NULL,
  `createdAt` datetime NULL DEFAULT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderId`(`orderId`) USING BTREE,
  INDEX `productId`(`productId`) USING BTREE,
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitems
-- ----------------------------
INSERT INTO `orderitems` VALUES (52, 47, 2, 1, 200000.00, 170000.00, 30000.00, '2025-03-23 13:08:06', '2025-03-23 13:08:06');
INSERT INTO `orderitems` VALUES (53, 48, 3, 1, 200000.00, 190000.00, 10000.00, '2025-03-23 13:08:55', '2025-03-23 13:08:55');
INSERT INTO `orderitems` VALUES (54, 49, 3, 1, 200000.00, 190000.00, 10000.00, '2025-03-23 13:16:51', '2025-03-23 13:16:51');
INSERT INTO `orderitems` VALUES (55, 50, 2, 1, 200000.00, 170000.00, 30000.00, '2025-03-23 13:19:00', '2025-03-23 13:19:00');
INSERT INTO `orderitems` VALUES (59, 54, 1, 1, 300000.00, 150000.00, 150000.00, '2025-04-06 15:25:32', '2025-04-06 15:25:32');
INSERT INTO `orderitems` VALUES (60, 55, 2, 1, 200000.00, 170000.00, 30000.00, '2025-04-06 15:25:49', '2025-04-06 15:25:49');
INSERT INTO `orderitems` VALUES (61, 56, 2, 2, 400000.00, 340000.00, 60000.00, '2025-04-06 16:32:49', '2025-04-06 16:32:49');
INSERT INTO `orderitems` VALUES (62, 57, 1, 11, 3300000.00, 1650000.00, 1650000.00, '2025-04-08 17:28:22', '2025-04-08 17:28:22');
INSERT INTO `orderitems` VALUES (63, 58, 2, 1, 200000.00, 170000.00, 30000.00, '2025-04-12 14:47:04', '2025-04-12 14:47:04');
INSERT INTO `orderitems` VALUES (64, 59, 2, 1, 200000.00, 170000.00, 30000.00, '2025-04-12 14:55:27', '2025-04-12 14:55:27');
INSERT INTO `orderitems` VALUES (65, 60, 2, 1, 200000.00, 170000.00, 30000.00, '2025-04-12 14:56:09', '2025-04-12 14:56:09');
INSERT INTO `orderitems` VALUES (66, 61, 2, 10, 2000000.00, 1700000.00, 300000.00, '2025-04-13 17:32:31', '2025-04-13 17:32:31');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `totalPrice` decimal(18, 2) NULL DEFAULT NULL,
  `shippingFee` decimal(10, 2) NULL DEFAULT NULL,
  `discountAmount` decimal(10, 2) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paymentMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paymentStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `shippingAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NULL DEFAULT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (47, 1, 187000.00, 17000.00, 30000.00, 'Chưa hoàn thành', 'COD', 'Chưa thanh toán', 'linh xuân thủ đứ', '2025-03-23 13:08:06', NULL);
INSERT INTO `orders` VALUES (48, 1, 209000.00, 19000.00, 10000.00, 'Hoàn thành', 'COD', 'Đã thanh toán', 'linh xuân thủ đứ', '2025-03-23 13:08:55', NULL);
INSERT INTO `orders` VALUES (49, 1, 209000.00, 19000.00, 10000.00, 'Hoàn thành', 'COD', 'Đã thanh toán', 'linh xuân thủ đứ', '2025-03-23 13:16:51', NULL);
INSERT INTO `orders` VALUES (50, 1, 187000.00, 17000.00, 30000.00, 'Hoàn thành', 'COD', 'Đã thanh toán', 'linh xuân thủ đứ', '2025-03-23 13:19:00', NULL);
INSERT INTO `orders` VALUES (54, 19, 165000.00, 15000.00, 150000.00, 'Hoàn thành', 'COD', 'Đã thanh toán', 'wewethoong thanh ohnfndhdhdhdhdhdhdhdhdhdhdhhdhdhdhdhdhdhdhdhdhd', '2025-04-06 15:25:32', NULL);
INSERT INTO `orders` VALUES (55, 19, 187000.00, 17000.00, 30000.00, 'Hoàn thành', 'COD', 'Đã thanh toán', 'wewethoong thanh ohnfndhdhdhdhdhdhdhdhdhdhdhhdhdhdhdhdhdhdhdhdhd', '2025-04-06 15:25:49', NULL);
INSERT INTO `orders` VALUES (56, 19, 374000.00, 34000.00, 60000.00, 'Hoàn thành', 'COD', 'Đã thanh toán', 'wewethoong thanh ohnfndhdhdhdhdhdhdhdhdhdhdhhdhdhdhdhdhdhdhdhdhd', '2025-04-06 16:32:49', NULL);
INSERT INTO `orders` VALUES (57, 19, 1815000.00, 165000.00, 1650000.00, 'Chưa hoàn thành', 'COD', 'Chưa thanh toán ', 'wewethoong thanh ohnfndhdhdhdhdhdhdhdhdhdhdhhdhdhdhdhdhdhdhdhdhd', '2025-04-08 17:28:22', NULL);
INSERT INTO `orders` VALUES (58, 14, 187000.00, 17000.00, 30000.00, 'Chưa hoàn thành', 'COD', 'Chưa thanh toán ', 'wewethoong thanh ', '2025-04-12 14:47:04', NULL);
INSERT INTO `orders` VALUES (59, 14, 187000.00, 17000.00, 30000.00, 'Chưa hoàn thành', 'COD', 'Chưa thanh toán ', 'wewethoong thanh ', '2025-04-12 14:55:27', NULL);
INSERT INTO `orders` VALUES (60, 14, 187000.00, 17000.00, 30000.00, 'Chưa hoàn thành', 'COD', 'Chưa thanh toán ', 'wewethoong thanh dsfffffffffffffffffffffffffffffffffewewtwetrwtretffffffffffffffffffffffffDSFDSF', '2025-04-12 14:56:09', NULL);
INSERT INTO `orders` VALUES (61, 25, 1870000.00, 170000.00, 300000.00, 'Chưa hoàn thành', 'COD', 'Chưa thanh toán ', 'wewethoong thanh ohnfndhdhdhdhdhdhdhdhdhdhdhhdhdhdhdhdhdhdhdhdhd', '2025-04-13 17:32:31', NULL);

-- ----------------------------
-- Table structure for passwordreset
-- ----------------------------
DROP TABLE IF EXISTS `passwordreset`;
CREATE TABLE `passwordreset`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `resetToken` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tokenExpiry` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `passwordreset_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of passwordreset
-- ----------------------------
INSERT INTO `passwordreset` VALUES (4, 12, '02zp80dvSXPxb70u0BKVdxfWerhOJkGo', '2025-03-17 13:29:15');
INSERT INTO `passwordreset` VALUES (5, 14, 'H9RSU8IZhnCEvTSEWEJR2MTPRJ0ObiGc', '2025-03-17 13:31:08');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `canView` tinyint(1) NULL DEFAULT NULL,
  `canAdd` tinyint(1) NULL DEFAULT NULL,
  `canEdit` tinyint(1) NULL DEFAULT NULL,
  `canDelete` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, '12', 'user', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (2, '12', 'product', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (4, '12', 'category', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (5, '12', 'order', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (6, '12', 'review', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (7, '12', 'promotional', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (8, '12', 'admin', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (9, '14', 'review', 1, 1, 1, 0);
INSERT INTO `permissions` VALUES (10, '3', 'review', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (11, '3', 'admin', 0, 0, 0, 0);
INSERT INTO `permissions` VALUES (12, '12', 'Log', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (13, '12', 'inventory', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (14, '12', 'stocktransaction', 1, 1, 1, 1);
INSERT INTO `permissions` VALUES (15, '3', 'inventory', 0, 0, 1, 0);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `view` int(11) NULL DEFAULT NULL,
  `soldCount` int(11) NULL DEFAULT NULL,
  `categoryId` int(11) NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `updateDate` datetime NULL DEFAULT NULL,
  `discountPercent` decimal(10, 2) NULL DEFAULT NULL,
  `discountPrice` decimal(10, 2) NULL DEFAULT NULL,
  `isDeleted` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categoryId`(`categoryId`) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Gạch chịu lửa', 'users/img_product/gachxaydung/gachchiulua.png', 300000, '    Gạch chịu lửa chất lượng cao, được sử dụng cho các công trình chịu nhiệt, bền vững', 'Nhà cung cấp A', 'Đỏ', 'Lớn', 'Viên', 1, 12, 1, '2024-12-10 10:00:00', '2025-04-06 11:53:50', 0.50, 150000.00, 0);
INSERT INTO `products` VALUES (2, 'Gạch đinh đặc', 'users/img_product/gachxaydung/gachdinhdac.png', 200000, 'Gạch đinh đặc có độ bền cao, thường dùng trong các công trình xây dựng kiên cố.', 'Nhà cung cấp B', 'Xám', 'Lớn', 'Viên', 64, 24, 1, '2024-12-10 10:30:00', '2024-12-11 09:15:00', 0.15, 170000.00, 0);
INSERT INTO `products` VALUES (3, 'Gạch Hiệp Phụng', 'users/img_product/gachxaydung/gachhiephung717.png', 200000, 'Gạch Hiệp Phụng chất lượng cao, đảm bảo độ bền và khả năng chịu lực tốt trong các công trình.', 'Nhà cung cấp C', 'Vàng', 'Vừa', 'Viên', 58, 0, 1, '2024-12-10 11:00:00', '2024-12-11 09:30:00', 0.05, 190000.00, 0);
INSERT INTO `products` VALUES (4, 'Gạch Tuynel', 'users/img_product/gachxaydung/gachtuynel.png', 200000, 'Gạch Tuynel bền vững, chống thấm nước và chịu nhiệt, phù hợp cho mọi công trình xây dựng.', 'Nhà cung cấp D', 'Nâu', 'Lớn', 'Viên', 50, 0, 1, '2024-12-10 11:30:00', '2024-12-11 09:45:00', 0.20, 160000.00, 0);
INSERT INTO `products` VALUES (5, 'Gạch không nung', 'users/img_product/gachxaydung/gachkhongnung.png', 200000, 'Gạch không nung, thân thiện với môi trường, sử dụng công nghệ sản xuất không cần nhiệt.', 'Nhà cung cấp E', 'Trắng', 'Nhỏ', 'Viên', 52, 0, 1, '2024-12-10 12:00:00', '2024-12-11 10:00:00', 0.00, 200000.00, 0);
INSERT INTO `products` VALUES (6, 'Gạch Tuynel Hiếu', 'users/img_product/gachxaydung/gachtuynelhieuthao.png', 200000, 'Gạch Tuynel hiệu quả cao, sản xuất bằng công nghệ hiện đại, đảm bảo chất lượng vượt trội.', 'Nhà cung cấp F', 'Xám', 'Vừa', 'Viên', 50, 0, 1, '2024-12-10 12:30:00', '2024-12-11 10:15:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (7, 'Gạch Ngọc Chung', 'users/img_product/gachxaydung/gachtuynelngocchung.png', 200000, 'Gạch Ngọc Chung chất lượng vượt trội, có khả năng chịu lực và chịu nhiệt rất tốt.', 'Nhà cung cấp G', 'Hồng', 'Vừa', 'Viên', 53, 0, 1, '2024-12-10 13:00:00', '2024-12-11 10:30:00', 0.25, 150000.00, 0);
INSERT INTO `products` VALUES (8, 'Gạch Ngọc Hiếu', 'users/img_product/gachxaydung/gachtuynelngochung.png', 200000, 'Gạch Ngọc Hiếu cao cấp, được sản xuất từ nguyên liệu tốt, phù hợp cho các công trình cao cấp.', 'Nhà cung cấp H', 'Xanh', 'Lớn', 'Viên', 50, 0, 1, '2024-12-10 13:30:00', '2024-12-11 10:45:00', 0.30, 140000.00, 0);
INSERT INTO `products` VALUES (9, 'Gạch Trọng Nghĩa', 'users/img_product/gachxaydung/gachtuynelsangtrongnghia.png', 200000, 'Gạch Trọng Nghĩa bền chắc, thường được sử dụng cho các công trình xây dựng lớn và chịu lực tốt.', 'Nhà cung cấp I', 'Beige', 'Vừa', 'Viên', 50, 0, 1, '2024-12-10 14:00:00', '2024-12-11 11:00:00', 0.05, 190000.00, 0);
INSERT INTO `products` VALUES (10, 'Gạch DanaBU03', 'users/img_product/gachxaydung/gachdanaBU03.png', 200000, 'Gạch DanaBU03 chất lượng cao, được sản xuất bằng công nghệ tiên tiến, đảm bảo độ bền cao.', 'Nhà cung cấp J', 'Xanh lá', 'Nhỏ', 'Viên', 50, 0, 1, '2024-12-10 14:30:00', '2024-12-11 11:15:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (11, 'Gạch Đá Đen', 'users/img_product/gachxaydung/gachdaden.png', 200000, 'Gạch đá đen bền bỉ, mang lại sự chắc chắn cho các công trình xây dựng và trang trí.', 'Nhà cung cấp K', 'Đen', 'Lớn', 'Viên', 50, 0, 1, '2024-12-10 15:00:00', '2024-12-11 11:30:00', 0.00, 200000.00, 0);
INSERT INTO `products` VALUES (12, 'Gạch Xây Tường', 'users/img_product/gachxaydung/gach-xay-tuong.png', 200000, 'Gạch xây tường chất lượng tốt, giúp tạo dựng các bức tường chắc chắn và bền bỉ.', 'Nhà cung cấp L', 'Đỏ', 'Vừa', 'Viên', 50, 0, 1, '2024-12-10 15:30:00', '2024-12-11 11:45:00', 0.15, 170000.00, 0);
INSERT INTO `products` VALUES (13, 'Gạch Bông', 'users/img_product/gachxaydung/gachbong.png', 200000, 'Gạch bông đẹp mắt, bền bỉ, phù hợp cho các công trình trang trí nội thất và ngoại thất.', 'Nhà cung cấp M', 'Vàng', 'Nhỏ', 'Viên', 50, 0, 1, '2024-12-10 16:00:00', '2024-12-11 12:00:00', 0.20, 160000.00, 0);
INSERT INTO `products` VALUES (14, 'Gạch Men', 'users/img_product/gachxaydung/gachmen.png', 200000, 'Gạch men cao cấp cho mọi công trình, dễ dàng vệ sinh và có độ bền cao.', 'Nhà cung cấp N', 'Trắng', 'Vừa', 'Viên', 50, 0, 1, '2024-12-10 16:30:00', '2024-12-11 12:15:00', 0.25, 150000.00, 0);
INSERT INTO `products` VALUES (15, 'Gạch Nhựa', 'users/img_product/gachxaydung/gachnhua.png', 200000, 'Gạch nhựa chống thấm, bền bỉ, sử dụng cho các công trình chịu nước như nhà vệ sinh, sân thượng.', 'Nhà cung cấp O', 'Xanh dương', 'Lớn', 'Viên', 50, 0, 1, '2024-12-10 17:00:00', '2024-12-11 12:30:00', 0.05, 190000.00, 0);
INSERT INTO `products` VALUES (16, 'Gạch Tàu', 'users/img_product/gachxaydung/gachtau.png', 200000, 'Gạch tàu bền chắc, thích hợp cho việc lát nền và xây dựng các công trình chịu lực cao.', 'Nhà cung cấp P', 'Xám', 'Vừa', 'Viên', 50, 0, 1, '2024-12-10 17:30:00', '2024-12-11 12:45:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (17, 'Xi măng SCG-PC40-ELE', 'users/img_product/xingmang/image1x.png', 290000, ' Xi măng SCG-PC40-ELE chất lượng cao, phù hợp với mọi công trình.', 'SCG', 'Trắng', '50kg', 'Bao', 4, 0, 2, '2024-12-10 10:00:00', '2025-01-13 14:14:58', 0.50, 145000.00, 0);
INSERT INTO `products` VALUES (18, 'Xi măng Victem Hà Tiến', 'users/img_product/xingmang/image2x.png', 190000, 'Xi măng Victem Hà Tiến, sản phẩm chất lượng cao, đa dụng cho các công trình xây dựng.', 'Victem', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:05:00', '2024-12-10 10:05:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (19, 'Xi măng đa dụng ECO', 'users/img_product/xingmang/image3x.png', 190000, 'Xi măng đa dụng ECO, bền vững và hiệu quả cho các công trình xây dựng.', 'ECO', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:10:00', '2024-12-10 10:10:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (20, 'Xi măng FICO CEMENT', 'users/img_product/xingmang/ximagfico.png', 190000, 'Xi măng FICO CEMENT phù hợp cho các công trình xây dựng cao cấp, giúp tăng cường độ bền của công trình.', 'FICO', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:15:00', '2024-12-10 10:15:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (21, 'Xi măng Allyuild', 'users/img_product/xingmang/ximamgallybuild.png', 190000, 'Xi măng Allyuild, chất lượng vượt trội, phù hợp cho xây dựng công trình lớn.', 'Allyuild', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:20:00', '2024-12-10 10:20:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (22, 'Xi măng Holcim', 'users/img_product/xingmang/ximamgholikem.png', 190000, 'Xi măng Holcim giúp gia tăng độ bền và chất lượng cho các công trình xây dựng.', 'Holcim', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:25:00', '2024-12-10 10:25:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (23, 'Xi măng Inceeco', 'users/img_product/xingmang/ximanginseeeco.png', 190000, 'Xi măng Inceeco với công nghệ sản xuất hiện đại, chất lượng vượt trội.', 'Inceeco', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:30:00', '2024-12-10 10:30:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (24, 'Xi măng PCP 40-MS', 'users/img_product/xingmang/ximangpc40.png', 190000, 'Xi măng PCP 40-MS, độ bền cao, dễ dàng thi công và đảm bảo chất lượng cho mọi công trình.', 'PCP', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:35:00', '2024-12-10 10:35:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (25, 'Xi măng Tây Đô', 'users/img_product/xingmang/ximangtaydo.png', 190000, 'Xi măng Tây Đô được sản xuất từ nguyên liệu chất lượng cao, bền vững cho các công trình xây dựng.', 'Tây Đô', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:40:00', '2024-12-10 10:40:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (26, 'Xi măng Viccem Hạ Long', 'users/img_product/xingmang/ximangvicemhalong.png', 190000, 'Xi măng Viccem Hạ Long, sản phẩm với độ bền cao, phù hợp cho công trình yêu cầu chất lượng.', 'Viccem', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:45:00', '2024-12-10 10:45:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (27, 'Xi măng Viccem Hà Tiên', 'users/img_product/xingmang/ximangvicemhatien.png', 190000, 'Xi măng Viccem Hà Tiên, bền vững và được ưa chuộng trong các công trình xây dựng lớn.', 'Viccem', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:50:00', '2024-12-10 10:50:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (28, 'Xi măng CẨM PHẢ-NB', 'users/img_product/xingmang/ximangcampha.png', 190000, 'Xi măng Cẩm Phả-NB có độ bền và chất lượng vượt trội, được ưa chuộng trong ngành xây dựng.', 'Cẩm Phả', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 10:55:00', '2024-12-10 10:55:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (29, 'Xi măng chống thấm SOTIN', 'users/img_product/xingmang/ximangchongtham.png', 190000, 'Xi măng chống thấm SOTIN với khả năng chống thấm vượt trội cho các công trình xây dựng.', 'SOTIN', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 11:00:00', '2024-12-10 11:00:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (30, 'Xi măng đa dụng INSEE', 'users/img_product/xingmang/ximanginsee.png', 190000, 'Xi măng INSEE đa dụng, thích hợp cho các công trình yêu cầu độ bền và chất lượng cao.', 'INSEE', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 11:05:00', '2024-12-10 11:05:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (31, 'Xi măng SHAH CEMENT', 'users/img_product/xingmang/ximangshahcement.png', 190000, 'Xi măng SHAH CEMENT, sự lựa chọn tin cậy cho các công trình xây dựng yêu cầu chất lượng vượt trội.', 'SHAH', 'Trắng', '50kg', 'Bao', 52, 0, 2, '2024-12-10 11:10:00', '2024-12-10 11:10:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (32, 'Xi măng TẤN THĂNG', 'users/img_product/xingmang/ximangtanthang.png', 190000, 'Xi măng Tấn Thăng, chất lượng đảm bảo, phù hợp cho các công trình dân dụng và công nghiệp.', 'Tấn Thăng', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 11:15:00', '2024-12-10 11:15:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (33, 'Xi măng Nghi Sơn', 'users/img_product/xingmang/ximangnghison.png', 190000, 'Xi măng Nghi Sơn, sản phẩm uy tín với chất lượng vượt trội cho các công trình xây dựng.', 'Nghi Sơn', 'Trắng', '50kg', 'Bao', 50, 0, 2, '2024-12-10 11:20:00', '2024-12-10 11:20:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (34, 'Thép cốt bê tông', 'users/img_product/thepvasat/image1.png', 290000, 'Thép cốt bê tông dùng trong xây dựng, cường độ cao, chống ăn mòn tốt. Sản phẩm phổ biến trong ngành công nghiệp xây dựng.', 'Sắt thép Hòa Phát', 'Xám', 'Dài', 'Mét', 51, 0, 4, '2024-12-01 09:00:00', '2024-12-01 09:05:00', 0.10, 261000.00, 0);
INSERT INTO `products` VALUES (35, 'Thép cuộn SS400', 'users/img_product/thepvasat/image2.png', 190000, 'Thép cuộn SS400 có độ bền cơ học cao, dễ dàng gia công và chịu lực tốt. Phù hợp cho các công trình kết cấu thép.', 'Thép Việt Nhật', 'Đen', 'Cuộn', 'Kilô', 50, 0, 4, '2024-12-01 09:10:00', '2024-12-01 09:15:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (36, 'Thép thanh vằn', 'users/img_product/thepvasat/image3.png', 190000, 'Thép thanh vằn chuyên dùng cho công trình bê tông cốt thép, giúp tăng khả năng chịu lực và chống gãy vỡ.', 'Thép Pomina', 'Xám', 'Thanh', 'Mét', 51, 0, 4, '2024-12-01 09:20:00', '2024-12-01 09:25:00', 0.20, 171000.00, 0);
INSERT INTO `products` VALUES (37, 'Thanh thép hình I', 'users/img_product/thepvasat/image4.png', 190000, 'Thanh thép hình I được sử dụng chủ yếu trong các công trình xây dựng, có khả năng chịu lực tốt và độ bền cao.', 'Thép Hòa Phát', 'Xám', 'Hình I', 'Mét', 50, 0, 4, '2024-12-01 09:30:00', '2024-12-01 09:35:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (38, 'Ống thép mạ kẽm', 'users/img_product/thepvasat/image5.png', 190000, 'Ống thép mạ kẽm chống gỉ sét, bền bỉ với thời gian, thích hợp cho các công trình ngoài trời, hệ thống nước và gas.', 'Thép Pomina', 'Bạc', 'Ống', 'Mét', 50, 0, 4, '2024-12-01 09:40:00', '2024-12-01 09:45:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (39, 'Ống thép hộp', 'users/img_product/thepvasat/image6.png', 190000, 'Ống thép hộp được sử dụng trong các kết cấu thép, khả năng chịu tải tốt, bền bỉ với thời gian.', 'Thép Việt Nhật', 'Đen', 'Hộp', 'Mét', 50, 0, 4, '2024-12-01 09:50:00', '2024-12-01 09:55:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (40, 'Thép hộp chữ nhật', 'users/img_product/thepvasat/image7.png', 190000, 'Thép hộp chữ nhật dùng trong các công trình xây dựng, dễ dàng gia công, lắp đặt và chịu tải tốt.', 'Thép Pomina', 'Xám', 'Chữ nhật', 'Mét', 50, 0, 4, '2024-12-01 10:00:00', '2024-12-01 10:05:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (41, 'Thanh thép chữ A', 'users/img_product/thepvasat/image8.png', 190000, 'Thanh thép chữ A chuyên dùng trong các công trình chịu tải trọng lớn, có độ bền cao và khả năng chống ăn mòn tốt.', 'Thép Việt Nhật', 'Đen', 'Chữ A', 'Mét', 50, 0, 4, '2024-12-01 10:10:00', '2024-12-01 10:15:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (42, 'Cuộn thép đặc biệt', 'users/img_product/thepvasat/image9.png', 190000, 'Cuộn thép đặc biệt có tính năng chịu lực vượt trội, sử dụng trong các công trình công nghiệp, xây dựng.', 'Thép Pomina', 'Xám', 'Cuộn', 'Kilô', 50, 0, 4, '2024-12-01 10:20:00', '2024-12-01 10:25:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (43, 'Hàng rào sắt', 'users/img_product/thepvasat/image10.png', 190000, 'Hàng rào sắt chất lượng cao, chắc chắn, sử dụng trong các công trình xây dựng và bảo vệ khu vực.', 'Thép Pomina', 'Bạc', 'Lưới', 'Mét', 51, 0, 4, '2024-12-01 10:30:00', '2024-12-01 10:35:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (44, 'Lưới sắt', 'users/img_product/thepvasat/image11.png', 190000, 'Lưới sắt chịu lực, bền bỉ, dùng trong xây dựng các công trình, đặc biệt là các khu vực cần sự chắc chắn cao.', 'Thép Việt Nhật', 'Xám', 'Lưới', 'Mét', 51, 0, 4, '2024-12-01 10:40:00', '2024-12-01 10:45:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (45, 'Cuộn thép gai', 'users/img_product/thepvasat/image12.png', 190000, 'Cuộn thép gai chất lượng, bền bỉ, chuyên dùng để làm hàng rào bảo vệ cho các khu vực cần an toàn.', 'Thép Pomina', 'Bạc', 'Cuộn', 'Kilô', 50, 0, 4, '2024-12-01 10:50:00', '2024-12-01 10:55:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (46, 'Thép cuộn Pomina', 'users/img_product/thepvasat/image13.png', 190000, 'Thép cuộn Pomina với chất lượng vượt trội, dễ dàng gia công và lắp đặt trong các công trình xây dựng.', 'Thép Pomina', 'Xám', 'Cuộn', 'Kilô', 50, 0, 4, '2024-12-01 11:00:00', '2024-12-01 11:05:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (47, 'Thép hộp vuông mạ kẽm Sendo', 'users/img_product/thepvasat/image14.png', 190000, 'Thép hộp vuông mạ kẽm Sendo chất lượng cao, bảo vệ bề mặt chống gỉ sét, dùng trong các công trình ngoài trời.', 'Thép Pomina', 'Bạc', 'Hộp vuông', 'Mét', 50, 0, 4, '2024-12-01 11:10:00', '2024-12-01 11:15:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (48, 'Thép hình chữ V Miền Nam', 'users/img_product/thepvasat/image15.png', 190000, 'Thép hình chữ V Miền Nam chuyên dụng trong các công trình chịu tải trọng cao, bền bỉ và có khả năng chống ăn mòn.', 'Thép Miền Nam', 'Đen', 'Chữ V', 'Mét', 50, 0, 4, '2024-12-01 11:20:00', '2024-12-01 11:25:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (49, 'Ngói BITUM CANA Đồng Phẳng', 'users/img_product/ngoi/NGÓI BITUM CANA ĐỒNG PHẲNG.png', 200000, 'Ngói BITUM CANA với kiểu dáng đồng phẳng, chất lượng cao, thiết kế tinh tế, phù hợp với các công trình xây dựng yêu cầu độ bền lâu dài.', 'CANA', 'Đỏ', 'Đồng phẳng', 'Cái', 50, 0, 7, '2024-12-11 10:00:00', '2024-12-11 10:05:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (50, 'Ngói Nóc', 'users/img_product/ngoi/Ngói nóc.png', 200000, 'Ngói nóc chất lượng cao, dễ dàng lắp đặt, giúp bảo vệ mái nhà và tạo sự hoàn thiện cho công trình xây dựng.', 'Nóc', 'Đỏ', 'Nóc', 'Cái', 50, 0, 7, '2024-12-11 10:05:00', '2024-12-11 10:10:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (51, 'Ngói Thái SCG dạng sóng M16', 'users/img_product/ngoi/Ngói Thái SCG dạng sóng M16.png', 200000, 'Ngói Thái SCG dạng sóng M16, có khả năng chịu lực tốt và độ bền cao, bảo vệ mái nhà và chống thấm nước hiệu quả.', 'SCG', 'Màu đỏ', 'Dạng sóng M16', 'Cái', 50, 0, 7, '2024-12-11 10:10:00', '2024-12-11 10:15:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (52, 'Tấm Cemboard Ốp Trần Vân Gỗ Smartboard Có Rãnh', 'users/img_product/ngoi/Tấm Cemboard Ốp Trần Vân Gỗ Smartboard Có Rãnh.png', 200000, 'Tấm Cemboard ốp trần vân gỗ, có rãnh tiện dụng cho việc thi công, tạo không gian sang trọng và bền vững cho công trình.', 'Smartboard', 'Gỗ', 'Vân gỗ', 'Tấm', 50, 0, 7, '2024-12-11 10:15:00', '2024-12-11 10:20:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (53, 'Tôn Sáng Sóng Vuông Polycacbonate', 'users/img_product/ngoi/Tôn Sáng Sóng Vuông Polycacbonate Tấm.png', 200000, 'Tôn sáng sóng vuông làm từ chất liệu polycacbonate bền bỉ, chịu nhiệt tốt, thích hợp cho các công trình cần ánh sáng tự nhiên.', 'Polycacbonate', 'Màu trong', 'Sóng vuông', 'Tấm', 50, 0, 7, '2024-12-11 10:20:00', '2024-12-11 10:25:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (54, 'Ngói Thái SCG Elite Series Dạng Sóng Gold', 'users/img_product/ngoi/Ngói Thái SCG Elite Series Dạng Sóng Gold.png', 200000, 'Ngói Thái SCG Elite Series dạng sóng Gold, cao cấp với độ bền vượt trội, thiết kế sang trọng, là lựa chọn hoàn hảo cho những công trình yêu cầu chất lượng cao.', 'SCG', 'Vàng', 'Dạng sóng Gold', 'Cái', 50, 0, 7, '2024-12-11 10:25:00', '2024-12-11 10:30:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (55, 'Ngói Thái SCG Elite Series Dạng Sóng Classic-Xám', 'users/img_product/ngoi/Ngói Thái SCG Elite Series Dạng Sóng Classic-Xám.png', 200000, 'Ngói Thái SCG Elite Series dạng sóng Classic-Xám, thích hợp cho mọi công trình, kết hợp giữa tính thẩm mỹ và độ bền cao.', 'SCG', 'Xám', 'Dạng sóng Classic', 'Cái', 50, 0, 7, '2024-12-11 10:30:00', '2024-12-11 10:35:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (56, 'Ngói Thái SCG Elite Series Dạng Sóng Classic-Nâu', 'users/img_product/ngoi/Ngói Thái SCG Elite Series Dạng Sóng Classic-Nâu.png', 200000, 'Ngói Thái SCG Elite Series dạng sóng Classic-Nâu, sang trọng và bền bỉ, thích hợp cho các công trình xây dựng hiện đại.', 'SCG', 'Nâu', 'Dạng sóng Classic', 'Cái', 50, 0, 7, '2024-12-11 10:35:00', '2024-12-11 10:40:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (57, 'Ngói Thái SCG Elite Series Dạng Sóng Classic-Nâu Socola', 'users/img_product/ngoi/Ngói Thái SCG Elite Series Dạng Sóng Classic-Nâu Socola.png', 200000, 'Ngói Thái SCG Elite Series dạng sóng Classic-Nâu Socola, thiết kế đẹp mắt, bền lâu, phù hợp với những công trình có yêu cầu thẩm mỹ cao.', 'SCG', 'Nâu Socola', 'Dạng sóng Classic', 'Cái', 50, 0, 7, '2024-12-11 10:40:00', '2024-12-11 10:45:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (58, 'NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý', 'users/img_product/ngoi/NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý.png', 200000, 'Ngói Bitum phủ đá Tegola cao cấp, nhập khẩu từ Ý, đảm bảo chất lượng vượt trội và khả năng chống chịu thời tiết tốt.', 'Tegola', 'Đỏ', 'Phủ đá', 'Cái', 50, 0, 7, '2024-12-11 10:45:00', '2024-12-11 10:50:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (59, 'NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý-Đá tầng', 'users/img_product/ngoi/NGÓI BITUM PHỦ ĐÁ TEGOLA CAO CẤP NHẬP KHẨU Ý-Đấ tầng.png', 200000, 'Ngói Bitum phủ đá Tegola cao cấp, nhập khẩu từ Ý, đá tầng giúp tăng độ bền và thẩm mỹ cho mái nhà.', 'Tegola', 'Xám', 'Phủ đá tầng', 'Cái', 50, 0, 7, '2024-12-11 10:50:00', '2024-12-11 10:55:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (60, 'Ngói Thái SCG Dạng Thẳng', 'users/img_product/ngoi/NgoiThaiSCGDangPhang.png', 200000, 'Ngói Thái SCG dạng thẳng, với độ bền cao và thiết kế đơn giản, thích hợp cho các công trình có yêu cầu tính thẩm mỹ cao.', 'SCG', 'Trắng', 'Dạng thẳng', 'Cái', 50, 0, 7, '2024-12-11 10:55:00', '2024-12-11 11:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (61, 'Ngói chạc ba chữ Y', 'users/img_product/ngoi/Ngói chạc ba chữ Y.png', 200000, 'Ngói chạc ba chữ Y, thiết kế đặc biệt, được sử dụng cho các khu vực nối mái, giúp đảm bảo tính thẩm mỹ và độ bền của công trình.', 'Ngói Y', 'Màu đỏ', 'Chạc ba chữ Y', 'Cái', 50, 0, 7, '2024-12-11 11:00:00', '2024-12-11 11:05:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (62, 'Ngói cuối nóc', 'users/img_product/ngoi/Ngói cuối nóc.png', 200000, 'Ngói cuối nóc giúp bảo vệ mái nhà khỏi tác động của thời tiết, tăng cường độ bền cho công trình xây dựng.', 'Ngói cuối', 'Đỏ', 'Cuối nóc', 'Cái', 50, 0, 7, '2024-12-11 11:05:00', '2024-12-11 11:10:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (63, 'Ngói cuối rìa', 'users/img_product/ngoi/Ngói cuối rìa.png', 200000, 'Ngói cuối rìa giúp bảo vệ mái nhà, ngăn chặn rò rỉ nước và giữ cho công trình bền lâu.', 'Ngói rìa', 'Đỏ', 'Cuối rìa', 'Cái', 50, 0, 7, '2024-12-11 11:10:00', '2024-12-11 11:15:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (64, 'Nối Ren trong PPR Bình Minh Φ20 x 1/2 inch, áp suất PN20 Bar', 'users/img_product/ong-nuoc-phu-kien/2 inch, áp suất PN20 Bar.png', 200000, 'Sản phẩm nối ren PPR Bình Minh với chất liệu bền bỉ, áp suất PN20, kích thước Φ20 x 1/2 inch, chuyên dùng cho hệ thống cấp nước và hệ thống ống nhựa PPR.', 'Bình Minh', 'Trắng', '20mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (65, 'Bồn nước inox', 'users/img_product/ong-nuoc-phu-kien/Bồn nước inox.png', 200000, 'Bồn nước inox có khả năng chịu nhiệt và chống ăn mòn, giúp bảo vệ nguồn nước sạch cho gia đình hoặc công trình. Chất liệu inox bền lâu, thích hợp cho việc lưu trữ nước sinh hoạt.', 'Bình Minh', 'Bạc', 'N/A', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (66, 'Co 90 độ trơn phi 21 Nhựa Bình Minh', 'users/img_product/ong-nuoc-phu-kien/Co 90 độ trơn phi 21 Nhựa Bình Minh.png', 200000, 'Co 90 độ trơn phi 21 được sản xuất từ nhựa PVC cao cấp, thiết kế chuẩn xác giúp dễ dàng kết nối các đoạn ống, đảm bảo hệ thống dẫn nước hoạt động hiệu quả.', 'Bình Minh', 'Trắng', '21mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (67, 'Co 90⁰ Ø6mm dùng cho máy lọc nước RO', 'users/img_product/ong-nuoc-phu-kien/Co 90⁰ Ø6mm dùng cho máy lọc nước RO.png', 200000, 'Co 90⁰ Ø6mm được dùng cho hệ thống máy lọc nước RO, giúp nối ống một cách dễ dàng, hạn chế rò rỉ nước và duy trì hiệu suất lọc tối ưu.', 'Bình Minh', 'Trắng', '6mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (68, 'Co giảm PVC phi 60-42', 'users/img_product/ong-nuoc-phu-kien/Co giảm PVC phi 60-42.png', 200000, 'Co giảm PVC phi 60-42 giúp kết nối ống nước có đường kính khác nhau, mang đến giải pháp linh hoạt cho các hệ thống cấp nước và xử lý nước thải.', 'Bình Minh', 'Trắng', '60mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (69, 'Khớp nối sống ( Rắc Co nhựa ) Ø27, Nhựa PVC-U Bình Minh', 'users/img_product/ong-nuoc-phu-kien/Khớp nối sống ( Rắc Co nhựa ) Ø27, Nhựa PVC-U Bình Minh.png', 200000, 'Khớp nối sống Ø27 dùng để kết nối các đoạn ống nước bằng nhựa PVC, mang lại sự linh hoạt và dễ dàng trong thi công hệ thống ống nước.', 'PVC-U Bình Minh', 'Trắng', '27mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (70, 'Nắp khóa, bịt đầu ống loại ren ngoài Ø21 nhựa PVC BÌNH MINH, giá tính theo cái', 'users/img_product/ong-nuoc-phu-kien/Nắp khóa, bịt đầu ống loại ren ngoài Ø21 nhựa PVC BÌNH MINH, giá tính theo cái.png', 200000, 'Nắp khóa, bịt đầu ống ren ngoài Ø21 được sử dụng để đóng kín đầu ống nước, giúp ngăn ngừa rò rỉ nước và bảo vệ hệ thống dẫn nước.', 'PVC BÌNH MINH', 'Trắng', '21mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (71, 'Nắp khóa, bịt đầu ống Ø90 (loại đầu bằng, không ren) nhựa PVC-U Tiền Phong', 'users/img_product/ong-nuoc-phu-kien/Nắp khóa, bịt đầu ống Ø90 (loại đầu bằng, không ren) nhựa PVC-U Tiền Phong.png', 200000, 'Nắp khóa Ø90 giúp bịt kín các đầu ống nhựa PVC, không có ren, bảo vệ hệ thống dẫn nước, tránh bụi bẩn và tác nhân gây hại.', 'PVC-U Tiền Phong', 'Trắng', '90mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (72, 'Nối Ren trong PPR Bình Minh Φ20 x 3/4 inch, áp suất PN20 Bar', 'users/img_product/ong-nuoc-phu-kien/2 inch, áp suất PN20 Bar.png', 200000, 'Nối ren trong PPR Bình Minh dùng cho các hệ thống cấp nước, chịu được áp suất cao PN20, dễ dàng kết nối các đoạn ống PPR có đường kính Φ20 x 3/4 inch.', 'Bình Minh', 'Trắng', '20mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (73, 'Nắp khóa, bịt đầu ống loại ren ngoài Ø32 nhựa PVC BÌNH MINH, giá tính theo cái', 'users/img_product/ong-nuoc-phu-kien/Nắp khóa, bịt đầu ống loại ren ngoài Ø21 nhựa PVC BÌNH MINH, giá tính theo cái.png', 200000, 'Nắp khóa ren ngoài Ø32 giúp bịt kín đầu ống PVC, ngăn ngừa sự rò rỉ nước, thích hợp cho các công trình lắp đặt ống nước.', 'PVC BÌNH MINH', 'Trắng', '32mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (74, 'Khớp nối sống ( Rắc Co nhựa ) Ø45, Nhựa PVC-U Bình Minh', 'users/img_product/ong-nuoc-phu-kien/Khớp nối sống ( Rắc Co nhựa ) Ø27, Nhựa PVC-U Bình Minh.png', 200000, 'Khớp nối sống Ø45 giúp kết nối các đoạn ống với đường kính 45mm, mang lại sự ổn định và chắc chắn cho các hệ thống cấp nước.', 'PVC-U Bình Minh', 'Trắng', '45mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (75, 'Bồn nước inox 500L', 'users/img_product/ong-nuoc-phu-kien/Bồn nước inox.png', 250000, 'Bồn nước inox 500L được làm từ inox cao cấp, chịu được nhiệt độ cao và an toàn cho nguồn nước, phù hợp cho gia đình hoặc các công trình có nhu cầu lưu trữ nước lớn.', 'Bình Minh', 'Bạc', 'N/A', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 225000.00, 0);
INSERT INTO `products` VALUES (76, 'Ống nhựa PVC Ø50mm, dài 6m', 'users/img_product/ong-nuoc-phu-kien/Ống nhựa PVC lưới mềm ø25mm Luco, cuộn 50m màu xanh dương.png', 150000, 'Ống nhựa PVC Ø50mm, dài 6m, dùng cho các hệ thống cấp thoát nước, dễ dàng thi công và lắp đặt.', 'PVC', 'Trắng', '50mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 135000.00, 0);
INSERT INTO `products` VALUES (77, 'Ống nước PVC Ø40mm, dài 4m', 'users/img_product/ong-nuoc-phu-kien/Ống nhựa Bình Minh PVC-U.png', 150000, 'Ống PVC Ø40mm, dài 4m, chất liệu bền, được sử dụng trong các hệ thống thoát nước và cấp nước cho công trình xây dựng.', 'PVC', 'Trắng', '40mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 135000.00, 0);
INSERT INTO `products` VALUES (78, 'Nối Ren trong PPR Bình Minh Φ25 x 3/4 inch, áp suất PN20 Bar', 'users/img_product/ong-nuoc-phu-kien/Nối rút trơn 90 x 42 M , nhựa PVC-U Bình Minh.png', 200000, 'Nối ren trong PPR Bình Minh Φ25 x 3/4 inch, áp suất PN20, chuyên dụng cho các hệ thống ống nước sinh hoạt và công nghiệp.', 'Bình Minh', 'Trắng', '25mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (79, 'Nối ren trong Ø21 D cho ống nhựa cứng PVC BÌNH MINH', 'users/img_product/ong-nuoc-phu-kien/Nối ren trong Ø21 D cho ống nhựa cứng PVCU Bình Minh.png', 200000, 'Nối ren trong Ø21 D giúp kết nối các đoạn ống nhựa cứng PVC, tiện lợi cho các công trình xây dựng, đảm bảo độ kín khít.', 'PVC BÌNH MINH', 'Trắng', '21mm', 'Cái', 50, 0, 8, '2024-12-10 08:00:00', '2024-12-10 10:00:00', 0.10, 180000.00, 0);
INSERT INTO `products` VALUES (80, 'Máy bơm tăng áp A-130 JAK – Panasonic', 'users/img_product/thietbi-diennuoc/image1t.png', 1505000, 'Máy bơm tăng áp Panasonic, hiệu suất cao, phù hợp cho nhu cầu gia đình và công nghiệp nhỏ.', 'Panasonic', 'Đỏ', 'Trung bình', 'Cái', 50, 0, 9, '2024-12-11 08:00:00', '2024-12-11 08:00:00', 0.30, 1053500.00, 0);
INSERT INTO `products` VALUES (81, 'Máy bơm tăng áp Panasonic JAK-100% lõi đồng', 'users/img_product/thietbi-diennuoc/image2t.png', 1750000, 'Máy bơm tăng áp với lõi đồng, độ bền cao, tiết kiệm điện năng.', 'Panasonic', 'Đồng', 'Lớn', 'Cái', 51, 0, 9, '2024-12-11 08:30:00', '2024-12-11 08:30:00', 0.30, 1225000.00, 0);
INSERT INTO `products` VALUES (82, 'Máy bơm tăng áp Panasonic JAK- có nắp che mưa', 'users/img_product/thietbi-diennuoc/image3t.png', 1680000, 'Máy bơm có nắp che mưa, bảo vệ tốt trong môi trường ngoài trời, thích hợp cho mọi gia đình.', 'Panasonic', 'Trắng', 'Trung bình', 'Cái', 50, 0, 9, '2024-12-11 09:00:00', '2024-12-11 09:00:00', 0.35, 1092000.00, 0);
INSERT INTO `products` VALUES (83, 'Máy Bơm Đẩy Cao Panasonic GP-350JA-SV5 350W', 'users/img_product/thietbi-diennuoc/image4t.png', 2918500, 'Máy bơm đẩy cao Panasonic, công suất 350W, thiết kế hiện đại, độ bền cao.', 'Panasonic', 'Đen', 'Lớn', 'Cái', 52, 0, 9, '2024-12-11 09:30:00', '2024-12-11 09:30:00', 0.35, 1897025.00, 0);
INSERT INTO `products` VALUES (84, 'Máy bơm nước đẩy cao Panasonic GP-129JXK-SV5 125W', 'users/img_product/thietbi-diennuoc/image5t.png', 968000, 'Máy bơm nước đẩy cao với công suất 125W, tiết kiệm điện, thích hợp cho các hộ gia đình.', 'Panasonic', 'Xanh', 'Trung bình', 'Cái', 50, 0, 9, '2024-12-11 10:00:00', '2024-12-11 10:00:00', 0.34, 638880.00, 0);
INSERT INTO `products` VALUES (85, 'Bồn nước inox 1000L Đứng Tân Á Đại Thành', 'users/img_product/thietbi-diennuoc/image6t.png', 3900000, 'Bồn nước inox 1000L chất lượng cao, chống ăn mòn, bền bỉ theo thời gian.', 'Tân Á Đại Thành', 'Bạc', 'Lớn', 'Cái', 51, 0, 9, '2024-12-11 10:30:00', '2024-12-11 10:30:00', 0.24, 2964000.00, 0);
INSERT INTO `products` VALUES (86, 'Bình nóng lạnh năng lượng mặt trời', 'users/img_product/thietbi-diennuoc/image7t.png', 6100000, 'Bình nóng lạnh sử dụng năng lượng mặt trời, tiết kiệm điện năng, thân thiện với môi trường.', 'Tân Á Đại Thành', 'Trắng', 'Lớn', 'Cái', 50, 0, 9, '2024-12-11 11:00:00', '2024-12-11 11:00:00', 0.25, 4575000.00, 0);
INSERT INTO `products` VALUES (87, 'Đồng hồ điện điện tử LSE LS142 có 1 pha 2 dây', 'users/img_product/thietbi-diennuoc/image8t.png', 190000, 'Đồng hồ điện tử LSE, chính hãng, đo đếm chính xác điện năng tiêu thụ.', 'LSE', 'Đen', 'Nhỏ', 'Cái', 50, 0, 9, '2024-12-11 11:30:00', '2024-12-11 11:30:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (88, 'Đồng Hồ Điện Một Pha EMIC 10(40A) – Có Giấy Kiểm Định', 'users/img_product/thietbi-diennuoc/image9t.png', 220000, 'Đồng hồ điện một pha EMIC 10A, có giấy kiểm định chất lượng, độ bền cao.', 'EMIC', 'Trắng', 'Nhỏ', 'Cái', 50, 0, 9, '2024-12-11 12:00:00', '2024-12-11 12:00:00', 0.12, 193600.00, 0);
INSERT INTO `products` VALUES (89, 'Máy nước nóng Beko BWI35S1N-213', 'users/img_product/thietbi-diennuoc/image10t.png', 2199000, 'Máy nước nóng Beko, tiết kiệm điện, an toàn khi sử dụng, thiết kế hiện đại.', 'Beko', 'Trắng', 'Lớn', 'Cái', 50, 0, 9, '2024-12-11 12:30:00', '2024-12-11 12:30:00', 0.10, 1979100.00, 0);
INSERT INTO `products` VALUES (90, 'Máng đèn Anfaco T8 0.6m - 14W', 'users/img_product/thietbi-diennuoc/image11t.png', 120000, 'Máng đèn Anfaco, công suất 14W, ánh sáng tự nhiên, sử dụng cho các không gian làm việc.', 'Anfaco', 'Trắng', 'Nhỏ', 'Cái', 50, 0, 9, '2024-12-11 13:00:00', '2024-12-11 13:00:00', 0.20, 96000.00, 0);
INSERT INTO `products` VALUES (91, 'Đèn LED Duhal âm trần cao cấp KBNL830 30W', 'users/img_product/thietbi-diennuoc/image12t.png', 180000, 'Đèn LED Duhal, tiết kiệm năng lượng, ánh sáng mạnh, thích hợp cho không gian nội thất.', 'Duhal', 'Trắng', 'Nhỏ', 'Cái', 50, 0, 9, '2024-12-11 13:30:00', '2024-12-11 13:30:00', 0.20, 144000.00, 0);
INSERT INTO `products` VALUES (92, 'Công tơ điện 3 pha 4 dây cơ mã LS3E4 chính hãng LSE', 'users/img_product/thietbi-diennuoc/image13t.png', 1312500, 'Công tơ điện 3 pha LSE, đo lường chính xác, dùng cho các công trình lớn, công nghiệp.', 'LSE', 'Đen', 'Lớn', 'Cái', 50, 0, 9, '2024-12-11 14:00:00', '2024-12-11 14:00:00', 0.25, 984375.00, 0);
INSERT INTO `products` VALUES (93, 'Máy bơm tăng áp A-130JTX 150W', 'users/img_product/thietbi-diennuoc/image14t.png', 2730000, 'Máy bơm tăng áp 150W, phù hợp cho hộ gia đình, công suất mạnh mẽ, tiết kiệm điện.', 'A-130JTX', 'Xanh', 'Trung bình', 'Cái', 50, 0, 9, '2024-12-11 14:30:00', '2024-12-11 14:30:00', 0.10, 2457000.00, 0);
INSERT INTO `products` VALUES (96, 'Cát bê tông', 'users/img_product/Da_cat_soi/catbetong.png', 10000, 'Cát bê tông chất lượng cao, chuyên dùng trong các công trình xây dựng như làm móng nhà, đường, cầu cống.', 'Công ty A', 'Xám', 'M3', 'kg', 51, 0, 3, '2024-12-11 09:00:00', '2024-12-11 09:05:00', 0.10, 9000.00, 0);
INSERT INTO `products` VALUES (97, 'Cát đen', 'users/img_product/Da_cat_soi/catden.png', 10000, 'Cát đen sử dụng cho các công trình xây dựng và làm đẹp cho các lớp phủ bề mặt.', 'Công ty B', 'Đen', 'M3', 'kg', 51, 0, 3, '2024-12-11 09:10:00', '2024-12-11 09:15:00', 0.10, 9000.00, 0);
INSERT INTO `products` VALUES (98, 'Cát san lấp', 'users/img_product/Da_cat_soi/catsanlap.png', 10000, 'Cát san lấp là loại cát có chất lượng vừa phải, dùng trong các công trình san lấp mặt bằng.', 'Công ty C', 'Nâu', 'M3', 'kg', 50, 0, 3, '2024-12-11 09:20:00', '2024-12-11 09:25:00', 0.10, 9000.00, 0);
INSERT INTO `products` VALUES (99, 'Cát sông', 'users/img_product/Da_cat_soi/catsong.png', 190000, 'Cát sông chất lượng cao, thường được dùng cho các công trình xây dựng quy mô lớn như nhà cao tầng, đường lớn.', 'Công ty D', 'Vàng', 'M3', 'kg', 50, 0, 3, '2024-12-11 09:30:00', '2024-12-11 09:35:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (100, 'Cát vàng', 'users/img_product/Da_cat_soi/catvang.png', 190000, 'Cát vàng là loại cát có độ mịn cao, thích hợp dùng trong các công trình xây dựng dân dụng và công nghiệp.', 'Công ty E', 'Vàng', 'M3', 'kg', 50, 0, 3, '2024-12-11 09:40:00', '2024-12-11 09:45:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (101, 'Đá 1x2', 'users/img_product/Da_cat_soi/da12.png', 80000, 'Đá 1x2 dùng cho các công trình xây dựng lớn, đặc biệt là làm móng và đường sá.', 'Công ty F', 'Xám', 'M3', 'kg', 50, 0, 3, '2024-12-11 09:50:00', '2024-12-11 09:55:00', 0.15, 68000.00, 0);
INSERT INTO `products` VALUES (102, 'Đá 4x6', 'users/img_product/Da_cat_soi/da46.png', 80000, 'Đá 4x6 chuyên dùng cho các công trình xây dựng lớn, giúp gia cố và tạo độ bền cho các công trình.', 'Công ty G', 'Xám', 'M3', 'kg', 50, 0, 3, '2024-12-11 10:00:00', '2024-12-11 10:05:00', 0.15, 68000.00, 0);
INSERT INTO `products` VALUES (103, 'Đá dăm', 'users/img_product/Da_cat_soi/dadam.png', 80000, 'Đá dăm là loại đá có kích thước nhỏ, dùng cho các công trình xây dựng và làm vật liệu độn.', 'Công ty H', 'Xám', 'M3', 'kg', 50, 0, 3, '2024-12-11 10:10:00', '2024-12-11 10:15:00', 0.15, 68000.00, 0);
INSERT INTO `products` VALUES (104, 'Đá sỏi', 'users/img_product/Da_cat_soi/dasoi.png', 80000, 'Đá sỏi dùng trong các công trình xây dựng nhỏ, hoặc làm vật liệu trang trí cho sân vườn.', 'Công ty I', 'Xám', 'M3', 'kg', 50, 0, 3, '2024-12-11 10:20:00', '2024-12-11 10:25:00', 0.15, 68000.00, 0);
INSERT INTO `products` VALUES (109, 'Cát bê tông 2', 'users/img_product/Da_cat_soi/catbetong2.png', 15000, 'Cát bê tông 2 là loại cát có độ mịn cao, phù hợp với các công trình đòi hỏi sự chắc chắn như bê tông cốt thép.', 'Công ty N', 'Xám', 'M3', 'kg', 50, 0, 3, '2024-12-11 11:10:00', '2024-12-11 11:15:00', 0.10, 13500.00, 0);
INSERT INTO `products` VALUES (110, 'Cát sông 2', 'users/img_product/Da_cat_soi/catsong2.png', 180000, 'Cát sông 2 có chất lượng vượt trội, sử dụng cho các công trình lớn như cầu cống, đường cao tốc.', 'Công ty O', 'Vàng', 'M3', 'kg', 50, 0, 3, '2024-12-11 11:20:00', '2024-12-11 11:25:00', 0.15, 153000.00, 0);
INSERT INTO `products` VALUES (111, 'Cát đen 2', 'users/img_product/Da_cat_soi/catden2.png', 11000, 'Cát đen 2 là loại cát có độ tinh khiết cao, dùng cho các công trình đòi hỏi yêu cầu cao về chất lượng.', 'Công ty P', 'Đen', 'M3', 'kg', 50, 0, 3, '2024-12-11 11:30:00', '2024-12-11 11:35:00', 0.05, 9900.00, 0);
INSERT INTO `products` VALUES (112, 'Gỗ cao cấp', 'users/img_product/vat_lieu_go/image1g.png', 190000, 'Gỗ cao cấp chất lượng tốt', 'Nhà cung cấp A', 'Nâu', 'L', 'Cái', 50, 0, 5, '2024-12-10 08:00:00', '2024-12-10 08:15:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (113, 'Gỗ trắng đặc', 'users/img_product/vat_lieu_go/image10g.png', 190000, 'Gỗ trắng đặc, chất lượng cao', 'Nhà cung cấp B', 'Trắng', 'M', 'Cái', 50, 0, 5, '2024-12-10 08:05:00', '2024-12-10 08:20:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (114, 'Gỗ thanh mượt', 'users/img_product/vat_lieu_go/image11g.png', 190000, 'Gỗ thanh mượt, dễ sử dụng', 'Nhà cung cấp C', 'Vàng', 'S', 'Cái', 50, 0, 5, '2024-12-10 08:10:00', '2024-12-10 08:30:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (115, 'Gỗ đa năng', 'users/img_product/vat_lieu_go/image12g.png', 190000, 'Gỗ đa năng, sử dụng linh hoạt', 'Nhà cung cấp D', 'Nâu', 'M', 'Cái', 50, 0, 5, '2024-12-10 08:15:00', '2024-12-10 08:40:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (116, 'Gỗ thanh trà', 'users/img_product/vat_lieu_go/image2g.png', 190000, 'Gỗ thanh trà, bền chắc', 'Nhà cung cấp E', 'Nâu', 'L', 'Cái', 50, 0, 5, '2024-12-10 08:20:00', '2024-12-10 08:45:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (117, 'Gỗ lõi đen', 'users/img_product/vat_lieu_go/image3g.png', 190000, 'Gỗ lõi đen, chất lượng cao', 'Nhà cung cấp F', 'Đen', 'L', 'Cái', 50, 0, 5, '2024-12-10 08:25:00', '2024-12-10 08:50:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (118, 'Gỗ đặc', 'users/img_product/vat_lieu_go/image4g.png', 190000, 'Gỗ đặc, chắc chắn và bền bỉ', 'Nhà cung cấp G', 'Nâu', 'L', 'Cái', 50, 0, 5, '2024-12-10 08:30:00', '2024-12-10 09:00:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (119, 'Gỗ phân tầng', 'users/img_product/vat_lieu_go/image5g.png', 190000, 'Gỗ phân tầng, phù hợp cho mọi không gian', 'Nhà cung cấp H', 'Vàng', 'S', 'Cái', 50, 0, 5, '2024-12-10 08:35:00', '2024-12-10 09:05:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (120, 'Gỗ thanh đa', 'users/img_product/vat_lieu_go/image6g.png', 190000, 'Gỗ thanh đa, độ bền cao', 'Nhà cung cấp I', 'Nâu', 'L', 'Cái', 50, 0, 5, '2024-12-10 08:40:00', '2024-12-10 09:10:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (121, 'Gỗ khối lớn', 'users/img_product/vat_lieu_go/image7g.png', 190000, 'Gỗ khối lớn, sử dụng cho các công trình lớn', 'Nhà cung cấp J', 'Nâu', 'L', 'Cái', 50, 0, 5, '2024-12-10 08:45:00', '2024-12-10 09:15:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (122, 'Gỗ khớp vàng', 'users/img_product/vat_lieu_go/image8g.png', 190000, 'Gỗ khớp vàng, dễ sử dụng và lắp đặt', 'Nhà cung cấp K', 'Vàng', 'S', 'Cái', 50, 0, 5, '2024-12-10 08:50:00', '2024-12-10 09:20:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (123, 'Gỗ thanh đen', 'users/img_product/vat_lieu_go/image9g.png', 190000, 'Gỗ thanh đen, phù hợp cho nội thất cao cấp', 'Nhà cung cấp L', 'Đen', 'M', 'Cái', 50, 0, 5, '2024-12-10 08:55:00', '2024-12-10 09:30:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (124, 'Gỗ trơ', 'users/img_product/vat_lieu_go/gotro.png', 190000, 'Gỗ trơ, bền vững theo thời gian', 'Nhà cung cấp M', 'Nâu', 'L', 'Cái', 50, 0, 5, '2024-12-10 09:00:00', '2024-12-10 09:35:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (125, 'Gỗ thông', 'users/img_product/vat_lieu_go/gothong.png', 190000, 'Gỗ thông, dễ chế biến và sử dụng', 'Nhà cung cấp N', 'Vàng', 'M', 'Cái', 50, 0, 5, '2024-12-10 09:05:00', '2024-12-10 09:40:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (126, 'Gỗ óc chó', 'users/img_product/vat_lieu_go/gooccho.png', 190000, 'Gỗ óc chó, chất lượng cao', 'Nhà cung cấp O', 'Nâu', 'M', 'Cái', 50, 0, 5, '2024-12-10 09:10:00', '2024-12-10 09:45:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (127, 'Gỗ hương', 'users/img_product/vat_lieu_go/gohuong.png', 190000, 'Gỗ hương, mang lại sự ấm cúng', 'Nhà cung cấp P', 'Vàng', 'L', 'Cái', 50, 0, 5, '2024-12-10 09:15:00', '2024-12-10 09:50:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (128, 'Gỗ hồng', 'users/img_product/vat_lieu_go/gohong.png', 190000, 'Gỗ hồng, chất liệu tuyệt vời cho nội thất', 'Nhà cung cấp Q', 'Hồng', 'S', 'Cái', 50, 0, 5, '2024-12-10 09:20:00', '2024-12-10 10:00:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (129, 'Gỗ căm xe', 'users/img_product/vat_lieu_go/gocamxe.png', 190000, 'Gỗ căm xe, bền bỉ với thời gian', 'Nhà cung cấp R', 'Nâu', 'M', 'Cái', 51, 0, 5, '2024-12-10 09:25:00', '2024-12-10 10:05:00', 0.50, 171000.00, 0);
INSERT INTO `products` VALUES (130, 'Sơn Nội Thất DULUX AMBIANCE 5 IN1 PEARL GLOW Bóng mờ', 'users/img_product/son/Sơn Nội Thất DULUX AMBIANCE 5 IN1 PEARL GLOW Bóng mờ.png', 200000, 'Sơn nội thất Dulux AMBIANCE 5 trong 1, Bóng mờ giúp không gian nhà bạn sáng bóng và dễ dàng vệ sinh.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-01 08:00:00', '2024-12-01 08:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (131, 'Sơn Nội Thất Dulux Ambiance 5in1 Superflexx', 'users/img_product/son/Sơn Nội Thất Dulux Ambiance 5in1 Superflexx.png', 200000, 'Sơn Dulux Ambiance 5in1 Superflexx với công nghệ chống thấm, bảo vệ tối ưu cho không gian sống.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-02 09:00:00', '2024-12-02 09:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (132, 'Sơn Nội Thất Dulux EasyClean Chống Bám Bẩn Kháng Virus', 'users/img_product/son/Sơn Nội Thất Dulux EasyClean Chống Bám Bẩn Kháng Virus.png', 200000, 'Sơn Dulux EasyClean với khả năng chống bám bẩn và kháng virus, bảo vệ không gian gia đình bạn.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-03 10:00:00', '2024-12-03 10:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (133, 'Sơn Nội Thất Dulux EasyClean Chống Bám Bẩn', 'users/img_product/son/Sơn Nội Thất Dulux EasyClean Chống Bám Bẩn.png', 200000, 'Sơn nội thất Dulux EasyClean giúp dễ dàng vệ sinh bề mặt sơn, giữ cho không gian sạch sẽ.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-04 11:00:00', '2024-12-04 11:30:00', 0.05, 95000.00, 0);
INSERT INTO `products` VALUES (134, 'Sơn Nội Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt Bóng', 'users/img_product/son/Sơn Nội Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt Bóng.png', 200000, 'Sơn Dulux Inspire với sắc màu bền đẹp, bề mặt bóng, phù hợp cho các công trình hiện đại.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-05 12:00:00', '2024-12-05 12:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (135, 'Sơn Nội Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt Mờ', 'users/img_product/son/Sơn Nội Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt Mờ.png', 200000, 'Sơn Dulux Inspire với màu sắc bền đẹp, bề mặt mờ cho không gian sang trọng và hiện đại.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 51, 0, 6, '2024-12-06 13:00:00', '2024-12-06 13:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (136, 'Sơn Sắt Giả Gỗ Lotus Meta Coat Primer – 1 Sơn Lót + 1 Sơn Phủ', 'users/img_product/son/Sơn Sắt Giả Gỗ Lotus Meta Coat Primer – 1 Sơn Lót + 1 Sơn Phủ.png', 200000, 'Sơn lót và sơn phủ Lotus Meta Coat Primer với công nghệ sơn giả gỗ, bảo vệ bề mặt kim loại.', 'Lotus', 'Gỗ', 'Lít', 'Hộp', 50, 0, 6, '2024-12-07 14:00:00', '2024-12-07 14:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (137, 'Sơn nước ngoại thất Dulux Weathershield Bề Mặt', 'users/img_product/son/Sơn nước ngoại thất Dulux Weathershield Bề Mặt .png', 200000, 'Sơn ngoại thất Dulux Weathershield với công nghệ chống thấm giúp bảo vệ lâu dài cho ngôi nhà.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-08 15:00:00', '2024-12-08 15:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (138, 'Sơn nước ngoại thất Dulux Weathershield Colour Protect Bề Mặt', 'users/img_product/son/Sơn nước ngoại thất Dulux Weathershield Colour Protect Bề Mặt.png', 200000, 'Sơn Dulux Weathershield Colour Protect bảo vệ bề mặt ngoại thất khỏi tác động của thời tiết.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-09 16:00:00', '2024-12-09 16:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (139, 'Sơn nước ngoại thất Dulux Weathershield Powerflexx Bề Mặt', 'users/img_product/son/Sơn nước ngoại thất Dulux Weathershield Powerflexx Bề Mặt.png', 200000, 'Sơn Dulux Weathershield Powerflexx với khả năng chống chịu thời tiết khắc nghiệt, bảo vệ bề mặt bền vững.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-10 17:00:00', '2024-12-10 17:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (140, 'Sơn nước ngoại thất Maxilite Tough từ Dulux Bề Mặt', 'users/img_product/son/Sơn nước ngoại thất Maxilite Tough từ Dulux Bề Mặt.png', 200000, 'Sơn ngoại thất Maxilite Tough từ Dulux với khả năng chống bám bẩn và độ bền cao.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-11 18:00:00', '2024-12-11 18:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (141, 'SƠN NƯỚC NGOẠI THẤT SUPERTECH PRO EXTERIOR', 'users/img_product/son/SƠN NƯỚC NGOẠI THẤT SUPERTECH PRO EXTERIOR.png', 200000, 'Sơn ngoại thất Supertech Pro Exterior chống thấm, bảo vệ bề mặt lâu dài với màu sắc đẹp.', 'Supertech', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-12 19:00:00', '2024-12-12 19:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (142, 'Sơn Lót Ngoại Thất Siêu Cao Cấp Dulux Weathershield Chống Kiềm', 'users/img_product/son/Sơn Lót Ngoại Thất Siêu Cao Cấp Dulux Weathershield Chống Kiềm.png', 200000, 'Sơn lót ngoại thất Dulux Weathershield giúp bảo vệ và chống kiềm cho bề mặt tường ngoại thất.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-13 20:00:00', '2024-12-13 20:30:00', 0.10, 10000.00, 0);
INSERT INTO `products` VALUES (143, 'Sơn Lót Ngoại Thất Siêu Cao Cấp Dulux Weathershield Protection', 'users/img_product/son/Sơn Lót Ngoại Thất Siêu Cao Cấp Dulux Weathershield Powersealer.png', 200000, 'Sơn lót Dulux Weathershield Protection bảo vệ bề mặt ngoại thất khỏi tác động của thời tiết.', 'Dulux', 'Trắng', 'Lít', 'Hộp', 50, 0, 6, '2024-12-14 21:00:00', '2024-12-14 21:30:00', 0.50, 10000.00, 0);
INSERT INTO `products` VALUES (144, 'Sơn Ngoại Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt', 'users/img_product/son/Sơn Ngoại Thất Dulux Inspire Sắc Màu Bền Đẹp Bề Mặt.png', 190000, 'Sơn ngoại thất Dulux Inspire với màu sắc bền đẹp, phù hợp cho không gian ngoài trời, giúp bảo vệ ngôi nhà khỏi tác động của thời tiết.', 'Dulux', 'Trắng', '5L', 'Hộp', 50, 0, 6, '2024-12-11 08:00:00', '2024-12-11 09:00:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (145, 'SƠN LÓT LẤP TIM LÀM MỊN GỖ LOTUS SANDING SEALER', 'users/img_product/son/SƠN LÓT LẤP TIM LÀM MỊN GỖ LOTUS SANDING SEALER.png', 190000, 'Sơn lót giúp tạo bề mặt mịn màng cho gỗ, dễ dàng thi công, bảo vệ và nâng cao độ bền của sản phẩm gỗ.', 'Lotus', 'Vàng', '5L', 'Hộp', 50, 0, 6, '2024-12-11 09:00:00', '2024-12-11 10:00:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (146, 'Sơn nước nội thất cao cấp TOA Nanoclean', 'users/img_product/son/Sơn nước nội thất cao cấp TOA Nanoclean.png', 190000, 'Sơn nước nội thất cao cấp với khả năng làm sạch hiệu quả, giúp không gian sống luôn tươi mới và bảo vệ bề mặt lâu dài.', 'TOA', 'Trắng', '5L', 'Hộp', 50, 0, 6, '2024-12-11 10:00:00', '2024-12-11 11:00:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (147, 'Sơn nước nội thất sinh học DULUX BETTER LIVING AIR CLEAN', 'users/img_product/son/Sơn nước nội thất sinh học DULUX BETTER LIVING AIR CLEAN.png', 190000, 'Sơn sinh học giúp không gian trong lành, không chứa hóa chất độc hại, an toàn cho sức khỏe người sử dụng.', 'Dulux', 'Trắng', '5L', 'Hộp', 50, 0, 6, '2024-12-11 11:00:00', '2024-12-11 12:00:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (148, 'Phụ gia chống thấm BS-8430 Latex', 'users/img_product/son/Phụ gia chống thấm BS-8430 Latex.png', 190000, 'Phụ gia chống thấm BS-8430 Latex giúp bảo vệ bề mặt công trình, ngăn ngừa thấm nước hiệu quả, phù hợp với các công trình xây dựng.', 'BS', 'Trắng', '1L', 'Chai', 50, 0, 6, '2024-12-11 12:00:00', '2024-12-11 13:00:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (149, 'Sơn Nội Thất Cao Cấp Dulux Easyclean Lau Chùi Hiệu Quả Bề Mặt Bóng', 'users/img_product/son/Sơn Nội Thất Cao Cấp Dulux Easyclean Lau Chùi Hiệu Quả Bề Mặt Bóng.png', 190000, 'Sơn nội thất cao cấp với tính năng dễ dàng lau chùi, bảo vệ bề mặt sáng bóng và bền lâu.', 'Dulux', 'Trắng', '5L', 'Hộp', 50, 0, 6, '2024-12-11 13:00:00', '2024-12-11 14:00:00', 0.10, 171000.00, 0);
INSERT INTO `products` VALUES (153, 'hhhhhh1', 'users/img/Screenshot 2025-01-14 125940.png', 232323, 'edwsrew', 'cddd', 'ddor', '30cm', 'km', 0, 0, 1, '2025-04-05 21:45:49', '2025-04-05 21:45:49', 0.20, 185858.40, 0);
INSERT INTO `products` VALUES (154, 'hhhhhh1', 'users/img/Screenshot 2025-01-14 125940.png', 232323, '', 'cddd', 'ddor', '30cm', 'km', 0, 0, 1, '2025-04-05 21:46:01', '2025-04-05 21:46:01', 0.20, 185858.40, 0);
INSERT INTO `products` VALUES (155, 'hhhhhh1', 'users/img/Screenshot 2025-01-14 125940.png', 232323, '', 'cddd', 'ddor', '30cm', 'km', 0, 0, 1, '2025-04-05 21:47:12', '2025-04-05 21:47:12', 0.20, 185858.40, 0);
INSERT INTO `products` VALUES (156, 'Đá', 'users/img/Screenshot 2024-12-25 002050.png', 232323, '', 'cddd', 'ddor', '30cm', 'km', 0, 0, 1, '2025-04-06 00:39:15', '2025-04-06 11:55:39', 0.20, 46464.60, 1);
INSERT INTO `products` VALUES (157, 'Đá123', 'users/img/Screenshot 2024-12-20 174916.png', 232323, '', 'cddd', 'ddor', '30cm', 'km', 0, 0, 1, '2025-04-06 11:55:27', '2025-04-06 11:55:27', 0.20, 185858.40, NULL);

-- ----------------------------
-- Table structure for promotional
-- ----------------------------
DROP TABLE IF EXISTS `promotional`;
CREATE TABLE `promotional`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` decimal(10, 2) NULL DEFAULT NULL,
  `minPriceCart` decimal(18, 2) NULL DEFAULT NULL,
  `startDate` datetime NULL DEFAULT NULL,
  `endDate` datetime NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promotional
-- ----------------------------
INSERT INTO `promotional` VALUES (4, 'TUANN', 40005.00, NULL, '2025-04-16 11:33:00', '2025-04-16 11:33:00', 'Hoạt động');

-- ----------------------------
-- Table structure for rating
-- ----------------------------
DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rating
-- ----------------------------
INSERT INTO `rating` VALUES (4, 5, 1, 'Sản phẩm rất tốt', '2025-04-06 09:49:00');
INSERT INTO `rating` VALUES (5, 7, 1, 'Sản phẩm tốt và chất lượng', '2025-04-06 09:49:23');

-- ----------------------------
-- Table structure for stocktransaction
-- ----------------------------
DROP TABLE IF EXISTS `stocktransaction`;
CREATE TABLE `stocktransaction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `transactionDate` datetime NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `productId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stocktransaction
-- ----------------------------
INSERT INTO `stocktransaction` VALUES (1, 'Nhập kho', '2025-03-30 15:18:05', 12, 'nhập thêm', '20', 1);
INSERT INTO `stocktransaction` VALUES (2, 'Nhập kho', '2025-03-30 15:25:39', 12, 'Nhập thêm', '10', 1);
INSERT INTO `stocktransaction` VALUES (3, 'Nhập kho', '2025-03-30 15:43:59', 12, 'theem 26 ', '20', 1);
INSERT INTO `stocktransaction` VALUES (4, 'Nhập kho', '2025-03-30 15:44:00', 12, 'theem 26 ', '20', 1);
INSERT INTO `stocktransaction` VALUES (5, 'Nhập kho', '2025-03-30 15:44:22', 12, 'theem 26 ', '20', 1);
INSERT INTO `stocktransaction` VALUES (6, 'Nhập kho', '2025-03-30 16:01:17', 12, 'weet', '4', 1);
INSERT INTO `stocktransaction` VALUES (7, 'Nhập kho', '2025-03-30 16:01:44', 12, 'wadad', '10', 1);
INSERT INTO `stocktransaction` VALUES (8, 'Nhập kho', '2025-03-30 16:06:52', 12, '12321321', '13', 1);
INSERT INTO `stocktransaction` VALUES (9, 'Nhập kho', '2025-03-30 16:07:21', 12, 'sewew', '10', 1);
INSERT INTO `stocktransaction` VALUES (10, 'Nhập kho', '2025-04-01 01:04:07', 12, '', '12', 1);
INSERT INTO `stocktransaction` VALUES (11, 'Nhập kho', '2025-04-01 01:08:42', 12, 'nhập thêm', '10', 1);
INSERT INTO `stocktransaction` VALUES (12, 'Nhập kho', '2025-04-01 01:13:43', 12, 'sdfsdf', '10', 2);
INSERT INTO `stocktransaction` VALUES (13, 'Nhập kho', '2025-04-01 01:15:14', 12, '231123sdfgsd', '10', 2);
INSERT INTO `stocktransaction` VALUES (15, 'Nhập kho', '2025-04-01 13:04:11', 12, 'ểtrter', '10', 1);
INSERT INTO `stocktransaction` VALUES (16, 'Nhập kho', '2025-04-01 13:14:16', 12, 'sdsf', '10', 1);
INSERT INTO `stocktransaction` VALUES (17, 'Nhập kho', '2025-04-01 13:17:16', 12, '2esrsefsdf', '10', 1);
INSERT INTO `stocktransaction` VALUES (19, 'Nhập kho', '2025-04-02 10:28:25', 12, '', '20', 5);
INSERT INTO `stocktransaction` VALUES (20, 'Nhập kho', '2025-04-02 10:40:11', 12, '', '20', 5);
INSERT INTO `stocktransaction` VALUES (21, 'Xuất kho', '2025-04-02 10:40:27', 12, '', '20', 5);
INSERT INTO `stocktransaction` VALUES (22, 'Nhập kho', '2025-04-02 10:42:44', 12, '', '20', 5);
INSERT INTO `stocktransaction` VALUES (23, 'Xuất kho', '2025-04-02 10:42:52', 12, '', '20', 5);
INSERT INTO `stocktransaction` VALUES (25, 'Xuất kho', '2025-04-02 10:53:40', 12, '', '1', 3);
INSERT INTO `stocktransaction` VALUES (26, 'Xuất kho', '2025-04-02 10:54:06', 12, '', '1', 2);
INSERT INTO `stocktransaction` VALUES (27, 'Xuất kho', '2025-04-02 10:54:24', 12, '', '20', 4);
INSERT INTO `stocktransaction` VALUES (28, 'Nhập kho', '2025-04-02 10:54:49', 12, '', '10', 4);
INSERT INTO `stocktransaction` VALUES (29, 'Xuất kho', '2025-04-02 10:54:55', 12, '', '10', 4);
INSERT INTO `stocktransaction` VALUES (30, 'Xuất kho', '2025-04-02 10:55:28', 12, '', '10', 75);
INSERT INTO `stocktransaction` VALUES (31, 'Nhập kho', '2025-04-02 11:26:24', 12, '', '100', 75);
INSERT INTO `stocktransaction` VALUES (32, 'Xuất kho', '2025-04-02 11:26:38', 12, '', '100', 7);
INSERT INTO `stocktransaction` VALUES (33, 'Nhập kho', '2025-04-02 11:32:17', 12, '', '100', 7);
INSERT INTO `stocktransaction` VALUES (34, 'Xuất kho', '2025-04-02 11:44:13', 12, '', '100', 7);
INSERT INTO `stocktransaction` VALUES (35, 'Xuất kho', '2025-04-02 11:44:23', 12, '', '100', 7);
INSERT INTO `stocktransaction` VALUES (36, 'Nhập kho', '2025-04-02 11:49:33', 12, '', '100', 7);
INSERT INTO `stocktransaction` VALUES (37, 'Nhập kho', '2025-04-02 11:49:40', 12, '', '100', 7);
INSERT INTO `stocktransaction` VALUES (38, 'Xuất kho', '2025-04-02 12:00:34', 12, '', '10', 7);
INSERT INTO `stocktransaction` VALUES (40, 'Xuất kho', '2025-04-02 13:08:00', 12, '', '100', 7);
INSERT INTO `stocktransaction` VALUES (42, 'Xuất kho', '2025-04-02 13:16:07', 12, '', '1000000', 10);
INSERT INTO `stocktransaction` VALUES (43, 'Xuất kho', '2025-04-02 13:16:28', 12, '', '3000000', 10);
INSERT INTO `stocktransaction` VALUES (46, 'Xuất kho', '2025-04-02 13:39:51', 12, '', '134', 2);
INSERT INTO `stocktransaction` VALUES (47, 'Xuất kho', '2025-04-02 18:07:11', 12, '', '100', 2);
INSERT INTO `stocktransaction` VALUES (48, 'Xuất kho', '2025-04-02 18:07:27', 12, '', '50', 2);
INSERT INTO `stocktransaction` VALUES (51, 'Xuất kho', '2025-04-02 19:56:40', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (53, 'Xuất kho', '2025-04-02 19:56:53', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (54, 'Xuất kho', '2025-04-02 19:56:58', 12, '', '1', 8);
INSERT INTO `stocktransaction` VALUES (55, 'Xuất kho', '2025-04-02 22:01:36', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (56, 'Nhập kho', '2025-04-02 22:01:42', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (57, 'Xuất kho', '2025-04-03 12:03:27', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (58, 'Xuất kho', '2025-04-03 12:03:31', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (59, 'Xuất kho', '2025-04-03 12:19:27', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (61, 'Xuất kho', '2025-04-03 12:32:48', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (68, 'Xuất kho', '2025-04-03 12:50:40', 12, '', '3', 1);
INSERT INTO `stocktransaction` VALUES (69, 'Xuất kho', '2025-04-03 12:51:02', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (71, 'Xuất kho', '2025-04-03 13:04:44', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (73, 'Xuất kho', '2025-04-03 13:21:55', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (75, 'Xuất kho', '2025-04-03 13:26:03', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (77, 'Xuất kho', '2025-04-03 13:29:02', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (79, 'Xuất kho', '2025-04-03 13:29:55', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (81, 'Xuất kho', '2025-04-03 13:33:34', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (84, 'Xuất kho', '2025-04-03 13:34:43', 12, '', '2', 1);
INSERT INTO `stocktransaction` VALUES (86, 'Xuất kho', '2025-04-03 13:35:48', 12, '', '2', 1);
INSERT INTO `stocktransaction` VALUES (89, 'Xuất kho', '2025-04-03 13:36:11', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (94, 'Xuất kho', '2025-04-03 13:48:18', 12, '', '2', 1);
INSERT INTO `stocktransaction` VALUES (97, 'Xuất kho', '2025-04-03 14:04:50', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (102, 'Xuất kho', '2025-04-03 14:12:34', 12, '', '2', 1);
INSERT INTO `stocktransaction` VALUES (106, 'Xuất kho', '2025-04-03 14:48:50', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (110, 'Xuất kho', '2025-04-03 15:12:30', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (112, 'Xuất kho', '2025-04-03 15:12:58', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (113, 'Xuất kho', '2025-04-03 15:22:27', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (116, 'Xuất kho', '2025-04-03 15:28:15', 12, '', '1', 21);
INSERT INTO `stocktransaction` VALUES (117, 'Xuất kho', '2025-04-03 15:28:19', 12, '', '1', 1);
INSERT INTO `stocktransaction` VALUES (118, 'Xuất kho', '2025-04-03 15:28:26', 12, '', '999', 1);
INSERT INTO `stocktransaction` VALUES (121, 'Xuất kho', '2025-04-03 17:12:57', 12, '', '200', 1);
INSERT INTO `stocktransaction` VALUES (122, 'Xuất kho', '2025-04-03 17:13:04', 12, '', '0', 1);
INSERT INTO `stocktransaction` VALUES (125, 'Xuất kho', '2025-04-03 17:22:44', 12, '', '10', 1);
INSERT INTO `stocktransaction` VALUES (126, 'Xuất kho', '2025-04-03 17:22:51', 12, '', '10', 1);
INSERT INTO `stocktransaction` VALUES (129, 'Nhập kho', '2025-04-03 17:27:50', 12, '', '12', 1);
INSERT INTO `stocktransaction` VALUES (130, 'Xuất kho', '2025-04-03 17:27:54', 12, '', '111', 1);
INSERT INTO `stocktransaction` VALUES (131, 'Nhập kho', '2025-04-03 17:28:02', 12, '', '20', 1);
INSERT INTO `stocktransaction` VALUES (132, 'Xuất kho', '2025-04-03 17:29:30', 12, '', '1', 11);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isEmailVerified` int(11) NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  `updateDate` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'lamhuybmt12@gmail.com', 'Võ Văn QUốc Tuấn', 'Huy', '$2a$10$hIcG9yx4vcvxSVSirlgE4.NbuvQ5KsksKpFiKClUAvkhGJEjD6E6S', 'HCMs', '098755475', 'user', 'Không hoạt động', 1, '2024-12-11 17:08:16', '2024-12-11 17:08:16', 0);
INSERT INTO `users` VALUES (3, 'lamhuybmt012@gmail.com', 'Võ Văn Quốc Tuấn', 'Admin', '$2a$10$qRgr2bG4z8xdq0.d8us6EOXWJO9mR3rFzMnLcJBmtt96G//xyBTce', 'ứdsdsd', '0386394258', 'admin', 'Không hoạt động', 1, '2024-12-22 10:14:05', '2024-12-22 10:14:05', 0);
INSERT INTO `users` VALUES (12, '22130313@st.hcmuaf.edu.vn', '22130313@st.hcmuaf.edu.vn', 'tuan', '$2a$10$0GaOg.08q1NcN0.ykX3YMunAdEs1H8FluxyknCvgiD8JScwWkz1au', 'wewethoong', '0324324324', 'owner', 'Không hoạt động', 1, '2025-01-13 15:11:51', '2025-01-13 15:11:51', 0);
INSERT INTO `users` VALUES (14, 'vovanquoctuan12a2ntt@gmail.com', NULL, 'Tuấn Võ', '$2a$10$fT0ulmmYF.98MDDd815KgOG.4AV8t2Cs4XsrT7eenTaVrQcmIyxoK', NULL, NULL, 'user', 'Hoạt động', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (16, 'tuan@gmail.com', NULL, 'ttttttt', '$2a$10$QZipkw0coTXssMQSuKvm4ef.CD8/u.vj4q0RbPyFHWDDysLchvZwC', NULL, NULL, 'user', 'Đang chờ xử lý', 1, NULL, NULL, 1);
INSERT INTO `users` VALUES (17, 'tuan12345@gmail.com', NULL, 'tuan12345', '$2a$10$ShcN0GRJ7liePqHgzOxqq.K9C.uERmBo9D8dDUpVpopJiTXmyasU2', NULL, NULL, 'user', 'Đang chờ xử lý', 1, NULL, NULL, 1);
INSERT INTO `users` VALUES (18, 'votuan042004@gmail.com', NULL, 'Tuấn Võ', '$2a$10$qk1UGvlgTNJp8OXdo.ax5u0gv6pDD/bjVNd7eeEQ5zt85V62Mfg3K', NULL, NULL, 'user', 'Không hoạt động', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (19, 'tuan121@gmial.com', NULL, 'tuan121', '$2a$10$asfhPhtHh9N0sC6qNuMVxuVd9dny1uF1V8m9oEvKOHGGX9tZY7F/W', NULL, NULL, 'user', 'Hoạt động', 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (20, 'tuam1111@gmail.com', NULL, 'tuan11111', '$2a$10$67xG/Onu8c/oD1r9q.Hlwev8wIs6Q4xUgO9VMtWxIiPr7BNXz1sJi', NULL, NULL, 'user', 'Đang chờ xử lý', 1, NULL, NULL, 1);
INSERT INTO `users` VALUES (21, 'tuam11@gmail.com', NULL, 'tuan11', '$2a$10$24BO6x9HGy9/3oqtFEe19eexVtSWVLAm6/bGgMMJwOuK18TB/3V1u', NULL, NULL, NULL, 'Đang chờ xử lý', 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (22, 'tuam111@gmail.com', NULL, 'tuan111', '$2a$10$3kOqfEDNv/KIP9aSOkbNaeKlYu9qJzsn7hcerIorp2zu4pwTJxIc.', NULL, NULL, NULL, 'Đang chờ xử lý', 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (23, 'tuam111111@gmail.com', NULL, 'tuan111111', '$2a$10$VITvTSWcNTWkX.YJSQwawe/P2VJAXIYUHSggdfIlJdvO..Zw1taKq', NULL, NULL, 'user', 'Đang chờ xử lý', 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (24, 'tuan222@gmail.com', NULL, 'tuan222', '$2a$10$TeEat0K5g6l7TEslyAHmz.dUpqQnk.dDs0EtphWdFvzfLmMIqzE8m', NULL, NULL, 'user', 'Đang chờ xử lý', 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (25, 'lamhuybmt124@gmail.com', NULL, 'Diệp Lâm', '$2a$10$P1ZJTaqgYmZwoQ1nZ1hLj.wL8NL5pkSlAN/wsPAGB9llY5GGvjqqu', NULL, NULL, 'user', 'Không hoạt động', 1, '2025-04-13 16:53:59', NULL, NULL);

-- ----------------------------
-- Table structure for verifyemail
-- ----------------------------
DROP TABLE IF EXISTS `verifyemail`;
CREATE TABLE `verifyemail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `codeExpiry` datetime NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `verifyemail_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of verifyemail
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
