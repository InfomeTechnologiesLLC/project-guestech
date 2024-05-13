-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 10, 2024 at 05:11 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;

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
(52, 'Can view build registrations', 13, 'view_buildregistrations');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$uFibqwU4Diucx925TTK7TY$H1NjSDKMyLHUNtwvp3c6+tHUIJ32ZkdPX3D1bg8vkZ4=', '2024-05-09 03:50:04.465342', 1, 'admin', '', '', '', 1, 1, '2024-05-08 09:30:35.921551');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'portal', 'buildcardtype'),
(13, 'portal', 'buildregistrations'),
(8, 'portal', 'eventcardtype'),
(12, 'portal', 'eventregistrations'),
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

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
(24, 'sessions', '0001_initial', '2024-05-08 09:28:56.333181');

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
('x66x6dqcpr76rnqkxmjoa4lzcrma1dpd', '.eJxVjMsOwiAQRf-FtSHAUB4u3fsNZIBBqgaS0q6M_65NutDtPefcFwu4rTVsg5YwZ3Zmkp1-t4jpQW0H-Y7t1nnqbV3myHeFH3Twa8_0vBzu30HFUb-1y9ZPKJUXkrxE0kppMtnBBAJldGg0OVJOmpRKsQZUNBlBExQBFoG9P8kgN20:1s4unE:6HZry-jT2sKd1xekUtvRqREuTPJCq5VauIMOgenwwbA', '2024-05-23 03:50:04.481372');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

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
(11, 'Muhammed ', 'Mansoor', 'KK', NULL, NULL, NULL, 'mansoordev000@gmail.com', NULL, 'Emirates-Id', NULL, '', '', '', '', 0, 1, 'Pending', 1, '2024-05-09 04:43:18.291270', '2024-05-09 04:43:29.996512', 2);

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
-- Constraints for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD CONSTRAINT `event_registrations_cardtype_id_c8543489_fk_event_cardtype_id` FOREIGN KEY (`cardtype_id`) REFERENCES `event_cardtype` (`id`);

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
