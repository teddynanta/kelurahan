-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2023 at 07:47 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kelurahan`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `order`, `created_at`, `updated_at`) VALUES
(4, 'Banner 1', 'banners\\November2022\\kW762rNYGxDJougWCDUA.jpeg', 1, '2022-10-27 01:48:46', '2022-11-17 08:58:05'),
(5, 'Banner 2', 'banners\\November2022\\fMTHMxy4RyQCXmHAYcXE.jpg', 2, '2022-10-27 01:49:39', '2022-11-17 02:51:06'),
(6, 'Banner 3', 'banners\\November2022\\IzKPFys7Vc2tSCaU8e7i.jpg', 3, '2022-10-27 01:50:02', '2022-11-17 02:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Pemerintahan', 'pemerintahan', '2022-10-25 03:23:40', '2022-10-26 00:38:08'),
(2, NULL, 1, 'Masyarakat', 'masyarakat', '2022-10-25 03:23:40', '2022-10-26 01:03:41'),
(3, NULL, 1, 'Olahraga', 'olahraga', '2022-10-26 01:02:59', '2022-10-26 01:03:47'),
(4, NULL, 1, 'Keagamaan', 'keagamaan', '2022-10-26 01:03:26', '2022-10-26 01:03:53');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 0, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 0, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2),
(31, 5, 'category_id', 'text', 'Category', 0, 0, 1, 1, 1, 0, '{}', 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '{}', 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{}', 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(48, 6, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"ACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '{}', 12),
(56, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 12, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 12, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 12, 'order', 'select_dropdown', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\"}}', 4),
(60, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(61, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(63, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(64, 13, 'icon', 'image', 'Icon', 1, 1, 1, 1, 1, 1, '{}', 3),
(65, 13, 'link', 'text', 'Link', 1, 1, 1, 1, 1, 1, '{}', 4),
(66, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(67, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(78, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(79, 16, 'author_id', 'text', 'Author', 0, 0, 0, 0, 0, 0, '{}', 2),
(80, 16, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(81, 16, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, '{}', 4),
(82, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(83, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(84, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(85, 18, 'laki_laki', 'number', 'Laki Laki', 1, 0, 1, 1, 1, 1, '{}', 3),
(86, 18, 'perempuan', 'number', 'Perempuan', 1, 0, 1, 1, 1, 1, '{}', 4),
(87, 18, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7),
(88, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(89, 18, 'tahun', 'number', 'Tahun', 1, 1, 1, 1, 1, 1, '{}', 2),
(90, 18, 'wni', 'number', 'Warga Negara Indonesia (WNI)', 1, 0, 1, 1, 1, 1, '{}', 5),
(91, 18, 'wna', 'number', 'Warga Negara Asing (WNA)', 1, 0, 1, 1, 1, 1, '{}', 6),
(92, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(93, 19, 'tahun', 'number', 'Tahun', 1, 1, 1, 1, 1, 1, '{}', 2),
(94, 19, 'islam', 'number', 'Islam', 1, 0, 1, 1, 1, 1, '{}', 3),
(95, 19, 'protestan', 'number', 'Protestan', 1, 0, 1, 1, 1, 1, '{}', 4),
(96, 19, 'katolik', 'number', 'Katolik', 1, 0, 1, 1, 1, 1, '{}', 5),
(97, 19, 'hindu', 'number', 'Hindu', 1, 0, 1, 1, 1, 1, '{}', 6),
(98, 19, 'buddha', 'number', 'Buddha', 1, 0, 1, 1, 1, 1, '{}', 7),
(99, 19, 'khonghucu', 'number', 'Khonghucu', 1, 0, 1, 1, 1, 1, '{}', 8),
(100, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(101, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(102, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(103, 20, 'tahun', 'number', 'Tahun', 1, 1, 1, 1, 1, 1, '{}', 2),
(104, 20, 'pns', 'number', 'PNS', 1, 0, 1, 1, 1, 1, '{}', 3),
(105, 20, 'tni_polri', 'number', 'TNI/POLRI', 1, 0, 1, 1, 1, 1, '{}', 4),
(106, 20, 'wiraswasta', 'number', 'Wiraswasta', 1, 0, 1, 1, 1, 1, '{}', 5),
(107, 20, 'pedagang', 'number', 'Pedagang', 1, 0, 1, 1, 1, 1, '{}', 6),
(108, 20, 'pegawai_swasta', 'number', 'Pegawai Swasta', 1, 0, 1, 1, 1, 1, '{}', 7),
(109, 20, 'medis', 'number', 'Tenaga Kesehatan', 1, 0, 1, 1, 1, 1, '{}', 8),
(110, 20, 'buruh', 'number', 'Buruh', 1, 0, 1, 1, 1, 1, '{}', 9),
(111, 20, 'pengangguran_terdidik', 'number', 'Pengangguran Terdidik', 1, 0, 1, 1, 1, 1, '{}', 10),
(112, 20, 'pengangguran_tak_terdidik', 'number', 'Pengangguran Tak Terdidik', 1, 0, 1, 1, 1, 1, '{}', 11),
(113, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 12),
(114, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(115, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(116, 22, 'tahun', 'number', 'Tahun', 1, 1, 1, 1, 1, 1, '{}', 2),
(117, 22, 'rumah_sakit', 'number', 'Rumah Sakit', 1, 0, 1, 1, 1, 1, '{}', 3),
(118, 22, 'puskesmas', 'number', 'Puskesmas', 1, 0, 1, 1, 1, 1, '{}', 4),
(119, 22, 'puskeslur', 'number', 'Puskeslur', 1, 0, 1, 1, 1, 1, '{}', 5),
(121, 22, 'apotek', 'number', 'Apotek', 1, 0, 1, 1, 1, 1, '{}', 7),
(122, 22, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 8),
(123, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(124, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(125, 23, 'tahun', 'number', 'Tahun', 0, 1, 1, 1, 1, 1, '{}', 2),
(126, 23, 'masjid', 'number', 'Masjid', 0, 0, 1, 1, 1, 1, '{}', 3),
(127, 23, 'gereja_katolik', 'number', 'Gereja Katolik', 0, 0, 1, 1, 1, 1, '{}', 4),
(128, 23, 'gereja_protestan', 'number', 'Gereja Protestan', 0, 0, 1, 1, 1, 1, '{}', 5),
(129, 23, 'vihara', 'number', 'Vihara', 0, 0, 1, 1, 1, 1, '{}', 6),
(130, 23, 'pura', 'number', 'Pura', 0, 0, 1, 1, 1, 1, '{}', 7),
(131, 23, 'kelenteng', 'number', 'Kelenteng', 0, 0, 1, 1, 1, 1, '{}', 8),
(132, 23, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(133, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(134, 22, 'praktik_dokter', 'text', 'Praktik Dokter', 1, 0, 1, 1, 1, 1, '{}', 6),
(135, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(136, 27, 'tahun', 'number', 'Tahun', 1, 1, 1, 1, 1, 1, '{}', 2),
(137, 27, 'sd', 'number', 'SD/MI', 1, 0, 1, 1, 1, 1, '{}', 3),
(138, 27, 'smp', 'number', 'SMP/MTs', 1, 0, 1, 1, 1, 1, '{}', 4),
(139, 27, 'sma', 'number', 'SMA/SMK/MA', 1, 0, 1, 1, 1, 1, '{}', 5),
(140, 27, 'perguruan_tinggi', 'number', 'Perguruan Tinggi', 1, 0, 1, 1, 1, 1, '{}', 6),
(141, 27, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7),
(142, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-10-25 03:23:40', '2022-11-07 20:56:37'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-10-25 03:23:40', '2022-11-07 21:02:15'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-10-25 03:23:40', '2022-11-07 20:34:19'),
(12, 'banners', 'banners', 'Banner', 'Banners', NULL, 'App\\Models\\Banner', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"order\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-10-27 00:29:00', '2022-10-27 01:48:17'),
(13, 'features', 'features', 'Feature', 'Features', NULL, 'App\\Models\\Feature', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-10-27 01:42:38', '2022-10-27 01:42:38'),
(16, 'infographics', 'infographics', 'Infographic', 'Infographics', NULL, 'App\\Models\\Infographic', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-11-16 07:00:39', '2022-11-16 07:04:42'),
(18, 'populations', 'populations', 'Population', 'Populations', NULL, 'App\\Models\\Population', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-11-21 02:23:50', '2022-11-21 03:40:48'),
(19, 'religions', 'religions', 'Religion', 'Religions', NULL, 'App\\Models\\Religion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-11-21 04:12:02', '2022-11-21 04:12:02'),
(20, 'jobs', 'jobs', 'Job', 'Jobs', NULL, 'App\\Models\\Job', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-11-21 07:59:48', '2022-11-21 08:02:16'),
(22, 'healthcares', 'healthcares', 'Healthcare', 'Healthcares', NULL, 'App\\Models\\Healthcare', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-11-25 07:35:29', '2022-11-25 07:39:37'),
(23, 'worships', 'worships', 'Worship', 'Worships', NULL, 'App\\Models\\Worship', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-11-25 07:36:54', '2022-11-25 07:36:54'),
(27, 'schools', 'schools', 'School', 'Schools', NULL, 'App\\Models\\School', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-11-28 10:45:16', '2022-11-28 10:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`, `icon`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Desa Cantik', 'features\\November2022\\VKRDLB617RlKxK59KgrJ.jpg', 'https://webapps.bps.go.id/sumsel/tematik/', '2022-10-27 01:56:19', '2022-11-22 04:43:19'),
(2, 'Dassteran', 'features\\October2022\\3QErgX7OxM226TRT4WrI.png', 'https://dasteran.lubuklinggaukota.go.id/', '2022-10-27 02:08:25', '2022-10-27 02:08:25'),
(3, 'Silampari Smart City', 'features\\October2022\\2sKOQT8XDOYjFVN3UDZi.png', 'https://silamparismartcity.lubuklinggaukota.go.id', '2022-10-27 02:11:56', '2022-11-03 20:08:34'),
(4, 'Website Kota Lubuklinggau', 'features\\November2022\\mjYoOM7LlWTl2UIbBKHh.jpeg', 'https://lubuklinggaukota.go.id/public/', '2022-11-03 20:12:41', '2022-11-22 04:52:20'),
(5, 'Fitur Baru 2', 'features\\November2022\\bjYLoVdOjAF00LTSyPKk.png', '#', '2022-11-03 20:49:02', '2022-11-03 20:49:02'),
(6, 'Fitur Baru 3', 'features\\November2022\\Rjg8TaIcD1mXDmE8kQrv.png', '#', '2022-11-03 20:49:25', '2022-11-03 20:49:25');

-- --------------------------------------------------------

--
-- Table structure for table `healthcares`
--

