/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : look

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 22/11/2019 08:33:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 'add_logentry', 1);
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 'change_logentry', 1);
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 'delete_logentry', 1);
INSERT INTO `auth_permission` VALUES (4, 'Can add group', 'add_group', 2);
INSERT INTO `auth_permission` VALUES (5, 'Can change group', 'change_group', 2);
INSERT INTO `auth_permission` VALUES (6, 'Can delete group', 'delete_group', 2);
INSERT INTO `auth_permission` VALUES (7, 'Can add permission', 'add_permission', 3);
INSERT INTO `auth_permission` VALUES (8, 'Can change permission', 'change_permission', 3);
INSERT INTO `auth_permission` VALUES (9, 'Can delete permission', 'delete_permission', 3);
INSERT INTO `auth_permission` VALUES (10, 'Can add content type', 'add_contenttype', 4);
INSERT INTO `auth_permission` VALUES (11, 'Can change content type', 'change_contenttype', 4);
INSERT INTO `auth_permission` VALUES (12, 'Can delete content type', 'delete_contenttype', 4);
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 'add_session', 5);
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 'change_session', 5);
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 'delete_session', 5);
INSERT INTO `auth_permission` VALUES (16, 'Can add 用户表', 'add_user', 6);
INSERT INTO `auth_permission` VALUES (17, 'Can change 用户表', 'change_user', 6);
INSERT INTO `auth_permission` VALUES (18, 'Can delete 用户表', 'delete_user', 6);
INSERT INTO `auth_permission` VALUES (19, 'Can add 轮播图', 'add_banner', 7);
INSERT INTO `auth_permission` VALUES (20, 'Can change 轮播图', 'change_banner', 7);
INSERT INTO `auth_permission` VALUES (21, 'Can delete 轮播图', 'delete_banner', 7);
INSERT INTO `auth_permission` VALUES (22, 'Can add 点赞点踩表', 'add_upanddown', 8);
INSERT INTO `auth_permission` VALUES (23, 'Can change 点赞点踩表', 'change_upanddown', 8);
INSERT INTO `auth_permission` VALUES (24, 'Can delete 点赞点踩表', 'delete_upanddown', 8);
INSERT INTO `auth_permission` VALUES (25, 'Can add 评论表', 'add_comment', 9);
INSERT INTO `auth_permission` VALUES (26, 'Can change 评论表', 'change_comment', 9);
INSERT INTO `auth_permission` VALUES (27, 'Can delete 评论表', 'delete_comment', 9);
INSERT INTO `auth_permission` VALUES (28, 'Can add 标签', 'add_tag', 10);
INSERT INTO `auth_permission` VALUES (29, 'Can change 标签', 'change_tag', 10);
INSERT INTO `auth_permission` VALUES (30, 'Can delete 标签', 'delete_tag', 10);
INSERT INTO `auth_permission` VALUES (31, 'Can add 分类', 'add_category', 11);
INSERT INTO `auth_permission` VALUES (32, 'Can change 分类', 'change_category', 11);
INSERT INTO `auth_permission` VALUES (33, 'Can delete 分类', 'delete_category', 11);
INSERT INTO `auth_permission` VALUES (34, 'Can add 电影', 'add_movie', 12);
INSERT INTO `auth_permission` VALUES (35, 'Can change 电影', 'change_movie', 12);
INSERT INTO `auth_permission` VALUES (36, 'Can delete 电影', 'delete_movie', 12);
INSERT INTO `auth_permission` VALUES (37, 'Can add 电影地址', 'add_link', 13);
INSERT INTO `auth_permission` VALUES (38, 'Can change 电影地址', 'change_link', 13);
INSERT INTO `auth_permission` VALUES (39, 'Can delete 电影地址', 'delete_link', 13);
INSERT INTO `auth_permission` VALUES (40, 'Can add gif', 'add_gif', 14);
INSERT INTO `auth_permission` VALUES (41, 'Can change gif', 'change_gif', 14);
INSERT INTO `auth_permission` VALUES (42, 'Can delete gif', 'delete_gif', 14);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_user_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-11-03 13:44:24.633450', '1', '速度与激情:特别行动', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2019-11-03 13:44:47.588212', '2', '英雄学院', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2019-11-03 13:44:59.832938', '3', '东京不热', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2019-11-03 13:45:04.157555', '2', '英雄学院', 2, '[{\"changed\": {\"fields\": [\"is_show\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (5, '2019-11-03 13:45:38.607276', '4', '过新年', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (6, '2019-11-03 13:45:55.113229', '5', '使徒行者', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (7, '2019-11-03 17:05:32.169413', '1', '战争', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (8, '2019-11-03 17:05:38.972179', '2', '热血', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (9, '2019-11-03 17:05:54.287537', '3', '恐怖', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (10, '2019-11-03 17:06:00.615432', '4', '爱情', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (11, '2019-11-03 17:06:18.542932', '1', '迪丽热巴', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (12, '2019-11-03 17:06:28.421698', '2', '古力娜扎', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (13, '2019-11-03 17:06:43.942282', '3', 'Anglebaby', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (14, '2019-11-03 17:06:48.197643', '4', 'TVB', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (15, '2019-11-03 17:06:53.661476', '5', 'Ig', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (16, '2019-11-03 17:07:00.653233', '6', '明日花绮罗', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (17, '2019-11-03 17:07:04.789232', '7', '三上', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (18, '2019-11-03 17:07:33.086527', '8', '动物', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (19, '2019-11-03 17:07:38.950317', '9', '喜剧', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (20, '2019-11-03 17:10:06.680840', '1', 'Link object (1)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (21, '2019-11-03 17:10:30.390033', '1', '丧尸未逝', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (22, '2019-11-03 17:11:34.648128', '2', '埃伦娜', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (23, '2019-11-03 17:12:28.709028', '3', '油炸绿番茄', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (24, '2019-11-03 17:13:22.245584', '4', '夏末秋至', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (25, '2019-11-03 17:14:02.166518', '5', '罗马的房子', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (26, '2019-11-03 17:14:49.204080', '6', '恋恋师情', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (27, '2019-11-03 17:15:08.298222', '6', '恋恋师情', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (28, '2019-11-03 19:52:32.411549', '1', 'Link object (1)', 2, '[]', 13, 1);
INSERT INTO `django_admin_log` VALUES (29, '2019-11-03 19:52:36.343920', '2', 'Link object (2)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (30, '2019-11-03 19:52:40.006450', '3', 'Link object (3)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (31, '2019-11-03 19:52:43.310276', '4', 'Link object (4)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (32, '2019-11-03 19:52:46.141621', '5', 'Link object (5)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (33, '2019-11-03 19:52:49.925647', '6', 'Link object (6)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (34, '2019-11-03 19:57:45.543836', '6', '恋恋师情', 2, '[{\"changed\": {\"fields\": [\"up_num\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (35, '2019-11-03 19:57:48.521074', '6', '恋恋师情', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (36, '2019-11-03 19:58:07.724573', '5', '罗马的房子', 2, '[{\"changed\": {\"fields\": [\"views\", \"up_num\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (37, '2019-11-03 19:58:11.512584', '5', '罗马的房子', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (38, '2019-11-03 19:58:27.607978', '4', '夏末秋至', 2, '[{\"changed\": {\"fields\": [\"views\", \"up_num\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (39, '2019-11-03 19:59:01.964812', '3', '油炸绿番茄', 2, '[{\"changed\": {\"fields\": [\"views\", \"up_num\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (40, '2019-11-03 19:59:08.714512', '2', '埃伦娜', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (41, '2019-11-03 19:59:30.403413', '1', '丧尸未逝', 2, '[{\"changed\": {\"fields\": [\"views\", \"up_num\", \"down_num\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (42, '2019-11-04 19:48:31.890782', '7', '妮娜', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (43, '2019-11-04 19:52:35.800640', '8', '克莱尔', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (44, '2019-11-04 19:53:46.081918', '9', '气球', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (45, '2019-11-04 19:54:36.549540', '10', '遗孀秘闻', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (46, '2019-11-04 19:55:07.669712', '11', 'Raven’s To', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (47, '2019-11-04 19:55:45.934782', '12', '猫头鹰', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (48, '2019-11-04 19:57:14.119174', '6', 'Link object (6)', 2, '[]', 13, 1);
INSERT INTO `django_admin_log` VALUES (49, '2019-11-04 19:57:23.390640', '7', 'Link object (7)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (50, '2019-11-04 19:57:27.570338', '8', 'Link object (8)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (51, '2019-11-04 19:57:31.612341', '9', 'Link object (9)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (52, '2019-11-04 19:57:37.566210', '10', 'Link object (10)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (53, '2019-11-04 19:57:42.883655', '11', 'Link object (11)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (54, '2019-11-04 19:57:46.778523', '12', 'Link object (12)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (55, '2019-11-04 19:57:51.523751', '13', 'Link object (13)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (56, '2019-11-04 20:01:30.806040', '11', 'Raven’s To', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (57, '2019-11-08 23:10:07.675324', '12', '猫头鹰', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (58, '2019-11-08 23:10:07.680320', '11', 'Raven’s To', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (59, '2019-11-08 23:10:07.682320', '10', '遗孀秘闻', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (60, '2019-11-08 23:10:07.684317', '9', '气球', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (61, '2019-11-08 23:10:07.688316', '8', '克莱尔', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (62, '2019-11-08 23:10:07.690314', '7', '妮娜', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (63, '2019-11-08 23:10:07.692313', '6', '恋恋师情', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (64, '2019-11-08 23:10:07.694312', '5', '罗马的房子', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (65, '2019-11-08 23:10:07.698311', '4', '夏末秋至', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (66, '2019-11-08 23:10:07.700310', '3', '油炸绿番茄', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (67, '2019-11-08 23:10:07.703308', '2', '埃伦娜', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (68, '2019-11-08 23:10:07.705307', '1', '丧尸未逝', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (69, '2019-11-08 23:12:06.271726', '4', '爱情', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (70, '2019-11-08 23:12:06.274772', '3', '恐怖', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (71, '2019-11-08 23:12:06.276754', '2', '热血', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (72, '2019-11-08 23:12:06.278731', '1', '战争', 3, '', 11, 1);
INSERT INTO `django_admin_log` VALUES (73, '2019-11-08 23:12:15.774235', '5', '电影', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (74, '2019-11-08 23:12:33.513841', '6', '动画', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (75, '2019-11-08 23:12:40.878919', '7', '综艺', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (76, '2019-11-08 23:12:46.692630', '8', '音乐', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (77, '2019-11-08 23:12:53.748208', '9', '生活', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (78, '2019-11-09 15:18:05.635729', '13', 'qwe', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (79, '2019-11-09 15:18:42.041641', '13', 'qwe', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (80, '2019-11-09 15:18:55.308319', '13', 'qwe', 2, '[{\"changed\": {\"fields\": [\"movie_img\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (81, '2019-11-10 14:14:42.285747', '1', 'Gif object (1)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (82, '2019-11-10 14:14:51.562282', '2', 'Gif object (2)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (83, '2019-11-10 14:20:53.114743', '2', 'Gif object (2)', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (84, '2019-11-10 14:23:42.654825', '1', '为你推荐', 2, '[]', 14, 1);
INSERT INTO `django_admin_log` VALUES (85, '2019-11-10 14:24:02.212321', '3', '动漫', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (86, '2019-11-10 14:24:19.858679', '4', '音乐', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (87, '2019-11-10 14:24:43.474121', '5', '生活', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (88, '2019-11-10 14:25:31.971130', '6', '综艺', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (89, '2019-11-10 14:42:56.174443', '2', 'movie', 2, '[{\"changed\": {\"fields\": [\"gif\", \"name\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (90, '2019-11-10 14:43:13.510240', '1', 'tvplay', 2, '[{\"changed\": {\"fields\": [\"gif\", \"name\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (91, '2019-11-10 14:43:20.172400', '3', 'comic', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (92, '2019-11-10 14:43:27.493877', '4', 'music', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (93, '2019-11-10 14:43:41.457040', '5', 'other', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (94, '2019-11-10 14:43:52.713006', '6', 'shows', 2, '[{\"changed\": {\"fields\": [\"gif\", \"name\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (95, '2019-11-16 14:32:46.751002', '1', '【2010惊悚】猫头鹰 The Owls【亿万同人字幕组】', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (96, '2019-11-16 14:49:05.118422', '1', '【2010惊悚】猫头鹰 The Owls【亿万同人字幕组】', 2, '[]', 15, 1);
INSERT INTO `django_admin_log` VALUES (97, '2019-11-16 14:49:14.828511', '2', '【2016德国】不可言宣 Ungesagt【1080P】【亿万同人字幕组】', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (98, '2019-11-19 20:45:32.093686', '10', '港剧', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (99, '2019-11-19 20:45:38.745573', '127', '【港剧】白色强人 25集全【粤语】', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (100, '2019-11-19 20:47:09.580907', '128', '【港剧】教束 20集全【粤语】', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (101, '2019-11-19 20:49:11.228861', '11', '日剧', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (102, '2019-11-19 20:49:25.118913', '129', '【2019秋季】还是不能结婚的男人 (10集全)【追新番】', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (103, '2019-11-19 20:49:36.562932', '128', '【港剧】教束 20集全【粤语】', 2, '[{\"changed\": {\"fields\": [\"number\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (104, '2019-11-19 20:49:43.403615', '127', '【港剧】白色强人 25集全【粤语】', 2, '[{\"changed\": {\"fields\": [\"number\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (105, '2019-11-19 20:54:15.143275', '129', '【2019秋季】还是不能结婚的男人 (10集全)【追新番】', 2, '[{\"changed\": {\"fields\": [\"number\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (106, '2019-11-19 20:55:40.616805', '12', '美剧', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (107, '2019-11-19 20:56:50.317639', '130', '【美剧】权力的游戏 第八季 (6集全)【未删减】', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (108, '2019-11-19 20:58:13.697182', '13', '韩剧', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (109, '2019-11-19 20:58:18.887485', '131', '【KBS月火剧】绿豆传', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (110, '2019-11-19 20:59:31.788960', '14', '台剧', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (111, '2019-11-19 21:00:07.519580', '132', '【2015台剧】一把青 (全31集)【豆瓣9.3】【1080P】', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (112, '2019-11-20 09:14:16.743832', '133', '【动画】瑞克与莫蒂 Rick and Morty 第四季【电波字幕组】', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (113, '2019-11-20 09:22:54.555689', '133', '【动画】瑞克与莫蒂 Rick and Morty 第四季【电波字幕组】', 2, '[{\"changed\": {\"fields\": [\"movie_img\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (114, '2019-11-20 09:25:02.243776', '134', '【美漫】宝贝老板：重围商界 13集全【Netflix官方中字】', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (115, '2019-11-20 10:13:58.122799', '217', '【动画】瑞克与莫蒂 Rick and Morty 第四季【电波字幕组】', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (116, '2019-11-20 10:14:06.322879', '218', '【美漫】宝贝老板：重围商界 13集全【Netflix官方中字】', 1, '[{\"added\": {}}]', 15, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (17, 'all_resource', 'category');
INSERT INTO `django_content_type` VALUES (15, 'all_resource', 'link');
INSERT INTO `django_content_type` VALUES (16, 'all_resource', 'movie');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'home', 'banner');
INSERT INTO `django_content_type` VALUES (14, 'home', 'gif');
INSERT INTO `django_content_type` VALUES (11, 'movie', 'category');
INSERT INTO `django_content_type` VALUES (13, 'movie', 'link');
INSERT INTO `django_content_type` VALUES (12, 'movie', 'movie');
INSERT INTO `django_content_type` VALUES (10, 'movie', 'tag');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (9, 'user', 'comment');
INSERT INTO `django_content_type` VALUES (8, 'user', 'upanddown');
INSERT INTO `django_content_type` VALUES (6, 'user', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-11-02 23:26:19.811123');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2019-11-02 23:26:19.940049');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2019-11-02 23:26:20.283851');
INSERT INTO `django_migrations` VALUES (4, 'user', '0001_initial', '2019-11-02 23:26:20.740587');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0001_initial', '2019-11-02 23:26:20.842528');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0002_logentry_user', '2019-11-02 23:26:20.951465');
INSERT INTO `django_migrations` VALUES (7, 'sessions', '0001_initial', '2019-11-02 23:26:20.996439');
INSERT INTO `django_migrations` VALUES (8, 'home', '0001_initial', '2019-11-03 13:33:54.563931');
INSERT INTO `django_migrations` VALUES (9, 'movie', '0001_initial', '2019-11-03 16:59:45.268409');
INSERT INTO `django_migrations` VALUES (10, 'user', '0002_comment_upanddown', '2019-11-03 16:59:45.416430');
INSERT INTO `django_migrations` VALUES (11, 'movie', '0002_auto_20191103_1840', '2019-11-03 18:40:12.449436');
INSERT INTO `django_migrations` VALUES (12, 'movie', '0003_auto_20191109_1431', '2019-11-09 14:32:13.495595');
INSERT INTO `django_migrations` VALUES (13, 'movie', '0004_auto_20191109_1656', '2019-11-09 16:56:33.449572');
INSERT INTO `django_migrations` VALUES (14, 'movie', '0005_auto_20191109_2103', '2019-11-09 21:03:11.834786');
INSERT INTO `django_migrations` VALUES (15, 'home', '0002_gif', '2019-11-10 14:14:14.340301');
INSERT INTO `django_migrations` VALUES (16, 'home', '0003_gif_category', '2019-11-10 14:20:40.510984');
INSERT INTO `django_migrations` VALUES (17, 'home', '0004_auto_20191110_1641', '2019-11-10 16:41:17.125252');
INSERT INTO `django_migrations` VALUES (18, 'movie', '0006_tag_weight', '2019-11-10 16:41:17.233455');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('arh8jn4v2keq56bgs1an4pygefnkpiy5', 'ODQxOTY0ODViYmZkM2NjZDUyMGI5OGExZGNmOTllNjBhYzdhNDI5Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MjdjN2Y0NjU3OTVhY2E0MGZjMDUzODU4YjI0NThkZDdlMDRkODNlIn0=', '2019-12-03 20:38:28.810160');
INSERT INTO `django_session` VALUES ('m2o46qz85xnokei3gjyehoh9254ke15t', 'ODQxOTY0ODViYmZkM2NjZDUyMGI5OGExZGNmOTllNjBhYzdhNDI5Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MjdjN2Y0NjU3OTVhY2E0MGZjMDUzODU4YjI0NThkZDdlMDRkODNlIn0=', '2019-11-17 13:34:16.680098');

-- ----------------------------
-- Table structure for home_gif
-- ----------------------------
DROP TABLE IF EXISTS `home_gif`;
CREATE TABLE `home_gif`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gif` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `home_gif_category_id_434e3e91`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home_gif
-- ----------------------------
INSERT INTO `home_gif` VALUES (1, 'gif/tvplay_D8jCwcV.gif', 'tvplay', NULL);
INSERT INTO `home_gif` VALUES (2, 'gif/movie_6qoBYNl.gif', 'movie', 5);
INSERT INTO `home_gif` VALUES (3, 'gif/comic.gif', 'comic', 6);
INSERT INTO `home_gif` VALUES (4, 'gif/music.gif', 'music', 8);
INSERT INTO `home_gif` VALUES (5, 'gif/other.gif', 'other', 9);
INSERT INTO `home_gif` VALUES (6, 'gif/shows_v1guU3U.gif', 'shows', 7);

-- ----------------------------
-- Table structure for lookapi_category
-- ----------------------------
DROP TABLE IF EXISTS `lookapi_category`;
CREATE TABLE `lookapi_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lookapi_category
-- ----------------------------
INSERT INTO `lookapi_category` VALUES (5, '电影');
INSERT INTO `lookapi_category` VALUES (6, '动画');
INSERT INTO `lookapi_category` VALUES (7, '综艺');
INSERT INTO `lookapi_category` VALUES (8, '音乐');
INSERT INTO `lookapi_category` VALUES (9, '生活');
INSERT INTO `lookapi_category` VALUES (10, '港剧');
INSERT INTO `lookapi_category` VALUES (11, '日剧');
INSERT INTO `lookapi_category` VALUES (12, '美剧');
INSERT INTO `lookapi_category` VALUES (13, '韩剧');
INSERT INTO `lookapi_category` VALUES (14, '台剧');

-- ----------------------------
-- Table structure for lookapi_comment
-- ----------------------------
DROP TABLE IF EXISTS `lookapi_comment`;
CREATE TABLE `lookapi_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `hot` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lookapi_comment_movie_id_275c165a`(`movie_id`) USING BTREE,
  INDEX `lookapi_comment_user_id_6a8909b0`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lookapi_comment
-- ----------------------------
INSERT INTO `lookapi_comment` VALUES (1, '2019-11-18 12:05:56.000000', 1, 68, 1, '卧槽 太好看了');
INSERT INTO `lookapi_comment` VALUES (2, '2019-11-18 15:20:02.824709', 0, 68, 1, '6666');
INSERT INTO `lookapi_comment` VALUES (3, '2019-11-18 15:27:24.800633', 0, 68, 1, '真好看');
INSERT INTO `lookapi_comment` VALUES (4, '2019-11-18 15:49:27.337994', 0, 68, 1, '6');
INSERT INTO `lookapi_comment` VALUES (5, '2019-11-18 15:50:03.907973', 0, 68, 1, '你很帅');
INSERT INTO `lookapi_comment` VALUES (6, '2019-11-18 15:50:59.522257', 0, 68, 1, '真强');
INSERT INTO `lookapi_comment` VALUES (7, '2019-11-18 15:51:28.120774', 0, 68, 1, '真帅');
INSERT INTO `lookapi_comment` VALUES (8, '2019-11-18 15:51:50.577755', 0, 68, 1, '999999999999');
INSERT INTO `lookapi_comment` VALUES (12, '2019-11-20 14:57:20.410367', 0, 68, 3, '牛逼 这么多bug');
INSERT INTO `lookapi_comment` VALUES (13, '2019-11-21 15:55:34.062147', 0, 128, 1, '666');
INSERT INTO `lookapi_comment` VALUES (14, '2019-11-22 00:59:23.885643', 0, 68, 1, '很帅');
INSERT INTO `lookapi_comment` VALUES (15, '2019-11-22 01:02:51.293837', 0, 106, 1, '123');

-- ----------------------------
-- Table structure for lookapi_movie
-- ----------------------------
DROP TABLE IF EXISTS `lookapi_movie`;
CREATE TABLE `lookapi_movie`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movie_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brief` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `views` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `up_num` int(11) NOT NULL,
  `down_num` int(11) NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `number` int(11) NOT NULL,
  `is_tv` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `is_vip` tinyint(1) NOT NULL,
  `score` decimal(10, 2) DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lookapi_movie_category_id_87177592`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lookapi_movie
-- ----------------------------
INSERT INTO `lookapi_movie` VALUES (30, '【2010惊悚】猫头鹰 The Owls【亿万同人字幕组】', '【2010惊悚】猫头鹰 The Owls【亿万同人字幕组】', '8e92d03a3e6497ef770e6c880b13faf9.png', '#player{display:block}\n$vid=\"msc-1572255388\";$pkey=\"cQuirdc55QRJiITIgWKZtLcD5Hrjhuw5cr00uiyXVHo%3D\";简介：\n两对中年女同性恋伴侣不小心杀死了一名年轻的女同性恋，并把尸体藏了起来，没有向当局报告。他们的内疚和长期隐藏的黑暗秘密回来困扰他们，一个意想不到的陌生人出现在他们的生活，带来紧张和不和谐。他们几乎不知道，这个神秘的陌生人有一个计划，其中包括他们四个。', 0, 0, 0, 0, '2019-11-09 16:59:43.314396', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (31, '【2016德国】不可言宣 Ungesagt【1080P】【亿万同人字幕组】', '【2016德国】不可言宣 Ungesagt【1080P】【亿万同人字幕组】', 'movie/30455e9ef650416cb78112d5eee6f001.png', '#player{display:block}\n$vid=\"msm-1572250804\";$pkey=\"f9sD4djNxNmjXOI3RHxPledIGfAa4ARdh9TlfO7aVqU%3D\";简介：\nMarie和Sarah是最好的朋友，应Sarah的邀请，两人来到帕尔马岛旅行。Sarah勇敢、任性并直面内心的情感，在旅途中她告诉Marie,\n“我说真的，我爱你，或许就像一个男人爱女人那样。”\n这突如其来的告白令Marie手足无措，陷入了纠结之中，她开始正视思考自己对Sarah的感觉，她害怕失去这个最好的朋友，但有不明白自己的心到底是什么，一直摇摆不定着。在节日的狂欢之后，Sarah因为Marie的态度，失望的独自离开了。Marie开始不安，没有了Sarah的自己似乎领悟了Sarah告诉过她的话语。', 1, 0, 1, 0, '2019-11-09 16:59:43.322383', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (32, '【喜剧/爱情】友情以上 Friend Zone【泰语中字】', '【喜剧/爱情】友情以上 Friend Zone【泰语中字】', '07d768beb0dd60f2a51ee846697a7ebf.png', '#player{display:block}\n$vid=\"ftn-1573098334\";$pkey=\"JqYXS1rRXpDqxgWNgs4i6wHUgHlouJQ7UyFfQMXl8FE%3D\";这个世界上,有很多人的关系似乎在“朋友”和“恋人”的边缘地带中徘徊,这种关系可以称之为“友情以上”。对于深陷其中的人来说,这是一个特殊的区域,他们无法真正与亲密的朋友保持朋友关系,也无法成为朋友的爱人。', 0, 0, 0, 0, '2019-11-09 16:59:43.328388', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (33, '【1997-2000 喜剧】柯南与凯尔电影番外篇 Kenan and Kel 【树屋字幕组】', '【1997-2000 喜剧】柯南与凯尔电影番外篇 Kenan and Kel 【树屋字幕组】', 'e9ed14fd5f94e5a52d2a2d4e2128ef73.png', 'P1：汉堡总动员\n◎电影简介：柯南与凯尔原版团队出演！在这部电影里，“凯尔”为了赔老师被撞坏的车子不得不来到了一家汉堡店打工，然而事情发展得不妙起来，街对面竟然开了一家新潮便宜的汉堡店，顾客一下大为减少。在这样的情况下，“凯尔”和他的朋友”柯南”，将会想出什么样的办法拯救自己打工的汉堡店呢？两个人一起会制造出什么样的笑料和故事？', 1, 0, 0, 0, '2019-11-09 16:59:43.334372', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (34, '【1990 二战】无敌男儿 Triumph of the spirit【树屋字幕组】', '【1990 二战】无敌男儿 Triumph of the spirit【树屋字幕组】', '1c26bdba27aafafa43b0a34a6d9337e4.png', '◎剧情简介：本影片基于一个真实的故事改编。第二次世界大战期间，前希腊奥林匹克拳击手Arouch作为一个战俘，被关押在奥斯威辛集中营内。在那里，他被做为娱乐的对象，要与一些犯人进行拳击比赛，如果他拒绝，他的家人将受到惩罚，如果他赢了，他会得到些额外的口粮，可以与家人分享;如果他输了，他将被送到毒气室。为了保护自己与所爱的人，他答应了党卫军军官的要求，为他打拳击赛，每赢一场他便能继续保住自己和家人的性命。这不仅仅是拳击场上的战斗，更是一场对敌人的无声的斗争。他是否能拯救自己和家人，在残酷的集中营中他还会面对什么？', 0, 0, 0, 0, '2019-11-09 16:59:43.339422', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (35, '【1966 日影】白色巨塔 【树屋字幕组】', '【1966 日影】白色巨塔 【树屋字幕组】', '78e698e54948616c37bbdbbc8ca1d56b.png', '◎简介：\n浪速大学医学部第一外科的东贞藏教授（东野英治郎 饰）退休在即，拥有出色手术技巧且在医护工作者中享有极高人气的副教授财前五郎（田宫二郎 饰）是下一任教授的最有力候选人。出身贫寒的财前对名利有着超乎常人的野心，却也因此招至了东教授的不满。为了阻挡财前的步伐，东策划在全国范围内选拔继任者。感受到莫大压力的财前，在岳父财前又一（石山健二郎 饰）及大阪市北区医师会强大财力支持下，火力全开对教授职位进行搏命狙击。与此同时，一名胃癌患者交到财前手中。但是热衷名利之争的财前罔顾同期里见修二（田村高广 饰）的建议，自顾自进行了手术，最终将自己卷入医疗事故的漩涡之中……\n本片根据山崎丰子的同名原作改编。 ©豆瓣', 1, 0, 0, 0, '2019-11-09 16:59:43.345365', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (36, '【2017 剧情】书店 The bookshop【树屋字幕组】', '【2017 剧情】书店 The bookshop【树屋字幕组】', 'eb0cbbdd9aacab75af2cac9fc8f7a163.png', '剧情简介：\n影片改编自佩内洛普·菲茨杰拉德同名小说《书店》，背景设定于1959年，拥有自由灵魂的弗萝伦丝·格林在失去丈夫后，将悲痛放在一边，du上一切开了一家书店，这是昏昏沉沉的英格兰海边小镇哈堡的唯一一家书店。通过这家书店，狭隘的当地人接触到了当代最优秀的文学作品，拓宽了视野，百年来一成不变的小镇掀起了一阵文化觉醒的风潮。弗萝伦丝因此结识了同道中人布朗迪希先生，他也早已厌倦了小镇陈腐的氛围。但她的举动也招致了仇敌，其他生意不好的店主对她产生了敌意，还有斤斤计较、满腹牢骚的加玛特夫人。当弗萝伦丝拒绝屈服于加玛特夫人的意志时，她们开始了一场角逐，不仅为了书店，更为了小镇的心脏和灵魂。@豆瓣', 0, 0, 0, 0, '2019-11-09 16:59:43.350377', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (37, '【1973 爱情】往事如烟 Summer of 42【树屋字幕组】', '【1973 爱情】往事如烟 Summer of 42【树屋字幕组】', 'a16ce062876d354f9c250334d658eec5.png', '◎简介：\n每个人的生命里都有一段1942年的那个夏天，纯真透明的心正如那时耀眼的阳光般灼目。在那个恬静安逸的度假小岛，上演了一幕明快却微痛的青春之歌：16岁的赫米情窦初开，他只看了一眼住在海边的桃乐西，从此除了她，整个世界都失去了颜色。爱情的到来毫无预兆，赫米毫无保留地暗恋并帮助着桃乐西，小心翼翼地守护这份感情。与死两个党奥斯基和本吉在性爱启蒙方面的探索也是本片的另外一条线索——出于尊重和珍视，赫米不愿轻易与桃乐西发生关系——然而直到那晚，前线传来桃乐西丈夫的消息…“其实生活就是由无数的聚散离合拼凑而成，我们以为带上了一切，却总有东西被落下”那个夏天伴随着柔软的沙滩和淡淡的钢琴曲永远丢失在成长的路上，一起丢失的还有那个少不更事的赫米，但桃乐西，这个世间最美的女人，却像盛开在伤口上的白色海芋，永远点缀着赫米16岁的枝头。', 0, 0, 0, 0, '2019-11-09 16:59:43.356368', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (38, '【2014 爱情】极少数的吻 Por Un Puñado De Besos【树屋字幕组】', '【2014 爱情】极少数的吻 Por Un Puñado De Besos【树屋字幕组】', 'be4f06eb926d8550e42fae0918a64edd.png', '◎剧情简介：这部电影讲述的是一个名叫索尔（Sol）的姑娘的故事。她决定以一段爱情重新开始人生。她发布了一个告示寻找白马王子，两人约会后便一见钟情。就这样，开始了一段交织着女方的生存欲望和男方谎言的激烈爱情故事。这段爱情能够永远地改变她的人生吗？', 0, 0, 0, 0, '2019-11-09 16:59:43.361356', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (39, '【1984 剧情】生为爵士狂 My.Iz.Dzhaza【树屋字幕组】', '【1984 剧情】生为爵士狂 My.Iz.Dzhaza【树屋字幕组】', '2d13db365947a47623c29428bf9f466d.png', '◎简介：\n同样是对音乐的虔诚热爱让四个原本毫不相干的命运轨迹交织在了一起。精明的斯蒂芬和呆萌的卓亚整日在街头歌唱演奏，仅靠这微薄的收入混饱肚子。潦倒之际，他们看到了音乐学院的学生科斯佳发布的乐师招募启示，于是一篇坎坷曲折却妙趣横生的爵士乐章就这样缓缓拉开了序幕…\n四个性格迥异的男人，一个共同执着的目标。追梦的路上轮番上演了令人捧腹的趣事，然而通往成功的道路并非永远开满鲜花，甚至连好天气都没有。梦想不死，我们不散，欢笑与泪水愈发坚固了他们在特殊年代里的革命友谊，莫斯科阴冷的天空也无法冷却他们对爵士的狂热。接连的失败、周围的冷眼甚至嘲笑，然而梦想的彼岸，等待他们的究竟是什么呢？', 0, 0, 0, 0, '2019-11-09 16:59:43.367362', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (40, '【2017 喜剧】酒吧 El.bar【树屋字幕组】', '【2017 喜剧】酒吧 El.bar【树屋字幕组】', '74ac581b3ad7e198eb5dfcb7ddea2066.png', '◎简介：\n普通的一个白天，11个普通人被困在一个简陋的酒吧里。里面有老板厨子，有熟客，有偶然进去寻找充电器的陌生人。但是突然之间，大家发现出去的人就要被杀死，而酒吧内部也渐渐危机四伏。马德里华人区街头，一件破破烂烂的小酒吧，一群庸庸碌碌的陌生人，一声枪响后，他们人生全部发生了变化。猜忌、指责、揭发、伤害，能拯救他们的，是上帝？还是他们自己', 1, 0, 0, 0, '2019-11-09 16:59:43.372364', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (41, '【1991 剧情】置若罔闻 Let Him Have It【树屋字幕组】', '【1991 剧情】置若罔闻 Let Him Have It【树屋字幕组】', 'ec66ad5ffd27ea212addb53abc76fd1c.png', '◎影片简介：\n一宗难以定性的谋杀案震惊了20世纪50年代的英国，在那样一个司法制度不甚健全的年代，也引发了一场全社会对于案件公平性的激烈讨论。19岁的轻度智障少年德里克因为意识到了自己的缺陷于是终日把自己关在屋子里。在姐姐的劝说下终于有一天，他踏出了自己的象牙塔。这本是一件好事，然而，他却结交了一个特殊的朋友——16岁的问题少年克里格。单纯的德里克并没有意识到，从他们成为朋友的第一天起，他的命运就已经注定了一个异常悲惨的结局。少年间的纯粹友谊、家人间浓郁暖心的亲情以及一些严肃普遍的社会问题都在这50年代的英国小城缓缓上演。\n本片在感人至深的同时也令人深思，司法审判的意义究竟是什么？ （树屋字幕组@惊蛰）', 0, 0, 0, 0, '2019-11-09 16:59:43.378347', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (42, '【2019印度/剧情】超级豪华 Super Deluxe【1080P】【网飞官方中字】', '【2019印度/剧情】超级豪华 Super Deluxe【1080P】【网飞官方中字】', '91b3b3da1aad8a6aa7561b53441105dc.png', '#player{display:block}\n$vid=\"mss-1571815525\";$pkey=\"nCzk1Val9bIzmdedJhc77vc577fglQ%2BBYQfsHgiLrBI%3D\";简介：亿万同人字幕组压制\n一位不忠的新婚妻子、一位分居的父亲、一位牧师和一位愤怒的儿子突然发现自己陷入了最意想不到的困境,每个人都准备在一个决定命运的日子里经历自己的命运。\n经典语录：人在着急的时候会穿错左右脚，我就是上帝着急的时候被塞进了男儿身！', 0, 0, 0, 0, '2019-11-09 16:59:43.383358', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (43, '【2019韩国】陪审员们 배심원들【1080P】【亿万同人字幕组】', '【2019韩国】陪审员们 배심원들【1080P】【亿万同人字幕组】', 'e6abafbd62119a1fbb2247f988bfa5c5.png', '#player{display:block}\n$vid=\"msf-1571848487\";$pkey=\"WP2i%2F1xjbJG08RGb0tpDC0EVRw3w831PI%2FA%2Ful1ZnEc%3D\";简介：\n《十二怒汉》韩国版。\n根据2008年韩国首次实施国民参与审判制度的真实事件改编，讲述不知不觉中成为国民陪审团的普通人以他们的方式揭开事件真相的故事。', 0, 0, 0, 0, '2019-11-09 16:59:43.389340', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (44, '【2011冒险/动作】汉娜 Hanna【1080P蓝光】【官方字幕】', '【2011冒险/动作】汉娜 Hanna【1080P蓝光】【官方字幕】', '49dbf3e386615c46379a1c9d867af41f.png', '#player{display:block}\n$vid=\"msr-1571818913\";$pkey=\"Lah8dEYqBuIrSt93ThC9S7ZvvZOu4aE%2Fx5xHyEWVsC4%3D\";简介：亿万同人字幕组压制\n位于北极圈附近的冰原森林，生活着一对平凡却有着非凡身手的父女。父亲艾利克·海勒（艾瑞克·巴纳饰）曾是受雇于CIA的特工，在上世纪90年代活跃于东欧和中亚等地，具有丰富的经验。然而最终却因为某种原因，令他带着女儿汉娜隐居在这人类罕至的寒冷所在。经过十多年的艰苦磨练，汉娜（西尔莎·罗南饰）终于成长为拥有广博知识和出色身手的战斗少女。\n某天，自认已做好准备的汉娜按下了父亲那台信号发射器，不久美国方面便收到消息。艾利克当年的联系人玛丽莎（凯特·布兰切特饰）声称这个消失多年的特工掌握非常敏感的秘密，于是在她的主持下，一场居心叵测的围捕旋即展开。汉娜也已柔弱的身躯投入了血腥的战斗之中……', 0, 0, 0, 0, '2019-11-09 16:59:43.394337', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (45, '【2001加拿大】意乱情迷 Lost and Delirious【1080P】【亿万同人字幕组】', '【2001加拿大】意乱情迷 Lost and Delirious【1080P】【亿万同人字幕组】', '4c057c74a70399c2ec0c6f6695749fbc.png', '#player{display:block}\n$vid=\"msr-1571812739\";$pkey=\"gHTgoEov5WDYfdIPIv%2FKoOBxNGRpjZTQnq%2B01busZZ0%3D\";简介：\n“你爱我”\n“像朋友一样”\n“像恋人！”\n爱的伤痛锥心刺骨，曾经的炙热怎么就轻言放弃，是谁的执念还是谁的怯懦？怎么都敌不过的世俗。\n母亲去世后，玛丽（米莎·巴顿 Mischa Barton饰）就被父亲送到了寄宿学校。在那里，她认识了两个室友，杜丽（杰茜卡·帕尔 Jessica Paré饰）和宝丽（派珀·佩拉博 Piper Perabo饰）。杜丽和宝丽天真活泼，性格开朗，很快，内向忧郁的玛丽就被她们所感染，三人成了好朋友。不久，玛丽就发现杜丽和宝丽两人原来是一对恋人，玛丽觉得这一切都很正常，也就和她们快乐的生活下去。然而一次杜丽的妹妹来找她时发现了姐姐的秘密，于是，流言开始流传。', 0, 0, 0, 0, '2019-11-09 16:59:43.400333', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (46, '【2012剧情】兰花之舞 SOONGAVA【1080P】【亿万同人字幕组】', '【2012剧情】兰花之舞 SOONGAVA【1080P】【亿万同人字幕组】', 'a02c146d9a04f8f7ad41f6ec69ddb979.png', '#player{display:block}\n$vid=\"mss-1571811587\";$pkey=\"1Wkx3zU5ckM13HKv5sXAogHUgHlouJQ7UyFfQMXl8FE%3D\";简介：为了成为传统尼泊尔舞者而接受刻苦训练的年轻女子迪娅，在22岁那年被迫接受了包办婚姻。在婚礼逐渐接近的日子里，她意识到她对未婚夫没有任何感情。而同时，她与女友基兰的深厚友情也逐渐升温，她们开始了一段完全悖离当地风俗与道德的感情。两人决定同居，并因此陷入危险……', 0, 0, 0, 0, '2019-11-09 17:03:11.396434', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (47, '【1997喜剧】晚开的盛花 late bloomers【1080P】【亿万同人字幕组】', '【1997喜剧】晚开的盛花 late bloomers【1080P】【亿万同人字幕组】', '3a11884f8fdea0e5756309062b7dd2a9.png', '#player{display:block}\n$vid=\"msv-1571812677\";$pkey=\"uYwETEUst8ulX3B0Z3F5n%2BBxNGRpjZTQnq%2B01busZZ0%3D\";简介：罗斯福高中就像一般美国郊区的高中一样普普通通.几何学女教师黛关娜,和学校女秘书卡莉,两人双双坠入情网,而且投入这点就让整个校园从平淡无奇的气氛转换成迷惑的情况.故事一开始是卡莉怀疑黛娜和她丈夫有染,所以一直注意黛娜的一举动,结果并不是她所想像.在证实她推论错误后,两人开始成为无话不谈的知心好友,关系越来越亲密,某天瞒不住对彼此的爱慕就在附近的篮球馆里,互诉情衷。', 0, 0, 0, 0, '2019-11-09 17:03:11.421408', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (48, '【2011 纪录】中国人：新贵的秘密 Equidinves.El.cecreto.de.los.nuevos.ricos.', '【2011 纪录】中国人：新贵的秘密 Equidinves.El.cecreto.de.los.nuevos.ricos.', '5142e984d7d589c9c54bdbd809688e2c.png', '◎简介：\n欧亚大陆西端的西班牙里，住着欧亚大陆东端的中国人，这些中国人带来的经济、文化、社会如何影响着西班牙这个古老的欧洲国家？本部纪录片从西班牙社会各个阶层的中国人入手，从西班牙人的角度，了解中国人如何融入，并逐渐改变了西班牙。', 0, 0, 0, 0, '2019-11-09 17:03:11.427404', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (49, '【2012 喜剧】二加二 Dos.Mas.Dos【树屋字幕组】', '【2012 喜剧】二加二 Dos.Mas.Dos【树屋字幕组】', 'e559233abb5b285da460a05887082691.png', '◎简介：\n一个古板传统的诊所医生，在得知自己几十年的合伙人及好朋友跟这位朋友的老婆两个人一起都参加了换妻游戏，会做出什么样的反映？尤其是当这个医生发现自己的老婆也开始对换妻游戏产生兴趣甚至还想把他拉进来，又会发生什么样的事呢？他的老婆提议四个人来一场换妻游戏，作为一个实验，最后又会变成什么样的情况？一部搞笑欢乐又无节操的电影，献给大家~~', 2, 0, 0, 0, '2019-11-09 17:03:11.432401', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (50, '【2013 剧情】生命如此美好 Chce Się Żyć【树屋字幕组】', '【2013 剧情】生命如此美好 Chce Się Żyć【树屋字幕组】', '0e3a46d65fd98943877815a8ee4fc1ad.png', '◎简介：一个四肢扭曲身体残疾不会说话无法与人交流，并且被所有人认为是智障的人历经三十年努力与挣扎向世人证明自己其实心智正常的故事.上帝对他关上了门,连窗也没开,只在墙上留了个针眼,而他把这个针眼凿成了洞.男主角色难度之大表演之精应载入影史\n（来自豆瓣影评）', 0, 0, 0, 0, '2019-11-09 17:03:11.438397', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (51, '【2014 剧情/爱情】蛋糕 Cake【树屋字幕组】', '【2014 剧情/爱情】蛋糕 Cake【树屋字幕组】', 'b17580e1f4b5f5cedaf08e2e8a641cc4.png', '影片简介\n《蛋糕》的剧本由帕特里克·托宾执笔，丹尼尔·巴恩兹执导，詹妮弗·安妮斯顿主演，本·巴恩兹、克里斯汀·哈恩与所罗门监制，施亚姆·马迪拉鲁与马克·坎顿任执行制片。电影讲述的是安妮斯顿将饰演一位尖酸刻薄、滑稽欢闹的女性克莱尔。剧情讲述的是克莱尔陷入了与她同在慢性疼痛俱乐部的另一位女性妮娜的自杀疑云中。随着逐步发现妮娜死亡的真相细节，她亦与妮娜的丈夫发生了一段凄美的爱情。而最后克莱尔或许也将同样迎来她命定的个人悲剧。\n本片中詹妮弗·安妮斯顿以自己独特的表演方式极富张力地展现了一个在灾难中幸免的女性在面对生活时的无奈与抗争。本片也为她赢得了金球奖最佳女主角的提名。', 0, 0, 0, 0, '2019-11-09 17:03:11.443438', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (52, '【2012剧情】再见我的女王Farewell My Queen【1080P蓝光】【官方中字】', '【2012剧情】再见我的女王Farewell My Queen【1080P蓝光】【官方中字】', 'f89fc87ac096cdf4fbeeea94b26430d1.png', '#player{display:block}\n$vid=\"msm-1571638560\";$pkey=\"MSjAinJrvpngrjb4%2BUeF9eGvCtuNToANpQj0XA72kHw%3D\";简介：故事发生在1798年的法国凡尔赛宫，革命的热潮席卷了整个国家，居住在宫中的王公贵族们成为了革命者们攻击的对象。为了保命，很多人决定逃跑，可是皇后玛丽（黛安·克鲁格Diane Kruger饰）却无法放下她高贵的尊严。长久以来，波利内公爵夫人（维吉妮·拉朵嫣Virginie Ledoyen饰）和玛丽皇后保持了暧昧而又亲密的关系，而这一次，保全波利内公爵夫人的性命则成为了玛丽皇后首当其冲需要解决的问题。\n西朵妮（蕾雅·赛杜Léa Seydoux饰）只是一介小小侍女，但她对玛丽皇后的忠臣和爱慕是任何人都无法相比的，即使到了这个紧要关头，她依然希望能够守在玛丽皇后的身边，为她卖命。于是，西朵妮顺理成章的成为了玛丽皇后手中的棋子，而她并不知道，自己将要面临的是怎样的命运。', 0, 0, 0, 0, '2019-11-09 17:03:11.448419', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (53, '【2019西班牙】伊莉莎与玛瑟拉 Elisa and Marcela【1080P】【官方中字】', '【2019西班牙】伊莉莎与玛瑟拉 Elisa and Marcela【1080P】【官方中字】', '1874ed9f3ce9a0f6c63cb8776f8c1b9c.png', '#player{display:block}\n$vid=\"msp-1571581554\";$pkey=\"tYGDuHQn2XZuFeBK9WhwwUEVRw3w831PI%2FA%2Ful1ZnEc%3D\";简介：改编自真实事件。西班牙导演伊莎贝尔·科赛特自编自导的新片。聚焦20世纪初西班牙在圣经的见证下成功举行的第一场在女同性恋婚礼的故事。\n“总有一天，我会给你买匹马的”，温柔的伊莉莎在玛瑟拉的脸颊落下一个暗含羞涩的吻，为了这句承诺得以实现她们不顾一切，即便在遥远的分别之后，也不曾忘记耳畔熟悉的呼吸。“我们彼此相爱，即便是久别重逢，站在你眼前的我仍能心跳加速”，再见的喜悦冲走了苦涩又漫长的相思，她们热烈地拥吻在一起，而接下来等待着她们的是更加艰难的阻隔。她们只希望可以在一起，就这么简单而已，在那样的年代，爱也是要付出代价的，历尽坎坷的两人最后到底能不能如愿在一起？', 0, 0, 0, 0, '2019-11-09 17:03:11.454389', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (54, '【2006德国】情键四分钟【1080P】【网飞官方中英字幕】', '【2006德国】情键四分钟【1080P】【网飞官方中英字幕】', 'b4afa0262b59ecb0224062c2ba6a3512.png', '#player{display:block}\n$vid=\"msn-1571581841\";$pkey=\"rDNHLwwBaJIx5zJ%2BLy%2FqO08lYsO5YcvjbEgmDdSiev0%3D\";简介：在一个阴森的监狱里，执着于音乐的80岁老妇人克鲁格夫人（莫妮卡·布雷多饰），六十年如一日在监狱里开设钢琴课，即使她三年不曾领到薪水，即使她现在只有四个学生。其中三个是犯人，一个是狱警。如果没有杰妮（汉娜·赫斯普朗饰）的出现，克鲁格夫人的钢琴教学生涯将无声无息地终结，尽管她自掏腰包买了一架崭新的三角钢琴、请了调音师调音。幸运的是，酷爱音乐的克鲁格夫人发现了杰妮，一个顶着杀人犯罪名的叛逆女孩。 一开始面对杰妮，克鲁格夫人由拒绝到接受、由轻视到重视、从命令到包容。终于，是神圣的音乐把两个年龄相差几代人、身心都受过深重创伤的女人连结在一起。有一次她听见了这个女孩的演奏。从此下定决心要好好栽培她。为了让杰妮参加比赛，克鲁格夫人忍受了她的坏脾气、甚至不惜帮助她越狱、还把深藏心底的隐秘告诉她。她所做的一切，是所有热爱自己事业的教师都能理解的。 最后，饱受俗世摧残、冲破了重重阻碍的杰妮，在克鲁格夫人以毕生的名誉和自由为代价换来的四分钟里，在音乐的殿堂——德国歌剧院的舞台上，为评委和观众奉献了一场精妙绝伦的钢琴演奏。', 0, 0, 0, 0, '2019-11-09 17:03:11.459386', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (55, '【2019阿根廷】金发男子 Un rubio【1080P】【亿万同人字幕组】', '【2019阿根廷】金发男子 Un rubio【1080P】【亿万同人字幕组】', '2634f89dde83db07d4fd74f325779c3a.png', '#player{display:block}\n$vid=\"msn-1571578427\";$pkey=\"LoiXd8G0kusgA4mTywlZ1QHUgHlouJQ7UyFfQMXl8FE%3D\";简介：柏林影展泰迪熊奖得主、阿根廷”同性电影之光”，最懂男人心、擅长闷骚撩的名导马可·伯格，继《夏威夷》和《跆拳道》后又一神作。Gabriel和同事Juan共租一间公寓。Gabriel曾经结婚并育有一女，Juan则是多情种子，两人朝夕相处，与日俱增的性吸引力，好像回到那青涩爱情初开的情欲纠葛。', 2, 0, 0, 0, '2019-11-09 17:03:11.467381', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (56, '【2005喜剧】四角关系Imagine Me and You【1080P】【亿万同人字幕组】', '【2005喜剧】四角关系Imagine Me and You【1080P】【亿万同人字幕组】', 'c0a3226079a0b75ae9af4c56571d98f8.png', '#player{display:block}\n$vid=\"mss-1571498627\";$pkey=\"VN4uJySZtSvZExViDKOnkuBxNGRpjZTQnq%2B01busZZ0%3D\";简介：瑞秋（派珀·佩拉博 Piper Perabo 饰）终于要嫁给了青梅竹马的男友海克（马修·古迪 Matthew Goode 饰）了，海克英俊温柔体贴忠厚，深深爱着瑞秋，瑞秋以为自己也同样深深爱着海克。婚礼上，就在通往神圣婚姻的红地毯上，瑞秋不经意地向旁边一瞥时，她突然像被闪电击中一样，而她，就是花店老板露丝（琳娜·海蒂 Lena Headey 饰），负责婚礼所有的鲜花。就这样，她们在婚礼上结识，并成为了朋友。虽然瑞秋和露丝彼此爱慕，但是她已经结婚了，而且海克是那么的好，最终瑞秋选择了放弃，露丝也选择了离开。瑞秋的变化被海克看到了眼里，他想给瑞秋幸福，于是，他选择了离开。瑞秋与露丝最终能否有情人终成眷属？', 2, 0, 0, 0, '2019-11-09 17:03:11.472379', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (57, '【1998剧情】吉娅Gia 加长完整版【1080P蓝光】【官方中英字幕】', '【1998剧情】吉娅Gia 加长完整版【1080P蓝光】【官方中英字幕】', '69c23faa5c0839041bdf7505f8ade299.png', '#player{display:block}\n$vid=\"msr-1571492916\";$pkey=\"8V2rA4XJFhv6ri6k%2BKb3GwHUgHlouJQ7UyFfQMXl8FE%3D\";简介：根据真实故事改编。\n又名《霓裳情挑》，讲述了70年代末，80年代初美国超模第一人吉娅·玛丽·卡兰芝曲折华丽的一生。\n18岁的吉娅（安吉丽娜·朱莉饰）被模特经纪人选中，搬到纽约成了一名职业模特，凭借独特的魅力，迅速蹿红，风靡世界。然而，从小在破碎家庭环境下长大的她，即使在事业达到登峰造极的时候，内心仍然感到无比空虚，无处安放，渐渐沉溺毒品，事业也跟着一落千丈……\n如流星一样，划破时尚的夜空，美丽而短暂，现实远比电影残忍，真相总比故事感人，孤独的吉娅一直都在寻找爱的港湾，却从没有结果，留在历史上的背影，始终只有她一人。', 0, 0, 0, 0, '2019-11-09 17:03:11.478375', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (58, '【2007法国】水仙花开 Naissance des pieuvres【亿万同人字幕组】', '【2007法国】水仙花开 Naissance des pieuvres【亿万同人字幕组】', 'b2b6a518b2f118607976b10e2b7429c1.png', '#player{display:block}\n$vid=\"msr-1571409346\";$pkey=\"GOmAVXls307M8MbmbTUtG7cD5Hrjhuw5cr00uiyXVHo%3D\";简介：《燃烧女子的肖像》导演瑟琳·席安玛与女主阿黛拉·哈内尔早年合作的第一部同性影片。\n内心萌动的欲望，热烈躁动的迷恋，青春的伤痛该何去何从。三名15岁的少女玛丽（宝莲·艾格特Pauline Acquart饰）、安妮（露易丝·巴彻雷Louise Blachère饰）和弗罗莉亚娜（阿黛拉·哈内尔Adele Haenel饰）在游泳池的更衣室里有一个秘密。\n一次偶然中，玛丽遇见了花样游泳队的队长弗洛利亚那，弗洛利亚那的性感和美丽很快就吸引了玛丽的目光，然而，在传闻中，弗洛利亚那却并不如表面看来的那么纯洁和美好。随着时间的推移，玛丽渐渐发现传闻的虚假，与此同时，她深深地迷恋上了弗洛利亚那，已经到了无法自拔的境地。安妮是玛丽的好友，在玛丽为弗洛利亚那痴狂的那段日子里，她却偷偷喜欢上了弗洛利亚那的男友弗朗西斯（沃伦·杰坤Warren Jacquin饰）。可是，安妮知道自己长得并不漂亮，于是决定将这份感情埋藏在心底。', 0, 0, 0, 0, '2019-11-09 17:03:11.484371', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (59, '【1989爱情】白色婚礼 Noce blanche【树屋字幕组】', '【1989爱情】白色婚礼 Noce blanche【树屋字幕组】', '3aea528f93d185803cf686171923b234.png', '◎简介：\n中年的弗朗索瓦是名哲学老师，他和风度怡人的妻子在小镇里过着中规中距的生活。然而他的学生，17岁的少女马蒂达出现了，带着同龄人少有的成熟和不羁。 弗朗索瓦带着挽救堕落少女的心走近她，却难以抑制的被马蒂达的热情和聪慧所吸引。他们相爱了，激情四溢，刻骨铭心。可是当马蒂达要求弗朗索瓦离开妻子，与她一起时，弗朗索瓦却犹豫了，他想到了道德，想到了社会对他的认可，想到了妻子对他的爱，狠下心拒绝了马蒂达的要求。然而他却无法阻止自己想念马蒂达。而马蒂达也想要断绝自己跟他的关系，可是她也做不到，尽管她不断的寻求同龄人作为自己的男友，可是这反而更让她无法忘记弗朗索瓦。她还试图让她的朋友们用一些激烈的方式使弗朗索瓦的妻子离开他。最终她做到了，可是也让弗朗索瓦和她的爱情暴露在了整个社会和学生们面前。他们不得不就此分开，永远不能见面。弗朗索瓦因此搬到了一个很远的城市，找了一份工作，一个人生活。然而，这样，就能阻挡他们想念彼此的心吗？马蒂达又去了哪里呢？', 0, 0, 0, 0, '2019-11-09 17:03:11.490366', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (60, '【1999剧情】义犬报恩 A Dog Of Flanders【树屋字幕组】', '【1999剧情】义犬报恩 A Dog Of Flanders【树屋字幕组】', 'c99f5c4f17d9408ac82ae5667ab0a397.png', '◎简介：尼洛和爷爷相依为命，妈妈在一场暴风雪中失去了生命，而爸爸的身份却从来都是一个谜，他和爷爷住在安特卫普镇的北方。爷孙两人靠运送牛奶维生。在教堂里有幅画深深影响着尼洛，让极富绘画天性的他不停的在自己空余的时候练习着画画，渴望着有一天能成为一名伟大的画家。而尼洛在运送牛奶的途中，看到了受到五金行老板虐待，奄奄一息的的佛兰德斯狗帕奇，他和爷爷收留了帕奇，并养好了它的伤，然而，噩运却接连不断的到来，尼洛的爷爷年老死去，凶恶的房东上门催缴房租，自己即将面临被饿死的境地，唯一的希望就寄托在每年一次的佛兰德斯绘画大赛上，优胜者可以得到1000法郎的奖励。但是，小尼洛并不知道，更多的坎坷却还等待着他…', 0, 0, 0, 0, '2019-11-09 17:03:11.498378', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (61, '【2001 剧情/喜剧】夜之女王 Kraljica.noci【树屋字幕组】', '【2001 剧情/喜剧】夜之女王 Kraljica.noci【树屋字幕组】', '4b323ca27d26cceffd54005945a4e1fe.png', '影片简介：\n1968年的克罗地亚，一座看似平静却又十分开放的小镇因为一位大人物行将到来的消息掀起波澜，17岁的少年因而被寄予厚望，他的人生似乎也前途坦荡。但在徐徐的夏季夜风中，少年却因一些私密的难言之隐即将放弃这次比赛，但是母亲时常讲述的一个神秘的夜之女王的故事始终徘徊在他的心中，他也一直在向往着找到自己的夜之女王。令人吃惊的是，小镇上“小有名气”一个妓女竟然成为了他的“女王”，而他的难言之隐竟然也被一并治愈，同时一举参加比赛夺得了冠军！这位神秘的夜之女王到底是一个什么样的女人，而我们的夜之女王又在哪里呢？', 0, 0, 0, 0, '2019-11-09 17:03:11.510355', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (62, '【2013 喜剧/惊悚】苏镇女巫 Las brujas de Zugarramurdi【树屋字幕组】', '【2013 喜剧/惊悚】苏镇女巫 Las brujas de Zugarramurdi【树屋字幕组】', '5a606da876304fa54b05e072a16a80c3.png', '◎简介：\n苏加拉穆尔迪（Zugarramurdi）是西班牙纳瓦拉的一个市镇。影片讲述一群强盗抢劫了一批黄金，试图运到法国去。然而当他们经过一座苏加拉穆尔迪时，不想却落入了女巫的魔咒。影片集结了西班牙最当红的影视明星，包括《非你不可》马里奥·卡萨斯、《性谎言派对》雨果·席尔瓦以及西班牙的国宝级女星卡门·毛拉。后者曾出演影片导演伊格莱希亚的前作《公共财产》（2000）而获得圣塞巴斯蒂安电影节的最佳女演员奖。树屋君感觉这片子拍的就像一个莫名其妙异想天开的梦一样，剧情各种奇幻，当然其中也不乏重口情节，口味稍重哟~本片也获得了当年西班牙”奥斯卡”电影最高奖项戈雅奖。', 0, 0, 0, 0, '2019-11-09 17:04:52.328189', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (63, '【2013 喜剧】黑手党只在夏天杀人 La mafia uccide solo destate【树屋字幕组】', '【2013 喜剧】黑手党只在夏天杀人 La mafia uccide solo destate【树屋字幕组】', '2dcd19bb4e1dd7bfde37abca5da0759c.png', '◎影片简介:\n阿图罗是个出生在西西里的平凡少年，却将自己的身世与黑手党联系在了一起，说成是上天精心安排要他成为意大利二十世纪七、八十年代黑手党横行岁月的见证者。小学的化装舞会上，其他同学都化身为童话人物，他扮的却是他的偶像，当时的总理大臣；热爱政治的他，总有缘与正直反黑的官员与法官相遇，他们却都一一为黑手党暗杀。而他的梦中情人弗洛拉，则成为了他另一个难以释怀的情愫，长大后的他，能否实现自己的梦想。导演用夸张的喜剧形式，表现了黑手党鼎盛时期最普通意大利人民的生活是如何被影响，社会是如何被腐蚀，而意大利人民又是怎样战胜这一切。斑驳的旧影像与虚构的影片相结合，还原给观众最纯正的意大利和最真实的黑手党。', 1, 0, 1, 0, '2019-11-09 17:04:52.336185', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (64, '【2014迪士尼】沉睡魔咒【1080P蓝光】【官方中英字幕】', '【2014迪士尼】沉睡魔咒【1080P蓝光】【官方中英字幕】', 'd80391aed6dd6af1705d90be59c40234.png', '#player{display:block}\n$vid=\"msr-1571295772\";$pkey=\"5bPdg2LpFQAxaVeezzP2yvc577fglQ%2BBYQfsHgiLrBI%3D\";简介：迪姬尼来辣！《沉睡魔咒》从施咒者的角度重新诠释经典童话，昔日的魔女明明是个大坏蛋，但这回倒过来，对公主施咒的魔女成为述说童话的主体。玛琳菲森（安吉丽娜·朱莉饰）是一个美丽纯洁，拥有翅膀能够飞翔的年轻仙子，生长于宁静祥和的森林王国。然而美好的时光总是短暂的，王国突遭人类军队侵袭，玛琳菲森在战斗中逐渐成长为这片森林的守护者，同时也遭受到了无情背叛，从此她的心灵开始变得冷酷，脑海只剩复仇的念头。为了报复，她给人类国王的女儿爱洛公主（艾丽·范宁饰）施下恶咒；然而随着爱洛的成长，玛琳菲森才逐渐意识到——这位小公主不仅能给两个世界带来和平，也许还能给自己带来真正的快乐。\n教母爱之深咒之切，善良公主心系教母，暖心感化暗黑魔女，王子麻烦靠边站！', 0, 0, 0, 0, '2019-11-09 17:04:52.342181', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (65, '【1995美影】校园大冲突 Higher Learning【1080P蓝光】【亿万同人字幕组】', '【1995美影】校园大冲突 Higher Learning【1080P蓝光】【亿万同人字幕组】', 'ef4c8041a55ca93d858f5872cb1acf22.png', '#player{display:block}\n$vid=\"msq-1571233932\";$pkey=\"CutpX%2FxFmwVNAHHVoKEBn0EVRw3w831PI%2FA%2Ful1ZnEc%3D\";简介：美国哥伦比亚大学迎来了一批新生。黑人青年马里克（欧玛·艾普斯 饰）拥有极高的运动天赋，为了得到全额奖学金，他必须拼命训练取得优异成绩。在该校念了六年仍未毕业的老生富吉（艾斯·库珀 饰）的愤世思想深深影响了马里克，他对自己的前途倍感迷茫；白人女孩克莉丝蒂（克里斯蒂·斯旺森 饰）对大学校园的一切都感到新鲜，在一次狂欢醉酒后，她遭到强暴，从此投身于女权运动中；来自爱达荷的白人男孩雷米（迈克尔·拉帕波特 饰）木讷保守，与周遭格格不入，偶然机会他结识了几个光头党的朋友，在偏执的路上越走越远……\n值得一提的是，詹妮弗·康纳利在本片中贡献了第一次同性尺度镜头', 1, 0, 0, 0, '2019-11-09 17:04:52.347179', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (66, '【2018以色列】红牝 Red Cow【亿万同人字幕组】', '【2018以色列】红牝 Red Cow【亿万同人字幕组】', '9c08729fb86da3437be2dc9da26848ac.png', '#player{display:block}\n$vid=\"mst-1571193828\";$pkey=\"D55fXup4N0EdioW6mzVQFrZvvZOu4aE%2Fx5xHyEWVsC4%3D\";简介：“不必支离破碎，我也会有灼烧的感觉，我宁愿化成碎片，寻见可以依靠的肩膀，耶路撒冷在烈火中燃烧，我的家庭四散飘零，是谁点燃了森林?是谁惊扰了逝者?”\n班尼自出生起便失去了母亲，她在虔诚的宗教父亲的关爱下独自长大，自由的耶尔出现在她眼前，激起了心中的渴望，父亲对这些了如指掌，由信徒们敬畏的他怎么能够接受得了这两个在耶路撒冷下的女人的禁忌之恋呢?在宗教父权的压迫下，她，她们该何去何从，将面临怎样的后果?班尼是否又会像那只被暂时侍奉的红毛牛犊一样，囚在圈栏里，只为那个所谓的救赎，孤独地等待着消逝的那天……', 2, 0, 1, 0, '2019-11-09 17:04:52.352176', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (67, '【2019动画】狮子王 The Lion King (真狮版)【中英双字】', '【2019动画】狮子王 The Lion King (真狮版)【中英双字】', 'efab1f46bf840de9f5dce159f1f86cd5.png', '#player{display:block}\n$vid=\"ftn-1570934426\";$pkey=\"5MSPnXSt%2FOwwEjtiwoiEd08lYsO5YcvjbEgmDdSiev0%3D\";非洲大草原上一轮红日冉冉升起，为高大的乞力马扎罗山披上层金色的光纱，所有的动物涌向了同一个地方——荣耀石，兴奋地等待着一个重大消息的宣布：它们的国王木法沙将迎来自己的新生儿。', 0, 0, 0, 0, '2019-11-09 17:04:52.359173', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (68, '【2019恐怖】小丑回魂2【1080P】【远鉴字幕组】', '【2019恐怖】小丑回魂2【1080P】【远鉴字幕组】', '89e0f4e6d829d4ccf01a1782a0e63cb0.png', '#player{display:block}\n$vid=\"ftn-1570843380\";$pkey=\"C5sgcUrSrR1YQ4mXF2%2FzAk8lYsO5YcvjbEgmDdSiev0%3D\";故事发生在1989年夏季事件的27年后，失败者俱乐部成员已经长大并搬走了，直到一个不详的电话把他们召回缅因州的德利镇，对抗他们古老、会变形的敌人—跳舞小丑潘尼怀斯。', 60, 8, 3, 0, '2019-11-09 17:04:52.364169', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (69, '【韩影】柳烈的音乐专辑【1080P】【神叨字幕组】', '【韩影】柳烈的音乐专辑【1080P】【神叨字幕组】', '3f38ef6e921da65b97e93622eacc72db.png', '#player{display:block}\n$vid=\"ftn-1570787744\";$pkey=\"gNB6zDiBhxFeHcvkUTYPFQHUgHlouJQ7UyFfQMXl8FE%3D\";主演: 金高银 / 丁海寅 / 朴海俊 / 金国熙 / 郑幼贞 / 崔俊英。在韩国上世纪末的IMF时期，通过“柳烈的音乐专辑”广播电台发送自己的故事渐渐产生爱情的美洙（金高银饰）和玄雨（丁海寅饰）之间的浪漫故事', 0, 0, 0, 0, '2019-11-09 17:04:52.369182', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (70, '【日语电影】西北西 2019【亿万同人&橘里橘气译制组】', '【日语电影】西北西 2019【亿万同人&橘里橘气译制组】', 'd8121a99b633703d5fe8d7f8a20d3539.png', '#player{display:block}\n$vid=\"jda-1570630874\";$pkey=\"GyR1zXfZpgyZkWRL6H%2B6lU8lYsO5YcvjbEgmDdSiev0%3D\";一群年轻人，挣扎于不安的生活，对前途的迷茫。Kei与爱人Ai的关系有了一种不安全感，当她遇见伊朗学生Naima后，Kei重新思考自己的生活。看到Naima如此真实和虔诚的对待自己的生活，Kei受到影响，自己的生活也开始有所变化。', 2, 0, 1, 0, '2019-11-09 17:04:52.374164', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (71, '【2019意大利】少年黑手党【1080P】【奇遇字幕组】', '【2019意大利】少年黑手党【1080P】【奇遇字幕组】', '1f6d45069cb9dca310e9dd0b38580e7c.png', '#player{display:block}\n$vid=\"mso-1569562573\";$pkey=\"Yj68HgvzekR3UdVMJUaiD%2BGvCtuNToANpQj0XA72kHw%3D\";一群十几岁的男孩拿着手枪和AK-47在那不勒斯的街道上巡逻，以执行他们的暴徒头目的命令。', 4, 0, 1, 0, '2019-11-09 17:04:52.379177', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (72, '【2019韩影】柳烈的音乐专辑【1080P】【小玩剧】', '【2019韩影】柳烈的音乐专辑【1080P】【小玩剧】', '01f9a9f0440d57656d3b72eb6ae971e9.png', '#player{display:block}\n$vid=\"tbm-1569394623\";$pkey=\"igC16QvSnIqr3l9S3FiOqbcD5Hrjhuw5cr00uiyXVHo%3D\";讲述在韩国上世纪末的IMF时期，两个如同广播节目中流淌出的歌曲般偶然相遇的人，经过长时间的反复交错，爱情在这一过程中萌芽的故事。', 1, 0, 1, 0, '2019-11-09 17:04:52.385170', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (73, '【2019恐怖】鬼娃回魂 Child’s Play【1080P】【人人影视】', '【2019恐怖】鬼娃回魂 Child’s Play【1080P】【人人影视】', 'a9613a4ea598679bfb38c81806ed5934.png', '#player{display:block}\n$vid=\"ftn-1569221079\";$pkey=\"smBazeK8GE8746Q7PxGxVOdIGfAa4ARdh9TlfO7aVqU%3D\";重启版《鬼娃回魂》，凶险公仔Chucky全新回归！\n该片基于1988年的原版，新版设定在现代，主角是一群小孩，一个基于人工智能可万物互联的玩偶进入了他们的世界，引发一系列灾难。奥布瑞·普拉扎饰演的母亲送给自己儿子一个公仔作为生日礼物，却对公仔凶险的本性毫不知情。', 0, 0, 0, 0, '2019-11-09 17:04:52.390164', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (74, '【动作/犯罪】速度与激情：特别行动【1080P】【中英字幕】', '【动作/犯罪】速度与激情：特别行动【1080P】【中英字幕】', 'a627283e58a1d1f2e6470d761888248c.png', '#player{display:block}\n$vid=\"tbm-1570049872\";$pkey=\"1WRMNZjJLKo42AFRmyXa5eBxNGRpjZTQnq%2B01busZZ0%3D\";“速度与激情”系列第一部外传电影，由大卫·雷奇执导，克里斯·摩根撰写剧本，道恩·强森、杰森·斯坦森、凡妮莎·柯比、伊德瑞斯·艾尔巴、艾莎·冈萨雷斯等主演。故事以道恩·强森饰演的外交安全局特工卢克斯·霍布斯、以及杰森·斯坦森饰演了雇佣兵杀手德卡特·肖为主角，不再关注飞车家族。', 0, 0, 0, 0, '2019-11-09 17:04:52.395181', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (75, '【2019韩影】变身 변신【1080P】【小玩剧】', '【2019韩影】变身 변신【1080P】【小玩剧】', '57f04bbc3c63e6d13716e6f2a6e02bc8.png', '#player{display:block}\n$vid=\"tbm-1568961620\";$pkey=\"ruoR5eEVXcihDIGUq2kXUPc577fglQ%2BBYQfsHgiLrBI%3D\";又是一部南韩驱魔片…讲述了一个神父为了打败折磨家人的恶鬼而展开的故事。', 2, 0, 2, 0, '2019-11-09 17:04:52.402147', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (76, '【2019动画】玩具总动员4 Toy Story 4【英语中字】', '【2019动画】玩具总动员4 Toy Story 4【英语中字】', 'a5b36321d89e611c2329eb7e7310d409.png', '#player{display:block}\n$vid=\"ftn-1568807513\";$pkey=\"vhDf7P9oLvRHcew8v1yEO%2BGvCtuNToANpQj0XA72kHw%3D\";胡迪深知自己在这个世界上的使命，就是照顾他的主人，无论是原来的安迪还是新主人邦妮。当邦妮将不情愿成为玩具的“叉叉”带回家时，胡迪又担起了教导叉叉接受自己新身份的责任。 然而当邦妮将所有玩具带上房车家庭旅行时，胡迪与伙伴们将共同踏上全新的冒险之旅，领略房间外面的世界有多广阔，甚至偶遇老朋友牧羊女。在多年的独自闯荡中，牧羊女已经变得热爱冒险，不再只是一个精致的洋娃娃。正当胡迪和牧羊女发现彼此对玩具的使命的意义大相径庭时，他们很快意识到更大的威胁即将到来……', 7, 0, 2, 0, '2019-11-09 17:04:52.409143', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (77, '【2019惊悚】我的天使【1080P】【中英双字】', '【2019惊悚】我的天使【1080P】【中英双字】', '0258d5d04d0d0a1f7634211f574fb45f.png', '#player{display:block}\n$vid=\"ftn-1568611249\";$pkey=\"fuQqjy5%2BtlxNYAUvStka1udIGfAa4ARdh9TlfO7aVqU%3D\";劳米·拉佩斯将主演心理剧情新片《我的天使》(Angel of Mine)，金·法兰特(《陌生之地》)执导，卢克·戴维斯(《雄狮》)和大卫·里格(泽克和路德)编写剧本。基于2008年法国电影《天使的印记》，围绕一位母亲莉兹展开，几年前她失去了女儿，仍在应对悲剧带来的疼痛，她开始确信一位陌生人的女儿就是她的骨肉。随着她对这一理论的痴迷度日益增长，她与这个小女孩的生活越发纠缠不清，失去了与现实的接触。该片4月开拍。', 41, 0, 3, 0, '2019-11-09 17:04:52.415140', 1, 0, 0, 5, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (78, '【美国动画】辛普森一家 S30E03 双语精效【神迹字幕组】', '【美国动画】辛普森一家 S30E03 双语精效【神迹字幕组】', 'fe4cedc6606a889affac143d1bf696f7.png', '#player{display:block}\n$vid=\"mso-1549781909\";$pkey=\"tA0pZdEeyjiVfOo6WsAsbt0EKfVEn6G%2BlPYQCpO%2FBi4%3D\";【辛普森一家 S30E03 中英双语/特效字幕】从古到今，国内外都讨论过神的话题，有无数的历史、电影电视剧可以为此提供佐证。上至帝王跪求仙丹下至百姓跪拜灶王爷，都相信神与我们同行。这集20分钟的动画片用片段式故事的情节讲述玄之又玄的话题。没有讨论有没有，不探讨在不在，而是直接假定前提：上帝在看着我们，并挑选出他的信徒。', 0, 0, 0, 0, '2019-11-09 17:31:16.221322', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (79, '【美国动画】辛普森一家 S30E02 双语精效【神迹字幕组】', '【美国动画】辛普森一家 S30E02 双语精效【神迹字幕组】', 'b4a85d39a78bfe6b862b190f99bb42b9.png', '#player{display:block}\n$vid=\"msi-1549200010\";$pkey=\"1J%2BcO9BeDR8fuHrNSqPfC90EKfVEn6G%2BlPYQCpO%2FBi4%3D\";Bart和Lisa试图怂恿父母参加他们狂热追捧很多年，以至于熟知每个套路的大型户外冒险综艺《奇妙大本营》。多次鼓励未果，Marge主动向孩子们讲述了一个悲伤的故事，他们已经好几十次向节目组发出申请，但全部落空……\n被他们的执着精神打动，两个孩子对父母多年来录制的拆信影像进行编辑，以46次的申请失败纪录为由，终于让节目组看到了辛普森夫妇的卖点，让Marge达成心愿。哪怕需要签署高达几十厘米的各种各样的生死状，夫妻俩依然开开心心地奔赴了录制现场。\n哪知道天有不测风云，他们虽然是节目专家，却因为Homer的小失误，在第一次录制中就惨遭淘汰。基于严格的保密协议，两人竟在被禁止和外界联系后，软禁度假酒店一直到本季节目录制全部完成。\n哪怕吃喝玩乐住宿全包，怀有获得节目大赢家梦想的Marge还是渐渐抑郁，后期还化身祥林嫂，对每一个人抱怨Homer的不靠谱。在酒店这个封闭的小社会，两人的感情一步步走向破裂的边缘……', 0, 0, 0, 0, '2019-11-09 17:31:16.229369', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (80, '【美国动画】辛普森一家 S30E01 双语精效【神迹字幕组】', '【美国动画】辛普森一家 S30E01 双语精效【神迹字幕组】', 'd61c158823e5295d101f945a66e68680.png', '#player{display:block}\n$vid=\"msl-1548333718\";$pkey=\"jZiUZxPGE5hYKCLc1nnyCOGvCtuNToANpQj0XA72kHw%3D\";神迹的辛普森一家开更第30季了！让我们热烈祝贺春田镇和辛普森家的30岁生日！\n[第1集]\nBart拒绝了音乐节上同学意图怂恿他对Lisa进行的恶作剧挑战，因此惨遭校园内舆论暴力。深受刺激的Bart在家人的陪伴下开始了自己的极限挑战之旅……然后他身受重伤住进的医院。因为要骗过妈妈而自我启发的天堂经历转瞬让Bart成为时事名人，甚至招来了电影制作商，终于让辛普森一家的生活天翻地覆。之后的经历让Bart渐渐后悔撒谎，因为一个谎言需要100个来圆。经过精心营销的电影在世界各地集体上映，票房很快破亿。良心和精神饱经煎熬的辛普森一家最后在媒体前说出了Homer一手主导的骗局真相，世界也从奇迹的营销中清醒，人们重新关注人间的疾苦而不是天堂的安乐。死后的辛普森一家也因为早早赎罪成功踏入他们编织的天堂。', 0, 0, 0, 0, '2019-11-09 17:31:16.235314', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (81, '【百合动漫】终将成为你 EP12【弯弯字幕组】', '【百合动漫】终将成为你 EP12【弯弯字幕组】', '46126c2f8d8a6a6e3cbad55952188420.png', '#player{display:block}\n$vid=\"msa-1545415250\";$pkey=\"uJ1NTvKY2xJTlWpgT3CylEEVRw3w831PI%2FA%2Ful1ZnEc%3D\";第12集剧情简介：合宿结束，将灯子的反常看在眼里的侑，面对无法做真正的自己的灯子，找到了暦……', 0, 0, 0, 0, '2019-11-09 17:31:16.240327', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (82, '【百合动漫】终将成为你 EP11【弯弯字幕组】', '【百合动漫】终将成为你 EP11【弯弯字幕组】', '8af8d8d23683fd51a4abca366474d81b.png', '#player{display:block}\n$vid=\"msa-1544834051\";$pkey=\"1GxsPACFmdXU1A836Yt%2FULZvvZOu4aE%2Fx5xHyEWVsC4%3D\";第11集剧情介绍：三天两夜的学生会合宿开始了，而从箱崎老师请来指导表演的毕业生市谷那里，灯子得知了一些前所未闻的信息……', 13, 0, 0, 0, '2019-11-09 17:31:16.245311', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (83, '【百合动漫】终将成为你 EP10【弯弯字幕组】', '【百合动漫】终将成为你 EP10【弯弯字幕组】', 'd4e66ed3da2b44a86eca3cb0df1cc5ea.png', '#player{display:block}\n$vid=\"msa-1544210062\";$pkey=\"jAQhUAWJyCUltyoXr6kxlU8lYsO5YcvjbEgmDdSiev0%3D\";学生会要合宿啦！三天两晚一直在一起哦[笑而不语]', 0, 0, 0, 0, '2019-11-09 17:31:16.250321', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (84, '【美漫】南方公园 South Park S22E05【人人影视】', '【美漫】南方公园 South Park S22E05【人人影视】', '086afc206e8c4ae8fd1d013e25c5f2a0.png', '#player{display:block}\n$vid=\"msa-1543978475\";$pkey=\"qq8ltASuDj8lgHEey%2FVjjQHUgHlouJQ7UyFfQMXl8FE%3D\";Comedy Central再次宣布直接续订《南方公园》三季。', 0, 0, 0, 0, '2019-11-09 17:31:16.256304', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (85, '【BD1080P】美少女战士 012【Little字幕组】', '【BD1080P】美少女战士 012【Little字幕组】', '5a0d2a194be01b3ce30fe3969c800279.png', '#player{display:block}\n$vid=\"msa-1543751921\";$pkey=\"cWbFUI9XsEgpl%2B5%2BWOeNleBxNGRpjZTQnq%2B01busZZ0%3D\";美丽可爱的月野兔（三石琴乃 配音）是一名正救读初中的女孩，她学业平平，任性娇弱，俨然是生活在大都会普普通通的女孩子们中的平凡一员。可是，在遇到了那只会说话的小猫露娜之后，月野的人生发生天翻地覆的变化。她不仅可以变身成为拥有神奇能力的水手月亮，还渐渐知晓了自己前世今生的秘密。为了保卫地球，挫败黑暗帝国的野心，月野和水野亚美（久川绫 配音）、火野丽（富泽美智惠 配音）、木野真琴（篠原惠美 配音）、爱野美奈子（深见梨加 配音）等人结成美少女战士，与罪恶展开了连番激战，在此过程中，她与命中注定的爱人地场卫（古谷彻 配音）的浪漫恋情也悄然上演……\n本片根据漫画家武内直子的经典同名原著改编。', 0, 0, 0, 0, '2019-11-09 17:31:16.261310', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (86, '【百合动漫】终将成为你 EP1-EP8【弯弯字幕组】', '【百合动漫】终将成为你 EP1-EP8【弯弯字幕组】', '3f1066ef18f8f39b6253654db0f9325b.png', '不明白与人恋爱的心情，为此感到烦恼的小糸侑，邂逅的学生会成员七海灯子，不论被谁告白，都无法喜欢上对方。与灯子感到共鸣的侑，将自己的烦恼坦诚相告……\n在线播放\nEP1EP2EP3EP4EP5EP6EP7EP8\n$pkey=\"SKH7tuaPGMTwQxk4cZe7FQgACPpStKxG8uC2UGUtgs8%3D\";', 0, 0, 0, 0, '2019-11-09 17:31:16.273334', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (87, '【百合动漫】终将成为你 EP9【弯弯字幕组】', '【百合动漫】终将成为你 EP9【弯弯字幕组】', '02636c4495fc84e5bb5376aa0bf29bd0.png', '#player{display:block}\n$vid=\"msa-1543605094\";$pkey=\"%2F7bblZSQX22xNqRHX8XkdrcD5Hrjhuw5cr00uiyXVHo%3D\";定下体育祭后要给灯子kiss奖励的侑，事到临头却犹豫了，面对灯子无奈下的主动，却又说舒服并主动回应…', 0, 0, 0, 0, '2019-11-09 17:31:16.283372', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (88, '【美漫】南方公园 South Park S22E04【人人影视】', '【美漫】南方公园 South Park S22E04【人人影视】', '7732b802809a8504a4cd85c1d1b0adf1.png', '#player{display:block}\n$vid=\"tzp-1541341678\";$pkey=\"v7Rw9%2FcFgY4LQqT%2F3iplVedIGfAa4ARdh9TlfO7aVqU%3D\";Comedy Central再次宣布直接续订《南方公园》三季。', 1, 0, 0, 0, '2019-11-09 17:31:16.288382', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (89, '【美漫】南方公园 South Park S22E01-E03【人人影视】', '【美漫】南方公园 South Park S22E01-E03【人人影视】', '5d3a3ae3de63323627d277435b2c40fc.png', 'Comedy Central再次宣布直接续订《南方公园》三季。\n在线播放\n010203\n$pkey=\"%2Fq12%2BkXD%2FNMMjAqrBEDtsQnWjjo0ut62a11VQz7hOcU%3D\";', 0, 0, 0, 0, '2019-11-09 17:31:16.294401', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (90, '【BD1080P】美少女战士 011【Little字幕组】', '【BD1080P】美少女战士 011【Little字幕组】', 'a6937ed1d37b41bf7b714d4025883b1e.png', '#player{display:block}\n$vid=\"tlp-1538798447\";$pkey=\"T7VMPBL36c9wLExrLEvJ7%2Fc577fglQ%2BBYQfsHgiLrBI%3D\";美丽可爱的月野兔（三石琴乃 配音）是一名正救读初中的女孩，她学业平平，任性娇弱，俨然是生活在大都会普普通通的女孩子们中的平凡一员。可是，在遇到了那只会说话的小猫露娜之后，月野的人生发生天翻地覆的变化。她不仅可以变身成为拥有神奇能力的水手月亮，还渐渐知晓了自己前世今生的秘密。为了保卫地球，挫败黑暗帝国的野心，月野和水野亚美（久川绫 配音）、火野丽（富泽美智惠 配音）、木野真琴（篠原惠美 配音）、爱野美奈子（深见梨加 配音）等人结成美少女战士，与罪恶展开了连番激战，在此过程中，她与命中注定的爱人地场卫（古谷彻 配音）的浪漫恋情也悄然上演……\n本片根据漫画家武内直子的经典同名原著改编。', 1, 0, 0, 0, '2019-11-09 17:31:16.299399', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (91, '【BD1080P】美少女战士 010【Little字幕组】', '【BD1080P】美少女战士 010【Little字幕组】', '15e2742c10707fc0ac431f5a4b092af0.png', '#player{display:block}\n$vid=\"typ-1533152256\";$pkey=\"1yCLqcUhiZUIWREDFZayOxmaARZtMQKHdWdoy8Jn8Ck%3D\";美丽可爱的月野兔（三石琴乃 配音）是一名正救读初中的女孩，她学业平平，任性娇弱，俨然是生活在大都会普普通通的女孩子们中的平凡一员。可是，在遇到了那只会说话的小猫露娜之后，月野的人生发生天翻地覆的变化。她不仅可以变身成为拥有神奇能力的水手月亮，还渐渐知晓了自己前世今生的秘密。为了保卫地球，挫败黑暗帝国的野心，月野和水野亚美（久川绫 配音）、火野丽（富泽美智惠 配音）、木野真琴（篠原惠美 配音）、爱野美奈子（深见梨加 配音）等人结成美少女战士，与罪恶展开了连番激战，在此过程中，她与命中注定的爱人地场卫（古谷彻 配音）的浪漫恋情也悄然上演……\n本片根据漫画家武内直子的经典同名原著改编。', 0, 0, 0, 0, '2019-11-09 17:31:16.304411', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (92, '【BD1080P】美少女战士 009【Little字幕组】', '【BD1080P】美少女战士 009【Little字幕组】', 'af752513d913a8558a34325a3386f142.png', '#player{display:block}\n$vid=\"typ-1530300136\";$pkey=\"rzT5kSW3FiTrnBcgoyykBhmaARZtMQKHdWdoy8Jn8Ck%3D\";美丽可爱的月野兔（三石琴乃 配音）是一名正救读初中的女孩，她学业平平，任性娇弱，俨然是生活在大都会普普通通的女孩子们中的平凡一员。可是，在遇到了那只会说话的小猫露娜之后，月野的人生发生天翻地覆的变化。她不仅可以变身成为拥有神奇能力的水手月亮，还渐渐知晓了自己前世今生的秘密。为了保卫地球，挫败黑暗帝国的野心，月野和水野亚美（久川绫 配音）、火野丽（富泽美智惠 配音）、木野真琴（篠原惠美 配音）、爱野美奈子（深见梨加 配音）等人结成美少女战士，与罪恶展开了连番激战，在此过程中，她与命中注定的爱人地场卫（古谷彻 配音）的浪漫恋情也悄然上演……\n本片根据漫画家武内直子的经典同名原著改编。', 0, 0, 0, 0, '2019-11-09 17:31:16.309408', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (93, '东京食尸鬼 第三季 12 最终话', '东京食尸鬼 第三季 12 最终话', '08f3b9b5e43e5bcd8e3402764942a8c5.png', '#player{display:block}\n$vid=\"tzp-1529892369\";$pkey=\"d6nHC1%2B0BDG2ti0TZwydohmaARZtMQKHdWdoy8Jn8Ck%3D\";東京喰種トーキョーグール：re（B站港澳台地区繁中字幕版本）', 2, 0, 1, 0, '2019-11-09 17:31:16.315391', 1, 0, 0, 6, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (94, '【韩综】新西游记5 E03 精校中字【神迹字幕组】', '【韩综】新西游记5 E03 精校中字【神迹字幕组】', 'f698fbca1b900c99286e879d7f254821.png', '#player{display:block}\n$vid=\"tzp-1539957835\";$pkey=\"qpj5Vn%2FjxUaHryFXkGiG1udIGfAa4ARdh9TlfO7aVqU%3D\";六个鬼神来到香港街头，感受具有当地风土人情“深度游”，不过与以往不同的是 这期强烈建议在零食的配合下食用，但请勿摄入容易喷射出具有杀伤力的食物，毕竟 搞笑也是历届的哟~', 0, 0, 0, 0, '2019-11-09 17:41:07.781706', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (95, '【韩综】新西游记第5季【神叨字幕组】', '【韩综】新西游记第5季【神叨字幕组】', 'e5361c0bd27e0f20f37926a33f3ba5b9.png', '主演: 姜虎东 / 李寿根 / 殷志源 / 安宰贤 / 宋旻浩 / 表志勋。\n在线播放\n第1期第2期第3期第4期第5季第5期-第6季第1期\n$pkey=\"RPUOAqV%2FWvrVYFxFR0rUPwnWjjo0ut62a11VQz7hOcU%3D\";', 3, 0, 0, 0, '2019-11-09 17:41:07.797769', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (96, '【韩综】睡衣朋友 E05中字【神迹字幕组】', '【韩综】睡衣朋友 E05中字【神迹字幕组】', '71131552594be1c4310e0c81b5289084.png', '#player{display:block}\n$vid=\"tzp-1539477938\";$pkey=\"KRpo9mPOMvPSpIA%2B2aTBJ%2Fc577fglQ%2BBYQfsHgiLrBI%3D\";睡衣朋友的酒店旅行背后故事大公开！充满惊喜的自拍影像，度假前整理行李的小秘诀？宇宙少女们的脚美甲实情？姐妹们的各种“温馨”互动，聊不完的琐碎生活~嘘~我们来偷听plmm们的小秘密啦~(灬°ω°灬)', 2, 0, 0, 0, '2019-11-09 17:41:07.802781', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (97, '【韩综】新西游记5 181007 E02 精校中字【神迹字幕组】', '【韩综】新西游记5 181007 E02 精校中字【神迹字幕组】', '39cdbd9720b2265c4c7c238941a4ba3f.png', '#player{display:block}\n$vid=\"tlp-1539418898\";$pkey=\"DVNiCqtOY1TzRAzg34f%2FzkEVRw3w831PI%2FA%2Ful1ZnEc%3D\";鬼神们的香港之旅正式开启！\n不知道诸（鬼）神能不能充分享受这著名的时尚美食之都香港呢？大家一起来查收鬼怪们的学习情况吧～\n※注 看完之后记得摸一下自己的头是否还在脖子上哦！', 0, 0, 0, 0, '2019-11-09 17:41:07.808764', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (98, '【韩综】睡衣朋友 E1-E4 精校【神迹字幕组】', '【韩综】睡衣朋友 E1-E4 精校【神迹字幕组】', '581a17aedfa365d03efaa26e2f53fc74.png', '出演:宋智孝/张允珠/朴秀荣(JOY)/程潇\n敢问哪个女孩子不想在kingsize床上醒来，穿着小礼服画着精致的妆，与闺蜜一起吃牛排聊八卦，享受装着红酒的高脚杯碰撞时清脆的声响!就让 带你享受极致的酒店度假吧\n在线播放\nE01E02E03E04\n$pkey=\"Xk8%2BcMkQNeaPpLR%2FvPqrJK1aMPskEiyX%2FWOUgw14r54%3D\";', 1, 0, 0, 0, '2019-11-09 17:41:07.813803', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (99, '【韩综】新西游记5 180930 E01 精校中字【神迹字幕组】', '【韩综】新西游记5 180930 E01 精校中字【神迹字幕组】', 'b032a47ce5d17dc8ccca415fe2814466.png', '#player{display:block}\n$vid=\"tlp-1538647343\";$pkey=\"J6kh50TidrtCrgVgsBGdDE8lYsO5YcvjbEgmDdSiev0%3D\";新西游记5 与(鬼)神同行 嘉宾:姜虎东、李寿根、殷志源、安宰贤、宋旻浩、表志勋。\n由罗威出品的’六个鬼神的神鬼综’终于来了！看完之后 妈妈再也不用担心我怕鬼啦～\n准备好进入笑抽模式了么！\n制作:神迹字幕组', 0, 0, 0, 0, '2019-11-09 17:41:07.819803', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (100, '【韩综】Produce48【1080P中字】【神叨字幕组】', '【韩综】Produce48【1080P中字】【神叨字幕组】', 'a90cc5cf240e481c5d1d30d4f8da66e0.png', '《Produce48》是将《Produce101》和AKB48的模式相结合的选秀节目，将通过该节目打造出在韩、日两国活动女子组合。\n在线播放\n第1集第2集第3集第4集第5集第6集第7集第8集第9集第10集第11集第12集上部第12集下部完\n$pkey=\"wPWsmuuTKHBg1X6xvMnP7vwLjcKH6g83wdXd2zJ49p8%3D\";', 0, 0, 0, 0, '2019-11-09 17:41:07.824800', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (101, '【Team德光老爷】横山由依（AKB48）的优雅巡礼 京都色彩日记13-24', '【Team德光老爷】横山由依（AKB48）的优雅巡礼 京都色彩日记13-24', 'c82637f6d4db95ce1c1e472b3635ac62.png', '横山由依（AKB48）的优雅巡礼是关西台于2012年7月18日开播，每月播放一集,由出身于京都府的横山实地走访故乡的名胜，介绍京都当地的传统文化的节目。\n第二季《京都 色彩日记》则改以“颜色”作为核心话题，每集末尾维持第一季“由依的日记”小环节，但是以横山手绘的绘图日记来回顾并总结该集内容。', 5, 0, 1, 0, '2019-11-09 17:41:07.829798', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (102, '【Team德光老爷】横山由依（AKB48）的优雅巡礼 京都色彩日记第一季', '【Team德光老爷】横山由依（AKB48）的优雅巡礼 京都色彩日记第一季', '89401af077cf2b41f7230a6c64450516.png', '横山由依（AKB48）的优雅巡礼是关西台于2012年7月18日开播，每月播放一集,由出身于京都府的横山实地走访故乡的名胜，介绍京都当地的传统文化的节目。\n第二季《京都 色彩日记》则改以“颜色”作为核心话题，每集末尾维持第一季“由依的日记”小环节，但是以横山手绘的绘图日记来回顾并总结该集内容。', 0, 0, 0, 0, '2019-11-09 17:41:07.833804', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (103, '【幻想乐园字幕组】180622 Produce48 EP02', '【幻想乐园字幕组】180622 Produce48 EP02', 'ebd560adb25af4373882d7a8c188d7e5.png', '#player{display:block}\n$vid=\"typ-1530399847\";$pkey=\"B5lK7us4REWdB%2BiatVb3xRmaARZtMQKHdWdoy8Jn8Ck%3D\";\n本系列视频搬运已获得幻想乐园字幕组授权\n《PRODUCE 48》（韩语：프로듀스 48）是韩国Mnet在2018年推出，由韩国多家经纪公司、以及日本AKB48集团两方的旗下艺人共同演出的选拔／生存实境节目，为《PRODUCE 101》系列节目的第三季\n。参赛者在节目中将会同吃同住、完成各种任务。选拔方式与前作相同，参赛者国籍与赛制并无相关，仅限韩国观众可参与投票，最后获选的12名成员将会组成一个团体，以该团体身份活动2年6个月。', 6, 1, 1, 0, '2019-11-09 17:41:07.839794', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (104, '【幻想乐园字幕组】180615 Produce48 EP01', '【幻想乐园字幕组】180615 Produce48 EP01', '4efa6b45c3bb219f6914568078da6535.png', '#player{display:block}\n$vid=\"typ-1530395144\";$pkey=\"UbNkDm%2BnW8jN2chE9nEeTRmaARZtMQKHdWdoy8Jn8Ck%3D\";\n本系列视频搬运已获得幻想乐园字幕组授权\n《PRODUCE 48》（韩语：프로듀스 48）是韩国Mnet在2018年推出，由韩国多家经纪公司、以及日本AKB48集团两方的旗下艺人共同演出的选拔／生存实境节目，为《PRODUCE 101》系列节目的第三季\n。参赛者在节目中将会同吃同住、完成各种任务。选拔方式与前作相同，参赛者国籍与赛制并无相关，仅限韩国观众可参与投票，最后获选的12名成员将会组成一个团体，以该团体身份活动2年6个月。', 1, 0, 0, 0, '2019-11-09 17:41:07.845788', 1, 0, 0, 7, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (105, '【泰语MV】诚【弯弯字幕组】', '【泰语MV】诚【弯弯字幕组】', '5b9fb64e68ed025e39543c7fae591c9f.png', '#player{display:block}\n$vid=\"jda-1562940469\";$pkey=\"1cT8oB5CJoadYkGPntYuet0EKfVEn6G%2BlPYQCpO%2FBi4%3D\";“爱贵以诚”\n本来我们在一起就要付出比常人更多的艰辛，愿以诚相待，我把心里的欢喜，把心底里的星星，写成诗、谱成歌，放在这里了。', 0, 0, 0, 0, '2019-11-09 17:43:35.942376', 1, 0, 0, 8, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (106, 'ARASHI 2013~2017 演唱会合集【DYZ海钓部】', 'ARASHI 2013~2017 演唱会合集【DYZ海钓部】', '51ac98943ca7960259bc72a3d0c6ba2d.png', 'ARASHI live tour 2013~2017 合集', 0, 0, 0, 0, '2019-11-09 17:43:35.950369', 1, 0, 0, 8, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (107, '大野智 solo合集【DYZ海钓部】', '大野智 solo合集【DYZ海钓部】', '4d2760cdd223b501ca5de8a785ef5be5.png', '海钓部出品的大野智solo合集大放送！\n醉人的声线，诱人的舞姿，配合海钓部精心制作的特效字幕，祝大家食用愉快！', 1, 0, 0, 0, '2019-11-09 17:43:35.956367', 1, 0, 0, 8, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (108, '【Team德光】190205 AKB48 横山由依26岁生诞祭', '【Team德光】190205 AKB48 横山由依26岁生诞祭', 'b2fff5cd18bd254b9c70a6de7966146a.png', '总是迟到，但不会缺席的生诞祭~笑~', 0, 0, 0, 0, '2019-11-09 17:43:35.961378', 1, 0, 0, 8, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (109, '【Team德光】横山由依solo con~実物大の希望~', '【Team德光】横山由依solo con~実物大の希望~', 'acf8eb72435c760239e862dbeabe23db.png', '【Team德光老爷我很冷静】横山由依ソロコンサート~実物大の希望~\n一场将横山由依的历史浓缩其中，让憨憨和饭们都感到幸福的solo演唱会', 0, 0, 0, 0, '2019-11-09 17:43:35.967359', 1, 0, 0, 8, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (110, '【Team德光老爷我很冷静】Making of 横山由依ソロコンサート~実物大の希望~', '【Team德光老爷我很冷静】Making of 横山由依ソロコンサート~実物大の希望~', 'c3defeed7712d377bdb92541f43a6707.png', '一场将横山由依的历史浓缩其中，让憨憨和饭们都感到幸福的solo演唱会', 1, 0, 0, 0, '2019-11-09 17:43:35.973357', 1, 0, 0, 8, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (111, '第26回世界遺産劇場－嚴島神社－ 坂本真綾、クリス・ハート Special Live【生肉】', '第26回世界遺産劇場－嚴島神社－ 坂本真綾、クリス・ハート Special Live【生肉】', '5571746fd65c7c2e3a093387429deb73.png', '2015年5月30日（土）31日（日）に広岛県严岛神社にて开催された坂本真绫、クリス�9�9ハートのスペシャルライブをお届け！', 0, 0, 0, 0, '2019-11-09 17:43:35.978352', 1, 0, 0, 8, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (112, '【短片】姬伴 Study Buddies【1080P】【亿万同人字幕组】', '【短片】姬伴 Study Buddies【1080P】【亿万同人字幕组】', '9f574e160c26220bfba8c065af4e6bd5.png', '#player{display:block}\n$vid=\"msv-1572353576\";$pkey=\"%2BiCaW1kq0IT4YmU%2Br1l6A%2BGvCtuNToANpQj0XA72kHw%3D\";简介：\n两个好朋友之间的短暂小故事。', 0, 0, 0, 0, '2019-11-09 17:45:24.029644', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (113, '【2014短片】你的名字 Without【亿万同人字幕组】', '【2014短片】你的名字 Without【亿万同人字幕组】', 'cdc4d8a610ecea75d6649cb2b881d0cc.png', '#player{display:block}\n$vid=\"msj-1572360284\";$pkey=\"StCn%2FV7MwNYTe64xKVDOC7cD5Hrjhuw5cr00uiyXVHo%3D\";简介：\n一觉醒来没有你，我一直都在找你，即使不知道你的真名，街角路口的婚照上，新郎旁边微笑着的人，好像你。', 0, 0, 0, 0, '2019-11-09 17:45:24.048708', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (114, '【跨洋辩论】Liu xin&Trish.双语字幕（完整版）【物与民胞】', '【跨洋辩论】Liu xin&Trish.双语字幕（完整版）【物与民胞】', '1b95ee71816cdbfbc7b6bf35b066905b.png', '#player{display:block}\n$vid=\"jda-1559227604\";$pkey=\"HxkJpUnoTM9Lf63Lvpr%2Bt%2BdIGfAa4ARdh9TlfO7aVqU%3D\";据中国环球电视网（CGTN）30日报道，美国福克斯新闻主播翠西·里根（Trish Regan）于北京时间5月30日上午与中国CGTN电视台主播刘欣就中美贸易问题进行电视直播讨论。', 1, 0, 0, 0, '2019-11-09 17:45:24.053706', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (115, '【韩语短片】姐姐你和我玩真心话大冒险吗？【橘里橘气译制组】', '【韩语短片】姐姐你和我玩真心话大冒险吗？【橘里橘气译制组】', 'a317ad4e11743b82c9e948b582e03454.png', '#player{display:block}\n$vid=\"msj-1551948567\";$pkey=\"LAYPLHhVtAtvM4zip71aDQHUgHlouJQ7UyFfQMXl8FE%3D\";三个年轻人聚在一起玩起了真心话大冒险，大圭本想在游戏中向女神告白，没想到，被自己的姐姐抢占先机…', 0, 0, 0, 0, '2019-11-09 17:45:24.058664', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (116, '【越南短片】迷途【橘里橘气译制组】', '【越南短片】迷途【橘里橘气译制组】', 'e1e9acc5d22ec067535fa87529999800.png', '#player{display:block}\n$vid=\"msh-1551586200\";$pkey=\"3HrnPBTRL9kLHUh82VdWsd0EKfVEn6G%2BlPYQCpO%2FBi4%3D\";2017年度越南最佳百合微电影《迷途》讲述两个相爱却无法在一起的越南女孩的悲伤恋歌。', 0, 0, 0, 0, '2019-11-09 17:45:24.063669', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (117, '【短片】玛格丽塔的情人【橘里橘气译制组】', '【短片】玛格丽塔的情人【橘里橘气译制组】', '3d7d3ebda36d7aa0072b480e4890f767.png', '#player{display:block}\n$vid=\"msg-1550900812\";$pkey=\"pyf9YQSU6Quk0mG6g%2BoBPPc577fglQ%2BBYQfsHgiLrBI%3D\";玛格丽塔垂垂老矣，由居家看护悉心照顾。看护总会拿起手机，与爱人情话绵绵。玛格丽塔的回忆一点一滴涌上心头，爱情不是在每个年代都会受到祝福，生命最后的日子里，过往情事逐渐掀起涟漪……', 0, 0, 0, 0, '2019-11-09 17:45:24.069655', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (118, '【印度短片】爱的救赎【橘里橘气译制组】', '【印度短片】爱的救赎【橘里橘气译制组】', 'bb81d9db8b51211a93cbfffd5cfd4518.png', '#player{display:block}\n$vid=\"bta-1547378070\";$pkey=\"PYlE2nuj8Le6BdzoaSZ%2BCOBxNGRpjZTQnq%2B01busZZ0%3D\";她与她坠入爱河，却遭到了家人的极力反对，在一次女友与母亲的争执中，她做出了最后悔的选择', 0, 0, 0, 0, '2019-11-09 17:45:24.074654', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (119, '【韩国短片】我们之间【橘里橘气译制组】', '【韩国短片】我们之间【橘里橘气译制组】', '7255644c87dd4836c7ecaa771cbfebc2.png', '#player{display:block}\n$vid=\"msa-1544870742\";$pkey=\"3YTHG6NiPsaaJAEBgCHN%2BrcD5Hrjhuw5cr00uiyXVHo%3D\";韩国最新百合小短片“我们之间”，爱上朝夕相处的小姐姐却不能说的感觉是如此纠结。', 0, 0, 0, 0, '2019-11-09 17:45:24.079664', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (120, '【韩国短片】不要说对不起【橘里橘气译制组】', '【韩国短片】不要说对不起【橘里橘气译制组】', '0ebdc1ce59cb844e81c10b30cf470626.png', '#player{display:block}\n$vid=\"msa-1544154193\";$pkey=\"K2OB1%2FcaVEnJrGMtNxL2RAHUgHlouJQ7UyFfQMXl8FE%3D\";【韩国短片】不要说对不起【橘里橘气译制组】', 0, 0, 0, 0, '2019-11-09 17:45:24.084647', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (121, '【韩国短片】我们没有在一起【橘里橘气译制组】', '【韩国短片】我们没有在一起【橘里橘气译制组】', '167181f859de588c5cf74f500e3cb8f0.png', '2018韩国百合短片，我们没有在一起。\n#player{display:block}\n$vid=\"tzp-1538129550\";$pkey=\"iS4rRu7Vnvvw0zRPROmeZ%2BBxNGRpjZTQnq%2B01busZZ0%3D\";', 1, 0, 0, 0, '2019-11-09 17:45:24.088675', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (122, '【韩国短片】指令 关于你【橘里橘气译制组】', '【韩国短片】指令 关于你【橘里橘气译制组】', '3c7714fdc0bd8e19d51505461782b95c.png', '韩国百合短片，指令 关于你。\n#player{display:block}\n$vid=\"tzp-1538129533\";$pkey=\"tCCR%2FTzov8kWLmVTgJsmaeGvCtuNToANpQj0XA72kHw%3D\";', 0, 0, 0, 0, '2019-11-09 17:45:24.093651', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (123, '【BJ yeoun】去水上乐园，女友不满意泳装，哼哼唧唧的男朋友【StarryNight星夜字幕组】', '【BJ yeoun】去水上乐园，女友不满意泳装，哼哼唧唧的男朋友【StarryNight星夜字幕组】', '9236a3ea8d0355b1bc258f4e7b3d4a66.png', '#player{display:block}\n$vid=\"tlp-1534415447\";$pkey=\"cBaSUbrnRd%2F49h95cPiFeBmaARZtMQKHdWdoy8Jn8Ck%3D\";原作者：BJ여운 原地址：https://youtu.be/_nu3rUtvkKc\n☆新浪微博：StarryNight星夜字幕组 ☆bilibili：星夜字幕组 / 星夜搬运工\n☆字幕组长期招新!!! 应征审核Q群：658633245', 0, 0, 0, 0, '2019-11-09 17:45:24.098656', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (124, '【Veiled ASMR SJ】今年多大了啊？做什么的啊？有没有女朋友啊？ Q&A', '【Veiled ASMR SJ】今年多大了啊？做什么的啊？有没有女朋友啊？ Q&A', 'bf5cc5e733911c2c5b98e9a6970ad183.png', '#player{display:block}\n$vid=\"tlp-1533793219\";$pkey=\"fcQlUSWXwx4nWSRWjVJxXBmaARZtMQKHdWdoy8Jn8Ck%3D\";原作者：Veiled ASMR SJ，原地址：https://youtu.be/I1exb-qelSY\n☆新浪微博：StarryNight星夜字幕组 ☆bilibili：星夜字幕组 / 星夜搬运工\n☆字幕组长期招新!!! 应征审核Q群：658633245', 1, 0, 0, 0, '2019-11-09 17:45:24.103636', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (125, '【tu es ma came / 韩文ASMR】因为生病而哼哼唧唧的男朋友【StarryNight星夜字幕组】', '【tu es ma came / 韩文ASMR】因为生病而哼哼唧唧的男朋友【StarryNight星夜字幕组】', 'fd2c68ace0a0619e83159d01e395fa60.png', '#player{display:block}\n$vid=\"typ-1529542034\";$pkey=\"T09xbwBXPhhSU2jWiywM6RmaARZtMQKHdWdoy8Jn8Ck%3D\";原作者：tu es ma came\n原地址：https://youtu.be/hY0U0ySLMcY', 0, 0, 0, 0, '2019-11-09 17:45:24.108632', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (126, '【Team德光老爷我站不住字幕组】180618 第10回AKB48选拔总选举 横山由依6位感言', '【Team德光老爷我站不住字幕组】180618 第10回AKB48选拔总选举 横山由依6位感言', '9db4f7ffdb64986bcd20e5260501d271.png', '恭喜由依憨再次进入神七，也获得了自己史上最高名次和票数！', 0, 0, 0, 0, '2019-11-09 17:45:24.113630', 1, 0, 0, 9, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (127, '【港剧】白色强人 25集全【粤语】', '【港剧】白色强人 25集全【粤语】', 'movie/007muWB5ly1g4yagep2lgj30qo0f0wgp.jpg', '公营医院龙头“明成北医院”副院长兼脑神经外科主管医生杨逸滔（郭晋安饰）部署五年，计划将明成北打造成一间集资超过百亿的医疗王国，更觊觎成为最高话事人！心胸肺外科主管医生唐明（马国明饰）与逸滔理念大相径庭，前妻苏怡（唐诗咏饰）被卷入他们漩涡里，成为角力的磨心。三人本着捍卫病人生命，将人命置于医疗制度之上的理念，唐明与徒弟潘怀德（何广沛饰）并肩作战，却被院长吕仲学（姜大卫饰）拉进抗衡医改的权力游戏。', 0, 0, 0, 0, '2019-11-19 20:45:38.739583', 25, 1, 0, 10, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (128, '【港剧】教束 20集全【粤语】', '【港剧】教束 20集全【粤语】', 'movie/07muWB5ly1g4vw1eb2kkj30qo0f04kf.jpg', '地區名校馬修書院，由老師以至學生都陷於汰弱留強的湧浪中。教績平平的盧SIR長期受排擠，徘徊在淘汰邊緣；他任教的5C班與精英學生勢成水火，備受欺壓。學生會選舉中，盧SIR協助以賢仔和莊子為首的素人內閣「不老騎士」，成功打破精英學生壟斷。惟此時，另一場直資風波又捲至，令學校不同黨派的老師疲於奔命。', 7, 1, 2, 0, '2019-11-19 20:47:09.575910', 20, 1, 0, 10, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (129, '【2019秋季】还是不能结婚的男人 (10集全)【追新番】', '【2019秋季】还是不能结婚的男人 (10集全)【追新番】', 'movie/007muWB5ly1g8ucfl19v1j30qe0eu40g.jpg', '偏执，自以为是，爱讽刺人的建筑设计师桑野信介，进入令和年代后又进化了？！\r\n\r\n在这个人类寿命普遍达到100岁的年代，53岁的桑野，偏执程度更上一层楼，依旧崇尚着独身主义。但是，他与几名女性邂逅之后，他们之间的命运齿轮转了起来！\r\n\r\n那么这次他能找到人生伴侣吗？', 3, 0, 0, 0, '2019-11-19 20:49:25.114897', 10, 1, 0, 11, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (130, '【美剧】权力的游戏 第八季 (6集全)【未删减】', '【美剧】权力的游戏 第八季 (6集全)【未删减】', 'movie/007muWB5ly1g1temltm9uj30qo0f0gpp.jpg', '《权力的游戏》第八季（Game of Thrones: The Final Season）将于2019年4月14日在HBO播出，本季为最终季，共6集。冰龙火龙大战、狼狮龙族权力之争将轮番上演，谁是铁王座的最终继承人？', 7, 0, 0, 0, '2019-11-19 20:56:50.313642', 6, 1, 0, 12, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (131, '【KBS月火剧】绿豆传', '【KBS月火剧】绿豆传', 'movie/007muWB5ly1g7ivnfo2kbj30qo0f0q4t.jpg', '本剧描述了扮成女人潜伏在神秘的寡妇村的全绿豆（男主），和不想成为妓生的女孩董东珠（女主），各自怀着秘密并相遇后，展开一段不可思议的浪漫爱情喜剧。', 2, 0, 1, 0, '2019-11-19 20:58:18.882485', 25, 1, 0, 13, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (132, '【2015台剧】一把青 (全31集)【豆瓣9.3】【1080P】', '【2015台剧】一把青 (全31集)【豆瓣9.3】【1080P】', 'movie/007muWB5ly1g550a5ltnsj30qo0f0ade.jpg', '改编自白先勇同名小说。该剧描述1945年，众人沉浸在抗战胜利的喜悦时，马上面临继起的国共内战，再次被战火无情催逼、生死两隔的动人情感。在国共内战当时的许多飞官的家庭，当妻子看著丈夫出门时，一颗心却悬著等待任务的结束。\r\n\r\n# 1080P无台标高码率片源，网络不佳时可能会出现卡顿', 2, 0, 0, 0, '2019-11-19 21:00:07.514582', 31, 1, 0, 14, 0, 0.00);
INSERT INTO `lookapi_movie` VALUES (133, '【动画】瑞克与莫蒂 Rick and Morty 第四季【电波字幕组】', '【动画】瑞克与莫蒂 Rick and Morty 第四季【电波字幕组】', 'movie/007muWB5ly1g8o9l7ja8gj30qo0f0di6.jpg', 'Rick（瑞克）和Morty（莫蒂）讲述了地球C-137（S1-06之后转移到的时空N/A（可在S2-02Jerry寄托所中Rick填的表格中看到）之前的时空由于Rick的药水使除了Morty一家的人类都变成了柯南伯格式的怪物）的Rick和Morty的冒险故事，但有时也有Rick和Summer，Morty和Jerry这样的冒险组合。剧情设计和制作手法都极为出彩', 41, 0, 2, 0, '2019-11-20 09:14:16.738835', 1, 0, 0, 6, 1, 0.00);
INSERT INTO `lookapi_movie` VALUES (134, '【美漫】宝贝老板：重围商界 13集全【Netflix官方中字】', '【美漫】宝贝老板：重围商界 13集全【Netflix官方中字】', 'movie/005zWjpngy1fqi0gvvfq2j30m80cimy7.jpg', '在自己兄长“共犯”蒂姆（Tim）的帮助下，“宝贝老板”继续在竞争残酷的“宝贝界”摸索，并寄希望达到工作与生活的平衡。', 6, 0, 1, 0, '2019-11-20 09:25:02.238779', 1, 0, 0, 6, 1, 0.00);

-- ----------------------------
-- Table structure for lookapi_movie_tag
-- ----------------------------
DROP TABLE IF EXISTS `lookapi_movie_tag`;
CREATE TABLE `lookapi_movie_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lookapi_movie_tag_movie_id_tag_id_9e581c50_uniq`(`movie_id`, `tag_id`) USING BTREE,
  INDEX `lookapi_movie_tag_movie_id_cd0a3b34`(`movie_id`) USING BTREE,
  INDEX `lookapi_movie_tag_tag_id_ae088a44`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 489 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lookapi_movie_tag
-- ----------------------------
INSERT INTO `lookapi_movie_tag` VALUES (51, 13, 12);
INSERT INTO `lookapi_movie_tag` VALUES (54, 14, 11);
INSERT INTO `lookapi_movie_tag` VALUES (52, 14, 51);
INSERT INTO `lookapi_movie_tag` VALUES (53, 14, 114);
INSERT INTO `lookapi_movie_tag` VALUES (55, 15, 40);
INSERT INTO `lookapi_movie_tag` VALUES (56, 15, 97);
INSERT INTO `lookapi_movie_tag` VALUES (57, 15, 133);
INSERT INTO `lookapi_movie_tag` VALUES (58, 16, 48);
INSERT INTO `lookapi_movie_tag` VALUES (61, 16, 63);
INSERT INTO `lookapi_movie_tag` VALUES (60, 16, 133);
INSERT INTO `lookapi_movie_tag` VALUES (59, 16, 146);
INSERT INTO `lookapi_movie_tag` VALUES (63, 17, 8);
INSERT INTO `lookapi_movie_tag` VALUES (64, 17, 10);
INSERT INTO `lookapi_movie_tag` VALUES (65, 17, 48);
INSERT INTO `lookapi_movie_tag` VALUES (67, 17, 62);
INSERT INTO `lookapi_movie_tag` VALUES (66, 17, 150);
INSERT INTO `lookapi_movie_tag` VALUES (62, 17, 164);
INSERT INTO `lookapi_movie_tag` VALUES (71, 18, 15);
INSERT INTO `lookapi_movie_tag` VALUES (70, 18, 46);
INSERT INTO `lookapi_movie_tag` VALUES (69, 18, 75);
INSERT INTO `lookapi_movie_tag` VALUES (72, 18, 150);
INSERT INTO `lookapi_movie_tag` VALUES (68, 18, 164);
INSERT INTO `lookapi_movie_tag` VALUES (74, 19, 47);
INSERT INTO `lookapi_movie_tag` VALUES (75, 19, 84);
INSERT INTO `lookapi_movie_tag` VALUES (76, 19, 150);
INSERT INTO `lookapi_movie_tag` VALUES (77, 19, 152);
INSERT INTO `lookapi_movie_tag` VALUES (73, 19, 160);
INSERT INTO `lookapi_movie_tag` VALUES (79, 20, 5);
INSERT INTO `lookapi_movie_tag` VALUES (80, 20, 8);
INSERT INTO `lookapi_movie_tag` VALUES (81, 20, 89);
INSERT INTO `lookapi_movie_tag` VALUES (82, 20, 92);
INSERT INTO `lookapi_movie_tag` VALUES (83, 20, 94);
INSERT INTO `lookapi_movie_tag` VALUES (78, 20, 164);
INSERT INTO `lookapi_movie_tag` VALUES (85, 21, 5);
INSERT INTO `lookapi_movie_tag` VALUES (87, 21, 8);
INSERT INTO `lookapi_movie_tag` VALUES (84, 21, 67);
INSERT INTO `lookapi_movie_tag` VALUES (86, 21, 133);
INSERT INTO `lookapi_movie_tag` VALUES (88, 21, 150);
INSERT INTO `lookapi_movie_tag` VALUES (92, 22, 44);
INSERT INTO `lookapi_movie_tag` VALUES (91, 22, 107);
INSERT INTO `lookapi_movie_tag` VALUES (94, 22, 123);
INSERT INTO `lookapi_movie_tag` VALUES (90, 22, 133);
INSERT INTO `lookapi_movie_tag` VALUES (93, 22, 144);
INSERT INTO `lookapi_movie_tag` VALUES (89, 22, 163);
INSERT INTO `lookapi_movie_tag` VALUES (96, 23, 5);
INSERT INTO `lookapi_movie_tag` VALUES (95, 23, 35);
INSERT INTO `lookapi_movie_tag` VALUES (99, 23, 55);
INSERT INTO `lookapi_movie_tag` VALUES (98, 23, 81);
INSERT INTO `lookapi_movie_tag` VALUES (97, 23, 167);
INSERT INTO `lookapi_movie_tag` VALUES (102, 24, 11);
INSERT INTO `lookapi_movie_tag` VALUES (103, 24, 44);
INSERT INTO `lookapi_movie_tag` VALUES (104, 24, 48);
INSERT INTO `lookapi_movie_tag` VALUES (106, 24, 62);
INSERT INTO `lookapi_movie_tag` VALUES (101, 24, 70);
INSERT INTO `lookapi_movie_tag` VALUES (105, 24, 121);
INSERT INTO `lookapi_movie_tag` VALUES (100, 24, 163);
INSERT INTO `lookapi_movie_tag` VALUES (109, 25, 5);
INSERT INTO `lookapi_movie_tag` VALUES (108, 25, 101);
INSERT INTO `lookapi_movie_tag` VALUES (107, 25, 128);
INSERT INTO `lookapi_movie_tag` VALUES (110, 25, 141);
INSERT INTO `lookapi_movie_tag` VALUES (111, 25, 156);
INSERT INTO `lookapi_movie_tag` VALUES (113, 26, 42);
INSERT INTO `lookapi_movie_tag` VALUES (115, 26, 48);
INSERT INTO `lookapi_movie_tag` VALUES (116, 26, 51);
INSERT INTO `lookapi_movie_tag` VALUES (112, 26, 71);
INSERT INTO `lookapi_movie_tag` VALUES (114, 26, 78);
INSERT INTO `lookapi_movie_tag` VALUES (117, 27, 5);
INSERT INTO `lookapi_movie_tag` VALUES (118, 27, 41);
INSERT INTO `lookapi_movie_tag` VALUES (120, 27, 87);
INSERT INTO `lookapi_movie_tag` VALUES (119, 27, 138);
INSERT INTO `lookapi_movie_tag` VALUES (121, 27, 151);
INSERT INTO `lookapi_movie_tag` VALUES (122, 28, 2);
INSERT INTO `lookapi_movie_tag` VALUES (123, 28, 11);
INSERT INTO `lookapi_movie_tag` VALUES (125, 28, 50);
INSERT INTO `lookapi_movie_tag` VALUES (124, 28, 78);
INSERT INTO `lookapi_movie_tag` VALUES (126, 28, 159);
INSERT INTO `lookapi_movie_tag` VALUES (130, 29, 88);
INSERT INTO `lookapi_movie_tag` VALUES (131, 29, 95);
INSERT INTO `lookapi_movie_tag` VALUES (127, 29, 132);
INSERT INTO `lookapi_movie_tag` VALUES (128, 29, 133);
INSERT INTO `lookapi_movie_tag` VALUES (129, 29, 171);
INSERT INTO `lookapi_movie_tag` VALUES (134, 30, 11);
INSERT INTO `lookapi_movie_tag` VALUES (132, 30, 51);
INSERT INTO `lookapi_movie_tag` VALUES (133, 30, 114);
INSERT INTO `lookapi_movie_tag` VALUES (135, 31, 40);
INSERT INTO `lookapi_movie_tag` VALUES (136, 31, 97);
INSERT INTO `lookapi_movie_tag` VALUES (137, 31, 133);
INSERT INTO `lookapi_movie_tag` VALUES (138, 32, 48);
INSERT INTO `lookapi_movie_tag` VALUES (141, 32, 63);
INSERT INTO `lookapi_movie_tag` VALUES (140, 32, 133);
INSERT INTO `lookapi_movie_tag` VALUES (139, 32, 146);
INSERT INTO `lookapi_movie_tag` VALUES (143, 33, 8);
INSERT INTO `lookapi_movie_tag` VALUES (144, 33, 10);
INSERT INTO `lookapi_movie_tag` VALUES (145, 33, 48);
INSERT INTO `lookapi_movie_tag` VALUES (147, 33, 62);
INSERT INTO `lookapi_movie_tag` VALUES (146, 33, 150);
INSERT INTO `lookapi_movie_tag` VALUES (142, 33, 164);
INSERT INTO `lookapi_movie_tag` VALUES (151, 34, 15);
INSERT INTO `lookapi_movie_tag` VALUES (150, 34, 46);
INSERT INTO `lookapi_movie_tag` VALUES (149, 34, 75);
INSERT INTO `lookapi_movie_tag` VALUES (152, 34, 150);
INSERT INTO `lookapi_movie_tag` VALUES (148, 34, 164);
INSERT INTO `lookapi_movie_tag` VALUES (154, 35, 47);
INSERT INTO `lookapi_movie_tag` VALUES (155, 35, 84);
INSERT INTO `lookapi_movie_tag` VALUES (156, 35, 150);
INSERT INTO `lookapi_movie_tag` VALUES (157, 35, 152);
INSERT INTO `lookapi_movie_tag` VALUES (153, 35, 160);
INSERT INTO `lookapi_movie_tag` VALUES (159, 36, 5);
INSERT INTO `lookapi_movie_tag` VALUES (160, 36, 8);
INSERT INTO `lookapi_movie_tag` VALUES (161, 36, 89);
INSERT INTO `lookapi_movie_tag` VALUES (162, 36, 92);
INSERT INTO `lookapi_movie_tag` VALUES (163, 36, 94);
INSERT INTO `lookapi_movie_tag` VALUES (158, 36, 164);
INSERT INTO `lookapi_movie_tag` VALUES (165, 37, 5);
INSERT INTO `lookapi_movie_tag` VALUES (167, 37, 8);
INSERT INTO `lookapi_movie_tag` VALUES (164, 37, 67);
INSERT INTO `lookapi_movie_tag` VALUES (166, 37, 133);
INSERT INTO `lookapi_movie_tag` VALUES (168, 37, 150);
INSERT INTO `lookapi_movie_tag` VALUES (172, 38, 44);
INSERT INTO `lookapi_movie_tag` VALUES (171, 38, 107);
INSERT INTO `lookapi_movie_tag` VALUES (174, 38, 123);
INSERT INTO `lookapi_movie_tag` VALUES (170, 38, 133);
INSERT INTO `lookapi_movie_tag` VALUES (173, 38, 144);
INSERT INTO `lookapi_movie_tag` VALUES (169, 38, 163);
INSERT INTO `lookapi_movie_tag` VALUES (176, 39, 5);
INSERT INTO `lookapi_movie_tag` VALUES (175, 39, 35);
INSERT INTO `lookapi_movie_tag` VALUES (179, 39, 55);
INSERT INTO `lookapi_movie_tag` VALUES (178, 39, 81);
INSERT INTO `lookapi_movie_tag` VALUES (177, 39, 167);
INSERT INTO `lookapi_movie_tag` VALUES (182, 40, 11);
INSERT INTO `lookapi_movie_tag` VALUES (183, 40, 44);
INSERT INTO `lookapi_movie_tag` VALUES (184, 40, 48);
INSERT INTO `lookapi_movie_tag` VALUES (186, 40, 62);
INSERT INTO `lookapi_movie_tag` VALUES (181, 40, 70);
INSERT INTO `lookapi_movie_tag` VALUES (185, 40, 121);
INSERT INTO `lookapi_movie_tag` VALUES (180, 40, 163);
INSERT INTO `lookapi_movie_tag` VALUES (189, 41, 5);
INSERT INTO `lookapi_movie_tag` VALUES (188, 41, 101);
INSERT INTO `lookapi_movie_tag` VALUES (187, 41, 128);
INSERT INTO `lookapi_movie_tag` VALUES (190, 41, 141);
INSERT INTO `lookapi_movie_tag` VALUES (191, 41, 156);
INSERT INTO `lookapi_movie_tag` VALUES (193, 42, 42);
INSERT INTO `lookapi_movie_tag` VALUES (195, 42, 48);
INSERT INTO `lookapi_movie_tag` VALUES (196, 42, 51);
INSERT INTO `lookapi_movie_tag` VALUES (192, 42, 71);
INSERT INTO `lookapi_movie_tag` VALUES (194, 42, 78);
INSERT INTO `lookapi_movie_tag` VALUES (197, 43, 5);
INSERT INTO `lookapi_movie_tag` VALUES (198, 43, 41);
INSERT INTO `lookapi_movie_tag` VALUES (200, 43, 87);
INSERT INTO `lookapi_movie_tag` VALUES (199, 43, 138);
INSERT INTO `lookapi_movie_tag` VALUES (201, 43, 151);
INSERT INTO `lookapi_movie_tag` VALUES (202, 44, 2);
INSERT INTO `lookapi_movie_tag` VALUES (203, 44, 11);
INSERT INTO `lookapi_movie_tag` VALUES (205, 44, 50);
INSERT INTO `lookapi_movie_tag` VALUES (204, 44, 78);
INSERT INTO `lookapi_movie_tag` VALUES (206, 44, 159);
INSERT INTO `lookapi_movie_tag` VALUES (210, 45, 88);
INSERT INTO `lookapi_movie_tag` VALUES (211, 45, 95);
INSERT INTO `lookapi_movie_tag` VALUES (207, 45, 132);
INSERT INTO `lookapi_movie_tag` VALUES (208, 45, 133);
INSERT INTO `lookapi_movie_tag` VALUES (209, 45, 171);
INSERT INTO `lookapi_movie_tag` VALUES (213, 46, 5);
INSERT INTO `lookapi_movie_tag` VALUES (212, 46, 26);
INSERT INTO `lookapi_movie_tag` VALUES (214, 46, 76);
INSERT INTO `lookapi_movie_tag` VALUES (215, 46, 90);
INSERT INTO `lookapi_movie_tag` VALUES (216, 46, 91);
INSERT INTO `lookapi_movie_tag` VALUES (217, 47, 5);
INSERT INTO `lookapi_movie_tag` VALUES (220, 47, 48);
INSERT INTO `lookapi_movie_tag` VALUES (221, 47, 85);
INSERT INTO `lookapi_movie_tag` VALUES (219, 47, 133);
INSERT INTO `lookapi_movie_tag` VALUES (222, 47, 154);
INSERT INTO `lookapi_movie_tag` VALUES (218, 47, 166);
INSERT INTO `lookapi_movie_tag` VALUES (227, 48, 44);
INSERT INTO `lookapi_movie_tag` VALUES (226, 48, 136);
INSERT INTO `lookapi_movie_tag` VALUES (223, 48, 161);
INSERT INTO `lookapi_movie_tag` VALUES (224, 48, 163);
INSERT INTO `lookapi_movie_tag` VALUES (225, 48, 168);
INSERT INTO `lookapi_movie_tag` VALUES (232, 49, 14);
INSERT INTO `lookapi_movie_tag` VALUES (231, 49, 44);
INSERT INTO `lookapi_movie_tag` VALUES (233, 49, 124);
INSERT INTO `lookapi_movie_tag` VALUES (228, 49, 161);
INSERT INTO `lookapi_movie_tag` VALUES (229, 49, 163);
INSERT INTO `lookapi_movie_tag` VALUES (230, 49, 165);
INSERT INTO `lookapi_movie_tag` VALUES (236, 50, 5);
INSERT INTO `lookapi_movie_tag` VALUES (237, 50, 13);
INSERT INTO `lookapi_movie_tag` VALUES (235, 50, 34);
INSERT INTO `lookapi_movie_tag` VALUES (234, 50, 129);
INSERT INTO `lookapi_movie_tag` VALUES (238, 50, 180);
INSERT INTO `lookapi_movie_tag` VALUES (240, 51, 5);
INSERT INTO `lookapi_movie_tag` VALUES (241, 51, 133);
INSERT INTO `lookapi_movie_tag` VALUES (239, 51, 142);
INSERT INTO `lookapi_movie_tag` VALUES (245, 52, 5);
INSERT INTO `lookapi_movie_tag` VALUES (242, 52, 32);
INSERT INTO `lookapi_movie_tag` VALUES (248, 52, 56);
INSERT INTO `lookapi_movie_tag` VALUES (244, 52, 69);
INSERT INTO `lookapi_movie_tag` VALUES (246, 52, 76);
INSERT INTO `lookapi_movie_tag` VALUES (247, 52, 88);
INSERT INTO `lookapi_movie_tag` VALUES (249, 52, 93);
INSERT INTO `lookapi_movie_tag` VALUES (243, 52, 163);
INSERT INTO `lookapi_movie_tag` VALUES (250, 53, 5);
INSERT INTO `lookapi_movie_tag` VALUES (256, 53, 25);
INSERT INTO `lookapi_movie_tag` VALUES (252, 53, 40);
INSERT INTO `lookapi_movie_tag` VALUES (253, 53, 80);
INSERT INTO `lookapi_movie_tag` VALUES (255, 53, 88);
INSERT INTO `lookapi_movie_tag` VALUES (254, 53, 119);
INSERT INTO `lookapi_movie_tag` VALUES (251, 53, 133);
INSERT INTO `lookapi_movie_tag` VALUES (260, 54, 5);
INSERT INTO `lookapi_movie_tag` VALUES (259, 54, 35);
INSERT INTO `lookapi_movie_tag` VALUES (258, 54, 82);
INSERT INTO `lookapi_movie_tag` VALUES (257, 54, 120);
INSERT INTO `lookapi_movie_tag` VALUES (262, 55, 39);
INSERT INTO `lookapi_movie_tag` VALUES (261, 55, 88);
INSERT INTO `lookapi_movie_tag` VALUES (264, 55, 111);
INSERT INTO `lookapi_movie_tag` VALUES (263, 55, 133);
INSERT INTO `lookapi_movie_tag` VALUES (267, 56, 40);
INSERT INTO `lookapi_movie_tag` VALUES (269, 56, 48);
INSERT INTO `lookapi_movie_tag` VALUES (270, 56, 52);
INSERT INTO `lookapi_movie_tag` VALUES (271, 56, 88);
INSERT INTO `lookapi_movie_tag` VALUES (265, 56, 97);
INSERT INTO `lookapi_movie_tag` VALUES (268, 56, 105);
INSERT INTO `lookapi_movie_tag` VALUES (266, 56, 132);
INSERT INTO `lookapi_movie_tag` VALUES (273, 57, 5);
INSERT INTO `lookapi_movie_tag` VALUES (278, 57, 25);
INSERT INTO `lookapi_movie_tag` VALUES (274, 57, 40);
INSERT INTO `lookapi_movie_tag` VALUES (276, 57, 43);
INSERT INTO `lookapi_movie_tag` VALUES (277, 57, 88);
INSERT INTO `lookapi_movie_tag` VALUES (272, 57, 100);
INSERT INTO `lookapi_movie_tag` VALUES (275, 57, 139);
INSERT INTO `lookapi_movie_tag` VALUES (279, 58, 5);
INSERT INTO `lookapi_movie_tag` VALUES (284, 58, 29);
INSERT INTO `lookapi_movie_tag` VALUES (280, 58, 40);
INSERT INTO `lookapi_movie_tag` VALUES (281, 58, 73);
INSERT INTO `lookapi_movie_tag` VALUES (283, 58, 88);
INSERT INTO `lookapi_movie_tag` VALUES (282, 58, 177);
INSERT INTO `lookapi_movie_tag` VALUES (286, 59, 5);
INSERT INTO `lookapi_movie_tag` VALUES (285, 59, 76);
INSERT INTO `lookapi_movie_tag` VALUES (288, 59, 133);
INSERT INTO `lookapi_movie_tag` VALUES (287, 59, 149);
INSERT INTO `lookapi_movie_tag` VALUES (289, 60, 5);
INSERT INTO `lookapi_movie_tag` VALUES (290, 60, 150);
INSERT INTO `lookapi_movie_tag` VALUES (293, 61, 5);
INSERT INTO `lookapi_movie_tag` VALUES (291, 61, 48);
INSERT INTO `lookapi_movie_tag` VALUES (294, 61, 118);
INSERT INTO `lookapi_movie_tag` VALUES (292, 61, 172);
INSERT INTO `lookapi_movie_tag` VALUES (298, 62, 11);
INSERT INTO `lookapi_movie_tag` VALUES (300, 62, 89);
INSERT INTO `lookapi_movie_tag` VALUES (297, 62, 102);
INSERT INTO `lookapi_movie_tag` VALUES (295, 62, 121);
INSERT INTO `lookapi_movie_tag` VALUES (299, 62, 148);
INSERT INTO `lookapi_movie_tag` VALUES (296, 62, 163);
INSERT INTO `lookapi_movie_tag` VALUES (303, 63, 33);
INSERT INTO `lookapi_movie_tag` VALUES (302, 63, 38);
INSERT INTO `lookapi_movie_tag` VALUES (301, 63, 89);
INSERT INTO `lookapi_movie_tag` VALUES (307, 64, 43);
INSERT INTO `lookapi_movie_tag` VALUES (305, 64, 57);
INSERT INTO `lookapi_movie_tag` VALUES (306, 64, 130);
INSERT INTO `lookapi_movie_tag` VALUES (304, 64, 169);
INSERT INTO `lookapi_movie_tag` VALUES (309, 65, 3);
INSERT INTO `lookapi_movie_tag` VALUES (310, 65, 5);
INSERT INTO `lookapi_movie_tag` VALUES (312, 65, 12);
INSERT INTO `lookapi_movie_tag` VALUES (315, 65, 29);
INSERT INTO `lookapi_movie_tag` VALUES (313, 65, 113);
INSERT INTO `lookapi_movie_tag` VALUES (311, 65, 133);
INSERT INTO `lookapi_movie_tag` VALUES (308, 65, 162);
INSERT INTO `lookapi_movie_tag` VALUES (314, 65, 179);
INSERT INTO `lookapi_movie_tag` VALUES (316, 66, 5);
INSERT INTO `lookapi_movie_tag` VALUES (321, 66, 29);
INSERT INTO `lookapi_movie_tag` VALUES (317, 66, 40);
INSERT INTO `lookapi_movie_tag` VALUES (318, 66, 49);
INSERT INTO `lookapi_movie_tag` VALUES (320, 66, 59);
INSERT INTO `lookapi_movie_tag` VALUES (319, 66, 88);
INSERT INTO `lookapi_movie_tag` VALUES (323, 67, 61);
INSERT INTO `lookapi_movie_tag` VALUES (322, 67, 116);
INSERT INTO `lookapi_movie_tag` VALUES (324, 67, 134);
INSERT INTO `lookapi_movie_tag` VALUES (325, 67, 157);
INSERT INTO `lookapi_movie_tag` VALUES (329, 68, 22);
INSERT INTO `lookapi_movie_tag` VALUES (326, 68, 72);
INSERT INTO `lookapi_movie_tag` VALUES (327, 68, 121);
INSERT INTO `lookapi_movie_tag` VALUES (328, 68, 137);
INSERT INTO `lookapi_movie_tag` VALUES (332, 69, 53);
INSERT INTO `lookapi_movie_tag` VALUES (330, 69, 66);
INSERT INTO `lookapi_movie_tag` VALUES (331, 69, 104);
INSERT INTO `lookapi_movie_tag` VALUES (333, 69, 126);
INSERT INTO `lookapi_movie_tag` VALUES (334, 69, 158);
INSERT INTO `lookapi_movie_tag` VALUES (336, 70, 40);
INSERT INTO `lookapi_movie_tag` VALUES (335, 70, 64);
INSERT INTO `lookapi_movie_tag` VALUES (337, 70, 109);
INSERT INTO `lookapi_movie_tag` VALUES (338, 71, 5);
INSERT INTO `lookapi_movie_tag` VALUES (339, 72, 66);
INSERT INTO `lookapi_movie_tag` VALUES (341, 72, 126);
INSERT INTO `lookapi_movie_tag` VALUES (340, 72, 133);
INSERT INTO `lookapi_movie_tag` VALUES (343, 73, 108);
INSERT INTO `lookapi_movie_tag` VALUES (342, 73, 121);
INSERT INTO `lookapi_movie_tag` VALUES (346, 74, 17);
INSERT INTO `lookapi_movie_tag` VALUES (347, 74, 24);
INSERT INTO `lookapi_movie_tag` VALUES (344, 74, 74);
INSERT INTO `lookapi_movie_tag` VALUES (348, 74, 127);
INSERT INTO `lookapi_movie_tag` VALUES (345, 74, 140);
INSERT INTO `lookapi_movie_tag` VALUES (351, 75, 20);
INSERT INTO `lookapi_movie_tag` VALUES (350, 75, 99);
INSERT INTO `lookapi_movie_tag` VALUES (349, 75, 121);
INSERT INTO `lookapi_movie_tag` VALUES (352, 76, 48);
INSERT INTO `lookapi_movie_tag` VALUES (354, 76, 117);
INSERT INTO `lookapi_movie_tag` VALUES (353, 76, 122);
INSERT INTO `lookapi_movie_tag` VALUES (355, 76, 134);
INSERT INTO `lookapi_movie_tag` VALUES (357, 77, 5);
INSERT INTO `lookapi_movie_tag` VALUES (356, 77, 11);
INSERT INTO `lookapi_movie_tag` VALUES (359, 77, 30);
INSERT INTO `lookapi_movie_tag` VALUES (358, 77, 86);
INSERT INTO `lookapi_movie_tag` VALUES (361, 78, 70);
INSERT INTO `lookapi_movie_tag` VALUES (360, 78, 86);
INSERT INTO `lookapi_movie_tag` VALUES (362, 79, 43);
INSERT INTO `lookapi_movie_tag` VALUES (363, 79, 139);
INSERT INTO `lookapi_movie_tag` VALUES (364, 80, 72);
INSERT INTO `lookapi_movie_tag` VALUES (365, 80, 151);
INSERT INTO `lookapi_movie_tag` VALUES (366, 81, 25);
INSERT INTO `lookapi_movie_tag` VALUES (367, 81, 83);
INSERT INTO `lookapi_movie_tag` VALUES (368, 82, 1);
INSERT INTO `lookapi_movie_tag` VALUES (369, 82, 105);
INSERT INTO `lookapi_movie_tag` VALUES (370, 83, 57);
INSERT INTO `lookapi_movie_tag` VALUES (371, 83, 162);
INSERT INTO `lookapi_movie_tag` VALUES (372, 84, 85);
INSERT INTO `lookapi_movie_tag` VALUES (373, 84, 165);
INSERT INTO `lookapi_movie_tag` VALUES (374, 85, 107);
INSERT INTO `lookapi_movie_tag` VALUES (375, 85, 110);
INSERT INTO `lookapi_movie_tag` VALUES (376, 86, 28);
INSERT INTO `lookapi_movie_tag` VALUES (377, 86, 53);
INSERT INTO `lookapi_movie_tag` VALUES (379, 87, 122);
INSERT INTO `lookapi_movie_tag` VALUES (378, 87, 152);
INSERT INTO `lookapi_movie_tag` VALUES (381, 88, 175);
INSERT INTO `lookapi_movie_tag` VALUES (380, 88, 179);
INSERT INTO `lookapi_movie_tag` VALUES (382, 89, 18);
INSERT INTO `lookapi_movie_tag` VALUES (383, 89, 86);
INSERT INTO `lookapi_movie_tag` VALUES (384, 90, 93);
INSERT INTO `lookapi_movie_tag` VALUES (385, 90, 167);
INSERT INTO `lookapi_movie_tag` VALUES (386, 91, 168);
INSERT INTO `lookapi_movie_tag` VALUES (387, 91, 169);
INSERT INTO `lookapi_movie_tag` VALUES (389, 92, 63);
INSERT INTO `lookapi_movie_tag` VALUES (388, 92, 154);
INSERT INTO `lookapi_movie_tag` VALUES (390, 93, 51);
INSERT INTO `lookapi_movie_tag` VALUES (391, 93, 109);
INSERT INTO `lookapi_movie_tag` VALUES (392, 94, 26);
INSERT INTO `lookapi_movie_tag` VALUES (393, 94, 63);
INSERT INTO `lookapi_movie_tag` VALUES (395, 95, 79);
INSERT INTO `lookapi_movie_tag` VALUES (394, 95, 173);
INSERT INTO `lookapi_movie_tag` VALUES (397, 96, 52);
INSERT INTO `lookapi_movie_tag` VALUES (396, 96, 99);
INSERT INTO `lookapi_movie_tag` VALUES (398, 97, 90);
INSERT INTO `lookapi_movie_tag` VALUES (399, 97, 155);
INSERT INTO `lookapi_movie_tag` VALUES (400, 98, 10);
INSERT INTO `lookapi_movie_tag` VALUES (401, 98, 173);
INSERT INTO `lookapi_movie_tag` VALUES (403, 99, 109);
INSERT INTO `lookapi_movie_tag` VALUES (402, 99, 139);
INSERT INTO `lookapi_movie_tag` VALUES (404, 100, 146);
INSERT INTO `lookapi_movie_tag` VALUES (405, 100, 151);
INSERT INTO `lookapi_movie_tag` VALUES (406, 101, 64);
INSERT INTO `lookapi_movie_tag` VALUES (407, 101, 156);
INSERT INTO `lookapi_movie_tag` VALUES (408, 102, 44);
INSERT INTO `lookapi_movie_tag` VALUES (409, 102, 62);
INSERT INTO `lookapi_movie_tag` VALUES (411, 103, 85);
INSERT INTO `lookapi_movie_tag` VALUES (410, 103, 97);
INSERT INTO `lookapi_movie_tag` VALUES (412, 104, 16);
INSERT INTO `lookapi_movie_tag` VALUES (413, 104, 47);
INSERT INTO `lookapi_movie_tag` VALUES (415, 105, 3);
INSERT INTO `lookapi_movie_tag` VALUES (414, 105, 138);
INSERT INTO `lookapi_movie_tag` VALUES (416, 106, 18);
INSERT INTO `lookapi_movie_tag` VALUES (417, 107, 82);
INSERT INTO `lookapi_movie_tag` VALUES (418, 107, 166);
INSERT INTO `lookapi_movie_tag` VALUES (420, 108, 52);
INSERT INTO `lookapi_movie_tag` VALUES (419, 108, 114);
INSERT INTO `lookapi_movie_tag` VALUES (421, 109, 40);
INSERT INTO `lookapi_movie_tag` VALUES (422, 109, 174);
INSERT INTO `lookapi_movie_tag` VALUES (423, 110, 9);
INSERT INTO `lookapi_movie_tag` VALUES (424, 110, 95);
INSERT INTO `lookapi_movie_tag` VALUES (426, 111, 5);
INSERT INTO `lookapi_movie_tag` VALUES (425, 111, 84);
INSERT INTO `lookapi_movie_tag` VALUES (428, 112, 61);
INSERT INTO `lookapi_movie_tag` VALUES (427, 112, 137);
INSERT INTO `lookapi_movie_tag` VALUES (429, 113, 100);
INSERT INTO `lookapi_movie_tag` VALUES (430, 113, 133);
INSERT INTO `lookapi_movie_tag` VALUES (432, 114, 2);
INSERT INTO `lookapi_movie_tag` VALUES (431, 114, 58);
INSERT INTO `lookapi_movie_tag` VALUES (433, 115, 112);
INSERT INTO `lookapi_movie_tag` VALUES (434, 115, 129);
INSERT INTO `lookapi_movie_tag` VALUES (435, 116, 56);
INSERT INTO `lookapi_movie_tag` VALUES (436, 116, 114);
INSERT INTO `lookapi_movie_tag` VALUES (437, 117, 121);
INSERT INTO `lookapi_movie_tag` VALUES (438, 117, 126);
INSERT INTO `lookapi_movie_tag` VALUES (440, 118, 134);
INSERT INTO `lookapi_movie_tag` VALUES (439, 118, 177);
INSERT INTO `lookapi_movie_tag` VALUES (442, 119, 156);
INSERT INTO `lookapi_movie_tag` VALUES (441, 119, 169);
INSERT INTO `lookapi_movie_tag` VALUES (443, 120, 58);
INSERT INTO `lookapi_movie_tag` VALUES (444, 120, 79);
INSERT INTO `lookapi_movie_tag` VALUES (446, 121, 17);
INSERT INTO `lookapi_movie_tag` VALUES (445, 121, 136);
INSERT INTO `lookapi_movie_tag` VALUES (447, 122, 52);
INSERT INTO `lookapi_movie_tag` VALUES (448, 122, 133);
INSERT INTO `lookapi_movie_tag` VALUES (450, 123, 27);
INSERT INTO `lookapi_movie_tag` VALUES (449, 123, 162);
INSERT INTO `lookapi_movie_tag` VALUES (451, 124, 2);
INSERT INTO `lookapi_movie_tag` VALUES (452, 124, 47);
INSERT INTO `lookapi_movie_tag` VALUES (454, 125, 79);
INSERT INTO `lookapi_movie_tag` VALUES (453, 125, 85);
INSERT INTO `lookapi_movie_tag` VALUES (455, 126, 85);
INSERT INTO `lookapi_movie_tag` VALUES (456, 126, 111);
INSERT INTO `lookapi_movie_tag` VALUES (457, 127, 2);
INSERT INTO `lookapi_movie_tag` VALUES (458, 127, 4);
INSERT INTO `lookapi_movie_tag` VALUES (459, 127, 6);
INSERT INTO `lookapi_movie_tag` VALUES (460, 128, 1);
INSERT INTO `lookapi_movie_tag` VALUES (461, 128, 3);
INSERT INTO `lookapi_movie_tag` VALUES (462, 128, 6);
INSERT INTO `lookapi_movie_tag` VALUES (463, 128, 29);
INSERT INTO `lookapi_movie_tag` VALUES (464, 128, 31);
INSERT INTO `lookapi_movie_tag` VALUES (465, 129, 129);
INSERT INTO `lookapi_movie_tag` VALUES (466, 129, 130);
INSERT INTO `lookapi_movie_tag` VALUES (467, 129, 131);
INSERT INTO `lookapi_movie_tag` VALUES (468, 129, 132);
INSERT INTO `lookapi_movie_tag` VALUES (470, 130, 12);
INSERT INTO `lookapi_movie_tag` VALUES (471, 130, 13);
INSERT INTO `lookapi_movie_tag` VALUES (472, 130, 15);
INSERT INTO `lookapi_movie_tag` VALUES (469, 130, 17);
INSERT INTO `lookapi_movie_tag` VALUES (473, 131, 2);
INSERT INTO `lookapi_movie_tag` VALUES (474, 131, 4);
INSERT INTO `lookapi_movie_tag` VALUES (475, 131, 6);
INSERT INTO `lookapi_movie_tag` VALUES (476, 131, 19);
INSERT INTO `lookapi_movie_tag` VALUES (477, 131, 22);
INSERT INTO `lookapi_movie_tag` VALUES (481, 132, 14);
INSERT INTO `lookapi_movie_tag` VALUES (478, 132, 16);
INSERT INTO `lookapi_movie_tag` VALUES (479, 132, 17);
INSERT INTO `lookapi_movie_tag` VALUES (480, 132, 18);
INSERT INTO `lookapi_movie_tag` VALUES (483, 133, 13);
INSERT INTO `lookapi_movie_tag` VALUES (484, 133, 15);
INSERT INTO `lookapi_movie_tag` VALUES (482, 133, 18);
INSERT INTO `lookapi_movie_tag` VALUES (488, 134, 15);
INSERT INTO `lookapi_movie_tag` VALUES (485, 134, 18);
INSERT INTO `lookapi_movie_tag` VALUES (486, 134, 20);
INSERT INTO `lookapi_movie_tag` VALUES (487, 134, 22);

-- ----------------------------
-- Table structure for lookapi_tag
-- ----------------------------
DROP TABLE IF EXISTS `lookapi_tag`;
CREATE TABLE `lookapi_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lookapi_tag
-- ----------------------------
INSERT INTO `lookapi_tag` VALUES (1, '金国熙', 21);
INSERT INTO `lookapi_tag` VALUES (2, '医生', 20);
INSERT INTO `lookapi_tag` VALUES (3, '艾瑞克·巴纳', 15);
INSERT INTO `lookapi_tag` VALUES (4, '西班牙语', 13);
INSERT INTO `lookapi_tag` VALUES (5, '雅克·贝克', 13);
INSERT INTO `lookapi_tag` VALUES (6, '朴炯植', 18);
INSERT INTO `lookapi_tag` VALUES (7, '板鸭', 15);
INSERT INTO `lookapi_tag` VALUES (8, '意大利', 19);
INSERT INTO `lookapi_tag` VALUES (9, '劳米·拉佩斯', 21);
INSERT INTO `lookapi_tag` VALUES (10, '科幻', 21);
INSERT INTO `lookapi_tag` VALUES (11, '哈莉·贝瑞', 13);
INSERT INTO `lookapi_tag` VALUES (12, '汤姆·希林', 12);
INSERT INTO `lookapi_tag` VALUES (13, '日语', 12);
INSERT INTO `lookapi_tag` VALUES (14, '历史', 20);
INSERT INTO `lookapi_tag` VALUES (15, '惊悚', 15);
INSERT INTO `lookapi_tag` VALUES (16, '柯南和凯尔', 17);
INSERT INTO `lookapi_tag` VALUES (17, '禹棹焕', 20);
INSERT INTO `lookapi_tag` VALUES (18, '百合', 16);
INSERT INTO `lookapi_tag` VALUES (19, 'Saugat Malla', 21);
INSERT INTO `lookapi_tag` VALUES (20, '赞达亚', 24);
INSERT INTO `lookapi_tag` VALUES (21, '尼古拉斯·霍尔特', 16);
INSERT INTO `lookapi_tag` VALUES (22, '神叨字幕组', 15);
INSERT INTO `lookapi_tag` VALUES (23, '安杰丽卡·休斯顿', 17);
INSERT INTO `lookapi_tag` VALUES (24, '卢克·伊万斯', 15);
INSERT INTO `lookapi_tag` VALUES (25, '戈雅奖', 12);
INSERT INTO `lookapi_tag` VALUES (26, '苏菲·特纳', 13);
INSERT INTO `lookapi_tag` VALUES (27, '喜剧', 16);
INSERT INTO `lookapi_tag` VALUES (28, '搞笑', 13);
INSERT INTO `lookapi_tag` VALUES (29, '杰西卡·帕尔', 24);
INSERT INTO `lookapi_tag` VALUES (30, '高分', 24);
INSERT INTO `lookapi_tag` VALUES (31, '爱情', 12);
INSERT INTO `lookapi_tag` VALUES (32, '魔幻', 17);
INSERT INTO `lookapi_tag` VALUES (33, 'Diya Maskey', 20);
INSERT INTO `lookapi_tag` VALUES (34, '战争', 12);
INSERT INTO `lookapi_tag` VALUES (35, '加斯顿·雷', 19);
INSERT INTO `lookapi_tag` VALUES (36, '女王', 13);
INSERT INTO `lookapi_tag` VALUES (37, '唐纳德·格洛弗', 24);
INSERT INTO `lookapi_tag` VALUES (38, '山内优花', 12);
INSERT INTO `lookapi_tag` VALUES (39, '安吉丽娜·朱莉', 20);
INSERT INTO `lookapi_tag` VALUES (40, '玛丽娜·萨拉斯', 14);
INSERT INTO `lookapi_tag` VALUES (41, '校园', 21);
INSERT INTO `lookapi_tag` VALUES (42, '爵士', 22);
INSERT INTO `lookapi_tag` VALUES (43, '阿尔法·伍达德', 19);
INSERT INTO `lookapi_tag` VALUES (44, '曹政奭', 14);
INSERT INTO `lookapi_tag` VALUES (45, '罪案', 14);
INSERT INTO `lookapi_tag` VALUES (46, '鬼娃回魂', 24);
INSERT INTO `lookapi_tag` VALUES (47, '欲望', 13);
INSERT INTO `lookapi_tag` VALUES (48, '艾米莉·莫迪默', 23);
INSERT INTO `lookapi_tag` VALUES (49, '詹妮弗·康纳利', 18);
INSERT INTO `lookapi_tag` VALUES (50, '艾斯·库珀', 15);
INSERT INTO `lookapi_tag` VALUES (51, '青春', 0);
INSERT INTO `lookapi_tag` VALUES (52, '柏林电影节', 0);
INSERT INTO `lookapi_tag` VALUES (53, '斯嘉丽·麦卡利斯特', 0);
INSERT INTO `lookapi_tag` VALUES (54, '维吉妮·拉朵嫣', 0);
INSERT INTO `lookapi_tag` VALUES (55, '医疗', 0);
INSERT INTO `lookapi_tag` VALUES (56, '汤姆·赫兰德', 0);
INSERT INTO `lookapi_tag` VALUES (57, '西班牙', 0);
INSERT INTO `lookapi_tag` VALUES (58, '感人', 0);
INSERT INTO `lookapi_tag` VALUES (59, '格蕾塔·费尔南德斯', 0);
INSERT INTO `lookapi_tag` VALUES (60, '金高银', 0);
INSERT INTO `lookapi_tag` VALUES (61, '黑手党', 0);
INSERT INTO `lookapi_tag` VALUES (62, '漫威', 0);
INSERT INTO `lookapi_tag` VALUES (63, '萨赫勒・罗萨', 0);
INSERT INTO `lookapi_tag` VALUES (64, '克罗地亚', 0);
INSERT INTO `lookapi_tag` VALUES (65, '劳伦斯·菲什伯恩', 0);
INSERT INTO `lookapi_tag` VALUES (66, 'ARRI', 0);
INSERT INTO `lookapi_tag` VALUES (67, '美国', 0);
INSERT INTO `lookapi_tag` VALUES (68, '米莎·巴顿', 0);
INSERT INTO `lookapi_tag` VALUES (69, '换妻', 0);
INSERT INTO `lookapi_tag` VALUES (70, '残疾', 0);
INSERT INTO `lookapi_tag` VALUES (71, '丁海寅', 0);
INSERT INTO `lookapi_tag` VALUES (72, '岩井俊二', 0);
INSERT INTO `lookapi_tag` VALUES (73, '智障', 0);
INSERT INTO `lookapi_tag` VALUES (74, '英国', 0);
INSERT INTO `lookapi_tag` VALUES (75, '基努·里维斯', 0);
INSERT INTO `lookapi_tag` VALUES (76, '凯特·布兰切特', 0);
INSERT INTO `lookapi_tag` VALUES (77, '纪录片', 0);
INSERT INTO `lookapi_tag` VALUES (78, '师生恋', 0);
INSERT INTO `lookapi_tag` VALUES (79, '恐怖', 0);
INSERT INTO `lookapi_tag` VALUES (80, '奈哈·西贡索邦', 0);
INSERT INTO `lookapi_tag` VALUES (81, '爱情故事', 0);
INSERT INTO `lookapi_tag` VALUES (82, '动作', 0);
INSERT INTO `lookapi_tag` VALUES (83, '悬疑', 0);
INSERT INTO `lookapi_tag` VALUES (84, '冒险', 0);
INSERT INTO `lookapi_tag` VALUES (85, '西语', 0);
INSERT INTO `lookapi_tag` VALUES (86, '迈克尔·法斯宾德', 0);
INSERT INTO `lookapi_tag` VALUES (87, '音乐', 0);
INSERT INTO `lookapi_tag` VALUES (88, '社会', 0);
INSERT INTO `lookapi_tag` VALUES (89, '黛安·克鲁格', 0);
INSERT INTO `lookapi_tag` VALUES (90, '女巫', 0);
INSERT INTO `lookapi_tag` VALUES (91, '成东日', 0);
INSERT INTO `lookapi_tag` VALUES (92, '禁忌之恋', 0);
INSERT INTO `lookapi_tag` VALUES (93, '汉娜·赫斯普朗', 0);
INSERT INTO `lookapi_tag` VALUES (94, '林允儿', 0);
INSERT INTO `lookapi_tag` VALUES (95, '思考', 0);
INSERT INTO `lookapi_tag` VALUES (96, '纳塔利娅·德·莫利纳', 0);
INSERT INTO `lookapi_tag` VALUES (97, '派珀·佩拉博', 0);
INSERT INTO `lookapi_tag` VALUES (98, '平采娜·乐维瑟派布恩', 0);
INSERT INTO `lookapi_tag` VALUES (99, '马里奥·卡萨斯', 0);
INSERT INTO `lookapi_tag` VALUES (100, '无节操', 0);
INSERT INTO `lookapi_tag` VALUES (101, '莫妮卡·布雷多', 0);
INSERT INTO `lookapi_tag` VALUES (102, '迈克尔·拉帕波特', 0);
INSERT INTO `lookapi_tag` VALUES (103, '郑志薰', 0);
INSERT INTO `lookapi_tag` VALUES (104, '文素丽', 0);
INSERT INTO `lookapi_tag` VALUES (105, 'ALEXA', 0);
INSERT INTO `lookapi_tag` VALUES (106, '传记', 0);
INSERT INTO `lookapi_tag` VALUES (107, '马修·古迪', 0);
INSERT INTO `lookapi_tag` VALUES (108, '西尔莎·罗南', 0);
INSERT INTO `lookapi_tag` VALUES (109, 'les', 0);
INSERT INTO `lookapi_tag` VALUES (110, '斯万·阿劳德', 0);
INSERT INTO `lookapi_tag` VALUES (111, '阿方索·巴伦', 0);
INSERT INTO `lookapi_tag` VALUES (112, '埃斯特班·鲍威尔', 0);
INSERT INTO `lookapi_tag` VALUES (113, '尼泊尔', 0);
INSERT INTO `lookapi_tag` VALUES (114, '人物', 0);
INSERT INTO `lookapi_tag` VALUES (115, '詹妮弗·劳伦斯', 0);
INSERT INTO `lookapi_tag` VALUES (116, '比尔·斯卡斯加德', 0);
INSERT INTO `lookapi_tag` VALUES (117, '阿黛拉·哈内尔', 0);
INSERT INTO `lookapi_tag` VALUES (118, '艾丽·范宁', 0);
INSERT INTO `lookapi_tag` VALUES (119, '丰川悦司', 0);
INSERT INTO `lookapi_tag` VALUES (120, '动画', 0);
INSERT INTO `lookapi_tag` VALUES (121, '欧玛·艾普斯', 0);
INSERT INTO `lookapi_tag` VALUES (122, '阿莱', 0);
INSERT INTO `lookapi_tag` VALUES (123, '法律', 0);
INSERT INTO `lookapi_tag` VALUES (124, '安圣基', 0);
INSERT INTO `lookapi_tag` VALUES (125, '冷门', 0);
INSERT INTO `lookapi_tag` VALUES (126, '同性', 0);
INSERT INTO `lookapi_tag` VALUES (127, '人性', 0);
INSERT INTO `lookapi_tag` VALUES (128, '俄语', 0);
INSERT INTO `lookapi_tag` VALUES (129, '伊丽莎白·米切尔', 0);
INSERT INTO `lookapi_tag` VALUES (130, '俄罗斯', 0);
INSERT INTO `lookapi_tag` VALUES (131, '日本', 0);
INSERT INTO `lookapi_tag` VALUES (132, '中国人', 0);
INSERT INTO `lookapi_tag` VALUES (133, '杰森·斯坦森', 0);
INSERT INTO `lookapi_tag` VALUES (134, 'LGBT', 0);
INSERT INTO `lookapi_tag` VALUES (135, '奇幻', 0);
INSERT INTO `lookapi_tag` VALUES (136, '朴海俊', 0);
INSERT INTO `lookapi_tag` VALUES (137, '那达夫·拉皮德', 0);
INSERT INTO `lookapi_tag` VALUES (138, '金棕榈', 0);
INSERT INTO `lookapi_tag` VALUES (139, '英语', 0);
INSERT INTO `lookapi_tag` VALUES (140, '托马斯·科特', 0);
INSERT INTO `lookapi_tag` VALUES (141, '塞巴斯蒂安·科赫', 0);
INSERT INTO `lookapi_tag` VALUES (142, '蕾雅·赛杜', 0);
INSERT INTO `lookapi_tag` VALUES (143, '迪士尼系列', 0);
INSERT INTO `lookapi_tag` VALUES (144, '葆拉·贝尔', 0);
INSERT INTO `lookapi_tag` VALUES (145, '剧情', 0);
INSERT INTO `lookapi_tag` VALUES (146, '书店', 0);
INSERT INTO `lookapi_tag` VALUES (147, '杰克·吉伦哈尔', 0);
INSERT INTO `lookapi_tag` VALUES (148, '尤安娜·库里克', 0);
INSERT INTO `lookapi_tag` VALUES (149, '混剪', 0);
INSERT INTO `lookapi_tag` VALUES (150, '马克·米歇尔', 0);
INSERT INTO `lookapi_tag` VALUES (151, '詹妮弗·安妮斯顿', 0);
INSERT INTO `lookapi_tag` VALUES (152, '伊德里斯·艾尔巴', 0);
INSERT INTO `lookapi_tag` VALUES (153, '杰西卡·查斯坦', 0);
INSERT INTO `lookapi_tag` VALUES (154, '欧美', 0);
INSERT INTO `lookapi_tag` VALUES (155, '宝莲·艾格特', 0);
INSERT INTO `lookapi_tag` VALUES (156, '凡妮莎·柯比', 0);
INSERT INTO `lookapi_tag` VALUES (157, '玩具总动员', 0);
INSERT INTO `lookapi_tag` VALUES (158, '朴叙俊', 0);
INSERT INTO `lookapi_tag` VALUES (159, '中山美穗', 0);
INSERT INTO `lookapi_tag` VALUES (160, 'Avigail Kovari', 0);
INSERT INTO `lookapi_tag` VALUES (161, '犯罪', 0);
INSERT INTO `lookapi_tag` VALUES (162, '裴晟祐', 0);
INSERT INTO `lookapi_tag` VALUES (163, '詹姆斯·麦卡沃伊', 0);
INSERT INTO `lookapi_tag` VALUES (164, '萨莎·露丝', 0);
INSERT INTO `lookapi_tag` VALUES (165, '波兰', 0);
INSERT INTO `lookapi_tag` VALUES (166, '经典', 0);
INSERT INTO `lookapi_tag` VALUES (167, '二战', 0);
INSERT INTO `lookapi_tag` VALUES (168, '朴智炫', 0);
INSERT INTO `lookapi_tag` VALUES (169, 'x战警', 0);
INSERT INTO `lookapi_tag` VALUES (170, '法国', 0);
INSERT INTO `lookapi_tag` VALUES (171, '速度与激情', 0);
INSERT INTO `lookapi_tag` VALUES (172, '德尼·梅诺谢', 0);
INSERT INTO `lookapi_tag` VALUES (173, '海伦·米伦', 0);
INSERT INTO `lookapi_tag` VALUES (174, '泰伊·谢里丹', 0);
INSERT INTO `lookapi_tag` VALUES (175, 'Moran Rosenblatt', 0);
INSERT INTO `lookapi_tag` VALUES (176, '情书', 0);
INSERT INTO `lookapi_tag` VALUES (177, '道恩·强森', 0);
INSERT INTO `lookapi_tag` VALUES (178, '梅尔维尔·珀波', 0);
INSERT INTO `lookapi_tag` VALUES (179, '琳娜·海蒂', 0);
INSERT INTO `lookapi_tag` VALUES (180, '约翰·S.戴维斯', 0);
INSERT INTO `lookapi_tag` VALUES (181, '德语', 0);

-- ----------------------------
-- Table structure for lookapi_tv_link
-- ----------------------------
DROP TABLE IF EXISTS `lookapi_tv_link`;
CREATE TABLE `lookapi_tv_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lookapi_tv_link_movie_id_913d5c7e_fk_lookapi_movie_id`(`movie_id`) USING BTREE,
  CONSTRAINT `lookapi_tv_link_movie_id_913d5c7e_fk_lookapi_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `lookapi_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lookapi_tv_link
-- ----------------------------
INSERT INTO `lookapi_tv_link` VALUES (3, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 30);
INSERT INTO `lookapi_tv_link` VALUES (4, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 31);
INSERT INTO `lookapi_tv_link` VALUES (5, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 32);
INSERT INTO `lookapi_tv_link` VALUES (6, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 33);
INSERT INTO `lookapi_tv_link` VALUES (7, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 34);
INSERT INTO `lookapi_tv_link` VALUES (8, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 35);
INSERT INTO `lookapi_tv_link` VALUES (9, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 36);
INSERT INTO `lookapi_tv_link` VALUES (10, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 37);
INSERT INTO `lookapi_tv_link` VALUES (11, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 38);
INSERT INTO `lookapi_tv_link` VALUES (12, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 39);
INSERT INTO `lookapi_tv_link` VALUES (13, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 40);
INSERT INTO `lookapi_tv_link` VALUES (14, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 41);
INSERT INTO `lookapi_tv_link` VALUES (15, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 42);
INSERT INTO `lookapi_tv_link` VALUES (16, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 43);
INSERT INTO `lookapi_tv_link` VALUES (17, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 44);
INSERT INTO `lookapi_tv_link` VALUES (18, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 45);
INSERT INTO `lookapi_tv_link` VALUES (19, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 46);
INSERT INTO `lookapi_tv_link` VALUES (20, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 47);
INSERT INTO `lookapi_tv_link` VALUES (21, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 48);
INSERT INTO `lookapi_tv_link` VALUES (22, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 49);
INSERT INTO `lookapi_tv_link` VALUES (23, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 50);
INSERT INTO `lookapi_tv_link` VALUES (24, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 51);
INSERT INTO `lookapi_tv_link` VALUES (25, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 52);
INSERT INTO `lookapi_tv_link` VALUES (26, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 53);
INSERT INTO `lookapi_tv_link` VALUES (27, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 54);
INSERT INTO `lookapi_tv_link` VALUES (28, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 55);
INSERT INTO `lookapi_tv_link` VALUES (29, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 56);
INSERT INTO `lookapi_tv_link` VALUES (30, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 57);
INSERT INTO `lookapi_tv_link` VALUES (31, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 58);
INSERT INTO `lookapi_tv_link` VALUES (32, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 59);
INSERT INTO `lookapi_tv_link` VALUES (33, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 60);
INSERT INTO `lookapi_tv_link` VALUES (34, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 61);
INSERT INTO `lookapi_tv_link` VALUES (35, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 62);
INSERT INTO `lookapi_tv_link` VALUES (36, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 63);
INSERT INTO `lookapi_tv_link` VALUES (37, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 64);
INSERT INTO `lookapi_tv_link` VALUES (38, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 65);
INSERT INTO `lookapi_tv_link` VALUES (39, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 66);
INSERT INTO `lookapi_tv_link` VALUES (40, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 67);
INSERT INTO `lookapi_tv_link` VALUES (41, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 68);
INSERT INTO `lookapi_tv_link` VALUES (42, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 69);
INSERT INTO `lookapi_tv_link` VALUES (43, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 70);
INSERT INTO `lookapi_tv_link` VALUES (44, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 71);
INSERT INTO `lookapi_tv_link` VALUES (45, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 72);
INSERT INTO `lookapi_tv_link` VALUES (46, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 73);
INSERT INTO `lookapi_tv_link` VALUES (47, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 74);
INSERT INTO `lookapi_tv_link` VALUES (48, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 75);
INSERT INTO `lookapi_tv_link` VALUES (49, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 76);
INSERT INTO `lookapi_tv_link` VALUES (50, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 77);
INSERT INTO `lookapi_tv_link` VALUES (51, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 78);
INSERT INTO `lookapi_tv_link` VALUES (52, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 79);
INSERT INTO `lookapi_tv_link` VALUES (53, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 80);
INSERT INTO `lookapi_tv_link` VALUES (54, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 81);
INSERT INTO `lookapi_tv_link` VALUES (55, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 82);
INSERT INTO `lookapi_tv_link` VALUES (56, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 83);
INSERT INTO `lookapi_tv_link` VALUES (57, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 84);
INSERT INTO `lookapi_tv_link` VALUES (58, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 85);
INSERT INTO `lookapi_tv_link` VALUES (59, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 86);
INSERT INTO `lookapi_tv_link` VALUES (60, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 87);
INSERT INTO `lookapi_tv_link` VALUES (61, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 88);
INSERT INTO `lookapi_tv_link` VALUES (62, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 89);
INSERT INTO `lookapi_tv_link` VALUES (63, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 90);
INSERT INTO `lookapi_tv_link` VALUES (64, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 91);
INSERT INTO `lookapi_tv_link` VALUES (65, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 92);
INSERT INTO `lookapi_tv_link` VALUES (66, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 93);
INSERT INTO `lookapi_tv_link` VALUES (67, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 94);
INSERT INTO `lookapi_tv_link` VALUES (68, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 95);
INSERT INTO `lookapi_tv_link` VALUES (69, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 96);
INSERT INTO `lookapi_tv_link` VALUES (70, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 97);
INSERT INTO `lookapi_tv_link` VALUES (71, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 98);
INSERT INTO `lookapi_tv_link` VALUES (72, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 99);
INSERT INTO `lookapi_tv_link` VALUES (73, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 100);
INSERT INTO `lookapi_tv_link` VALUES (74, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 101);
INSERT INTO `lookapi_tv_link` VALUES (75, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 102);
INSERT INTO `lookapi_tv_link` VALUES (76, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 103);
INSERT INTO `lookapi_tv_link` VALUES (77, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 104);
INSERT INTO `lookapi_tv_link` VALUES (78, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 105);
INSERT INTO `lookapi_tv_link` VALUES (79, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 106);
INSERT INTO `lookapi_tv_link` VALUES (80, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 107);
INSERT INTO `lookapi_tv_link` VALUES (81, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 108);
INSERT INTO `lookapi_tv_link` VALUES (82, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 109);
INSERT INTO `lookapi_tv_link` VALUES (83, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 110);
INSERT INTO `lookapi_tv_link` VALUES (84, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 111);
INSERT INTO `lookapi_tv_link` VALUES (85, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 112);
INSERT INTO `lookapi_tv_link` VALUES (86, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 113);
INSERT INTO `lookapi_tv_link` VALUES (87, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 114);
INSERT INTO `lookapi_tv_link` VALUES (88, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 115);
INSERT INTO `lookapi_tv_link` VALUES (89, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 116);
INSERT INTO `lookapi_tv_link` VALUES (90, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 117);
INSERT INTO `lookapi_tv_link` VALUES (91, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 118);
INSERT INTO `lookapi_tv_link` VALUES (92, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 119);
INSERT INTO `lookapi_tv_link` VALUES (93, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 120);
INSERT INTO `lookapi_tv_link` VALUES (94, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 121);
INSERT INTO `lookapi_tv_link` VALUES (95, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 122);
INSERT INTO `lookapi_tv_link` VALUES (96, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 123);
INSERT INTO `lookapi_tv_link` VALUES (97, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 124);
INSERT INTO `lookapi_tv_link` VALUES (98, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 125);
INSERT INTO `lookapi_tv_link` VALUES (99, 1, 'http://q14723aic.bkt.clouddn.com/태리태리[VLOG] 보라카이.mp4', 126);
INSERT INTO `lookapi_tv_link` VALUES (100, 1, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (101, 2, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (102, 3, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (103, 4, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (104, 5, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (105, 6, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (106, 7, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (107, 8, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (108, 9, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (109, 10, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (110, 11, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (111, 12, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (112, 13, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (113, 14, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (114, 15, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (115, 16, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (116, 17, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (117, 18, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (118, 19, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (119, 20, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (120, 21, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (121, 22, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (122, 23, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (123, 24, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (124, 25, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 127);
INSERT INTO `lookapi_tv_link` VALUES (125, 1, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (126, 2, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (127, 3, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (128, 4, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (129, 5, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (130, 6, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (131, 7, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (132, 8, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (133, 9, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (134, 10, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (135, 11, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (136, 12, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (137, 13, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (138, 14, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (139, 15, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (140, 16, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (141, 17, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (142, 18, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (143, 19, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (144, 20, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 128);
INSERT INTO `lookapi_tv_link` VALUES (145, 1, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 129);
INSERT INTO `lookapi_tv_link` VALUES (146, 2, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 129);
INSERT INTO `lookapi_tv_link` VALUES (147, 3, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 129);
INSERT INTO `lookapi_tv_link` VALUES (148, 4, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 129);
INSERT INTO `lookapi_tv_link` VALUES (149, 5, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 129);
INSERT INTO `lookapi_tv_link` VALUES (150, 6, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 129);
INSERT INTO `lookapi_tv_link` VALUES (151, 7, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 129);
INSERT INTO `lookapi_tv_link` VALUES (152, 8, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 129);
INSERT INTO `lookapi_tv_link` VALUES (153, 9, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 129);
INSERT INTO `lookapi_tv_link` VALUES (154, 10, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 129);
INSERT INTO `lookapi_tv_link` VALUES (155, 1, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 130);
INSERT INTO `lookapi_tv_link` VALUES (156, 2, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 130);
INSERT INTO `lookapi_tv_link` VALUES (157, 3, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 130);
INSERT INTO `lookapi_tv_link` VALUES (158, 4, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 130);
INSERT INTO `lookapi_tv_link` VALUES (159, 5, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 130);
INSERT INTO `lookapi_tv_link` VALUES (160, 6, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 130);
INSERT INTO `lookapi_tv_link` VALUES (161, 1, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (162, 2, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (163, 3, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (164, 4, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (165, 5, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (166, 6, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (167, 7, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (168, 8, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (169, 9, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (170, 10, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (171, 11, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (172, 12, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (173, 13, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (174, 14, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (175, 15, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (176, 16, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (177, 17, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (178, 18, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (179, 19, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (180, 20, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (181, 21, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (182, 22, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (183, 23, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (184, 24, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (185, 25, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 131);
INSERT INTO `lookapi_tv_link` VALUES (186, 1, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (187, 2, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (188, 3, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (189, 4, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (190, 5, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (191, 6, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (192, 7, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (193, 8, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (194, 9, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (195, 10, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (196, 11, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (197, 12, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (198, 13, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (199, 14, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (200, 15, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (201, 16, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (202, 17, 'http://q14723aic.bkt.clouddn.com/video/3.v-cloak%E6%8C%87%E4%BB%A4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (203, 18, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (204, 19, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (205, 20, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (206, 21, 'http://q14723aic.bkt.clouddn.com/%ED%83%9C%EB%A6%AC%ED%83%9C%EB%A6%AC%5BVLOG%5D%20%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (207, 22, 'http://q14723aic.bkt.clouddn.com/video/2.v-once%E6%8C%87%E4%BB%A4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (208, 23, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (209, 24, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (210, 25, 'http://q14723aic.bkt.clouddn.com/video/4.%E6%9D%A1%E4%BB%B6%E6%8C%87%E4%BB%A4.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (211, 26, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (212, 27, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (213, 28, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (214, 29, 'http://q14723aic.bkt.clouddn.com/8%E8%AE%A2%E5%8D%95%E6%B5%81%E7%A8%8B%E7%9A%84%E6%80%BB%E7%BB%93.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (215, 30, 'http://q14723aic.bkt.clouddn.com/video/5.%E6%9D%A1%E4%BB%B6%E5%AE%B6%E6%97%8F%E4%B8%8E%E6%A1%88%E4%BE%8B.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (216, 31, 'http://q14723aic.bkt.clouddn.com/video/1.%E5%A4%8D%E4%B9%A0.mp4', 132);
INSERT INTO `lookapi_tv_link` VALUES (217, 1, 'http://q14723aic.bkt.clouddn.com/vip/movie/1.1.jupternotebook%E7%9A%84%E5%AE%89%E8%A3%85%E5%92%8C%E5%90%AF%E5%8A%A8%E4%BB%8B%E7%BB%8D%28Av73333690,P1%29.mp4', 133);
INSERT INTO `lookapi_tv_link` VALUES (218, 1, 'http://q14723aic.bkt.clouddn.com/vip/movie/1.1.jupternotebook%E7%9A%84%E5%AE%89%E8%A3%85%E5%92%8C%E5%90%AF%E5%8A%A8%E4%BB%8B%E7%BB%8D%28Av73333690,P1%29.mp4', 134);

-- ----------------------------
-- Table structure for lookapi_up_down
-- ----------------------------
DROP TABLE IF EXISTS `lookapi_up_down`;
CREATE TABLE `lookapi_up_down`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_up` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lookapi_up_down_movie_id_3b3afa9d`(`movie_id`) USING BTREE,
  INDEX `lookapi_up_down_user_id_0f5392b9`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for luffy_banner
-- ----------------------------
DROP TABLE IF EXISTS `luffy_banner`;
CREATE TABLE `luffy_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `link` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of luffy_banner
-- ----------------------------
INSERT INTO `luffy_banner` VALUES (1, 'banner/007UW77jly1g7hp84qdzcj30nw0a0jt6.jpg', '速度与激情:特别行动', '没得感情', 'https://www.cnblogs.com/asdaa/', 10, 1, 0);
INSERT INTO `luffy_banner` VALUES (2, 'banner/007UW77jly1g8gepkq89kj30nw0a0jtc.jpg', '英雄学院', '第四季', 'https://www.cnblogs.com/asdaa/', 200, 1, 0);
INSERT INTO `luffy_banner` VALUES (3, 'banner/007UW77jly1g7590nupqpj30nw0a0wfz.jpg', '东京不热', '没得感情', 'https://www.cnblogs.com/asdaa/', 50, 1, 0);
INSERT INTO `luffy_banner` VALUES (4, 'banner/071015.93152214_860X360.jpg', '过新年', '没得感情', 'https://www.cnblogs.com/asdaa/', 30, 1, 0);
INSERT INTO `luffy_banner` VALUES (5, 'banner/104408.37049938_860X360.jpg', '使徒行者', '烂片', 'https://www.cnblogs.com/asdaa/', 5, 1, 0);

-- ----------------------------
-- Table structure for movie_rote
-- ----------------------------
DROP TABLE IF EXISTS `movie_rote`;
CREATE TABLE `movie_rote`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rote` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5947 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie_rote
-- ----------------------------
INSERT INTO `movie_rote` VALUES (5937, 98, 1, 4);
INSERT INTO `movie_rote` VALUES (5938, 95, 1, 2);
INSERT INTO `movie_rote` VALUES (5939, 95, 4, 5);
INSERT INTO `movie_rote` VALUES (5940, 90, 4, 4);
INSERT INTO `movie_rote` VALUES (5941, 101, 4, 3);
INSERT INTO `movie_rote` VALUES (5942, 38, 4, 4);
INSERT INTO `movie_rote` VALUES (5943, 68, 4, 4);
INSERT INTO `movie_rote` VALUES (5944, 133, 4, 4);
INSERT INTO `movie_rote` VALUES (5945, 128, 1, 4);
INSERT INTO `movie_rote` VALUES (5946, 130, 1, 5);

-- ----------------------------
-- Table structure for user_chasing
-- ----------------------------
DROP TABLE IF EXISTS `user_chasing`;
CREATE TABLE `user_chasing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` int(10) DEFAULT 0,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_chasing
-- ----------------------------
INSERT INTO `user_chasing` VALUES (2, 130, 1, 0, '2019-11-21');
INSERT INTO `user_chasing` VALUES (3, 128, 1, 0, '2019-11-21');
INSERT INTO `user_chasing` VALUES (4, 129, 1, 1, '2019-11-22');
INSERT INTO `user_chasing` VALUES (5, 127, 1, 0, '2019-11-22');

-- ----------------------------
-- Table structure for user_order
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order`  (
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pay_status` smallint(4) NOT NULL DEFAULT 0,
  `payed` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `order_total` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `pay_app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `creat_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_order
-- ----------------------------
INSERT INTO `user_order` VALUES ('0224ea150d7555b6f5c8f08b7b605e8c', 'finish', 1, 0.00, 148.00, '支付宝', 00000000001, '2019-11-19 18:54:10', '2019-11-19 18:54:45', 1);
INSERT INTO `user_order` VALUES ('0c6aff8b04e2d3856b80eaf733455e43', 'active', 0, 0.00, 148.00, '支付宝', 00000000001, '2019-11-19 18:34:07', '2019-11-19 18:34:07', 1);
INSERT INTO `user_order` VALUES ('2b3861e0264b6119b21d2ff58fa2c3e0', 'finish', 1, 0.00, 148.00, '支付宝', 00000000004, '2019-11-20 20:58:27', '2019-11-20 20:59:00', 1);
INSERT INTO `user_order` VALUES ('30c32bf44863ed5d16b35648cef9027f', 'active', 0, 0.00, 45.00, '支付宝', 00000000001, '2019-11-22 01:02:26', '2019-11-22 01:02:26', 2);
INSERT INTO `user_order` VALUES ('5268a22a9692ccb223bce34caf8dface', 'finish', 1, 0.00, 148.00, '支付宝', 00000000001, '2019-11-19 18:56:21', '2019-11-19 18:56:51', 1);
INSERT INTO `user_order` VALUES ('5c0a53c4328d9d81c4653f8e17c7f695', 'active', 0, 0.00, 148.00, '支付宝', 00000000001, '2019-11-19 17:10:15', '2019-11-19 17:10:15', 1);
INSERT INTO `user_order` VALUES ('70714da2f54eabca7fe521990c8480c9', 'active', 0, 0.00, 148.00, '支付宝', 00000000001, '2019-11-20 08:53:05', '2019-11-20 08:53:05', 1);
INSERT INTO `user_order` VALUES ('8f9c6cc85791f3c31ab37dda984e57af', 'active', 0, 0.00, 45.00, '支付宝', 00000000001, '2019-11-19 17:05:25', '2019-11-19 17:05:25', 2);
INSERT INTO `user_order` VALUES ('9397fb71fed057fffd924b5c338876e4', 'finish', 1, 0.00, 148.00, '支付宝', 00000000001, '2019-11-19 20:30:08', '2019-11-19 20:31:41', 1);
INSERT INTO `user_order` VALUES ('ae33a64f58559c37afe986583df38f3b', 'finish', 1, 0.00, 148.00, '支付宝', 00000000001, '2019-11-19 18:59:25', '2019-11-19 18:59:57', 1);
INSERT INTO `user_order` VALUES ('b9a6434de6079a68bd2a7adec578b355', 'finish', 1, 0.00, 148.00, '支付宝', 00000000001, '2019-11-20 21:00:57', '2019-11-20 21:01:28', 1);
INSERT INTO `user_order` VALUES ('c0cec885bac0fd5af521d1be797d7fa1', 'finish', 1, 0.00, 148.00, '支付宝', 00000000001, '2019-11-19 19:50:32', '2019-11-19 19:51:09', 1);
INSERT INTO `user_order` VALUES ('c1b62791f4bed19d5390debc2052eadc', 'active', 0, 0.00, 45.00, '支付宝', 00000000001, '2019-11-19 17:01:41', '2019-11-19 17:01:41', 2);
INSERT INTO `user_order` VALUES ('da20f8647863288b0bea7e0cbcc0e593', 'active', 0, 0.00, 148.00, '支付宝', 00000000001, '2019-11-19 18:33:30', '2019-11-19 18:33:30', 1);
INSERT INTO `user_order` VALUES ('e7eccdd2ecf6fa111821d1c658f692d4', 'finish', 1, 0.00, 148.00, '支付宝', 00000000001, '2019-11-19 18:55:20', '2019-11-19 18:55:53', 1);
INSERT INTO `user_order` VALUES ('f201bba84e43e0c7bb19917c94f1d5fe', 'active', 0, 0.00, 148.00, '支付宝', 00000000001, '2019-11-20 11:37:03', '2019-11-20 11:37:03', 1);

-- ----------------------------
-- Table structure for user_record
-- ----------------------------
DROP TABLE IF EXISTS `user_record`;
CREATE TABLE `user_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_record
-- ----------------------------
INSERT INTO `user_record` VALUES (6, 1, 56, '2019-11-20 08:48:33');
INSERT INTO `user_record` VALUES (7, 1, 50, '2019-11-10 19:52:25');
INSERT INTO `user_record` VALUES (9, 1, 82, '2019-11-21 15:41:13');
INSERT INTO `user_record` VALUES (27, 1, 133, '2019-11-22 00:36:27');
INSERT INTO `user_record` VALUES (28, 1, 134, '2019-11-22 01:02:39');
INSERT INTO `user_record` VALUES (29, 1, 128, '2019-11-22 00:03:43');
INSERT INTO `user_record` VALUES (30, 1, 99, '2019-11-20 11:21:53');
INSERT INTO `user_record` VALUES (32, 1, 73, '2019-11-20 11:23:08');
INSERT INTO `user_record` VALUES (34, 1, 130, '2019-11-22 00:36:37');
INSERT INTO `user_record` VALUES (35, 1, 76, '2019-11-21 23:19:42');
INSERT INTO `user_record` VALUES (36, 3, 134, '2019-11-20 14:49:12');
INSERT INTO `user_record` VALUES (37, 3, 68, '2019-11-20 14:59:29');
INSERT INTO `user_record` VALUES (38, 3, 133, '2019-11-20 15:35:47');
INSERT INTO `user_record` VALUES (39, 3, 82, '2019-11-20 15:35:53');
INSERT INTO `user_record` VALUES (40, 1, 75, '2019-11-20 20:10:23');
INSERT INTO `user_record` VALUES (41, 4, 77, '2019-11-20 20:19:15');
INSERT INTO `user_record` VALUES (42, 4, 134, '2019-11-21 21:00:57');
INSERT INTO `user_record` VALUES (43, 4, 93, '2019-11-21 14:33:31');
INSERT INTO `user_record` VALUES (44, 1, 129, '2019-11-22 00:11:14');
INSERT INTO `user_record` VALUES (45, 4, 133, '2019-11-21 21:02:26');
INSERT INTO `user_record` VALUES (46, 4, 128, '2019-11-21 20:34:57');
INSERT INTO `user_record` VALUES (47, 4, 71, '2019-11-21 12:04:40');
INSERT INTO `user_record` VALUES (48, 4, 31, '2019-11-21 12:04:10');
INSERT INTO `user_record` VALUES (49, 4, 131, '2019-11-21 12:04:50');
INSERT INTO `user_record` VALUES (50, 4, 103, '2019-11-21 14:24:18');
INSERT INTO `user_record` VALUES (51, 4, 107, '2019-11-21 14:31:53');
INSERT INTO `user_record` VALUES (52, 4, 129, '2019-11-21 14:38:12');
INSERT INTO `user_record` VALUES (53, 4, 76, '2019-11-21 20:34:55');
INSERT INTO `user_record` VALUES (54, 1, 98, '2019-11-22 08:31:21');
INSERT INTO `user_record` VALUES (55, 1, 95, '2019-11-21 21:09:10');
INSERT INTO `user_record` VALUES (56, 4, 95, '2019-11-21 18:56:59');
INSERT INTO `user_record` VALUES (57, 4, 90, '2019-11-21 19:56:12');
INSERT INTO `user_record` VALUES (58, 4, 101, '2019-11-21 20:34:48');
INSERT INTO `user_record` VALUES (59, 4, 38, '2019-11-21 20:32:48');
INSERT INTO `user_record` VALUES (60, 4, 68, '2019-11-21 20:34:43');
INSERT INTO `user_record` VALUES (61, 4, 82, '2019-11-21 20:35:03');
INSERT INTO `user_record` VALUES (62, 4, 98, '2019-11-21 20:42:01');
INSERT INTO `user_record` VALUES (63, 1, 33, '2019-11-21 23:09:57');
INSERT INTO `user_record` VALUES (64, 1, 68, '2019-11-22 00:59:06');
INSERT INTO `user_record` VALUES (65, 1, 106, '2019-11-22 01:02:48');
INSERT INTO `user_record` VALUES (66, 1, 127, '2019-11-22 08:31:35');

-- ----------------------------
-- Table structure for user_user
-- ----------------------------
DROP TABLE IF EXISTS `user_user`;
CREATE TABLE `user_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_vip` tinyint(1) NOT NULL,
  `vip_exp` datetime(6) DEFAULT NULL,
  `vip_level` int(11) DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` smallint(6) NOT NULL DEFAULT 3,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_user
-- ----------------------------
INSERT INTO `user_user` VALUES (1, 'pbkdf2_sha256$100000$oSco3RfcOybx$M6RJLBGQ5EnP+fDgAHrz5Al2+XkM9e5Rh+DRDRsIGbk=', '2019-11-19 20:38:28.807159', 1, 'admin', '', '', '', 1, 1, '2019-11-19 19:35:10.000000', '', 1, '2024-10-23 19:51:04.714088', 1, 'avatar/tank大帅比.png', 1, '成功恢复规划', '2019-11-11 08:00:00');
INSERT INTO `user_user` VALUES (4, 'pbkdf2_sha256$100000$Iw6Zb9Vuodx6$aBcFbnCdRTbx/3JAmJLz6xlLxuMnC2/zLPi9aExdALc=', NULL, 0, 'tankDSb', '', '', '', 0, 1, '2019-11-20 18:56:41.195406', '13706198258', 1, '2020-11-14 20:58:59.699820', 1, 'avatar/tank大帅比.png', 1, '我叫tank,我是大帅比', '2019-11-26 00:00:00');

-- ----------------------------
-- Table structure for user_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_user_groups`;
CREATE TABLE `user_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_user_groups_user_id_group_id_bb60391f_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `user_user_groups_group_id_c57f13c0_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `user_user_groups_group_id_c57f13c0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_user_groups_user_id_13f9a20d_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_user_user_permissions`;
CREATE TABLE `user_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_user_user_permissions_user_id_31782f58_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vip_product
-- ----------------------------
DROP TABLE IF EXISTS `vip_product`;
CREATE TABLE `vip_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `months` smallint(6) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `real_price` decimal(10, 2) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vip_product
-- ----------------------------
INSERT INTO `vip_product` VALUES (1, 12, 233.00, 148.00, '年度大会员');
INSERT INTO `vip_product` VALUES (2, 3, 68.00, 45.00, '季度大会员');
INSERT INTO `vip_product` VALUES (3, 1, 25.00, 15.00, '包月大会员');

SET FOREIGN_KEY_CHECKS = 1;
