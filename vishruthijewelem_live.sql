-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 04, 2021 at 11:18 PM
-- Server version: 10.5.13-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vishruthijewelem_live`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(191) NOT NULL DEFAULT 0,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `role_id`, `photo`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `shop_name`) VALUES
(1, 'Admin', 'admin@gmail.com', '01629552892', 0, '1556780563user.png', '$2y$10$p35S2FczpEfpbe41CX4j4.XE548tHBtF5weGLPxZ56MX5dsOFtaCC', 1, 'Gi1m8NKkrwJWZzlRs6BydbaglLdjlPelJc5xCKb3qsEZkxQvJnmda8uRFlO2', '2018-02-28 23:27:08', '2019-07-26 21:21:32', 'Genius Store'),
(5, 'Mr Mamun', 'mamun@gmail.com', '34534534', 17, '1568803644User.png', '$2y$10$3AEjcvFBiQHECgtH9ivXTeQZfMf.rw318G820TtVBsYaCt7UNOwGC', 1, NULL, '2019-09-18 04:47:24', '2019-09-18 21:21:49', NULL),
(6, 'Mr. Manik', 'manik@gmail.com', '5079956958', 18, '1568863361user-admin.png', '$2y$10$Z3Jx5jHjV2m4HtZHzeaKMuwxkLAKfJ1AX3Ed5MPACvFJLFkEWN9L.', 1, NULL, '2019-09-18 21:22:41', '2019-09-18 21:22:41', NULL),
(7, 'Mr. Pratik', 'pratik@gmail.com', '34534534', 16, '1568863396user-admin.png', '$2y$10$u.93l4y6wOz6vq3BlAxvU.LuJ16/uBQ9s2yesRGTWUtLRiQSwoH1C', 1, 'iZPbEaxjSWBJMvncLqeMtAQsG7VoSirVMJ1EBfdJogvgXK2DM5mw236fBCOq', '2019-09-18 21:23:16', '2019-09-18 21:23:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_languages`
--

CREATE TABLE `admin_languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_languages`
--

