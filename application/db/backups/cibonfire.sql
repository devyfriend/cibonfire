-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 17, 2018 at 09:43 PM
-- Server version: 5.5.42
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cibonfire`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `activity_id` bigint(20) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `activity` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `deleted` tinyint(12) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_queue`
--

DROP TABLE IF EXISTS `email_queue`;
CREATE TABLE `email_queue` (
  `id` int(11) NOT NULL,
  `to_email` varchar(254) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `alt_message` text,
  `max_attempts` int(11) NOT NULL DEFAULT '3',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `last_attempt` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `csv_attachment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts` (
  `id` bigint(20) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` enum('active','inactive','deleted') NOT NULL DEFAULT 'active',
  `dev` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission_id`, `name`, `description`, `status`, `dev`) VALUES
(2, 'Admin.Content.View', 'Allow users to view the Content Context', 'active', 0),
(3, 'Admin.Reports.View', 'Allow users to view the Reports Context', 'active', 0),
(4, 'Admin.Settings.View', 'Allow users to view the Settings Context', 'active', 0),
(5, 'Admin.Developer.View', 'Allow users to view the Developer Context', 'active', 0),
(6, 'Bonfire.Roles.Manage', 'Allow users to manage the user Roles', 'active', 0),
(7, 'Bonfire.Users.Manage', 'Allow users to manage the site Users', 'active', 0),
(8, 'Bonfire.Users.View', 'Allow users access to the User Settings', 'active', 0),
(9, 'Bonfire.Users.Add', 'Allow users to add new Users', 'active', 0),
(10, 'Bonfire.Database.Manage', 'Allow users to manage the Database settings', 'active', 0),
(11, 'Bonfire.Emailer.Manage', 'Allow users to manage the Emailer settings', 'active', 0),
(12, 'Bonfire.Logs.View', 'Allow users access to the Log details', 'active', 0),
(13, 'Bonfire.Logs.Manage', 'Allow users to manage the Log files', 'active', 0),
(14, 'Bonfire.Emailer.View', 'Allow users access to the Emailer settings', 'active', 0),
(15, 'Site.Signin.Offline', 'Allow users to login to the site when the site is offline', 'active', 0),
(16, 'Bonfire.Permissions.View', 'Allow access to view the Permissions menu unders Settings Context', 'active', 0),
(17, 'Bonfire.Permissions.Manage', 'Allow access to manage the Permissions in the system', 'active', 0),
(18, 'Bonfire.Modules.Add', 'Allow creation of modules with the builder.', 'active', 0),
(19, 'Bonfire.Modules.Delete', 'Allow deletion of modules.', 'active', 0),
(20, 'Permissions.Administrator.Manage', 'To manage the access control permissions for the Administrator role.', 'active', 0),
(21, 'Permissions.Editor.Manage', 'To manage the access control permissions for the Editor role.', 'active', 0),
(23, 'Permissions.User.Manage', 'To manage the access control permissions for the User role.', 'active', 0),
(24, 'Permissions.Developer.Manage', 'To manage the access control permissions for the Developer role.', 'active', 0),
(26, 'Activities.Own.View', 'To view the users own activity logs', 'active', 0),
(27, 'Activities.Own.Delete', 'To delete the users own activity logs', 'active', 0),
(28, 'Activities.User.View', 'To view the user activity logs', 'active', 0),
(29, 'Activities.User.Delete', 'To delete the user activity logs, except own', 'active', 0),
(30, 'Activities.Module.View', 'To view the module activity logs', 'active', 0),
(31, 'Activities.Module.Delete', 'To delete the module activity logs', 'active', 0),
(32, 'Activities.Date.View', 'To view the users own activity logs', 'active', 0),
(33, 'Activities.Date.Delete', 'To delete the dated activity logs', 'active', 0),
(34, 'Bonfire.UI.Manage', 'Manage the Bonfire UI settings', 'active', 0),
(35, 'Bonfire.Settings.View', 'To view the site settings page.', 'active', 0),
(36, 'Bonfire.Settings.Manage', 'To manage the site settings.', 'active', 0),
(37, 'Bonfire.Activities.View', 'To view the Activities menu.', 'active', 0),
(38, 'Bonfire.Database.View', 'To view the Database menu.', 'active', 0),
(39, 'Bonfire.Migrations.View', 'To view the Migrations menu.', 'active', 0),
(40, 'Bonfire.Builder.View', 'To view the Modulebuilder menu.', 'active', 0),
(41, 'Bonfire.Roles.View', 'To view the Roles menu.', 'active', 0),
(42, 'Bonfire.Sysinfo.View', 'To view the System Information page.', 'active', 0),
(43, 'Bonfire.Translate.Manage', 'To manage the Language Translation.', 'active', 0),
(44, 'Bonfire.Translate.View', 'To view the Language Translate menu.', 'active', 0),
(45, 'Bonfire.UI.View', 'To view the UI/Keyboard Shortcut menu.', 'active', 0),
(48, 'Bonfire.Profiler.View', 'To view the Console Profiler Bar.', 'active', 0),
(49, 'Bonfire.Roles.Add', 'To add New Roles', 'active', 0),
(51, 'Site.Content.View', 'Allow users to enter admin', 'active', 0),
(52, 'Site.Reports.View', 'Allow users to enter report at admin', 'active', 0),
(53, 'Site.Developer.View', 'Allow user to enter dev', 'active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  `login_destination` varchar(255) NOT NULL DEFAULT '/',
  `default_context` varchar(255) DEFAULT 'content',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `description`, `default`, `can_delete`, `login_destination`, `default_context`, `deleted`) VALUES
(1, 'Administrator', 'Has full control over every aspect of the site.', 0, 0, 'admin/content', 'content', 0),
(2, 'Editor', 'Can handle day-to-day management, but does not have full power.', 0, 0, '', 'content', 1),
(4, 'User', 'This is the default user with access to login.', 1, 0, '', 'content', 0),
(6, 'Developer', 'Developers typically are the only ones that can access the developer tools. Otherwise identical to Administrators, at least until the site is handed off.', 0, 1, 'admin/content', 'content', 0);

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 16),
(1, 17),
(1, 20),
(1, 21),
(1, 23),
(1, 26),
(1, 28),
(1, 30),
(1, 32),
(1, 37),
(1, 41),
(1, 51),
(1, 52),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(6, 19),
(6, 20),
(6, 21),
(6, 23),
(6, 24),
(6, 26),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
(6, 31),
(6, 32),
(6, 33),
(6, 34),
(6, 35),
(6, 36),
(6, 37),
(6, 38),
(6, 39),
(6, 40),
(6, 41),
(6, 42),
(6, 43),
(6, 44),
(6, 45),
(6, 48),
(6, 49),
(6, 51),
(6, 52),
(6, 53);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL,
  `user_id` bigint(32) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `timestamp`, `data`) VALUES
