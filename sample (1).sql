-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 15, 2020 at 01:04 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sample`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `title`, `link`, `status`, `created_at`, `updated_at`) VALUES
(11, '13563.jpg', 'baner', 'banner', 1, '2020-08-31 02:46:16', '2020-08-31 02:46:16'),
(14, '80733.jpg', 'banner3', 'banner3', 1, '2020-09-01 02:38:22', '2020-09-01 02:38:22'),
(15, '47702.jpg', 'banner4', 'banner 4', 1, '2020-09-01 02:40:37', '2020-09-01 02:40:37'),
(16, '67759.jpg', 'ad', 'asd', 1, '2020-09-03 13:17:01', '2020-09-03 13:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `product_name`, `product_code`, `product_color`, `size`, `price`, `quantity`, `user_email`, `session_id`, `created_at`, `updated_at`) VALUES
(11, 16, 'Copper Eights', 'Copper eights -7', 'Yellow', '7 Inch', '22', 1, 'anusaa@gmail.com', 'v1DwuApIQEvsFJ9YTrPrYY2vlin63VQ1JkAUrO7R', NULL, NULL),
(12, 30, 'TimmersGems', 'tg-m', 'Brown', 'medium', '33', 1, 'anusaa@gmail.com', 'v1DwuApIQEvsFJ9YTrPrYY2vlin63VQ1JkAUrO7R', NULL, NULL),
(13, 28, 'Double Dorje Sterling Silver', 'ddss-m', 'Green', 'medium', '24.5', 11, 'anusaa@gmail.com', 'v1DwuApIQEvsFJ9YTrPrYY2vlin63VQ1JkAUrO7R', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `description`, `url`, `status`, `created_at`, `updated_at`) VALUES
(5, 0, 'Ritual Items:Dharma-ware', 'Ritual Items:Dharma-ware', 'Ritual Items:Dharma-ware', 1, '2020-08-23 04:53:11', '2020-08-23 04:53:11'),
(6, 0, 'Tibetan products collection', 'Tibetan products collection', 'Tibetan products collection', 1, '2020-08-23 04:53:34', '2020-08-23 04:53:34'),
(7, 0, 'Hats and hairbands', 'Hats and hairbands', 'Hats and hairbands', 1, '2020-08-23 04:53:51', '2020-08-23 04:53:51'),
(9, 0, 'Hemp and Nettle Products', 'Hemp and Nettle Products', 'Hemp and Nettle Products', 1, '2020-08-23 04:54:21', '2020-08-23 04:54:21'),
(10, 0, 'Felted woolen products', 'Felted woolen products', 'Felted woolen products', 1, '2020-08-23 04:54:40', '2020-08-23 04:54:40'),
(12, 0, 'Bone jewelry and acessories', 'Bone jewelry and acessories', 'Bone jewelry and acessories', 1, '2020-08-23 04:55:35', '2020-08-23 04:55:35'),
(13, 0, 'Statue crafts, arts, decorative', 'Statue crafts, arts, decorative', 'Statue crafts, arts, decorative', 1, '2020-08-23 04:56:01', '2020-08-23 04:56:01'),
(14, 0, 'Handmade Lokta Paper', 'Handmade Lokta Paper', 'Handmade Lokta Paper', 1, '2020-08-23 04:56:22', '2020-08-23 04:56:22'),
(15, 0, 'Sterling silver jewelry', 'Sterling silver jewelry', 'Sterling silver jewelry', 1, '2020-08-23 04:56:49', '2020-08-23 04:56:49'),
(16, 1, 'Face Mask', 'Face Mask', 'Face Mask', 1, '2020-08-23 05:05:15', '2020-08-23 05:05:15'),
(17, 1, 'Tank tops and sleeveless', 'Tank tops and sleeveless', 'Tank tops and sleeveless', 1, '2020-08-23 05:08:49', '2020-08-23 05:08:49'),
(18, 1, 'Trousers or pants', 'Trousers or pants', 'Trousers or pants', 1, '2020-08-23 05:09:25', '2020-08-23 05:09:25'),
(19, 1, 'Shirts and Kurtha Tops', 'Shirts and Kurtha Tops', 'Shirts and Kurtha Tops', 1, '2020-08-23 05:09:45', '2020-08-23 05:09:45'),
(20, 2, 'Cottone Scarves', 'Cottone Scarves', 'Cottone Scarves', 1, '2020-08-23 05:11:56', '2020-08-23 05:11:56'),
(21, 2, 'Silk stores and Accessories', 'Silk stores and Accessories', 'Silk stores and Accessories', 1, '2020-08-23 05:12:23', '2020-08-23 05:12:23'),
(22, 3, 'T-shirts', 'T-shirts', 'T-shirts', 1, '2020-08-23 05:12:43', '2020-08-23 05:12:43'),
(23, 3, 'Daura Surwal', 'Daura Surwal', 'Daura Surwal', 1, '2020-08-23 05:13:06', '2020-08-23 05:13:06'),
(24, 5, 'Brass Metal', 'Brass Metal', 'Brass Metal', 1, '2020-08-23 05:34:37', '2020-08-23 05:34:37'),
(25, 5, 'Singing Bowl', 'Singing Bowl', 'Singing Bowl', 1, '2020-08-23 05:35:09', '2020-08-23 05:35:09'),
(26, 5, 'Prayer Wheels', 'Prayer Wheels', 'Prayer Wheels', 1, '2020-08-23 05:35:38', '2020-08-23 05:35:38'),
(27, 6, 'Tibetan Door Curtains', 'Tibetan Door Curtains', 'Tibetan Door Curtains', 1, '2020-08-23 05:42:48', '2020-08-23 05:42:48'),
(28, 6, 'Tibetan Treasure Box', 'Tibetan Treasure Box', 'Tibetan Treasure Box', 1, '2020-08-23 05:43:11', '2020-08-23 05:43:11'),
(30, 0, 'Wild Hemp Product', 'Wild Hemp Product', 'Wild Hemp Product', 1, '2020-08-31 01:55:19', '2020-08-31 01:55:19'),
(31, 0, 'Hand Knit Woolen Product', 'Hand Knit Woolen Product', 'Hand Knit Woolen Product', 1, '2020-08-31 01:56:38', '2020-08-31 01:56:38'),
(32, 0, 'Musical Instruments', 'Musical Instruments', 'Musical Instruments', 1, '2020-08-31 01:57:00', '2020-08-31 01:57:00'),
(33, 0, 'Resin Statue', 'Resin Statue', 'Resin Statue', 1, '2020-08-31 01:57:18', '2020-08-31 01:57:18'),
(34, 0, 'Metal Craft', 'Metal Craft', 'Metal Craft', 1, '2020-08-31 01:57:28', '2020-08-31 01:57:28'),
(35, 0, 'Wood Craft', 'Wood Craft', 'Wood Craft', 1, '2020-08-31 01:57:49', '2020-08-31 01:57:49'),
(36, 0, 'Handcrafted Mask', 'Handcrafted Mask', 'Handcrafted Mask', 1, '2020-08-31 01:58:04', '2020-08-31 01:58:04'),
(37, 0, 'Posters Maps calender', 'Posters Maps calender', 'Posters Maps calender', 1, '2020-08-31 01:58:19', '2020-08-31 01:58:19'),
(38, 0, 'Natural Herbal Products', 'Posters Maps calender', 'Posters Maps calender', 1, '2020-08-31 01:58:39', '2020-08-31 01:58:39'),
(39, 0, 'Carved Tibetan Prayer Mani stones', 'Carved Tibetan Prayer Mani stones', 'Carved Tibetan Prayer Mani stones', 1, '2020-08-31 01:59:32', '2020-08-31 01:59:32'),
(40, 0, 'Pashmina Shawl &Scarf', 'Pashmina Shawl &Scarf', 'Pashmina Shawl &Scarf', 1, '2020-08-31 01:59:59', '2020-08-31 01:59:59'),
(41, 0, 'Batik art', 'Batik art', 'Batik art', 1, '2020-08-31 02:00:10', '2020-08-31 02:00:10'),
(42, 0, 'Cds and DVD', 'Cds and DVD', 'Cds and DVD', 1, '2020-08-31 02:00:25', '2020-08-31 02:00:25'),
(43, 0, 'Nepalses Product', 'Nepalses Product', 'Nepalses Product', 1, '2020-08-31 02:00:38', '2020-08-31 02:00:38'),
(44, 33, 'Bhuddist Resin Statue', 'Bhuddist Resin Statue', 'Bhuddist Resin Statue', 1, '2020-08-31 02:06:22', '2020-08-31 02:06:22'),
(45, 33, 'Decorative Statue', 'Decorative Statue', 'Decorative Statue', 1, '2020-08-31 02:06:36', '2020-08-31 02:06:36'),
(46, 0, 'Feng shui Staute', 'Feng shui Staute', 'Feng shui Staute', 1, '2020-08-31 02:06:50', '2020-08-31 02:06:50'),
(47, 33, 'Hindu Resin Statue', 'Hindu Resin Statue', 'Hindu Resin Statue', 1, '2020-08-31 02:07:11', '2020-08-31 02:07:11'),
(48, 33, 'Resin Mask', 'Resin Mask', 'Resin Mask', 1, '2020-08-31 02:07:26', '2020-08-31 02:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `amount`, `amount_type`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test123', 1, 'Percentage', '2020-08-01', 1, '2020-08-13 02:31:34', '2020-08-14 06:10:40'),
(3, 'test1234', 50, 'Percentage', '2020-12-02', 1, '2020-08-14 06:09:55', '2020-08-26 03:40:27'),
(4, 'test12345', 50, 'Percentage', '2020-08-22', 1, '2020-08-14 06:12:03', '2020-08-14 06:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_addresses`
--

