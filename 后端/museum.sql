/*
 Navicat Premium Data Transfer

 Source Server         : aaaa
 Source Server Type    : MySQL
 Source Server Version : 80044
 Source Host           : localhost:3306
 Source Schema         : museum

 Target Server Type    : MySQL
 Target Server Version : 80044
 File Encoding         : 65001

 Date: 24/04/2026 15:37:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access_log
-- ----------------------------
DROP TABLE IF EXISTS `access_log`;
CREATE TABLE `access_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `person_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `person_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `access_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `granted` tinyint(1) NULL DEFAULT NULL,
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 298 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of access_log
-- ----------------------------
INSERT INTO `access_log` VALUES (1, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 14:53:44', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (2, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 14:54:03', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (3, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 15:33:32', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (4, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 17:14:43', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (5, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 17:14:46', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (6, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 17:14:47', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (7, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 17:17:03', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (8, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-16 17:53:20', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (9, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-16 17:58:56', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (10, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-16 17:59:28', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (11, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-16 18:00:23', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (12, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:00:33', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (13, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-16 18:00:35', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (14, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-16 18:09:42', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (15, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:21:41', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (16, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:21:42', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (17, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:21:45', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (18, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:21:47', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (19, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:21:50', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (20, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:21:56', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (21, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:21:59', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (22, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:22:01', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (23, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:22:05', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (24, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:22:06', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (25, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:22:08', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (26, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:22:09', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (27, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:22:10', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (28, 'Unknown', 'Unknown', 'Unknown', '2026-04-16 18:22:21', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (29, 'f433fac45bcb4976bee189d2ed5b5d45', 'jjj', 'staff', '2026-04-16 18:22:23', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (30, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 09:17:09', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (31, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 09:54:38', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (32, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 09:54:41', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (33, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 10:00:33', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (34, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 10:03:04', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (35, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:20:17', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (36, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:20:19', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (37, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 10:20:21', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (38, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:28:33', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (39, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 10:28:37', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (40, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:29:17', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (41, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 10:29:19', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (42, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:31:40', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (43, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:31:41', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (44, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:31:42', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (45, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 10:31:46', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (46, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 10:32:03', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (47, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 10:36:23', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (48, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:40:37', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (49, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:40:39', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (50, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 10:40:42', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (51, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 10:42:13', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (52, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:43:07', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (53, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 10:43:09', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (54, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 10:52:22', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (55, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 10:52:24', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (56, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 11:03:43', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (57, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 11:10:55', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (58, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 11:13:39', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (59, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 13:58:57', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (60, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 14:13:31', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (61, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 14:19:19', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (62, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 14:26:25', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (63, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 14:38:58', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (64, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 14:45:38', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (65, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 15:10:15', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (66, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 15:10:16', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (67, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 15:17:23', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (68, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 15:17:25', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (69, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 15:19:17', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (70, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 15:19:19', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (71, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 15:22:57', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (72, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 15:28:49', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (73, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 15:35:47', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (74, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 15:35:49', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (75, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 15:35:51', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (76, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 15:47:45', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (77, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 15:48:53', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (78, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 17:13:41', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (79, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 17:22:06', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (80, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 17:22:08', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (81, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 17:22:10', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (82, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 17:22:11', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (83, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 17:22:17', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (84, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 17:29:11', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (85, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 17:29:13', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (86, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-17 17:44:44', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (87, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 17:53:26', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (88, 'Unknown', 'Unknown', 'Unknown', '2026-04-17 17:53:27', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (89, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-17 17:53:28', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (90, 'Unknown', 'Unknown', 'Unknown', '2026-04-20 09:12:44', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (91, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-20 09:12:46', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (92, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-20 09:20:25', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (93, 'Unknown', 'Unknown', 'Unknown', '2026-04-20 09:25:42', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (94, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-20 09:25:47', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (95, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-20 09:26:03', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (96, 'Unknown', 'Unknown', 'Unknown', '2026-04-20 10:07:57', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (97, 'Unknown', 'Unknown', 'Unknown', '2026-04-20 10:07:58', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (98, 'Unknown', 'Unknown', 'Unknown', '2026-04-20 10:08:02', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (99, 'Unknown', 'Unknown', 'Unknown', '2026-04-20 10:08:03', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (100, 'Unknown', 'Unknown', 'Unknown', '2026-04-20 10:08:04', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (101, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-20 10:08:08', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (102, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-20 10:15:12', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (103, 'Unknown', 'Unknown', 'Unknown', '2026-04-20 10:54:06', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (104, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-20 10:54:08', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (105, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:57:38', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (106, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:57:41', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (107, 'cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '2026-04-21 10:57:42', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (108, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-21 10:58:51', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (109, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:58:53', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (110, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:58:56', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (111, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:58:58', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (112, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:59:01', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (113, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:59:03', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (114, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:59:06', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (115, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:59:08', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (116, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:59:11', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (117, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 10:59:13', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (118, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-21 11:33:24', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (119, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-21 11:36:04', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (120, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 14:28:49', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (121, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 14:28:51', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (122, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-21 14:28:52', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (123, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-21 15:12:46', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (124, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-21 15:13:45', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (125, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-21 16:28:55', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (126, 'Unknown', 'Unknown', 'Unknown', '2026-04-21 17:07:33', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (127, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-21 17:07:34', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (128, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:04', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (129, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:05', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (130, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:06', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (131, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:07', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (132, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:08', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (133, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:10', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (134, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:25', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (135, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:26', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (136, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:27', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (137, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:29', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (138, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 10:39:29', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (139, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 10:39:40', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (140, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 10:53:27', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (141, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 14:33:21', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (142, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 14:37:37', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (143, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 14:51:21', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (144, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 14:58:44', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (145, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 14:58:46', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (146, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 14:59:04', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (147, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 14:59:06', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (148, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 15:01:21', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (149, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-22 15:03:48', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (150, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 15:04:15', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (151, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 15:04:17', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (152, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 15:04:20', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (153, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 15:04:23', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (154, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 15:04:25', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (155, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-22 15:18:18', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (156, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-22 15:20:51', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (157, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-22 15:24:19', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (158, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 15:28:19', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (159, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 15:32:51', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (160, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 15:59:32', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (161, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 15:59:34', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (162, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 15:59:51', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (163, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 15:59:56', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (164, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 15:59:59', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (165, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 16:00:01', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (166, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 16:00:04', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (167, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 16:01:03', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (168, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 16:08:40', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (169, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 16:29:04', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (170, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 17:27:01', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (171, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:29:03', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (172, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:46:53', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (173, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:46:55', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (174, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:46:58', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (175, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:00', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (176, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:03', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (177, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:05', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (178, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:08', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (179, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:10', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (180, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:13', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (181, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:28', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (182, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:30', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (183, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:33', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (184, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:35', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (185, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:38', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (186, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:40', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (187, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:43', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (188, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:45', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (189, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:48', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (190, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:50', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (191, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:54', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (192, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:47:55', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (193, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 17:47:57', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (194, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:05', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (195, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:07', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (196, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:10', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (197, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:12', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (198, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:20', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (199, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:22', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (200, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:25', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (201, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:27', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (202, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:30', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (203, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:32', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (204, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 17:48:35', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (205, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:37', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (206, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 17:48:40', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (207, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:42', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (208, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:45', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (209, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:47', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (210, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:50', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (211, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:52', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (212, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:55', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (213, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:48:57', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (214, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:00', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (215, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:02', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (216, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:05', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (217, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:07', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (218, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 17:49:09', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (219, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 17:49:10', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (220, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:12', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (221, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:15', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (222, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:17', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (223, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:20', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (224, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:22', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (225, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:26', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (226, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:31', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (227, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:36', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (228, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:41', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (229, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:46', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (230, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 17:49:48', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (231, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:51', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (232, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:49:56', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (233, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:01', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (234, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:06', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (235, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:11', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (236, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:16', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (237, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:21', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (238, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:26', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (239, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:31', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (240, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:36', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (241, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:41', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (242, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:46', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (243, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:51', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (244, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:50:56', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (245, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:51:01', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (246, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:51:06', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (247, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:51:11', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (248, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:51:16', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (249, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:51:21', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (250, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:51:25', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (251, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 17:51:27', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (252, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 17:51:32', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (253, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 18:00:02', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (254, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 18:00:04', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (255, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 18:03:20', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (256, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 18:14:13', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (257, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 18:18:42', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (258, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 18:18:44', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (259, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 18:18:49', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (260, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 18:19:22', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (261, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-22 18:22:47', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (262, '153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '2026-04-22 18:47:35', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (263, '153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '2026-04-22 18:48:21', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (264, '153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '2026-04-22 18:49:19', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (265, '153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '2026-04-22 19:01:16', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (266, '153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '2026-04-22 19:04:51', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (267, '153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '2026-04-22 19:10:03', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (268, '153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '2026-04-22 19:15:22', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (269, '153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '2026-04-22 19:48:00', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (270, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 19:48:37', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (271, '153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '2026-04-22 19:48:39', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (272, 'Unknown', 'Unknown', 'Unknown', '2026-04-22 19:48:42', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (273, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-23 09:11:18', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (274, 'Unknown', 'Unknown', 'Unknown', '2026-04-23 09:19:45', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (275, 'Unknown', 'Unknown', 'Unknown', '2026-04-23 09:19:46', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (276, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-23 09:19:49', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (277, 'Unknown', 'Unknown', 'Unknown', '2026-04-23 09:20:19', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (278, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-23 09:20:21', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (279, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-23 09:20:54', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (280, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-23 10:09:14', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (281, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-23 10:39:35', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (282, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-23 10:39:45', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (283, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-23 10:54:11', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (284, '34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '2026-04-23 11:04:37', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (285, 'Unknown', 'Unknown', 'Unknown', '2026-04-23 11:17:47', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (286, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-23 11:17:49', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (287, '701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '2026-04-23 11:24:08', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (288, '153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '2026-04-23 11:24:19', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (289, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:41:21', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (290, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:41:23', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (291, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:41:23', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (292, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:41:24', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (293, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:41:27', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (294, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:42:11', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (295, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:42:12', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (296, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:42:12', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (297, 'b523e0f00a394c1e9fbc4b27db03c4af', 'llll', 'admin', '2026-04-24 09:42:17', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (298, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:15', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (299, 'b523e0f00a394c1e9fbc4b27db03c4af', 'llll', 'admin', '2026-04-24 09:43:16', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (300, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:30', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (301, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:30', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (302, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:31', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (303, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:31', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (304, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:32', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (305, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:32', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (306, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:33', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (307, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:33', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (308, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:34', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (309, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:34', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (310, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:35', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (311, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:35', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (312, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:36', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (313, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:36', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (314, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:37', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (315, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:37', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (316, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:38', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (317, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:38', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (318, 'b523e0f00a394c1e9fbc4b27db03c4af', 'llll', 'admin', '2026-04-24 09:43:39', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (319, 'b523e0f00a394c1e9fbc4b27db03c4af', 'llll', 'admin', '2026-04-24 09:43:39', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (320, 'b523e0f00a394c1e9fbc4b27db03c4af', 'llll', 'admin', '2026-04-24 09:43:40', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (321, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:40', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (322, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:41', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (323, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:41', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (324, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:42', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (325, 'b523e0f00a394c1e9fbc4b27db03c4af', 'llll', 'admin', '2026-04-24 09:43:42', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (326, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:43', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (327, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:43:43', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (328, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:44:44', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (329, 'b523e0f00a394c1e9fbc4b27db03c4af', 'llll', 'admin', '2026-04-24 09:44:45', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (330, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:48:39', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (331, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:48:41', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (332, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:50:03', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (333, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:50:04', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (334, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:50:04', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (335, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:50:05', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (336, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:50:51', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (337, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:50:52', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (338, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:51:07', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (339, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:51:08', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (340, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:51:09', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (341, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:51:09', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (342, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:51:10', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (343, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:51:10', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (344, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:52:33', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (345, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:52:34', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (346, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:52:34', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (347, 'b523e0f00a394c1e9fbc4b27db03c4af', 'llll', 'admin', '2026-04-24 09:52:35', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (348, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:15', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (349, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:54:15', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (350, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:54:20', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (351, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:21', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (352, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:21', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (353, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:23', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (354, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:23', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (355, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:24', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (356, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:24', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (357, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:25', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (358, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:26', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (359, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 09:54:26', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (360, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:27', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (361, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 09:54:27', 0, 'Auth_Terminal', '活体检测失败');
INSERT INTO `access_log` VALUES (362, 'Unknown', 'Unknown', 'Unknown', '2026-04-24 10:01:57', 0, 'Auth_Terminal', '查无此人');
INSERT INTO `access_log` VALUES (363, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 10:01:58', 1, 'Auth_Terminal', '身份核验通过');
INSERT INTO `access_log` VALUES (364, '8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '2026-04-24 11:12:24', 1, 'Auth_Terminal', '身份核验通过');

-- ----------------------------
-- Table structure for alarm_record
-- ----------------------------
DROP TABLE IF EXISTS `alarm_record`;
CREATE TABLE `alarm_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `confirmed` tinyint(1) NULL DEFAULT 0,
  `handled` tinyint NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 501 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alarm_record
-- ----------------------------
INSERT INTO `alarm_record` VALUES (220, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 18:18:50', NULL);
INSERT INTO `alarm_record` VALUES (221, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 18:18:53', NULL);
INSERT INTO `alarm_record` VALUES (222, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 18:18:54', NULL);
INSERT INTO `alarm_record` VALUES (223, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 18:18:54', NULL);
INSERT INTO `alarm_record` VALUES (224, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 18:18:57', NULL);
INSERT INTO `alarm_record` VALUES (225, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 18:19:02', NULL);
INSERT INTO `alarm_record` VALUES (226, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 18:19:04', NULL);
INSERT INTO `alarm_record` VALUES (227, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 18:19:07', NULL);
INSERT INTO `alarm_record` VALUES (228, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 18:19:09', NULL);
INSERT INTO `alarm_record` VALUES (229, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 18:19:10', NULL);
INSERT INTO `alarm_record` VALUES (230, 'AI_CAM_01', 'critical', '🔥 [火灾告警] 监控区域发现疑似明火！', 0, 0, '2026-04-22 19:48:43', NULL);
INSERT INTO `alarm_record` VALUES (231, 'AI_CAM_01', 'warning', '💨 [烟雾预警] 监控区域发现异常烟雾，请派人排查！', 0, 0, '2026-04-22 19:48:48', NULL);
INSERT INTO `alarm_record` VALUES (232, 'AI_CAM_01', 'critical', '🔥 [火灾告警] 监控区域发现疑似明火！', 0, 0, '2026-04-22 19:48:49', NULL);
INSERT INTO `alarm_record` VALUES (233, 'AI_CAM_01', 'critical', '🔥 [火灾告警] 监控区域发现疑似明火！', 0, 0, '2026-04-22 19:48:50', NULL);
INSERT INTO `alarm_record` VALUES (234, 'AI_CAM_01', 'critical', '🔥 [火灾告警] 监控区域发现疑似明火！', 0, 0, '2026-04-22 19:48:50', NULL);
INSERT INTO `alarm_record` VALUES (235, 'AI_CAM_01', 'critical', '🔥 [火灾告警] 监控区域发现疑似明火！', 0, 0, '2026-04-22 19:48:51', NULL);
INSERT INTO `alarm_record` VALUES (236, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:01', NULL);
INSERT INTO `alarm_record` VALUES (237, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:01', NULL);
INSERT INTO `alarm_record` VALUES (238, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:02', NULL);
INSERT INTO `alarm_record` VALUES (239, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:02', NULL);
INSERT INTO `alarm_record` VALUES (240, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:03', NULL);
INSERT INTO `alarm_record` VALUES (241, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:03', NULL);
INSERT INTO `alarm_record` VALUES (242, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:04', NULL);
INSERT INTO `alarm_record` VALUES (243, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:04', NULL);
INSERT INTO `alarm_record` VALUES (244, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:05', NULL);
INSERT INTO `alarm_record` VALUES (245, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:05', NULL);
INSERT INTO `alarm_record` VALUES (246, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:06', NULL);
INSERT INTO `alarm_record` VALUES (247, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:06', NULL);
INSERT INTO `alarm_record` VALUES (248, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:07', NULL);
INSERT INTO `alarm_record` VALUES (249, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:07', NULL);
INSERT INTO `alarm_record` VALUES (250, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:08', NULL);
INSERT INTO `alarm_record` VALUES (251, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:08', NULL);
INSERT INTO `alarm_record` VALUES (252, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:09', NULL);
INSERT INTO `alarm_record` VALUES (253, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:09', NULL);
INSERT INTO `alarm_record` VALUES (254, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:10', NULL);
INSERT INTO `alarm_record` VALUES (255, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:10', NULL);
INSERT INTO `alarm_record` VALUES (256, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:11', NULL);
INSERT INTO `alarm_record` VALUES (257, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:11', NULL);
INSERT INTO `alarm_record` VALUES (258, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:12', NULL);
INSERT INTO `alarm_record` VALUES (259, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:12', NULL);
INSERT INTO `alarm_record` VALUES (260, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:13', NULL);
INSERT INTO `alarm_record` VALUES (261, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:13', NULL);
INSERT INTO `alarm_record` VALUES (262, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:14', NULL);
INSERT INTO `alarm_record` VALUES (263, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:14', NULL);
INSERT INTO `alarm_record` VALUES (264, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:15', NULL);
INSERT INTO `alarm_record` VALUES (265, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:15', NULL);
INSERT INTO `alarm_record` VALUES (266, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:16', NULL);
INSERT INTO `alarm_record` VALUES (267, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:16', NULL);
INSERT INTO `alarm_record` VALUES (268, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:17', NULL);
INSERT INTO `alarm_record` VALUES (269, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:17', NULL);
INSERT INTO `alarm_record` VALUES (270, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:18', NULL);
INSERT INTO `alarm_record` VALUES (271, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:18', NULL);
INSERT INTO `alarm_record` VALUES (272, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:19', NULL);
INSERT INTO `alarm_record` VALUES (273, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:19', NULL);
INSERT INTO `alarm_record` VALUES (274, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:20', NULL);
INSERT INTO `alarm_record` VALUES (275, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:20', NULL);
INSERT INTO `alarm_record` VALUES (276, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:21', NULL);
INSERT INTO `alarm_record` VALUES (277, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:21', NULL);
INSERT INTO `alarm_record` VALUES (278, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:22', NULL);
INSERT INTO `alarm_record` VALUES (279, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:22', NULL);
INSERT INTO `alarm_record` VALUES (280, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:23', NULL);
INSERT INTO `alarm_record` VALUES (281, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:23', NULL);
INSERT INTO `alarm_record` VALUES (282, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:25', NULL);
INSERT INTO `alarm_record` VALUES (283, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:25', NULL);
INSERT INTO `alarm_record` VALUES (284, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:27', NULL);
INSERT INTO `alarm_record` VALUES (285, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:29', NULL);
INSERT INTO `alarm_record` VALUES (286, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:29', NULL);
INSERT INTO `alarm_record` VALUES (287, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:30', NULL);
INSERT INTO `alarm_record` VALUES (288, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:30', NULL);
INSERT INTO `alarm_record` VALUES (289, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:31', NULL);
INSERT INTO `alarm_record` VALUES (290, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:31', NULL);
INSERT INTO `alarm_record` VALUES (291, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:32', NULL);
INSERT INTO `alarm_record` VALUES (292, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:33', NULL);
INSERT INTO `alarm_record` VALUES (293, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:33', NULL);
INSERT INTO `alarm_record` VALUES (294, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:34', NULL);
INSERT INTO `alarm_record` VALUES (295, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:34', NULL);
INSERT INTO `alarm_record` VALUES (296, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:35', NULL);
INSERT INTO `alarm_record` VALUES (297, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:35', NULL);
INSERT INTO `alarm_record` VALUES (298, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:36', NULL);
INSERT INTO `alarm_record` VALUES (299, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:36', NULL);
INSERT INTO `alarm_record` VALUES (300, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:37', NULL);
INSERT INTO `alarm_record` VALUES (301, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:37', NULL);
INSERT INTO `alarm_record` VALUES (302, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:38', NULL);
INSERT INTO `alarm_record` VALUES (303, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:38', NULL);
INSERT INTO `alarm_record` VALUES (304, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:39', NULL);
INSERT INTO `alarm_record` VALUES (305, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:39', NULL);
INSERT INTO `alarm_record` VALUES (306, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:40', NULL);
INSERT INTO `alarm_record` VALUES (307, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:41', NULL);
INSERT INTO `alarm_record` VALUES (308, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:41', NULL);
INSERT INTO `alarm_record` VALUES (309, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:42', NULL);
INSERT INTO `alarm_record` VALUES (310, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:43', NULL);
INSERT INTO `alarm_record` VALUES (311, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:43', NULL);
INSERT INTO `alarm_record` VALUES (312, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:44', NULL);
INSERT INTO `alarm_record` VALUES (313, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:44', NULL);
INSERT INTO `alarm_record` VALUES (314, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:45', NULL);
INSERT INTO `alarm_record` VALUES (315, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:45', NULL);
INSERT INTO `alarm_record` VALUES (316, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:46', NULL);
INSERT INTO `alarm_record` VALUES (317, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:46', NULL);
INSERT INTO `alarm_record` VALUES (318, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:47', NULL);
INSERT INTO `alarm_record` VALUES (319, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:47', NULL);
INSERT INTO `alarm_record` VALUES (320, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:48', NULL);
INSERT INTO `alarm_record` VALUES (321, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:48', NULL);
INSERT INTO `alarm_record` VALUES (322, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:49', NULL);
INSERT INTO `alarm_record` VALUES (323, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:50', NULL);
INSERT INTO `alarm_record` VALUES (324, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:50', NULL);
INSERT INTO `alarm_record` VALUES (325, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:51', NULL);
INSERT INTO `alarm_record` VALUES (326, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:51', NULL);
INSERT INTO `alarm_record` VALUES (327, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:52', NULL);
INSERT INTO `alarm_record` VALUES (328, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:52', NULL);
INSERT INTO `alarm_record` VALUES (329, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:53', NULL);
INSERT INTO `alarm_record` VALUES (330, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:54', NULL);
INSERT INTO `alarm_record` VALUES (331, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:54', NULL);
INSERT INTO `alarm_record` VALUES (332, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:55', NULL);
INSERT INTO `alarm_record` VALUES (333, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:49:55', NULL);
INSERT INTO `alarm_record` VALUES (334, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:56', NULL);
INSERT INTO `alarm_record` VALUES (335, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:56', NULL);
INSERT INTO `alarm_record` VALUES (336, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:57', NULL);
INSERT INTO `alarm_record` VALUES (337, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:57', NULL);
INSERT INTO `alarm_record` VALUES (338, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:58', NULL);
INSERT INTO `alarm_record` VALUES (339, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:58', NULL);
INSERT INTO `alarm_record` VALUES (340, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:49:59', NULL);
INSERT INTO `alarm_record` VALUES (341, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:00', NULL);
INSERT INTO `alarm_record` VALUES (342, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:00', NULL);
INSERT INTO `alarm_record` VALUES (343, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:01', NULL);
INSERT INTO `alarm_record` VALUES (344, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:01', NULL);
INSERT INTO `alarm_record` VALUES (345, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:02', NULL);
INSERT INTO `alarm_record` VALUES (346, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:02', NULL);
INSERT INTO `alarm_record` VALUES (347, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:03', NULL);
INSERT INTO `alarm_record` VALUES (348, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:03', NULL);
INSERT INTO `alarm_record` VALUES (349, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:04', NULL);
INSERT INTO `alarm_record` VALUES (350, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:04', NULL);
INSERT INTO `alarm_record` VALUES (351, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:05', NULL);
INSERT INTO `alarm_record` VALUES (352, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:05', NULL);
INSERT INTO `alarm_record` VALUES (353, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:06', NULL);
INSERT INTO `alarm_record` VALUES (354, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:06', NULL);
INSERT INTO `alarm_record` VALUES (355, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:07', NULL);
INSERT INTO `alarm_record` VALUES (356, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:07', NULL);
INSERT INTO `alarm_record` VALUES (357, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:08', NULL);
INSERT INTO `alarm_record` VALUES (358, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:08', NULL);
INSERT INTO `alarm_record` VALUES (359, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:09', NULL);
INSERT INTO `alarm_record` VALUES (360, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:09', NULL);
INSERT INTO `alarm_record` VALUES (361, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:10', NULL);
INSERT INTO `alarm_record` VALUES (362, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:10', NULL);
INSERT INTO `alarm_record` VALUES (363, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:11', NULL);
INSERT INTO `alarm_record` VALUES (364, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:11', NULL);
INSERT INTO `alarm_record` VALUES (365, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:12', NULL);
INSERT INTO `alarm_record` VALUES (366, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:12', NULL);
INSERT INTO `alarm_record` VALUES (367, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:13', NULL);
INSERT INTO `alarm_record` VALUES (368, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:13', NULL);
INSERT INTO `alarm_record` VALUES (369, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:14', NULL);
INSERT INTO `alarm_record` VALUES (370, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:14', NULL);
INSERT INTO `alarm_record` VALUES (371, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:15', NULL);
INSERT INTO `alarm_record` VALUES (372, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:15', NULL);
INSERT INTO `alarm_record` VALUES (373, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:16', NULL);
INSERT INTO `alarm_record` VALUES (374, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:16', NULL);
INSERT INTO `alarm_record` VALUES (375, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:17', NULL);
INSERT INTO `alarm_record` VALUES (376, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:17', NULL);
INSERT INTO `alarm_record` VALUES (377, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:18', NULL);
INSERT INTO `alarm_record` VALUES (378, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:18', NULL);
INSERT INTO `alarm_record` VALUES (379, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:19', NULL);
INSERT INTO `alarm_record` VALUES (380, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:19', NULL);
INSERT INTO `alarm_record` VALUES (381, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:20', NULL);
INSERT INTO `alarm_record` VALUES (382, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:20', NULL);
INSERT INTO `alarm_record` VALUES (383, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:21', NULL);
INSERT INTO `alarm_record` VALUES (384, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:21', NULL);
INSERT INTO `alarm_record` VALUES (385, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:22', NULL);
INSERT INTO `alarm_record` VALUES (386, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:22', NULL);
INSERT INTO `alarm_record` VALUES (387, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:23', NULL);
INSERT INTO `alarm_record` VALUES (388, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:23', NULL);
INSERT INTO `alarm_record` VALUES (389, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:24', NULL);
INSERT INTO `alarm_record` VALUES (390, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:24', NULL);
INSERT INTO `alarm_record` VALUES (391, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:25', NULL);
INSERT INTO `alarm_record` VALUES (392, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:25', NULL);
INSERT INTO `alarm_record` VALUES (393, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:26', NULL);
INSERT INTO `alarm_record` VALUES (394, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:26', NULL);
INSERT INTO `alarm_record` VALUES (395, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:27', NULL);
INSERT INTO `alarm_record` VALUES (396, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:27', NULL);
INSERT INTO `alarm_record` VALUES (397, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:28', NULL);
INSERT INTO `alarm_record` VALUES (398, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:28', NULL);
INSERT INTO `alarm_record` VALUES (399, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:29', NULL);
INSERT INTO `alarm_record` VALUES (400, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:29', NULL);
INSERT INTO `alarm_record` VALUES (401, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:30', NULL);
INSERT INTO `alarm_record` VALUES (402, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:30', NULL);
INSERT INTO `alarm_record` VALUES (403, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:31', NULL);
INSERT INTO `alarm_record` VALUES (404, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:31', NULL);
INSERT INTO `alarm_record` VALUES (405, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:32', NULL);
INSERT INTO `alarm_record` VALUES (406, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:32', NULL);
INSERT INTO `alarm_record` VALUES (407, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:33', NULL);
INSERT INTO `alarm_record` VALUES (408, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:33', NULL);
INSERT INTO `alarm_record` VALUES (409, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:34', NULL);
INSERT INTO `alarm_record` VALUES (410, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:34', NULL);
INSERT INTO `alarm_record` VALUES (411, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:35', NULL);
INSERT INTO `alarm_record` VALUES (412, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:35', NULL);
INSERT INTO `alarm_record` VALUES (413, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:36', NULL);
INSERT INTO `alarm_record` VALUES (414, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:36', NULL);
INSERT INTO `alarm_record` VALUES (415, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:37', NULL);
INSERT INTO `alarm_record` VALUES (416, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:37', NULL);
INSERT INTO `alarm_record` VALUES (417, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:38', NULL);
INSERT INTO `alarm_record` VALUES (418, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:38', NULL);
INSERT INTO `alarm_record` VALUES (419, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:39', NULL);
INSERT INTO `alarm_record` VALUES (420, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:39', NULL);
INSERT INTO `alarm_record` VALUES (421, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:40', NULL);
INSERT INTO `alarm_record` VALUES (422, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:40', NULL);
INSERT INTO `alarm_record` VALUES (423, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:41', NULL);
INSERT INTO `alarm_record` VALUES (424, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:41', NULL);
INSERT INTO `alarm_record` VALUES (425, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:42', NULL);
INSERT INTO `alarm_record` VALUES (426, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:42', NULL);
INSERT INTO `alarm_record` VALUES (427, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:43', NULL);
INSERT INTO `alarm_record` VALUES (428, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:43', NULL);
INSERT INTO `alarm_record` VALUES (429, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:44', NULL);
INSERT INTO `alarm_record` VALUES (430, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:44', NULL);
INSERT INTO `alarm_record` VALUES (431, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:45', NULL);
INSERT INTO `alarm_record` VALUES (432, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:45', NULL);
INSERT INTO `alarm_record` VALUES (433, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:46', NULL);
INSERT INTO `alarm_record` VALUES (434, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:46', NULL);
INSERT INTO `alarm_record` VALUES (435, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:47', NULL);
INSERT INTO `alarm_record` VALUES (436, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:47', NULL);
INSERT INTO `alarm_record` VALUES (437, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:48', NULL);
INSERT INTO `alarm_record` VALUES (438, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:48', NULL);
INSERT INTO `alarm_record` VALUES (439, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:49', NULL);
INSERT INTO `alarm_record` VALUES (440, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:49', NULL);
INSERT INTO `alarm_record` VALUES (441, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:50', NULL);
INSERT INTO `alarm_record` VALUES (442, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:50', NULL);
INSERT INTO `alarm_record` VALUES (443, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:51', NULL);
INSERT INTO `alarm_record` VALUES (444, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:51', NULL);
INSERT INTO `alarm_record` VALUES (445, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:52', NULL);
INSERT INTO `alarm_record` VALUES (446, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:52', NULL);
INSERT INTO `alarm_record` VALUES (447, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:53', NULL);
INSERT INTO `alarm_record` VALUES (448, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:53', NULL);
INSERT INTO `alarm_record` VALUES (449, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:54', NULL);
INSERT INTO `alarm_record` VALUES (450, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:54', NULL);
INSERT INTO `alarm_record` VALUES (451, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:55', NULL);
INSERT INTO `alarm_record` VALUES (452, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:55', NULL);
INSERT INTO `alarm_record` VALUES (453, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:56', NULL);
INSERT INTO `alarm_record` VALUES (454, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:56', NULL);
INSERT INTO `alarm_record` VALUES (455, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:50:57', NULL);
INSERT INTO `alarm_record` VALUES (456, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:57', NULL);
INSERT INTO `alarm_record` VALUES (457, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:58', NULL);
INSERT INTO `alarm_record` VALUES (458, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:58', NULL);
INSERT INTO `alarm_record` VALUES (459, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:50:59', NULL);
INSERT INTO `alarm_record` VALUES (460, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:50:59', NULL);
INSERT INTO `alarm_record` VALUES (461, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:00', NULL);
INSERT INTO `alarm_record` VALUES (462, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:51:00', NULL);
INSERT INTO `alarm_record` VALUES (463, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:01', NULL);
INSERT INTO `alarm_record` VALUES (464, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:01', NULL);
INSERT INTO `alarm_record` VALUES (465, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:02', NULL);
INSERT INTO `alarm_record` VALUES (466, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:02', NULL);
INSERT INTO `alarm_record` VALUES (467, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:03', NULL);
INSERT INTO `alarm_record` VALUES (468, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:03', NULL);
INSERT INTO `alarm_record` VALUES (469, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:04', NULL);
INSERT INTO `alarm_record` VALUES (470, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:06', NULL);
INSERT INTO `alarm_record` VALUES (471, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:06', NULL);
INSERT INTO `alarm_record` VALUES (472, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:07', NULL);
INSERT INTO `alarm_record` VALUES (473, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:08', NULL);
INSERT INTO `alarm_record` VALUES (474, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:08', NULL);
INSERT INTO `alarm_record` VALUES (475, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:09', NULL);
INSERT INTO `alarm_record` VALUES (476, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:09', NULL);
INSERT INTO `alarm_record` VALUES (477, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:10', NULL);
INSERT INTO `alarm_record` VALUES (478, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:10', NULL);
INSERT INTO `alarm_record` VALUES (479, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:11', NULL);
INSERT INTO `alarm_record` VALUES (480, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:11', NULL);
INSERT INTO `alarm_record` VALUES (481, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:12', NULL);
INSERT INTO `alarm_record` VALUES (482, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:51:12', NULL);
INSERT INTO `alarm_record` VALUES (483, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:13', NULL);
INSERT INTO `alarm_record` VALUES (484, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:13', NULL);
INSERT INTO `alarm_record` VALUES (485, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:14', NULL);
INSERT INTO `alarm_record` VALUES (486, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:14', NULL);
INSERT INTO `alarm_record` VALUES (487, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:15', NULL);
INSERT INTO `alarm_record` VALUES (488, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:15', NULL);
INSERT INTO `alarm_record` VALUES (489, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:16', NULL);
INSERT INTO `alarm_record` VALUES (490, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:16', NULL);
INSERT INTO `alarm_record` VALUES (491, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:17', NULL);
INSERT INTO `alarm_record` VALUES (492, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:17', NULL);
INSERT INTO `alarm_record` VALUES (493, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:18', NULL);
INSERT INTO `alarm_record` VALUES (494, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-22 19:51:19', NULL);
INSERT INTO `alarm_record` VALUES (495, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:51:19', NULL);
INSERT INTO `alarm_record` VALUES (496, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:51:20', NULL);
INSERT INTO `alarm_record` VALUES (497, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:51:20', NULL);
INSERT INTO `alarm_record` VALUES (498, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:51:26', NULL);
INSERT INTO `alarm_record` VALUES (499, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-22 19:51:26', NULL);
INSERT INTO `alarm_record` VALUES (500, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似翻越围栏行为，请派人排查！', 0, 0, '2026-04-22 19:51:27', NULL);
INSERT INTO `alarm_record` VALUES (501, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:12', NULL);
INSERT INTO `alarm_record` VALUES (502, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:12', NULL);
INSERT INTO `alarm_record` VALUES (503, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:14', NULL);
INSERT INTO `alarm_record` VALUES (504, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:14', NULL);
INSERT INTO `alarm_record` VALUES (505, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:15', NULL);
INSERT INTO `alarm_record` VALUES (506, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:17', NULL);
INSERT INTO `alarm_record` VALUES (507, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:18', NULL);
INSERT INTO `alarm_record` VALUES (508, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:18', NULL);
INSERT INTO `alarm_record` VALUES (509, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:19', NULL);
INSERT INTO `alarm_record` VALUES (510, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:19', NULL);
INSERT INTO `alarm_record` VALUES (511, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:20', NULL);
INSERT INTO `alarm_record` VALUES (512, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:20', NULL);
INSERT INTO `alarm_record` VALUES (513, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:22', NULL);
INSERT INTO `alarm_record` VALUES (514, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:22', NULL);
INSERT INTO `alarm_record` VALUES (515, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:23', NULL);
INSERT INTO `alarm_record` VALUES (516, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:28', NULL);
INSERT INTO `alarm_record` VALUES (517, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:33', NULL);
INSERT INTO `alarm_record` VALUES (518, 'AI_CAM_02', 'warning', '⚠️ [预警] 监控区域发现疑似盗窃行为，请注意监控！', 0, 0, '2026-04-24 09:48:35', NULL);
INSERT INTO `alarm_record` VALUES (519, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:35', NULL);
INSERT INTO `alarm_record` VALUES (520, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:36', NULL);
INSERT INTO `alarm_record` VALUES (521, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:36', NULL);
INSERT INTO `alarm_record` VALUES (522, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:41', NULL);
INSERT INTO `alarm_record` VALUES (523, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:42', NULL);
INSERT INTO `alarm_record` VALUES (524, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:43', NULL);
INSERT INTO `alarm_record` VALUES (525, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:44', NULL);
INSERT INTO `alarm_record` VALUES (526, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:44', NULL);
INSERT INTO `alarm_record` VALUES (527, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:45', NULL);
INSERT INTO `alarm_record` VALUES (528, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:47', NULL);
INSERT INTO `alarm_record` VALUES (529, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:48', NULL);
INSERT INTO `alarm_record` VALUES (530, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:48', NULL);
INSERT INTO `alarm_record` VALUES (531, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:49', NULL);
INSERT INTO `alarm_record` VALUES (532, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:51', NULL);
INSERT INTO `alarm_record` VALUES (533, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:52', NULL);
INSERT INTO `alarm_record` VALUES (534, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:53', NULL);
INSERT INTO `alarm_record` VALUES (535, 'AI_CAM_02', 'critical', '🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', 0, 0, '2026-04-24 09:48:53', NULL);
INSERT INTO `alarm_record` VALUES (536, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-24 09:54:36', NULL);
INSERT INTO `alarm_record` VALUES (537, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-24 09:54:40', NULL);
INSERT INTO `alarm_record` VALUES (538, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-24 09:54:45', NULL);
INSERT INTO `alarm_record` VALUES (539, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-24 09:54:53', NULL);
INSERT INTO `alarm_record` VALUES (540, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-24 09:54:56', NULL);
INSERT INTO `alarm_record` VALUES (541, 'AI_CAM_02', 'critical', '🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', 0, 0, '2026-04-24 09:54:58', NULL);

-- ----------------------------
-- Table structure for alarm_rule
-- ----------------------------
DROP TABLE IF EXISTS `alarm_rule`;
CREATE TABLE `alarm_rule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `condition_expr` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `level` enum('info','warning','critical') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'warning',
  `action_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `action_target` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'MQTT主题或URL',
  `action_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alarm_rule
-- ----------------------------
INSERT INTO `alarm_rule` VALUES (1, '火灾预警', 'smoke > 100', 'critical', 'mqtt', NULL, '{\"led\":1,\"buzzer\":1}', 0);
INSERT INTO `alarm_rule` VALUES (2, '高温预警', 'temperature > 30', 'warning', 'mqtt', NULL, '{\"motor\":1}', 0);
INSERT INTO `alarm_rule` VALUES (3, '强光预警', 'lux > 1000', 'info', 'mqtt', NULL, '{\"led\":0}', 0);

-- ----------------------------
-- Table structure for museum_device
-- ----------------------------
DROP TABLE IF EXISTS `museum_device`;
CREATE TABLE `museum_device`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 1,
  `last_active` datetime NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `arm_status` tinyint(1) NULL DEFAULT 0 COMMENT '布防状态: 1布防, 0撤防',
  `led_status` tinyint NULL DEFAULT 0,
  `light_status` tinyint NULL DEFAULT 0,
  `buzzer_status` tinyint NULL DEFAULT 0,
  `motor_status` tinyint NULL DEFAULT 0,
  `region` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区域: A区, B区, C区, D区',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `device_id`(`device_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of museum_device
-- ----------------------------
INSERT INTO `museum_device` VALUES (1, '1', '1号文物展柜', 'A区01号', 0, '2026-04-16 18:10:11', '2026-04-11 11:09:57', 0, 0, 0, 0, 0, 'A');
INSERT INTO `museum_device` VALUES (3, '2', '青铜鼎展柜', '一楼一号厅', 0, '2026-04-15 10:00:22', '2026-04-13 09:18:52', 0, 0, 0, 0, 0, 'A');
INSERT INTO `museum_device` VALUES (4, '3', '玉器珍品独立柜', '二楼玉器馆A区', 0, NULL, '2026-04-16 14:07:52', 1, 0, 0, 0, 0, 'A');
INSERT INTO `museum_device` VALUES (5, '4', '唐三彩恒温恒湿柜', '三楼陶瓷陈列室', 0, NULL, '2026-04-16 14:07:52', 1, 0, 0, 0, 0, 'B');
INSERT INTO `museum_device` VALUES (6, '5', '历代帝王图展柜', '四楼书画特展厅', 0, NULL, '2026-04-16 14:07:52', 0, 0, 0, 0, 0, 'B');
INSERT INTO `museum_device` VALUES (7, '6', '曾侯乙编钟复刻台', '一楼沉浸式体验区', 0, NULL, '2026-04-16 14:07:52', 1, 1, 1, 1, 1, 'B');
INSERT INTO `museum_device` VALUES (8, '7', '法老黄金面具展位', '负一层国际特展A厅', 0, NULL, '2026-04-16 14:07:52', 0, 0, 0, 0, 0, 'A');
INSERT INTO `museum_device` VALUES (9, '8', '西汉古籍善本存放柜', '地下核心珍品库房', 0, NULL, '2026-04-16 14:07:52', 1, 0, 1, 1, 1, 'B');

-- ----------------------------
-- Table structure for museum_relic
-- ----------------------------
DROP TABLE IF EXISTS `museum_relic`;
CREATE TABLE `museum_relic`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `relic_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'AI模型输出的标签',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dynasty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `material` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `protection_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '一级文物',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `relic_code`(`relic_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of museum_relic
-- ----------------------------

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `metadata` json NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('153f2fd70f254d0f942c827c10374fd0', '11111', 'admin', '{\"name\": \"11111\", \"role\": \"admin\"}', '2026-04-22 18:44:12');
INSERT INTO `person` VALUES ('34459c2df87640ffb0eccbfc109cb42e', '222', 'visitor', '{\"name\": \"222\", \"role\": \"visitor\"}', '2026-04-16 18:21:54');
INSERT INTO `person` VALUES ('3b7372b8c15d45f087420f793d613466', 'wh', 'visitor', '{\"name\": \"wh\", \"role\": \"visitor\"}', '2026-04-24 10:01:39');
INSERT INTO `person` VALUES ('701f45e1031541f49ff57f2f603bbbda', 'ccc', 'admin', '{\"name\": \"ccc\", \"role\": \"admin\"}', '2026-04-22 10:39:37');
INSERT INTO `person` VALUES ('8c4a1dd5453f4b84b2ed5ee0acf1d314', 'xzx', 'admin', '{\"name\": \"xzx\", \"role\": \"admin\"}', '2026-04-24 09:48:38');
INSERT INTO `person` VALUES ('admin_001', '张馆长', 'admin', '{\"dept\": \"馆长办公室\", \"name\": \"张馆长\", \"role\": \"admin\"}', '2026-04-16 17:08:45');
INSERT INTO `person` VALUES ('b523e0f00a394c1e9fbc4b27db03c4af', 'llll', 'admin', '{\"name\": \"llll\", \"role\": \"admin\"}', '2026-04-24 09:42:09');
INSERT INTO `person` VALUES ('cb02d7905e374a2abe4243da2a22561b', '111', 'visitor', '{\"name\": \"111\", \"role\": \"visitor\"}', '2026-04-16 17:53:17');
INSERT INTO `person` VALUES ('f433fac45bcb4976bee189d2ed5b5d45', 'jjj', 'staff', '{\"name\": \"jjj\", \"role\": \"staff\"}', '2026-04-16 18:22:20');
INSERT INTO `person` VALUES ('it_001', '陈系统', 'admin', '{\"dept\": \"数字化中心\", \"name\": \"陈系统\", \"role\": \"admin\"}', '2026-04-16 17:08:45');
INSERT INTO `person` VALUES ('staff_001', '李云卿', 'staff', '{\"dept\": \"文物修复组\", \"name\": \"李云卿\", \"role\": \"staff\"}', '2026-04-16 17:08:45');
INSERT INTO `person` VALUES ('staff_002', '王志强', 'staff', '{\"dept\": \"安保巡检组\", \"name\": \"王志强\", \"role\": \"staff\"}', '2026-04-16 17:08:45');
INSERT INTO `person` VALUES ('staff_003', '赵爱华', 'staff', '{\"dept\": \"讲解导览组\", \"name\": \"赵爱华\", \"role\": \"staff\"}', '2026-04-16 17:08:45');

-- ----------------------------
-- Table structure for sensor_data
-- ----------------------------
DROP TABLE IF EXISTS `sensor_data`;
CREATE TABLE `sensor_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `smoke` int NULL DEFAULT NULL,
  `temperature` decimal(5, 2) NULL DEFAULT NULL,
  `humidity` decimal(5, 2) NULL DEFAULT NULL,
  `light` int NULL DEFAULT NULL,
  `accel_x` decimal(6, 4) NULL DEFAULT NULL,
  `accel_y` decimal(6, 4) NULL DEFAULT NULL,
  `accel_z` decimal(6, 4) NULL DEFAULT NULL,
  `pir` tinyint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11578 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sensor_data
-- ----------------------------
INSERT INTO `sensor_data` VALUES (11554, '1', 0, 20.50, 42.10, 110, NULL, NULL, NULL, NULL, '2026-04-21 17:26:11');
INSERT INTO `sensor_data` VALUES (11555, '1', 0, 20.20, 43.50, 105, NULL, NULL, NULL, NULL, '2026-04-21 18:26:11');
INSERT INTO `sensor_data` VALUES (11556, '1', 0, 19.80, 45.00, 95, NULL, NULL, NULL, NULL, '2026-04-21 19:26:11');
INSERT INTO `sensor_data` VALUES (11557, '1', 0, 19.50, 46.20, 80, NULL, NULL, NULL, NULL, '2026-04-21 20:26:11');
INSERT INTO `sensor_data` VALUES (11558, '1', 0, 19.10, 47.50, 50, NULL, NULL, NULL, NULL, '2026-04-21 21:26:11');
INSERT INTO `sensor_data` VALUES (11559, '1', 0, 18.80, 48.10, 20, NULL, NULL, NULL, NULL, '2026-04-21 22:26:11');
INSERT INTO `sensor_data` VALUES (11560, '1', 0, 18.50, 49.00, 10, NULL, NULL, NULL, NULL, '2026-04-21 23:26:11');
INSERT INTO `sensor_data` VALUES (11561, '1', 0, 18.20, 49.50, 5, NULL, NULL, NULL, NULL, '2026-04-22 00:26:11');
INSERT INTO `sensor_data` VALUES (11562, '1', 0, 18.00, 50.00, 5, NULL, NULL, NULL, NULL, '2026-04-22 01:26:11');
INSERT INTO `sensor_data` VALUES (11563, '1', 0, 18.30, 48.50, 30, NULL, NULL, NULL, NULL, '2026-04-22 02:26:11');
INSERT INTO `sensor_data` VALUES (11564, '1', 0, 19.00, 46.00, 150, NULL, NULL, NULL, NULL, '2026-04-22 03:26:11');
INSERT INTO `sensor_data` VALUES (11565, '1', 0, 20.10, 44.20, 280, NULL, NULL, NULL, NULL, '2026-04-22 04:26:11');
INSERT INTO `sensor_data` VALUES (11566, '1', 0, 21.50, 42.00, 450, NULL, NULL, NULL, NULL, '2026-04-22 05:26:11');
INSERT INTO `sensor_data` VALUES (11567, '1', 0, 22.80, 40.50, 620, NULL, NULL, NULL, NULL, '2026-04-22 06:26:11');
INSERT INTO `sensor_data` VALUES (11568, '1', 0, 23.50, 38.00, 750, NULL, NULL, NULL, NULL, '2026-04-22 07:26:11');
INSERT INTO `sensor_data` VALUES (11569, '1', 0, 24.20, 36.50, 820, NULL, NULL, NULL, NULL, '2026-04-22 08:26:11');
INSERT INTO `sensor_data` VALUES (11570, '1', 0, 24.80, 35.10, 850, NULL, NULL, NULL, NULL, '2026-04-22 09:26:11');
INSERT INTO `sensor_data` VALUES (11571, '1', 0, 25.10, 34.50, 860, NULL, NULL, NULL, NULL, '2026-04-22 10:26:11');
INSERT INTO `sensor_data` VALUES (11572, '1', 0, 25.00, 35.00, 800, NULL, NULL, NULL, NULL, '2026-04-22 11:26:11');
INSERT INTO `sensor_data` VALUES (11573, '1', 0, 24.50, 36.80, 650, NULL, NULL, NULL, NULL, '2026-04-22 12:26:11');
INSERT INTO `sensor_data` VALUES (11574, '1', 0, 23.80, 38.50, 480, NULL, NULL, NULL, NULL, '2026-04-22 13:26:11');
INSERT INTO `sensor_data` VALUES (11575, '1', 0, 22.50, 40.10, 320, NULL, NULL, NULL, NULL, '2026-04-22 14:26:11');
INSERT INTO `sensor_data` VALUES (11576, '1', 0, 21.50, 42.50, 200, NULL, NULL, NULL, NULL, '2026-04-22 15:26:11');
INSERT INTO `sensor_data` VALUES (11577, '1', 0, 21.00, 43.80, 150, NULL, NULL, NULL, NULL, '2026-04-22 16:26:11');

-- ----------------------------
-- Table structure for work_order
-- ----------------------------
DROP TABLE IF EXISTS `work_order`;
CREATE TABLE `work_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alarm_id` bigint NULL DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `assignee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `complete_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_order
-- ----------------------------
INSERT INTO `work_order` VALUES (78, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 15:25:41', NULL);
INSERT INTO `work_order` VALUES (79, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 15:26:25', NULL);
INSERT INTO `work_order` VALUES (80, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 17:46:28', NULL);
INSERT INTO `work_order` VALUES (81, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 17:46:29', NULL);
INSERT INTO `work_order` VALUES (82, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 17:46:32', NULL);
INSERT INTO `work_order` VALUES (83, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 17:46:32', NULL);
INSERT INTO `work_order` VALUES (84, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 17:47:20', NULL);
INSERT INTO `work_order` VALUES (85, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 17:47:22', NULL);
INSERT INTO `work_order` VALUES (86, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 17:47:23', NULL);
INSERT INTO `work_order` VALUES (87, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 17:47:24', NULL);
INSERT INTO `work_order` VALUES (88, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 17:47:24', NULL);
INSERT INTO `work_order` VALUES (89, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 19:48:43', NULL);
INSERT INTO `work_order` VALUES (90, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 19:48:49', NULL);
INSERT INTO `work_order` VALUES (91, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 19:48:50', NULL);
INSERT INTO `work_order` VALUES (92, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 19:48:50', NULL);
INSERT INTO `work_order` VALUES (93, NULL, '紧急安防出警：🔥 [火灾告警] 监控区域发现疑似明火！', NULL, '安保行动组', '待处理', '2026-04-22 19:48:51', NULL);
INSERT INTO `work_order` VALUES (94, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:13', NULL);
INSERT INTO `work_order` VALUES (95, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:13', NULL);
INSERT INTO `work_order` VALUES (96, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:16', NULL);
INSERT INTO `work_order` VALUES (97, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:16', NULL);
INSERT INTO `work_order` VALUES (98, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:17', NULL);
INSERT INTO `work_order` VALUES (99, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:17', NULL);
INSERT INTO `work_order` VALUES (100, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:18', NULL);
INSERT INTO `work_order` VALUES (101, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:18', NULL);
INSERT INTO `work_order` VALUES (102, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:19', NULL);
INSERT INTO `work_order` VALUES (103, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:19', NULL);
INSERT INTO `work_order` VALUES (104, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:20', NULL);
INSERT INTO `work_order` VALUES (105, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:20', NULL);
INSERT INTO `work_order` VALUES (106, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:21', NULL);
INSERT INTO `work_order` VALUES (107, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:21', NULL);
INSERT INTO `work_order` VALUES (108, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:22', NULL);
INSERT INTO `work_order` VALUES (109, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:22', NULL);
INSERT INTO `work_order` VALUES (110, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:23', NULL);
INSERT INTO `work_order` VALUES (111, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:29', NULL);
INSERT INTO `work_order` VALUES (112, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:30', NULL);
INSERT INTO `work_order` VALUES (113, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:33', NULL);
INSERT INTO `work_order` VALUES (114, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:33', NULL);
INSERT INTO `work_order` VALUES (115, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:34', NULL);
INSERT INTO `work_order` VALUES (116, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:34', NULL);
INSERT INTO `work_order` VALUES (117, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:35', NULL);
INSERT INTO `work_order` VALUES (118, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:35', NULL);
INSERT INTO `work_order` VALUES (119, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:36', NULL);
INSERT INTO `work_order` VALUES (120, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:41', NULL);
INSERT INTO `work_order` VALUES (121, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:41', NULL);
INSERT INTO `work_order` VALUES (122, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:42', NULL);
INSERT INTO `work_order` VALUES (123, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:43', NULL);
INSERT INTO `work_order` VALUES (124, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:43', NULL);
INSERT INTO `work_order` VALUES (125, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:44', NULL);
INSERT INTO `work_order` VALUES (126, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:44', NULL);
INSERT INTO `work_order` VALUES (127, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:45', NULL);
INSERT INTO `work_order` VALUES (128, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:45', NULL);
INSERT INTO `work_order` VALUES (129, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:46', NULL);
INSERT INTO `work_order` VALUES (130, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:46', NULL);
INSERT INTO `work_order` VALUES (131, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:47', NULL);
INSERT INTO `work_order` VALUES (132, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:48', NULL);
INSERT INTO `work_order` VALUES (133, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:49', NULL);
INSERT INTO `work_order` VALUES (134, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:51', NULL);
INSERT INTO `work_order` VALUES (135, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:52', NULL);
INSERT INTO `work_order` VALUES (136, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:53', NULL);
INSERT INTO `work_order` VALUES (137, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:54', NULL);
INSERT INTO `work_order` VALUES (138, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:54', NULL);
INSERT INTO `work_order` VALUES (139, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:49:55', NULL);
INSERT INTO `work_order` VALUES (140, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:50:57', NULL);
INSERT INTO `work_order` VALUES (141, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:50:59', NULL);
INSERT INTO `work_order` VALUES (142, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:51:00', NULL);
INSERT INTO `work_order` VALUES (143, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:51:12', NULL);
INSERT INTO `work_order` VALUES (144, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:51:19', NULL);
INSERT INTO `work_order` VALUES (145, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:51:19', NULL);
INSERT INTO `work_order` VALUES (146, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:51:20', NULL);
INSERT INTO `work_order` VALUES (147, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:51:20', NULL);
INSERT INTO `work_order` VALUES (148, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:51:26', NULL);
INSERT INTO `work_order` VALUES (149, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-22 19:51:26', NULL);
INSERT INTO `work_order` VALUES (150, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:12', NULL);
INSERT INTO `work_order` VALUES (151, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:12', NULL);
INSERT INTO `work_order` VALUES (152, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:14', NULL);
INSERT INTO `work_order` VALUES (153, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:14', NULL);
INSERT INTO `work_order` VALUES (154, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:15', NULL);
INSERT INTO `work_order` VALUES (155, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:17', NULL);
INSERT INTO `work_order` VALUES (156, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:18', NULL);
INSERT INTO `work_order` VALUES (157, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:18', NULL);
INSERT INTO `work_order` VALUES (158, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:19', NULL);
INSERT INTO `work_order` VALUES (159, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:19', NULL);
INSERT INTO `work_order` VALUES (160, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:20', NULL);
INSERT INTO `work_order` VALUES (161, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:20', NULL);
INSERT INTO `work_order` VALUES (162, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:22', NULL);
INSERT INTO `work_order` VALUES (163, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:22', NULL);
INSERT INTO `work_order` VALUES (164, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:23', NULL);
INSERT INTO `work_order` VALUES (165, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:28', NULL);
INSERT INTO `work_order` VALUES (166, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:33', NULL);
INSERT INTO `work_order` VALUES (167, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:35', NULL);
INSERT INTO `work_order` VALUES (168, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:36', NULL);
INSERT INTO `work_order` VALUES (169, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:36', NULL);
INSERT INTO `work_order` VALUES (170, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:41', NULL);
INSERT INTO `work_order` VALUES (171, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:42', NULL);
INSERT INTO `work_order` VALUES (172, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:43', NULL);
INSERT INTO `work_order` VALUES (173, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:44', NULL);
INSERT INTO `work_order` VALUES (174, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:44', NULL);
INSERT INTO `work_order` VALUES (175, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:45', NULL);
INSERT INTO `work_order` VALUES (176, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:47', NULL);
INSERT INTO `work_order` VALUES (177, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:48', NULL);
INSERT INTO `work_order` VALUES (178, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:48', NULL);
INSERT INTO `work_order` VALUES (179, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:49', NULL);
INSERT INTO `work_order` VALUES (180, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:51', NULL);
INSERT INTO `work_order` VALUES (181, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:52', NULL);
INSERT INTO `work_order` VALUES (182, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:53', NULL);
INSERT INTO `work_order` VALUES (183, NULL, '紧急安防出警：🚨 [最高紧急] 监控区域发现疑似持枪行为，请立即疏散并报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:48:53', NULL);
INSERT INTO `work_order` VALUES (184, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:54:36', NULL);
INSERT INTO `work_order` VALUES (185, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:54:40', NULL);
INSERT INTO `work_order` VALUES (186, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:54:45', NULL);
INSERT INTO `work_order` VALUES (187, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:54:53', NULL);
INSERT INTO `work_order` VALUES (188, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:54:56', NULL);
INSERT INTO `work_order` VALUES (189, NULL, '紧急安防出警：🚨 [紧急] 监控区域发现疑似抢劫行为，请立即报警！', NULL, '安保行动组', '待处理', '2026-04-24 09:54:58', NULL);

SET FOREIGN_KEY_CHECKS = 1;