('4grlef4g5vm8957ga0cvbgi6f5ai050b', 0, '::1', 1524113784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532343131323637343b7265717565737465645f706167657c733a33343a22687474703a2f2f6c6f63616c686f73742f6369626f6e666972655f7570646174652f223b70726576696f75735f706167657c733a33343a22687474703a2f2f6c6f63616c686f73742f6369626f6e666972655f7570646174652f223b);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `name` varchar(30) NOT NULL,
  `module` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`name`, `module`, `value`) VALUES
('auth.allow_name_change', 'core', '1'),
('auth.allow_register', 'core', '0'),
('auth.allow_remember', 'core', '1'),
('auth.do_login_redirect', 'core', '1'),
('auth.login_type', 'core', 'both'),
('auth.name_change_frequency', 'core', '1'),
('auth.name_change_limit', 'core', '1'),
('auth.password_force_mixed_case', 'core', '0'),
('auth.password_force_numbers', 'core', '0'),
('auth.password_force_symbols', 'core', '0'),
('auth.password_min_length', 'core', '8'),
('auth.password_show_labels', 'core', '0'),
('auth.remember_length', 'core', '1209600'),
('auth.role_developer_id', 'core', '6'),
('auth.role_user_permissions', 'core', '0'),
('auth.user_activation_method', 'core', '0'),
('auth.use_extended_profile', 'core', '0'),
('auth.use_usernames', 'core', '1'),
('form_save', 'core.ui', 'ctrl+s/⌘+s'),
('goto_content', 'core.ui', 'alt+c'),
('mailpath', 'email', '/usr/sbin/sendmail'),
('mailtype', 'email', 'text'),
('password_iterations', 'users', '8'),
('protocol', 'email', 'mail'),
('sender_email', 'email', ''),
('site.languages', 'core', 'a:3:{i:0;s:7:"english";i:1;s:10:"portuguese";i:2;s:7:"persian";}'),
('site.list_limit', 'core', '25'),
('site.show_front_profiler', 'core', '1'),
('site.show_profiler', 'core', '1'),
('site.status', 'core', '1'),
('site.system_email', 'core', 'admin@web.com'),
('site.title', 'core', 'The Web'),
('smtp_host', 'email', ''),
('smtp_pass', 'email', ''),
('smtp_port', 'email', ''),
('smtp_timeout', 'email', ''),
('smtp_user', 'email', ''),
('updates.bleeding_edge', 'core', '1'),
('updates.do_check', 'core', '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '4',
  `email` varchar(254) NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `password_hash` char(60) DEFAULT NULL,
  `reset_hash` varchar(40) DEFAULT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_ip` varchar(45) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `reset_by` int(10) DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_message` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT '',
  `display_name_changed` date DEFAULT NULL,
  `timezone` varchar(40) NOT NULL DEFAULT 'UTC+7',
  `language` varchar(20) NOT NULL DEFAULT 'indonesian',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `activate_hash` varchar(40) NOT NULL DEFAULT '',
  `force_password_reset` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `email`, `username`, `password_hash`, `reset_hash`, `last_login`, `last_ip`, `created_on`, `deleted`, `reset_by`, `banned`, `ban_message`, `display_name`, `display_name_changed`, `timezone`, `language`, `active`, `activate_hash`, `force_password_reset`) VALUES
