SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '图书管理员', '123456');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '114', '123', 123.00);
INSERT INTO `book` VALUES (2, '113', '123', 123.00);
INSERT INTO `book` VALUES (3, '12', '123', 123.00);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLate utf8_general_ci NOT NULL,
  `sex` enum('男','女') CHARACTER SET utf8 COLLate utf8_general_ci NOT NULL DEFAULT '男',
  `grade` int NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET utf8 COLLate utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '小明', '男', 22);
INSERT INTO `student` VALUES (2, '小红', '女', 21);

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` int NULL DEFAULT NULL,
  `bid` int NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_sid_bid`(`sid` ASC, `bid` ASC) USING BTREE,
  FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (2, 2, 2, '2024-04-19 01:11:27');
INSERT INTO `borrow` VALUES (3, 1, 1, '2024-04-19 01:29:31');

-- ----------------------------
-- Triggers structure for table book
-- ----------------------------
DROP TRIGGER IF EXISTS `del_book`;
delimiter ;;
CREATE TRIGGER `del_book` BEFORE DELETE ON `book` FOR EACH ROW BEGIN
  DELETE FROM borrow WHERE bid = old.bid;
END;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `del`;
delimiter ;;
CREATE TRIGGER `del` BEFORE DELETE ON `student` FOR EACH ROW BEGIN
  DELETE FROM borrow WHERE sid = old.sid;
END;
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
