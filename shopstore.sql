/*
 Navicat Premium Data Transfer

 Source Server         : 24B103120326李阳
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : shopstore

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 10/05/2025 21:13:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '管理员id（自增）',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `administrator_name_uindex`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品的唯一标识，主键，自动递增，用于区分不同商品记录。',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称，必填字段，用于标识商品类别',
  `shop_id` int(0) NOT NULL COMMENT '关联 shop 表的 id，表示该商品所属店铺的编号',
  `shop_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称，记录销售该商品的店铺名，可为空。',
  `photo_one` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的第一张图片路径，用于存储商品展示图片的地址 。',
  `inventory` int(10) UNSIGNED ZEROFILL NULL DEFAULT 0000000000 COMMENT '商品库存数量，默认值为 0，用于记录当前商品的库存情况 ',
  `kind_id` int(0) NULL DEFAULT NULL COMMENT '关联 kind 表的 id，表示商品所属类别编号',
  `price` double NULL DEFAULT NULL COMMENT '商品价格，记录商品的售卖价格，可为空。',
  `degree` int(0) NULL DEFAULT NULL COMMENT '用于表示商品的降价等级或程度相关信息',
  `discount` double NULL DEFAULT NULL COMMENT '商品折扣，记录商品的折扣信息，可为空',
  `bargain` tinyint(0) NULL DEFAULT NULL COMMENT '0:不许议价,1:准许议价',
  `size` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品规格，以文本形式记录商品的尺寸、大小等规格信息',
  `instruction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品说明，以文本形式记录商品的详细介绍、使用说明等内容',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '0:待审核,1:发布,2:锁定,3:下架',
  `score` double NULL DEFAULT 5 COMMENT '平均分数(5分制)',
  `evaluation_count` int(0) NULL DEFAULT 0 COMMENT '商品评价数量，默认值为 0，记录对该商品进行评价的次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commodity_kind_id_fk`(`kind_id`) USING BTREE,
  INDEX `commodity_shop_id_fk`(`shop_id`) USING BTREE,
  CONSTRAINT `commodity_ibfk_1` FOREIGN KEY (`kind_id`) REFERENCES `kind` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES (2, '小米15手机', 1, '小米公司', '/img/mi.png', 0000000003, 1, 3999, NULL, 0.8, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合.', 1, 2.8462, 13);
INSERT INTO `commodity` VALUES (3, '四级耳机', 1, '惠普', '/img/shiji.png', 0000000003, 5, 47.5, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合.', 1, 3, 1);
INSERT INTO `commodity` VALUES (4, '耳机', 1, '索尼', '/img/suoni.png', 0000000001, 5, 1659, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合.', 3, 3, 1);
INSERT INTO `commodity` VALUES (5, '苹果16手机', 1, '苹果公司', '/img/pg.png', 0000000000, 1, 4888, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 1, 5, 0);
INSERT INTO `commodity` VALUES (6, '联想小新薄笔记本电脑 ', 1, '联想公司', '/img/xiaoxin.png', 0000000000, 4, 4499, NULL, 1, 0, NULL, '高色域学生办公设计师游戏本 八核锐龙R7-5700U 16G内存 512G固态 升级15.6英寸IPS全面屏【DC调光护眼无闪烁】联想小新Air15 2021超轻薄笔记本电脑 ', 1, 5, 1);
INSERT INTO `commodity` VALUES (8, '华为mate60', 1, 'Huawei', '/img/huawei60.png', 0000000001, 1, 4999, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 2, 5, 0);
INSERT INTO `commodity` VALUES (9, '华为PuraX手机', 1, 'Huawei', '/img/puax.png', 0000000000, 1, 7499, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 1, 5, 0);
INSERT INTO `commodity` VALUES (10, '尼泊尔手工本', 1, 'zhangsan', '/img/xc.png', 0000000001, 5, 45, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合.', 1, 4, 1);
INSERT INTO `commodity` VALUES (11, '陶瓷水杯', 1, 'zhangsan', '/img/suibei.png', 0000000001, 5, 26, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合.', 1, 5, 0);
INSERT INTO `commodity` VALUES (12, '罗技鼠标', 1, '罗技', '/img/gpw.png', 0000000005, 5, 799, NULL, 0.9, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合.', 3, 3, 1);
INSERT INTO `commodity` VALUES (13, '华为Mate XT', 1, 'Huawei', '/img/xt.png', 0000000008, 1, 19999, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 0, 5, 0);
INSERT INTO `commodity` VALUES (14, '华为Mate 70', 1, 'Huawei', '/img/mate70.png', 0000000005, 1, 5988, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 3, 5, 0);
INSERT INTO `commodity` VALUES (29, 'RIO', 1, 'zhangsan', '/img/rio.png', 0000000047, 5, 88, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 1, 5, 0);
INSERT INTO `commodity` VALUES (30, '按摩椅', 1, 'zhangsan', '/img/anmo.png', 0000000000, 5, 6988, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 1, 5, 0);
INSERT INTO `commodity` VALUES (31, '护肤品', 1, 'zhangsan', '/img/sk2.png', 0000000000, 5, 1690, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 1, 5, 0);
INSERT INTO `commodity` VALUES (32, '浪琴手表', 1, 'zhangsan', '/img/lq.png', 0000000000, 3, 7362, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 1, 5, 0);
INSERT INTO `commodity` VALUES (33, '劳力士手表', 1, 'zhangsan', '/img/lls.png', 0000000000, 3, 36800, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 1, 5, 0);
INSERT INTO `commodity` VALUES (34, 'ipad Air 11', 1, 'zhangsan', '/img/ipad.png', 0000000000, 1, 4299, NULL, 1, 0, NULL, '商品质量完好，商家信誉保证，大小适中，造型精致，非常适合', 0, 5, 0);

-- ----------------------------
-- Table structure for commodity_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `commodity_evaluation`;
CREATE TABLE `commodity_evaluation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品评价记录的唯一标识，主键，自动递增 ',
  `evaluation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户对商品的评价内容，以文本形式存储用户的评价信息，可为空',
  `commodity_id` int(0) NULL DEFAULT NULL COMMENT '关联 commodity 表的 id，表示该评价对应的商品编号，通过外键约束建立评价与商品的关联 ',
  `score` tinyint(0) NULL DEFAULT NULL COMMENT '0~5星级',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '关联 user 表的 id，表示进行评价的用户编号，通过外键约束建立评价与用户的关联 ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `CommodityEvaluation_commodity_id_fk`(`commodity_id`) USING BTREE,
  INDEX `CommodityEvaluation_user_id_fk`(`user_id`) USING BTREE,
  CONSTRAINT `commodity_evaluation_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_evaluation_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_evaluation
-- ----------------------------
INSERT INTO `commodity_evaluation` VALUES (1, '这是一个测试，这个东西太好了把！', 2, 5, 1);
INSERT INTO `commodity_evaluation` VALUES (2, '这是一个测试，这个东西太好了把！', 2, 5, 1);
INSERT INTO `commodity_evaluation` VALUES (3, '这是一个测试，这个东西太好了把！', 2, 5, 1);
INSERT INTO `commodity_evaluation` VALUES (4, '一般', 2, 2, 1);
INSERT INTO `commodity_evaluation` VALUES (5, '商品有损坏', 2, 2, 1);
INSERT INTO `commodity_evaluation` VALUES (6, '一般', 2, 2, 1);
INSERT INTO `commodity_evaluation` VALUES (7, '一般', 2, 2, 1);
INSERT INTO `commodity_evaluation` VALUES (8, '44', 2, 2, 1);
INSERT INTO `commodity_evaluation` VALUES (9, '44', 2, 2, 1);
INSERT INTO `commodity_evaluation` VALUES (10, '一般', 2, 2, 1);
INSERT INTO `commodity_evaluation` VALUES (11, '一般', 2, 2, 1);
INSERT INTO `commodity_evaluation` VALUES (12, '一般', 2, 2, 1);
INSERT INTO `commodity_evaluation` VALUES (13, '真好', 10, 4, 1);
INSERT INTO `commodity_evaluation` VALUES (14, '一般', 4, 3, 1);
INSERT INTO `commodity_evaluation` VALUES (15, 'nice', 6, 5, 1);
INSERT INTO `commodity_evaluation` VALUES (16, 'nice', 2, 4, 1);
INSERT INTO `commodity_evaluation` VALUES (17, '1', 12, 3, 1);
INSERT INTO `commodity_evaluation` VALUES (18, '一般', 3, 3, 5);

-- ----------------------------
-- Table structure for commodity_photo
-- ----------------------------
DROP TABLE IF EXISTS `commodity_photo`;
CREATE TABLE `commodity_photo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品图片记录的唯一标识，主键，自动递增 ',
  `photo` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片路径，记录商品图片在服务器中的存储路径',
  `commodity_id` int(0) NULL DEFAULT NULL COMMENT '关联 commodity 表的 id，表示该图片对应的商品编号，通过外键约束建立图片与商品的关联 。',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `CommodityPhoto_commodity_id_fk`(`commodity_id`) USING BTREE,
  CONSTRAINT `commodity_photo_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_photo
-- ----------------------------
INSERT INTO `commodity_photo` VALUES (2, '/img/mi.png', 2);
INSERT INTO `commodity_photo` VALUES (3, '/img/shiji.png', 3);
INSERT INTO `commodity_photo` VALUES (4, '/img/suoni.png', 4);
INSERT INTO `commodity_photo` VALUES (5, '/img/pg.png', 5);
INSERT INTO `commodity_photo` VALUES (6, '/img/xiaoxin.png', 6);
INSERT INTO `commodity_photo` VALUES (7, '/img/huawei60.png', 8);
INSERT INTO `commodity_photo` VALUES (8, '/img/puax.png', 9);
INSERT INTO `commodity_photo` VALUES (9, '/img/xt.png', 13);
INSERT INTO `commodity_photo` VALUES (10, '/img/mate70.png', 14);
INSERT INTO `commodity_photo` VALUES (14, '/img/rio.png', 29);
INSERT INTO `commodity_photo` VALUES (15, '/img/anmo.png', 30);
INSERT INTO `commodity_photo` VALUES (16, '/img/sk2.png', 31);
INSERT INTO `commodity_photo` VALUES (17, '/img/lq.png', 32);
INSERT INTO `commodity_photo` VALUES (18, '/img/lls.png', 33);
INSERT INTO `commodity_photo` VALUES (19, '/img/ipad.png', 34);

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品类别的唯一标识，主键，自动递增',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类别名称，必填字段，建立了唯一索引，保证类别名称的唯一性 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `kind_name_uindex`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kind
-- ----------------------------
INSERT INTO `kind` VALUES (5, '其他');
INSERT INTO `kind` VALUES (2, '图书');
INSERT INTO `kind` VALUES (1, '手机');
INSERT INTO `kind` VALUES (3, '手表');
INSERT INTO `kind` VALUES (4, '电脑');

-- ----------------------------
-- Table structure for middle_count
-- ----------------------------
DROP TABLE IF EXISTS `middle_count`;
CREATE TABLE `middle_count`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '中间用户记录的唯一标识，主键，自动递增 ',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '关联 user 表的 id，表示中间用户对应的普通用户编号，通过外键约束建立关联',
  `seller_id` int(0) NULL DEFAULT NULL COMMENT '关联 sell 表的 id，表示中间用户对应的商家编号，通过外键约束建立关联 ',
  `order_id` int(0) NULL DEFAULT NULL COMMENT '关联 orders 表的 id，表示中间用户相关的订单编号，通过外键约束建立关联 ',
  `amount` double NULL DEFAULT NULL COMMENT '可能表示与中间用户相关的交易金额等数值信息，可为空',
  `creat_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录中间用户相关记录的创建时间，默认值为当前时间 ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `middle_count_order_id_fk`(`order_id`) USING BTREE,
  INDEX `middle_count_sell_id_fk`(`seller_id`) USING BTREE,
  INDEX `middle_count_user_id_fk`(`user_id`) USING BTREE,
  CONSTRAINT `middle_count_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `middle_count_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `sell` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `middle_count_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '中间用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of middle_count
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单的唯一标识，主键，自动递增 ',
  `commodity_id` int(0) NULL DEFAULT NULL COMMENT '关联 commodity 表的 id，表示该订单中涉及的商品编号，通过外键约束建立订单与商品的关联 ',
  `quantity` int(0) NULL DEFAULT NULL COMMENT '订单中商品的购买数量，记录用户购买商品的数量 ',
  `amount` double NULL DEFAULT NULL COMMENT '订单总金额，记录该订单的交易金额，可为空',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '关联 user 表的 id，表示下单用户的编号，通过外键约束建立订单与用户的关联',
  `shop_id` int(0) NULL DEFAULT NULL COMMENT '关联 shop 表的 id，表示订单对应的店铺编号，通过外键约束建立订单与店铺的关联',
  `creat_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '订单创建时间，默认值为当前时间 ',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '订单结束时间，记录订单完成或关闭的时间',
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '0:待支付,1:取消支付,2:等待发货,3:运输中,4:已收货,5:退货审核中,6:已退货,7:拒绝退货',
  `can_return` tinyint(0) NULL DEFAULT 0 COMMENT '0:能退货,1:不能退货',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Order_commodity_id_fk`(`commodity_id`) USING BTREE,
  INDEX `Order_shop_id_fk`(`shop_id`) USING BTREE,
  INDEX `Order_user_id_fk`(`user_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 2, 3, 2697.3, 1, 1, '2025-05-01 21:41:46', '2025-05-08 13:16:04', 1, 0);
INSERT INTO `orders` VALUES (2, 2, 3, 2697.3, 1, 1, '2021-05-06 21:58:06', NULL, 3, 1);
INSERT INTO `orders` VALUES (3, 29, 4, 352, 1, 1, '2021-04-06 18:49:33', NULL, 3, 1);
INSERT INTO `orders` VALUES (4, 29, 4, 352, 1, 1, '2021-05-04 23:16:04', '2025-05-08 23:24:54', 8, 0);
INSERT INTO `orders` VALUES (5, 3, 1, 47.5, 1, 1, '2021-05-22 23:18:46', '2025-05-08 13:14:07', 8, 0);
INSERT INTO `orders` VALUES (6, 2, 3, 2397.6, 1, 1, '2021-05-25 19:58:19', NULL, 0, 0);
INSERT INTO `orders` VALUES (7, 29, 4, 352, 1, 1, '2021-05-25 19:58:19', NULL, 0, 0);
INSERT INTO `orders` VALUES (8, 2, 4, 3196.8, 1, 1, '2021-05-30 13:56:39', '2025-05-08 14:03:01', 8, 1);
INSERT INTO `orders` VALUES (9, 3, 1, 47.5, 5, 1, '2021-05-30 14:11:52', NULL, 0, 0);
INSERT INTO `orders` VALUES (10, 2, 1, 799.2, 8, 1, '2025-05-08 17:32:00', '2025-05-08 20:19:41', 1, 0);
INSERT INTO `orders` VALUES (11, 2, 2, 6398.4, 8, 1, '2025-05-08 20:19:35', NULL, 0, 0);
INSERT INTO `orders` VALUES (12, 5, 1, 4888, 8, 1, '2025-05-08 20:19:35', NULL, 0, 0);

-- ----------------------------
-- Table structure for rate
-- ----------------------------
DROP TABLE IF EXISTS `rate`;
CREATE TABLE `rate`  (
  `id` int(0) NOT NULL,
  `rate` double NULL DEFAULT 0 COMMENT '百分比',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rate_level_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rate
-- ----------------------------
INSERT INTO `rate` VALUES (1, 0.001);
INSERT INTO `rate` VALUES (2, 0.002);
INSERT INTO `rate` VALUES (3, 0.005);
INSERT INTO `rate` VALUES (4, 0.0075);
INSERT INTO `rate` VALUES (5, 0.01);

-- ----------------------------
-- Table structure for sell
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` tinyint(0) NULL DEFAULT NULL COMMENT '0:男,1:女',
  `card` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '0:待审核,1:正常,2:审核失败',
  `wallet` double NULL DEFAULT 0,
  `id_card_up` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_card_back` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `license` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` tinyint(0) NULL DEFAULT 5 COMMENT 'level',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sell
-- ----------------------------
INSERT INTO `sell` VALUES (1, 'zhangsan', '18811025387', 0, '1111111111111111', 'abc123', 1, 6449.116, '/img/suoni.png', '/img/ipad.png', '/img/pg.png', 3);

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seller_id` int(0) NULL DEFAULT NULL,
  `score` double NULL DEFAULT 5,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shop_name_uindex`(`name`) USING BTREE,
  INDEX `shop_sell_id_fk`(`seller_id`) USING BTREE,
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sell` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, 'zhangsan', 1, 5);

-- ----------------------------
-- Table structure for shop_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `shop_evaluation`;
CREATE TABLE `shop_evaluation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `evaluation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `shop_id` int(0) NULL DEFAULT NULL,
  `score` tinyint(0) NULL DEFAULT NULL COMMENT '0~5星级',
  `user_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopEvaluation_shop_id_fk`(`shop_id`) USING BTREE,
  INDEX `shopEvaluation_user_id_fk`(`user_id`) USING BTREE,
  CONSTRAINT `shop_evaluation_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop_evaluation_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(0) NULL DEFAULT NULL,
  `quantity` int(0) NULL DEFAULT 1,
  `user_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ShoppingCart_commodity_id_fk`(`commodity_id`) USING BTREE,
  INDEX `ShoppingCart_user_id_fk`(`user_id`) USING BTREE,
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (13, 2, 4, 1);
INSERT INTO `shopping_cart` VALUES (14, 29, 3, 1);
INSERT INTO `shopping_cart` VALUES (15, 3, 1, 1);
INSERT INTO `shopping_cart` VALUES (16, 3, 1, 5);
INSERT INTO `shopping_cart` VALUES (17, 2, 2, 8);
INSERT INTO `shopping_cart` VALUES (18, 5, 1, 8);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '普通用户的唯一标识，主键，自动递增',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名，必填字段',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户联系电话，记录用户的联系号码，可为空 ',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电子邮箱，记录用户的邮箱地址，建立了唯一索引，保证邮箱的唯一性',
  `city` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户所在城市',
  `sex` tinyint(0) NULL DEFAULT NULL COMMENT '0:男,1:女',
  `card` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(0) NULL DEFAULT 0 COMMENT '0:待审核,1:正常,2:审核失败',
  `wallet` double NULL DEFAULT 0,
  `points` double NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `User_email_uindex`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '普通用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'lishi', '18811025387', '1637011263@qq.com', '上海', 0, '1111111111111111', 'wjz', 1, 71.5, 6246.1);
INSERT INTO `user` VALUES (3, 'wangwu', '18811025387', '1637051263@qq.com', '南京', 0, '1547896325416852', 'wjz', 3, 200, 0);
INSERT INTO `user` VALUES (5, 'mazhi', '18811025387', '1637011245@qq.com', '深圳', 0, '1547896325416852', 'wjz', 1, 0, 0);
INSERT INTO `user` VALUES (8, 'baskly', '17516279765', '3050681193@qq.com', '北京', 0, '1547896325416852', 'abc123', 1, 500, 0);

SET FOREIGN_KEY_CHECKS = 1;