INSERT INTO `admin_languages` (`id`, `is_default`, `language`, `file`, `name`, `rtl`) VALUES
(1, 1, 'English', '1567232745AoOcvCtY.json', '1567232745AoOcvCtY', 0),
(2, 0, 'RTL English', '1584887310NzfWDhO8.json', '1584887310NzfWDhO8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_conversations`
--

CREATE TABLE `admin_user_conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_conversations`
--

INSERT INTO `admin_user_conversations` (`id`, `subject`, `user_id`, `message`, `created_at`, `updated_at`, `type`, `order_number`) VALUES
(1, 'Order Confirmation', 22, 'rfgdfgfd', '2020-01-21 01:18:38', '2020-01-21 01:18:38', 'Ticket', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_messages`
--

CREATE TABLE `admin_user_messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_messages`
--

INSERT INTO `admin_user_messages` (`id`, `conversation_id`, `message`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'rfgdfgfd', 22, '2020-01-21 01:18:38', '2020-01-21 01:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `attributable_id` int(11) DEFAULT NULL,
  `attributable_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `input_name` varchar(255) DEFAULT NULL,
  `price_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `details_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attributable_id`, `attributable_type`, `name`, `input_name`, `price_status`, `details_status`, `created_at`, `updated_at`) VALUES
(14, 5, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(20, 4, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-24 00:41:46', '2019-10-03 00:18:54'),
(21, 4, 'App\\Models\\Category', 'Brand', 'brand', 1, 1, '2019-09-24 00:44:13', '2019-10-03 00:19:13'),
(22, 2, 'App\\Models\\Subcategory', 'Color Family', 'color_family', 1, 1, '2019-09-24 00:45:45', '2019-09-24 00:45:45'),
(24, 1, 'App\\Models\\Childcategory', 'Display Size', 'display_size', 1, 1, '2019-09-24 00:54:17', '2019-09-24 00:54:17'),
(25, 12, 'App\\Models\\Subcategory', 'demo', 'demo', 1, 1, '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(30, 3, 'App\\Models\\Subcategory', 'Interior Color', 'interior_color', 1, 1, '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(31, 8, 'App\\Models\\Childcategory', 'Temperature', 'temperature', 1, 1, '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(32, 18, 'App\\Models\\Category', 'Demo', 'demo', 1, 1, '2019-10-02 23:39:12', '2019-10-02 23:39:12'),
(33, 4, 'App\\Models\\Category', 'RAM', 'ram', 1, 1, '2019-10-12 03:22:03', '2019-10-12 23:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `name`, `created_at`, `updated_at`) VALUES
(107, 14, 'No Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(108, 14, 'Local seller Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(109, 14, 'Non local warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(110, 14, 'International Manufacturer Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(111, 14, 'International Seller Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(157, 22, 'Black', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(158, 22, 'White', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(159, 22, 'Sliver', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(160, 22, 'Red', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(161, 22, 'Dark Grey', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(162, 22, 'Dark Blue', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(163, 22, 'Brown', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(172, 24, '40', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(173, 24, '22', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(174, 24, '24', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(175, 24, '32', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(176, 24, '21', '2019-09-24 01:25:32', '2019-09-24 01:25:32'),
(177, 25, 'demo 1', '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(178, 25, 'demo 2', '2019-09-24 01:26:47', '2019-09-24 01:26:47'),
(187, 30, 'Yellow', '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(188, 30, 'White', '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(189, 31, '22', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(190, 31, '34', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(191, 31, '45', '2019-09-24 04:34:35', '2019-09-24 04:34:35'),
(195, 20, 'Local seller warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(196, 20, 'No warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(197, 20, 'international manufacturer warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(198, 20, 'Non-local warranty', '2019-10-03 00:18:54', '2019-10-03 00:18:54'),
(199, 21, 'Symphony', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(200, 21, 'Oppo', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(201, 21, 'EStore', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(202, 21, 'Infinix', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(203, 21, 'Apple', '2019-10-03 00:19:13', '2019-10-03 00:19:13'),
(243, 33, '1 GB', '2019-10-12 23:30:39', '2019-10-12 23:30:39'),
(244, 33, '2 GB', '2019-10-12 23:30:39', '2019-10-12 23:30:39'),
(245, 33, '3 GB', '2019-10-12 23:30:39', '2019-10-12 23:30:39'),
(253, 32, 'demo 1', '2019-10-13 03:18:04', '2019-10-13 03:18:04'),
(254, 32, 'demo 2', '2019-10-13 03:18:04', '2019-10-13 03:18:04'),
(255, 32, 'demo 3', '2019-10-13 03:18:04', '2019-10-13 03:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `link`, `type`) VALUES
(1, '1568889151top2.jpg', 'https://www.google.com/', 'TopSmall'),
(2, '1568889146top1.jpg', NULL, 'TopSmall'),
(3, '1635169057banner3.jpg', 'https://www.google.com/', 'Large'),
(4, '1564398600side-triple3.jpg', 'https://www.google.com/', 'BottomSmall'),
(5, '1564398579side-triple2.jpg', 'https://www.google.com/', 'BottomSmall'),
(6, '1564398571side-triple1.jpg', 'https://www.google.com/', 'BottomSmall');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(191) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `meta_tag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(9, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700986-min.jpg', 'www.geniusocean.com', 42, 1, 'b1,b2,b3', 'Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level.', 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-02-06 09:53:41'),
(10, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700902-min.jpg', 'www.geniusocean.com', 20, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-03-06 09:54:21'),
(12, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700821-min.jpg', 'www.geniusocean.com', 25, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-04-06 22:04:20'),
(13, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700676-min.jpg', 'www.geniusocean.com', 63, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-05-06 22:04:36'),
(14, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700595-min.jpg', 'www.geniusocean.com', 9, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-06-03 06:02:30'),
(15, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700464-min.jpg', 'www.geniusocean.com', 12, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-07-03 06:02:53'),
(16, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700383-min.jpg', 'www.geniusocean.com', 11, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(17, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700322-min.jpg', 'www.geniusocean.com', 56, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(18, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700251-min.jpg', 'www.geniusocean.com', 161, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(20, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699136-min.jpg', 'www.geniusocean.com', 16, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(21, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699045-min.jpg', 'www.geniusocean.com', 42, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(22, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698954-min.jpg', 'www.geniusocean.com', 78, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(23, 7, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698893-min.jpg', 'www.geniusocean.com', 11, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(24, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698832-min.jpg', 'www.geniusocean.com', 40, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37');
INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(25, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15557542831-min.jpg', 'www.geniusocean.com', 50, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`) VALUES
(2, 'Oil & gas', 'oil-and-gas'),
(3, 'Manufacturing', 'manufacturing'),
(4, 'Chemical Research', 'chemical_research'),
(5, 'Agriculture', 'agriculture'),
(6, 'Mechanical', 'mechanical'),
(7, 'Entrepreneurs', 'entrepreneurs'),
(8, 'Technology', 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `photo`, `is_featured`, `image`) VALUES
(4, 'Electronic', 'electric', 0, '1557807287light.png', 1, '1568709131f6.jpg'),
(5, 'Fashion & Beauty', 'fashion-and-Beauty', 0, '1557807279fashion.png', 1, '1568709123f1.jpg'),
(6, 'Camera & Photo', 'camera-and-photo', 0, '1557807264camera.png', 1, '1568709110f2.jpg'),
(7, 'Smart Phone & Table', 'smart-phone-and-table', 0, '1557377810mobile.png', 1, '1568709597f4.jpg'),
(8, 'Sport & Outdoor', 'sport-and-Outdoor', 0, '1557807258sports.png', 1, '1568709577f8.jpg'),
(9, 'Jewelry & Watches', 'jewelry-and-watches', 0, '1557807252furniture.png', 1, '1568709077f7.jpg'),
(10, 'Health & Beauty', 'health-and-beauty', 0, '1557807228trends.png', 1, '1568709067f3.jpg'),
(11, 'Books & Office', 'books-and-office', 0, '1557377917bags.png', 1, '1568709050f8.jpg'),
(12, 'Toys & Hobbies', 'toys-and-hobbies', 0, '1557807214sports.png', 1, '1568709042f9.jpg'),
(13, 'Books', 'books', 0, '1557807208bags.png', 1, '1568709037f10.jpg'),
(15, 'Automobiles & Motorcycles', 'automobiles-and-motorcycles', 0, '1568708648motor.car.png', 1, '1568709031f11.jpg'),
(17, 'Portable & Personal Electronics', 'portable-and-personal-electronics', 0, '1568878538electronic.jpg', 0, NULL),
(18, 'Outdoor, Recreation & Fitness', 'Outdoor-Recreation-and-Fitness', 0, '1568878596home.jpg', 0, NULL),
(20, 'Harams', 'harams', 1, NULL, 0, NULL),
(21, 'Necklace', 'necklace', 1, NULL, 0, NULL),
(22, 'Bangles', 'bangles', 1, NULL, 0, NULL),
(23, 'Earrings', 'earrings', 1, NULL, 0, NULL),
(24, 'Hip Belts & Armlets', 'hip-belts-armlets', 1, NULL, 0, NULL),
(25, 'Hair Ornaments', 'hair-ornaments', 1, NULL, 0, NULL),
(26, 'Anklets & Toe Rings', 'anklets-toe-rings', 1, NULL, 0, NULL),
(27, 'Pendants', 'pendants', 1, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(191) NOT NULL,
  `subcategory_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `childcategories`
--

INSERT INTO `childcategories` (`id`, `subcategory_id`, `name`, `slug`, `status`) VALUES
(1, 2, 'LCD TV', 'lcd-tv', 0),
(8, 3, 'Mini Fridge', 'mini-fridge', 0),
(17, 18, 'Nakashi antique haram', 'nakashi-antique-haram', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(191) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) NOT NULL,
  `recieved_user` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(11) NOT NULL,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `todays_count` int(11) NOT NULL DEFAULT 0,
  `today` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `type`, `referral`, `total_count`, `todays_count`, `today`) VALUES
(1, 'referral', 'www.facebook.com', 5, 0, NULL),
(2, 'referral', 'geniusocean.com', 2, 0, NULL),
(3, 'browser', 'Windows 10', 1551, 0, NULL),
(4, 'browser', 'Linux', 311, 0, NULL),
(5, 'browser', 'Unknown OS Platform', 590, 0, NULL),
(6, 'browser', 'Windows 7', 867, 0, NULL),
(7, 'referral', 'yandex.ru', 15, 0, NULL),
(8, 'browser', 'Windows 8.1', 548, 0, NULL),
(9, 'referral', 'www.google.com', 26, 0, NULL),
(10, 'browser', 'Android', 409, 0, NULL),
(11, 'browser', 'Mac OS X', 654, 0, NULL),
(12, 'referral', 'l.facebook.com', 1, 0, NULL),
(13, 'referral', 'codecanyon.net', 6, 0, NULL),
(14, 'browser', 'Windows XP', 15, 0, NULL),
(15, 'browser', 'Windows 8', 5, 0, NULL),
(16, 'browser', 'iPad', 4, 0, NULL),
(17, 'browser', 'Ubuntu', 19, 0, NULL),
(18, 'browser', 'iPhone', 10, 0, NULL),
(19, 'browser', 'Windows Server 2003/XP x64', 1, 0, NULL),
(20, 'referral', 'chi-node40.websitehostserver.net', 9, 0, NULL),
(21, 'browser', 'Windows Vista', 33, 0, NULL),
(22, 'referral', 'vishruthijewelemporium.com', 3, 0, NULL),
(23, 'referral', 'baidu.com', 1, 0, NULL),
(24, 'referral', 'search.yahoo.co.jp', 1, 0, NULL),
(25, 'browser', 'Windows 2000', 1, 0, NULL),
(26, 'referral', 'chir113.websitehostserver.net', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CD', 'Democratic Republic of the Congo'),
(50, 'CG', 'Republic of Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GK', 'Guernsey'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'GN', 'Guinea'),
(92, 'GW', 'Guinea-Bissau'),
(93, 'GY', 'Guyana'),
(94, 'HT', 'Haiti'),
(95, 'HM', 'Heard and Mc Donald Islands'),
(96, 'HN', 'Honduras'),
(97, 'HK', 'Hong Kong'),
(98, 'HU', 'Hungary'),
(99, 'IS', 'Iceland'),
(100, 'IN', 'India'),
(101, 'IM', 'Isle of Man'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran (Islamic Republic of)'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'CI', 'Ivory Coast'),
(109, 'JE', 'Jersey'),
(110, 'JM', 'Jamaica'),
(111, 'JP', 'Japan'),
(112, 'JO', 'Jordan'),
(113, 'KZ', 'Kazakhstan'),
(114, 'KE', 'Kenya'),
(115, 'KI', 'Kiribati'),
(116, 'KP', 'Korea, Democratic People\'s Republic of'),
(117, 'KR', 'Korea, Republic of'),
(118, 'XK', 'Kosovo'),
(119, 'KW', 'Kuwait'),
(120, 'KG', 'Kyrgyzstan'),
(121, 'LA', 'Lao People\'s Democratic Republic'),
(122, 'LV', 'Latvia'),
(123, 'LB', 'Lebanon'),
(124, 'LS', 'Lesotho'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libyan Arab Jamahiriya'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lithuania'),
(129, 'LU', 'Luxembourg'),
(130, 'MO', 'Macau'),
(131, 'MK', 'North Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MW', 'Malawi'),
(134, 'MY', 'Malaysia'),
(135, 'MV', 'Maldives'),
(136, 'ML', 'Mali'),
(137, 'MT', 'Malta'),
(138, 'MH', 'Marshall Islands'),
(139, 'MQ', 'Martinique'),
(140, 'MR', 'Mauritania'),
(141, 'MU', 'Mauritius'),
(142, 'TY', 'Mayotte'),
(143, 'MX', 'Mexico'),
(144, 'FM', 'Micronesia, Federated States of'),
(145, 'MD', 'Moldova, Republic of'),
(146, 'MC', 'Monaco'),
(147, 'MN', 'Mongolia'),
(148, 'ME', 'Montenegro'),
(149, 'MS', 'Montserrat'),
(150, 'MA', 'Morocco'),
(151, 'MZ', 'Mozambique'),
(152, 'MM', 'Myanmar'),
(153, 'NA', 'Namibia'),
(154, 'NR', 'Nauru'),
(155, 'NP', 'Nepal'),
(156, 'NL', 'Netherlands'),
(157, 'AN', 'Netherlands Antilles'),
(158, 'NC', 'New Caledonia'),
(159, 'NZ', 'New Zealand'),
(160, 'NI', 'Nicaragua'),
(161, 'NE', 'Niger'),
(162, 'NG', 'Nigeria'),
(163, 'NU', 'Niue'),
(164, 'NF', 'Norfolk Island'),
(165, 'MP', 'Northern Mariana Islands'),
(166, 'NO', 'Norway'),
(167, 'OM', 'Oman'),
(168, 'PK', 'Pakistan'),
(169, 'PW', 'Palau'),
(170, 'PS', 'Palestine'),
(171, 'PA', 'Panama'),
(172, 'PG', 'Papua New Guinea'),
(173, 'PY', 'Paraguay'),
(174, 'PE', 'Peru'),
(175, 'PH', 'Philippines'),
(176, 'PN', 'Pitcairn'),
(177, 'PL', 'Poland'),
(178, 'PT', 'Portugal'),
(179, 'PR', 'Puerto Rico'),
(180, 'QA', 'Qatar'),
(181, 'RE', 'Reunion'),
(182, 'RO', 'Romania'),
(183, 'RU', 'Russian Federation'),
(184, 'RW', 'Rwanda'),
(185, 'KN', 'Saint Kitts and Nevis'),
(186, 'LC', 'Saint Lucia'),
(187, 'VC', 'Saint Vincent and the Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'SB', 'Solomon Islands'),
(200, 'SO', 'Somalia'),
(201, 'ZA', 'South Africa'),
(202, 'GS', 'South Georgia South Sandwich Islands'),
(203, 'SS', 'South Sudan'),
(204, 'ES', 'Spain'),
(205, 'LK', 'Sri Lanka'),
(206, 'SH', 'St. Helena'),
(207, 'PM', 'St. Pierre and Miquelon'),
(208, 'SD', 'Sudan'),
(209, 'SR', 'Suriname'),
(210, 'SJ', 'Svalbard and Jan Mayen Islands'),
(211, 'SZ', 'Swaziland'),
(212, 'SE', 'Sweden'),
(213, 'CH', 'Switzerland'),
(214, 'SY', 'Syrian Arab Republic'),
(215, 'TW', 'Taiwan'),
(216, 'TJ', 'Tajikistan'),
(217, 'TZ', 'Tanzania, United Republic of'),
(218, 'TH', 'Thailand'),
(219, 'TG', 'Togo'),
(220, 'TK', 'Tokelau'),
(221, 'TO', 'Tonga'),
(222, 'TT', 'Trinidad and Tobago'),
(223, 'TN', 'Tunisia'),
(224, 'TR', 'Turkey'),
(225, 'TM', 'Turkmenistan'),
(226, 'TC', 'Turks and Caicos Islands'),
(227, 'TV', 'Tuvalu'),
(228, 'UG', 'Uganda'),
(229, 'UA', 'Ukraine'),
(230, 'AE', 'United Arab Emirates'),
(231, 'GB', 'United Kingdom'),
(232, 'US', 'United States'),
(233, 'UM', 'United States minor outlying islands'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VU', 'Vanuatu'),
(237, 'VA', 'Vatican City State'),
(238, 'VE', 'Venezuela'),
(239, 'VN', 'Vietnam'),
(240, 'VG', 'Virgin Islands (British)'),
(241, 'VI', 'Virgin Islands (U.S.)'),
(242, 'WF', 'Wallis and Futuna Islands'),
(243, 'EH', 'Western Sahara'),
(244, 'YE', 'Yemen'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `price`, `times`, `used`, `status`, `start_date`, `end_date`) VALUES
(1, 'eqwe', 1, 12.22, '990', 18, 1, '2019-01-15', '2026-08-20'),
(2, 'sdsdsasd', 0, 11, NULL, 2, 1, '2019-05-23', '2022-05-26'),
(3, 'werwd', 0, 22, NULL, 3, 1, '2019-05-23', '2023-06-08'),
(4, 'asdasd', 1, 23.5, NULL, 1, 1, '2019-05-23', '2020-05-28'),
(5, 'kopakopakopa', 0, 40, NULL, 3, 1, '2019-05-23', '2032-05-20'),
(6, 'rererere', 1, 9, '665', 1, 1, '2019-05-23', '2022-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(191) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `sign`, `value`, `is_default`) VALUES
(1, 'USD', '$', 0.013, 0),
(4, 'BDT', '৳', 1.14, 0),
(6, 'EUR', '€', 0.011, 0),
(8, 'INR', '₹', 1, 1),
(9, 'NGN', '₦', 5.48, 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_body` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1),
(2, 'new_registration', 'Welcome To Royal Commerce', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1),
(3, 'vendor_accept', 'Your Vendor Account Activated', '<p>Hello {customer_name},<br>Your Vendor Account Activated Successfully. Please Login to your account and build your own shop.</p><p>Thank You<br></p>', 1),
(4, 'subscription_warning', 'Your subscrption plan will end after five days', '<p>Hello {customer_name},<br>Your subscription plan duration will end after five days. Please renew your plan otherwise all of your products will be deactivated.</p><p>Thank You<br></p>', 1),
(5, 'vendor_verification', 'Request for verification.', '<p>Hello {customer_name},<br>You are requested verify your account. Please send us photo of your passport.</p><p>Thank You<br></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`, `status`) VALUES
(1, 'Right my front it wound cause fully', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(3, 'Man particular insensible celebrated', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(4, 'Civilly why how end viewing related', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(5, 'Six started far placing saw respect', '<span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: center;\"><br></div></div><div style=\"text-align: center;\"><span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.<br></span></div>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `favorite_sellers`
--

CREATE TABLE `favorite_sellers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `vendor_id` int(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favorite_sellers`
--

INSERT INTO `favorite_sellers` (`id`, `user_id`, `vendor_id`) VALUES
(1, 22, 13);

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `photo`) VALUES
(236, 212, 'w5vmo94nDA.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(191) NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_loader` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT 1,
  `talkto` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_language` tinyint(1) NOT NULL DEFAULT 1,
  `is_loader` tinyint(1) NOT NULL DEFAULT 1,
  `map_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_disqus` tinyint(1) NOT NULL DEFAULT 0,
  `disqus` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_contact` tinyint(1) NOT NULL DEFAULT 0,
  `is_faq` tinyint(1) NOT NULL DEFAULT 0,
  `guest_checkout` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_check` tinyint(1) NOT NULL DEFAULT 0,
  `cod_check` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_format` tinyint(1) NOT NULL DEFAULT 0,
  `withdraw_fee` double NOT NULL DEFAULT 0,
  `withdraw_charge` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_pass` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT 0,
  `is_comment` tinyint(1) NOT NULL DEFAULT 1,
  `is_currency` tinyint(1) NOT NULL DEFAULT 1,
  `add_cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_stock` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_wish` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_wish` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wish_remove` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_compare` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_compare` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compare_remove` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_change` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_found` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_coupon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_coupon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_affilate` tinyint(1) NOT NULL DEFAULT 1,
  `affilate_charge` int(100) NOT NULL DEFAULT 0,
  `affilate_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_commission` double NOT NULL DEFAULT 0,
  `percentage_commission` double NOT NULL DEFAULT 0,
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `multiple_packaging` tinyint(4) NOT NULL DEFAULT 0,
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT 0,
  `reg_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `cod_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT 0,
  `menu_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_hover_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT 0,
  `is_verification_email` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_instamojo` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `is_paystack` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wholesell` int(191) NOT NULL DEFAULT 0,
  `is_capcha` tinyint(1) NOT NULL DEFAULT 0,
  `error_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT 0,
  `popup_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popup_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popup_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT 0,
  `is_report` tinyint(1) NOT NULL,
  `paypal_check` tinyint(1) DEFAULT 0,
  `paypal_business` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_encryption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_merchant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_website` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_industry` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paytm` int(11) NOT NULL DEFAULT 1,
  `paytm_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_mode` enum('sandbox','live') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_molly` tinyint(1) NOT NULL DEFAULT 0,
  `molly_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `molly_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_razorpay` int(11) NOT NULL DEFAULT 1,
  `razorpay_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_stock` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintain` tinyint(1) NOT NULL DEFAULT 0,
  `maintain_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `favicon`, `title`, `header_email`, `header_phone`, `footer`, `copyright`, `colors`, `loader`, `admin_loader`, `is_talkto`, `talkto`, `is_language`, `is_loader`, `map_key`, `is_disqus`, `disqus`, `is_contact`, `is_faq`, `guest_checkout`, `stripe_check`, `cod_check`, `stripe_key`, `stripe_secret`, `currency_format`, `withdraw_fee`, `withdraw_charge`, `tax`, `shipping_cost`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `from_email`, `from_name`, `is_smtp`, `is_comment`, `is_currency`, `add_cart`, `out_stock`, `add_wish`, `already_wish`, `wish_remove`, `add_compare`, `already_compare`, `compare_remove`, `color_change`, `coupon_found`, `no_coupon`, `already_coupon`, `order_title`, `order_text`, `is_affilate`, `affilate_charge`, `affilate_banner`, `already_cart`, `fixed_commission`, `percentage_commission`, `multiple_shipping`, `multiple_packaging`, `vendor_ship_info`, `reg_vendor`, `cod_text`, `paypal_text`, `stripe_text`, `header_color`, `footer_color`, `copyright_color`, `is_admin_loader`, `menu_color`, `menu_hover_color`, `is_home`, `is_verification_email`, `instamojo_key`, `instamojo_token`, `instamojo_text`, `is_instamojo`, `instamojo_sandbox`, `is_paystack`, `paystack_key`, `paystack_email`, `paystack_text`, `wholesell`, `is_capcha`, `error_banner`, `is_popup`, `popup_title`, `popup_text`, `popup_background`, `invoice_logo`, `user_image`, `vendor_color`, `is_secure`, `is_report`, `paypal_check`, `paypal_business`, `footer_logo`, `email_encryption`, `paytm_merchant`, `paytm_secret`, `paytm_website`, `paytm_industry`, `is_paytm`, `paytm_text`, `paytm_mode`, `is_molly`, `molly_key`, `molly_text`, `is_razorpay`, `razorpay_key`, `razorpay_secret`, `razorpay_text`, `show_stock`, `is_maintain`, `maintain_text`, `gst_number`) VALUES
(1, '1635162622logo--footer.png', '1637129477fav.png', 'Vishruthi Jewel Emporium', 'smtp', '0123 456789', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae', 'COPYRIGHT © 2019. All Rights Reserved By <a href=\"http://geniusocean.com/\">GeniusOcean.com</a>', '#d9145d', '1635059687AjaxLoader.gif', '1635059702AjaxLoader.gif', 0, '<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/5bc2019c61d0b77092512d03/default\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>', 1, 1, 'AIzaSyB1GpE4qeoJ__70UZxvX9CTMUTZRZNHcu8', 0, '<div id=\"disqus_thread\">         \r\n    <script>\r\n    /**\r\n    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.\r\n    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/\r\n    /*\r\n    var disqus_config = function () {\r\n    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page\'s canonical URL variable\r\n    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page\'s unique identifier variable\r\n    };\r\n    */\r\n    (function() { // DON\'T EDIT BELOW THIS LINE\r\n    var d = document, s = d.createElement(\'script\');\r\n    s.src = \'https://junnun.disqus.com/embed.js\';\r\n    s.setAttribute(\'data-timestamp\', +new Date());\r\n    (d.head || d.body).appendChild(s);\r\n    })();\r\n    </script>\r\n    <noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\r\n    </div>', 1, 1, 1, 1, 1, 'pk_test_UnU1Coi1p5qFGwtpjZMRMgJM', 'sk_test_QQcg3vGsKRPlW6T3dXcNJsor', 0, 0, 0, 0, 5, 'chi-node40.websitehostserver.net', '465', 'info@vishruthijewelemporium.com', 'Md&~!(!uorkG', 'info@vishruthijewelemporium.com', 'Vishrithi', 1, 1, 1, 'Successfully Added To Cart', 'Out Of Stock', 'Add To Wishlist', 'Already Added To Wishlist', 'Successfully Removed From The Wishlist', 'Successfully Added To Compare', 'Already Added To Compare', 'Successfully Removed From The Compare', 'Successfully Changed The Color', 'Coupon Found', 'No Coupon Found', 'Coupon Already Applied', 'THANK YOU FOR YOUR PURCHASE.', 'We\'ll email you an order confirmation with details and tracking info.', 1, 8, '15587771131554048228onepiece.jpeg', 'Already Added To Cart', 0, 0, 1, 1, 1, 1, 'Pay with cash upon delivery.', 'Pay via your PayPal account.', 'Pay via your Credit Card.', '#ffffff', '#143250', '#02020c', 1, '#ff5500', '#02020c', 0, 0, 'test_172371aa837ae5cad6047dc3052', 'test_4ac5a785e25fc596b67dbc5c267', 'Pay via your Instamojo account.', 1, 1, 1, 'pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2', 'junnuns@gmail.com', 'Pay via your Paystack account.', 6, 0, '1566878455404.png', 1, 'Join Our Newsletter Now', 'Get updates by subscribing to our newsletter', '1584934329adv-banner.jpg', '1637057084invoice---logo.png', '1567655174profile.jpg', '#666666', 0, 1, 1, 'shaon143-facilitator-1@gmail.com', '16355117101635162622logo--footer.png', 'ssl', 'tkogux49985047638244', 'LhNGUUKE9xCQ9xY8', 'WEBSTAGING', 'Retail', 1, 'Pay via your Paytm account.', 'sandbox', 1, 'test_5HcWVs9qc5pzy36H9Tu9mwAyats33J', 'Pay with Molly Payment.', 1, 'rzp_test_w7wRtsnscXUzgy', 'voiTC6j686u3y8ggHDNnssJo', 'Pay via your Razorpay account.', 0, 0, '<div style=\"text-align: center;\"><font size=\"5\"><br></font></div><h1 style=\"text-align: center;\"><font size=\"6\">UNDER MAINTENANCE</font></h1>', 'GWS234ADWE06783');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `file`) VALUES
(1, 1, 'English', '1579926860LzpDa1Y7.json'),
(2, 0, 'RTL English', '1579927527QjLMUGyj.json');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) DEFAULT NULL,
  `recieved_user` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(191) NOT NULL,
  `order_id` int(191) UNSIGNED DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `vendor_id` int(191) DEFAULT NULL,
  `product_id` int(191) DEFAULT NULL,
  `conversation_id` int(191) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `order_id`, `user_id`, `vendor_id`, `product_id`, `conversation_id`, `is_read`, `created_at`, `updated_at`) VALUES
(33, 69, NULL, NULL, NULL, NULL, 1, '2021-10-10 04:54:18', '2021-11-16 15:57:26'),
(34, NULL, 29, NULL, NULL, NULL, 1, '2021-10-26 10:29:28', '2021-10-26 17:14:33'),
(35, 70, NULL, NULL, NULL, NULL, 1, '2021-10-26 12:28:04', '2021-11-16 15:57:26'),
(36, 71, NULL, NULL, NULL, NULL, 1, '2021-11-03 17:45:29', '2021-11-16 15:57:26'),
(37, 71, NULL, NULL, NULL, NULL, 1, '2021-11-03 17:48:13', '2021-11-16 15:57:26'),
(38, 72, NULL, NULL, NULL, NULL, 1, '2021-11-08 12:47:22', '2021-11-16 15:57:26'),
(39, 73, NULL, NULL, NULL, NULL, 1, '2021-11-08 12:47:29', '2021-11-16 15:57:26'),
(40, 72, NULL, NULL, NULL, NULL, 1, '2021-11-08 12:48:15', '2021-11-16 15:57:26'),
(41, 73, NULL, NULL, NULL, NULL, 1, '2021-11-08 12:48:23', '2021-11-16 15:57:26'),
(42, 74, NULL, NULL, NULL, NULL, 1, '2021-11-13 22:13:41', '2021-11-16 15:57:26'),
(43, 74, NULL, NULL, NULL, NULL, 1, '2021-11-13 22:14:03', '2021-11-16 15:57:26'),
(44, 75, NULL, NULL, NULL, NULL, 1, '2021-11-13 23:43:02', '2021-11-16 15:57:26'),
(45, 75, NULL, NULL, NULL, NULL, 1, '2021-11-13 23:43:23', '2021-11-16 15:57:26'),
(46, 76, NULL, NULL, NULL, NULL, 1, '2021-11-13 23:53:23', '2021-11-16 15:57:26'),
(47, 76, NULL, NULL, NULL, NULL, 1, '2021-11-13 23:53:48', '2021-11-16 15:57:26'),
(48, 77, NULL, NULL, NULL, NULL, 1, '2021-11-13 23:55:16', '2021-11-16 15:57:26'),
(50, 77, NULL, NULL, NULL, NULL, 1, '2021-11-13 23:55:37', '2021-11-16 15:57:26'),
(51, 78, NULL, NULL, NULL, NULL, 1, '2021-11-14 00:09:42', '2021-11-16 15:57:26'),
(53, 78, NULL, NULL, NULL, NULL, 1, '2021-11-14 00:10:07', '2021-11-16 15:57:26'),
(54, NULL, 30, NULL, NULL, NULL, 1, '2021-11-17 17:04:43', '2021-11-17 17:46:55'),
(55, 79, NULL, NULL, NULL, NULL, 1, '2021-11-17 17:08:42', '2021-11-17 17:46:59'),
(56, 80, NULL, NULL, NULL, NULL, 1, '2021-11-17 17:32:15', '2021-11-17 17:46:59'),
(57, 80, NULL, NULL, NULL, NULL, 1, '2021-11-17 17:32:57', '2021-11-17 17:46:59'),
(58, 81, NULL, NULL, NULL, NULL, 1, '2021-11-18 14:22:16', '2021-12-02 11:51:02'),
(59, 81, NULL, NULL, NULL, NULL, 1, '2021-11-18 14:22:51', '2021-12-02 11:51:02'),
(60, 82, NULL, NULL, NULL, NULL, 1, '2021-11-18 14:54:58', '2021-12-02 11:51:02'),
(61, 82, NULL, NULL, NULL, NULL, 1, '2021-11-18 14:55:19', '2021-12-02 11:51:02'),
(62, 83, NULL, NULL, NULL, NULL, 1, '2021-11-18 15:02:58', '2021-12-02 11:51:02'),
(63, 83, NULL, NULL, NULL, NULL, 1, '2021-11-18 15:03:25', '2021-12-02 11:51:02'),
(64, 84, NULL, NULL, NULL, NULL, 1, '2021-11-18 15:37:32', '2021-12-02 11:51:02'),
(65, 84, NULL, NULL, NULL, NULL, 1, '2021-11-18 15:37:49', '2021-12-02 11:51:02'),
(66, 85, NULL, NULL, NULL, NULL, 1, '2021-11-18 19:05:55', '2021-12-02 11:51:02'),
(67, 86, NULL, NULL, NULL, NULL, 1, '2021-11-18 19:10:10', '2021-12-02 11:51:02'),
(68, 86, NULL, NULL, NULL, NULL, 1, '2021-11-18 19:10:21', '2021-12-02 11:51:02'),
(69, 87, NULL, NULL, NULL, NULL, 1, '2021-11-18 19:12:37', '2021-12-02 11:51:02'),
(70, 87, NULL, NULL, NULL, NULL, 1, '2021-11-18 19:12:48', '2021-12-02 11:51:02'),
(71, 88, NULL, NULL, NULL, NULL, 1, '2021-11-18 19:24:21', '2021-12-02 11:51:02'),
(72, 88, NULL, NULL, NULL, NULL, 1, '2021-11-18 19:24:37', '2021-12-02 11:51:02'),
(73, NULL, 31, NULL, NULL, NULL, 1, '2021-11-19 11:01:03', '2021-12-02 11:51:04'),
(74, 89, NULL, NULL, NULL, NULL, 1, '2021-11-19 11:01:51', '2021-12-02 11:51:02'),
(75, 89, NULL, NULL, NULL, NULL, 1, '2021-11-19 11:02:07', '2021-12-02 11:51:02'),
(76, 90, NULL, NULL, NULL, NULL, 1, '2021-11-26 11:48:38', '2021-12-02 11:51:02'),
(77, 90, NULL, NULL, NULL, NULL, 1, '2021-11-26 11:48:55', '2021-12-02 11:51:02'),
(78, 91, NULL, NULL, NULL, NULL, 1, '2021-11-26 15:16:16', '2021-12-02 11:51:02'),
(79, 91, NULL, NULL, NULL, NULL, 1, '2021-11-26 15:16:28', '2021-12-02 11:51:02'),
(80, 92, NULL, NULL, NULL, NULL, 1, '2021-12-02 10:52:56', '2021-12-02 11:51:02'),
(81, NULL, NULL, NULL, 211, NULL, 1, '2021-12-02 10:52:56', '2021-12-02 11:51:08'),
(82, 92, NULL, NULL, NULL, NULL, 1, '2021-12-02 10:54:24', '2021-12-02 11:51:02'),
(83, 93, NULL, NULL, NULL, NULL, 1, '2021-12-02 10:56:15', '2021-12-02 11:51:02'),
(84, NULL, NULL, NULL, 211, NULL, 1, '2021-12-02 10:56:15', '2021-12-02 11:51:08'),
(85, 93, NULL, NULL, NULL, NULL, 1, '2021-12-02 10:56:36', '2021-12-02 11:51:02'),
(86, 94, NULL, NULL, NULL, NULL, 1, '2021-12-02 15:22:37', '2021-12-02 15:29:18'),
(87, 94, NULL, NULL, NULL, NULL, 1, '2021-12-02 15:22:51', '2021-12-02 15:29:18'),
(88, 95, NULL, NULL, NULL, NULL, 0, '2021-12-03 10:01:12', '2021-12-03 10:01:12'),
(89, 95, NULL, NULL, NULL, NULL, 0, '2021-12-03 10:01:29', '2021-12-03 10:01:29'),
(90, 96, NULL, NULL, NULL, NULL, 0, '2021-12-03 10:02:23', '2021-12-03 10:02:23'),
(91, 96, NULL, NULL, NULL, NULL, 0, '2021-12-03 10:02:41', '2021-12-03 10:02:41'),
(92, 97, NULL, NULL, NULL, NULL, 0, '2021-12-03 10:04:26', '2021-12-03 10:04:26'),
(93, 97, NULL, NULL, NULL, NULL, 0, '2021-12-03 10:04:43', '2021-12-03 10:04:43'),
(94, 98, NULL, NULL, NULL, NULL, 0, '2021-12-03 10:05:51', '2021-12-03 10:05:51'),
(95, 98, NULL, NULL, NULL, NULL, 0, '2021-12-03 10:06:08', '2021-12-03 10:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `dp` tinyint(1) NOT NULL DEFAULT 0,
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_shipping_id` int(191) NOT NULL DEFAULT 0,
  `vendor_packing_id` int(191) NOT NULL DEFAULT 0,
  `whole_discount` double NOT NULL DEFAULT 0,
  `tax_amount` varchar(50) DEFAULT NULL,
  `gst_num` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cart`, `method`, `shipping`, `pickup_location`, `totalQty`, `pay_amount`, `txnid`, `charge_id`, `order_number`, `payment_status`, `customer_email`, `customer_name`, `customer_country`, `customer_phone`, `customer_address`, `customer_city`, `customer_zip`, `shipping_name`, `shipping_country`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_city`, `shipping_zip`, `order_note`, `coupon_code`, `coupon_discount`, `status`, `created_at`, `updated_at`, `affilate_user`, `affilate_charge`, `currency_sign`, `currency_value`, `shipping_cost`, `packing_cost`, `tax`, `dp`, `pay_id`, `vendor_shipping_id`, `vendor_packing_id`, `whole_discount`, `tax_amount`, `gst_num`) VALUES
(70, 29, '{\"totalQty\":1,\"totalPrice\":5000,\"items\":{\"181\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":9,\"price\":5000,\"item\":{\"id\":181,\"user_id\":\"0\",\"slug\":\"red-stone-with-peacock-gold-plated-necklace-viskemp01\",\"name\":\"Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"wxHftcjH23.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":5000,\"stock\":\"10\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":5000}}}', 'Cash On Delivery', 'shipto', 'Azampur', '1', 5000, NULL, NULL, 'YraHauGUd2', 'Pending', 'sbharath.tgi@gmail.com', 'Bharath', 'India', '121212', 'asas', 'qwqwqw', '121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-10-26 12:28:04', '2021-10-26 12:28:04', NULL, NULL, 'Rs.', 1, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL),
(71, 29, '{\"totalQty\":3,\"totalPrice\":13998,\"items\":{\"181000000Rope2.4\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"000000\",\"stock\":8,\"price\":5000,\"item\":{\"id\":181,\"user_id\":\"0\",\"slug\":\"test-red-stone-with-peacock-gold-plated-necklace-viskemp01\",\"name\":\"Test Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"wxHftcjH23.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":[\"#000000\",\"#d96767\"],\"price\":5000,\"stock\":\"9\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Back Chain\",\"banglesize\":\"2.4,2.6,2.8,3.0\"},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":5000,\"chaintype\":\"Rope\",\"banglesize\":\"2.4\"},\"203\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":9,\"price\":999,\"item\":{\"id\":203,\"user_id\":\"0\",\"slug\":\"red-stone-with-peacock-gold-plated-necklace-bq84353sd9\",\"name\":\"Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"VYrJsinpwl.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":999,\"stock\":\"10\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":999,\"chaintype\":null,\"banglesize\":null},\"199\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":9,\"price\":7999,\"item\":{\"id\":199,\"user_id\":\"0\",\"slug\":\"red-stone-with-peacock-gold-plated-necklace-azn4083c6c\",\"name\":\"Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"JwRYExhBLv.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":7999,\"stock\":\"10\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":7999,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '3', 13998, 'pay_IH8VFaGRFg8AIx', NULL, 'wvdboARi4E', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'India', '0123456789', 'No.12 New Colony, Chrompet', 'Chennai', '600044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-03 17:45:29', '2021-11-03 17:48:13', NULL, NULL, 'Rs.', 1, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, NULL),
(72, 29, '{\"totalQty\":4,\"totalPrice\":15000,\"items\":{\"181000000Rope2.4\":{\"qty\":2,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"000000\",\"stock\":6,\"price\":10000,\"item\":{\"id\":181,\"user_id\":\"0\",\"slug\":\"test-red-stone-with-peacock-gold-plated-necklace-viskemp01\",\"name\":\"Test Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"wxHftcjH23.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":[\"#000000\",\"#d96767\"],\"price\":5000,\"stock\":\"8\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Back Chain\",\"banglesize\":\"2.4,2.6,2.8,3.0\"},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":5000,\"chaintype\":\"Rope\",\"banglesize\":\"2.4\"},\"181000000\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"000000\",\"stock\":7,\"price\":5000,\"item\":{\"id\":181,\"user_id\":\"0\",\"slug\":\"test-red-stone-with-peacock-gold-plated-necklace-viskemp01\",\"name\":\"Test Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"wxHftcjH23.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":[\"#000000\",\"#d96767\"],\"price\":5000,\"stock\":\"8\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":5000}}}', 'Razorpay', 'shipto', NULL, '4', 15750, 'pay_IJ12SLy3XrUMAj', NULL, '6XLvi7Q3eT', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'India', '0123456789', 'No.12 New Colony, Chrompet', 'Chennai', '601604', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-08 12:47:22', '2021-11-08 12:48:15', NULL, NULL, 'Rs.', 1, 0, 0, 5, 0, NULL, 0, 0, 0, NULL, NULL),
(73, 29, '{\"totalQty\":1,\"totalPrice\":5000,\"items\":{\"181000000Rope2.4\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"000000\",\"stock\":7,\"price\":5000,\"item\":{\"id\":181,\"user_id\":\"0\",\"slug\":\"test-red-stone-with-peacock-gold-plated-necklace-viskemp01\",\"name\":\"Test Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"wxHftcjH23.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":[\"#000000\",\"#d96767\"],\"price\":5000,\"stock\":\"8\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Back Chain\",\"banglesize\":\"2.4,2.6,2.8,3.0\"},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":5000,\"chaintype\":\"Rope\",\"banglesize\":\"2.4\"}}}', 'Razorpay', 'shipto', NULL, '1', 5250, 'pay_IJ12RfJC7Z6eCS', NULL, '17T0u96vhz', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'India', '0123456789', 'No.12 New Colony, Chrompet', 'qwqwqw', '121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-08 12:47:29', '2021-11-08 12:48:23', NULL, NULL, 'Rs.', 1, 0, 0, 5, 0, NULL, 0, 0, 0, NULL, NULL),
(74, 29, '{\"totalQty\":1,\"totalPrice\":999,\"items\":{\"203\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":8,\"price\":999,\"item\":{\"id\":203,\"user_id\":\"0\",\"slug\":\"red-stone-with-peacock-gold-plated-necklace-bq84353sd9\",\"name\":\"Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"VYrJsinpwl.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":999,\"stock\":\"9\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":999,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 1048.95, 'pay_IL9LtjSk2C9Xz0', NULL, 'YD5UgpMDFw', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'India', '0123456789', 'No.12 New Colony, Chrompet', 'asasas', '12121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-13 22:13:41', '2021-11-13 22:14:03', NULL, NULL, 'Rs.', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '49.95', NULL),
(75, 29, '{\"totalQty\":1,\"totalPrice\":999,\"items\":{\"203\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":7,\"price\":999,\"item\":{\"id\":203,\"user_id\":\"0\",\"slug\":\"red-stone-with-peacock-gold-plated-necklace-bq84353sd9\",\"name\":\"Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"VYrJsinpwl.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":999,\"stock\":\"8\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":999,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 1048.95, 'pay_ILAsEc11LrKD2S', NULL, 'VJHTg7ztgR', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Australia', '0123456789', 'No.12 New Colony, Chrompet', 'asasas', 'qwqwqwqw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-13 23:43:02', '2021-11-13 23:43:23', NULL, NULL, 'Rs.', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '49.95', NULL),
(76, 29, '{\"totalQty\":1,\"totalPrice\":999,\"items\":{\"203Rope2.6\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":6,\"price\":999,\"item\":{\"id\":203,\"user_id\":\"0\",\"slug\":\"red-stone-with-peacock-gold-plated-necklace-bq84353sd9\",\"name\":\"Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"VYrJsinpwl.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":999,\"stock\":\"7\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Ropetwo\",\"banglesize\":\"2.4,2.6,2.8\"},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":999,\"chaintype\":\"Rope\",\"banglesize\":\"2.6\"}}}', 'Razorpay', 'shipto', NULL, '1', 1048.95, 'pay_ILB3GszQ9WxXpj', NULL, 'L5OKmFAMY3', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Albania', '0123456789', 'No.12 New Colony, Chrompet', 'asasas', '12121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-13 23:53:23', '2021-11-13 23:53:48', NULL, NULL, 'Rs.', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '49.95', NULL),
(77, 29, '{\"totalQty\":1,\"totalPrice\":999,\"items\":{\"203Rope2.6\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":5,\"price\":999,\"item\":{\"id\":203,\"user_id\":\"0\",\"slug\":\"red-stone-with-peacock-gold-plated-necklace-bq84353sd9\",\"name\":\"Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"VYrJsinpwl.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":999,\"stock\":\"6\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Ropetwo\",\"banglesize\":\"2.4,2.6,2.8\"},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":999,\"chaintype\":\"Rope\",\"banglesize\":\"2.6\"}}}', 'Razorpay', 'shipto', NULL, '1', 933.57, 'pay_ILB5A8CFoEWJS6', NULL, 'R1PKMd64eW', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asasas', '121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sdsdsasd', '115.38', 'pending', '2021-11-13 23:55:16', '2021-11-13 23:55:37', NULL, NULL, 'Rs.', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '49.95', NULL),
(78, 29, '{\"totalQty\":1,\"totalPrice\":999,\"items\":{\"203Rope2.4\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":4,\"price\":999,\"item\":{\"id\":203,\"user_id\":\"0\",\"slug\":\"red-stone-with-peacock-gold-plated-necklace-bq84353sd9\",\"name\":\"Red Stone With Peacock Gold Plated Necklace\",\"photo\":\"VYrJsinpwl.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":999,\"stock\":\"5\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Ropetwo\",\"banglesize\":\"2.4,2.6,2.8\"},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":999,\"chaintype\":\"Rope\",\"banglesize\":\"2.4\"}}}', 'Razorpay', 'shipto', NULL, '1', 933.57, 'pay_ILBKVjX5cEEw1W', NULL, '70668BsiGP', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asas', '121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sdsdsasd', '115.38', 'completed', '2021-11-14 00:09:42', '2021-11-14 17:14:57', NULL, NULL, 'Rs.', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '49.95', NULL),
(79, 30, '{\"totalQty\":2,\"totalPrice\":64300.009999999994761310517787933349609375,\"items\":{\"211\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":9,\"price\":31800.00999999999839928932487964630126953125,\"item\":{\"id\":211,\"user_id\":\"0\",\"slug\":\"sindhubhairavi-haram-vje-nh-005\",\"name\":\"Sindhubhairavi haram\",\"photo\":\"ban2ChRXKK.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":31800.00999999999839928932487964630126953125,\"stock\":\"10\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":31800.00999999999839928932487964630126953125,\"chaintype\":null,\"banglesize\":null},\"210\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":32500,\"item\":{\"id\":210,\"user_id\":\"0\",\"slug\":\"sangarabharanam-haram-vje-nh-004\",\"name\":\"Sangarabharanam haram\",\"photo\":\"6t81QPzXSD.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":32500,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":32500,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '2', 67515, NULL, NULL, 'BfK4IUgxFa', 'Completed', 'vikram@mindmade.in', 'Mindmadetechnologies', 'India', '09629596919', '19-1/22, First Floor, Govindaswamy Layout, Singanallur', 'Coimbatore', '641 005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2021-11-17 17:08:42', '2021-11-18 18:55:19', NULL, NULL, 'Rs.', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '3215.00', NULL),
(80, 30, '{\"totalQty\":1,\"totalPrice\":28799.99999999999636202119290828704833984375,\"items\":{\"209\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28800,\"item\":{\"id\":209,\"user_id\":\"0\",\"slug\":\"hamsadhvani-haram-vje-nh-003\",\"name\":\"Hamsadhvani haram\",\"photo\":\"YXo0CiblBu.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28800,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28800,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 30240, 'pay_IMehQOryZ8JrM8', NULL, 'xhFXZIojBG', 'Completed', 'vikram@mindmade.in', 'vikram', 'India', '09629596919', '19-1/22, First Floor, Govindaswamy Layout, Singanallur', 'Coimbatore', '641 005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'on delivery', '2021-11-17 17:32:15', '2021-11-17 18:58:02', NULL, NULL, 'Rs.', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1440.00', NULL),
(81, 29, '{\"totalQty\":2,\"totalPrice\":61300,\"items\":{\"212Rope\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28800,\"item\":{\"id\":212,\"user_id\":\"0\",\"slug\":\"lathaangi-haram-vje-nh-006\",\"name\":\"Lathaangi Haram\",\"photo\":\"09Ugrc9Cd2.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28800,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Ropetwo\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28800,\"chaintype\":\"Rope\",\"banglesize\":null},\"210\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":32500,\"item\":{\"id\":210,\"user_id\":\"0\",\"slug\":\"sangarabharanam-haram-vje-nh-004\",\"name\":\"Sangarabharanam haram\",\"photo\":\"E0Xq7cPLDQ.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":32500,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":32500,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '2', 64365, 'pay_IMzzkQOb5HRb9o', NULL, 'ELPaOiJEYo', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asasasas', '121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-18 14:22:16', '2021-11-18 14:22:51', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '3065.00', NULL),
(82, 29, '{\"totalQty\":1,\"totalPrice\":32500,\"items\":{\"210\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":32500,\"item\":{\"id\":210,\"user_id\":\"0\",\"slug\":\"sangarabharanam-haram-vje-nh-004\",\"name\":\"Sangarabharanam haram\",\"photo\":\"E0Xq7cPLDQ.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":32500,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":32500,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 34125, 'pay_IN0Y1jLqYmg4Iq', NULL, 'wWXVwzPWHg', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asasa', '121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-18 14:54:58', '2021-11-18 14:55:19', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1625.00', NULL),
(83, 29, '{\"totalQty\":1,\"totalPrice\":28800,\"items\":{\"212Rope\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28800,\"item\":{\"id\":212,\"user_id\":\"0\",\"slug\":\"lathaangi-haram-vje-nh-006\",\"name\":\"Lathaangi Haram\",\"photo\":\"09Ugrc9Cd2.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28800,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Chain\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28800,\"chaintype\":\"Rope\",\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 30240, 'pay_IN0gbgqgvdzuAQ', NULL, 'IJ1sRlmAQI', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asas', 'qwqw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-18 15:02:58', '2021-11-18 15:03:25', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1440.00', NULL),
(84, 29, '{\"totalQty\":1,\"totalPrice\":28800,\"items\":{\"212Rope\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28800,\"item\":{\"id\":212,\"user_id\":\"0\",\"slug\":\"lathaangi-haram-vje-nh-006\",\"name\":\"Lathaangi Haram\",\"photo\":\"09Ugrc9Cd2.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28800,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Chain\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28800,\"chaintype\":\"Rope\",\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 30240, 'pay_IN1GwoVCOslllf', NULL, '97XjNUCY14', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asasasa', '12121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-18 15:37:32', '2021-11-18 15:37:49', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1440.00', NULL),
(85, 29, '{\"totalQty\":1,\"totalPrice\":31800,\"items\":{\"211\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":8,\"price\":31800,\"item\":{\"id\":211,\"user_id\":\"0\",\"slug\":\"sindhubhairavi-haram-vje-nh-005\",\"name\":\"Sindhubhairavi haram\",\"photo\":\"dpL0G0Jos8.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":31800,\"stock\":\"9\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":31800,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 33390, NULL, NULL, 'yWlMcMpsqZ', 'Pending', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asasas', '121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-18 19:05:55', '2021-11-18 19:05:55', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1590.00', NULL),
(86, 29, '{\"totalQty\":1,\"totalPrice\":31800,\"items\":{\"211\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":8,\"price\":31800,\"item\":{\"id\":211,\"user_id\":\"0\",\"slug\":\"sindhubhairavi-haram-vje-nh-005\",\"name\":\"Sindhubhairavi haram\",\"photo\":\"dpL0G0Jos8.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":31800,\"stock\":\"9\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":31800,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 33390, 'pay_IN4tS7QeCcSF0m', NULL, '3bIL8kvTqn', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asasasa', '1212121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-18 19:10:10', '2021-11-18 19:10:21', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1590.00', NULL),
(87, 29, '{\"totalQty\":1,\"totalPrice\":31800,\"items\":{\"211\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":8,\"price\":31800,\"item\":{\"id\":211,\"user_id\":\"0\",\"slug\":\"sindhubhairavi-haram-vje-nh-005\",\"name\":\"Sindhubhairavi haram\",\"photo\":\"dpL0G0Jos8.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":31800,\"stock\":\"9\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":31800,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 33390, 'pay_IN4w2wDNnsxZak', NULL, 'RlRdnu32FE', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asasas', '121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-18 19:12:37', '2021-11-18 19:12:48', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1590.00', NULL),
(88, 29, '{\"totalQty\":1,\"totalPrice\":31800,\"items\":{\"211Back Chain\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":7,\"price\":31800,\"item\":{\"id\":211,\"user_id\":\"0\",\"slug\":\"sindhubhairavi-haram-vje-nh-005\",\"name\":\"Sindhubhairavi haram\",\"photo\":\"dpL0G0Jos8.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":31800,\"stock\":\"8\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Back Chain,Rope Thread\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":31800,\"chaintype\":\"Back Chain\",\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 33390, 'pay_IN58W1bNbZH1Dg', NULL, 'MvzmslPsfU', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asas', '1212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-18 19:24:21', '2021-11-18 19:24:37', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1590.00', NULL),
(89, 31, '{\"totalQty\":4,\"totalPrice\":28800,\"items\":{\"212Rope\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28800,\"item\":{\"id\":212,\"user_id\":\"0\",\"slug\":\"lathaangi-haram-vje-nh-006\",\"name\":\"Lathaangi Haram\",\"photo\":\"09Ugrc9Cd2.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28800,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Chain\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28800,\"chaintype\":\"Rope\",\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '4', 30240, 'pay_INL6qvIoouqwAP', NULL, 'PP3CmUUrf8', 'Completed', 'sathyaventhan@gmail.com', 'sadasd', 'India', '9176597901', 'sdasdsad', 'dsfcsd', '10001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-19 11:01:51', '2021-11-19 11:02:07', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1440.00', NULL),
(90, 29, '{\"totalQty\":2,\"totalPrice\":60600,\"items\":{\"212Chain\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28800,\"item\":{\"id\":212,\"user_id\":\"0\",\"slug\":\"lathaangi-haram-vje-nh-006\",\"name\":\"Lathaangi Haram\",\"photo\":\"09Ugrc9Cd2.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28800,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Chain\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28800,\"chaintype\":\"Chain\",\"banglesize\":null},\"211Rope Thread\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":6,\"price\":31800,\"item\":{\"id\":211,\"user_id\":\"0\",\"slug\":\"sindhubhairavi-haram-vje-nh-005\",\"name\":\"Sindhubhairavi haram\",\"photo\":\"dpL0G0Jos8.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":31800,\"stock\":\"7\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Back Chain,Rope Thread\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":31800,\"chaintype\":\"Rope Thread\",\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '2', 63630, 'pay_IQ7e7Y77DTNt86', NULL, 'ZTc28AVvql', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'asasas', '121212', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-11-26 11:48:38', '2021-11-26 11:48:55', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '3030.00', NULL),
(91, 29, '{\"totalQty\":1,\"totalPrice\":28800,\"items\":{\"212Rope\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28800,\"item\":{\"id\":212,\"user_id\":\"0\",\"slug\":\"lathaangi-haram-vje-nh-006\",\"name\":\"Lathaangi Haram\",\"photo\":\"09Ugrc9Cd2.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28800,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Chain\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28800,\"chaintype\":\"Rope\",\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 30240, 'pay_IQBBL9zMtJi2Un', NULL, 'j4ap7uqwCK', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'Algeria', '0123456789', 'No.12 New Colony, Chrompet', 'qwqwqwqw', '1212121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2021-11-26 15:16:16', '2021-11-27 16:05:44', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1440.00', 'GWS234ADWE06783'),
(92, 30, '{\"totalQty\":1,\"totalPrice\":31800,\"items\":{\"211Back Chain\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":5,\"price\":31800,\"item\":{\"id\":211,\"user_id\":\"0\",\"slug\":\"sindhubhairavi-haram-vje-nh-005\",\"name\":\"Sindhubhairavi haram\",\"photo\":\"dpL0G0Jos8.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":31800,\"stock\":\"6\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Back Chain,Rope Thread\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":31800,\"chaintype\":\"Back Chain\",\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 33390, 'pay_ISTvAUWPcET97U', NULL, 'XvzuoqXGXF', 'Completed', 'mindmadetechnologies@gmail.com', 'vikram', 'India', '09629596919', '19-1/22, First Floor, Govindaswamy Layout, Singanallur', 'Coimbatore', '641 005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'on delivery', '2021-12-02 10:52:56', '2021-12-02 17:55:11', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '1590.00', 'GWS234ADWE06783'),
(93, 30, '{\"totalQty\":3,\"totalPrice\":63600,\"items\":{\"211Back Chain\":{\"qty\":2,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":3,\"price\":63600,\"item\":{\"id\":211,\"user_id\":\"0\",\"slug\":\"sindhubhairavi-haram-vje-nh-005\",\"name\":\"Sindhubhairavi haram\",\"photo\":\"dpL0G0Jos8.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":31800,\"stock\":\"5\",\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Back Chain,Rope Thread\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":31800,\"chaintype\":\"Back Chain\",\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '3', 66780, 'pay_ISTxZFh1zeNxq0', NULL, 'hmCV5xmbXZ', 'Completed', 'vikram@mindmade.in', 'VIkram', 'India', '09629596919', '19-1/22, First Floor, Govindaswamy Layout, Singanallur', 'Coimbatore', '641 005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2021-12-02 10:56:15', '2021-12-02 11:52:03', NULL, NULL, '₹', 1, 0, 0, 5, 0, NULL, 0, 0, 0, '3180.00', 'GWS234ADWE06783'),
(94, 29, '{\"totalQty\":1,\"totalPrice\":28800,\"items\":{\"212Rope\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28800,\"item\":{\"id\":212,\"user_id\":\"0\",\"slug\":\"lathaangi-haram-vje-nh-006\",\"name\":\"Lathaangi Haram\",\"photo\":\"09Ugrc9Cd2.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28800,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":\"Rope,Chain\",\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28800,\"chaintype\":\"Rope\",\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 28800, 'pay_ISYUp9KdJIUc6C', NULL, '7HuS0tk28S', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'India', '0123456789', 'No.12 New Colony, Chrompet', 'Chennai', '600044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-12-02 15:22:37', '2021-12-02 15:22:51', NULL, NULL, '₹', 1, 0, 0, 0, 0, NULL, 0, 0, 0, '0.00', 'GWS234ADWE06783'),
(95, 29, '{\"totalQty\":1,\"totalPrice\":28500,\"items\":{\"207\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28500,\"item\":{\"id\":207,\"user_id\":\"0\",\"slug\":\"amirthavarshini-haram-vje-nh-001\",\"name\":\"Amirthavarshini Haram\",\"photo\":\"S5FXRYFRRT.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28500,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28500,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 28500, 'pay_ISrYRAJx5Gvaw2', NULL, '0HVFmz4a4u', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'India', '0123456789', 'No.12 New Colony, Chrompet', 'Chennai', '600044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-12-03 10:01:12', '2021-12-03 10:01:29', NULL, NULL, '₹', 1, 0, 0, 0, 0, NULL, 0, 0, 0, '0.00', 'GWS234ADWE06783'),
(96, 29, '{\"totalQty\":1,\"totalPrice\":28500,\"items\":{\"207\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28500,\"item\":{\"id\":207,\"user_id\":\"0\",\"slug\":\"amirthavarshini-haram-vje-nh-001\",\"name\":\"Amirthavarshini Haram\",\"photo\":\"S5FXRYFRRT.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28500,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28500,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 28500, 'pay_ISrZh2y8l7uUVi', NULL, '5MtKP3InDL', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'India', '0123456789', 'No.12 New Colony, Chrompet', 'Chennai', '600044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-12-03 10:02:23', '2021-12-03 10:02:41', NULL, NULL, '₹', 1, 0, 0, 0, 0, NULL, 0, 0, 0, '0.00', 'GWS234ADWE06783'),
(97, 29, '{\"totalQty\":1,\"totalPrice\":28500,\"items\":{\"207\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":28500,\"item\":{\"id\":207,\"user_id\":\"0\",\"slug\":\"amirthavarshini-haram-vje-nh-001\",\"name\":\"Amirthavarshini Haram\",\"photo\":\"S5FXRYFRRT.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":28500,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":28500,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 28500, 'pay_ISrbp6Vu3sjKJD', NULL, 'xcmybbGJwe', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'India', '0123456789', 'No.12 New Colony, Chrompet', 'Chennai', '600044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-12-03 10:04:26', '2021-12-03 10:04:43', NULL, NULL, '₹', 1, 0, 0, 0, 0, NULL, 0, 0, 0, '0.00', 'GWS234ADWE06783'),
(98, 29, '{\"totalQty\":1,\"totalPrice\":18500,\"items\":{\"232\":{\"qty\":1,\"size_key\":0,\"size_qty\":\"\",\"size_price\":\"\",\"size\":\"\",\"color\":\"\",\"stock\":null,\"price\":18500,\"item\":{\"id\":232,\"user_id\":\"0\",\"slug\":\"kundan-green-necklace-vje-nn-010\",\"name\":\"Kundan green necklace\",\"photo\":\"svNzwBfcji.png\",\"size\":\"\",\"size_qty\":\"\",\"size_price\":\"\",\"color\":\"\",\"price\":18500,\"stock\":null,\"type\":\"Physical\",\"file\":null,\"link\":null,\"license\":\"\",\"license_qty\":\"\",\"measure\":null,\"whole_sell_qty\":\"\",\"whole_sell_discount\":\"\",\"attributes\":null,\"chaintype\":null,\"banglesize\":null},\"license\":\"\",\"dp\":\"0\",\"keys\":\"\",\"values\":\"\",\"item_price\":18500,\"chaintype\":null,\"banglesize\":null}}}', 'Razorpay', 'shipto', NULL, '1', 18500, 'pay_ISrdKIKtQcxtUE', NULL, 'Qk242JdLNT', 'Completed', 'sbharath.tgi@gmail.com', 'Bharath', 'India', '0123456789', 'No.12 New Colony, Chrompet', 'Chennai', '600044', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-12-03 10:05:51', '2021-12-03 10:06:08', NULL, NULL, '₹', 1, 0, 0, 0, 0, NULL, 0, 0, 0, '0.00', 'GWS234ADWE06783');

-- --------------------------------------------------------

--
-- Table structure for table `order_tracks`
--

CREATE TABLE `order_tracks` (
  `id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_tracks`
--

INSERT INTO `order_tracks` (`id`, `order_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(23, 70, 'Pending', 'You have successfully placed your order.', '2021-10-26 12:28:04', '2021-10-26 12:28:04'),
(24, 71, 'Pending', 'You have successfully placed your order.', '2021-11-03 17:45:29', '2021-11-03 17:45:29'),
(25, 72, 'Pending', 'You have successfully placed your order.', '2021-11-08 12:47:22', '2021-11-08 12:47:22'),
(26, 73, 'Pending', 'You have successfully placed your order.', '2021-11-08 12:47:29', '2021-11-08 12:47:29'),
(27, 74, 'Pending', 'You have successfully placed your order.', '2021-11-13 22:13:41', '2021-11-13 22:13:41'),
(28, 75, 'Pending', 'You have successfully placed your order.', '2021-11-13 23:43:02', '2021-11-13 23:43:02'),
(29, 76, 'Pending', 'You have successfully placed your order.', '2021-11-13 23:53:23', '2021-11-13 23:53:23'),
(30, 77, 'Pending', 'You have successfully placed your order.', '2021-11-13 23:55:16', '2021-11-13 23:55:16'),
(31, 78, 'Pending', 'You have successfully placed your order.', '2021-11-14 00:09:42', '2021-11-14 00:09:42'),
(32, 79, 'Delivered', 'You have successfully placed your order.', '2021-11-17 17:08:42', '2021-11-26 11:03:23'),
(33, 80, 'Pending', 'You have successfully placed your order.', '2021-11-17 17:32:15', '2021-11-17 17:32:15'),
(34, 78, 'Processing', 'Items are one the way. You will be getting soon', '2021-11-17 20:24:18', '2021-11-17 20:24:18'),
(35, 81, 'Pending', 'You have successfully placed your order.', '2021-11-18 14:22:16', '2021-11-18 14:22:16'),
(36, 82, 'Pending', 'You have successfully placed your order.', '2021-11-18 14:54:58', '2021-11-18 14:54:58'),
(37, 83, 'Pending', 'You have successfully placed your order.', '2021-11-18 15:02:58', '2021-11-18 15:02:58'),
(38, 84, 'Pending', 'You have successfully placed your order.', '2021-11-18 15:37:32', '2021-11-18 15:37:32'),
(39, 85, 'Pending', 'You have successfully placed your order.', '2021-11-18 19:05:55', '2021-11-18 19:05:55'),
(40, 86, 'Pending', 'You have successfully placed your order.', '2021-11-18 19:10:10', '2021-11-18 19:10:10'),
(41, 87, 'Pending', 'You have successfully placed your order.', '2021-11-18 19:12:37', '2021-11-18 19:12:37'),
(42, 88, 'Pending', 'You have successfully placed your order.', '2021-11-18 19:24:21', '2021-11-18 19:24:21'),
(43, 89, 'Pending', 'You have successfully placed your order.', '2021-11-19 11:01:51', '2021-11-19 11:01:51'),
(44, 89, 'Completed', 'Shippment Delvered', '2021-11-26 11:01:40', '2021-11-26 11:01:40'),
(45, 88, 'Completed', 'Your order recieved', '2021-11-26 11:01:43', '2021-11-26 11:01:43'),
(46, 90, 'Pending', 'You have successfully placed your order.', '2021-11-26 11:48:38', '2021-11-26 11:48:38'),
(47, 91, 'Pending', 'You have successfully placed your order.', '2021-11-26 15:16:16', '2021-11-26 15:16:16'),
(48, 92, 'Pending', 'You have successfully placed your order.', '2021-12-02 10:52:56', '2021-12-02 10:52:56'),
(50, 93, 'Completed', 'Order Completed', '2021-12-02 11:05:33', '2021-12-02 11:05:33'),
(51, 94, 'Pending', 'You have successfully placed your order.', '2021-12-02 15:22:37', '2021-12-02 15:22:37'),
(52, 78, 'Completed', 'Your Order has been Delivered', '2021-12-02 16:32:05', '2021-12-02 16:32:05'),
(53, 92, 'Completed', 'Order ready for dispatch', '2021-12-02 17:54:21', '2021-12-02 17:54:21'),
(54, 95, 'Pending', 'You have successfully placed your order.', '2021-12-03 10:01:12', '2021-12-03 10:01:12'),
(55, 96, 'Pending', 'You have successfully placed your order.', '2021-12-03 10:02:23', '2021-12-03 10:02:23'),
(56, 97, 'Pending', 'You have successfully placed your order.', '2021-12-03 10:04:26', '2021-12-03 10:04:26'),
(57, 98, 'Pending', 'You have successfully placed your order.', '2021-12-03 10:05:51', '2021-12-03 10:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Default Packaging', 'Default packaging by store', 0),
(2, 0, 'Gift Packaging', 'Exclusive Gift packaging', 15);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(191) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` tinyint(1) NOT NULL DEFAULT 0,
  `footer` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`) VALUES
(1, 'About Us', 'about', '<div class=\"about_section\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-6 col-md-12\">\r\n                <div class=\"about_content\">\r\n                    <h1>Welcome Vishruthi Jewel Emporium</h1>\r\n                    <p>\r\n                        We are a 2nd generation entrepreneur into this business and based out of Coimbatore in the southern part of India. All Our Artificial Jewelleries are Manufactured by our own group company and hence the customers get\r\n                        exactly what we post in the gallery. We never compromise on the quality of our products. We are having our own quality checks to ensure that everything is properly manufactured as per our own standards. We are a\r\n                        digital platform for selecting your desired design and ordering it online as many of our customers are in various towns. We have exclusively designed and developed imitation jewellery /artificial jewellery and\r\n                        fashion jewellery to choose from. We have our own in house designing team to create designs and get them manufactured and offer you a product which suits each and everybody’s need.\r\n                    </p>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-lg-6 col-md-12\">\r\n                <div class=\"about_thumb\">\r\n                    <img src=\"http://vishruthijewelemporium.com/assets/front/vishruthi/img/about/about1.jpg\" alt=\"\">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<div class=\"counterup_section\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-3 col-md-6 col-sm-6\">\r\n                <div class=\"single_counterup\">\r\n                    <div class=\"counter_img\">\r\n                        <img src=\"assets/img/about/count.png\" alt=\"\">\r\n                    </div>\r\n                    <div class=\"counter_info\">\r\n                        <h2 class=\"counter_number\">2170</h2>\r\n                        <p>happy customers</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-lg-3 col-md-6 col-sm-6\">\r\n                <div class=\"single_counterup count-two\">\r\n                    <div class=\"counter_img\">\r\n                        <img src=\"assets/img/about/count2.png\" alt=\"\">\r\n                    </div>\r\n                    <div class=\"counter_info\">\r\n                        <h2 class=\"counter_number\">8080</h2>\r\n                        <p>AWARDS won</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-lg-3 col-md-6 col-sm-6\">\r\n                <div class=\"single_counterup\">\r\n                    <div class=\"counter_img\">\r\n                        <img src=\"assets/img/about/count3.png\" alt=\"\">\r\n                    </div>\r\n                    <div class=\"counter_info\">\r\n                        <h2 class=\"counter_number\">2150</h2>\r\n                        <p>HOURS WORKED</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <div class=\"col-lg-3 col-md-6 col-sm-6\">\r\n                <div class=\"single_counterup count-two\">\r\n                    <div class=\"counter_img\">\r\n                        <img src=\"assets/img/about/count4.png\" alt=\"\">\r\n                    </div>\r\n                    <div class=\"counter_info\">\r\n                        <h2 class=\"counter_number\">2170</h2>\r\n                        <p>COMPLETE PROJECTS</p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>', NULL, NULL, 1, 1),
(2, 'Privacy & Policy', 'privacy', '<div class=\"about_section\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-12 col-md-12\">\r\n                <div class=\"about_content\">\r\n                    <h1 style=\"text-align: justify;\">Privacy Policy for Vishruthi Jewel Emporium</h1>\r\n                    <p style=\"text-align: justify;\">\r\n                        At Vishruthi Jewel Emporium Website, accessible from <a href=\"www.vishruthijewelemporium.com\" title=\"Vishruthi Jewel Emporium\" target=\"_blank\"><b>www.vishruthijewelemporium.com</b></a>, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is\r\n                        collected and recorded by&nbsp;<a href=\"http://vishruthijewelemporium.com/admin/page/edit/www.vishruthijewelemporium.com\" title=\"Vishruthi Jewel Emporium\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\"><span style=\"font-weight: bolder;\">www.vishruthijewelemporium.com</span></a>&nbsp;and how we use it. If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.\r\n                    </p>\r\n\r\n                    <p style=\"text-align: justify;\">\r\n                        This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in&nbsp;<a href=\"http://vishruthijewelemporium.com/admin/page/edit/www.vishruthijewelemporium.com\" title=\"Vishruthi Jewel Emporium\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\"><span style=\"font-weight: bolder;\">www.vishruthijewelemporium.com</span></a>. This policy is not\r\n                        applicable to any information collected offline or via channels other than this website.\r\n                    </p>\r\n\r\n                    <h4 style=\"text-align: justify;\">Consent</h4>\r\n                    <p style=\"text-align: justify;\">By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p>\r\n\r\n                    <h4 style=\"text-align: justify;\">Information we collect</h4>\r\n                    <p style=\"text-align: justify;\">\r\n                        The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information. If you contact us\r\n                        directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to\r\n                        provide. When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.\r\n                    </p>\r\n\r\n                    <h4 style=\"text-align: justify;\">How we use your information</h4>\r\n                    <p style=\"text-align: justify;\">We use the information we collect in various ways, including to:</p>\r\n                    <p style=\"text-align: justify;\">• Provide, operate, and maintain our website</p>\r\n                    <p style=\"text-align: justify;\">• Improve, personalize, and expand our website</p>\r\n                    <p style=\"text-align: justify;\">• Understand and analyze how you use our website</p>\r\n                    <p style=\"text-align: justify;\">\r\n                        • Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional\r\n                        purposes\r\n                    </p>\r\n                    <p style=\"text-align: justify;\">• Send you emails</p>\r\n                    <p style=\"text-align: justify;\">• Find and prevent fraud</p>\r\n\r\n                    <h4 style=\"text-align: justify;\">Log Files</h4>\r\n                    <p style=\"text-align: justify;\">\r\n                        Vishruthi Jewel Emporium&nbsp;<a href=\"http://vishruthijewelemporium.com/admin/page/edit/www.vishruthijewelemporium.com\" title=\"Vishruthi Jewel Emporium\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\"><span style=\"font-weight: bolder;\">www.vishruthijewelemporium.com</span></a>&nbsp;a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services’\r\n                        analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks.\r\n                        These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users’ movement on the website, and gathering\r\n                        demographic information.\r\n                    </p>\r\n\r\n                    <h4 style=\"text-align: justify;\">Cookies and Web Beacons</h4>\r\n                    <p style=\"text-align: justify;\">\r\n                        Like any other website, Vishruthi Jewel Emporium Website uses ‘cookies’. These cookies are used to store information including visitors’ preferences, and the pages on the website that the visitor accessed or visited.\r\n                        The information is used to optimize the users’ experience by customizing our web page content based on visitors’ browser type and/or other information.\r\n                    </p>\r\n\r\n                    <h4 style=\"text-align: justify;\">Third Party Privacy Policies</h4>\r\n                    <p style=\"text-align: justify;\">\r\n                        Vishruthi Jewel Emporium Website’s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more\r\n                        detailed information. It may include their practices and instructions about how to opt-out of certain options. You can choose to disable cookies through your individual browser options. To know more detailed\r\n                        information about cookie management with specific web browsers, it can be found at the browsers’ respective websites.\r\n                    </p>\r\n\r\n                    <h4 style=\"text-align: justify;\">Children’s Information</h4>\r\n                    <p style=\"text-align: justify;\">\r\n                        Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity. Vishruthi Jewel\r\n                        Emporium does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to\r\n                        contact us immediately and we will do our best efforts to promptly remove such information from our records.\r\n                    </p>\r\n\r\n                    <h4 style=\"text-align: justify;\">Contact Us</h4>\r\n                    <p style=\"text-align: justify;\">If you have any questions about our Cancellation and Returns Policy, please contact us:</p>\r\n                    <p style=\"text-align: justify;\">By email: <b>vishruthijewelemporium@gmail.com</b></p>\r\n                    <p style=\"text-align: justify;\">By visiting this page on our website:&nbsp;<a href=\"http://vishruthijewelemporium.com/admin/page/edit/www.vishruthijewelemporium.com\" title=\"Vishruthi Jewel Emporium\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\"><span style=\"font-weight: bolder;\">www.vishruthijewelemporium.com</span></a></p>\r\n                    <p style=\"text-align: justify;\">By phone number: <b>+91 97871 55003</b></p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>', 'test,test1,test2,test3', 'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 1, 1),
(3, 'Terms & Condition', 'terms', '<div class=\"about_section\">\r\n        <div class=\"container\">  \r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12 col-md-12\">\r\n                    <div class=\"about_content\">\r\n                        <h1 style=\"text-align: justify; \">Terms &amp; Conditions</h1>\r\n                        <p style=\"text-align: justify; \"> We reserve the right to update, change or replace any part of these Terms of Service by posting updates and/or changes to our website. It is your responsibility to check this page periodically for changes. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes.\r\n                        By visiting our site and/ or purchasing something from us, you engage in our “Service” and agree to be bound by the following terms and conditions (“Terms of Service”, “Terms”), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.</p>\r\n\r\n                        <p style=\"text-align: justify; \">Please read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.</p>\r\n\r\n\r\n                        <h4 style=\"text-align: justify; \">IMPORTANT TERMS &amp; CONDITIONS:</h4>\r\n                        <p style=\"text-align: justify; \">1) We reserve the right to refuse service to anyone for any reason at any time. </p>\r\n                        <p style=\"text-align: justify; \">2) We reserve the right to modify the contents of this site at any time,\r\nbut we have no obligation to update any information on our site. You\r\nagree that it is your responsibility to monitor changes to our site.</p>\r\n\r\n<p style=\"text-align: justify; \">3) Prices for our products are subject to change without notice.\r\nWe reserve the right at any time to modify or discontinue the Service\r\n(or any part or content thereof) without notice at any time.\r\nWe shall not be liable to you or to any third party for any modification,\r\nprice change, suspension, or discontinuance of the Service.</p>\r\n\r\n<p style=\"text-align: justify; \">4) You agree not to reproduce, duplicate, copy, sell, resell or exploit any\r\nportion of the Service, use of the Service, or access to the Service or\r\nany contact on the website through which the service is provided,\r\nwithout express written permission by us.</p>\r\n\r\n<p style=\"text-align: justify; \">5) Certain products or services may be available exclusively online\r\nthrough the website. These products or services may have limited\r\nquantities and are subject to return or exchange only according to our\r\nReturn Policy.</p>\r\n\r\n<p style=\"text-align: justify; \">6) We reserve the right but are not obligated, to limit the sales of our\r\nproducts or Services to any person, geographic region, or jurisdiction.\r\nWe may exercise this right on a case-by-case basis. We reserve the\r\nright to limit the quantities of any products or services that we offer.</p>\r\n\r\n<p style=\"text-align: justify; \">7) We do not warrant that the quality of any products, services,\r\ninformation, or other material purchased or obtained by you will meet\r\nyour expectations, or that any errors in the Service will be corrected.</p>\r\n\r\n<p style=\"text-align: justify; \">8) We reserve the right to refuse any order you place with us. We may, in\r\nour sole discretion, limit or cancel quantities purchased per person, per\r\nhousehold, or per order.</p>\r\n<p style=\"text-align: justify; \">9) In the event that we make a change to or cancel an order, we may\r\nattempt to notify you by contacting the e-mail and/or billing \r\naddress/phone number provided at the time the order was made. We\r\nreserve the right to limit or prohibit orders in our own judgment.</p>\r\n\r\n<p style=\"text-align: justify; \">10) If in our sole judgment you fail, or we suspect that you have failed, to\r\ncomply with any term or provision of these Terms of Service, we also\r\nmay terminate this agreement at any time without notice and you will\r\nremain liable for all amounts due up to and including the date of\r\ntermination, and/or accordingly, may deny you access to our Services\r\n(or any part thereof).</p>\r\n\r\n<h4 style=\"text-align: justify; \">DISCLAIMER OF WARRANTIES; LIMITATION OF LIABILITY</h4>\r\n\r\n<p style=\"text-align: justify; \">We do not guarantee, represent or warrant that your use of our service will be uninterrupted, timely, secure or error-free. We do not warrant that the results that may be obtained from the use of the service will be accurate or reliable.\r\n\r\n</p><p style=\"text-align: justify; \">You agree that from time to time we may remove the service for indefinite periods of time or cancel the service at any time, without notice to you.</p>\r\n\r\n<p style=\"text-align: justify; \">You expressly agree that your use of, or inability to use, the service is at your sole risk. The service and all products and services delivered to you through the service are (except as expressly stated by us) provided \'as is\' and \'as available\' for your use, without any representation, warranties, or conditions of any kind, either express or implied, including all implied warranties or conditions of merchantability, merchantable quality, fitness for a particular purpose, durability, title, and non-infringement.</p>\r\n\r\n\r\n<p style=\"text-align: justify; \">In no case our founders, directors, officers, employees, affiliates, agents, contractors, interns, suppliers, service providers or licensors be liable for any injury, loss, claim, or any direct, indirect, incidental, punitive, special, or consequential damages of any kind, including, without limitation lost profits, lost revenue, lost savings, loss of data, replacement costs, or any similar damages, whether based in contract, tort (including negligence), strict liability or otherwise, arising from your use of any of the service or any products procured using the service, or for any other claim related in any way to your use of the service or any product, including, but not limited to, any errors or omissions in any content, or any loss or damage of any kind incurred as a result of the use of the service or any content (or product) posted, transmitted, or otherwise made available via the service, even if advised of their possibility. Because some states or jurisdictions do not allow the exclusion or the limitation of liability for consequential or incidental damages, in such states or jurisdictions, our liability shall be limited to the maximum extent permitted by law. </p><h4 style=\"line-height: 1.2381; text-align: justify;\">Contact Us</h4><p style=\"text-align: justify;\">If you have any questions about our Cancellation and Returns Policy, please contact us:</p><p style=\"text-align: justify;\">By email: <b>vishruthijewelemporium@gmail.com</b></p><p style=\"text-align: justify;\">By visiting this page on our website:&nbsp;<a href=\"http://vishruthijewelemporium.com/admin/page/edit/www.vishruthijewelemporium.com\" title=\"Vishruthi Jewel Emporium\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\"><span style=\"font-weight: bolder;\">www.vishruthijewelemporium.com</span></a></p><p style=\"text-align: justify;\">By phone number: <b>+91 97871 55003</b></p>\r\n\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>     \r\n    </div>', 't1,t2,t3,t4', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 1, 1),
(4, 'Return & Refund Policy', 'return', '<div class=\"about_section\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-12 col-md-12\">\r\n                <div class=\"about_content\">\r\n                    <h1 style=\"text-align: justify;\">Return &amp; Refund Policy</h1>\r\n                    <p style=\"text-align: justify;\">Thanks for shopping at&nbsp;<a href=\"http://vishruthijewelemporium.com/admin/page/edit/www.vishruthijewelemporium.com\" title=\"Vishruthi Jewel Emporium\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\"><span style=\"font-weight: bolder;\">www.vishruthijewelemporium.com</span></a>&nbsp;If you are not entirely satisfied with your purchase, we\'re here to help.</p>\r\n\r\n                    <p style=\"text-align: justify;\">Generally, we provide Free Delivery of products across India for all orders above Rs.1000. For orders below Rs.1000 we have a small shipping charge per order based on the product.</p>\r\n                    <p style=\"text-align: justify;\">All the orders are usually dispatch in 2-3 working days of receiving the order. It reaches customers within 7 working days.</p>\r\n                    <p style=\"text-align: justify;\">\r\n                        Cancellations are possible only until the order is dispatched from us. Please contact our customer care team on +91 97871 55003 between 10 AM and 7 PM or email us at <b>vishruthijewelemporium@gmail.com</b> for any\r\n                        assistance. Please note that no cancellations are allowed once the order gets shipped.\r\n                    </p>\r\n\r\n                    <h4 style=\"text-align: justify;\">EXCHANGE POLICY</h4>\r\n                    <p style=\"text-align: justify;\">\r\n                        Exchanges will be accepted only if the product is completely damaged in transit or completely different from what was ordered. The customer should inform us of the issue within a day of the receipt of the product for\r\n                        us to accept the exchange. Also, proof of damage should be described by taking a photo or video immediately on receipt of the parcel. For slight color variations and design variations are NOT eligible for exchange.\r\n                    </p>\r\n\r\n                    <p style=\"text-align: justify;\">\r\n                        Replacement of a returned product is subject to availability of stock. If the product is out of stock, the customer will be given a credit note of the amount to apply on their next purchase.\r\n                    </p>\r\n                    <p style=\"text-align: justify;\">\r\n                        Please do not return products without prior information to us through the contact numbers listed above. For Products returned without our knowledge, we will not be in a position to accept the same and we are not\r\n                        liable for any loss or damage due to the same.\r\n                    </p>\r\n\r\n                    <h4 style=\"text-align: justify;\">Contact Us</h4>\r\n                    <p style=\"text-align: justify;\">If you have any questions about our Cancellation and Returns Policy, please contact us:</p>\r\n                    <p style=\"text-align: justify;\">By email: <b>vishruthijewelemporium@gmail.com</b></p>\r\n                    <p style=\"text-align: justify;\">By visiting this page on our website:&nbsp;<a href=\"http://vishruthijewelemporium.com/admin/page/edit/www.vishruthijewelemporium.com\" title=\"Vishruthi Jewel Emporium\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\"><span style=\"font-weight: bolder;\">www.vishruthijewelemporium.com</span></a></p>\r\n                    <p style=\"text-align: justify;\">By phone number: <b>+91 97871 55003</b></p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>', NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagesettings`
--

CREATE TABLE `pagesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_success` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT 1,
  `service` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 1,
  `small_banner` tinyint(1) NOT NULL DEFAULT 1,
  `best` tinyint(1) NOT NULL DEFAULT 1,
  `top_rated` tinyint(1) NOT NULL DEFAULT 1,
  `large_banner` tinyint(1) NOT NULL DEFAULT 1,
  `big` tinyint(1) NOT NULL DEFAULT 1,
  `hot_sale` tinyint(1) NOT NULL DEFAULT 1,
  `partners` tinyint(1) NOT NULL DEFAULT 0,
  `review_blog` tinyint(1) NOT NULL DEFAULT 1,
  `best_seller_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller_banner_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_small` tinyint(1) NOT NULL DEFAULT 0,
  `flash_deal` tinyint(1) NOT NULL DEFAULT 0,
  `best_seller_banner1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller_banner_link1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner_link1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_category` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagesettings`
--

INSERT INTO `pagesettings` (`id`, `contact_success`, `contact_email`, `contact_title`, `contact_text`, `side_title`, `side_text`, `street`, `phone`, `fax`, `email`, `site`, `slider`, `service`, `featured`, `small_banner`, `best`, `top_rated`, `large_banner`, `big`, `hot_sale`, `partners`, `review_blog`, `best_seller_banner`, `best_seller_banner_link`, `big_save_banner`, `big_save_banner_link`, `bottom_small`, `flash_deal`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner1`, `big_save_banner_link1`, `featured_category`) VALUES
(1, 'Success! Thanks for contacting us, we will get back to you shortly.', 'sivabharath1986@gmail.com', '<h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">For Enquiry</h4>', '<span style=\"color: rgb(116, 116, 116); font-family: &quot;Libre Franklin&quot;, sans-serif; font-size: 15px;\">We are a 2nd generation entrepreneur into this business and based out of Coimbatore in the southern part of India. All Our Artificial Jewelleries are Manufactured by our own group company and hence the customers get exactly what we post in the gallery. We never compromise on the quality of our products. We are having our own quality checks to ensure that everything is properly manufactured as per our own standards. We are a digital platform for selecting your desired design and ordering it online as many of our customers are in various towns. We have exclusively designed and developed imitation jewellery /artificial jewellery and fashion jewellery to choose from. We have our own in house designing team to create designs and get them manufactured and offer you a product which suits each and everybody’s need.</span><br>', '<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>', '<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>', 'No 139, 1st floor, <br>Thiruvenkatasamy road west, Rs Puram <br>Coimbatore 641002', '+91 97871 55003', '0422-3577476', 'vishruthijewelemporium@gmail.com', 'www.vishruthijewelemporium.com', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '1635168119banner2.jpg', 'http://google.com', '1565150264banner3.jpg', 'http://google.com', 1, 1, '1635168119banner4.jpg', 'http://google.com', '1565150264banner4.jpg', 'http://google.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `photo`, `link`) VALUES
(1, '1563165366brand-1.png', 'https://www.google.com/'),
(2, '1563165383brand-2.png', 'https://www.google.com/'),
(3, '1563165393brand-3.png', 'https://www.google.com/'),
(4, '1563165400brand-1.png', NULL),
(5, '1563165411brand-2.png', NULL),
(6, '1563165444brand-3.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(191) NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `subtitle`, `title`, `details`, `status`) VALUES
(46, 'Pay via your Mobile Money.', 'Mobile Money', '<font size=\"3\"><b style=\"\">Mobile Money</b><b>&nbsp;No: 6528068515</b><br><br></font>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` int(191) UNSIGNED NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pickups`
--

INSERT INTO `pickups` (`id`, `location`) VALUES
(2, 'Azampur'),
(3, 'Dhaka'),
(4, 'Kazipara'),
(5, 'Kamarpara'),
(6, 'Uttara');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(191) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `product_type` enum('normal','affiliate') NOT NULL DEFAULT 'normal',
  `affiliate_link` text DEFAULT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `category_id` int(191) UNSIGNED NOT NULL,
  `subcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `childcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `previous_price` double DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(191) DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `views` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text DEFAULT NULL,
  `colors` text DEFAULT NULL,
  `chaintype` text CHARACTER SET utf8 DEFAULT NULL,
  `banglesize` text CHARACTER SET utf8 DEFAULT NULL,
  `product_condition` tinyint(1) NOT NULL DEFAULT 0,
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT 0,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `best` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `top` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `hot` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `latest` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `big` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 0,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_catalog` tinyint(1) NOT NULL DEFAULT 0,
  `catalog_id` int(191) NOT NULL DEFAULT 0,
  `tab_desc` text DEFAULT NULL,
  `add_info` text DEFAULT NULL,
  `is_antic` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `chaintype`, `banglesize`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`, `tab_desc`, `add_info`, `is_antic`) VALUES
(207, 'VJE-NH-001', 'normal', NULL, 0, 20, 18, 17, NULL, 'Amirthavarshini Haram', 'amirthavarshini-haram-vje-nh-001', 'S5FXRYFRRT.png', 'ZZ4fRJVuuX.jpg', NULL, NULL, NULL, NULL, NULL, 28500, 0, 'A classic temple haram with embossed nakashi pendant.<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 28, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2021-11-16 12:41:29', '2021-12-03 09:23:14', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(208, 'VJE-NH-002', 'normal', NULL, 0, 20, 18, 17, NULL, 'Kalyani Nakashi haram', 'kalyani-nakashi-haram-vje-nh-002', 'p1YryimVkN.png', 's13N1rBs5Q.jpg', NULL, NULL, NULL, NULL, NULL, 29500, 0, '&nbsp;Antique Nakashi haram with peacock and kaalinga narthanam pendant.<br>', 10, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 6, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2021-11-16 13:16:14', '2021-12-02 13:32:39', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(209, 'VJE-NH-003', 'normal', NULL, 0, 20, 18, 17, NULL, 'Hamsadhvani haram', 'hamsadhvani-haram-vje-nh-003', '6v448pn99h.png', '2Jtu2MHYlb.jpg', NULL, NULL, NULL, NULL, NULL, 28800, 0, 'Antique emerald stone haram with Annapakshi and Lakshmi pendant<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 8, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2021-11-16 13:19:47', '2021-12-02 16:40:08', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(210, 'VJE-NH-004', 'normal', NULL, 0, 20, 18, 17, NULL, 'Sangarabharanam haram', 'sangarabharanam-haram-vje-nh-004', 'E0Xq7cPLDQ.png', 'Fcbnn34ZIk.jpg', NULL, NULL, NULL, NULL, NULL, 32500, 0, 'Antique Nakashi handcrafted haram<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 9, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2021-11-16 13:30:37', '2021-12-04 18:53:25', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(211, 'VJE-NH-005', 'normal', NULL, 0, 20, 18, 17, NULL, 'Sindhubhairavi haram', 'sindhubhairavi-haram-vje-nh-005', 'dpL0G0Jos8.png', 'bhakOpnzKC.jpg', NULL, NULL, NULL, NULL, NULL, 31800, 0, 'Antique Nakashi handcrafted haram with Lakshmi pendant.<br>', 3, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 94, NULL, NULL, NULL, 'Back Chain,Rope Thread', NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2021-11-16 13:32:28', '2021-12-02 14:49:28', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(212, 'VJE-NH-006', 'normal', NULL, 0, 20, 18, NULL, NULL, 'Lathaangi Haram', 'lathaangi-haram-vje-nh-006', '09Ugrc9Cd2.png', 'AbmBI2p03a.jpg', NULL, NULL, NULL, NULL, NULL, 28800, 30000, 'Antique Nakashi handcrafted Kemp haram with Lakshmi pendant<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><b>Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</b></li><li><b>once the product is booked it will not be cancelled at any cost unless the product is out of stock.</b></li><li><b>In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</b></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><b>NO VIDEO NO EXCHANGE</b></div>', 1, 38, NULL, NULL, NULL, 'Rope,Chain', NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2021-11-17 18:53:33', '2021-12-02 17:38:29', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 1),
(213, 'VJE-NH-007', 'normal', NULL, 0, 20, 18, 17, NULL, 'Vaachaspathi', 'vaachaspathi-vje-nh-007', '32XF4TUnGJ.png', 'OjYOuZKWhx.jpg', NULL, NULL, NULL, NULL, NULL, 28600, 0, 'Antique Nakashi handcrafted Kemp haram with kaalinga narthanam pendant<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 3, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-30 15:02:27', '2021-11-30 15:06:40', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 1),
(214, 'VJE-NH-008', 'normal', NULL, 0, 20, 18, 17, NULL, 'Maalavi', 'maalavi-vje-nh-008', 'f1jXuaKRPC.png', 'A3N0XZGwJ2.jpg', NULL, NULL, NULL, NULL, NULL, 27600, 0, '<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 6, NULL, NULL, NULL, 'Back Chain,Rope', NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-30 15:07:08', '2021-12-02 15:17:03', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 1),
(215, 'VJE-NH-009', 'normal', NULL, 0, 20, 19, NULL, NULL, 'Poorana Chandrika', 'poorana-chandrika-vje-nh-009', 'doXHHtD4VA.png', 'K60t2lyhhD.jpg', NULL, NULL, NULL, NULL, NULL, 32500, 0, 'hand crafted Kemp and kundan haram with green peads<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><br></div>', 1, 9, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-30 15:12:24', '2021-12-02 17:57:53', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(216, 'VJE-NB-001', 'normal', NULL, 0, 24, 31, NULL, NULL, 'Nakashi vadhanam', 'nakashi-vadhanam-vje-nb-001', 'bQltqoZKhV.png', 'dUIGQIoUYD.jpg', NULL, NULL, NULL, NULL, NULL, 28500, 0, 'Hand crafted Nakashi vadhanam<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, '2021-11-30 15:14:49', '2021-11-30 15:16:29', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(217, 'VJE-NB-002', 'normal', NULL, 0, 24, 31, NULL, NULL, 'Nakashi vadhanam', 'nakashi-vadhanam-vje-nb-002', 'VJTkmECOGO.png', 'b6hVZSxI3y.jpg', NULL, NULL, NULL, NULL, NULL, 29000, 0, 'Hand crafted Nakashi vadhanam<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, '2021-11-30 15:19:29', '2021-11-30 15:22:32', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(218, 'VJE-NB-003', 'normal', NULL, 0, 24, 31, NULL, NULL, 'Nakashi vadhanam', 'nakashi-vadhanam-vje-nb-003', 'n5VrOAs1Jo.png', 'iAM1xz4sZ1.jpg', NULL, NULL, NULL, NULL, NULL, 28700, 0, 'Handcrafted Nakashi Vadhanam<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, '2021-11-30 15:22:08', '2021-11-30 15:22:25', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(219, 'VJE-NB-004', 'normal', NULL, 0, 24, NULL, NULL, NULL, 'Nakashi vadhanam', 'nakashi-vadhanam-vje-nb-004', 'DiUyMi17nd.png', '4Gkw2VG4tW.jpg', NULL, NULL, NULL, NULL, NULL, 28900, 0, '&nbsp;Hand crafted Nakashi vadhanam<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, '2021-11-30 15:24:26', '2021-11-30 15:24:56', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(220, 'VJE-NB-005', 'normal', NULL, 0, 24, NULL, NULL, NULL, 'Plain Hipbelt', 'plain-hipbelt-vje-nb-005', 'KCe34HNdVu.png', 'ZPqYB9rTnp.jpg', NULL, NULL, NULL, NULL, NULL, 3500, 0, '<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, '2021-11-30 15:31:49', '2021-12-01 11:14:38', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(221, 'VJE-NB-006', 'normal', NULL, 0, 24, NULL, NULL, NULL, 'Plain Hipbelt', 'plain-hipbelt-vje-nb-006', 'AEK7EDwrvH.png', 'B6AEgjnoqZ.jpg', NULL, NULL, NULL, NULL, NULL, 4800.01, 0, 'plain Hipbelt with pendant<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 0, 0, '2021-11-30 15:36:47', '2021-11-30 15:37:03', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(222, 'VJE-NB-007', 'normal', NULL, 0, 24, 31, NULL, NULL, 'Nakashi vadhanam', 'nakashi-vadhanam-vje-nb-007', 'DLZpmFTqBI.png', 'tfFPPFaErH.jpg', NULL, NULL, NULL, NULL, NULL, 28200, 0, 'Hand crafted Nakashi vadhanam&nbsp;<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-30 15:51:31', '2021-11-30 15:51:31', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(223, 'VJE-NN-001', 'normal', NULL, 0, 21, 23, NULL, NULL, 'Nakashi chocker', 'nakashi-chocker-vje-nn-001', 'HHb5CCUzcR.png', 'b69USyr2Ve.jpg', NULL, NULL, NULL, NULL, NULL, 18500, 0, '<div>Handcrafted Nakashi antique chocker&nbsp;</div><div><br></div>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2021-11-30 16:18:55', '2021-11-30 16:19:19', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 1),
(224, 'VJE-NN-002', 'normal', NULL, 0, 21, 21, NULL, NULL, 'Nakashi necklace', 'nakashi-necklace-vje-nn-002', 'ZsNlTuP5gn.png', 'e4qCgCmJYD.jpg', NULL, NULL, NULL, NULL, NULL, 13800, 0, '<div>Hand crafted Nakashi antique Necklace</div><div><br></div>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2021-11-30 16:28:15', '2021-11-30 16:29:31', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 1),
(225, 'VJE-NN-003', 'normal', NULL, 0, 21, 21, NULL, NULL, 'Nakashi necklace', 'nakashi-necklace-vje-nn-003', 'wVtNTZFPHP.png', '0LmMoRVEMN.jpg', NULL, NULL, NULL, NULL, NULL, 13600, 0, 'Hand crafted Nakashi antique Necklace<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2021-11-30 16:32:27', '2021-12-04 15:21:32', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 1),
(226, 'VJE-NN-004', 'normal', NULL, 0, 21, 21, NULL, NULL, 'Nakashi necklace', 'nakashi-necklace-vje-nn-004', '7UUAkjNzLV.png', 'I4Kc5kcsiG.jpg', NULL, NULL, NULL, NULL, NULL, 13600, 0, 'Handcrafted Nakashi antique Necklace<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2021-11-30 16:38:41', '2021-11-30 16:38:53', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 1),
(227, 'VJE-NN-005', 'normal', NULL, 0, 21, 21, NULL, NULL, 'Nakashi necklace', 'nakashi-necklace-vje-nn-005', 'Q6DbgK3B0k.png', 'tsut4wiF4u.jpg', NULL, NULL, NULL, NULL, NULL, 18600, 0, '&nbsp;Hand crafted Nakashi antique Necklace<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2021-11-30 16:58:55', '2021-11-30 16:59:07', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 1),
(228, 'VJE-NN-006', 'normal', NULL, 0, 21, 21, NULL, NULL, 'Nakashi necklace', 'nakashi-necklace-vje-nn-006', 'hYfzh63eTF.png', 'vQC7C3CSSO.jpg', NULL, NULL, NULL, NULL, NULL, 13800, 0, 'Hand crafted Nakashi antique Necklace<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2021-11-30 17:03:26', '2021-11-30 17:03:40', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(229, 'VJE-NN-007', 'normal', NULL, 0, 21, 21, NULL, NULL, 'Nakashi necklace', 'nakashi-necklace-vje-nn-007', 'lopL2gtMGt.png', '9ubed0KNyT.jpg', NULL, NULL, NULL, NULL, NULL, 13400, 0, 'Handcrafted Nakashi antique Necklace with green stone<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-30 17:05:32', '2021-12-02 13:21:10', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 1),
(230, 'VJE-NN-008', 'normal', NULL, 0, 21, 22, NULL, NULL, 'Kemp necklace', 'kemp-necklace-vje-nn-008', 'FhHD7kRkk1.png', '0zjtIOAqy1.jpg', NULL, NULL, NULL, NULL, NULL, 2850, 0, '<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-30 17:07:18', '2021-11-30 17:07:18', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(231, 'VJE-NN-009', 'normal', NULL, 0, 21, 22, NULL, NULL, 'Kemp mango necklace', 'kemp-mango-necklace-vje-nn-009', 'zrU8js9slp.png', 'C1x1LBen5c.jpg', NULL, NULL, NULL, NULL, NULL, 12500, 0, 'Handcrafted Kemp mango&nbsp; necklace<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-30 17:08:49', '2021-12-02 13:22:25', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0),
(232, 'VJE-NN-010', 'normal', NULL, 0, 21, NULL, NULL, NULL, 'Kundan green necklace', 'kundan-green-necklace-vje-nn-010', 'svNzwBfcji.png', 'RGQH9JS9JD.jpg', NULL, NULL, NULL, NULL, NULL, 18500, 0, 'Kundan necklace with Jimiki<br>', NULL, '<ul><li>Customer to make a proper opening video of the parcel right from the start till the end and check for any missing items</li><li><span style=\"font-weight: bolder;\">Also if there is any damage it has to be notified on the same day of delivery, no exchange request will be accepted if notified after 24 hrs of delivery.</span></li><li><span style=\"font-weight: bolder;\">once the product is booked it will not be cancelled at any cost unless the product is out of stock.</span></li><li><span style=\"font-weight: bolder;\">In case of damage, the return shipment amount has to be paid by the customer for exchange and we will ship it back for free.</span></li><li>These rules are made for everyone.</li></ul><div>Please be transparent for us to serve you better</div><div><br></div><div><span style=\"font-weight: bolder;\">NO VIDEO NO EXCHANGE</span></div>', 1, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, 0, 0, '2021-11-30 17:10:52', '2021-12-02 18:20:12', 0, NULL, NULL, NULL, 0, 0, '<br>', '<br>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_clicks`
--

CREATE TABLE `product_clicks` (
  `id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_clicks`
--

INSERT INTO `product_clicks` (`id`, `product_id`, `date`) VALUES
(487, 207, '2021-11-16'),
(488, 207, '2021-11-16'),
(489, 207, '2021-11-16'),
(490, 207, '2021-11-16'),
(491, 207, '2021-11-16'),
(492, 207, '2021-11-16'),
(493, 207, '2021-11-16'),
(494, 207, '2021-11-16'),
(495, 207, '2021-11-16'),
(496, 207, '2021-11-16'),
(497, 209, '2021-11-16'),
(500, 209, '2021-11-16'),
(521, 211, '2021-11-16'),
(522, 211, '2021-11-16'),
(523, 207, '2021-11-16'),
(526, 211, '2021-11-16'),
(527, 211, '2021-11-16'),
(528, 211, '2021-11-16'),
(529, 211, '2021-11-16'),
(530, 211, '2021-11-16'),
(531, 211, '2021-11-16'),
(534, 211, '2021-11-16'),
(536, 207, '2021-11-16'),
(538, 211, '2021-11-16'),
(539, 211, '2021-11-16'),
(542, 211, '2021-11-16'),
(543, 211, '2021-11-16'),
(544, 211, '2021-11-16'),
(545, 211, '2021-11-16'),
(546, 208, '2021-11-16'),
(547, 211, '2021-11-16'),
(549, 211, '2021-11-16'),
(550, 211, '2021-11-16'),
(551, 207, '2021-11-16'),
(552, 207, '2021-11-16'),
(553, 207, '2021-11-16'),
(554, 207, '2021-11-16'),
(565, 211, '2021-11-16'),
(567, 211, '2021-11-16'),
(568, 211, '2021-11-16'),
(569, 211, '2021-11-16'),
(570, 211, '2021-11-16'),
(571, 211, '2021-11-16'),
(572, 211, '2021-11-16'),
(573, 211, '2021-11-16'),
(574, 211, '2021-11-16'),
(575, 211, '2021-11-16'),
(576, 211, '2021-11-16'),
(577, 211, '2021-11-16'),
(578, 211, '2021-11-16'),
(579, 211, '2021-11-16'),
(580, 211, '2021-11-16'),
(581, 211, '2021-11-16'),
(582, 211, '2021-11-16'),
(583, 211, '2021-11-16'),
(584, 211, '2021-11-16'),
(585, 211, '2021-11-16'),
(586, 211, '2021-11-16'),
(587, 211, '2021-11-16'),
(588, 211, '2021-11-16'),
(589, 211, '2021-11-16'),
(590, 211, '2021-11-16'),
(591, 211, '2021-11-16'),
(592, 211, '2021-11-16'),
(593, 211, '2021-11-16'),
(594, 211, '2021-11-16'),
(595, 211, '2021-11-16'),
(596, 211, '2021-11-16'),
(597, 211, '2021-11-16'),
(598, 211, '2021-11-16'),
(599, 211, '2021-11-16'),
(602, 207, '2021-11-17'),
(603, 211, '2021-11-17'),
(634, 211, '2021-11-17'),
(657, 211, '2021-11-17'),
(658, 210, '2021-11-17'),
(659, 209, '2021-11-17'),
(660, 208, '2021-11-17'),
(661, 207, '2021-11-17'),
(700, 207, '2021-11-17'),
(707, 207, '2021-11-17'),
(732, 211, '2021-11-17'),
(733, 211, '2021-11-17'),
(734, 211, '2021-11-17'),
(735, 211, '2021-11-17'),
(739, 211, '2021-11-17'),
(740, 211, '2021-11-17'),
(743, 211, '2021-11-17'),
(744, 211, '2021-11-17'),
(745, 211, '2021-11-17'),
(746, 210, '2021-11-17'),
(747, 211, '2021-11-17'),
(748, 209, '2021-11-17'),
(749, 207, '2021-11-17'),
(750, 207, '2021-11-17'),
(751, 211, '2021-11-17'),
(753, 211, '2021-11-17'),
(760, 211, '2021-11-17'),
(761, 211, '2021-11-17'),
(762, 211, '2021-11-17'),
(763, 211, '2021-11-17'),
(764, 211, '2021-11-17'),
(765, 211, '2021-11-17'),
(767, 211, '2021-11-17'),
(768, 207, '2021-11-17'),
(769, 207, '2021-11-17'),
(770, 207, '2021-11-17'),
(771, 207, '2021-11-17'),
(772, 208, '2021-11-17'),
(773, 210, '2021-11-17'),
(774, 211, '2021-11-17'),
(775, 208, '2021-11-17'),
(776, 209, '2021-11-17'),
(777, 210, '2021-11-17'),
(778, 211, '2021-11-17'),
(779, 210, '2021-11-17'),
(780, 211, '2021-11-17'),
(781, 211, '2021-11-17'),
(782, 211, '2021-11-18'),
(783, 211, '2021-11-18'),
(784, 211, '2021-11-18'),
(785, 211, '2021-11-18'),
(786, 212, '2021-11-18'),
(787, 212, '2021-11-18'),
(788, 212, '2021-11-18'),
(800, 212, '2021-11-18'),
(801, 212, '2021-11-18'),
(802, 212, '2021-11-18'),
(803, 212, '2021-11-18'),
(804, 212, '2021-11-18'),
(805, 212, '2021-11-18'),
(806, 212, '2021-11-18'),
(807, 212, '2021-11-18'),
(808, 212, '2021-11-18'),
(809, 212, '2021-11-18'),
(810, 211, '2021-11-18'),
(811, 210, '2021-11-18'),
(812, 209, '2021-11-18'),
(813, 208, '2021-11-18'),
(814, 207, '2021-11-18'),
(815, 211, '2021-11-18'),
(816, 211, '2021-11-18'),
(817, 212, '2021-11-18'),
(818, 212, '2021-11-18'),
(820, 212, '2021-11-18'),
(822, 212, '2021-11-18'),
(824, 212, '2021-11-18'),
(825, 212, '2021-11-18'),
(826, 212, '2021-11-18'),
(827, 212, '2021-11-18'),
(828, 212, '2021-11-18'),
(829, 211, '2021-11-18'),
(831, 212, '2021-11-19'),
(832, 212, '2021-11-24'),
(833, 212, '2021-11-24'),
(834, 212, '2021-11-24'),
(835, 212, '2021-11-24'),
(836, 211, '2021-11-24'),
(837, 212, '2021-11-24'),
(838, 210, '2021-11-24'),
(839, 212, '2021-11-25'),
(841, 211, '2021-11-26'),
(843, 212, '2021-11-29'),
(844, 212, '2021-11-29'),
(845, 213, '2021-11-30'),
(846, 210, '2021-11-30'),
(847, 213, '2021-11-30'),
(848, 213, '2021-11-30'),
(849, 214, '2021-11-30'),
(850, 215, '2021-11-30'),
(851, 212, '2021-11-30'),
(852, 215, '2021-11-30'),
(855, 220, '2021-12-01'),
(856, 211, '2021-12-02'),
(857, 211, '2021-12-02'),
(858, 211, '2021-12-02'),
(859, 212, '2021-12-02'),
(860, 212, '2021-12-02'),
(863, 214, '2021-12-02'),
(865, 229, '2021-12-02'),
(866, 231, '2021-12-02'),
(867, 208, '2021-12-02'),
(869, 214, '2021-12-02'),
(871, 215, '2021-12-02'),
(872, 215, '2021-12-02'),
(873, 215, '2021-12-02'),
(874, 215, '2021-12-02'),
(875, 215, '2021-12-02'),
(876, 212, '2021-12-02'),
(877, 212, '2021-12-02'),
(878, 211, '2021-12-02'),
(879, 211, '2021-12-02'),
(880, 211, '2021-12-02'),
(881, 214, '2021-12-02'),
(882, 214, '2021-12-02'),
(883, 214, '2021-12-02'),
(884, 209, '2021-12-02'),
(885, 209, '2021-12-02'),
(886, 212, '2021-12-02'),
(887, 212, '2021-12-02'),
(888, 215, '2021-12-02'),
(889, 215, '2021-12-02'),
(890, 232, '2021-12-02'),
(891, 207, '2021-12-03'),
(892, 225, '2021-12-04'),
(893, 210, '2021-12-04');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(2) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `comment_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(192) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `photo`, `title`, `subtitle`, `details`) VALUES
(4, '1557343012img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(5, '1557343018img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(6, '1557343024img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `section`) VALUES
(16, 'Manager', 'orders , products , affilate_products , customers , vendors , vendor_subscription_plans , categories , bulk_product_upload , product_discussion , set_coupons , blog , messages , general_settings , home_page_settings , menu_page_settings , emails_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(17, 'Moderator', 'orders , products , customers , vendors , categories , blog , messages , home_page_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(18, 'Staff', 'orders , products , vendors , vendor_subscription_plans , categories , blog , home_page_settings , menu_page_settings , language_settings , seo_tools , subscribers');

-- --------------------------------------------------------

--
-- Table structure for table `seotools`
--

CREATE TABLE `seotools` (
  `id` int(10) UNSIGNED NOT NULL,
  `google_analytics` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keys` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seotools`
--

INSERT INTO `seotools` (`id`, `google_analytics`, `meta_keys`) VALUES
(1, '<script>//Google Analytics Scriptfffffffffffffffffffffffssssfffffs</script>', 'Genius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,Sea');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `details`, `photo`) VALUES
(2, 0, 'FREE SHIPPING', 'Free Shipping All Order', '1561348133service1.png'),
(3, 0, 'PAYMENT METHOD', 'Secure Payment', '1561348138service2.png'),
(4, 0, '30 DAY RETURNS', '30-Day Return Policy', '1561348143service3.png'),
(5, 0, 'HELP CENTER', '24/7 Support System', '1561348147service4.png'),
(6, 13, 'FREE SHIPPING', 'Free Shipping All Order', '1563247602brand1.png'),
(7, 13, 'PAYMENT METHOD', 'Secure Payment', '1563247614brand2.png'),
(8, 13, '30 DAY RETURNS', '30-Day Return Policy', '1563247620brand3.png'),
(9, 13, 'HELP CENTER', '24/7 Support System', '1563247670brand4.png');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Free Shipping', '(10 - 12 days)', 0),
(2, 0, 'Express Shipping', '(5 - 6 days)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(191) UNSIGNED NOT NULL,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `subtitle_text`, `subtitle_size`, `subtitle_color`, `subtitle_anime`, `title_text`, `title_size`, `title_color`, `title_anime`, `details_text`, `details_size`, `details_color`, `details_anime`, `photo`, `position`, `link`) VALUES
(8, 'World Fashion', '24', '#ffffff', 'slideInUp', 'Get Up to 40% Off', '60', '#ffffff', 'slideInDown', 'The wooboom jacket collection is back at half price', '16', '#ffffff', 'slideInRight', '1635167008slide3.jpg', 'slide-three', 'https://www.google.com/'),
(9, 'World Fashion', '24', '#ffffff', 'slideInUp', 'Get Up to 40% Off', '60', '#ffffff', 'slideInDown', 'The wooboom jacket collection is back at half price', '16', '#ffffff', 'slideInDown', '1635166992slide2.jpg', 'slide-one', 'https://www.google.com/'),
(10, 'World Fashion', '24', '#c32d2d', 'slideInUp', 'Get Up to 40% Off', '60', '#bc2727', 'slideInDown', 'The wooboom spring collection is back at half price', '16', '#c51d1d', 'slideInLeft', '1635166915slide1.jpg', 'slide-one', 'https://www.google.com/');

-- --------------------------------------------------------

--
-- Table structure for table `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gplus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dribble` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT 1,
  `g_status` tinyint(4) NOT NULL DEFAULT 1,
  `t_status` tinyint(4) NOT NULL DEFAULT 1,
  `l_status` tinyint(4) NOT NULL DEFAULT 1,
  `d_status` tinyint(4) NOT NULL DEFAULT 1,
  `f_check` tinyint(10) DEFAULT NULL,
  `g_check` tinyint(10) DEFAULT NULL,
  `fclient_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclient_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fredirect` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclient_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclient_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gredirect` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `facebook`, `gplus`, `twitter`, `linkedin`, `dribble`, `f_status`, `g_status`, `t_status`, `l_status`, `d_status`, `f_check`, `g_check`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`) VALUES
(1, 'https://en-gb.facebook.com/vishruthijewelpalace/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.instagram.com/vishruthi_jewel_palace/?hl=en', 'https://dribbble.com/', 1, 0, 0, 1, 0, 1, 1, '503140663460329', 'f66cd670ec43d14209a2728af26dcc43', 'https://localhost/geniuscart1.7.4/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'http://localhost/geniuscart1.7.4/auth/google/callback');

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(191) NOT NULL,
  `category_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `slug`, `status`) VALUES
(2, 4, 'TELEVISION', 'television', 0),
(3, 4, 'REFRIGERATOR', 'refrigerator', 0),
(12, 7, 'LG', 'lg', 0),
(18, 20, 'Nakashi Harams', 'nakashi-harams', 1),
(19, 20, 'Kemp Harams', 'kemp-harams', 1),
(20, 20, 'Bridal Harams', 'bridal-harams', 1),
(21, 21, 'Nakashi Necklace', 'nakashi-necklace', 1),
(22, 21, 'Kemp Necklace', 'kemp-necklace', 1),
(23, 21, 'Chokers', 'chokers', 1),
(24, 22, 'Kadas', 'kadas', 1),
(25, 22, 'Kemp Bangles', 'kemp-bangles', 1),
(26, 23, 'Jhumkas', 'jhumkas', 1),
(27, 23, 'Simple Earrings', 'simple-earrings', 1),
(28, 23, 'Chandhbalis', 'chandhbalis', 1),
(29, 24, 'Vankis', 'vankis', 1),
(30, 24, 'Kemp Belts', 'kemp-belts', 1),
(31, 24, 'Nakshi Belts', 'nakshi-belts', 1),
(32, 25, 'Tikka', 'tikka', 1),
(33, 25, 'Hair Pin', 'hair-pin', 1),
(34, 25, 'Jadavillais', 'jadavillais', 1),
(35, 26, 'Anklets', 'anklets', 1),
(36, 26, 'Toe Rings', 'toe-rings', 1),
(37, 27, 'Kemp Pendants', 'kemp-pendants', 1),
(38, 27, 'Simple Pendants', 'simple-pendants', 1),
(39, 27, 'Nakashi Pendants', 'nakashi-pendants', 1),
(40, 22, 'Nakashi Bangles', 'nakashi-bangles', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(191) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`) VALUES
(1, 'sivabharath1986@gmail.com'),
(2, 'sbharath.tgi@gmail.com'),
(3, 'sridhar@mindmade.in');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`) VALUES
(5, 'Standard', '$', 'USD', 60, 45, 25, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>'),
(6, 'Premium', '$', 'USD', 120, 90, 90, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>'),
(7, 'Unlimited', '$', 'USD', 250, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>'),
(8, 'Basic', '$', 'USD', 0, 30, 0, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(10) NOT NULL DEFAULT 0,
  `status` tinyint(10) NOT NULL DEFAULT 0,
  `verification_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `affilate_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_income` double NOT NULL DEFAULT 0,
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `f_check` tinyint(1) NOT NULL DEFAULT 0,
  `g_check` tinyint(1) NOT NULL DEFAULT 0,
  `t_check` tinyint(1) NOT NULL DEFAULT 0,
  `l_check` tinyint(1) NOT NULL DEFAULT 0,
  `mail_sent` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `current_balance` double NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `photo`, `zip`, `city`, `country`, `address`, `phone`, `fax`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_provider`, `status`, `verification_link`, `email_verified`, `affilate_code`, `affilate_income`, `shop_name`, `owner_name`, `shop_number`, `shop_address`, `reg_number`, `shop_message`, `shop_details`, `shop_image`, `f_url`, `g_url`, `t_url`, `l_url`, `is_vendor`, `f_check`, `g_check`, `t_check`, `l_check`, `mail_sent`, `shipping_cost`, `current_balance`, `date`, `ban`) VALUES
(13, 'Vendor', '1557677677bouquet_PNG62.png', '1234', 'Washington, DC', 'Algeria', 'Space Needle 400 Broad St, Seattles', '3453453345453411', '23123121', 'vendor@gmail.com', '$2y$10$.4NrvXAeyToa4x07EkFvS.XIUEc/aXGsxe1onkQ.Udms4Sl2W9ZYq', 'mkqw8vPw0AlOlxi4SZ6vjV3xDaFsLaSE2SGS9brAMRqfvK5mQbBA4Uo4RT9S', '2018-03-07 18:05:44', '2021-09-13 22:50:02', 0, 2, '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8ry', 'Yes', '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8rysdfsdfds', 5000, 'Test Stores', 'User', '43543534', 'Space Needle 400 Broad St, Seattles', 'asdasd', 'sdf', '<br>', NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 4978.02, '2021-12-13', 0),
(22, 'User', NULL, '1231', 'Test City', 'United States', 'Test Address', '34534534534', '34534534534', 'user@gmail.com', '$2y$10$.4NrvXAeyToa4x07EkFvS.XIUEc/aXGsxe1onkQ.Udms4Sl2W9ZYq', 'QDJly7GbYKwIaYBVF5SRYspgNfB9fb9MGnPC8ZKTysOyYiJfhqutVTPocuJe', '2019-06-20 12:26:24', '2020-10-11 00:28:33', 0, 0, '1edae93935fba69d9542192fb854a80a', 'Yes', '8f09b9691613ecb8c3f7e36e34b97b80', 4963.6900000000005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2021-04-09', 0),
(29, 'Bharath', NULL, NULL, NULL, NULL, 'No.12 New Colony, Chrompet', '0123456789', NULL, 'sbharath.tgi@gmail.com', '$2y$10$TvgBDwqJMGXTaLRVTYirzODkP26qn9y583Zsrs98YSqOAXU43QnFy', NULL, '2021-10-26 10:29:28', '2021-11-18 13:29:10', 0, 0, 'b5e3b53ee7c06dac936ddf68eaf3de1d', 'Yes', '7702cf2318ba83237ab28676e5046ee5', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(30, 'vikram', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vikram@mindmade.in', '$2y$10$gTdCj7rG9EvXKUaEfb4pTeH4X4HJ4Q8TdcS5CqhFq0WVUPWUt0iNW', NULL, '2021-11-17 17:04:43', '2021-11-17 17:04:43', 0, 0, '47930edc39c1053db4254ad6911a2ba5', 'Yes', 'edd5844b864e8ae74ebdf5d74f616e7a', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(31, 'sadasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sathyaventhan@gmail.com', '$2y$10$LgQM4vvI2c.vDAjS4lizxem9dz9xEzm8f0bs0p9.TarL2dcLl7Jqi', NULL, '2021-11-19 11:01:03', '2021-11-19 11:01:03', 0, 0, 'b51437b4656dd06179f3a2782141f8cc', 'Yes', 'c441a80f1b37f9f19f50a4d21a333443', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `order_number`, `is_read`, `created_at`, `updated_at`) VALUES
(23, 13, '2uQhPJ0SF1', 0, '2021-10-10 04:54:18', '2021-10-10 04:54:18');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `subscription_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_orders`
--

CREATE TABLE `vendor_orders` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Verified','Declined') DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_warning` tinyint(1) NOT NULL DEFAULT 0,
  `warning_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`id`, `user_id`, `attachments`, `status`, `text`, `admin_warning`, `warning_reason`, `created_at`, `updated_at`) VALUES
(4, 13, '1573723849Baby.tux-800x800.png,1573723849Baby.tux-800x800.png', 'Verified', 'TEst', 0, NULL, '2019-11-14 03:30:49', '2019-11-14 03:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(191) UNSIGNED NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`) VALUES
(23, 29, 208),
(31, 30, 211);

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(191) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_languages`
--
ALTER TABLE `admin_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tracks`
--
ALTER TABLE `order_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagesettings`
--
ALTER TABLE `pagesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `products` ADD FULLTEXT KEY `attributes` (`attributes`);

--
-- Indexes for table `product_clicks`
--
ALTER TABLE `product_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seotools`
--
ALTER TABLE `seotools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_languages`
--
ALTER TABLE `admin_languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `order_tracks`
--
ALTER TABLE `order_tracks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pagesettings`
--
ALTER TABLE `pagesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `product_clicks`
--
ALTER TABLE `product_clicks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=894;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `seotools`
--
ALTER TABLE `seotools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