(1, 1, 'admin@cms', 'admin', '$2a$08$bfTeoW1rgi2OPY7fkk0M4uQ/VsP/MS0JD2TEWuwHA/Q2ElIp36JKi', NULL, '2018-03-29 13:02:04', '::1', '2015-09-01 01:25:04', 0, NULL, 0, NULL, 'Admin', NULL, 'UTC+7', 'indonesian', 1, '', 0),
(2, 6, 'dev@cms', 'juragan', '$2a$08$bfTeoW1rgi2OPY7fkk0M4uQ/VsP/MS0JD2TEWuwHA/Q2ElIp36JKi', NULL, '2018-03-29 11:40:46', '::1', '2015-09-01 01:25:04', 0, NULL, 0, NULL, 'Juragan', NULL, 'UTC+7', 'indonesian', 1, '', 0),
(3, 4, 'user@cms', 'user', '$2a$08$bfTeoW1rgi2OPY7fkk0M4uQ/VsP/MS0JD2TEWuwHA/Q2ElIp36JKi', NULL, '2018-03-29 13:01:50', '::1', '2018-03-01 11:34:41', 0, NULL, 0, NULL, 'User', '2018-03-01', 'UTC+7', 'indonesian', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_cookies`
--

DROP TABLE IF EXISTS `user_cookies`;
CREATE TABLE `user_cookies` (
  `user_id` bigint(20) unsigned NOT NULL,
  `token` varchar(128) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
CREATE TABLE `user_meta` (
  `meta_id` int(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) NOT NULL DEFAULT '',
  `meta_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `email_queue`
--
ALTER TABLE `email_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD UNIQUE KEY `Name` (`name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `user_cookies`
--
ALTER TABLE `user_cookies`
  ADD KEY `token` (`token`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`meta_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_queue`
--
ALTER TABLE `email_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `meta_id` int(20) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
