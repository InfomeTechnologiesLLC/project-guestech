-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 16, 2024 at 06:47 AM
-- Server version: 8.0.34
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infomeglobal_guesttech`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add build card type', 7, 'add_buildcardtype'),
(26, 'Can change build card type', 7, 'change_buildcardtype'),
(27, 'Can delete build card type', 7, 'delete_buildcardtype'),
(28, 'Can view build card type', 7, 'view_buildcardtype'),
(29, 'Can add event card type', 8, 'add_eventcardtype'),
(30, 'Can change event card type', 8, 'change_eventcardtype'),
(31, 'Can delete event card type', 8, 'delete_eventcardtype'),
(32, 'Can view event card type', 8, 'view_eventcardtype'),
(33, 'Can add vapp card type', 9, 'add_vappcardtype'),
(34, 'Can change vapp card type', 9, 'change_vappcardtype'),
(35, 'Can delete vapp card type', 9, 'delete_vappcardtype'),
(36, 'Can view vapp card type', 9, 'view_vappcardtype'),
(37, 'Can add vehicle type', 10, 'add_vehicletype'),
(38, 'Can change vehicle type', 10, 'change_vehicletype'),
(39, 'Can delete vehicle type', 10, 'delete_vehicletype'),
(40, 'Can view vehicle type', 10, 'view_vehicletype'),
(41, 'Can add vapp registrations', 11, 'add_vappregistrations'),
(42, 'Can change vapp registrations', 11, 'change_vappregistrations'),
(43, 'Can delete vapp registrations', 11, 'delete_vappregistrations'),
(44, 'Can view vapp registrations', 11, 'view_vappregistrations'),
(45, 'Can add event registrations', 12, 'add_eventregistrations'),
(46, 'Can change event registrations', 12, 'change_eventregistrations'),
(47, 'Can delete event registrations', 12, 'delete_eventregistrations'),
(48, 'Can view event registrations', 12, 'view_eventregistrations'),
(49, 'Can add build registrations', 13, 'add_buildregistrations'),
(50, 'Can change build registrations', 13, 'change_buildregistrations'),
(51, 'Can delete build registrations', 13, 'delete_buildregistrations'),
(52, 'Can view build registrations', 13, 'view_buildregistrations'),
(53, 'Can add days table', 14, 'add_daystable'),
(54, 'Can change days table', 14, 'change_daystable'),
(55, 'Can delete days table', 14, 'delete_daystable'),
(56, 'Can view days table', 14, 'view_daystable'),
(57, 'Can add user role', 15, 'add_userrole'),
(58, 'Can change user role', 15, 'change_userrole'),
(59, 'Can delete user role', 15, 'delete_userrole'),
(60, 'Can view user role', 15, 'view_userrole'),
(61, 'Can add user profile', 16, 'add_userprofile'),
(62, 'Can change user profile', 16, 'change_userprofile'),
(63, 'Can delete user profile', 16, 'delete_userprofile'),
(64, 'Can view user profile', 16, 'view_userprofile'),
(65, 'Can add profile', 16, 'add_profile'),
(66, 'Can change profile', 16, 'change_profile'),
(67, 'Can delete profile', 16, 'delete_profile'),
(68, 'Can view profile', 16, 'view_profile'),
(69, 'Can add rooms', 17, 'add_rooms'),
(70, 'Can change rooms', 17, 'change_rooms'),
(71, 'Can delete rooms', 17, 'delete_rooms'),
(72, 'Can view rooms', 17, 'view_rooms'),
(73, 'Can add entry log', 18, 'add_entrylog'),
(74, 'Can change entry log', 18, 'change_entrylog'),
(75, 'Can delete entry log', 18, 'delete_entrylog'),
(76, 'Can view entry log', 18, 'view_entrylog');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$uFibqwU4Diucx925TTK7TY$H1NjSDKMyLHUNtwvp3c6+tHUIJ32ZkdPX3D1bg8vkZ4=', '2024-05-15 09:29:08.187402', 1, 'admin', '', '', '', 1, 1, '2024-05-08 09:30:35.921551'),
(2, 'pbkdf2_sha256$320000$5hes4AMn6kTLH86elBn5sS$ELY9opFSYlqU0MIyPXF/KR0Zx3oL2ktFAV+yLBGqu28=', '2024-05-16 06:43:14.408755', 1, 'volunteer1', '', '', '', 1, 1, '2024-05-15 06:14:37.418174');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `build_cardtype`
--

DROP TABLE IF EXISTS `build_cardtype`;
CREATE TABLE IF NOT EXISTS `build_cardtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `show_in_form` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `build_registrations`
--