CREATE TABLE `delivery_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_addresses`
--

INSERT INTO `delivery_addresses` (`id`, `user_id`, `user_email`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `vat`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ram@gmail.com', 'shyam', 'a', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', '4566688', '2020-08-21 23:46:39', '2020-09-02 11:49:38'),
(2, 6, 'anusa@gmail.com', 'anusa', 'Kathmandu', 'Balaju', 'Gandaki', 'NEPAL', '44600', '981032566', '', '2020-08-25 09:01:20', '2020-08-25 09:10:58'),
(3, 7, 'asd@gamail.com', 'asd', 'Balaju', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', '', '2020-08-26 02:26:56', '2020-08-26 02:26:56'),
(4, 8, 'Ram123@gmail.com', 'Ram', '', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', '4566688', '2020-08-26 03:01:58', '2020-08-26 03:15:16'),
(5, 9, 'hari@gmail.com', 'hari', 'Balaju', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', '4566688', '2020-08-26 03:39:52', '2020-08-26 03:40:48'),
(6, 10, 'shyam@gmail.com', 'shyam', 'Balaju', 'Kathmadnu', 'Bagmati', 'AMERICAN SAMOA', '44600', '9810313500', '4566688', '2020-08-26 04:23:20', '2020-08-26 04:23:20'),
(7, 5, 'bishal@gmail.com', 'bishal', 'Balaju', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', '4566688', '2020-08-27 08:26:08', '2020-08-31 10:45:07'),
(8, 12, 'anusaa@gmail.com', 'TEst 2', 'Balaju', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', 'ada', '2020-09-02 11:29:26', '2020-09-03 11:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_26_123206_create_products_table', 1),
(5, '2020_07_09_140213_create_category_table', 2),
(6, '2020_07_15_070655_create_products_table', 3),
(7, '2020_08_02_044019_create_products_attributes_table', 4),
(8, '2020_08_02_075021_create_products_attributes_table', 5),
(9, '2020_08_10_091758_create_cart_table', 6),
(10, '2020_08_12_142832_create_coupons_table', 7),
(11, '2020_08_13_081400_create_coupons_table', 8),
(12, '2020_08_13_172514_create__g_g_table', 9),
(13, '2020_08_15_050138_create_banners_table', 10),
(14, '2020_08_20_065322_create_delivery_address_table', 11),
(15, '2020_08_27_133238_create_orders_table', 12),
(17, '2020_08_27_133751_create_orders_products_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_charges` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` double(8,2) NOT NULL,
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_email`, `name`, `address`, `city`, `state`, `pincode`, `country`, `mobile`, `shipping_charges`, `coupon_code`, `coupon_amount`, `order_status`, `payment_method`, `grand_total`, `created_at`, `updated_at`) VALUES
(10, 1, 'Ram@gmail.com', 'shyam', '', 'Kathmadnu', 'Bagmati', '44600', 'NEPAL', '9810313500', '', '', 0.00, 'New', 'paypal', 9.90, '2020-08-31 10:44:09', '2020-08-31 10:44:09'),
(11, 5, 'bishal@gmail.com', 'bishal', 'Balaju', 'Kathmadnu', 'Bagmati', '44600', 'NEPAL', '9810313500', '', '', 0.00, 'New', 'paypal', 9.90, '2020-08-31 10:45:15', '2020-08-31 10:45:15'),
(12, 1, 'Ram@gmail.com', 'shyam', '', 'Kathmadnu', 'Bagmati', '44600', 'NEPAL', '9810313500', '', '', 0.00, 'New', 'paypal', 10073.05, '2020-09-02 10:46:34', '2020-09-02 10:46:34'),
(13, 12, 'anusaa@gmail.com', 'TEst 2', 'ad', 'TEst 2', 'TEst 2', 'TEst 2', 'AMERICAN SAMOA', 'TEst 2', '', '', 0.00, 'New', 'COD', 3310.00, '2020-09-02 11:29:44', '2020-09-02 11:29:44'),
(14, 12, 'anusaa@gmail.com', 'TEst 2', 'Balaju', 'Kathmadnu', 'Bagmati', '44600', 'AMERICAN SAMOA', '9810313500', '', '', 0.00, 'New', 'paypal', 33010.00, '2020-09-02 11:31:18', '2020-09-02 11:31:18'),
(15, 12, 'anusaa@gmail.com', 'TEst 2', 'ad', 'Kathmadnu', 'Bagmati', '44600', 'AMERICAN SAMOA', '9810313500', '', '', 0.00, 'New', 'COD', 897.60, '2020-09-02 11:44:39', '2020-09-02 11:44:39'),
(16, 1, 'Ram@gmail.com', 'shyam', 'a', 'Kathmadnu', 'Bagmati', '44600', 'NEPAL', '9810313500', '', '', 0.00, 'New', 'paypal', 907.60, '2020-09-02 11:49:46', '2020-09-02 11:49:46'),
(17, 12, 'anusaa@gmail.com', 'TEst 2', 'Balaju', 'Kathmadnu', 'Bagmati', '44600', 'NEPAL', '9810313500', '', '', 0.00, 'New', 'COD', 2427.15, '2020-09-03 11:59:12', '2020-09-03 11:59:12');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE `orders_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `user_id`, `product_id`, `product_code`, `product_name`, `product_size`, `product_color`, `product_price`, `product_qty`, `created_at`, `updated_at`) VALUES
(10, 10, 1, 27, 'cgd-m', 'Copper Gau Dorje', 'medium', 'Red', 9.90, 1, '2020-08-31 10:44:09', '2020-08-31 10:44:09'),
(11, 11, 5, 27, 'cgd-m', 'Copper Gau Dorje', 'medium', 'Red', 9.90, 1, '2020-08-31 10:45:15', '2020-08-31 10:45:15'),
(12, 12, 1, 29, 'sss-m', 'Sterling SIlver Assorted finger ring', 'Medium', 'ALL', 1.20, 10, '2020-09-02 10:46:34', '2020-09-02 10:46:34'),
(13, 13, 12, 16, 'CE-M', 'Copper Eights', 'medium', 'Yellow', 3000.00, 1, '2020-09-02 11:29:45', '2020-09-02 11:29:45'),
(14, 14, 12, 18, 'TSB-L', 'Tibetan Singing Bowl', 'large', 'Yellow', 1500.00, 22, '2020-09-02 11:31:18', '2020-09-02 11:31:18'),
(15, 15, 12, 29, 'sss-m', 'Sterling SIlver Assorted finger ring', 'Medium', 'ALL', 1.20, 250, '2020-09-02 11:44:39', '2020-09-02 11:44:39'),
(16, 16, 1, 29, 'sss-m', 'Sterling SIlver Assorted finger ring', 'Medium', 'ALL', 1.20, 250, '2020-09-02 11:49:46', '2020-09-02 11:49:46'),
(17, 17, 12, 25, 'lps-l', 'Lapis Ganesha statue 4.5 x 5 inch', 'large', 'blue', 7.25, 125, '2020-09-03 11:59:13', '2020-09-03 11:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `care` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `product_color`, `description`, `care`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(15, 24, 'Brass Metal', 'BM', 'Yellow', 'Brass Metal', 'Brass Metal', 1500.00, '36883.jpeg', 1, '2020-08-23 05:36:57', '2020-08-23 05:36:57'),
(16, 24, 'Copper Eights', 'CE', 'Yellow', 'Copper Eights', 'Copper Eights', 3000.00, '8386.jpeg', 1, '2020-08-23 05:38:07', '2020-08-23 05:38:07'),
(17, 25, 'SInging Bowl', 'SB', 'RED', 'SInging Bowl', 'SInging Bowl', 10000.00, '63458.jpg', 1, '2020-08-23 05:39:35', '2020-08-23 05:39:35'),
(18, 25, 'Tibetan Singing Bowl', 'TSB', 'Yellow', 'Tibetan Singing Bowl', 'Tibetan Singing Bowl', 3600.00, '12825.jpg', 1, '2020-08-23 05:40:34', '2020-08-23 05:40:34'),
(19, 26, 'Red Prayer Wheels', 'RPW', 'REd', 'Red Prayer Wheels', 'Red Prayer Wheels', 2500.00, '2261.jpeg', 1, '2020-08-23 05:41:48', '2020-08-23 05:41:48'),
(20, 28, 'REd Treasere box', 'RTB', 'REd', 'REd Treasere box', 'REd Treasere box', 45000.00, '95980.jpeg', 1, '2020-08-23 05:44:14', '2020-08-23 05:44:14'),
(21, 27, 'REd Door Curtains', 'RDC', 'REd', 'REd Treasere box', 'REd Treasere box', 5600.00, '70297.jpeg', 1, '2020-08-23 05:45:31', '2020-08-23 05:45:31'),
(23, 44, 'Antique Medicine buddha Statue', 'AMBC', 'Brown', 'Antique Medicine buddha Statue', 'Antique Medicine buddha Statue', 6.25, '65897.jpg', 1, '2020-08-31 02:10:46', '2020-08-31 02:10:46'),
(25, 47, 'Lapis Ganesha statue 4.5 x 5 inch', 'lps', 'blue', 'Lapis Ganesha statue 4.5 x 5 inch', 'Lapis Ganesha statue 4.5 x 5 inch', 7.25, '78821.jpeg', 1, '2020-08-31 02:23:34', '2020-08-31 02:23:34'),
(26, 48, 'Lapis Garuda Mask 9 X 14 inch', 'lpgs', 'red', 'Lapis Garuda Mask 9 X 14 inch', 'Lapis Garuda Mask 9 X 14 inch', 23.25, '64034.jpg', 1, '2020-08-31 02:24:53', '2020-08-31 02:24:53'),
(27, 24, 'Copper Gau Dorje', 'CGD', 'Red', 'Copper Gau Dorje', 'Copper Gau Dorje', 10.00, '13331.jpeg', 1, '2020-08-31 02:27:54', '2020-08-31 02:27:54'),
(28, 45, 'Double Dorje Sterling Silver', 'DDSS', 'Green', 'Double Dorje Sterling Silver', 'Double Dorje Sterling Silver', 25.00, '11255.jpg', 1, '2020-08-31 02:28:57', '2020-08-31 02:28:57'),
(29, 45, 'Sterling SIlver Assorted finger ring', 'SSS', 'ALL', 'Sterling SIlver Assorted finger ring', 'Sterling SIlver Assorted finger ring', 1.20, '91538.jpeg', 1, '2020-08-31 02:30:32', '2020-08-31 02:30:32'),
(30, 44, 'TimmersGems', 'TG', 'Brown', 'TimmersGems', 'TimmersGems', 33.20, '39763.jpg', 1, '2020-08-31 02:31:54', '2020-08-31 02:31:54'),
(31, 44, 'Tibetal GAu', 'TG', 'Yellow', 'Tibetal GAu', 'Tibetal GAu', 25.20, '69257.jpg', 1, '2020-08-31 02:34:32', '2020-08-31 02:34:32'),
(32, 24, 'Brass Metal', 'BM', 'Brwon', 'This is made up silver with size 7 m.', 'This is made up silver with size 7 m.', 25.00, '13462.jpg', 1, '2020-09-01 02:51:57', '2020-09-01 02:51:57');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`id`, `product_id`, `sku`, `size`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 15, 'BM-L', 'Large', 15000.00, 2, '2020-08-23 05:48:52', '2020-08-23 05:48:52'),
(2, 15, 'BM-M', 'Medium', 10000.00, 5, '2020-08-23 05:48:53', '2020-08-23 05:48:53'),
(3, 16, 'CE-L', 'Large', 3000.00, 10, '2020-08-23 05:50:36', '2020-08-23 05:50:36'),
(4, 17, 'SB-L', 'large', 10000.00, 10, '2020-08-23 05:51:26', '2020-08-23 05:51:26'),
(5, 18, 'TSB-L', 'large', 1500.00, 10, '2020-08-23 05:51:58', '2020-08-23 05:51:58'),
(6, 22, 'ww', 'packet', 20.00, 10, '2020-08-26 11:15:43', '2020-08-26 11:15:43'),
(7, 22, 'ww-s', 'cartoon', 500.00, 10, '2020-08-26 11:15:43', '2020-08-26 11:15:43'),
(8, 23, 'ambc', 'large', 6.25, 10, '2020-08-31 02:38:35', '2020-08-31 02:38:35'),
(9, 23, 'ambc-m', 'medium', 6.25, 10, '2020-08-31 02:38:35', '2020-08-31 02:38:35'),
(10, 24, 'Sa-L', 'Large', 4.25, 11, '2020-08-31 02:39:30', '2020-08-31 02:39:30'),
(11, 24, 'Sa-M', 'medium', 4.20, 10, '2020-08-31 02:39:31', '2020-08-31 02:39:31'),
(12, 24, 'sa-S', 'small', 4.20, 22, '2020-08-31 02:39:31', '2020-08-31 02:39:31'),
(13, 25, 'lps-l', 'large', 7.25, 11, '2020-08-31 02:40:49', '2020-08-31 02:40:49'),
(14, 25, 'lps-m', 'medium', 7.25, 12, '2020-08-31 02:40:49', '2020-08-31 02:40:49'),
(15, 26, 'lpgs-l', 'large', 23.50, 15, '2020-08-31 02:41:52', '2020-08-31 02:41:52'),
(16, 26, 'lpgs-m', 'medium', 23.00, 11, '2020-08-31 02:41:52', '2020-08-31 02:41:52'),
(17, 27, 'cgd-l', 'large', 10.00, 11, '2020-08-31 02:42:29', '2020-08-31 02:42:29'),
(18, 27, 'cgd-m', 'medium', 9.90, 11, '2020-08-31 02:42:29', '2020-08-31 02:42:29'),
(19, 28, 'ddss-l', 'large', 25.00, 11, '2020-08-31 02:42:58', '2020-08-31 02:42:58'),
(20, 28, 'ddss-m', 'medium', 24.50, 12, '2020-08-31 02:42:58', '2020-08-31 02:42:58'),
(21, 29, 'sss-m', 'Medium', 1.20, 22, '2020-08-31 02:43:16', '2020-08-31 02:43:16'),
(22, 30, 'tg-l', 'large', 33.20, 10, '2020-08-31 02:43:42', '2020-08-31 02:43:42'),
(23, 30, 'tg-m', 'medium', 33.00, 11, '2020-08-31 02:43:42', '2020-08-31 02:43:42'),
(24, 31, 'TG', 'medium', 25.20, 22, '2020-08-31 02:44:28', '2020-08-31 02:44:28'),
(25, 16, 'CE-M', 'medium', 3000.00, 10, '2020-09-01 02:47:41', '2020-09-01 02:47:41'),
(26, 16, 'CE-S', 'small', 2500.00, 11, '2020-09-01 02:47:41', '2020-09-01 02:47:41'),
(27, 16, 'Copper eights -7', '7 Inch', 22.00, 10, '2020-09-01 02:49:28', '2020-09-01 02:49:28'),
(28, 32, 'BM-s', 'small', 10000.00, 10, '2020-09-01 02:55:25', '2020-09-01 02:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

CREATE TABLE `products_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_images`
--

INSERT INTO `products_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 16, '96967.jpg', '2020-08-23 11:45:12', '2020-08-23 06:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) DEFAULT 0,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `C_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `admin`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `vat`, `C_name`, `zip`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'shyam', 'Ram@gmail.com', NULL, '$2y$10$8ovxbS9kJ.dbr9KVr/2z8.37FPTJuyfhEBn80hAVDaOh0jekfXYna', 1, 'as', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', 'aa', NULL, NULL, NULL, '2020-06-27 06:05:54', '2020-09-02 11:49:37'),
(4, 'hfdd`', 'asd@gam.com', NULL, '$2y$10$SHvQpct4X2/EPmKmur5fou7aSryRm5X328h7RutmX/lHDUGeGhs7i', 0, '', '', '', '', '', '', '', NULL, NULL, NULL, '2020-08-16 09:23:03', '2020-08-16 09:23:03'),
(5, 'bishal', 'bishal@gmail.com', NULL, '$2y$10$xZ2ZhVtYo9K23FTej66PZex2j0y6wAINMq.Y3xl76vVpnpztc./iu', 0, '', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', '4566688', NULL, NULL, NULL, '2020-08-17 03:57:18', '2020-08-31 10:45:07'),
(6, 'anusa', 'anusa@gmail.com', NULL, '$2y$10$JWCwrPyNTZu2B9MKFNID5.UEr.nvWU2IUDc5v4p6lARN8L8p4X9gq', 0, '', 'Balaju', 'Gandaki', 'NEPAL', '44600', '981032566', '', NULL, NULL, NULL, '2020-08-25 08:25:38', '2020-08-25 09:10:58'),
(7, 'asd', 'asd@gamail.com', NULL, '$2y$10$WOBytwd4vJeuN5ss6.9LmeJMTfG8AJYCzjkieuCFXtXvsAxJOfdsq', 0, 'Balaju', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', '', NULL, NULL, NULL, '2020-08-26 02:26:42', '2020-08-26 02:26:56'),
(8, 'Ram', 'Ram123@gmail.com', NULL, '$2y$10$5ZwZUKhHBoeGRbK3sIMAkuQXS3QhS/8/7vxQXsQdvOFTlkm9w2EDm', 0, '', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', '4566688', NULL, NULL, NULL, '2020-08-26 03:00:34', '2020-08-26 03:15:16'),
(9, 'hari', 'hari@gmail.com', NULL, '$2y$10$v5C5x23irkJLG9ViUvYlVu3sFo79vNffdEr6xxKiNZoSIQAxzqAJW', 0, '', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', '4566688', NULL, NULL, NULL, '2020-08-26 03:38:36', '2020-08-26 03:40:47'),
(10, 'shyam', 'shyam@gmail.com', NULL, '$2y$10$aC6VJIwaYMLzYxn0BlrHKO9FbzYUgySusl9/KYhixc6A4tDbmchdu', 0, 'Balaju', 'Kathmadnu', 'Bagmati', 'AMERICAN SAMOA', '44600', '9810313500', '4566688', NULL, NULL, NULL, '2020-08-26 04:22:27', '2020-08-26 04:25:12'),
(11, 'hari', 'hasri@gmail.com', NULL, '$2y$10$1I90iwrqwtMHXxhvppgV4eMrQ9QJUL4jAbXSK7avg2I58RTdcKWuy', 0, 'Box', 'Test', 'Test', 'London', '4500', '9810313500', '44600', 'Tesla', 'Test', NULL, '2020-08-30 09:21:03', '2020-08-30 09:21:03'),
(12, 'TEst 2', 'anusaa@gmail.com', NULL, '$2y$10$Uj57z44h9mrZljWt0.SJ8OS2cX1Yx/WTsBrJM6QaDWK7NgILdZfOO', 2, 'Balaju', 'Kathmadnu', 'Bagmati', 'NEPAL', '44600', '9810313500', 'TEst 2', 'TEst 2', 'TEst 2', NULL, '2020-08-30 09:37:25', '2020-09-03 11:52:44'),
(13, 'rabinrobin', 'robin@gmail.com', NULL, '$2y$10$dOsi6/9oR6KwP14d4q8toOjbK6hmdZdowujzmSYgv8eDC7.N2Oqqu', 2, 'rabin', 'rabin', 'rabin', 'rabin', 'rabin', 'rabin', 'rabin', 'rabin', 'rabin', NULL, '2020-08-30 11:13:07', '2020-08-30 11:13:07'),
(14, 'tesla', 'tesla@gmail.com', NULL, '$2y$10$9ZDTT1ed2ORUdIqKACf/we/zG86g9mMsAddpw78yMJnEqlkVvAgpa', 2, 'tesla', 'tesla', 'tesla', 'tesla', 'tesla', 'tesla', 'tesla', 'tesla', 'tesla', NULL, '2020-08-30 11:14:27', '2020-08-30 11:14:27'),
(15, 'Test3', 'wholesale@gmail.com', NULL, '$2y$10$IBUEhpfAM/LlL.J8xaWDWuTJqVrjOn5X05YL5p3lebOHAUsl/gN5m', 2, 'Test3', 'Test3', 'Test3', 'Test3', 'Test3', 'Test3', 'Test3', 'Test3', 'Test3', NULL, '2020-09-01 02:18:18', '2020-09-01 02:18:18');

-- --------------------------------------------------------

--
-- Table structure for table `_g_g`
--

CREATE TABLE `_g_g` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
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
-- Indexes for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `_g_g`
--
ALTER TABLE `_g_g`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `_g_g`
--
ALTER TABLE `_g_g`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
