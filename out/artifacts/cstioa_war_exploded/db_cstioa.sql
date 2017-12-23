/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50628
 Source Host           : localhost:3306
 Source Schema         : db_cstioa

 Target Server Type    : MySQL
 Target Server Version : 50628
 File Encoding         : 65001

 Date: 02/12/2017 18:14:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'ACM');
INSERT INTO `groups` VALUES (2, 'ARM');
INSERT INTO `groups` VALUES (3, 'IGM');
INSERT INTO `groups` VALUES (4, 'NS');
INSERT INTO `groups` VALUES (5, 'UI');
INSERT INTO `groups` VALUES (6, 'WEB');

-- ----------------------------
-- Table structure for signin
-- ----------------------------
DROP TABLE IF EXISTS `signin`;
CREATE TABLE `signin`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `userid` int(12) NULL DEFAULT NULL,
  `time` timestamp(0) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ua` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of signin
-- ----------------------------
INSERT INTO `signin` VALUES (1, 1, '2017-11-30 21:21:54', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (2, 1, '2017-11-30 21:25:08', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (3, 1, '2017-12-01 10:06:39', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (4, 1, '2017-12-01 10:06:55', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (5, 1, '2017-12-01 10:06:56', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (6, 1, '2017-12-01 12:03:33', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (7, 1, '2017-12-01 12:04:09', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (8, 1, '2017-12-01 12:28:03', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (9, 1, '2017-12-01 12:54:24', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (10, 1, '2017-12-01 14:29:12', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (11, 1, '2017-12-01 14:29:40', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (12, 1, '2017-12-01 14:29:42', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (13, 1, '2017-12-01 14:29:48', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (14, 1, '2017-12-01 14:33:52', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (15, 1, '2017-12-02 12:12:42', '192.168.16.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3236.0 Safari/537.36');
INSERT INTO `signin` VALUES (16, 1, '2017-12-02 18:10:51', '192.168.123.162', 'Mozilla/5.0 (Linux; U; Android 7.1.1; en-us; MI 6 Build/NMF26X) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.146 Mobile Safari/537.36 XiaoMi/MiuiBrowser/9.3.8');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_number` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupid` int(11) NULL DEFAULT NULL,
  `issignintoday` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 20166671, '张靖宇', 'CZHjy0521', 6, 1);

SET FOREIGN_KEY_CHECKS = 1;