DROP TABLE IF EXISTS `build_registrations`;
CREATE TABLE IF NOT EXISTS `build_registrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` longtext NOT NULL,
  `last_name` longtext NOT NULL,
  `email` longtext,
  `company` longtext,
  `id_proof_expiry` date DEFAULT NULL,
  `id_proof_type` varchar(50) NOT NULL,
  `id_proof_number` longtext,
  `id_proof_front` varchar(100) DEFAULT NULL,
  `id_proof_back` varchar(100) DEFAULT NULL,
  `remark` longtext,
  `collected` tinyint(1) NOT NULL,
  `print_count` int NOT NULL,
  `verification` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cardtype_id` bigint NOT NULL,
  `dob` date DEFAULT NULL,
  `mobile` longtext,
  `lanyard_color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `build_registrations_cardtype_id_c7a08e4c_fk_build_cardtype_id` (`cardtype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(18, 'check_in_and_check_out', 'entrylog'),
(17, 'check_in_and_check_out', 'rooms'),
(5, 'contenttypes', 'contenttype'),
(7, 'portal', 'buildcardtype'),
(13, 'portal', 'buildregistrations'),
(14, 'portal', 'daystable'),
(8, 'portal', 'eventcardtype'),
(12, 'portal', 'eventregistrations'),
(16, 'portal', 'profile'),
(15, 'portal', 'userrole'),
(9, 'portal', 'vappcardtype'),
(11, 'portal', 'vappregistrations'),
(10, 'portal', 'vehicletype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-05-08 09:28:52.429649'),
(2, 'auth', '0001_initial', '2024-05-08 09:28:53.612731'),
(3, 'admin', '0001_initial', '2024-05-08 09:28:53.862612'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-05-08 09:28:53.879114'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-08 09:28:53.901293'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-05-08 09:28:54.045694'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-05-08 09:28:54.179107'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-05-08 09:28:54.313894'),
(9, 'auth', '0004_alter_user_username_opts', '2024-05-08 09:28:54.316827'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-05-08 09:28:54.445455'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-05-08 09:28:54.446567'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-05-08 09:28:54.490706'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-05-08 09:28:54.612887'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-05-08 09:28:54.734880'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-05-08 09:28:54.848287'),
(16, 'auth', '0011_update_proxy_permissions', '2024-05-08 09:28:54.862092'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-05-08 09:28:55.089639'),
(18, 'portal', '0001_initial', '2024-05-08 09:28:55.819008'),
(19, 'portal', '0002_remove_buildcardtype_show_in_form_and_more', '2024-05-08 09:28:55.897708'),
(20, 'portal', '0003_buildcardtype_show_in_form_and_more', '2024-05-08 09:28:56.039079'),
(21, 'portal', '0004_remove_buildregistrations_dob_and_more', '2024-05-08 09:28:56.112348'),
(22, 'portal', '0005_buildregistrations_dob_buildregistrations_mobile', '2024-05-08 09:28:56.174641'),
(23, 'portal', '0006_buildregistrations_lanyard_color', '2024-05-08 09:28:56.217415'),
(24, 'sessions', '0001_initial', '2024-05-08 09:28:56.333181'),
(25, 'portal', '0007_daystable_eventregistrations_days', '2024-05-13 04:51:39.090703'),
(26, 'portal', '0008_userrole', '2024-05-14 11:13:29.207129'),
(27, 'portal', '0009_alter_userrole_table_userprofile', '2024-05-14 11:16:11.652125'),
(28, 'portal', '0010_alter_userrole_name', '2024-05-14 11:20:57.437183'),
(29, 'portal', '0011_rename_userprofile_profile', '2024-05-14 11:26:31.609575'),
(30, 'check_in_and_check_out', '0001_initial', '2024-05-15 07:15:40.129050'),
(31, 'check_in_and_check_out', '0002_rename_activate_rooms_active', '2024-05-15 07:23:58.874221'),
(32, 'check_in_and_check_out', '0003_entrylog_room', '2024-05-15 12:17:48.090397');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6e09jdbmcbz3kbg9vkmpf98icf3omib8', '.eJxVjMEOwiAQRP-FsyFSWAgevfsNhGUXqRpISnsy_rs06UGPM-_NvEWI21rC1nkJM4mLmMTpt8OYnlx3QI9Y702mVtdlRrkr8qBd3hrx63q4fwcl9jLWkNEwsEPt0FHyGtTkdY7a2kQGCRmT4bNyQyQDIyfOCgjYe2sdic8XDdI5NQ:1s7Awn:rjXuktYSGEZzp8O_5_kX804YaXwQmcapbB074hTOlcE', '2024-05-29 09:29:17.529397'),
('7ujod9k84n3w6jgyqhvf8g58vig1vhrg', '.eJxVjMsOwiAQRf-FtSHAUB4u3fsNZIBBqgaS0q6M_65NutDtPefcFwu4rTVsg5YwZ3Zmkp1-t4jpQW0H-Y7t1nnqbV3myHeFH3Twa8_0vBzu30HFUb-1y9ZPKJUXkrxE0kppMtnBBAJldGg0OVJOmpRKsQZUNBlBExQBFoG9P8kgN20:1s6PYz:0xLPAx9ijsVjMiujVi49pHwMh8dA9DEm4wijacIr0g4', '2024-05-27 06:53:33.013931'),
('r4y65yjw2dvx3dxpzmvv7z7mq0tj55jc', '.eJxVjMEOwiAQRP-FsyFSWAgevfsNhGUXqRpISnsy_rs06UGPM-_NvEWI21rC1nkJM4mLmMTpt8OYnlx3QI9Y702mVtdlRrkr8qBd3hrx63q4fwcl9jLWkNEwsEPt0FHyGtTkdY7a2kQGCRmT4bNyQyQDIyfOCgjYe2sdic8XDdI5NQ:1s7Upe:sQtpMAb3awTOdPlD28gApTGoEYMCdeUFmQD1_ET8SLQ', '2024-05-30 06:43:14.414049'),
('ru1ts5yucwveetxf3cqd6dt2agb20oag', '.eJxVjMsOwiAQRf-FtSHAUB4u3fsNZIBBqgaS0q6M_65NutDtPefcFwu4rTVsg5YwZ3Zmkp1-t4jpQW0H-Y7t1nnqbV3myHeFH3Twa8_0vBzu30HFUb-1y9ZPKJUXkrxE0kppMtnBBAJldGg0OVJOmpRKsQZUNBlBExQBFoG9P8kgN20:1s5JcJ:G9YTEcj9_qLkH8lCC1iBp52w-1e_2bY-ARwZuXwBK-g', '2024-05-24 06:20:27.945843'),
('x66x6dqcpr76rnqkxmjoa4lzcrma1dpd', '.eJxVjMsOwiAQRf-FtSHAUB4u3fsNZIBBqgaS0q6M_65NutDtPefcFwu4rTVsg5YwZ3Zmkp1-t4jpQW0H-Y7t1nnqbV3myHeFH3Twa8_0vBzu30HFUb-1y9ZPKJUXkrxE0kppMtnBBAJldGg0OVJOmpRKsQZUNBlBExQBFoG9P8kgN20:1s4unE:6HZry-jT2sKd1xekUtvRqREuTPJCq5VauIMOgenwwbA', '2024-05-23 03:50:04.481372');

-- --------------------------------------------------------

--
-- Table structure for table `entry_log`
--

DROP TABLE IF EXISTS `entry_log`;
CREATE TABLE IF NOT EXISTS `entry_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entry_status` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `registration_id` bigint NOT NULL,
  `room_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_log_registration_id_c0c3e91f_fk_event_registrations_id` (`registration_id`),
  KEY `entry_log_room_id_d37f5b65_fk_rooms_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `entry_log`
--

INSERT INTO `entry_log` (`id`, `entry_status`, `created_at`, `updated_at`, `active`, `registration_id`, `room_id`) VALUES
(1, 2, '2024-05-15 12:17:56.836910', '2024-05-15 12:17:56.836910', 1, 12, 1),
(2, 2, '2024-05-15 12:18:13.367283', '2024-05-15 12:18:13.367283', 1, 12, 1),
(3, 2, '2024-05-15 12:18:29.656858', '2024-05-15 12:18:29.656858', 1, 12, 1),
(4, 2, '2024-05-15 12:19:02.421291', '2024-05-15 12:19:02.421291', 1, 12, 1),
(5, 2, '2024-05-15 12:20:34.905708', '2024-05-15 12:20:34.905708', 1, 12, 1),
(6, 2, '2024-05-15 12:22:35.368024', '2024-05-15 12:22:35.368024', 1, 12, 1),
(7, 2, '2024-05-15 12:24:12.904000', '2024-05-15 12:24:12.904000', 1, 12, 1),
(8, 2, '2024-05-15 12:26:03.241203', '2024-05-15 12:26:03.241203', 1, 12, 1),
(9, 2, '2024-05-15 12:26:12.548184', '2024-05-15 12:26:12.548184', 1, 12, 1),
(10, 2, '2024-05-15 12:26:29.076173', '2024-05-15 12:26:29.076173', 1, 12, 1),
(11, 2, '2024-05-15 12:31:58.110729', '2024-05-15 12:31:58.110729', 1, 12, 1),
(12, 1, '2024-05-16 05:19:48.844402', '2024-05-16 05:19:48.844402', 1, 1, 1),
(13, 1, '2024-05-16 05:19:54.376207', '2024-05-16 05:19:54.376207', 1, 1, 1),
(14, 1, '2024-05-16 05:19:59.017381', '2024-05-16 05:19:59.017381', 1, 1, 1),
(15, 1, '2024-05-16 05:20:03.296266', '2024-05-16 05:20:03.296266', 1, 1, 1),
(16, 1, '2024-05-16 05:20:05.006482', '2024-05-16 05:20:05.007990', 1, 1, 1),
(17, 1, '2024-05-16 05:20:05.946247', '2024-05-16 05:20:05.946247', 1, 1, 1),
(18, 1, '2024-05-16 05:20:06.972586', '2024-05-16 05:20:06.972586', 1, 1, 1),
(19, 1, '2024-05-16 05:20:08.168130', '2024-05-16 05:20:08.168130', 1, 1, 1),
(20, 1, '2024-05-16 05:20:10.909964', '2024-05-16 05:20:10.909964', 1, 3, 1),
(21, 1, '2024-05-16 05:20:14.294296', '2024-05-16 05:20:14.294296', 1, 4, 1),
(22, 1, '2024-05-16 05:20:17.684791', '2024-05-16 05:20:17.684791', 1, 1, 1),
(23, 1, '2024-05-16 05:32:17.514962', '2024-05-16 05:32:17.514962', 1, 20, 1),
(24, 1, '2024-05-16 05:45:11.963327', '2024-05-16 05:45:11.963327', 1, 20, 1),
(25, 1, '2024-05-16 06:35:58.642720', '2024-05-16 06:35:58.642720', 1, 20, 2),
(26, 1, '2024-05-16 06:36:57.582560', '2024-05-16 06:36:57.582560', 1, 20, 2),
(27, 1, '2024-05-16 06:37:03.330390', '2024-05-16 06:37:03.330390', 1, 20, 2),
(28, 1, '2024-05-16 06:37:09.825229', '2024-05-16 06:37:09.825229', 1, 20, 2),
(29, 1, '2024-05-16 06:37:16.193362', '2024-05-16 06:37:16.193362', 1, 20, 2),
(30, 1, '2024-05-16 06:37:22.140313', '2024-05-16 06:37:22.140313', 1, 20, 2),
(31, 1, '2024-05-16 06:37:22.571435', '2024-05-16 06:37:22.571435', 1, 20, 2),
(32, 1, '2024-05-16 06:37:23.025410', '2024-05-16 06:37:23.025410', 1, 20, 2),
(33, 1, '2024-05-16 06:37:23.400564', '2024-05-16 06:37:23.400564', 1, 20, 2),
(34, 1, '2024-05-16 06:37:23.764620', '2024-05-16 06:37:23.764620', 1, 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `event_cardtype`
--

DROP TABLE IF EXISTS `event_cardtype`;
CREATE TABLE IF NOT EXISTS `event_cardtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `show_in_form` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `event_cardtype`
--

INSERT INTO `event_cardtype` (`id`, `name`, `active`, `show_in_form`) VALUES
(1, 'SPEAKER', 1, 1),
(2, 'VIP', 1, 1),
(3, 'TEAM', 1, 1),
(4, 'GUEST', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_daystable`
--

DROP TABLE IF EXISTS `event_daystable`;
CREATE TABLE IF NOT EXISTS `event_daystable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `event_daystable`
--

INSERT INTO `event_daystable` (`id`, `name`, `active`) VALUES
(1, 'Saturday ', 1),
(2, 'Sunday', 1),
(3, 'Monday', 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_registrations`
--

DROP TABLE IF EXISTS `event_registrations`;
CREATE TABLE IF NOT EXISTS `event_registrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` longtext NOT NULL,
  `last_name` longtext NOT NULL,
  `company` longtext,
  `dob` date DEFAULT NULL,
  `nationality` longtext,
  `mobile` longtext,
  `email` longtext,
  `id_proof_expiry` date DEFAULT NULL,
  `id_proof_type` varchar(50) NOT NULL,
  `id_proof_number` longtext,
  `id_proof_front` varchar(100) DEFAULT NULL,
  `id_proof_back` varchar(100) DEFAULT NULL,
  `badge_photo` varchar(100) DEFAULT NULL,
  `remark` longtext,
  `collected` tinyint(1) NOT NULL,
  `print_count` int NOT NULL,
  `verification` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cardtype_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_registrations_cardtype_id_c8543489_fk_event_cardtype_id` (`cardtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `event_registrations`
--

INSERT INTO `event_registrations` (`id`, `first_name`, `last_name`, `company`, `dob`, `nationality`, `mobile`, `email`, `id_proof_expiry`, `id_proof_type`, `id_proof_number`, `id_proof_front`, `id_proof_back`, `badge_photo`, `remark`, `collected`, `print_count`, `verification`, `active`, `created_at`, `updated_at`, `cardtype_id`) VALUES
(1, 'TEST 12222', 'test', 'INFOME', NULL, NULL, NULL, 'mansoordev000@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 3, 'Approved', 0, '2024-05-08 09:50:30.565321', '2024-05-08 10:13:05.125266', 1),
(2, 'Muhammed', 'test', 'INFOME', NULL, NULL, NULL, 'mansoordev000@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 1, 'Approved', 1, '2024-05-08 10:15:19.920696', '2024-05-08 10:16:02.281023', 2),
(3, 'dwadwdawd', 'awdwa', 'dwd', NULL, NULL, NULL, 'awdwad', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-09 04:26:24.957966', '2024-05-09 04:26:24.957966', 2),
(4, 'awdwad', 'awdawd', 'awdwa', NULL, NULL, NULL, 'dawd@ddd.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-09 04:30:48.422050', '2024-05-09 04:30:48.422050', 4),
(5, 'awd', 'wadawdawd', 'adwaw', NULL, NULL, NULL, 'wad', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-09 04:30:56.029765', '2024-05-09 04:30:56.029765', 1),
(6, 'dwad', 'awdawd', 'awd', NULL, NULL, NULL, 'mansoordev000@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-09 04:37:01.681567', '2024-05-09 04:37:01.681567', 2),
(7, 'awdaw', 'dadw', 'awdawd', NULL, NULL, NULL, 'mansoordev000@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-09 04:37:24.696403', '2024-05-09 04:37:24.696403', 2),
(8, 'dawd', 'adwa', 'adwaw', NULL, NULL, NULL, 'DWAd@da.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-09 04:38:43.242418', '2024-05-09 04:38:43.242418', 3),
(9, 'awda', 'dawdaw', 'dawd', NULL, NULL, NULL, 'awdaw', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-09 04:39:42.763994', '2024-05-09 04:39:42.763994', 2),
(10, 'awdawd', 'awda', 'wdadaw', NULL, NULL, NULL, 'DWAd@da.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 1, 'Pending', 1, '2024-05-09 04:42:45.117040', '2024-05-09 04:42:55.324308', 1),
(11, 'Muhammed ', 'Mansoor', 'KK', NULL, NULL, NULL, 'mansoordev000@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 1, 'Approved', 1, '2024-05-09 04:43:18.291270', '2024-05-10 06:14:13.851223', 2),
(12, 'dwda', 'd', 'awdaw', NULL, NULL, NULL, 'mansoordev000@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 05:39:33.945053', '2024-05-13 05:39:33.945053', 2),
(13, 'dwad', 'wad', 'awdawd', NULL, NULL, NULL, 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 05:40:33.221580', '2024-05-13 05:40:33.221580', 2),
(14, 'awdwa', 'dwad', 'awda', NULL, NULL, NULL, 'aw', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 05:40:52.731471', '2024-05-13 05:40:52.731471', 1),
(15, 'awda', 'wdawdawd', 'awda', NULL, NULL, NULL, 'mansoorgt007@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 05:42:56.637082', '2024-05-13 05:42:56.637082', 1),
(16, 'TEST', 'dawd', 'awdawd', NULL, NULL, NULL, 'mansoordev000@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 05:44:11.181834', '2024-05-13 05:44:11.181834', 2),
(17, 'adwa', 'dawd', 'awd', NULL, NULL, NULL, 'wdawd@dawd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 05:50:26.811255', '2024-05-13 06:04:02.147914', 3),
(18, 'Muhammed', 'Mansoor', 'INFOME', NULL, NULL, NULL, 'mansoordev000@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 06:04:42.796085', '2024-05-13 06:04:51.579248', 2),
(19, 'wdad', 'awd', 'awdawd', NULL, NULL, NULL, 'mansoorgt007@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 06:05:11.122557', '2024-05-13 06:05:11.139107', 3),
(20, 'awdwa', 'dawd', 'awda', NULL, NULL, NULL, 'dawd@ddd.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 06:06:56.031573', '2024-05-13 06:06:56.045506', 2),
(21, 'ad', 'awd', 'awd', NULL, NULL, '1234', 'mansoorgt007@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 06:08:25.537733', '2024-05-13 06:12:47.343245', 4),
(22, 'dawda', 'dawda', 'awdawd', NULL, NULL, NULL, 'wd@dd.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 06:08:37.920861', '2024-05-13 06:08:37.938514', 3),
(23, 'TEST', 'dawd', 'awdawd', NULL, NULL, '77363165182', 'mansoordev000@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 06:13:18.181871', '2024-05-13 06:57:12.490334', 2),
(24, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:40:40.195113', '2024-05-13 09:40:40.195113', 1),
(25, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:41:23.219359', '2024-05-13 09:41:23.219359', 1),
(26, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.247013', '2024-05-13 09:42:18.247013', 1),
(27, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.264667', '2024-05-13 09:42:18.264667', 1),
(28, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.283799', '2024-05-13 09:42:18.283799', 1),
(29, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.297495', '2024-05-13 09:42:18.297495', 1),
(30, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.311647', '2024-05-13 09:42:18.311647', 4),
(31, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.326023', '2024-05-13 09:42:18.326023', 1),
(32, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.339995', '2024-05-13 09:42:18.339995', 1),
(33, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.355398', '2024-05-13 09:42:18.355398', 1),
(34, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.373380', '2024-05-13 09:42:18.373380', 1),
(35, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.388024', '2024-05-13 09:42:18.388024', 1),
(36, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.401810', '2024-05-13 09:42:18.401810', 4),
(37, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.415264', '2024-05-13 09:42:18.415264', 1),
(38, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.430417', '2024-05-13 09:42:18.430417', 1),
(39, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.442996', '2024-05-13 09:42:18.442996', 1),
(40, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.455817', '2024-05-13 09:42:18.455817', 1),
(41, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.471473', '2024-05-13 09:42:18.471473', 1),
(42, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.485541', '2024-05-13 09:42:18.485541', 1),
(43, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.498394', '2024-05-13 09:42:18.498394', 1),
(44, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.514044', '2024-05-13 09:42:18.514044', 4),
(45, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:42:18.528578', '2024-05-13 09:42:18.528578', 1),
(46, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:13.316794', '2024-05-13 09:43:13.316794', 1),
(47, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:56.845674', '2024-05-13 09:43:56.845674', 1),
(48, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:56.875485', '2024-05-13 09:43:56.875485', 1),
(49, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:56.889860', '2024-05-13 09:43:56.889860', 4),
(50, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:56.903514', '2024-05-13 09:43:56.903514', 1),
(51, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:56.917908', '2024-05-13 09:43:56.917908', 1),
(52, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:56.933160', '2024-05-13 09:43:56.933160', 1),
(53, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:56.949255', '2024-05-13 09:43:56.949255', 1),
(54, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:56.964583', '2024-05-13 09:43:56.964583', 1),
(55, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:56.979425', '2024-05-13 09:43:56.979425', 1),
(56, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:56.992245', '2024-05-13 09:43:56.992245', 1),
(57, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:57.006544', '2024-05-13 09:43:57.006544', 4),
(58, 'awdwa', 'dawd', 'awda', NULL, NULL, 'wad', 'awd', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 0, 'Pending', 1, '2024-05-13 09:43:57.020825', '2024-05-13 09:43:57.020825', 1);

-- --------------------------------------------------------

--
-- Table structure for table `event_registrations_days`
--

DROP TABLE IF EXISTS `event_registrations_days`;
CREATE TABLE IF NOT EXISTS `event_registrations_days` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `eventregistrations_id` bigint NOT NULL,
  `daystable_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_registrations_days_eventregistrations_id_da_4f7b9aeb_uniq` (`eventregistrations_id`,`daystable_id`),
  KEY `event_registrations__daystable_id_0ddafc57_fk_event_day` (`daystable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `event_registrations_days`
--

INSERT INTO `event_registrations_days` (`id`, `eventregistrations_id`, `daystable_id`) VALUES
(6, 17, 1),
(7, 17, 2),
(10, 18, 1),
(11, 20, 2),
(15, 21, 2),
(16, 21, 3),
(14, 22, 1),
(19, 23, 1),
(20, 23, 2),
(21, 23, 3),
(22, 24, 1),
(23, 24, 3),
(24, 25, 1),
(25, 25, 3),
(26, 26, 1),
(27, 26, 3),
(28, 27, 1),
(29, 27, 2),
(30, 27, 3),
(31, 28, 1),
(32, 28, 3),
(33, 29, 1),
(34, 29, 3),
(35, 30, 1),
(36, 30, 3),
(37, 31, 1),
(38, 31, 3),
(39, 32, 1),
(40, 32, 2),
(41, 32, 3),
(42, 33, 1),
(43, 33, 3),
(44, 34, 1),
(45, 34, 3),
(46, 35, 1),
(47, 35, 3),
(48, 36, 3),
(49, 37, 1),
(50, 37, 3),
(51, 38, 1),
(52, 38, 3),
(53, 39, 1),
(54, 39, 3),
(55, 40, 1),
(56, 40, 3),
(57, 41, 1),
(58, 41, 3),
(59, 42, 1),
(60, 42, 3),
(61, 43, 1),
(62, 43, 3),
(63, 44, 1),
(64, 44, 3),
(65, 47, 1),
(66, 47, 2),
(67, 47, 3),
(68, 48, 1),
(69, 48, 3),
(70, 49, 3),
(71, 50, 1),
(72, 50, 3),
(73, 51, 1),
(74, 51, 3),
(75, 52, 1),
(76, 52, 3),
(77, 53, 1),
(78, 53, 3),
(79, 54, 1),
(80, 54, 3),
(81, 55, 1),
(82, 55, 3),
(83, 56, 1),
(84, 56, 3),
(85, 57, 1),
(86, 57, 3);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `active`) VALUES
(1, 'Room 1', 1),
(2, 'Room 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE IF NOT EXISTS `user_profile` (
  `user_id` int NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_profile_role_id_7f4a52a2_fk_user_profile_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile_role`
--

DROP TABLE IF EXISTS `user_profile_role`;
CREATE TABLE IF NOT EXISTS `user_profile_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_profile_role`
--

INSERT INTO `user_profile_role` (`id`, `name`) VALUES
(1, 'registration user'),
(2, 'check in and check out admin'),
(3, 'check in and check out volunteer');

-- --------------------------------------------------------

--
-- Table structure for table `vapp_cardtype`
--

DROP TABLE IF EXISTS `vapp_cardtype`;
CREATE TABLE IF NOT EXISTS `vapp_cardtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `show_in_form` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `vapp_registrations`
--

DROP TABLE IF EXISTS `vapp_registrations`;
CREATE TABLE IF NOT EXISTS `vapp_registrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` longtext NOT NULL,
  `last_name` longtext NOT NULL,
  `company` longtext,
  `mobile` longtext,
  `email` longtext,
  `vehicle_number` longtext,
  `id_proof_front` varchar(100) DEFAULT NULL,
  `id_proof_back` varchar(100) DEFAULT NULL,
  `vehicle_pass` varchar(100) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `remark` longtext,
  `collected` tinyint(1) NOT NULL,
  `print_count` int NOT NULL,
  `delivery_to_date` date DEFAULT NULL,
  `verification` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cardtype_id` bigint NOT NULL,
  `vehicletype_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vapp_registrations_cardtype_id_57b91f22_fk_vapp_cardtype_id` (`cardtype_id`),
  KEY `vapp_registrations_vehicletype_id_03ab30a7_fk_vehicle_type_id` (`vehicletype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
CREATE TABLE IF NOT EXISTS `vehicle_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `build_registrations`
--
ALTER TABLE `build_registrations`
  ADD CONSTRAINT `build_registrations_cardtype_id_c7a08e4c_fk_build_cardtype_id` FOREIGN KEY (`cardtype_id`) REFERENCES `build_cardtype` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `entry_log`
--
ALTER TABLE `entry_log`
  ADD CONSTRAINT `entry_log_registration_id_c0c3e91f_fk_event_registrations_id` FOREIGN KEY (`registration_id`) REFERENCES `event_registrations` (`id`),
  ADD CONSTRAINT `entry_log_room_id_d37f5b65_fk_rooms_id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD CONSTRAINT `event_registrations_cardtype_id_c8543489_fk_event_cardtype_id` FOREIGN KEY (`cardtype_id`) REFERENCES `event_cardtype` (`id`);

--
-- Constraints for table `event_registrations_days`
--
ALTER TABLE `event_registrations_days`
  ADD CONSTRAINT `event_registrations__daystable_id_0ddafc57_fk_event_day` FOREIGN KEY (`daystable_id`) REFERENCES `event_daystable` (`id`),
  ADD CONSTRAINT `event_registrations__eventregistrations_i_f85ac154_fk_event_reg` FOREIGN KEY (`eventregistrations_id`) REFERENCES `event_registrations` (`id`);

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_role_id_7f4a52a2_fk_user_profile_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_profile_role` (`id`),
  ADD CONSTRAINT `user_profile_user_id_8fdce8e2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `vapp_registrations`
--
ALTER TABLE `vapp_registrations`
  ADD CONSTRAINT `vapp_registrations_cardtype_id_57b91f22_fk_vapp_cardtype_id` FOREIGN KEY (`cardtype_id`) REFERENCES `vapp_cardtype` (`id`),
  ADD CONSTRAINT `vapp_registrations_vehicletype_id_03ab30a7_fk_vehicle_type_id` FOREIGN KEY (`vehicletype_id`) REFERENCES `vehicle_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;