-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2024 at 09:46 AM
-- Server version: 5.7.44-log
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infomeglobal_outeredge`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$wSkEFPd9rk0Y8oQgKsrdcM$DlJnsHtQ20pMX8qgeCyL1mMikC37Hy191qJUCREx794=', '2024-04-19 10:59:12.907228', 1, 'admin', '', '', '', 1, 1, '2024-04-19 09:14:18.874292');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `build_cardtype`
--

CREATE TABLE `build_cardtype` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `show_in_form` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `build_cardtype`
--

INSERT INTO `build_cardtype` (`id`, `name`, `active`, `show_in_form`) VALUES
(1, 'Co-Host', 1, 0),
(2, 'Staff', 1, 0),
(3, 'Attendee', 1, 0),
(4, 'Distinguished Guest', 1, 0),
(5, 'Media', 1, 0),
(6, 'Speaker', 1, 0),
(7, 'Partner', 1, 0),
(8, 'Sponsor', 1, 0),
(9, 'Speaker | Co-Host', 1, 0),
(10, 'Speaker | Partner', 1, 0),
(11, 'Speaker | Sponsor', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `build_registrations`
--

CREATE TABLE `build_registrations` (
  `id` bigint(20) NOT NULL,
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
  `print_count` int(11) NOT NULL,
  `verification` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cardtype_id` bigint(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `mobile` longtext,
  `lanyard_color` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `build_registrations`
--

INSERT INTO `build_registrations` (`id`, `first_name`, `last_name`, `email`, `company`, `id_proof_expiry`, `id_proof_type`, `id_proof_number`, `id_proof_front`, `id_proof_back`, `remark`, `collected`, `print_count`, `verification`, `active`, `created_at`, `updated_at`, `cardtype_id`, `dob`, `mobile`, `lanyard_color`) VALUES
(1, 'Josh', 'Kriger', 'josh@edgeof.xyz', 'Edge Of Co.', NULL, 'Emirates-Id', NULL, '', '', '', 0, 1, 'Pending', 1, '2024-04-19 09:36:15.496615', '2024-04-19 09:37:18.240949', 1, NULL, NULL, 'White'),
(2, 'Audrey', 'Pichy', 'audrey@edgeof.xyz', 'Edge Of Co.', NULL, 'Emirates-Id', NULL, '', '', '', 0, 0, 'Pending', 1, '2024-04-19 09:36:15.496861', '2024-04-19 09:36:15.496889', 1, NULL, NULL, 'White'),
(3, 'Richard', 'Carthon', 'richard@edgeof.xyz', 'Edge Of Co.', NULL, 'Emirates-Id', NULL, '', '', '', 0, 0, 'Pending', 1, '2024-04-19 09:36:15.497015', '2024-04-19 09:36:15.497062', 1, NULL, NULL, 'White'),
(4, 'Kylee', 'Bryson', 'kylee@effortlessmeetings-events.com', 'Edge Of Co.', NULL, 'Emirates-Id', NULL, '', '', '', 0, 0, 'Pending', 1, '2024-04-19 09:36:15.497260', '2024-04-19 09:36:15.497295', 2, NULL, NULL, 'White'),
(5, 'Erick', 'Weiss', 'erick@honeysweetcreative.com', 'Edge Of Co.', NULL, 'Emirates-Id', NULL, '', '', '', 0, 0, 'Pending', 1, '2024-04-19 09:36:15.497448', '2024-04-19 09:36:15.497478', 2, NULL, NULL, 'White'),
(6, 'Julia', 'Tognotti', 'julia@effortlessmeetings-events.com', 'Edge Of Co.', NULL, 'Emirates-Id', NULL, '', '', '', 0, 0, 'Pending', 1, '2024-04-19 09:36:15.497628', '2024-04-19 09:36:15.497657', 2, NULL, NULL, 'White'),
(7, 'Jessica', 'Railey', 'jessica@edgeof.xyz', 'Edge Of Co.', NULL, 'Emirates-Id', NULL, '', '', '', 0, 0, 'Pending', 1, '2024-04-19 09:36:15.497835', '2024-04-19 09:36:15.497863', 2, NULL, NULL, 'White'),
(8, 'Megan', 'Wentz', 'megan@edgeof.xyz', 'Edge Of Co.', NULL, 'Emirates-Id', NULL, '', '', '', 0, 0, 'Pending', 1, '2024-04-19 09:36:15.497988', '2024-04-19 09:36:15.498030', 2, NULL, NULL, 'White'),
(9, 'fasil', 'muhammed', 'ss@ss.com', 'edge of co', NULL, 'Emirates-Id', NULL, '', '', '', 0, 0, 'Pending', 0, '2024-04-19 09:37:49.494542', '2024-04-19 09:37:49.494622', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-19 09:11:36.487421'),
(2, 'auth', '0001_initial', '2024-04-19 09:11:37.074553'),
(3, 'admin', '0001_initial', '2024-04-19 09:11:37.240696'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-19 09:11:37.259298'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-19 09:11:37.278131'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-19 09:11:37.392465'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-19 09:11:37.416787'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-19 09:11:37.442933'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-19 09:11:37.461666'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-19 09:11:37.512621'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-19 09:11:37.516724'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-19 09:11:37.533407'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-19 09:11:37.557900'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-19 09:11:37.581532'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-19 09:11:37.605988'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-19 09:11:37.622540'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-19 09:11:37.653895'),
(18, 'portal', '0001_initial', '2024-04-19 09:11:38.136974'),
(19, 'portal', '0002_remove_buildcardtype_show_in_form_and_more', '2024-04-19 09:11:38.257303'),
(20, 'portal', '0003_buildcardtype_show_in_form_and_more', '2024-04-19 09:11:38.449903'),
(21, 'portal', '0004_remove_buildregistrations_dob_and_more', '2024-04-19 09:11:38.579778'),
(22, 'portal', '0005_buildregistrations_dob_buildregistrations_mobile', '2024-04-19 09:11:38.681968'),
(23, 'sessions', '0001_initial', '2024-04-19 09:11:38.738247'),
(24, 'portal', '0006_buildregistrations_lanyard_color', '2024-04-19 09:26:57.596713');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6acdufxeorvllw9liyfv7rqvpb7j8z1h', '.eJxVjM0OwiAQhN-FsyFUfhY8evcZyLILUjU0Ke3J-O62SQ-azGm-b-YtIq5LjWvPcxxZXMQgTr9dQnrmtgN-YLtPkqa2zGOSuyIP2uVt4vy6Hu7fQcVet7UuWRdyxgcqrAyqgI6tLhaMNYq9hrKFPINOANnZYB2CCXRmwIGt-HwB6Kw3yA:1rxkWN:HimorCOnYgb2_fC9cKjlxsB4xuxFZZWYqfQC-YT6Gwg', '2024-05-03 09:27:03.857214'),
('6imq48q5vz2n6z9aj0kme2il481smcfr', '.eJxVjM0OwiAQhN-FsyFUfhY8evcZyLILUjU0Ke3J-O62SQ-azGm-b-YtIq5LjWvPcxxZXMQgTr9dQnrmtgN-YLtPkqa2zGOSuyIP2uVt4vy6Hu7fQcVet7UuWRdyxgcqrAyqgI6tLhaMNYq9hrKFPINOANnZYB2CCXRmwIGt-HwB6Kw3yA:1rxkoq:-S553m6oKEQx8h9y_O8R4G6X-bcwqAZZXmShrN6xsC4', '2024-05-03 09:46:08.651052'),
('7mchpk1ea8elrqjrbm5bcu9yr8df8vxb', '.eJxVjM0OwiAQhN-FsyFUfhY8evcZyLILUjU0Ke3J-O62SQ-azGm-b-YtIq5LjWvPcxxZXMQgTr9dQnrmtgN-YLtPkqa2zGOSuyIP2uVt4vy6Hu7fQcVet7UuWRdyxgcqrAyqgI6tLhaMNYq9hrKFPINOANnZYB2CCXRmwIGt-HwB6Kw3yA:1rxkKl:XZDtDvrf1QzHlHKbqCtni_pFFPFb_DdaY1An9shC-ZY', '2024-05-03 09:15:03.591441'),
('du3jhaqa02os2u54y5oc7x3kuq5t1u1h', '.eJxVjM0OwiAQhN-FsyFUfhY8evcZyLILUjU0Ke3J-O62SQ-azGm-b-YtIq5LjWvPcxxZXMQgTr9dQnrmtgN-YLtPkqa2zGOSuyIP2uVt4vy6Hu7fQcVet7UuWRdyxgcqrAyqgI6tLhaMNYq9hrKFPINOANnZYB2CCXRmwIGt-HwB6Kw3yA:1rxkRe:lVvE-X-BJSgf3zSuGZzFI9u-lr5fucWHRUmDwvOZNOs', '2024-05-03 09:22:10.495846'),
('gyuzsmg6sg7ky1458baasj8vrc1ier7q', '.eJxVjM0OwiAQhN-FsyFUfhY8evcZyLILUjU0Ke3J-O62SQ-azGm-b-YtIq5LjWvPcxxZXMQgTr9dQnrmtgN-YLtPkqa2zGOSuyIP2uVt4vy6Hu7fQcVet7UuWRdyxgcqrAyqgI6tLhaMNYq9hrKFPINOANnZYB2CCXRmwIGt-HwB6Kw3yA:1rxlxY:cvJpuuzboDnnykNo6JEaGadu15sdoGCzQCU11Zh6iMg', '2024-05-03 10:59:12.918722');

-- --------------------------------------------------------

--
-- Table structure for table `event_cardtype`
--

CREATE TABLE `event_cardtype` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `show_in_form` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_registrations`
--

CREATE TABLE `event_registrations` (
  `id` bigint(20) NOT NULL,
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
  `print_count` int(11) NOT NULL,
  `verification` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cardtype_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vapp_cardtype`
--

CREATE TABLE `vapp_cardtype` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `show_in_form` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vapp_registrations`
--

CREATE TABLE `vapp_registrations` (
  `id` bigint(20) NOT NULL,
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
  `print_count` int(11) NOT NULL,
  `delivery_to_date` date DEFAULT NULL,
  `verification` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cardtype_id` bigint(20) NOT NULL,
  `vehicletype_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type`
--

CREATE TABLE `vehicle_type` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `build_cardtype`
--
ALTER TABLE `build_cardtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `build_registrations`
--
ALTER TABLE `build_registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `build_registrations_cardtype_id_c7a08e4c_fk_build_cardtype_id` (`cardtype_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `event_cardtype`
--
ALTER TABLE `event_cardtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_registrations_cardtype_id_c8543489_fk_event_cardtype_id` (`cardtype_id`);

--
-- Indexes for table `vapp_cardtype`
--
ALTER TABLE `vapp_cardtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vapp_registrations`
--
ALTER TABLE `vapp_registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vapp_registrations_cardtype_id_57b91f22_fk_vapp_cardtype_id` (`cardtype_id`),
  ADD KEY `vapp_registrations_vehicletype_id_03ab30a7_fk_vehicle_type_id` (`vehicletype_id`);

--
-- Indexes for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `build_cardtype`
--
ALTER TABLE `build_cardtype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `build_registrations`
--
ALTER TABLE `build_registrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `event_cardtype`
--
ALTER TABLE `event_cardtype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_registrations`
--
ALTER TABLE `event_registrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vapp_cardtype`
--
ALTER TABLE `vapp_cardtype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vapp_registrations`
--
ALTER TABLE `vapp_registrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
