-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 19, 2021 at 11:26 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pointofsale`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_items`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `all_items`;
CREATE TABLE IF NOT EXISTS `all_items` (
`item_id` int(10)
,`name` varchar(255)
,`category` varchar(255)
,`item_code_no` varchar(255)
,`description` varchar(255)
,`cost_price` double(15,2)
,`unit_price` double(15,2)
,`discount` int(11)
,`sale_price` double(19,2)
,`unit` varchar(255)
,`reorder_level` double(15,2)
,`location` varchar(255)
,`status` int(11)
,`order` int(11)
,`created_by` int(11)
,`created_date` datetime
,`last_updated` datetime
,`total_stock` decimal(32,0)
,`item_saled` decimal(32,0)
,`total_quantity` decimal(34,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(200) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

DROP TABLE IF EXISTS `icons`;
CREATE TABLE IF NOT EXISTS `icons` (
  `icon_id` int(11) NOT NULL AUTO_INCREMENT,
  `icon_title` varchar(255) NOT NULL,
  `icon_category` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`icon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`icon_id`, `icon_title`, `icon_category`) VALUES
(1, 'fa-rub', 'New Icons'),
(2, 'fa-ruble', 'New Icons'),
(3, 'fa-rouble', 'New Icons'),
(4, 'fa-pagelines', 'New Icons'),
(5, 'fa-stack-exchange', 'New Icons'),
(6, 'fa-arrow-circle-o-right', 'New Icons'),
(7, 'fa-arrow-circle-o-left', 'New Icons'),
(8, 'fa-caret-square-o-left', 'New Icons'),
(9, 'fa-toggle-left', 'New Icons'),
(10, 'fa-dot-circle-o', 'New Icons'),
(11, 'fa-wheelchair', 'New Icons'),
(12, 'fa-vimeo-square', 'New Icons'),
(13, 'fa-try', 'New Icons'),
(14, 'fa-turkish-lira', 'New Icons'),
(15, 'fa-plus-square-o', 'New Icons'),
(16, 'fa-adjust', 'Web Application Icons'),
(17, 'fa-anchor', 'Web Application Icons'),
(18, 'fa-archive', 'Web Application Icons'),
(19, 'fa-arrows', 'Web Application Icons'),
(20, 'fa-arrows-h', 'Web Application Icons'),
(21, 'fa-arrows-v', 'Web Application Icons'),
(22, 'fa-asterisk', 'Web Application Icons'),
(23, 'fa-ban', 'Web Application Icons'),
(24, 'fa-bar-chart-o', 'Web Application Icons'),
(25, 'fa-barcode', 'Web Application Icons'),
(26, 'fa-bars', 'Web Application Icons'),
(27, 'fa-beer', 'Web Application Icons'),
(28, 'fa-bell', 'Web Application Icons'),
(29, 'fa-bell-o', 'Web Application Icons'),
(30, 'fa-bolt', 'Web Application Icons'),
(31, 'fa-book', 'Web Application Icons'),
(32, 'fa-bookmark', 'Web Application Icons'),
(33, 'fa-bookmark-o', 'Web Application Icons'),
(34, 'fa-briefcase', 'Web Application Icons'),
(35, 'fa-bug', 'Web Application Icons'),
(36, 'fa-building-o', 'Web Application Icons'),
(37, 'fa-bullhorn', 'Web Application Icons'),
(38, 'fa-bullseye', 'Web Application Icons'),
(39, 'fa-calendar', 'Web Application Icons'),
(40, 'fa-calendar-o', 'Web Application Icons'),
(41, 'fa-camera', 'Web Application Icons'),
(42, 'fa-camera-retro', 'Web Application Icons'),
(43, 'fa-caret-square-o-down', 'Web Application Icons'),
(44, 'fa-caret-square-o-left', 'Web Application Icons'),
(45, 'fa-caret-square-o-right', 'Web Application Icons'),
(46, 'fa-caret-square-o-up', 'Web Application Icons'),
(47, 'fa-certificate', 'Web Application Icons'),
(48, 'fa-check', 'Web Application Icons'),
(49, 'fa-check-circle', 'Web Application Icons'),
(50, 'fa-check-circle-o', 'Web Application Icons'),
(51, 'fa-check-square', 'Web Application Icons'),
(52, 'fa-check-square-o', 'Web Application Icons'),
(53, 'fa-circle', 'Web Application Icons'),
(54, 'fa-circle-o', 'Web Application Icons'),
(55, 'fa-clock-o', 'Web Application Icons'),
(56, 'fa-cloud', 'Web Application Icons'),
(57, 'fa-cloud-download', 'Web Application Icons'),
(58, 'fa-cloud-upload', 'Web Application Icons'),
(59, 'fa-code', 'Web Application Icons'),
(60, 'fa-code-fork', 'Web Application Icons'),
(61, 'fa-coffee', 'Web Application Icons'),
(62, 'fa-cog', 'Web Application Icons'),
(63, 'fa-cogs', 'Web Application Icons'),
(64, 'fa-comment', 'Web Application Icons'),
(65, 'fa-comment-o', 'Web Application Icons'),
(66, 'fa-comments', 'Web Application Icons'),
(67, 'fa-comments-o', 'Web Application Icons'),
(68, 'fa-compass', 'Web Application Icons'),
(69, 'fa-credit-card', 'Web Application Icons'),
(70, 'fa-crop', 'Web Application Icons'),
(71, 'fa-crosshairs', 'Web Application Icons'),
(72, 'fa-cutlery', 'Web Application Icons'),
(73, 'fa-dashboard', 'Web Application Icons'),
(74, 'fa-desktop', 'Web Application Icons'),
(75, 'fa-dot-circle-o', 'Web Application Icons'),
(76, 'fa-download', 'Web Application Icons'),
(77, 'fa-edit', 'Web Application Icons'),
(78, 'fa-ellipsis-h', 'Web Application Icons'),
(79, 'fa-ellipsis-v', 'Web Application Icons'),
(80, 'fa-envelope', 'Web Application Icons'),
(81, 'fa-envelope-o', 'Web Application Icons'),
(82, 'fa-eraser', 'Web Application Icons'),
(83, 'fa-exchange', 'Web Application Icons'),
(84, 'fa-exclamation', 'Web Application Icons'),
(85, 'fa-exclamation-circle', 'Web Application Icons'),
(86, 'fa-exclamation-triangle', 'Web Application Icons'),
(87, 'fa-external-link', 'Web Application Icons'),
(88, 'fa-external-link-square', 'Web Application Icons'),
(89, 'fa-eye', 'Web Application Icons'),
(90, 'fa-eye-slash', 'Web Application Icons'),
(91, 'fa-female', 'Web Application Icons'),
(92, 'fa-fighter-jet', 'Web Application Icons'),
(93, 'fa-film', 'Web Application Icons'),
(94, 'fa-filter', 'Web Application Icons'),
(95, 'fa-fire', 'Web Application Icons'),
(96, 'fa-fire-extinguisher', 'Web Application Icons'),
(97, 'fa-flag', 'Web Application Icons'),
(98, 'fa-flag-checkered', 'Web Application Icons'),
(99, 'fa-flag-o', 'Web Application Icons'),
(100, 'fa-flash', 'Web Application Icons'),
(101, 'fa-flask', 'Web Application Icons'),
(102, 'fa-folder', 'Web Application Icons'),
(103, 'fa-folder-o', 'Web Application Icons'),
(104, 'fa-folder-open', 'Web Application Icons'),
(105, 'fa-folder-open-o', 'Web Application Icons'),
(106, 'fa-frown-o', 'Web Application Icons'),
(107, 'fa-gamepad', 'Web Application Icons'),
(108, 'fa-gavel', 'Web Application Icons'),
(109, 'fa-gear', 'Web Application Icons'),
(110, 'fa-gears', 'Web Application Icons'),
(111, 'fa-gift', 'Web Application Icons'),
(112, 'fa-glass', 'Web Application Icons'),
(113, 'fa-globe', 'Web Application Icons'),
(114, 'fa-users', 'Web Application Icons'),
(115, 'fa-hdd-o', 'Web Application Icons'),
(116, 'fa-headphones', 'Web Application Icons'),
(117, 'fa-heart', 'Web Application Icons'),
(118, 'fa-heart-o', 'Web Application Icons'),
(119, 'fa-home', 'Web Application Icons'),
(120, 'fa-inbox', 'Web Application Icons'),
(121, 'fa-info', 'Web Application Icons'),
(122, 'fa-info-circle', 'Web Application Icons'),
(123, 'fa-key', 'Web Application Icons'),
(124, 'fa-keyboard-o', 'Web Application Icons'),
(125, 'fa-laptop', 'Web Application Icons'),
(126, 'fa-leaf', 'Web Application Icons'),
(127, 'fa-legal', 'Web Application Icons'),
(128, 'fa-lemon-o', 'Web Application Icons'),
(129, 'fa-level-down', 'Web Application Icons'),
(130, 'fa-level-up', 'Web Application Icons'),
(131, 'fa-lightbulb-o', 'Web Application Icons'),
(132, 'fa-location-arrow', 'Web Application Icons'),
(133, 'fa-lock', 'Web Application Icons'),
(134, 'fa-magic', 'Web Application Icons'),
(135, 'fa-magnet', 'Web Application Icons'),
(136, 'fa-mail-forward', 'Web Application Icons'),
(137, 'fa-mail-reply', 'Web Application Icons'),
(138, 'fa-mail-reply-all', 'Web Application Icons'),
(139, 'fa-male', 'Web Application Icons'),
(140, 'fa-map-marker', 'Web Application Icons'),
(141, 'fa-meh-o', 'Web Application Icons'),
(142, 'fa-microphone', 'Web Application Icons'),
(143, 'fa-microphone-slash', 'Web Application Icons'),
(144, 'fa-minus', 'Web Application Icons'),
(145, 'fa-minus-circle', 'Web Application Icons'),
(146, 'fa-minus-square', 'Web Application Icons'),
(147, 'fa-minus-square-o', 'Web Application Icons'),
(148, 'fa-mobile', 'Web Application Icons'),
(149, 'fa-mobile-phone', 'Web Application Icons'),
(150, 'fa-money', 'Web Application Icons'),
(151, 'fa-moon-o', 'Web Application Icons'),
(152, 'fa-music', 'Web Application Icons'),
(153, 'fa-pencil', 'Web Application Icons'),
(154, 'fa-pencil-square', 'Web Application Icons'),
(155, 'fa-pencil-square-o', 'Web Application Icons'),
(156, 'fa-phone', 'Web Application Icons'),
(157, 'fa-phone-square', 'Web Application Icons'),
(158, 'fa-picture-o', 'Web Application Icons'),
(159, 'fa-plane', 'Web Application Icons'),
(160, 'fa-plus', 'Web Application Icons'),
(161, 'fa-plus-circle', 'Web Application Icons'),
(162, 'fa-plus-square', 'Web Application Icons'),
(163, 'fa-plus-square-o', 'Web Application Icons'),
(164, 'fa-power-off', 'Web Application Icons'),
(165, 'fa-print', 'Web Application Icons'),
(166, 'fa-puzzle-piece', 'Web Application Icons'),
(167, 'fa-qrcode', 'Web Application Icons'),
(168, 'fa-question', 'Web Application Icons'),
(169, 'fa-question-circle', 'Web Application Icons'),
(170, 'fa-quote-left', 'Web Application Icons'),
(171, 'fa-quote-right', 'Web Application Icons'),
(172, 'fa-random', 'Web Application Icons'),
(173, 'fa-refresh', 'Web Application Icons'),
(174, 'fa-reply', 'Web Application Icons'),
(175, 'fa-reply-all', 'Web Application Icons'),
(176, 'fa-retweet', 'Web Application Icons'),
(177, 'fa-road', 'Web Application Icons'),
(178, 'fa-rocket', 'Web Application Icons'),
(179, 'fa-rss', 'Web Application Icons'),
(180, 'fa-rss-square', 'Web Application Icons'),
(181, 'fa-search', 'Web Application Icons'),
(182, 'fa-search-minus', 'Web Application Icons'),
(183, 'fa-search-plus', 'Web Application Icons'),
(184, 'fa-share', 'Web Application Icons'),
(185, 'fa-share-square', 'Web Application Icons'),
(186, 'fa-share-square-o', 'Web Application Icons'),
(187, 'fa-shield', 'Web Application Icons'),
(188, 'fa-shopping-cart', 'Web Application Icons'),
(189, 'fa-sign-in', 'Web Application Icons'),
(190, 'fa-sign-out', 'Web Application Icons'),
(191, 'fa-signal', 'Web Application Icons'),
(192, 'fa-sitemap', 'Web Application Icons'),
(193, 'fa-smile-o', 'Web Application Icons'),
(194, 'fa-sort', 'Web Application Icons'),
(195, 'fa-sort-alpha-asc', 'Web Application Icons'),
(196, 'fa-sort-alpha-desc', 'Web Application Icons'),
(197, 'fa-sort-amount-asc', 'Web Application Icons'),
(198, 'fa-sort-amount-desc', 'Web Application Icons'),
(199, 'fa-sort-asc', 'Web Application Icons'),
(200, 'fa-sort-desc', 'Web Application Icons'),
(201, 'fa-sort-down', 'Web Application Icons'),
(202, 'fa-sort-numeric-asc', 'Web Application Icons'),
(203, 'fa-sort-numeric-desc', 'Web Application Icons'),
(204, 'fa-sort-up', 'Web Application Icons'),
(205, 'fa-spinner', 'Web Application Icons'),
(206, 'fa-square', 'Web Application Icons'),
(207, 'fa-square-o', 'Web Application Icons'),
(208, 'fa-star', 'Web Application Icons'),
(209, 'fa-star-half', 'Web Application Icons'),
(210, 'fa-star-half-empty', 'Web Application Icons'),
(211, 'fa-star-half-full', 'Web Application Icons'),
(212, 'fa-star-half-o', 'Web Application Icons'),
(213, 'fa-star-o', 'Web Application Icons'),
(214, 'fa-subscript', 'Web Application Icons'),
(215, 'fa-suitcase', 'Web Application Icons'),
(216, 'fa-sun-o', 'Web Application Icons'),
(217, 'fa-superscript', 'Web Application Icons'),
(218, 'fa-tablet', 'Web Application Icons'),
(219, 'fa-tachometer', 'Web Application Icons'),
(220, 'fa-tag', 'Web Application Icons'),
(221, 'fa-tags', 'Web Application Icons'),
(222, 'fa-tasks', 'Web Application Icons'),
(223, 'fa-terminal', 'Web Application Icons'),
(224, 'fa-thumb-tack', 'Web Application Icons'),
(225, 'fa-thumbs-down', 'Web Application Icons'),
(226, 'fa-thumbs-o-down', 'Web Application Icons'),
(227, 'fa-thumbs-o-up', 'Web Application Icons'),
(228, 'fa-thumbs-up', 'Web Application Icons'),
(229, 'fa-ticket', 'Web Application Icons'),
(230, 'fa-times', 'Web Application Icons'),
(231, 'fa-times-circle', 'Web Application Icons'),
(232, 'fa-times-circle-o', 'Web Application Icons'),
(233, 'fa-tint', 'Web Application Icons'),
(234, 'fa-toggle-down', 'Web Application Icons'),
(235, 'fa-toggle-left', 'Web Application Icons'),
(236, 'fa-toggle-right', 'Web Application Icons'),
(237, 'fa-toggle-up', 'Web Application Icons'),
(238, 'fa-trash-o', 'Web Application Icons'),
(239, 'fa-trophy', 'Web Application Icons'),
(240, 'fa-truck', 'Web Application Icons'),
(241, 'fa-umbrella', 'Web Application Icons'),
(242, 'fa-unlock', 'Web Application Icons'),
(243, 'fa-unlock-alt', 'Web Application Icons'),
(244, 'fa-unsorted', 'Web Application Icons'),
(245, 'fa-upload', 'Web Application Icons'),
(246, 'fa-user', 'Web Application Icons'),
(247, 'fa-users', 'Web Application Icons'),
(248, 'fa-video-camera', 'Web Application Icons'),
(249, 'fa-volume-down', 'Web Application Icons'),
(250, 'fa-volume-off', 'Web Application Icons'),
(251, 'fa-volume-up', 'Web Application Icons'),
(252, 'fa-warning', 'Web Application Icons'),
(253, 'fa-wheelchair', 'Web Application Icons'),
(254, 'fa-wrench', 'Web Application Icons'),
(255, 'fa-check-square', 'Form Control Icons'),
(256, 'fa-check-square-o', 'Form Control Icons'),
(257, 'fa-circle', 'Form Control Icons'),
(258, 'fa-circle-o', 'Form Control Icons'),
(259, 'fa-dot-circle-o', 'Form Control Icons'),
(260, 'fa-minus-square', 'Form Control Icons'),
(261, 'fa-minus-square-o', 'Form Control Icons'),
(262, 'fa-plus-square', 'Form Control Icons'),
(263, 'fa-plus-square-o', 'Form Control Icons'),
(264, 'fa-square', 'Form Control Icons'),
(265, 'fa-square-o', 'Form Control Icons'),
(266, 'fa-bitcoin', 'Form Control Icons'),
(267, 'fa-btc', 'Form Control Icons'),
(268, 'fa-cny', 'Form Control Icons'),
(269, 'fa-dollar', 'Form Control Icons'),
(270, 'fa-eur', 'Form Control Icons'),
(271, 'fa-euro', 'Form Control Icons'),
(272, 'fa-gbp', 'Form Control Icons'),
(273, 'fa-inr', 'Form Control Icons'),
(274, 'fa-jpy', 'Form Control Icons'),
(275, 'fa-krw', 'Form Control Icons'),
(276, 'fa-money', 'Form Control Icons'),
(277, 'fa-rmb', 'Form Control Icons'),
(278, 'fa-rouble', 'Form Control Icons'),
(279, 'fa-rub', 'Form Control Icons'),
(280, 'fa-ruble', 'Form Control Icons'),
(281, 'fa-rupee', 'Form Control Icons'),
(282, 'fa-try', 'Form Control Icons'),
(283, 'fa-turkish-lira', 'Form Control Icons'),
(284, 'fa-usd', 'Form Control Icons'),
(285, 'fa-won', 'Form Control Icons'),
(286, 'fa-yen', 'Form Control Icons'),
(287, 'Text Editor Icons', 'Form Control Icons'),
(288, 'fa-align-center', 'Form Control Icons'),
(289, 'fa-align-justify', 'Form Control Icons'),
(290, 'fa-align-left', 'Form Control Icons'),
(291, 'fa-align-right', 'Form Control Icons'),
(292, 'fa-bold', 'Form Control Icons'),
(293, 'fa-chain', 'Form Control Icons'),
(294, 'fa-chain-broken', 'Form Control Icons'),
(295, 'fa-clipboard', 'Form Control Icons'),
(296, 'fa-columns', 'Form Control Icons'),
(297, 'fa-copy', 'Form Control Icons'),
(298, 'fa-cut', 'Form Control Icons'),
(299, 'fa-dedent', 'Form Control Icons'),
(300, 'fa-eraser', 'Form Control Icons'),
(301, 'fa-file', 'Form Control Icons'),
(302, 'fa-file-o', 'Form Control Icons'),
(303, 'fa-file-text', 'Form Control Icons'),
(304, 'fa-file-text-o', 'Form Control Icons'),
(305, 'fa-files-o', 'Form Control Icons'),
(306, 'fa-floppy-o', 'Form Control Icons'),
(307, 'fa-font', 'Form Control Icons'),
(308, 'fa-indent', 'Form Control Icons'),
(309, 'fa-italic', 'Form Control Icons'),
(310, 'fa-link', 'Form Control Icons'),
(311, 'fa-list', 'Form Control Icons'),
(312, 'fa-list-alt', 'Form Control Icons'),
(313, 'fa-list-ol', 'Form Control Icons'),
(314, 'fa-list-ul', 'Form Control Icons'),
(315, 'fa-outdent', 'Form Control Icons'),
(316, 'fa-paperclip', 'Form Control Icons'),
(317, 'fa-paste', 'Form Control Icons'),
(318, 'fa-repeat', 'Form Control Icons'),
(319, 'fa-rotate-left', 'Form Control Icons'),
(320, 'fa-rotate-right', 'Form Control Icons'),
(321, 'fa-save', 'Form Control Icons'),
(322, 'fa-scissors', 'Form Control Icons'),
(323, 'fa-strikethrough', 'Form Control Icons'),
(324, 'fa-table', 'Form Control Icons'),
(325, 'fa-text-height', 'Form Control Icons'),
(326, 'fa-text-width', 'Form Control Icons'),
(327, 'fa-th', 'Form Control Icons'),
(328, 'fa-th-large', 'Form Control Icons'),
(329, 'fa-th-list', 'Form Control Icons'),
(330, 'fa-underline', 'Form Control Icons'),
(331, 'fa-undo', 'Form Control Icons'),
(332, 'fa-unlink', 'Form Control Icons'),
(333, 'Directional Icons', 'Directional Icons'),
(334, 'fa-angle-double-down', 'Directional Icons'),
(335, 'fa-angle-double-left', 'Directional Icons'),
(336, 'fa-angle-double-right', 'Directional Icons'),
(337, 'fa-angle-double-up', 'Directional Icons'),
(338, 'fa-angle-down', 'Directional Icons'),
(339, 'fa-angle-left', 'Directional Icons'),
(340, 'fa-angle-right', 'Directional Icons'),
(341, 'fa-angle-up', 'Directional Icons'),
(342, 'fa-arrow-circle-down', 'Directional Icons'),
(343, 'fa-arrow-circle-left', 'Directional Icons'),
(344, 'fa-arrow-circle-o-down', 'Directional Icons'),
(345, 'fa-arrow-circle-o-left', 'Directional Icons'),
(346, 'fa-arrow-circle-o-right', 'Directional Icons'),
(347, 'fa-arrow-circle-o-up', 'Directional Icons'),
(348, 'fa-arrow-circle-right', 'Directional Icons'),
(349, 'fa-arrow-circle-up', 'Directional Icons'),
(350, 'fa-arrow-down', 'Directional Icons'),
(351, 'fa-arrow-left', 'Directional Icons'),
(352, 'fa-arrow-right', 'Directional Icons'),
(353, 'fa-arrow-up', 'Directional Icons'),
(354, 'fa-arrows', 'Directional Icons'),
(355, 'fa-arrows-alt', 'Directional Icons'),
(356, 'fa-arrows-h', 'Directional Icons'),
(357, 'fa-arrows-v', 'Directional Icons'),
(358, 'fa-caret-down', 'Directional Icons'),
(359, 'fa-caret-left', 'Directional Icons'),
(360, 'fa-caret-right', 'Directional Icons'),
(361, 'fa-caret-square-o-down', 'Directional Icons'),
(362, 'fa-caret-square-o-left', 'Directional Icons'),
(363, 'fa-caret-square-o-right', 'Directional Icons'),
(364, 'fa-caret-square-o-up', 'Directional Icons'),
(365, 'fa-caret-up', 'Directional Icons'),
(366, 'fa-chevron-circle-down', 'Directional Icons'),
(367, 'fa-chevron-circle-left', 'Directional Icons'),
(368, 'fa-chevron-circle-right', 'Directional Icons'),
(369, 'fa-chevron-circle-up', 'Directional Icons'),
(370, 'fa-chevron-down', 'Directional Icons'),
(371, 'fa-chevron-left', 'Directional Icons'),
(372, 'fa-chevron-right', 'Directional Icons'),
(373, 'fa-chevron-up', 'Directional Icons'),
(374, 'fa-hand-o-down', 'Directional Icons'),
(375, 'fa-hand-o-left', 'Directional Icons'),
(376, 'fa-hand-o-right', 'Directional Icons'),
(377, 'fa-hand-o-up', 'Directional Icons'),
(378, 'fa-long-arrow-down', 'Directional Icons'),
(379, 'fa-long-arrow-left', 'Directional Icons'),
(380, 'fa-long-arrow-right', 'Directional Icons'),
(381, 'fa-long-arrow-up', 'Directional Icons'),
(382, 'fa-toggle-down', 'Directional Icons'),
(383, 'fa-toggle-left', 'Directional Icons'),
(384, 'fa-toggle-right', 'Directional Icons'),
(385, 'fa-toggle-up', 'Directional Icons'),
(386, 'Video Player Icons', 'Video Player Icons'),
(387, 'fa-arrows-alt', 'Video Player Icons'),
(388, 'fa-backward', 'Video Player Icons'),
(389, 'fa-compress', 'Video Player Icons'),
(390, 'fa-eject', 'Video Player Icons'),
(391, 'fa-expand', 'Video Player Icons'),
(392, 'fa-fast-backward', 'Video Player Icons'),
(393, 'fa-fast-forward', 'Video Player Icons'),
(394, 'fa-forward', 'Video Player Icons'),
(395, 'fa-pause', 'Video Player Icons'),
(396, 'fa-play', 'Video Player Icons'),
(397, 'fa-play-circle', 'Video Player Icons'),
(398, 'fa-play-circle-o', 'Video Player Icons'),
(399, 'fa-step-backward', 'Video Player Icons'),
(400, 'fa-step-forward', 'Video Player Icons'),
(401, 'fa-stop', 'Video Player Icons'),
(402, 'fa-youtube-play', 'Video Player Icons'),
(403, 'fa-adn', 'Brand Icons'),
(404, 'fa-android', 'Brand Icons'),
(405, 'fa-apple', 'Brand Icons'),
(406, 'fa-bitbucket', 'Brand Icons'),
(407, 'fa-bitbucket-square', 'Brand Icons'),
(408, 'fa-bitcoin', 'Brand Icons'),
(409, 'fa-btc', 'Brand Icons'),
(410, 'fa-css3', 'Brand Icons'),
(411, 'fa-dribbble', 'Brand Icons'),
(412, 'fa-dropbox', 'Brand Icons'),
(413, 'fa-facebook', 'Brand Icons'),
(414, 'fa-facebook-square', 'Brand Icons'),
(415, 'fa-flickr', 'Brand Icons'),
(416, 'fa-foursquare', 'Brand Icons'),
(417, 'fa-github', 'Brand Icons'),
(418, 'fa-github-alt', 'Brand Icons'),
(419, 'fa-github-square', 'Brand Icons'),
(420, 'fa-gittip', 'Brand Icons'),
(421, 'fa-google-plus', 'Brand Icons'),
(422, 'fa-google-plus-square', 'Brand Icons'),
(423, 'fa-html5', 'Brand Icons'),
(424, 'fa-instagram', 'Brand Icons'),
(425, 'fa-linkedin', 'Brand Icons'),
(426, 'fa-linkedin-square', 'Brand Icons'),
(427, 'fa-linux', 'Brand Icons'),
(428, 'fa-maxcdn', 'Brand Icons'),
(429, 'fa-pagelines', 'Brand Icons'),
(430, 'fa-pinterest', 'Brand Icons'),
(431, 'fa-pinterest-square', 'Brand Icons'),
(432, 'fa-renren', 'Brand Icons'),
(433, 'fa-skype', 'Brand Icons'),
(434, 'fa-stack-exchange', 'Brand Icons'),
(435, 'fa-stack-overflow', 'Brand Icons'),
(436, 'fa-trello', 'Brand Icons'),
(437, 'fa-tumblr', 'Brand Icons'),
(438, 'fa-tumblr-square', 'Brand Icons'),
(439, 'fa-twitter', 'Brand Icons'),
(440, 'fa-twitter-square', 'Brand Icons'),
(441, 'fa-vimeo-square', 'Brand Icons'),
(442, 'fa-vk', 'Brand Icons'),
(443, 'fa-weibo', 'Brand Icons'),
(444, 'fa-windows', 'Brand Icons'),
(445, 'fa-xing', 'Brand Icons'),
(446, 'fa-xing-square', 'Brand Icons'),
(447, 'fa-youtube', 'Brand Icons'),
(448, 'fa-youtube-play', 'Brand Icons'),
(449, 'fa-youtube-square', 'Brand Icons'),
(450, 'Medical Icons', 'Medical Icons'),
(451, 'fa-ambulance', 'Medical Icons'),
(452, 'fa-h-square', 'Medical Icons'),
(453, 'fa-hospital-o', 'Medical Icons'),
(454, 'fa-medkit', 'Medical Icons'),
(455, 'fa-plus-square', 'Medical Icons'),
(456, 'fa-stethoscope', 'Medical Icons'),
(457, 'fa-user-md', 'Medical Icons'),
(458, 'fa-wheelchair', 'Medical Icons');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `supplier_id` int(11) DEFAULT NULL,
  `item_cost_price` double DEFAULT NULL,
  `item_unit_price` double DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `receiving_id` int(11) DEFAULT NULL,
  `transaction_type` text,
  `inventory_transaction` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `ospos_inventory_ibfk_1` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `item_id`, `supplier_id`, `item_cost_price`, `item_unit_price`, `sale_id`, `receiving_id`, `transaction_type`, `inventory_transaction`, `date`, `remarks`, `status`, `order`, `created_by`, `created_date`, `last_updated`) VALUES
(4, 15, 1, 100, 120, NULL, NULL, 'First Time Item Add', 100, NULL, NULL, 1, NULL, 1, '2021-04-07 19:08:15', NULL),
(6, 15, 1, 100, 120, NULL, NULL, 'Stock In', 50, '2021-04-05', NULL, 1, NULL, 1, '2021-04-08 09:32:48', NULL),
(7, 15, 1, 0, 0, NULL, NULL, 'Stock Return', -80, '2021-04-08', 'return due to faulty ', 1, NULL, 1, '2021-04-08 09:37:54', NULL),
(8, 15, 1, 100, 100, NULL, NULL, 'Stock In', 25, '2021-04-08', NULL, 1, NULL, 1, '2021-04-08 18:52:59', NULL),
(9, 16, 0, 100, 120, NULL, NULL, 'First Time Item Added', 0, '0000-00-00', NULL, 1, NULL, 1, '2021-04-08 19:26:26', NULL),
(10, 17, 0, 23, 23, NULL, NULL, 'First Time Item Added', 0, '0000-00-00', NULL, 1, NULL, 1, '2021-04-08 19:31:41', NULL),
(11, 18, 0, 100, 150, NULL, NULL, 'First Time Item Added', 0, '2021-04-08', NULL, 1, NULL, 1, '2021-04-08 20:06:52', NULL),
(12, 18, 1, 100, 120, NULL, NULL, 'Stock In', 100, '2021-04-07', NULL, 1, NULL, 1, '2021-04-08 20:08:19', NULL),
(13, 19, 0, 1000, 1500, NULL, NULL, 'Item Created', 0, '2021-04-09', NULL, 1, NULL, 1, '2021-04-09 17:47:34', NULL),
(14, 19, 1, 1000, 1500, NULL, NULL, 'Stock In', 10, '2021-04-09', NULL, 1, NULL, 1, '2021-04-09 17:48:02', NULL),
(15, 16, 1, 100, 120, NULL, NULL, 'Stock In', 50, '2021-04-14', NULL, 1, NULL, 1, '2021-04-14 21:36:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `item_code_no` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cost_price` double(15,2) NOT NULL,
  `unit_price` double(15,2) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `unit` varchar(255) DEFAULT NULL,
  `reorder_level` double(15,2) NOT NULL DEFAULT '0.00',
  `location` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_code_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `name`, `category`, `item_code_no`, `description`, `cost_price`, `unit_price`, `discount`, `unit`, `reorder_level`, `location`, `status`, `order`, `created_by`, `created_date`, `last_updated`) VALUES
(15, 'Chambor', 'Dry Fruits', '123456', 'some detail here', 100.00, 120.00, 10, '/ Kg', 10.00, 'Row 3 line 1', 1, 15, NULL, '2021-04-07 19:08:15', NULL),
(16, 'Birmogh', 'Dry Fruits', '1234567', '', 100.00, 120.00, 20, '', 10.00, '', 1, 16, NULL, '2021-04-08 19:26:26', NULL),
(17, 'dsfasdf', 'dsfasdf', '2342342342', 'asdfasdf', 23.00, 23.00, 0, '23', 23.00, 'sdfasdfa', 1, 17, NULL, '2021-04-08 19:31:41', NULL),
(18, 'item 2', 'Dry Fruits', '1234563333', 'vzxcvz', 100.00, 150.00, 0, '/ Kg', 5.00, 'vczcxvz', 1, 18, NULL, '2021-04-08 20:06:52', NULL),
(19, 'Nokia', 'Mobile', '123456789', 'asdfas', 1000.00, 1500.00, 0, '/ Mobile', 10.00, 'some where ', 1, 19, NULL, '2021-04-09 17:47:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `module_type` varchar(50) NOT NULL DEFAULT 'controller',
  `module_title` varchar(255) DEFAULT NULL,
  `module_desc` text,
  `module_uri` varchar(255) DEFAULT NULL,
  `module_menu_status` tinyint(4) NOT NULL DEFAULT '0',
  `module_icon` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  `default` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT '2014-01-01 12:00:00',
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1721 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`module_id`, `parent_id`, `module_type`, `module_title`, `module_desc`, `module_uri`, `module_menu_status`, `module_icon`, `status`, `order`, `default`, `created_by`, `created_date`, `last_updated`, `last_updated_by`) VALUES
(2, 0, 'controller', 'Modules', 'Manage Module', 'modules', 1, 'fa-sitemap', 1, 0, 0, 1, NULL, '2015-01-01 12:53:11', NULL),
(16, 2, 'action', 'Index', 'Index action of modules controller', 'index', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:20:33', NULL, NULL),
(17, 2, 'action', 'Controllers', 'List of controllers', 'controllers', 1, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:21:40', NULL, NULL),
(18, 2, 'action', 'Add Controller', 'Add new controller', 'add_controller', 1, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:22:15', '2015-01-01 11:26:43', NULL),
(19, 2, 'action', 'Edit Controller', 'Edit a controller', 'edit_controller', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:23:17', NULL, NULL),
(20, 2, 'action', 'Trashed Controllers', 'List of trashed controllers', 'trashed_controllers', 1, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:23:50', '2015-01-01 11:26:54', NULL),
(21, 2, 'action', 'Trash controller', 'Send a controller to trash', 'trash_controller', 0, 'fa-gbp', 1, 0, 0, NULL, '2014-12-15 17:24:41', '2015-01-01 09:59:26', NULL),
(22, 2, 'action', 'Restore controller', 'Restore a trashed controller', 'restore_controller', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:25:24', NULL, NULL),
(23, 2, 'action', 'Delete controller', 'Delete a controller', 'delete_controller', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:28:29', NULL, NULL),
(24, 2, 'action', 'Actions', 'List of actions', 'actions', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:29:09', '2015-01-01 12:04:40', NULL),
(25, 2, 'action', 'Trashed actions', 'List of trashed actions', 'trashed_action', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:29:40', '2015-01-01 12:04:43', NULL),
(26, 2, 'action', 'Trash action', 'Send an action to trash', 'trash_action', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:31:41', NULL, NULL),
(27, 2, 'action', 'Restore action', 'Restore a trashed action', 'restore_action', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:34:17', NULL, NULL),
(28, 2, 'action', 'Delete action', 'Permanently delete an action', 'delete_action', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:37:34', NULL, NULL),
(29, 2, 'action', 'Add action', 'Add a new action', 'add_action', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:37:57', '2015-01-01 12:04:46', NULL),
(30, 2, 'action', 'Edit action', 'Edit an action', 'edit_action', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-15 17:38:40', NULL, NULL),
(31, 0, 'controller', 'Users', '', 'users', 1, 'fa-users ', 1, 0, 0, NULL, '2014-12-17 15:54:23', '2015-01-01 12:53:33', NULL),
(32, 31, 'action', 'Index', '', 'index', 0, 'fa-stack-exchange', 1, 0, 0, NULL, '2014-12-17 15:54:48', '2014-12-28 23:09:38', NULL),
(33, 31, 'action', 'All Users', '', 'view', 1, 'fa-rub', 1, 0, 0, NULL, '2014-12-17 15:55:04', '2015-01-01 12:48:29', NULL),
(35, 0, 'controller', 'Roles', 'Roles Management', 'roles', 1, 'fa-user', 1, 0, 0, NULL, '2014-12-28 23:00:12', NULL, NULL),
(36, 35, 'action', 'Index', '', 'index', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:01:42', NULL, NULL),
(37, 35, 'action', 'All Roles', '', 'view', 1, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:02:00', '2015-01-01 12:49:53', NULL),
(38, 35, 'action', 'New Role', 'Add new role', 'add_role', 1, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:02:50', '2015-01-01 12:50:06', NULL),
(39, 35, 'action', 'Edit Role', 'Edit a role', 'edit_role', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:03:16', '2014-12-28 23:03:53', NULL),
(40, 35, 'action', 'Trash Role', 'Send a role to trash', 'trash_role', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:04:41', NULL, NULL),
(41, 35, 'action', 'Trashed Roles', 'List of trashed roles', 'trashed_roles', 1, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:05:19', '2015-01-01 12:50:10', NULL),
(42, 35, 'action', 'Restore Role', 'Restore a role from trash', 'restore_role', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:06:11', NULL, NULL),
(43, 35, 'action', 'Delete Role', 'Permanently delete a role', 'delete_role', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:06:41', NULL, NULL),
(44, 31, 'action', 'New User', 'Add a new user', 'add', 1, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:10:25', '2015-01-01 12:48:55', NULL),
(45, 31, 'action', 'Edit user', 'Edit a user', 'edit_user', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:10:44', NULL, NULL),
(46, 31, 'action', 'Trash user', 'Send a user to trash', 'trash_user', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:11:04', NULL, NULL),
(47, 31, 'action', 'Trashed Users', 'List of trashed users', 'trashed', 1, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:11:30', '2015-01-01 12:49:02', NULL),
(48, 31, 'action', 'Delete User', 'Permanently delete a user', 'delete_user', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:11:55', NULL, NULL),
(49, 31, 'action', 'Restore User', 'Restore a user from trash', 'restore_user', 0, 'fa-rub', 1, 0, 0, NULL, '2014-12-28 23:12:24', NULL, NULL),
(817, 0, 'controller', 'System Settings', '', 'system_global_settings', 1, 'fa-laptop', 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(818, 817, 'action', 'All system_global_settings', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(819, 817, 'action', 'New system_global_setting', '', 'add', 0, 'fa-rub', 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(820, 817, 'action', 'Trashed', '', 'trashed', 1, 'fa-rub', 0, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(821, 817, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(822, 817, 'action', 'Edit system_global_setting', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(823, 817, 'action', 'View system_global_setting', NULL, 'view_system_global_setting', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(824, 817, 'action', 'Trash system_global_setting', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(825, 817, 'action', 'Restore system_global_setting', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(826, 817, 'action', 'Delete system_global_setting', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(827, 817, 'action', 'Publish system_global_setting', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(828, 817, 'action', 'Draft system_global_setting', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(829, 817, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(830, 817, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1351, 0, 'controller', 'Restaurants', '', 'restaurants', 1, 'fa-cutlery', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1352, 1351, 'action', 'All restaurants', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1353, 1351, 'action', 'New restaurants', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1354, 1351, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1355, 1351, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1356, 1351, 'action', 'Edit restaurants', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1357, 1351, 'action', 'View restaurants', NULL, 'view_restaurants', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1358, 1351, 'action', 'Trash restaurants', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1359, 1351, 'action', 'Restore restaurants', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1360, 1351, 'action', 'Delete restaurants', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1361, 1351, 'action', 'Publish restaurants', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1362, 1351, 'action', 'Draft restaurants', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1363, 1351, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1364, 1351, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1365, 0, 'controller', 'Restaurant Food Categories', '', 'restaurant_food_categories', 1, 'fa-archive', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1366, 1365, 'action', 'All restaurant_food_categories', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1367, 1365, 'action', 'New restaurant_food_category', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1368, 1365, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1369, 1365, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1370, 1365, 'action', 'Edit restaurant_food_category', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1371, 1365, 'action', 'View restaurant_food_category', NULL, 'view_restaurant_food_category', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1372, 1365, 'action', 'Trash restaurant_food_category', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1373, 1365, 'action', 'Restore restaurant_food_category', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1374, 1365, 'action', 'Delete restaurant_food_category', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1375, 1365, 'action', 'Publish restaurant_food_category', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1376, 1365, 'action', 'Draft restaurant_food_category', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1377, 1365, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1378, 1365, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1379, 0, 'controller', 'Restaurant Food Menus', '', 'restaurant_food_menus', 1, 'fa-vimeo-square', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1380, 1379, 'action', 'All Restaurant Food Menus', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1381, 1379, 'action', 'New Restaurant Food Menu', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1382, 1379, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1383, 1379, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1384, 1379, 'action', 'Edit Restaurant Food Menu', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1385, 1379, 'action', 'View Restaurant Food Menu', NULL, 'view_Restaurant Food Menu', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1386, 1379, 'action', 'Trash Restaurant Food Menu', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1387, 1379, 'action', 'Restore Restaurant Food Menu', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1388, 1379, 'action', 'Delete Restaurant Food Menu', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1389, 1379, 'action', 'Publish Restaurant Food Menu', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1390, 1379, 'action', 'Draft Restaurant Food Menu', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1391, 1379, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1392, 1379, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1393, 0, 'controller', 'Orders', '', 'orders', 1, 'fa-vimeo-square', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1394, 1393, 'action', 'All Orders', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1395, 1393, 'action', 'New Order', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1396, 1393, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1397, 1393, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1398, 1393, 'action', 'Edit Order', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1399, 1393, 'action', 'View Order', NULL, 'view_Order', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1400, 1393, 'action', 'Trash Order', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1401, 1393, 'action', 'Restore Order', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1402, 1393, 'action', 'Delete Order', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1403, 1393, 'action', 'Publish Order', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1404, 1393, 'action', 'Draft Order', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1405, 1393, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1406, 1393, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1407, 0, 'controller', 'New Order', 'Add New Order ', 'orders', 1, 'fa-plus-square-o', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1408, 1407, 'action', 'New Order', 'New Order Form', 'add_new_order', 1, 'fa-rub', 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1409, 0, 'controller', 'Unplaced Orders', 'Unplaced Orders', 'orders', 1, 'fa-shopping-cart ', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1410, 1409, 'action', 'Unplaced Orders', 'Unplaced Orders', 'unplaced_orders', 1, 'fa-rub', 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1411, 0, 'controller', 'Ready Orders', 'Ready Orders', 'orders', 1, 'fa-shopping-bag', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1412, 1411, 'action', 'Ready Orders', 'Ready Orders', 'ready_orders', 1, 'fa-rub', 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1413, 0, 'controller', 'Running Orders', 'Running Orders', 'orders', 1, 'fa-fighter-jet', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1414, 1413, 'action', 'Running Orders', 'Running Orders', 'running_orders', 1, 'fa-rub', 1, 1414, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1415, 0, 'controller', 'Delivered Orders', 'Delivered Orders', 'orders', 1, 'fa-check fa-fw', 3, 1415, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1416, 1415, 'action', 'Delivered Orders', 'Delivered Orders', 'delivered_orders', 1, 'fa-rub', 1, 1416, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1417, 0, 'controller', 'Canceled Orders ', 'Canceled Orders ', 'orders', 1, 'fa-times', 3, 1417, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1418, 1417, 'action', 'Canceled Orders ', 'Canceled Orders ', 'canceled_orders ', 1, 'fa-rub', 1, 1418, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1419, 0, 'controller', 'Awaiting Orders', 'Awaiting Orders', 'orders', 1, 'fa-hourglass-start', 3, 1419, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1420, 1419, 'action', 'Awaiting Orders', 'Awaiting Orders', 'awaited_orders', 1, 'fa-rub', 1, 1420, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1421, 0, 'controller', 'Scheduled Order', 'Scheduled Order', 'orders', 1, 'fa-calendar-check-o', 3, 1421, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1422, 1421, 'action', 'Scheduled Order', 'Scheduled Order', 'scheduled_order', 1, 'fa-rub', 1, 1422, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1423, 0, 'controller', 'Trashed Orders', 'Trashed Orders', 'orders', 1, 'fa-trash-o', 3, 1423, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1424, 1423, 'action', 'Trashed Orders', 'Trashed Orders', 'trashed', 1, 'fa-rub', 1, 1424, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1425, 0, 'controller', 'Riders', '', 'riders', 1, 'fa-motorcycle', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1426, 1425, 'action', 'All Riders', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1427, 1425, 'action', 'New Rider', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1428, 1425, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1429, 1425, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1430, 1425, 'action', 'Edit Rider', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1431, 1425, 'action', 'View Rider', NULL, 'view_Rider', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1432, 1425, 'action', 'Trash Rider', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1433, 1425, 'action', 'Restore Rider', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1434, 1425, 'action', 'Delete Rider', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1435, 1425, 'action', 'Publish Rider', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1436, 1425, 'action', 'Draft Rider', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1437, 1425, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1438, 1425, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1439, 0, 'controller', 'Rider Roster', 'Rider Roster', 'riders', 1, 'fa-calendar-plus-o', 3, 1439, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1440, 1439, 'action', 'Rider Roster', 'Rider Roster', 'rider_roster', 1, 'fa-rub', 1, 1440, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1456, 2, 'action', 'Home Page', 'Home Page', 'home_page', 1, 'fa-rub', 1, 1456, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1457, 0, 'controller', 'Home Page', 'Home Page', 'home_page', 1, 'fa fa-home', 3, 1457, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1458, 1457, 'action', 'Home Page', 'Home Page', 'home_page', 1, 'fa-rub', 1, 1458, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1459, 0, 'controller', 'Slider Banners', 'Slider Banners', 'slider_banners', 1, 'fa fa-sliders', 3, 1459, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1460, 1459, 'action', 'Slider Banners', 'slider_banners', 'slider_banners', 1, 'fa-rub', 1, 1460, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1461, 0, 'controller', 'Why Choose Us', 'Why Choose Us', 'why_choose_us', 1, 'fa fa-check-square-o', 3, 1461, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1462, 1461, 'action', 'Why Choose Us', 'Why Choose Us', 'why_choose_us', 1, 'fa-rub', 1, 1462, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1463, 0, 'controller', 'Social Media Icons', 'Social Media Icons', 'social_media_icons', 1, 'fa fa-share-square-o', 3, 1463, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1464, 1463, 'action', 'Social Media Icons', 'Social Media Icons', 'social_media_icons', 1, 'fa-rub', 1, 1464, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1465, 0, 'controller', 'Services', 'Services', 'services', 1, 'fa fa-anchor', 3, 1465, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1466, 1465, 'action', 'Services', 'Services', 'services', 1, 'fa-rub', 1, 1466, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1467, 0, 'controller', 'Testimonials', 'Testimonials', 'testimonials', 1, 'fa fa-id-card-o', 3, 1467, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1468, 1467, 'action', 'Testimonials', 'Testimonials', 'testimonials', 1, 'fa-rub', 1, 1468, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1469, 0, 'controller', 'Contact Us Page', 'Contact Us Page', 'contact_us_page', 1, 'fa fa-commenting-o', 3, 1469, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1470, 1469, 'action', 'Contact Us Page', 'Contact Us Page', 'contact_us_page', 1, 'fa-rub', 1, 1470, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1471, 0, 'controller', 'Messages', 'Messages', 'messages', 1, 'fa-rub', 3, 1471, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1472, 1471, 'action', 'Messages', 'Messages', 'messages', 1, 'fa-rub', 1, 1472, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1473, 0, 'controller', 'Pages', 'Pages', 'pages', 1, 'fa fa-file-text', 3, 1473, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1474, 1473, 'action', 'Pages', 'Pages', 'pages', 1, 'fa-rub', 1, 1474, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1475, 0, 'controller', 'Menu Pages', 'Menu Pages', 'menu_pages', 1, 'fa fa-bars', 3, 1475, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1476, 1475, 'action', 'Menu Pages', 'Menu Pages', 'menu_pages', 1, 'fa-rub', 1, 1476, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1477, 0, 'controller', 'User Profile info', 'User profile Info', 'profile_info/search', 1, 'fa-rub', 3, 1477, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1478, 1477, 'action', 'User Profile info', 'User Profile info', 'profile_info/search', 1, 'fa-rub', 1, 1478, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1479, 0, 'controller', 'Customers', 'Customers', 'customers', 1, 'fa-users', 3, 1479, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1480, 1479, 'action', 'Customers', 'Customers', 'customers', 1, 'fa-rub', 1, 1480, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1481, 0, 'controller', 'Rider Assigned Orders', 'rider_assigned_orders', 'rider_assigned_orders', 1, 'fa-rub', 3, 1481, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1482, 1481, 'action', 'Rider Assigned Orders', 'Rider Assigned Orders', 'rider_assigned_orders', 1, 'fa-rub', 1, 1482, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1483, 0, 'controller', 'Promo Codes', '', 'promo_codes', 1, 'fa fa-tags', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1484, 1483, 'action', 'All Promo Codes', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1485, 1483, 'action', 'New Promo Code', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1486, 1483, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1487, 1483, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1488, 1483, 'action', 'Edit Promo Code', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1489, 1483, 'action', 'View Promo Code', NULL, 'view_Promo Code', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1490, 1483, 'action', 'Trash Promo Code', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1491, 1483, 'action', 'Restore Promo Code', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1492, 1483, 'action', 'Delete Promo Code', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1493, 1483, 'action', 'Publish Promo Code', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1494, 1483, 'action', 'Draft Promo Code', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1495, 1483, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1496, 1483, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1497, 0, 'controller', 'Add New Order', 'Add New Order', 'orders', 1, 'fa-try', 3, 1497, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1498, 1497, 'action', 'Add New Order', 'Add New Order', 'add_order_new', 1, 'fa-rub', 1, 1498, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1499, 0, 'controller', 'Account', 'Account', 'accounts', 1, 'fa-rub', 3, 1499, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1500, 1499, 'action', 'Account', 'Account', 'account_modules', 1, 'fa-rub', 1, 1500, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1501, 0, 'controller', 'Customer Locations', 'Customer Locations', 'customer_locations', 1, 'fa-ruble', 3, 1501, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1502, 1501, 'action', 'Customer Locations', 'Customer Locations', 'customer_locations', 1, 'fa-ruble', 1, 1502, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1503, 1501, 'action', 'Customer Locations', 'Customer Locations', 'customer_locations', 1, 'fa-ruble', 3, 1503, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1504, 0, 'controller', 'Licence Types', NULL, 'licence_types', 1, NULL, 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1505, 1504, 'action', 'All Licence Types', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1506, 1504, 'action', 'New Licence Type', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1507, 1504, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1508, 1504, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1509, 1504, 'action', 'Edit Licence Type', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1510, 1504, 'action', 'View Licence Type', NULL, 'view_Licence Type', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1511, 1504, 'action', 'Trash Licence Type', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1512, 1504, 'action', 'Restore Licence Type', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1513, 1504, 'action', 'Delete Licence Type', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1514, 1504, 'action', 'Publish Licence Type', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1515, 1504, 'action', 'Draft Licence Type', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1516, 1504, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1517, 1504, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1518, 0, 'controller', 'Drug Licenses', NULL, 'drug_licenses', 1, NULL, 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1519, 1518, 'action', 'All Drug Licenses', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1520, 1518, 'action', 'New Drug License', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1521, 1518, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1522, 1518, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1523, 1518, 'action', 'Edit Drug License', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1524, 1518, 'action', 'View Drug License', NULL, 'view_Drug License', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1525, 1518, 'action', 'Trash Drug License', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1526, 1518, 'action', 'Restore Drug License', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1527, 1518, 'action', 'Delete Drug License', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1528, 1518, 'action', 'Publish Drug License', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1529, 1518, 'action', 'Draft Drug License', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1530, 1518, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1531, 1518, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1532, 0, 'controller', 'User Dashboard', 'User Dashboard', 'user_dashboard', 1, 'fa-anchor', 3, 1532, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1533, 1532, 'action', 'index', 'index', 'index', 1, 'fa-arrows', 1, 1533, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1534, 0, 'controller', 'DG Office Dashboard', 'DG Office Dashboard', 'dg_office_dashboard', 1, 'fa-arrow-circle-o-left', 3, 1534, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1535, 1534, 'action', 'DG Office Dashboard', 'DG Office Dashboard', 'index', 1, 'fa-rub', 1, 1535, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1536, 0, 'controller', 'District Inspector Dashboard', 'District Inspector Dashboard', 'district_inspector_dashboard', 1, 'fa-plus-square-o', 3, 1536, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1537, 1536, 'action', 'District Inspector Dashboard', 'District Inspector Dashboard', 'index', 1, 'fa-arrows', 1, 1537, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1538, 0, 'controller', 'Tasks', '', 'tasks', 1, 'fa-tasks', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1539, 1538, 'action', 'All Tasks', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1540, 1538, 'action', 'New Task', '', 'add', 0, 'fa-rub', 0, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1541, 1538, 'action', 'Trashed', '', 'trashed', 0, 'fa-rub', 0, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1542, 1538, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1543, 1538, 'action', 'Edit Task', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1544, 1538, 'action', 'View Task', NULL, 'view_Task', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1545, 1538, 'action', 'Trash Task', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1546, 1538, 'action', 'Restore Task', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1547, 1538, 'action', 'Delete Task', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1548, 1538, 'action', 'Publish Task', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1549, 1538, 'action', 'Draft Task', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1550, 1538, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1551, 1538, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1552, 0, 'controller', 'Task Attachments', '', 'task_attachments', 1, 'To do tasks', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1553, 1552, 'action', 'All Task Attachments', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1554, 1552, 'action', 'New Task Attachment', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1555, 1552, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1556, 1552, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1557, 1552, 'action', 'Edit Task Attachment', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1558, 1552, 'action', 'View Task Attachment', NULL, 'view_Task Attachment', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1559, 1552, 'action', 'Trash Task Attachment', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1560, 1552, 'action', 'Restore Task Attachment', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1561, 1552, 'action', 'Delete Task Attachment', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1562, 1552, 'action', 'Publish Task Attachment', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1563, 1552, 'action', 'Draft Task Attachment', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1564, 1552, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1565, 1552, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1566, 0, 'controller', 'Assigned Tasks', NULL, 'assigned_tasks', 1, NULL, 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1567, 1566, 'action', 'All Assigned Tasks', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1568, 1566, 'action', 'New Assigned Task', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1569, 1566, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1570, 1566, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1571, 1566, 'action', 'Edit Assigned Task', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1572, 1566, 'action', 'View Assigned Task', NULL, 'view_Assigned Task', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1573, 1566, 'action', 'Trash Assigned Task', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1574, 1566, 'action', 'Restore Assigned Task', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1575, 1566, 'action', 'Delete Assigned Task', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1576, 1566, 'action', 'Publish Assigned Task', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1577, 1566, 'action', 'Draft Assigned Task', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1578, 1566, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1579, 1566, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1580, 0, 'controller', 'To do tasks', 'To do task', 'to_do_tasks', 1, 'fa-list', 3, 1580, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1581, 1580, 'action', 'To do tasks', 'To do task', 'index', 1, 'fa-rub', 1, 1581, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1582, 0, 'controller', 'Resolved Attachments', NULL, 'resolved_attachments', 1, NULL, 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1583, 1582, 'action', 'All Resolved Attachments', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1584, 1582, 'action', 'New Resolved Attachment', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1585, 1582, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1586, 1582, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1587, 1582, 'action', 'Edit Resolved Attachment', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1588, 1582, 'action', 'View Resolved Attachment', NULL, 'view_Resolved Attachment', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1589, 1582, 'action', 'Trash Resolved Attachment', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1590, 1582, 'action', 'Restore Resolved Attachment', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1591, 1582, 'action', 'Delete Resolved Attachment', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1592, 1582, 'action', 'Publish Resolved Attachment', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1593, 1582, 'action', 'Draft Resolved Attachment', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1594, 1582, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1595, 1582, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1596, 1580, 'action', 'Completed Tasks', 'Completed Tasks', 'completed_tasks', 1, 'fa-turkish-lira', 3, 1596, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1597, 0, 'controller', 'Completed Tasks', 'completed_task', 'to_do_tasks', 1, 'fa fa-check', 3, 1597, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1598, 1597, 'action', 'Completed Tasks', 'User Dashboard', 'completed_task', 1, 'fa-plus-square-o', 1, 1598, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1599, 0, 'controller', 'Completed Tasks', 'Completed Tasks', 'tasks', 1, 'fa fa-check', 3, 1599, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1600, 1599, 'action', 'Completed Tasks', 'Completed Tasks', 'completed_task', 1, 'fa-vimeo-square', 1, 1600, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1601, 0, 'controller', 'Districts', 'Districts', 'districts', 1, 'fa-rub', 3, 1601, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1602, 1601, 'action', 'Districts', 'Districts', 'index', 1, 'fa-rub', 1, 1602, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1603, 0, 'controller', 'Teachers', '', 'teachers', 1, 'fa fa-user-circle-o', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1604, 1603, 'action', 'All Teachers', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1605, 1603, 'action', 'New Teacher', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1606, 1603, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1607, 1603, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1608, 1603, 'action', 'Edit Teacher', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1609, 1603, 'action', 'View Teacher', NULL, 'view_Teacher', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1610, 1603, 'action', 'Trash Teacher', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1611, 1603, 'action', 'Restore Teacher', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1612, 1603, 'action', 'Delete Teacher', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1613, 1603, 'action', 'Publish Teacher', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1614, 1603, 'action', 'Draft Teacher', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1615, 1603, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1616, 1603, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1617, 0, 'controller', 'Students', '', 'students', 1, 'fa fa-user', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1618, 1617, 'action', 'All Students', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1619, 1617, 'action', 'New Student', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1620, 1617, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1621, 1617, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1622, 1617, 'action', 'Edit Student', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1623, 1617, 'action', 'View Student', NULL, 'view_Student', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1624, 1617, 'action', 'Trash Student', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1625, 1617, 'action', 'Restore Student', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1626, 1617, 'action', 'Delete Student', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1627, 1617, 'action', 'Publish Student', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1628, 1617, 'action', 'Draft Student', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1629, 1617, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1630, 1617, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1631, 0, 'controller', 'Scholarships', '', 'scholarships', 1, 'fa fa-graduation-cap', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1632, 1631, 'action', 'All Scholarships', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1633, 1631, 'action', 'New Scholarship', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1634, 1631, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1635, 1631, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1636, 1631, 'action', 'Edit Scholarship', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1637, 1631, 'action', 'View Scholarship', NULL, 'view_Scholarship', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1638, 1631, 'action', 'Trash Scholarship', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1639, 1631, 'action', 'Restore Scholarship', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1640, 1631, 'action', 'Delete Scholarship', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1641, 1631, 'action', 'Publish Scholarship', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1642, 1631, 'action', 'Draft Scholarship', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1643, 1631, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1644, 1631, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1645, 0, 'controller', 'Courses', '', 'courses', 1, 'fa fa-book', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1646, 1645, 'action', 'All Courses', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1647, 1645, 'action', 'New Courses', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1648, 1645, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1649, 1645, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1650, 1645, 'action', 'Edit Courses', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1651, 1645, 'action', 'View Courses', NULL, 'view_Courses', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1652, 1645, 'action', 'Trash Courses', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1653, 1645, 'action', 'Restore Courses', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1654, 1645, 'action', 'Delete Courses', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1655, 1645, 'action', 'Publish Courses', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1656, 1645, 'action', 'Draft Courses', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1657, 1645, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1658, 1645, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1659, 0, 'controller', 'Sessions', '', 'sessions', 1, 'fa fa-calendar', 3, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1660, 1659, 'action', 'All Sessions', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1661, 1659, 'action', 'New Session', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1662, 1659, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1663, 1659, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1664, 1659, 'action', 'Edit Session', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1665, 1659, 'action', 'View Session', NULL, 'view_Session', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1666, 1659, 'action', 'Trash Session', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1667, 1659, 'action', 'Restore Session', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1668, 1659, 'action', 'Delete Session', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1669, 1659, 'action', 'Publish Session', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1670, 1659, 'action', 'Draft Session', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1671, 1659, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1672, 1659, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1673, 0, 'controller', 'Home', 'Home', 'home', 1, 'fa fa-home', 3, 1673, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1674, 1673, 'action', 'home', 'home', 'index', 1, 'fa-rub', 1, 1674, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1675, 0, 'controller', 'Reports', 'Reports', 'reports', 1, 'fa-rub', 3, 1675, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1676, 1675, 'action', 'Reports', 'Reports', 'index', 1, 'fa-rub', 1, 1676, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1691, 0, 'controller', 'Suppliers', NULL, 'suppliers', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1692, 1691, 'action', 'All Suppliers', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1693, 1691, 'action', 'New Supplier', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1694, 1691, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1695, 1691, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1696, 1691, 'action', 'Edit Supplier', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1697, 1691, 'action', 'View Supplier', NULL, 'view_Supplier', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1698, 1691, 'action', 'Trash Supplier', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1699, 1691, 'action', 'Restore Supplier', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1700, 1691, 'action', 'Delete Supplier', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1701, 1691, 'action', 'Publish Supplier', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1702, 1691, 'action', 'Draft Supplier', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1703, 1691, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1704, 1691, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1705, 0, 'controller', 'Items', NULL, 'items', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1706, 1705, 'action', 'All Items', NULL, 'view', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1707, 1705, 'action', 'New Item', NULL, 'add', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1708, 1705, 'action', 'Trashed', NULL, 'trashed', 1, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1709, 1705, 'action', 'Index', NULL, 'index', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1710, 1705, 'action', 'Edit Item', NULL, 'edit', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1711, 1705, 'action', 'View Item', NULL, 'view_Item', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1712, 1705, 'action', 'Trash Item', NULL, 'trash', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1713, 1705, 'action', 'Restore Item', NULL, 'restore', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1714, 1705, 'action', 'Delete Item', NULL, 'delete', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1715, 1705, 'action', 'Publish Item', NULL, 'publish', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1716, 1705, 'action', 'Draft Item', NULL, 'draft', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1717, 1705, 'action', 'Move Up', NULL, 'up', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1718, 1705, 'action', 'Move Down', NULL, 'down', 0, NULL, 1, 0, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1719, 0, 'controller', 'Sale Point', 'Sale Point', 'sale_point', 1, 'fa-turkish-lira', 1, 1719, 0, NULL, NULL, '2014-01-01 12:00:00', NULL),
(1720, 1719, 'action', 'Sale Point', 'Sale Point', 'sale_point', 1, 'fa-rub', 1, 1720, 0, NULL, NULL, '2014-01-01 12:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module_rights`
--

DROP TABLE IF EXISTS `module_rights`;
CREATE TABLE IF NOT EXISTS `module_rights` (
  `module_right_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT '1',
  `created_date` varchar(255) DEFAULT NULL,
  `last_updated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`module_right_id`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29064 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `module_rights`
--

INSERT INTO `module_rights` (`module_right_id`, `role_id`, `module_id`, `status`, `created_by`, `created_date`, `last_updated`) VALUES
(26908, 25, 1408, 1, 1, NULL, NULL),
(26909, 25, 1407, 1, 1, NULL, NULL),
(26910, 25, 1410, 1, 1, NULL, NULL),
(26911, 25, 1409, 1, 1, NULL, NULL),
(26912, 25, 1412, 1, 1, NULL, NULL),
(26913, 25, 1411, 1, 1, NULL, NULL),
(26914, 25, 1414, 1, 1, NULL, NULL),
(26915, 25, 1413, 1, 1, NULL, NULL),
(26916, 25, 1416, 1, 1, NULL, NULL),
(26917, 25, 1415, 1, 1, NULL, NULL),
(26918, 25, 1418, 1, 1, NULL, NULL),
(26919, 25, 1417, 1, 1, NULL, NULL),
(26920, 25, 1420, 1, 1, NULL, NULL),
(26921, 25, 1419, 1, 1, NULL, NULL),
(26922, 25, 1422, 1, 1, NULL, NULL),
(26923, 25, 1421, 1, 1, NULL, NULL),
(26924, 25, 1426, 1, 1, NULL, NULL),
(26925, 25, 1425, 1, 1, NULL, NULL),
(26926, 25, 1427, 1, 1, NULL, NULL),
(26927, 25, 1428, 1, 1, NULL, NULL),
(26928, 25, 1429, 1, 1, NULL, NULL),
(26929, 25, 1430, 1, 1, NULL, NULL),
(26930, 25, 1431, 1, 1, NULL, NULL),
(26931, 25, 1432, 1, 1, NULL, NULL),
(26932, 25, 1433, 1, 1, NULL, NULL),
(26933, 25, 1434, 1, 1, NULL, NULL),
(26934, 25, 1435, 1, 1, NULL, NULL),
(26935, 25, 1436, 1, 1, NULL, NULL),
(26936, 25, 1437, 1, 1, NULL, NULL),
(26937, 25, 1438, 1, 1, NULL, NULL),
(26938, 25, 1440, 1, 1, NULL, NULL),
(26939, 25, 1439, 1, 1, NULL, NULL),
(26940, 25, 1478, 1, 1, NULL, NULL),
(26941, 25, 1477, 1, 1, NULL, NULL),
(26942, 25, 1480, 1, 1, NULL, NULL),
(26943, 25, 1479, 1, 1, NULL, NULL),
(26980, 22, 32, 1, 1, NULL, NULL),
(26981, 22, 31, 1, 1, NULL, NULL),
(26982, 22, 33, 1, 1, NULL, NULL),
(26983, 22, 44, 1, 1, NULL, NULL),
(26984, 22, 45, 1, 1, NULL, NULL),
(26985, 22, 46, 1, 1, NULL, NULL),
(26986, 22, 47, 1, 1, NULL, NULL),
(26987, 22, 48, 1, 1, NULL, NULL),
(26988, 22, 49, 1, 1, NULL, NULL),
(26989, 22, 818, 1, 1, NULL, NULL),
(26990, 22, 817, 1, 1, NULL, NULL),
(26991, 22, 819, 1, 1, NULL, NULL),
(26992, 22, 820, 1, 1, NULL, NULL),
(26993, 22, 821, 1, 1, NULL, NULL),
(26994, 22, 822, 1, 1, NULL, NULL),
(26995, 22, 823, 1, 1, NULL, NULL),
(26996, 22, 824, 1, 1, NULL, NULL),
(26997, 22, 825, 1, 1, NULL, NULL),
(26998, 22, 826, 1, 1, NULL, NULL),
(26999, 22, 827, 1, 1, NULL, NULL),
(27000, 22, 828, 1, 1, NULL, NULL),
(27001, 22, 829, 1, 1, NULL, NULL),
(27002, 22, 830, 1, 1, NULL, NULL),
(27003, 22, 1352, 1, 1, NULL, NULL),
(27004, 22, 1351, 1, 1, NULL, NULL),
(27005, 22, 1353, 1, 1, NULL, NULL),
(27006, 22, 1354, 1, 1, NULL, NULL),
(27007, 22, 1355, 1, 1, NULL, NULL),
(27008, 22, 1356, 1, 1, NULL, NULL),
(27009, 22, 1357, 1, 1, NULL, NULL),
(27010, 22, 1358, 1, 1, NULL, NULL),
(27011, 22, 1359, 1, 1, NULL, NULL),
(27012, 22, 1360, 1, 1, NULL, NULL),
(27013, 22, 1361, 1, 1, NULL, NULL),
(27014, 22, 1362, 1, 1, NULL, NULL),
(27015, 22, 1363, 1, 1, NULL, NULL),
(27016, 22, 1364, 1, 1, NULL, NULL),
(27017, 22, 1426, 1, 1, NULL, NULL),
(27018, 22, 1425, 1, 1, NULL, NULL),
(27019, 22, 1427, 1, 1, NULL, NULL),
(27020, 22, 1428, 1, 1, NULL, NULL),
(27021, 22, 1429, 1, 1, NULL, NULL),
(27022, 22, 1430, 1, 1, NULL, NULL),
(27023, 22, 1431, 1, 1, NULL, NULL),
(27024, 22, 1432, 1, 1, NULL, NULL),
(27025, 22, 1433, 1, 1, NULL, NULL),
(27026, 22, 1434, 1, 1, NULL, NULL),
(27027, 22, 1435, 1, 1, NULL, NULL),
(27028, 22, 1436, 1, 1, NULL, NULL),
(27029, 22, 1437, 1, 1, NULL, NULL),
(27030, 22, 1438, 1, 1, NULL, NULL),
(27031, 22, 1440, 1, 1, NULL, NULL),
(27032, 22, 1439, 1, 1, NULL, NULL),
(27033, 22, 1458, 1, 1, NULL, NULL),
(27034, 22, 1457, 1, 1, NULL, NULL),
(27035, 22, 1460, 1, 1, NULL, NULL),
(27036, 22, 1459, 1, 1, NULL, NULL),
(27037, 22, 1462, 1, 1, NULL, NULL),
(27038, 22, 1461, 1, 1, NULL, NULL),
(27039, 22, 1464, 1, 1, NULL, NULL),
(27040, 22, 1463, 1, 1, NULL, NULL),
(27041, 22, 1466, 1, 1, NULL, NULL),
(27042, 22, 1465, 1, 1, NULL, NULL),
(27043, 22, 1468, 1, 1, NULL, NULL),
(27044, 22, 1467, 1, 1, NULL, NULL),
(27045, 22, 1470, 1, 1, NULL, NULL),
(27046, 22, 1469, 1, 1, NULL, NULL),
(27047, 22, 1474, 1, 1, NULL, NULL),
(27048, 22, 1473, 1, 1, NULL, NULL),
(27049, 22, 1476, 1, 1, NULL, NULL),
(27050, 22, 1475, 1, 1, NULL, NULL),
(27051, 22, 1478, 1, 1, NULL, NULL),
(27052, 22, 1477, 1, 1, NULL, NULL),
(27053, 22, 1480, 1, 1, NULL, NULL),
(27054, 22, 1479, 1, 1, NULL, NULL),
(27055, 22, 1483, 1, 1, NULL, NULL),
(27056, 22, 1484, 1, 1, NULL, NULL),
(27057, 22, 1485, 1, 1, NULL, NULL),
(27058, 22, 1486, 1, 1, NULL, NULL),
(27059, 22, 1487, 1, 1, NULL, NULL),
(27060, 22, 1488, 1, 1, NULL, NULL),
(27061, 22, 1489, 1, 1, NULL, NULL),
(27062, 22, 1490, 1, 1, NULL, NULL),
(27063, 22, 1491, 1, 1, NULL, NULL),
(27064, 22, 1492, 1, 1, NULL, NULL),
(27065, 22, 1493, 1, 1, NULL, NULL),
(27066, 22, 1494, 1, 1, NULL, NULL),
(27067, 22, 1495, 1, 1, NULL, NULL),
(27068, 22, 1496, 1, 1, NULL, NULL),
(27079, 21, 1412, 1, 1, NULL, NULL),
(27080, 21, 1411, 1, 1, NULL, NULL),
(27081, 21, 1414, 1, 1, NULL, NULL),
(27082, 21, 1413, 1, 1, NULL, NULL),
(27083, 21, 1416, 1, 1, NULL, NULL),
(27084, 21, 1415, 1, 1, NULL, NULL),
(27085, 21, 1418, 1, 1, NULL, NULL),
(27086, 21, 1417, 1, 1, NULL, NULL),
(27087, 21, 1420, 1, 1, NULL, NULL),
(27088, 21, 1419, 1, 1, NULL, NULL),
(27089, 21, 1422, 1, 1, NULL, NULL),
(27090, 21, 1421, 1, 1, NULL, NULL),
(27091, 21, 1424, 1, 1, NULL, NULL),
(27092, 21, 1423, 1, 1, NULL, NULL),
(27093, 21, 1426, 1, 1, NULL, NULL),
(27094, 21, 1425, 1, 1, NULL, NULL),
(27095, 21, 1427, 1, 1, NULL, NULL),
(27096, 21, 1428, 1, 1, NULL, NULL),
(27097, 21, 1429, 1, 1, NULL, NULL),
(27098, 21, 1430, 1, 1, NULL, NULL),
(27099, 21, 1431, 1, 1, NULL, NULL),
(27100, 21, 1432, 1, 1, NULL, NULL),
(27101, 21, 1433, 1, 1, NULL, NULL),
(27102, 21, 1434, 1, 1, NULL, NULL),
(27103, 21, 1435, 1, 1, NULL, NULL),
(27104, 21, 1436, 1, 1, NULL, NULL),
(27105, 21, 1437, 1, 1, NULL, NULL),
(27106, 21, 1438, 1, 1, NULL, NULL),
(27107, 21, 1440, 1, 1, NULL, NULL),
(27108, 21, 1439, 1, 1, NULL, NULL),
(27109, 21, 1478, 1, 1, NULL, NULL),
(27110, 21, 1477, 1, 1, NULL, NULL),
(27111, 21, 1480, 1, 1, NULL, NULL),
(27112, 21, 1479, 1, 1, NULL, NULL),
(27113, 21, 1482, 1, 1, NULL, NULL),
(27114, 21, 1481, 1, 1, NULL, NULL),
(27115, 21, 1407, 1, 1, NULL, NULL),
(27116, 21, 1408, 1, 1, NULL, NULL),
(27117, 26, 1499, 1, 1, NULL, NULL),
(27118, 26, 1500, 1, 1, NULL, NULL),
(27125, 20, 1408, 1, 1, NULL, NULL),
(27126, 20, 1407, 1, 1, NULL, NULL),
(27127, 20, 1410, 1, 1, NULL, NULL),
(27128, 20, 1409, 1, 1, NULL, NULL),
(27129, 20, 1478, 1, 1, NULL, NULL),
(27130, 20, 1477, 1, 1, NULL, NULL),
(27131, 20, 1480, 1, 1, NULL, NULL),
(27132, 20, 1479, 1, 1, NULL, NULL),
(27133, 20, 1498, 1, 1, NULL, NULL),
(27134, 20, 1497, 1, 1, NULL, NULL),
(27135, 20, 1501, 1, 1, NULL, NULL),
(27136, 20, 1502, 1, 1, NULL, NULL),
(27523, 3, 1581, 1, 1, NULL, NULL),
(27524, 3, 1580, 1, 1, NULL, NULL),
(27525, 3, 1597, 1, 1, NULL, NULL),
(27526, 3, 1598, 1, 1, NULL, NULL),
(27569, 9, 1580, 1, 1, NULL, NULL),
(27570, 9, 1581, 1, 1, NULL, NULL),
(27571, 9, 1596, 1, 1, NULL, NULL),
(27572, 9, 1597, 1, 1, NULL, NULL),
(27573, 9, 1598, 1, 1, NULL, NULL),
(27574, 10, 1580, 1, 1, NULL, NULL),
(27575, 10, 1581, 1, 1, NULL, NULL),
(27576, 10, 1596, 1, 1, NULL, NULL),
(27577, 10, 1597, 1, 1, NULL, NULL),
(27578, 10, 1598, 1, 1, NULL, NULL),
(27579, 11, 1538, 1, 1, NULL, NULL),
(27580, 11, 1539, 1, 1, NULL, NULL),
(27581, 11, 1540, 1, 1, NULL, NULL),
(27582, 11, 1541, 1, 1, NULL, NULL),
(27583, 11, 1542, 1, 1, NULL, NULL),
(27584, 11, 1543, 1, 1, NULL, NULL),
(27585, 11, 1544, 1, 1, NULL, NULL),
(27586, 11, 1545, 1, 1, NULL, NULL),
(27587, 11, 1546, 1, 1, NULL, NULL),
(27588, 11, 1547, 1, 1, NULL, NULL),
(27589, 11, 1548, 1, 1, NULL, NULL),
(27590, 11, 1549, 1, 1, NULL, NULL),
(27591, 11, 1550, 1, 1, NULL, NULL),
(27592, 11, 1551, 1, 1, NULL, NULL),
(27593, 11, 1597, 1, 1, NULL, NULL),
(27594, 11, 1598, 1, 1, NULL, NULL),
(27600, 12, 1581, 1, 1, NULL, NULL),
(27601, 12, 1580, 1, 1, NULL, NULL),
(27602, 12, 1596, 1, 1, NULL, NULL),
(27603, 12, 1598, 1, 1, NULL, NULL),
(27604, 12, 1597, 1, 1, NULL, NULL),
(27610, 14, 1580, 1, 1, NULL, NULL),
(27611, 14, 1581, 1, 1, NULL, NULL),
(27612, 14, 1596, 1, 1, NULL, NULL),
(27613, 14, 1597, 1, 1, NULL, NULL),
(27614, 14, 1598, 1, 1, NULL, NULL),
(27615, 5, 1581, 1, 1, NULL, NULL),
(27616, 5, 1580, 1, 1, NULL, NULL),
(27617, 5, 1598, 1, 1, NULL, NULL),
(27618, 5, 1597, 1, 1, NULL, NULL),
(27619, 4, 1581, 1, 1, NULL, NULL),
(27620, 4, 1580, 1, 1, NULL, NULL),
(27621, 4, 1598, 1, 1, NULL, NULL),
(27622, 4, 1597, 1, 1, NULL, NULL),
(27623, 15, 1580, 1, 1, NULL, NULL),
(27624, 15, 1581, 1, 1, NULL, NULL),
(27625, 15, 1596, 1, 1, NULL, NULL),
(27626, 15, 1597, 1, 1, NULL, NULL),
(27627, 15, 1598, 1, 1, NULL, NULL),
(27660, 7, 1581, 1, 1, NULL, NULL),
(27661, 7, 1580, 1, 1, NULL, NULL),
(27662, 7, 1596, 1, 1, NULL, NULL),
(27663, 7, 1598, 1, 1, NULL, NULL),
(27664, 7, 1597, 1, 1, NULL, NULL),
(27665, 6, 1581, 1, 1, NULL, NULL),
(27666, 6, 1580, 1, 1, NULL, NULL),
(27667, 6, 1596, 1, 1, NULL, NULL),
(27668, 6, 1598, 1, 1, NULL, NULL),
(27669, 6, 1597, 1, 1, NULL, NULL),
(27670, 8, 1581, 1, 1, NULL, NULL),
(27671, 8, 1580, 1, 1, NULL, NULL),
(27672, 8, 1596, 1, 1, NULL, NULL),
(27673, 8, 1598, 1, 1, NULL, NULL),
(27674, 8, 1597, 1, 1, NULL, NULL),
(27675, 16, 1597, 1, 1, NULL, NULL),
(27676, 16, 1598, 1, 1, NULL, NULL),
(27677, 16, 1580, 1, 1, NULL, NULL),
(27678, 16, 1581, 1, 1, NULL, NULL),
(27679, 16, 1596, 1, 1, NULL, NULL),
(27685, 17, 1580, 1, 1, NULL, NULL),
(27686, 17, 1581, 1, 1, NULL, NULL),
(27687, 17, 1596, 1, 1, NULL, NULL),
(27688, 17, 1597, 1, 1, NULL, NULL),
(27689, 17, 1598, 1, 1, NULL, NULL),
(27690, 13, 1581, 1, 1, NULL, NULL),
(27691, 13, 1580, 1, 1, NULL, NULL),
(27692, 13, 1598, 1, 1, NULL, NULL),
(27693, 13, 1597, 1, 1, NULL, NULL),
(27694, 13, 1601, 1, 1, NULL, NULL),
(27695, 2, 1539, 1, 1, NULL, NULL),
(27696, 2, 1538, 1, 1, NULL, NULL),
(27697, 2, 1540, 1, 1, NULL, NULL),
(27698, 2, 1541, 1, 1, NULL, NULL),
(27699, 2, 1542, 1, 1, NULL, NULL),
(27700, 2, 1543, 1, 1, NULL, NULL),
(27701, 2, 1544, 1, 1, NULL, NULL),
(27702, 2, 1545, 1, 1, NULL, NULL),
(27703, 2, 1546, 1, 1, NULL, NULL),
(27704, 2, 1547, 1, 1, NULL, NULL),
(27705, 2, 1548, 1, 1, NULL, NULL),
(27706, 2, 1549, 1, 1, NULL, NULL),
(27707, 2, 1550, 1, 1, NULL, NULL),
(27708, 2, 1551, 1, 1, NULL, NULL),
(27709, 2, 1600, 1, 1, NULL, NULL),
(27710, 2, 1599, 1, 1, NULL, NULL),
(27711, 2, 1601, 1, 1, NULL, NULL),
(28726, 19, 1604, 1, 1, NULL, NULL),
(28727, 19, 1603, 1, 1, NULL, NULL),
(28728, 19, 1605, 1, 1, NULL, NULL),
(28729, 19, 1606, 1, 1, NULL, NULL),
(28730, 19, 1607, 1, 1, NULL, NULL),
(28731, 19, 1608, 1, 1, NULL, NULL),
(28732, 19, 1609, 1, 1, NULL, NULL),
(28733, 19, 1610, 1, 1, NULL, NULL),
(28734, 19, 1611, 1, 1, NULL, NULL),
(28735, 19, 1612, 1, 1, NULL, NULL),
(28736, 19, 1613, 1, 1, NULL, NULL),
(28737, 19, 1614, 1, 1, NULL, NULL),
(28738, 19, 1615, 1, 1, NULL, NULL),
(28739, 19, 1616, 1, 1, NULL, NULL),
(28740, 19, 1632, 1, 1, NULL, NULL),
(28741, 19, 1631, 1, 1, NULL, NULL),
(28742, 19, 1633, 1, 1, NULL, NULL),
(28743, 19, 1634, 1, 1, NULL, NULL),
(28744, 19, 1635, 1, 1, NULL, NULL),
(28745, 19, 1636, 1, 1, NULL, NULL),
(28746, 19, 1637, 1, 1, NULL, NULL),
(28747, 19, 1638, 1, 1, NULL, NULL),
(28748, 19, 1639, 1, 1, NULL, NULL),
(28749, 19, 1640, 1, 1, NULL, NULL),
(28750, 19, 1641, 1, 1, NULL, NULL),
(28751, 19, 1642, 1, 1, NULL, NULL),
(28752, 19, 1643, 1, 1, NULL, NULL),
(28753, 19, 1644, 1, 1, NULL, NULL),
(28754, 19, 1646, 1, 1, NULL, NULL),
(28755, 19, 1645, 1, 1, NULL, NULL),
(28756, 19, 1647, 1, 1, NULL, NULL),
(28757, 19, 1648, 1, 1, NULL, NULL),
(28758, 19, 1649, 1, 1, NULL, NULL),
(28759, 19, 1650, 1, 1, NULL, NULL),
(28760, 19, 1651, 1, 1, NULL, NULL),
(28761, 19, 1652, 1, 1, NULL, NULL),
(28762, 19, 1653, 1, 1, NULL, NULL),
(28763, 19, 1654, 1, 1, NULL, NULL),
(28764, 19, 1655, 1, 1, NULL, NULL),
(28765, 19, 1656, 1, 1, NULL, NULL),
(28766, 19, 1657, 1, 1, NULL, NULL),
(28767, 19, 1658, 1, 1, NULL, NULL),
(28768, 19, 1660, 1, 1, NULL, NULL),
(28769, 19, 1659, 1, 1, NULL, NULL),
(28770, 19, 1661, 1, 1, NULL, NULL),
(28771, 19, 1662, 1, 1, NULL, NULL),
(28772, 19, 1663, 1, 1, NULL, NULL),
(28773, 19, 1664, 1, 1, NULL, NULL),
(28774, 19, 1665, 1, 1, NULL, NULL),
(28775, 19, 1666, 1, 1, NULL, NULL),
(28776, 19, 1667, 1, 1, NULL, NULL),
(28777, 19, 1668, 1, 1, NULL, NULL),
(28778, 19, 1669, 1, 1, NULL, NULL),
(28779, 19, 1670, 1, 1, NULL, NULL),
(28780, 19, 1671, 1, 1, NULL, NULL),
(28781, 19, 1672, 1, 1, NULL, NULL),
(28782, 19, 1674, 1, 1, NULL, NULL),
(28783, 19, 1673, 1, 1, NULL, NULL),
(28784, 19, 1675, 1, 1, NULL, NULL),
(28785, 19, 1676, 1, 1, NULL, NULL),
(28986, 1, 16, 1, 1, NULL, NULL),
(28987, 1, 2, 1, 1, NULL, NULL),
(28988, 1, 17, 1, 1, NULL, NULL),
(28989, 1, 18, 1, 1, NULL, NULL),
(28990, 1, 19, 1, 1, NULL, NULL),
(28991, 1, 20, 1, 1, NULL, NULL),
(28992, 1, 21, 1, 1, NULL, NULL),
(28993, 1, 22, 1, 1, NULL, NULL),
(28994, 1, 23, 1, 1, NULL, NULL),
(28995, 1, 24, 1, 1, NULL, NULL),
(28996, 1, 25, 1, 1, NULL, NULL),
(28997, 1, 26, 1, 1, NULL, NULL),
(28998, 1, 27, 1, 1, NULL, NULL),
(28999, 1, 28, 1, 1, NULL, NULL),
(29000, 1, 29, 1, 1, NULL, NULL),
(29001, 1, 30, 1, 1, NULL, NULL),
(29002, 1, 32, 1, 1, NULL, NULL),
(29003, 1, 31, 1, 1, NULL, NULL),
(29004, 1, 33, 1, 1, NULL, NULL),
(29005, 1, 44, 1, 1, NULL, NULL),
(29006, 1, 45, 1, 1, NULL, NULL),
(29007, 1, 46, 1, 1, NULL, NULL),
(29008, 1, 47, 1, 1, NULL, NULL),
(29009, 1, 48, 1, 1, NULL, NULL),
(29010, 1, 49, 1, 1, NULL, NULL),
(29011, 1, 36, 1, 1, NULL, NULL),
(29012, 1, 35, 1, 1, NULL, NULL),
(29013, 1, 37, 1, 1, NULL, NULL),
(29014, 1, 38, 1, 1, NULL, NULL),
(29015, 1, 39, 1, 1, NULL, NULL),
(29016, 1, 40, 1, 1, NULL, NULL),
(29017, 1, 41, 1, 1, NULL, NULL),
(29018, 1, 42, 1, 1, NULL, NULL),
(29019, 1, 43, 1, 1, NULL, NULL),
(29020, 1, 818, 1, 1, NULL, NULL),
(29021, 1, 817, 1, 1, NULL, NULL),
(29022, 1, 819, 1, 1, NULL, NULL),
(29023, 1, 820, 1, 1, NULL, NULL),
(29024, 1, 821, 1, 1, NULL, NULL),
(29025, 1, 822, 1, 1, NULL, NULL),
(29026, 1, 823, 1, 1, NULL, NULL),
(29027, 1, 824, 1, 1, NULL, NULL),
(29028, 1, 825, 1, 1, NULL, NULL),
(29029, 1, 826, 1, 1, NULL, NULL),
(29030, 1, 827, 1, 1, NULL, NULL),
(29031, 1, 828, 1, 1, NULL, NULL),
(29032, 1, 829, 1, 1, NULL, NULL),
(29033, 1, 830, 1, 1, NULL, NULL),
(29034, 1, 1692, 1, 1, NULL, NULL),
(29035, 1, 1691, 1, 1, NULL, NULL),
(29036, 1, 1693, 1, 1, NULL, NULL),
(29037, 1, 1694, 1, 1, NULL, NULL),
(29038, 1, 1695, 1, 1, NULL, NULL),
(29039, 1, 1696, 1, 1, NULL, NULL),
(29040, 1, 1697, 1, 1, NULL, NULL),
(29041, 1, 1698, 1, 1, NULL, NULL),
(29042, 1, 1699, 1, 1, NULL, NULL),
(29043, 1, 1700, 1, 1, NULL, NULL),
(29044, 1, 1701, 1, 1, NULL, NULL),
(29045, 1, 1702, 1, 1, NULL, NULL),
(29046, 1, 1703, 1, 1, NULL, NULL),
(29047, 1, 1704, 1, 1, NULL, NULL),
(29048, 1, 1706, 1, 1, NULL, NULL),
(29049, 1, 1705, 1, 1, NULL, NULL),
(29050, 1, 1707, 1, 1, NULL, NULL),
(29051, 1, 1708, 1, 1, NULL, NULL),
(29052, 1, 1709, 1, 1, NULL, NULL),
(29053, 1, 1710, 1, 1, NULL, NULL),
(29054, 1, 1711, 1, 1, NULL, NULL),
(29055, 1, 1712, 1, 1, NULL, NULL),
(29056, 1, 1713, 1, 1, NULL, NULL),
(29057, 1, 1714, 1, 1, NULL, NULL),
(29058, 1, 1715, 1, 1, NULL, NULL),
(29059, 1, 1716, 1, 1, NULL, NULL),
(29060, 1, 1717, 1, 1, NULL, NULL),
(29061, 1, 1718, 1, 1, NULL, NULL),
(29062, 1, 1719, 1, 1, NULL, NULL),
(29063, 1, 1720, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_homepage` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT '0',
  `role_title` varchar(255) DEFAULT NULL,
  `role_desc` text,
  `role_level` int(11) DEFAULT NULL,
  `role_groups` varchar(255) DEFAULT NULL,
  `group_order` int(11) NOT NULL DEFAULT '1',
  `status` int(11) DEFAULT '1',
  `order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` varchar(255) DEFAULT NULL,
  `last_updated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_homepage`, `department_id`, `role_title`, `role_desc`, `role_level`, `role_groups`, `group_order`, `status`, `order`, `created_by`, `created_date`, `last_updated`) VALUES
(1, 16, 1, 'Developer', '', 0, NULL, 1, 0, 1, 1, '2015-02-06 00:00:00', '2015-02-06 00:00:00'),
(19, 1674, 0, 'Manger', 'Manger', 2, NULL, 1, 1, 19, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_mobile_no` varchar(255) COLLATE utf16_persian_ci DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf16_persian_ci DEFAULT NULL,
  `items_price` float NOT NULL,
  `items_discounts` float NOT NULL DEFAULT '0',
  `items_total_price` float NOT NULL DEFAULT '0',
  `total_tax_pay_able` float NOT NULL DEFAULT '0',
  `items_total_price_including_tax` float NOT NULL DEFAULT '0',
  `discount` float NOT NULL,
  `total_payable` int(11) NOT NULL,
  `cash_amount` float NOT NULL,
  `cash_back` float NOT NULL,
  `payment_type` varchar(50) COLLATE utf16_persian_ci NOT NULL,
  `remarks` text COLLATE utf16_persian_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT NULL,
  `test_token_id` varchar(255) COLLATE utf16_persian_ci DEFAULT NULL,
  `test_report_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf16 COLLATE=utf16_persian_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `customer_mobile_no`, `customer_name`, `items_price`, `items_discounts`, `items_total_price`, `total_tax_pay_able`, `items_total_price_including_tax`, `discount`, `total_payable`, `cash_amount`, `cash_back`, `payment_type`, `remarks`, `status`, `order`, `created_by`, `created_date`, `last_updated`, `test_token_id`, `test_report_by`) VALUES
(134, '', '', 3000, 0, 3000, 0, 3000, 0, 3000, 3000, 0, 'cash', '', 1, NULL, 1, '2021-04-19 10:15:55', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

DROP TABLE IF EXISTS `sales_items`;
CREATE TABLE IF NOT EXISTS `sales_items` (
  `sale_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `cost_price` float NOT NULL,
  `unit_price` float NOT NULL,
  `item_discount` float NOT NULL,
  `sale_items` int(11) NOT NULL DEFAULT '0',
  `return_items` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL,
  `sale_price` float NOT NULL,
  `total_price` float NOT NULL,
  `returned` int(11) NOT NULL DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_item_id`),
  KEY `sale_id` (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_items`
--

INSERT INTO `sales_items` (`sale_item_id`, `sale_id`, `item_id`, `item_name`, `cost_price`, `unit_price`, `item_discount`, `sale_items`, `return_items`, `quantity`, `sale_price`, `total_price`, `returned`, `remarks`, `created_by`, `created_date`) VALUES
(412, 134, 19, 'nokia', 1000, 1500, 0, 0, 1, 0, 1500, 0, 0, NULL, 1, '2021-04-19 15:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `sales_item_users`
--

DROP TABLE IF EXISTS `sales_item_users`;
CREATE TABLE IF NOT EXISTS `sales_item_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_item_users`
--

INSERT INTO `sales_item_users` (`id`, `item_id`, `quantity`, `user_id`, `dated`) VALUES
(56, 19, 1, 1, '2021-04-19 15:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `sale_taxes`
--

DROP TABLE IF EXISTS `sale_taxes`;
CREATE TABLE IF NOT EXISTS `sale_taxes` (
  `sale_tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax_name` text NOT NULL,
  `tax_percentage` float NOT NULL,
  PRIMARY KEY (`sale_tax_id`),
  KEY `sale_taxes` (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `social_media_icons`
--

DROP TABLE IF EXISTS `social_media_icons`;
CREATE TABLE IF NOT EXISTS `social_media_icons` (
  `social_media_icon_id` int(11) NOT NULL AUTO_INCREMENT,
  `social_media_name` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `social_media_image` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `social_media_icon` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `social_media_link` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`social_media_icon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf16 COLLATE=utf16_persian_ci;

--
-- Dumping data for table `social_media_icons`
--

INSERT INTO `social_media_icons` (`social_media_icon_id`, `social_media_name`, `social_media_image`, `social_media_icon`, `social_media_link`, `status`, `order`, `created_by`, `created_date`, `last_updated`) VALUES
(1, 'Facebook', 'social_media_icons/a2a1319d725da5e7a1d74db25f9503ab.jpg', 'fa fa-facebook', 'www.facebook.com/darewro', 2, 1, 0, '2016-09-03 23:29:26', NULL),
(2, 'Google Plus', '', 'fa fa-google-plus', 'www.google.com/plus', 1, 4, 0, '2016-09-03 23:30:10', NULL),
(3, 'Twitter', '', 'fa fa-twitter', 'www.twitter.com', 1, 3, 0, '2016-09-03 23:30:38', NULL),
(4, 'Pinterest', '', 'fa fa-pinterest', 'www.pinterest.com', 1, 5, 0, '2016-09-03 23:31:03', NULL),
(5, 'Youtube', '', 'fa fa-youtube', 'www.youtube.com', 1, 6, 0, '2016-09-03 23:31:22', NULL),
(6, 'Facebook', '', 'fa fa-facebook', 'www.facebook.com/darewro', 1, 2, 0, '2018-02-18 13:06:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_contact_no` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_contact_no`, `company_name`, `account_number`, `status`, `order`, `created_by`, `created_date`, `last_updated`) VALUES
(1, 'Navid Aziz ', '032454424414', 'ATS Chitral', 'abcdefd', 1, 1, NULL, '2021-04-06 22:41:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_global_settings`
--

DROP TABLE IF EXISTS `system_global_settings`;
CREATE TABLE IF NOT EXISTS `system_global_settings` (
  `system_global_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_title` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `system_sub_title` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `sytem_public_logo` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `sytem_admin_logo` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `mobile_number` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `fax_number` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `address` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `web_address` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `description` text COLLATE utf16_persian_ci NOT NULL,
  `open_time` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `closed_time` varchar(255) COLLATE utf16_persian_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`system_global_setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_persian_ci;

--
-- Dumping data for table `system_global_settings`
--

INSERT INTO `system_global_settings` (`system_global_setting_id`, `system_title`, `system_sub_title`, `sytem_public_logo`, `sytem_admin_logo`, `phone_number`, `mobile_number`, `fax_number`, `email_address`, `address`, `web_address`, `description`, `open_time`, `closed_time`, `status`, `order`, `created_by`, `created_date`, `last_updated`) VALUES
(1, 'Application', 'Application', 'system_global_settings/6eea04a9166ec931e88b089727c4bca8.jpg', 'system_global_settings/7867ebb44e353b489aee7d60885b4c37.jpg', '0000 0000000', '0000 0000000', '0000 0000000', '0000 0000000', 'Address ', 'http://www.abc.com', 'some detail', '9', '2', 1, 1, 0, '2015-07-28 09:08:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
CREATE TABLE IF NOT EXISTS `taxes` (
  `tax_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tax_percentage` double(15,3) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`tax_id`,`name`,`tax_percentage`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`tax_id`, `name`, `tax_percentage`, `status`, `order`, `created_by`, `created_date`, `last_updated`) VALUES
(1, 'Sales Tax', 1.000, 0, NULL, NULL, '2021-04-09 20:20:14', NULL),
(2, 'Area Tax', 2.000, 0, NULL, NULL, '2021-04-09 20:21:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `directorate_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `hospital_id` varchar(255) DEFAULT NULL,
  `user_title` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_mobile_number` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `user_password_reset_code` varchar(255) DEFAULT NULL,
  `mobile_token` text,
  `profile_complete` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `directorate_id`, `district_id`, `hospital_id`, `user_title`, `user_email`, `user_mobile_number`, `user_name`, `user_password`, `user_image`, `user_password_reset_code`, `mobile_token`, `profile_complete`, `status`, `order`, `created_by`, `created_date`, `last_updated`) VALUES
(1, 1, 0, NULL, '0', 'Admin', 'navidaziz98@gmail.com', '03244424414', 'admin', 'admin', 'users/c88e4c3fddc3ad91320cb351134c4191.png', NULL, NULL, 1, 1, 1, 1, '2015-02-06 00:00:00', '2015-02-06 00:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_sale_summary`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `user_sale_summary`;
CREATE TABLE IF NOT EXISTS `user_sale_summary` (
`user_id` int(11)
,`items_total` double(19,2)
,`total_discount` double(19,2)
,`total_price` double(19,2)
,`tax_total_percentage` double(20,3)
,`total_tax_pay_able` double(19,2)
,`pay_able` double(19,2)
);

-- --------------------------------------------------------

--
-- Structure for view `all_items`
--
DROP TABLE IF EXISTS `all_items`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_items`  AS  select `items`.`item_id` AS `item_id`,`items`.`name` AS `name`,`items`.`category` AS `category`,`items`.`item_code_no` AS `item_code_no`,`items`.`description` AS `description`,`items`.`cost_price` AS `cost_price`,`items`.`unit_price` AS `unit_price`,`items`.`discount` AS `discount`,(`items`.`unit_price` - `items`.`discount`) AS `sale_price`,`items`.`unit` AS `unit`,`items`.`reorder_level` AS `reorder_level`,`items`.`location` AS `location`,`items`.`status` AS `status`,`items`.`order` AS `order`,`items`.`created_by` AS `created_by`,`items`.`created_date` AS `created_date`,`items`.`last_updated` AS `last_updated`,(select sum(`i`.`inventory_transaction`) from `inventory` `i` where (`i`.`item_id` = `items`.`item_id`)) AS `total_stock`,(select if(isnull(sum(`si`.`quantity`)),0,sum(`si`.`quantity`)) from `sales_items` `si` where (`si`.`item_id` = `items`.`item_id`)) AS `item_saled`,((select sum(`i`.`inventory_transaction`) from `inventory` `i` where (`i`.`item_id` = `items`.`item_id`)) - ((select if(isnull(sum(`si`.`quantity`)),0,sum(`si`.`quantity`)) from `sales_items` `si` where (`si`.`item_id` = `items`.`item_id`)) + (select if(isnull(sum(`siu`.`quantity`)),0,sum(`siu`.`quantity`)) from `sales_item_users` `siu` where (`siu`.`item_id` = `items`.`item_id`)))) AS `total_quantity` from `items` ;

-- --------------------------------------------------------

--
-- Structure for view `user_sale_summary`
--
DROP TABLE IF EXISTS `user_sale_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_sale_summary`  AS  select `sales_item_users`.`user_id` AS `user_id`,sum((`all_items`.`unit_price` * `sales_item_users`.`quantity`)) AS `items_total`,(sum((`all_items`.`unit_price` * `sales_item_users`.`quantity`)) - sum((`all_items`.`sale_price` * `sales_item_users`.`quantity`))) AS `total_discount`,sum((`all_items`.`sale_price` * `sales_item_users`.`quantity`)) AS `total_price`,if(isnull((select sum(`taxes`.`tax_percentage`) from `taxes` where (`taxes`.`status` = 1))),0,(select sum(`taxes`.`tax_percentage`) from `taxes` where (`taxes`.`status` = 1))) AS `tax_total_percentage`,round(((if(isnull((select sum(`taxes`.`tax_percentage`) from `taxes` where (`taxes`.`status` = 1))),0,(select sum(`taxes`.`tax_percentage`) from `taxes` where (`taxes`.`status` = 1))) * sum((`all_items`.`sale_price` * `sales_item_users`.`quantity`))) / 100),2) AS `total_tax_pay_able`,(round(((if(isnull((select sum(`taxes`.`tax_percentage`) from `taxes` where (`taxes`.`status` = 1))),0,(select sum(`taxes`.`tax_percentage`) from `taxes` where (`taxes`.`status` = 1))) * sum((`all_items`.`sale_price` * `sales_item_users`.`quantity`))) / 100),2) + sum((`all_items`.`sale_price` * `sales_item_users`.`quantity`))) AS `pay_able` from (`all_items` join `sales_item_users`) where (`all_items`.`item_id` = `sales_item_users`.`item_id`) group by `sales_item_users`.`user_id` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `module_rights`
--
ALTER TABLE `module_rights`
  ADD CONSTRAINT `module to module_rights` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD CONSTRAINT `sale_items` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale_taxes`
--
ALTER TABLE `sale_taxes`
  ADD CONSTRAINT `sale_taxes` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