CREATE TABLE `healthcares` (
  `id` int(10) UNSIGNED NOT NULL,
  `tahun` int(11) NOT NULL,
  `rumah_sakit` int(11) NOT NULL,
  `puskesmas` int(11) NOT NULL,
  `puskeslur` int(11) NOT NULL,
  `praktik_dokter` int(11) NOT NULL,
  `apotek` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `healthcares`
--

INSERT INTO `healthcares` (`id`, `tahun`, `rumah_sakit`, `puskesmas`, `puskeslur`, `praktik_dokter`, `apotek`, `created_at`, `updated_at`) VALUES
(1, 2022, 0, 0, 0, 0, 0, '2022-11-25 07:39:51', '2022-11-25 07:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `infographics`
--

CREATE TABLE `infographics` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `infographics`
--

INSERT INTO `infographics` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Infografis Kesehatan', 'infographics\\November2022\\s9pntWf4AKAUuSmrK4fk.png', '2022-11-16 07:10:12', '2022-11-16 07:10:12'),
(2, 'Infografis 2', 'infographics\\November2022\\trpUC2lhMvuUKcKfWjFb.jpg', '2022-11-16 07:10:35', '2022-11-16 07:10:35'),
(3, 'Infografis 3', 'infographics\\November2022\\VwLRd8OTVympP3xVNfXi.jpg', '2022-11-16 07:11:01', '2022-11-16 07:11:01'),
(4, 'Infografis', 'infographics\\December2022\\4Qb4jmJVBCDkEhW6Nz9f.jpg', '2022-12-08 04:16:56', '2022-12-08 04:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `tahun` int(11) NOT NULL,
  `pns` int(11) NOT NULL,
  `tni_polri` int(11) NOT NULL,
  `wiraswasta` int(11) NOT NULL,
  `pedagang` int(11) NOT NULL,
  `pegawai_swasta` int(11) NOT NULL,
  `medis` int(11) NOT NULL,
  `buruh` int(11) NOT NULL,
  `pengangguran_terdidik` int(11) NOT NULL,
  `pengangguran_tak_terdidik` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `tahun`, `pns`, `tni_polri`, `wiraswasta`, `pedagang`, `pegawai_swasta`, `medis`, `buruh`, `pengangguran_terdidik`, `pengangguran_tak_terdidik`, `created_at`, `updated_at`) VALUES
(1, 2022, 11, 9, 42, 26, 24, 390, 104, 18, 27, '2022-11-21 08:01:52', '2022-11-21 08:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(2, 'menu', '2022-10-26 00:19:36', '2022-10-26 00:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-10-25 03:23:39', '2022-10-25 03:23:39', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 42, 7, '2022-10-25 03:23:39', '2022-11-19 03:47:53', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-10-25 03:23:39', '2022-10-25 03:23:39', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-10-25 03:23:39', '2022-10-25 03:23:39', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2022-10-25 03:23:39', '2022-11-25 07:09:15', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, NULL, 7, '2022-10-25 03:23:39', '2022-11-25 07:09:15', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 1, '2022-10-25 03:23:39', '2022-11-02 00:30:54', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 2, '2022-10-25 03:23:39', '2022-11-02 00:30:54', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 3, '2022-10-25 03:23:39', '2022-11-02 00:30:54', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2022-10-25 03:23:39', '2022-11-25 07:09:15', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 42, 5, '2022-10-25 03:23:40', '2022-11-19 03:47:53', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 42, 1, '2022-10-25 03:23:40', '2022-11-19 03:47:32', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 42, 3, '2022-10-25 03:23:41', '2022-11-19 03:47:53', 'voyager.pages.index', NULL),
(14, 1, 'Banners', '', '_self', 'voyager-photos', '#000000', 42, 4, '2022-10-26 01:06:01', '2022-11-19 03:47:53', 'voyager.banners.index', 'null'),
(15, 2, 'Beranda', '/', '_self', NULL, '#000000', NULL, 1, '2022-10-26 02:04:41', '2022-10-26 02:05:28', NULL, ''),
(16, 2, 'Profil', '', '_self', NULL, '#000000', NULL, 2, '2022-10-26 02:05:00', '2022-10-26 02:05:28', NULL, ''),
(18, 2, 'Profil Kelurahan', '/profil-kelurahan', '_self', NULL, '#000000', 16, 1, '2022-10-26 02:05:51', '2022-10-31 01:25:55', NULL, ''),
(20, 1, 'Features', '', '_self', 'voyager-star-two', '#000000', 42, 6, '2022-10-27 01:38:05', '2022-11-19 03:47:53', 'voyager.features.index', NULL),
(22, 2, 'Visi Misi Kelurahan Watas Lubuk Durian', '/visi-misi-kelurahan-watas-lubuk-durian', '_self', NULL, '#000000', 16, 2, '2022-10-31 01:31:05', '2022-11-16 04:34:43', NULL, ''),
(23, 2, 'Login', '/admin/login', '_self', NULL, '#000000', NULL, 7, '2022-11-01 18:40:58', '2022-11-17 07:29:20', NULL, ''),
(24, 2, 'Data Penduduk', '/data-penduduk', '_self', NULL, '#000000', NULL, 6, '2022-11-02 00:20:26', '2022-11-17 07:29:20', NULL, ''),
(25, 2, 'Infografis', '/infografis', '_self', NULL, '#000000', NULL, 4, '2022-11-03 20:13:28', '2022-11-17 07:29:20', NULL, ''),
(26, 2, 'Berita', '/posts', '_self', NULL, '#000000', NULL, 5, '2022-11-06 19:23:53', '2022-11-17 07:29:20', NULL, ''),
(29, 2, 'Demografi', '/demografi', '_self', NULL, '#000000', 16, 4, '2022-11-06 21:09:00', '2022-11-16 04:34:43', NULL, ''),
(31, 2, 'Geografis', '/geografis', '_self', NULL, '#000000', 16, 3, '2022-11-16 04:34:38', '2022-11-16 04:34:43', NULL, ''),
(32, 2, 'Sarana', '', '_self', NULL, '#000000', NULL, 3, '2022-11-16 04:35:02', '2022-11-17 07:29:20', NULL, ''),
(33, 2, 'Sarana Keagamaan', '/sarana-keagamaan', '_self', NULL, '#000000', 32, 1, '2022-11-16 04:35:41', '2022-11-16 04:36:06', NULL, ''),
(34, 2, 'Sarana Kesehatan', '/sarana-kesehatan', '_self', NULL, '#000000', 32, 2, '2022-11-16 04:35:52', '2022-11-16 04:36:12', NULL, ''),
(35, 2, 'Sarana Pendidikan', '/sarana-pendidikan', '_self', NULL, '#000000', 32, 3, '2022-11-16 04:36:00', '2022-11-16 04:36:16', NULL, ''),
(40, 1, 'Infographics', '', '_self', 'voyager-photo', '#000000', 42, 2, '2022-11-16 07:00:39', '2022-11-19 03:47:37', 'voyager.infographics.index', 'null'),
(41, 2, 'Struktur Organisasi', '/struktur-organisasi', '_self', NULL, NULL, 16, 5, '2022-11-17 07:29:07', '2022-11-17 07:29:20', NULL, ''),
(42, 1, 'Managements', '', '_self', 'voyager-params', '#000000', NULL, 4, '2022-11-19 03:46:52', '2022-11-19 03:48:16', NULL, ''),
(45, 1, 'Data', '', '_self', 'voyager-pie-graph', '#000000', NULL, 5, '2022-11-21 02:19:36', '2022-11-21 02:19:53', NULL, ''),
(46, 1, 'Populations', '', '_self', 'voyager-people', '#000000', 45, 1, '2022-11-21 02:20:13', '2022-11-21 02:21:31', 'voyager.populations.index', 'null'),
(47, 1, 'Religions', '/religions', '_self', 'voyager-wand', '#000000', 45, 2, '2022-11-21 04:08:08', '2022-11-21 04:08:19', 'voyager.religions.index', NULL),
(49, 1, 'Jobs', '/jobs', '_self', 'voyager-dollar', '#000000', 45, 3, '2022-11-21 07:55:45', '2022-11-21 08:00:47', 'voyager.jobs.index', NULL),
(51, 1, 'Facilities', '', '_self', 'voyager-company', '#000000', NULL, 6, '2022-11-25 07:08:59', '2022-11-25 07:18:34', NULL, ''),
(52, 1, 'Worships', '/worships', '_self', 'voyager-wand', '#000000', 51, 1, '2022-11-25 07:21:44', '2022-11-25 07:21:56', 'voyager.worships.index', NULL),
(53, 1, 'Healthcares', '/healthcares', '_self', 'voyager-heart', '#000000', 51, 2, '2022-11-25 07:24:02', '2022-11-25 07:24:09', 'voyager.healthcares.index', NULL),
(62, 1, 'Schools', '/schools', '_self', 'voyager-study', '#000000', 51, 3, '2022-11-28 10:43:12', '2022-11-28 10:46:09', 'voyager.schools.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `body`, `image`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'ACTIVE', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(2, 1, 'Profil Kelurahan', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" title=\"Peta Wilayah Kelurahan Watas Lubuk Durian\" src=\"http://localhost:8000/storage/pages/November2022/peta (1).jpg\" alt=\"Peta Wilayah Kelurahan Watas Lubuk Durian\" width=\"674\" height=\"604\"></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Batas Wilayah Kelurahan Watas Lubuk Durian:</strong></p>\r\n<ul>\r\n<li>Sebelah Utara Berbatasan dengan Kelurahan Kayuara</li>\r\n<li>Sebelah Selatan Berbatasan dengan Kelurahan Tanjung Sanai/PU Tanding Provinsi Bengkulu</li>\r\n<li>Sebelah Timur berbatasan dengan Sungai Malus, Bukit Merbau, Gunung Ayu, Bukit Batu</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>Dengan Luas Wilayah : 470 Ha</strong></p>\r\n<ul>\r\n<li>Daerah Pemukiman : 5 Ha</li>\r\n<li>Daerah Perkebunan : 125 Ha</li>\r\n<li>Daerah Persawahan : 30 Ha</li>\r\n<li>Tanaman Holtikultura : 20 Ha</li>\r\n<li>Hutan Lindung : 250 Ha</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>Sumber Daya air</strong></p>\r\n<ul>\r\n<li>Sumur Galian : 153 buah</li>\r\n<li>Sumur Pompa : 2 buah</li>\r\n<li>PDAM : 35 buah</li>\r\n<li>Pipa : 1 buah</li>\r\n<li>Sungai : 3 buah</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p><strong>Topografi Benteng Lahan</strong></p>\r\n<ul>\r\n<li>Dataran : 185 Ha</li>\r\n<li>Rawaa-rawa : 2 Ha</li>\r\n<li>Pegunungan : 5 Ha</li>\r\n</ul>', NULL, 'profil-kelurahan', 'ACTIVE', '2022-10-30 23:44:16', '2022-11-18 06:35:37'),
(5, 1, 'Visi Misi Kelurahan Watas Lubuk Durian', '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Visi :</strong></p>\r\n<ol>\r\n<li>Menciptakan lingkungan sehat, aman, bersih, dan terjamin</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p><strong>Misi :</strong></p>\r\n<ol>\r\n<li>Melaksanakan kegiatan pemerintahan</li>\r\n<li>Memberikan pelayanan pada masyarakat</li>\r\n<li>Menyelenggarakan ketentraman dan ketertiban umum</li>\r\n<li>Memelihara prasarana dan fasilitas umum</li>\r\n<li>Membina lembaga kemasyarakatan</li>\r\n<li>Memelihara kebersihan dan keindahan lingkungan</li>\r\n</ol>', NULL, 'visi-misi-kelurahan-watas-lubuk-durian', 'ACTIVE', '2022-10-31 01:32:08', '2022-11-17 04:25:54'),
(7, 1, 'Infografis', '<p><img src=\"http://localhost:8000/storage/pages/November2022/UPDATE HARIAN PANTAUAN COVID-19 KOTA LUBUKLINGGAU TANGGAL 21 SEPTEMBER 2022 (4).png\" alt=\"\" width=\"1080\" height=\"1080\"></p>', NULL, 'infografis', 'ACTIVE', '2022-11-03 20:14:23', '2022-11-03 20:14:23'),
(15, 2, 'Sarana Keagamaan', '<table style=\"border-collapse: collapse; width: 38.1648%; border-width: 1px; border-color: #000000;\" border=\"1\"><colgroup><col style=\"width: 10.6849%;\"><col style=\"width: 53.1237%;\"><col style=\"width: 36.4653%;\"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td style=\"text-align: center; vertical-align: middle; border-width: 1px; border-color: rgb(0, 0, 0); background-color: rgb(53, 152, 219);\"><strong>No.</strong></td>\r\n<td style=\"text-align: center; vertical-align: middle; border-width: 1px; border-color: rgb(0, 0, 0); background-color: rgb(53, 152, 219);\"><strong>Sarana</strong></td>\r\n<td style=\"text-align: center; vertical-align: middle; border-width: 1px; border-color: rgb(0, 0, 0); background-color: rgb(53, 152, 219);\"><strong>Jumlah</strong></td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center; vertical-align: middle; border-width: 1px; border-color: rgb(0, 0, 0);\">1.</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0);\">Masjid</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0); text-align: center;\">2</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center; vertical-align: middle; border-width: 1px; border-color: rgb(0, 0, 0);\">2.</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0);\">Gereja Katolik</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0); text-align: center;\">0</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center; vertical-align: middle; border-width: 1px; border-color: rgb(0, 0, 0);\">3.</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0);\">Gereja Protestan</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0); text-align: center;\">1</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center; vertical-align: middle; border-width: 1px; border-color: rgb(0, 0, 0);\">4.</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0);\">Vihara</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0); text-align: center;\">0</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center; vertical-align: middle; border-width: 1px; border-color: rgb(0, 0, 0);\">5.</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0);\">Pura</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0); text-align: center;\">0</td>\r\n</tr>\r\n<tr>\r\n<td style=\"text-align: center; vertical-align: middle; border-width: 1px; border-color: rgb(0, 0, 0);\">6.</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0);\">Kelenteng</td>\r\n<td style=\"border-width: 1px; border-color: rgb(0, 0, 0); text-align: center;\">0</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 'sarana-keagamaan', 'ACTIVE', '2022-11-16 04:53:04', '2022-11-16 04:53:04'),
(16, 2, 'Struktur Organisasi', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://localhost:8000/storage/pages/November2022/Purple White Modern Minimal Classroom Organizational Chart.png\" alt=\"\" width=\"610\" height=\"457\"></p>', NULL, 'struktur-organisasi', 'ACTIVE', '2022-11-17 07:30:14', '2022-11-17 07:33:19'),
(17, 1, 'Sarana Kesehatan', '<p>sarana kesehatan</p>', NULL, 'sarana-kesehatan', 'ACTIVE', '2022-12-01 06:42:11', '2022-12-01 06:42:11'),
(18, 1, 'Sarana Pendidikan', '<p>sarana pendidikan</p>', NULL, 'sarana-pendidikan', 'ACTIVE', '2022-12-01 06:42:26', '2022-12-01 06:42:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(2, 'browse_bread', NULL, '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(3, 'browse_database', NULL, '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(4, 'browse_media', NULL, '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(5, 'browse_compass', NULL, '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(6, 'browse_menus', 'menus', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(7, 'read_menus', 'menus', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(8, 'edit_menus', 'menus', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(9, 'add_menus', 'menus', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(10, 'delete_menus', 'menus', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(11, 'browse_roles', 'roles', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(12, 'read_roles', 'roles', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(13, 'edit_roles', 'roles', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(14, 'add_roles', 'roles', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(15, 'delete_roles', 'roles', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(16, 'browse_users', 'users', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(17, 'read_users', 'users', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(18, 'edit_users', 'users', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(19, 'add_users', 'users', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(20, 'delete_users', 'users', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(21, 'browse_settings', 'settings', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(22, 'read_settings', 'settings', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(23, 'edit_settings', 'settings', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(24, 'add_settings', 'settings', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(25, 'delete_settings', 'settings', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(26, 'browse_categories', 'categories', '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(27, 'read_categories', 'categories', '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(28, 'edit_categories', 'categories', '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(29, 'add_categories', 'categories', '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(30, 'delete_categories', 'categories', '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(31, 'browse_posts', 'posts', '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(32, 'read_posts', 'posts', '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(33, 'edit_posts', 'posts', '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(34, 'add_posts', 'posts', '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(35, 'delete_posts', 'posts', '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(36, 'browse_pages', 'pages', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(37, 'read_pages', 'pages', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(38, 'edit_pages', 'pages', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(39, 'add_pages', 'pages', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(40, 'delete_pages', 'pages', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(46, 'browse_banners', 'banners', '2022-10-27 00:29:00', '2022-10-27 00:29:00'),
(47, 'read_banners', 'banners', '2022-10-27 00:29:00', '2022-10-27 00:29:00'),
(48, 'edit_banners', 'banners', '2022-10-27 00:29:00', '2022-10-27 00:29:00'),
(49, 'add_banners', 'banners', '2022-10-27 00:29:00', '2022-10-27 00:29:00'),
(50, 'delete_banners', 'banners', '2022-10-27 00:29:00', '2022-10-27 00:29:00'),
(51, 'browse_features', 'features', '2022-10-27 01:42:38', '2022-10-27 01:42:38'),
(52, 'read_features', 'features', '2022-10-27 01:42:38', '2022-10-27 01:42:38'),
(53, 'edit_features', 'features', '2022-10-27 01:42:38', '2022-10-27 01:42:38'),
(54, 'add_features', 'features', '2022-10-27 01:42:38', '2022-10-27 01:42:38'),
(55, 'delete_features', 'features', '2022-10-27 01:42:38', '2022-10-27 01:42:38'),
(56, 'browse_infografis', 'infografis', '2022-11-16 06:39:16', '2022-11-16 06:39:16'),
(57, 'read_infografis', 'infografis', '2022-11-16 06:39:16', '2022-11-16 06:39:16'),
(58, 'edit_infografis', 'infografis', '2022-11-16 06:39:16', '2022-11-16 06:39:16'),
(59, 'add_infografis', 'infografis', '2022-11-16 06:39:16', '2022-11-16 06:39:16'),
(60, 'delete_infografis', 'infografis', '2022-11-16 06:39:16', '2022-11-16 06:39:16'),
(66, 'browse_infographics', 'infographics', '2022-11-16 07:00:39', '2022-11-16 07:00:39'),
(67, 'read_infographics', 'infographics', '2022-11-16 07:00:39', '2022-11-16 07:00:39'),
(68, 'edit_infographics', 'infographics', '2022-11-16 07:00:39', '2022-11-16 07:00:39'),
(69, 'add_infographics', 'infographics', '2022-11-16 07:00:39', '2022-11-16 07:00:39'),
(70, 'delete_infographics', 'infographics', '2022-11-16 07:00:39', '2022-11-16 07:00:39'),
(76, 'browse_populations', 'populations', '2022-11-21 02:23:50', '2022-11-21 02:23:50'),
(77, 'read_populations', 'populations', '2022-11-21 02:23:50', '2022-11-21 02:23:50'),
(78, 'edit_populations', 'populations', '2022-11-21 02:23:50', '2022-11-21 02:23:50'),
(79, 'add_populations', 'populations', '2022-11-21 02:23:50', '2022-11-21 02:23:50'),
(80, 'delete_populations', 'populations', '2022-11-21 02:23:50', '2022-11-21 02:23:50'),
(81, 'browse_religions', 'religions', '2022-11-21 04:12:02', '2022-11-21 04:12:02'),
(82, 'read_religions', 'religions', '2022-11-21 04:12:02', '2022-11-21 04:12:02'),
(83, 'edit_religions', 'religions', '2022-11-21 04:12:02', '2022-11-21 04:12:02'),
(84, 'add_religions', 'religions', '2022-11-21 04:12:02', '2022-11-21 04:12:02'),
(85, 'delete_religions', 'religions', '2022-11-21 04:12:02', '2022-11-21 04:12:02'),
(86, 'browse_jobs', 'jobs', '2022-11-21 07:59:48', '2022-11-21 07:59:48'),
(87, 'read_jobs', 'jobs', '2022-11-21 07:59:48', '2022-11-21 07:59:48'),
(88, 'edit_jobs', 'jobs', '2022-11-21 07:59:48', '2022-11-21 07:59:48'),
(89, 'add_jobs', 'jobs', '2022-11-21 07:59:48', '2022-11-21 07:59:48'),
(90, 'delete_jobs', 'jobs', '2022-11-21 07:59:48', '2022-11-21 07:59:48'),
(96, 'browse_healthcares', 'healthcares', '2022-11-25 07:35:29', '2022-11-25 07:35:29'),
(97, 'read_healthcares', 'healthcares', '2022-11-25 07:35:29', '2022-11-25 07:35:29'),
(98, 'edit_healthcares', 'healthcares', '2022-11-25 07:35:29', '2022-11-25 07:35:29'),
(99, 'add_healthcares', 'healthcares', '2022-11-25 07:35:29', '2022-11-25 07:35:29'),
(100, 'delete_healthcares', 'healthcares', '2022-11-25 07:35:29', '2022-11-25 07:35:29'),
(101, 'browse_worships', 'worships', '2022-11-25 07:36:54', '2022-11-25 07:36:54'),
(102, 'read_worships', 'worships', '2022-11-25 07:36:54', '2022-11-25 07:36:54'),
(103, 'edit_worships', 'worships', '2022-11-25 07:36:54', '2022-11-25 07:36:54'),
(104, 'add_worships', 'worships', '2022-11-25 07:36:54', '2022-11-25 07:36:54'),
(105, 'delete_worships', 'worships', '2022-11-25 07:36:54', '2022-11-25 07:36:54'),
(121, 'browse_schools', 'schools', '2022-11-28 10:45:16', '2022-11-28 10:45:16'),
(122, 'read_schools', 'schools', '2022-11-28 10:45:16', '2022-11-28 10:45:16'),
(123, 'edit_schools', 'schools', '2022-11-28 10:45:16', '2022-11-28 10:45:16'),
(124, 'add_schools', 'schools', '2022-11-28 10:45:16', '2022-11-28 10:45:16'),
(125, 'delete_schools', 'schools', '2022-11-28 10:45:16', '2022-11-28 10:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(3, 3),
(4, 1),
(4, 3),
(5, 1),
(6, 1),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(8, 3),
(9, 1),
(9, 3),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 3),
(22, 1),
(22, 3),
(23, 1),
(23, 3),
(24, 1),
(25, 1),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(36, 3),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(39, 1),
(39, 3),
(40, 1),
(40, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(51, 3),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(66, 1),
(66, 3),
(67, 1),
(67, 3),
(68, 1),
(68, 3),
(69, 1),
(69, 3),
(70, 1),
(70, 3),
(76, 1),
(76, 3),
(77, 1),
(77, 3),
(78, 1),
(78, 3),
(79, 1),
(79, 3),
(80, 1),
(80, 3),
(81, 1),
(81, 3),
(82, 1),
(82, 3),
(83, 1),
(83, 3),
(84, 1),
(84, 3),
(85, 1),
(85, 3),
(86, 1),
(86, 3),
(87, 1),
(87, 3),
(88, 1),
(88, 3),
(89, 1),
(89, 3),
(90, 1),
(90, 3),
(96, 1),
(96, 3),
(97, 1),
(97, 3),
(98, 1),
(98, 3),
(99, 1),
(99, 3),
(100, 1),
(100, 3),
(101, 1),
(101, 3),
(102, 1),
(102, 3),
(103, 1),
(103, 3),
(104, 1),
(104, 3),
(105, 1),
(105, 3),
(121, 1),
(121, 3),
(122, 1),
(122, 3),
(123, 1),
(123, 3),
(124, 1),
(124, 3),
(125, 1),
(125, 3);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `populations`
--

CREATE TABLE `populations` (
  `id` int(10) UNSIGNED NOT NULL,
  `laki_laki` int(11) NOT NULL,
  `perempuan` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tahun` int(11) NOT NULL,
  `wni` int(11) NOT NULL,
  `wna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `populations`
--

INSERT INTO `populations` (`id`, `laki_laki`, `perempuan`, `created_at`, `updated_at`, `tahun`, `wni`, `wna`) VALUES
(2, 677, 672, '2022-11-21 03:42:10', '2022-11-21 03:42:52', 2022, 1349, 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `excerpt`, `body`, `image`, `slug`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'PUBLISHED', 0, '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(2, 0, NULL, 'My Sample Post', 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'PUBLISHED', 0, '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(3, 0, NULL, 'Latest Post', 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'PUBLISHED', 0, '2022-10-25 03:23:40', '2022-10-25 03:23:40'),
(5, 1, 1, 'trex tunai (tarik tunai hehehe)', 'Fusce pellentesque est vitae est molestie posuere. Donec nibh elit, condimentum ac tristique non, interdum id urna...', '<p>Fusce pellentesque est vitae est molestie posuere. Donec nibh elit, condimentum ac tristique non, interdum id urna.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at ultricies nisl. Morbi et aliquet diam. Pellentesque sit amet enim ipsum. Nullam consequat ut dui ut sagittis. Nulla dignissim cursus tellus, eu sagittis leo gravida interdum. In porttitor, diam eget facilisis laoreet, turpis erat commodo sem, nec vestibulum lectus elit non tellus. Donec sit amet cursus diam, in rhoncus tellus. Nulla semper dui diam, eget scelerisque lacus feugiat sit amet. Aenean eros nisl, scelerisque eu consequat sed, sollicitudin sed est.</p>\r\n<p>In hac habitasse platea dictumst. Nunc blandit, tortor ac placerat gravida, est orci faucibus nisi, sit amet placerat massa tortor et magna. Mauris fermentum tristique euismod. Aenean augue orci, sagittis quis est et, maximus lobortis ipsum. Pellentesque luctus vulputate sodales. Proin mattis diam non ex faucibus finibus. Donec viverra lectus quis ipsum viverra, in cursus diam varius. Cras feugiat dictum tellus vel pellentesque. Phasellus at aliquet lacus, rhoncus interdum turpis. Sed massa tortor, aliquam auctor maximus non, dignissim auctor libero. Integer lacus quam, finibus at sagittis eu, blandit quis nulla. Donec tincidunt nisl vulputate blandit malesuada. In ac posuere purus. Morbi bibendum, lorem ac aliquam ultricies, elit ante pellentesque metus, sed finibus est dui vel lectus. Morbi nulla felis, vehicula id interdum sed, mattis eget ligula.</p>\r\n<p>Donec tortor urna, venenatis fermentum odio id, bibendum egestas quam. Maecenas maximus eleifend mi vel gravida. Maecenas ullamcorper dictum leo eu aliquam. Ut iaculis fringilla enim non accumsan. Mauris diam felis, congue vehicula ex ac, pretium efficitur est. Nulla suscipit, justo eget condimentum consectetur, erat felis rhoncus enim, a maximus diam diam sed nisl. Ut ultricies eu ligula scelerisque tempor. Aenean lectus purus, placerat a justo vel, consectetur malesuada risus. Etiam non consequat quam, id mattis justo. Nunc metus tellus, malesuada ultrices massa a, vehicula interdum libero. Sed in lorem vel nisl dictum aliquam in at risus. In et sollicitudin dolor, tristique convallis libero. Quisque id semper ex. Nullam tincidunt accumsan commodo. Aliquam lobortis, tortor quis elementum tincidunt, sem augue rhoncus nunc, quis vulputate magna dui ut lectus.</p>\r\n<p>Pellentesque at elit sed quam ullamcorper elementum. Sed volutpat orci a vulputate varius. In at felis nec odio posuere fermentum sit amet in mauris. Pellentesque turpis elit, vulputate in risus vitae, convallis malesuada augue. Sed et feugiat nunc, tempus fermentum urna. Phasellus rhoncus condimentum justo, quis consequat massa porttitor at. Donec a erat ac augue posuere condimentum tincidunt eu velit. Nam malesuada hendrerit pulvinar. Sed convallis tincidunt arcu, ac rutrum nisi rutrum non. Praesent nec quam finibus, lobortis augue vitae, pellentesque nibh.</p>\r\n<p><img src=\"http://localhost:8000/storage/posts/October2022/FfMGmjyagAE6bGL1.jpg\" alt=\"\" width=\"321\" height=\"355\"></p>', 'posts\\October2022\\XyuknEjt8921d74OhnNS.jpeg', 'trex-tunai-tarik-tunai-hehehe', 'PUBLISHED', 0, '2022-10-25 03:37:24', '2022-11-17 03:09:59'),
(6, 1, 1, 'Test Post Hari Senin 31 Oktober 2022', 'Fusce pellentesque est vitae est molestie posuere. Donec nibh elit, condimentum ac tristique non, interdum id urna...', '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a auctor neque. Aliquam ac dui nec felis molestie fringilla ac sed orci. Vivamus ultricies porta commodo. Maecenas tincidunt quam leo, sit amet sodales magna consequat non. In lacinia sed turpis non suscipit. Nam tincidunt aliquam consectetur. Pellentesque non efficitur nibh, sit amet vehicula lectus. Morbi ac lacinia lorem.</p>\r\n<p>Maecenas pretium elit sapien, sed porttitor diam porttitor at. In hac habitasse platea dictumst. Aenean suscipit velit nisl, eget ultricies enim aliquam vel. Curabitur accumsan lacus vel risus venenatis faucibus. Quisque cursus aliquet nisi, et fringilla lorem. Vivamus egestas non orci nec iaculis. Sed vel quam in dolor lacinia sagittis at sit amet dolor.</p>\r\n<p>Vivamus vel nisl urna. Maecenas vulputate ex sapien, suscipit sodales orci tristique euismod. In sagittis enim vel turpis consequat eleifend. Cras dictum libero vitae finibus dictum. Morbi maximus augue at maximus ullamcorper. Curabitur hendrerit vestibulum tellus ut gravida. Integer id neque nisl. Proin imperdiet mi in justo luctus blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n<p>Fusce pellentesque est vitae est molestie posuere. Donec nibh elit, condimentum ac tristique non, interdum id urna. Fusce commodo ultrices erat, nec fermentum dolor pellentesque vitae. Pellentesque egestas luctus sapien cursus ornare. Quisque dui velit, venenatis quis egestas eu, dapibus sed augue. Nam malesuada euismod tortor in euismod. Nunc pulvinar porttitor consequat. Curabitur neque nisl, lacinia sit amet nisi in, varius molestie diam. Morbi blandit ultrices turpis sit amet suscipit.</p>\r\n<p>In tortor lectus, interdum a vestibulum quis, luctus id elit. Proin aliquam pretium eros ac hendrerit. Nunc efficitur rutrum lectus, nec scelerisque risus scelerisque at. Sed porttitor pulvinar nunc a placerat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum eu ipsum malesuada, laoreet tellus vitae, malesuada erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;</p>\r\n</div>\r\n<div id=\"generated\"><strong>Generated 5 paragraphs, 302 words, 2076 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></strong></div>', 'posts\\October2022\\Ii2T6KnnkdlOjvDnAa3T.png', 'test-post-hari-senin-31-oktober-2022', 'PUBLISHED', 0, '2022-10-30 19:43:31', '2022-11-17 03:09:11'),
(7, 1, 2, 'Judul Title', 'Nam eget commodo sem. Cras risus velit, rhoncus sed mattis a, sollicitudin id metus. Vivamus quis condimentum ante,..', '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at ultricies nisl. Morbi et aliquet diam. Pellentesque sit amet enim ipsum. Nullam consequat ut dui ut sagittis. Nulla dignissim cursus tellus, eu sagittis leo gravida interdum. In porttitor, diam eget facilisis laoreet, turpis erat commodo sem, nec vestibulum lectus elit non tellus. Donec sit amet cursus diam, in rhoncus tellus. Nulla semper dui diam, eget scelerisque lacus feugiat sit amet. Aenean eros nisl, scelerisque eu consequat sed, sollicitudin sed est.</p>\r\n<p>In hac habitasse platea dictumst. Nunc blandit, tortor ac placerat gravida, est orci faucibus nisi, sit amet placerat massa tortor et magna. Mauris fermentum tristique euismod. Aenean augue orci, sagittis quis est et, maximus lobortis ipsum. Pellentesque luctus vulputate sodales. Proin mattis diam non ex faucibus finibus. Donec viverra lectus quis ipsum viverra, in cursus diam varius. Cras feugiat dictum tellus vel pellentesque. Phasellus at aliquet lacus, rhoncus interdum turpis. Sed massa tortor, aliquam auctor maximus non, dignissim auctor libero. Integer lacus quam, finibus at sagittis eu, blandit quis nulla. Donec tincidunt nisl vulputate blandit malesuada. In ac posuere purus. Morbi bibendum, lorem ac aliquam ultricies, elit ante pellentesque metus, sed finibus est dui vel lectus. Morbi nulla felis, vehicula id interdum sed, mattis eget ligula.</p>\r\n<p>Donec tortor urna, venenatis fermentum odio id, bibendum egestas quam. Maecenas maximus eleifend mi vel gravida. Maecenas ullamcorper dictum leo eu aliquam. Ut iaculis fringilla enim non accumsan. Mauris diam felis, congue vehicula ex ac, pretium efficitur est. Nulla suscipit, justo eget condimentum consectetur, erat felis rhoncus enim, a maximus diam diam sed nisl. Ut ultricies eu ligula scelerisque tempor. Aenean lectus purus, placerat a justo vel, consectetur malesuada risus. Etiam non consequat quam, id mattis justo. Nunc metus tellus, malesuada ultrices massa a, vehicula interdum libero. Sed in lorem vel nisl dictum aliquam in at risus. In et sollicitudin dolor, tristique convallis libero. Quisque id semper ex. Nullam tincidunt accumsan commodo. Aliquam lobortis, tortor quis elementum tincidunt, sem augue rhoncus nunc, quis vulputate magna dui ut lectus.</p>\r\n<p>Pellentesque at elit sed quam ullamcorper elementum. Sed volutpat orci a vulputate varius. In at felis nec odio posuere fermentum sit amet in mauris. Pellentesque turpis elit, vulputate in risus vitae, convallis malesuada augue. Sed et feugiat nunc, tempus fermentum urna. Phasellus rhoncus condimentum justo, quis consequat massa porttitor at. Donec a erat ac augue posuere condimentum tincidunt eu velit. Nam malesuada hendrerit pulvinar. Sed convallis tincidunt arcu, ac rutrum nisi rutrum non. Praesent nec quam finibus, lobortis augue vitae, pellentesque nibh.</p>\r\n<p>Aenean ultrices eros nulla, ut suscipit sapien rutrum eu. Morbi tempus ut neque eget tristique. Donec aliquam diam mauris, eget congue enim commodo ut. Sed sodales tortor eu risus molestie, non vehicula nisi posuere. Suspendisse sit amet viverra magna. Aliquam varius lectus ac luctus ultricies. Nam scelerisque felis dolor, nec rhoncus justo fringilla non. Pellentesque semper dui a eleifend congue. Nulla sollicitudin dolor at venenatis semper. Curabitur id est vel massa maximus elementum suscipit nec purus. Curabitur quis varius mauris.</p>\r\n<p>Cras maximus lacus ac consectetur sagittis. Ut et tincidunt felis. Maecenas sit amet velit pharetra, dignissim nisi a, euismod urna. Suspendisse potenti. Phasellus at sollicitudin ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas iaculis imperdiet dignissim. Vestibulum lacinia metus eu libero rhoncus, scelerisque aliquet turpis aliquet.</p>\r\n<p>Pellentesque vel diam nec nulla maximus congue sed eget diam. Nulla et consequat mi. Nulla eu efficitur sem. Vivamus blandit ac tortor eu malesuada. In sit amet est lacus. Integer malesuada, sapien lobortis aliquam placerat, metus ligula mattis mi, eu aliquam urna mauris at mauris. Vivamus hendrerit est eget tellus cursus eleifend. Quisque porta congue neque, ac porta metus porta at. Proin eget arcu fermentum, scelerisque massa eget, luctus lectus. In nec neque nisi. Duis convallis posuere diam id placerat. Curabitur et ex iaculis, tincidunt justo vel, dictum lectus.</p>\r\n<p>Nam eget commodo sem. Cras risus velit, rhoncus sed mattis a, sollicitudin id metus. Vivamus quis condimentum ante, sed imperdiet orci. In sit amet augue massa. Vivamus vehicula purus justo. In vel gravida turpis, eget finibus ipsum. Aliquam ac nisi nulla. Morbi et ante vitae lorem vehicula semper. Proin vitae massa gravida, ultricies nisl lobortis, scelerisque mi. Praesent a facilisis lacus. Suspendisse et magna vitae nunc cursus aliquet. Etiam vel eleifend diam, eget consectetur metus. Mauris eu malesuada eros, et faucibus neque.</p>\r\n</div>\r\n<div id=\"generated\">Generated 8 paragraphs, 719 words, 4866 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></div>', 'posts\\October2022\\3tJhKpkduIMGXE30hcTI.png', 'judul-title', 'PUBLISHED', 1, '2022-10-30 19:52:39', '2022-11-17 03:08:47'),
(10, 1, 3, 'ipsum', 'Lorem ipsum dolor sit amet, consectetur adipisci...</p>', '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a auctor neque. Aliquam ac dui nec felis molestie fringilla ac sed orci. Vivamus ultricies porta commodo. Maecenas tincidunt quam leo, sit amet sodales magna consequat non. In lacinia sed turpis non suscipit. Nam tincidunt aliquam consectetur. Pellentesque non efficitur nibh, sit amet vehicula lectus. Morbi ac lacinia lorem.</p>\r\n<p>Maecenas pretium elit sapien, sed porttitor diam porttitor at. In hac habitasse platea dictumst. Aenean suscipit velit nisl, eget ultricies enim aliquam vel. Curabitur accumsan lacus vel risus venenatis faucibus. Quisque cursus aliquet nisi, et fringilla lorem. Vivamus egestas non orci nec iaculis. Sed vel quam in dolor lacinia sagittis at sit amet dolor.</p>\r\n<p>Vivamus vel nisl urna. Maecenas vulputate ex sapien, suscipit sodales orci tristique euismod. In sagittis enim vel turpis consequat eleifend. Cras dictum libero vitae finibus dictum. Morbi maximus augue at maximus ullamcorper. Curabitur hendrerit vestibulum tellus ut gravida. Integer id neque nisl. Proin imperdiet mi in justo luctus blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n<p>Fusce pellentesque est vitae est molestie posuere. Donec nibh elit, condimentum ac tristique non, interdum id urna. Fusce commodo ultrices erat, nec fermentum dolor pellentesque vitae. Pellentesque egestas luctus sapien cursus ornare. Quisque dui velit, venenatis quis egestas eu, dapibus sed augue. Nam malesuada euismod tortor in euismod. Nunc pulvinar porttitor consequat. Curabitur neque nisl, lacinia sit amet nisi in, varius molestie diam. Morbi blandit ultrices turpis sit amet suscipit.</p>\r\n<p>In tortor lectus, interdum a vestibulum quis, luctus id elit. Proin aliquam pretium eros ac hendrerit. Nunc efficitur rutrum lectus, nec scelerisque risus scelerisque at. Sed porttitor pulvinar nunc a placerat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum eu ipsum malesuada, laoreet tellus vitae, malesuada erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;</p>\r\n</div>\r\n<div id=\"generated\"><strong>Generated 5 paragraphs, 302 words, 2076 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></strong></div>', NULL, 'ipsum', 'PUBLISHED', 0, '2022-10-30 20:21:30', '2022-11-03 20:51:31'),
(11, 1, 1, 'lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a auctor neque. Aliquam ac dui nec felis molesti...', '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a auctor neque. Aliquam ac dui nec felis molestie fringilla ac sed orci. Vivamus ultricies porta commodo. Maecenas tincidunt quam leo, sit amet sodales magna consequat non. In lacinia sed turpis non suscipit. Nam tincidunt aliquam consectetur. Pellentesque non efficitur nibh, sit amet vehicula lectus. Morbi ac lacinia lorem.</p>\r\n<p>Maecenas pretium elit sapien, sed porttitor diam porttitor at. In hac habitasse platea dictumst. Aenean suscipit velit nisl, eget ultricies enim aliquam vel. Curabitur accumsan lacus vel risus venenatis faucibus. Quisque cursus aliquet nisi, et fringilla lorem. Vivamus egestas non orci nec iaculis. Sed vel quam in dolor lacinia sagittis at sit amet dolor.</p>\r\n<p>Vivamus vel nisl urna. Maecenas vulputate ex sapien, suscipit sodales orci tristique euismod. In sagittis enim vel turpis consequat eleifend. Cras dictum libero vitae finibus dictum. Morbi maximus augue at maximus ullamcorper. Curabitur hendrerit vestibulum tellus ut gravida. Integer id neque nisl. Proin imperdiet mi in justo luctus blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n<p>Fusce pellentesque est vitae est molestie posuere. Donec nibh elit, condimentum ac tristique non, interdum id urna. Fusce commodo ultrices erat, nec fermentum dolor pellentesque vitae. Pellentesque egestas luctus sapien cursus ornare. Quisque dui velit, venenatis quis egestas eu, dapibus sed augue. Nam malesuada euismod tortor in euismod. Nunc pulvinar porttitor consequat. Curabitur neque nisl, lacinia sit amet nisi in, varius molestie diam. Morbi blandit ultrices turpis sit amet suscipit.</p>\r\n<p>In tortor lectus, interdum a vestibulum quis, luctus id elit. Proin aliquam pretium eros ac hendrerit. Nunc efficitur rutrum lectus, nec scelerisque risus scelerisque at. Sed porttitor pulvinar nunc a placerat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum eu ipsum malesuada, laoreet tellus vitae, malesuada erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;</p>\r\n</div>\r\n<div id=\"generated\"><strong>Generated 5 paragraphs, 302 words, 2076 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></strong></div>', NULL, 'lorem', 'PUBLISHED', 0, '2022-10-30 20:22:24', '2022-11-03 20:50:12'),
(12, 1, 2, 'Test Featured Post', 'Featured Post', '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at ultricies nisl. Morbi et aliquet diam. Pellentesque sit amet enim ipsum. Nullam consequat ut dui ut sagittis. Nulla dignissim cursus tellus, eu sagittis leo gravida interdum. In porttitor, diam eget facilisis laoreet, turpis erat commodo sem, nec vestibulum lectus elit non tellus. Donec sit amet cursus diam, in rhoncus tellus. Nulla semper dui diam, eget scelerisque lacus feugiat sit amet. Aenean eros nisl, scelerisque eu consequat sed, sollicitudin sed est.</p>\r\n<p>In hac habitasse platea dictumst. Nunc blandit, tortor ac placerat gravida, est orci faucibus nisi, sit amet placerat massa tortor et magna. Mauris fermentum tristique euismod. Aenean augue orci, sagittis quis est et, maximus lobortis ipsum. Pellentesque luctus vulputate sodales. Proin mattis diam non ex faucibus finibus. Donec viverra lectus quis ipsum viverra, in cursus diam varius. Cras feugiat dictum tellus vel pellentesque. Phasellus at aliquet lacus, rhoncus interdum turpis. Sed massa tortor, aliquam auctor maximus non, dignissim auctor libero. Integer lacus quam, finibus at sagittis eu, blandit quis nulla. Donec tincidunt nisl vulputate blandit malesuada. In ac posuere purus. Morbi bibendum, lorem ac aliquam ultricies, elit ante pellentesque metus, sed finibus est dui vel lectus. Morbi nulla felis, vehicula id interdum sed, mattis eget ligula.</p>\r\n<p>Donec tortor urna, venenatis fermentum odio id, bibendum egestas quam. Maecenas maximus eleifend mi vel gravida. Maecenas ullamcorper dictum leo eu aliquam. Ut iaculis fringilla enim non accumsan. Mauris diam felis, congue vehicula ex ac, pretium efficitur est. Nulla suscipit, justo eget condimentum consectetur, erat felis rhoncus enim, a maximus diam diam sed nisl. Ut ultricies eu ligula scelerisque tempor. Aenean lectus purus, placerat a justo vel, consectetur malesuada risus. Etiam non consequat quam, id mattis justo. Nunc metus tellus, malesuada ultrices massa a, vehicula interdum libero. Sed in lorem vel nisl dictum aliquam in at risus. In et sollicitudin dolor, tristique convallis libero. Quisque id semper ex. Nullam tincidunt accumsan commodo. Aliquam lobortis, tortor quis elementum tincidunt, sem augue rhoncus nunc, quis vulputate magna dui ut lectus.</p>\r\n<p>Pellentesque at elit sed quam ullamcorper elementum. Sed volutpat orci a vulputate varius. In at felis nec odio posuere fermentum sit amet in mauris. Pellentesque turpis elit, vulputate in risus vitae, convallis malesuada augue. Sed et feugiat nunc, tempus fermentum urna. Phasellus rhoncus condimentum justo, quis consequat massa porttitor at. Donec a erat ac augue posuere condimentum tincidunt eu velit. Nam malesuada hendrerit pulvinar. Sed convallis tincidunt arcu, ac rutrum nisi rutrum non. Praesent nec quam finibus, lobortis augue vitae, pellentesque nibh.</p>\r\n<p>Aenean ultrices eros nulla, ut suscipit sapien rutrum eu. Morbi tempus ut neque eget tristique. Donec aliquam diam mauris, eget congue enim commodo ut. Sed sodales tortor eu risus molestie, non vehicula nisi posuere. Suspendisse sit amet viverra magna. Aliquam varius lectus ac luctus ultricies. Nam scelerisque felis dolor, nec rhoncus justo fringilla non. Pellentesque semper dui a eleifend congue. Nulla sollicitudin dolor at venenatis semper. Curabitur id est vel massa maximus elementum suscipit nec purus. Curabitur quis varius mauris.</p>\r\n<p>Cras maximus lacus ac consectetur sagittis. Ut et tincidunt felis. Maecenas sit amet velit pharetra, dignissim nisi a, euismod urna. Suspendisse potenti. Phasellus at sollicitudin ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas iaculis imperdiet dignissim. Vestibulum lacinia metus eu libero rhoncus, scelerisque aliquet turpis aliquet.</p>\r\n<p>Pellentesque vel diam nec nulla maximus congue sed eget diam. Nulla et consequat mi. Nulla eu efficitur sem. Vivamus blandit ac tortor eu malesuada. In sit amet est lacus. Integer malesuada, sapien lobortis aliquam placerat, metus ligula mattis mi, eu aliquam urna mauris at mauris. Vivamus hendrerit est eget tellus cursus eleifend. Quisque porta congue neque, ac porta metus porta at. Proin eget arcu fermentum, scelerisque massa eget, luctus lectus. In nec neque nisi. Duis convallis posuere diam id placerat. Curabitur et ex iaculis, tincidunt justo vel, dictum lectus.</p>\r\n<p>Nam eget commodo sem. Cras risus velit, rhoncus sed mattis a, sollicitudin id metus. Vivamus quis condimentum ante, sed imperdiet orci. In sit amet augue massa. Vivamus vehicula purus justo. In vel gravida turpis, eget finibus ipsum. Aliquam ac nisi nulla. Morbi et ante vitae lorem vehicula semper. Proin vitae massa gravida, ultricies nisl lobortis, scelerisque mi. Praesent a facilisis lacus. Suspendisse et magna vitae nunc cursus aliquet. Etiam vel eleifend diam, eget consectetur metus. Mauris eu malesuada eros, et faucibus neque.</p>\r\n</div>\r\n<div id=\"generated\">Generated 8 paragraphs, 719 words, 4866 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></div>', 'posts\\November2022\\bX8fPBTguI9O7LDiI7NR.jpg', 'test-featured-post', 'PUBLISHED', 0, '2022-11-03 20:03:56', '2022-11-17 03:06:42'),
(13, 1, 1, 'sluggersable', NULL, '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at ultricies nisl. Morbi et aliquet diam. Pellentesque sit amet enim ipsum. Nullam consequat ut dui ut sagittis. Nulla dignissim cursus tellus, eu sagittis leo gravida interdum. In porttitor, diam eget facilisis laoreet, turpis erat commodo sem, nec vestibulum lectus elit non tellus. Donec sit amet cursus diam, in rhoncus tellus. Nulla semper dui diam, eget scelerisque lacus feugiat sit amet. Aenean eros nisl, scelerisque eu consequat sed, sollicitudin sed est.</p>\r\n<p>In hac habitasse platea dictumst. Nunc blandit, tortor ac placerat gravida, est orci faucibus nisi, sit amet placerat massa tortor et magna. Mauris fermentum tristique euismod. Aenean augue orci, sagittis quis est et, maximus lobortis ipsum. Pellentesque luctus vulputate sodales. Proin mattis diam non ex faucibus finibus. Donec viverra lectus quis ipsum viverra, in cursus diam varius. Cras feugiat dictum tellus vel pellentesque. Phasellus at aliquet lacus, rhoncus interdum turpis. Sed massa tortor, aliquam auctor maximus non, dignissim auctor libero. Integer lacus quam, finibus at sagittis eu, blandit quis nulla. Donec tincidunt nisl vulputate blandit malesuada. In ac posuere purus. Morbi bibendum, lorem ac aliquam ultricies, elit ante pellentesque metus, sed finibus est dui vel lectus. Morbi nulla felis, vehicula id interdum sed, mattis eget ligula.</p>\r\n<p>Donec tortor urna, venenatis fermentum odio id, bibendum egestas quam. Maecenas maximus eleifend mi vel gravida. Maecenas ullamcorper dictum leo eu aliquam. Ut iaculis fringilla enim non accumsan. Mauris diam felis, congue vehicula ex ac, pretium efficitur est. Nulla suscipit, justo eget condimentum consectetur, erat felis rhoncus enim, a maximus diam diam sed nisl. Ut ultricies eu ligula scelerisque tempor. Aenean lectus purus, placerat a justo vel, consectetur malesuada risus. Etiam non consequat quam, id mattis justo. Nunc metus tellus, malesuada ultrices massa a, vehicula interdum libero. Sed in lorem vel nisl dictum aliquam in at risus. In et sollicitudin dolor, tristique convallis libero. Quisque id semper ex. Nullam tincidunt accumsan commodo. Aliquam lobortis, tortor quis elementum tincidunt, sem augue rhoncus nunc, quis vulputate magna dui ut lectus.</p>\r\n<p>Pellentesque at elit sed quam ullamcorper elementum. Sed volutpat orci a vulputate varius. In at felis nec odio posuere fermentum sit amet in mauris. Pellentesque turpis elit, vulputate in risus vitae, convallis malesuada augue. Sed et feugiat nunc, tempus fermentum urna. Phasellus rhoncus condimentum justo, quis consequat massa porttitor at. Donec a erat ac augue posuere condimentum tincidunt eu velit. Nam malesuada hendrerit pulvinar. Sed convallis tincidunt arcu, ac rutrum nisi rutrum non. Praesent nec quam finibus, lobortis augue vitae, pellentesque nibh.</p>\r\n<p>Aenean ultrices eros nulla, ut suscipit sapien rutrum eu. Morbi tempus ut neque eget tristique. Donec aliquam diam mauris, eget congue enim commodo ut. Sed sodales tortor eu risus molestie, non vehicula nisi posuere. Suspendisse sit amet viverra magna. Aliquam varius lectus ac luctus ultricies. Nam scelerisque felis dolor, nec rhoncus justo fringilla non. Pellentesque semper dui a eleifend congue. Nulla sollicitudin dolor at venenatis semper. Curabitur id est vel massa maximus elementum suscipit nec purus. Curabitur quis varius mauris.</p>\r\n<p>Cras maximus lacus ac consectetur sagittis. Ut et tincidunt felis. Maecenas sit amet velit pharetra, dignissim nisi a, euismod urna. Suspendisse potenti. Phasellus at sollicitudin ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas iaculis imperdiet dignissim. Vestibulum lacinia metus eu libero rhoncus, scelerisque aliquet turpis aliquet.</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://localhost:8000/storage/posts/November2022/Pembinaan Admin Metadata 2022.png\" alt=\"\" width=\"392\" height=\"221\"></p>\r\n<p>Pellentesque vel diam nec nulla maximus congue sed eget diam. Nulla et consequat mi. Nulla eu efficitur sem. Vivamus blandit ac tortor eu malesuada. In sit amet est lacus. Integer malesuada, sapien lobortis aliquam placerat, metus ligula mattis mi, eu aliquam urna mauris at mauris. Vivamus hendrerit est eget tellus cursus eleifend. Quisque porta congue neque, ac porta metus porta at. Proin eget arcu fermentum, scelerisque massa eget, luctus lectus. In nec neque nisi. Duis convallis posuere diam id placerat. Curabitur et ex iaculis, tincidunt justo vel, dictum lectus.</p>\r\n<p>Nam eget commodo sem. Cras risus velit, rhoncus sed mattis a, sollicitudin id metus. Vivamus quis condimentum ante, sed imperdiet orci. In sit amet augue massa. Vivamus vehicula purus justo. In vel gravida turpis, eget finibus ipsum. Aliquam ac nisi nulla. Morbi et ante vitae lorem vehicula semper. Proin vitae massa gravida, ultricies nisl lobortis, scelerisque mi. Praesent a facilisis lacus. Suspendisse et magna vitae nunc cursus aliquet. Etiam vel eleifend diam, eget consectetur metus. Mauris eu malesuada eros, et faucibus neque.</p>\r\n</div>\r\n<div id=\"generated\">Generated 8 paragraphs, 719 words, 4866 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></div>', NULL, 'sluggersable', 'PUBLISHED', 0, '2022-11-07 21:00:53', '2022-11-17 03:07:58'),
(14, 1, 1, 'Judul Berita 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at ultricies nisl. Morbi et aliquet diam. Pellentesque sit amet enim ipsum...', '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at ultricies nisl. Morbi et aliquet diam. Pellentesque sit amet enim ipsum. Nullam consequat ut dui ut sagittis. Nulla dignissim cursus tellus, eu sagittis leo gravida interdum. In porttitor, diam eget facilisis laoreet, turpis erat commodo sem, nec vestibulum lectus elit non tellus. Donec sit amet cursus diam, in rhoncus tellus. Nulla semper dui diam, eget scelerisque lacus feugiat sit amet. Aenean eros nisl, scelerisque eu consequat sed, sollicitudin sed est.</p>\r\n<p>In hac habitasse platea dictumst. Nunc blandit, tortor ac placerat gravida, est orci faucibus nisi, sit amet placerat massa tortor et magna. Mauris fermentum tristique euismod. Aenean augue orci, sagittis quis est et, maximus lobortis ipsum. Pellentesque luctus vulputate sodales. Proin mattis diam non ex faucibus finibus. Donec viverra lectus quis ipsum viverra, in cursus diam varius. Cras feugiat dictum tellus vel pellentesque. Phasellus at aliquet lacus, rhoncus interdum turpis. Sed massa tortor, aliquam auctor maximus non, dignissim auctor libero. Integer lacus quam, finibus at sagittis eu, blandit quis nulla. Donec tincidunt nisl vulputate blandit malesuada. In ac posuere purus. Morbi bibendum, lorem ac aliquam ultricies, elit ante pellentesque metus, sed finibus est dui vel lectus. Morbi nulla felis, vehicula id interdum sed, mattis eget ligula.</p>\r\n<p>Donec tortor urna, venenatis fermentum odio id, bibendum egestas quam. Maecenas maximus eleifend mi vel gravida. Maecenas ullamcorper dictum leo eu aliquam. Ut iaculis fringilla enim non accumsan. Mauris diam felis, congue vehicula ex ac, pretium efficitur est. Nulla suscipit, justo eget condimentum consectetur, erat felis rhoncus enim, a maximus diam diam sed nisl. Ut ultricies eu ligula scelerisque tempor. Aenean lectus purus, placerat a justo vel, consectetur malesuada risus. Etiam non consequat quam, id mattis justo. Nunc metus tellus, malesuada ultrices massa a, vehicula interdum libero. Sed in lorem vel nisl dictum aliquam in at risus. In et sollicitudin dolor, tristique convallis libero. Quisque id semper ex. Nullam tincidunt accumsan commodo. Aliquam lobortis, tortor quis elementum tincidunt, sem augue rhoncus nunc, quis vulputate magna dui ut lectus.</p>\r\n<p>Pellentesque at elit sed quam ullamcorper elementum. Sed volutpat orci a vulputate varius. In at felis nec odio posuere fermentum sit amet in mauris. Pellentesque turpis elit, vulputate in risus vitae, convallis malesuada augue. Sed et feugiat nunc, tempus fermentum urna. Phasellus rhoncus condimentum justo, quis consequat massa porttitor at. Donec a erat ac augue posuere condimentum tincidunt eu velit. Nam malesuada hendrerit pulvinar. Sed convallis tincidunt arcu, ac rutrum nisi rutrum non. Praesent nec quam finibus, lobortis augue vitae, pellentesque nibh.</p>\r\n<p>Aenean ultrices eros nulla, ut suscipit sapien rutrum eu. Morbi tempus ut neque eget tristique. Donec aliquam diam mauris, eget congue enim commodo ut. Sed sodales tortor eu risus molestie, non vehicula nisi posuere. Suspendisse sit amet viverra magna. Aliquam varius lectus ac luctus ultricies. Nam scelerisque felis dolor, nec rhoncus justo fringilla non. Pellentesque semper dui a eleifend congue. Nulla sollicitudin dolor at venenatis semper. Curabitur id est vel massa maximus elementum suscipit nec purus. Curabitur quis varius mauris.</p>\r\n<p>Cras maximus lacus ac consectetur sagittis. Ut et tincidunt felis. Maecenas sit amet velit pharetra, dignissim nisi a, euismod urna. Suspendisse potenti. Phasellus at sollicitudin ante. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas iaculis imperdiet dignissim. Vestibulum lacinia metus eu libero rhoncus, scelerisque aliquet turpis aliquet.</p>\r\n<p>Pellentesque vel diam nec nulla maximus congue sed eget diam. Nulla et consequat mi. Nulla eu efficitur sem. Vivamus blandit ac tortor eu malesuada. In sit amet est lacus. Integer malesuada, sapien lobortis aliquam placerat, metus ligula mattis mi, eu aliquam urna mauris at mauris. Vivamus hendrerit est eget tellus cursus eleifend. Quisque porta congue neque, ac porta metus porta at. Proin eget arcu fermentum, scelerisque massa eget, luctus lectus. In nec neque nisi. Duis convallis posuere diam id placerat. Curabitur et ex iaculis, tincidunt justo vel, dictum lectus.</p>\r\n<p>Nam eget commodo sem. Cras risus velit, rhoncus sed mattis a, sollicitudin id metus. Vivamus quis condimentum ante, sed imperdiet orci. In sit amet augue massa. Vivamus vehicula purus justo. In vel gravida turpis, eget finibus ipsum. Aliquam ac nisi nulla. Morbi et ante vitae lorem vehicula semper. Proin vitae massa gravida, ultricies nisl lobortis, scelerisque mi. Praesent a facilisis lacus. Suspendisse et magna vitae nunc cursus aliquet. Etiam vel eleifend diam, eget consectetur metus. Mauris eu malesuada eros, et faucibus neque.</p>\r\n</div>\r\n<div id=\"generated\"><strong>Generated 8 paragraphs, 719 words, 4866 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></strong></div>', 'posts\\November2022\\r4pUMO3GjHOVS4okrn7f.png', 'judul-berita-2', 'PUBLISHED', 1, '2022-11-07 21:03:21', '2022-11-17 03:05:38'),
(16, 2, 4, 'Lorem Ipsum Title Post', 'What is Lorem Ipsum?\r\nLorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has...', '<div>\r\n<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n</div>\r\n<div>\r\n<h2>Why do we use it?</h2>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n</div>\r\n<p>&nbsp;</p>\r\n<div>\r\n<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n</div>\r\n<div>\r\n<h2>Where can I get some?</h2>\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n</div>', 'posts\\November2022\\eNy4OaQNJrkHPJJvpM69.jpg', 'lorem-ipsum-title-post', 'PUBLISHED', 1, '2022-11-16 03:22:40', '2022-11-17 03:02:39'),
(17, 2, 1, 'Pemeriksaan gula darah dan tensi warga watas lubuk durian', 'kegiatan pemeriksaan gula darah', '<p>kegiatan pemeriksaan gula darah</p>', NULL, 'pemeriksaan-gula-darah-dan-tensi-warga-watas-lubuk-durian', 'PUBLISHED', 0, '2022-11-17 04:21:38', '2022-11-17 04:21:38'),
(18, 2, 1, 'Judul Tambah 1', '\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum accumsan condimentum vestibulum. Suspendisse in ni...', '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum accumsan condimentum vestibulum. Suspendisse in nibh molestie, luctus elit in, egestas quam. Vivamus sollicitudin ligula non elit condimentum viverra. Morbi augue arcu, vehicula vitae orci id, vestibulum porttitor est. Aliquam faucibus eu sem ut imperdiet. Nullam non nisi sit amet arcu euismod dignissim vel ac turpis. Maecenas convallis placerat dolor, non tincidunt justo sagittis vitae. Suspendisse justo eros, maximus non erat id, fringilla luctus diam. Nam magna leo, blandit vitae orci a, pulvinar vestibulum lorem. Curabitur vulputate turpis ornare aliquam mollis. Nullam a ante eget ipsum imperdiet sagittis. In quis nulla lorem. Maecenas ligula eros, molestie in nulla eu, aliquam accumsan orci. Suspendisse feugiat orci ac dictum tincidunt.</p>\r\n<p>Morbi eget mattis est, a pharetra enim. Vestibulum sagittis sem quis lacus tristique placerat. Sed eget justo eleifend, sagittis ex elementum, porttitor tellus. Mauris dictum massa ut tempus blandit. Maecenas et euismod mauris. Vivamus turpis mi, imperdiet ac molestie egestas, malesuada eu neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas scelerisque, est in mattis egestas, diam risus dapibus odio, non accumsan orci lacus ut felis. Praesent lobortis turpis eu mi rhoncus efficitur. Maecenas aliquet, ante sed molestie ultricies, justo turpis facilisis ex, sit amet venenatis quam tellus ac risus. Cras sagittis massa et augue convallis, vel tincidunt tortor ultricies. Pellentesque aliquet nec tortor eu feugiat. Nunc est augue, elementum ut nunc in, scelerisque eleifend purus. Fusce quis sapien ultrices, lobortis mi in, pharetra est.</p>\r\n<p>Maecenas vitae nisl justo. Aenean tincidunt sollicitudin ipsum, non volutpat odio maximus varius. Sed eu sem ligula. Ut mattis arcu sit amet turpis finibus, sit amet elementum nisl pulvinar. Aliquam nec euismod erat. Etiam in tincidunt nisi. Phasellus facilisis orci id eros pellentesque aliquam. Aliquam sed lobortis diam. Curabitur scelerisque nunc ac est commodo pharetra.</p>\r\n<p>Cras tempus interdum magna, vitae imperdiet nibh placerat eu. Nam id eros egestas, luctus metus quis, aliquet ipsum. Praesent justo ex, imperdiet nec vehicula sed, dictum eget turpis. Aenean at molestie dui. Mauris accumsan mattis urna, at convallis eros consectetur sit amet. Nunc eleifend dolor vel neque imperdiet, at interdum ante eleifend. Aliquam congue, dui vel facilisis aliquet, mi turpis faucibus ligula, a pretium tortor nibh tempus ex. Cras tortor mauris, dictum sit amet sodales ut, ultrices quis lorem. Etiam ullamcorper, nibh eu semper suscipit, odio ipsum convallis dolor, et facilisis justo libero at justo. Etiam nec mattis neque, congue auctor elit. Quisque tellus mauris, bibendum non dolor et, convallis pretium tortor.</p>\r\n<p>Duis suscipit ornare nisl quis tempor. Nunc et aliquam metus, sed auctor ante. Vestibulum semper dolor id magna tristique, sed efficitur mauris tincidunt. Fusce sit amet lacinia urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed varius sapien mi, non suscipit lectus volutpat sit amet. Fusce bibendum diam vitae odio iaculis, eu ornare nunc semper. Proin sit amet elementum augue. Vivamus eros erat, tincidunt at egestas id, faucibus fringilla lectus.</p>\r\n<p>Maecenas feugiat justo eget auctor mattis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut lacinia tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in dui gravida, vehicula enim vel, egestas purus. Phasellus congue tincidunt ornare. Morbi ut mi vel purus fringilla posuere a vitae massa. Phasellus molestie, mauris nec ornare tempus, diam massa aliquam erat, a sodales sem erat quis justo. Sed tempus mi sed purus commodo, at venenatis eros lobortis.</p>\r\n</div>\r\n<div id=\"generated\">Generated 6 paragraphs, 560 words, 3786 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></div>', NULL, 'judul-tambah-1', 'PUBLISHED', 0, '2022-11-22 04:02:04', '2022-11-22 04:02:04'),
(19, 2, 2, 'Judul Tambah 2', '\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum accumsan condimentum vestibulum. Suspendisse in ni...', '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum accumsan condimentum vestibulum. Suspendisse in nibh molestie, luctus elit in, egestas quam. Vivamus sollicitudin ligula non elit condimentum viverra. Morbi augue arcu, vehicula vitae orci id, vestibulum porttitor est. Aliquam faucibus eu sem ut imperdiet. Nullam non nisi sit amet arcu euismod dignissim vel ac turpis. Maecenas convallis placerat dolor, non tincidunt justo sagittis vitae. Suspendisse justo eros, maximus non erat id, fringilla luctus diam. Nam magna leo, blandit vitae orci a, pulvinar vestibulum lorem. Curabitur vulputate turpis ornare aliquam mollis. Nullam a ante eget ipsum imperdiet sagittis. In quis nulla lorem. Maecenas ligula eros, molestie in nulla eu, aliquam accumsan orci. Suspendisse feugiat orci ac dictum tincidunt.</p>\r\n<p>Morbi eget mattis est, a pharetra enim. Vestibulum sagittis sem quis lacus tristique placerat. Sed eget justo eleifend, sagittis ex elementum, porttitor tellus. Mauris dictum massa ut tempus blandit. Maecenas et euismod mauris. Vivamus turpis mi, imperdiet ac molestie egestas, malesuada eu neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas scelerisque, est in mattis egestas, diam risus dapibus odio, non accumsan orci lacus ut felis. Praesent lobortis turpis eu mi rhoncus efficitur. Maecenas aliquet, ante sed molestie ultricies, justo turpis facilisis ex, sit amet venenatis quam tellus ac risus. Cras sagittis massa et augue convallis, vel tincidunt tortor ultricies. Pellentesque aliquet nec tortor eu feugiat. Nunc est augue, elementum ut nunc in, scelerisque eleifend purus. Fusce quis sapien ultrices, lobortis mi in, pharetra est.</p>\r\n<p>Maecenas vitae nisl justo. Aenean tincidunt sollicitudin ipsum, non volutpat odio maximus varius. Sed eu sem ligula. Ut mattis arcu sit amet turpis finibus, sit amet elementum nisl pulvinar. Aliquam nec euismod erat. Etiam in tincidunt nisi. Phasellus facilisis orci id eros pellentesque aliquam. Aliquam sed lobortis diam. Curabitur scelerisque nunc ac est commodo pharetra.</p>\r\n<p>Cras tempus interdum magna, vitae imperdiet nibh placerat eu. Nam id eros egestas, luctus metus quis, aliquet ipsum. Praesent justo ex, imperdiet nec vehicula sed, dictum eget turpis. Aenean at molestie dui. Mauris accumsan mattis urna, at convallis eros consectetur sit amet. Nunc eleifend dolor vel neque imperdiet, at interdum ante eleifend. Aliquam congue, dui vel facilisis aliquet, mi turpis faucibus ligula, a pretium tortor nibh tempus ex. Cras tortor mauris, dictum sit amet sodales ut, ultrices quis lorem. Etiam ullamcorper, nibh eu semper suscipit, odio ipsum convallis dolor, et facilisis justo libero at justo. Etiam nec mattis neque, congue auctor elit. Quisque tellus mauris, bibendum non dolor et, convallis pretium tortor.</p>\r\n<p>Duis suscipit ornare nisl quis tempor. Nunc et aliquam metus, sed auctor ante. Vestibulum semper dolor id magna tristique, sed efficitur mauris tincidunt. Fusce sit amet lacinia urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed varius sapien mi, non suscipit lectus volutpat sit amet. Fusce bibendum diam vitae odio iaculis, eu ornare nunc semper. Proin sit amet elementum augue. Vivamus eros erat, tincidunt at egestas id, faucibus fringilla lectus.</p>\r\n<p>Maecenas feugiat justo eget auctor mattis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut lacinia tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in dui gravida, vehicula enim vel, egestas purus. Phasellus congue tincidunt ornare. Morbi ut mi vel purus fringilla posuere a vitae massa. Phasellus molestie, mauris nec ornare tempus, diam massa aliquam erat, a sodales sem erat quis justo. Sed tempus mi sed purus commodo, at venenatis eros lobortis.</p>\r\n</div>\r\n<div id=\"generated\">Generated 6 paragraphs, 560 words, 3786 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></div>', NULL, 'judul-tambah-2', 'PUBLISHED', 0, '2022-11-22 04:02:27', '2022-11-22 04:02:27');
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `excerpt`, `body`, `image`, `slug`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(20, 2, 3, 'Judul Tambah 3', '\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum accumsan condimentum vestibulum. Suspendisse in ni...', '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum accumsan condimentum vestibulum. Suspendisse in nibh molestie, luctus elit in, egestas quam. Vivamus sollicitudin ligula non elit condimentum viverra. Morbi augue arcu, vehicula vitae orci id, vestibulum porttitor est. Aliquam faucibus eu sem ut imperdiet. Nullam non nisi sit amet arcu euismod dignissim vel ac turpis. Maecenas convallis placerat dolor, non tincidunt justo sagittis vitae. Suspendisse justo eros, maximus non erat id, fringilla luctus diam. Nam magna leo, blandit vitae orci a, pulvinar vestibulum lorem. Curabitur vulputate turpis ornare aliquam mollis. Nullam a ante eget ipsum imperdiet sagittis. In quis nulla lorem. Maecenas ligula eros, molestie in nulla eu, aliquam accumsan orci. Suspendisse feugiat orci ac dictum tincidunt.</p>\r\n<p>Morbi eget mattis est, a pharetra enim. Vestibulum sagittis sem quis lacus tristique placerat. Sed eget justo eleifend, sagittis ex elementum, porttitor tellus. Mauris dictum massa ut tempus blandit. Maecenas et euismod mauris. Vivamus turpis mi, imperdiet ac molestie egestas, malesuada eu neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas scelerisque, est in mattis egestas, diam risus dapibus odio, non accumsan orci lacus ut felis. Praesent lobortis turpis eu mi rhoncus efficitur. Maecenas aliquet, ante sed molestie ultricies, justo turpis facilisis ex, sit amet venenatis quam tellus ac risus. Cras sagittis massa et augue convallis, vel tincidunt tortor ultricies. Pellentesque aliquet nec tortor eu feugiat. Nunc est augue, elementum ut nunc in, scelerisque eleifend purus. Fusce quis sapien ultrices, lobortis mi in, pharetra est.</p>\r\n<p>Maecenas vitae nisl justo. Aenean tincidunt sollicitudin ipsum, non volutpat odio maximus varius. Sed eu sem ligula. Ut mattis arcu sit amet turpis finibus, sit amet elementum nisl pulvinar. Aliquam nec euismod erat. Etiam in tincidunt nisi. Phasellus facilisis orci id eros pellentesque aliquam. Aliquam sed lobortis diam. Curabitur scelerisque nunc ac est commodo pharetra.</p>\r\n<p>Cras tempus interdum magna, vitae imperdiet nibh placerat eu. Nam id eros egestas, luctus metus quis, aliquet ipsum. Praesent justo ex, imperdiet nec vehicula sed, dictum eget turpis. Aenean at molestie dui. Mauris accumsan mattis urna, at convallis eros consectetur sit amet. Nunc eleifend dolor vel neque imperdiet, at interdum ante eleifend. Aliquam congue, dui vel facilisis aliquet, mi turpis faucibus ligula, a pretium tortor nibh tempus ex. Cras tortor mauris, dictum sit amet sodales ut, ultrices quis lorem. Etiam ullamcorper, nibh eu semper suscipit, odio ipsum convallis dolor, et facilisis justo libero at justo. Etiam nec mattis neque, congue auctor elit. Quisque tellus mauris, bibendum non dolor et, convallis pretium tortor.</p>\r\n<p>Duis suscipit ornare nisl quis tempor. Nunc et aliquam metus, sed auctor ante. Vestibulum semper dolor id magna tristique, sed efficitur mauris tincidunt. Fusce sit amet lacinia urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed varius sapien mi, non suscipit lectus volutpat sit amet. Fusce bibendum diam vitae odio iaculis, eu ornare nunc semper. Proin sit amet elementum augue. Vivamus eros erat, tincidunt at egestas id, faucibus fringilla lectus.</p>\r\n<p>Maecenas feugiat justo eget auctor mattis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut lacinia tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in dui gravida, vehicula enim vel, egestas purus. Phasellus congue tincidunt ornare. Morbi ut mi vel purus fringilla posuere a vitae massa. Phasellus molestie, mauris nec ornare tempus, diam massa aliquam erat, a sodales sem erat quis justo. Sed tempus mi sed purus commodo, at venenatis eros lobortis.</p>\r\n</div>\r\n<div id=\"generated\">Generated 6 paragraphs, 560 words, 3786 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></div>', NULL, 'judul-tambah-3', 'PUBLISHED', 0, '2022-11-22 04:02:44', '2022-11-22 04:02:44'),
(21, 2, 4, 'Judul Tambah 4', '\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum accumsan condimentum vestibulum. Suspendisse in ni...', '<div id=\"lipsum\">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum accumsan condimentum vestibulum. Suspendisse in nibh molestie, luctus elit in, egestas quam. Vivamus sollicitudin ligula non elit condimentum viverra. Morbi augue arcu, vehicula vitae orci id, vestibulum porttitor est. Aliquam faucibus eu sem ut imperdiet. Nullam non nisi sit amet arcu euismod dignissim vel ac turpis. Maecenas convallis placerat dolor, non tincidunt justo sagittis vitae. Suspendisse justo eros, maximus non erat id, fringilla luctus diam. Nam magna leo, blandit vitae orci a, pulvinar vestibulum lorem. Curabitur vulputate turpis ornare aliquam mollis. Nullam a ante eget ipsum imperdiet sagittis. In quis nulla lorem. Maecenas ligula eros, molestie in nulla eu, aliquam accumsan orci. Suspendisse feugiat orci ac dictum tincidunt.</p>\r\n<p>Morbi eget mattis est, a pharetra enim. Vestibulum sagittis sem quis lacus tristique placerat. Sed eget justo eleifend, sagittis ex elementum, porttitor tellus. Mauris dictum massa ut tempus blandit. Maecenas et euismod mauris. Vivamus turpis mi, imperdiet ac molestie egestas, malesuada eu neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas scelerisque, est in mattis egestas, diam risus dapibus odio, non accumsan orci lacus ut felis. Praesent lobortis turpis eu mi rhoncus efficitur. Maecenas aliquet, ante sed molestie ultricies, justo turpis facilisis ex, sit amet venenatis quam tellus ac risus. Cras sagittis massa et augue convallis, vel tincidunt tortor ultricies. Pellentesque aliquet nec tortor eu feugiat. Nunc est augue, elementum ut nunc in, scelerisque eleifend purus. Fusce quis sapien ultrices, lobortis mi in, pharetra est.</p>\r\n<p>Maecenas vitae nisl justo. Aenean tincidunt sollicitudin ipsum, non volutpat odio maximus varius. Sed eu sem ligula. Ut mattis arcu sit amet turpis finibus, sit amet elementum nisl pulvinar. Aliquam nec euismod erat. Etiam in tincidunt nisi. Phasellus facilisis orci id eros pellentesque aliquam. Aliquam sed lobortis diam. Curabitur scelerisque nunc ac est commodo pharetra.</p>\r\n<p>Cras tempus interdum magna, vitae imperdiet nibh placerat eu. Nam id eros egestas, luctus metus quis, aliquet ipsum. Praesent justo ex, imperdiet nec vehicula sed, dictum eget turpis. Aenean at molestie dui. Mauris accumsan mattis urna, at convallis eros consectetur sit amet. Nunc eleifend dolor vel neque imperdiet, at interdum ante eleifend. Aliquam congue, dui vel facilisis aliquet, mi turpis faucibus ligula, a pretium tortor nibh tempus ex. Cras tortor mauris, dictum sit amet sodales ut, ultrices quis lorem. Etiam ullamcorper, nibh eu semper suscipit, odio ipsum convallis dolor, et facilisis justo libero at justo. Etiam nec mattis neque, congue auctor elit. Quisque tellus mauris, bibendum non dolor et, convallis pretium tortor.</p>\r\n<p>Duis suscipit ornare nisl quis tempor. Nunc et aliquam metus, sed auctor ante. Vestibulum semper dolor id magna tristique, sed efficitur mauris tincidunt. Fusce sit amet lacinia urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed varius sapien mi, non suscipit lectus volutpat sit amet. Fusce bibendum diam vitae odio iaculis, eu ornare nunc semper. Proin sit amet elementum augue. Vivamus eros erat, tincidunt at egestas id, faucibus fringilla lectus.</p>\r\n<p>Maecenas feugiat justo eget auctor mattis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut lacinia tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in dui gravida, vehicula enim vel, egestas purus. Phasellus congue tincidunt ornare. Morbi ut mi vel purus fringilla posuere a vitae massa. Phasellus molestie, mauris nec ornare tempus, diam massa aliquam erat, a sodales sem erat quis justo. Sed tempus mi sed purus commodo, at venenatis eros lobortis.</p>\r\n</div>\r\n<div id=\"generated\">Generated 6 paragraphs, 560 words, 3786 bytes of&nbsp;<a title=\"Lorem Ipsum\" href=\"https://www.lipsum.com/\">Lorem Ipsum</a></div>', NULL, 'judul-tambah-4', 'PUBLISHED', 0, '2022-11-22 04:03:01', '2022-11-22 04:03:01');

-- --------------------------------------------------------

--
-- Table structure for table `religions`
--

CREATE TABLE `religions` (
  `id` int(10) UNSIGNED NOT NULL,
  `tahun` int(11) NOT NULL,
  `islam` int(11) NOT NULL,
  `protestan` int(11) NOT NULL,
  `katolik` int(11) NOT NULL,
  `hindu` int(11) NOT NULL,
  `buddha` int(11) NOT NULL,
  `khonghucu` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `religions`
--

INSERT INTO `religions` (`id`, `tahun`, `islam`, `protestan`, `katolik`, `hindu`, `buddha`, `khonghucu`, `created_at`, `updated_at`) VALUES
(1, 2022, 1349, 0, 0, 0, 0, 0, '2022-11-21 04:12:57', '2022-11-21 07:45:49');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'Super Administrator', '2022-10-25 03:23:39', '2022-10-25 03:51:00'),
(2, 'user', 'Normal User', '2022-10-25 03:23:39', '2022-10-25 03:23:39'),
(3, 'admin', 'Administrator', '2022-10-25 03:53:35', '2022-10-25 03:53:35');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(10) UNSIGNED NOT NULL,
  `tahun` int(11) NOT NULL,
  `sd` int(11) NOT NULL,
  `smp` int(11) NOT NULL,
  `sma` int(11) NOT NULL,
  `perguruan_tinggi` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `tahun`, `sd`, `smp`, `sma`, `perguruan_tinggi`, `created_at`, `updated_at`) VALUES
(1, 2022, 0, 0, 0, 0, '2022-11-28 10:46:26', '2022-11-28 10:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Watas Lubuk Durian', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Website Resmi Kelurahan Watas Lubuk Durian Kecamatan Lubuklinggau Barat I Kota Lubuklinggau', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\November2022\\dJ8HAveBNmyJGoOXqXGm.png', '', 'image', 12, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\November2022\\m2aLlb0Su7p4HRVHM6OW.jpeg', '', 'image', 10, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Admin Kelurahan Watas Lubuk Durian', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Admin Panel Kelurahan Watas Lubuk Durian', '', 'text', 4, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 5, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\November2022\\GIThOuNzS9zHEiku3pOo.png', '', 'image', 9, 'Admin'),
(11, 'site.instagram', 'instagram', NULL, NULL, 'text', 7, 'Site'),
(13, 'site.youtube', 'youtube', NULL, NULL, 'text', 8, 'Site'),
(14, 'site.twitter', 'Twitter', NULL, NULL, 'text', 11, 'Site'),
(15, 'admin.foto_lurah', 'Foto Lurah', 'settings\\November2022\\mfmAtbnVhV8jU0p9TaqP.jpeg', NULL, 'image', 2, 'Admin'),
(16, 'admin.nama_lurah', 'Nama Lurah', 'Leni Aryanti S.Sos', NULL, 'text', 3, 'Admin'),
(17, 'site.sambutan_lurah', 'Sambutan Lurah', '\"Selamat datang di website resmi Kelurahan Watas Lubuk Durian Kecamatan Lubuklinggau Barat I Kota Lubuklinggau, diharapkan website ini dapat membantu dalam pencarian maupun penyebaran informasi dari Kelurahan Watas Lubuk Durian.\"', NULL, 'text', 3, 'Site'),
(18, 'site.facebook', 'facebook', '', NULL, 'text', 6, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-10-25 03:23:41', '2022-10-25 03:23:41'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-10-25 03:23:41', '2022-10-25 03:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users\\November2022\\3TNLgWdhoFerdzXRZ4vK.png', NULL, '$2y$10$faywryYyDFBlOkR5lptmU.NuYsRNGwBpIp1j1Tjbpf1LJx.Sz4n0S', 'J2MTgPK2JMuQxpXESj8zhRUroUTriryeGNoT3kYvPKmgRN4nBZtfhcUCDG3A', '{\"locale\":\"en\"}', '2022-10-25 03:23:40', '2022-11-01 19:10:26'),
(2, 3, 'Admin Watas', 'watas@admin.com', 'users\\November2022\\SHyN81535KQOQ1VyM6qF.png', NULL, '$2y$10$pSSwNONNUbhhh65CsqZVROVbeSG/QKq9K8BDn26PQZ59QmlssW4Ea', NULL, '{\"locale\":\"en\"}', '2022-11-01 19:09:27', '2022-11-01 19:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worships`
--

CREATE TABLE `worships` (
  `id` int(10) UNSIGNED NOT NULL,
  `tahun` int(11) DEFAULT NULL,
  `masjid` int(11) DEFAULT NULL,
  `gereja_katolik` int(11) DEFAULT NULL,
  `gereja_protestan` int(11) DEFAULT NULL,
  `vihara` int(11) DEFAULT NULL,
  `pura` int(11) DEFAULT NULL,
  `kelenteng` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `worships`
--

INSERT INTO `worships` (`id`, `tahun`, `masjid`, `gereja_katolik`, `gereja_protestan`, `vihara`, `pura`, `kelenteng`, `created_at`, `updated_at`) VALUES
(1, 2022, 1, 0, 0, 0, 0, 0, '2022-11-25 07:38:13', '2022-11-28 12:49:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `healthcares`
--
ALTER TABLE `healthcares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `infographics`
--
ALTER TABLE `infographics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `populations`
--
ALTER TABLE `populations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `religions`
--
ALTER TABLE `religions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `worships`
--
ALTER TABLE `worships`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `healthcares`
--
ALTER TABLE `healthcares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `infographics`
--
ALTER TABLE `infographics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `populations`
--
ALTER TABLE `populations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `religions`
--
ALTER TABLE `religions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `worships`
--
ALTER TABLE `worships`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
