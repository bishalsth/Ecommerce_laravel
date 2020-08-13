-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2020 at 02:31 PM
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
(1, 1, 'Green T-shirt', 'GTS01-M', 'Green', 'medium', '1500', 3, '', 'bPcnNXYixrQgImCgt7jyoWDV0m3Ap8NHwvFbYkhA', NULL, NULL);

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
(1, 0, 'Shirts', 'Shirts', 'Shirts', 1, '2020-08-02 06:18:45', '2020-08-02 06:18:45'),
(2, 0, 'Pants', 'Pants', 'Pants', 1, '2020-08-02 06:19:07', '2020-08-02 06:19:07'),
(3, 0, 'Shoes', 'Shoes', 'Shoes', 1, '2020-08-02 06:19:24', '2020-08-02 06:19:24'),
(4, 1, 'Causal T-shirt', 'Causal T-shirt', 'Causal T-shirt', 1, '2020-08-02 06:19:54', '2020-08-08 11:58:36'),
(5, 2, 'Jeans Pants', 'Jeans Pants', 'Jeans Pants', 1, '2020-08-02 06:20:27', '2020-08-02 06:20:27'),
(6, 3, 'Ankle Boots', 'Ankle Boots', 'Ankle Boots', 1, '2020-08-02 06:21:08', '2020-08-02 06:21:08'),
(7, 1, 'Full t-shirts', 'Full t-shirts', 'Full t-shirts', 1, '2020-08-02 06:45:48', '2020-08-02 06:45:48'),
(8, 3, 'Army Shoes', 'Army Shoes', 'Army Shoes', 1, '2020-08-02 06:46:32', '2020-08-02 06:46:32'),
(9, 3, 'sport Shoes', 'Sport Shoes', 'Sport Shoes', 1, '2020-08-03 10:39:53', '2020-08-03 10:39:53'),
(10, 0, 'Jwellery', 'Jwellery', 'Jwellery', 1, '2020-08-12 03:28:54', '2020-08-12 03:28:54');

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
(1, '22222', 1, 'Percentage', '2020-08-21', 1, '2020-08-13 02:31:34', '2020-08-13 02:31:34'),
(2, 'test02', 22, 'Fixed', '2020-08-25', 1, '2020-08-13 02:57:03', '2020-08-13 02:57:03');

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
(11, '2020_08_13_081400_create_coupons_table', 8);

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
(1, 4, 'Green T-shirt', 'GTS01', 'Green', 'Green', '', 1500.00, '15261.png', 1, '2020-08-02 06:22:11', '2020-08-02 06:22:11'),
(2, 5, 'Blue Pants', 'BP01', 'Blue', 'Blue Pants', '', 2000.00, '6749.jpg', 1, '2020-08-02 06:23:27', '2020-08-02 06:23:27'),
(3, 6, 'Black Boots', 'BB01', 'Black', 'Black Boots', '', 2500.00, '12003.jpg', 1, '2020-08-02 06:24:35', '2020-08-02 06:24:35'),
(4, 9, 'Blue Sport Shoes', 'BSS01', 'Blue', 'Blue SHoes', '', 5000.00, '16962.jpg', 1, '2020-08-03 10:41:17', '2020-08-03 10:41:17'),
(5, 9, 'Black Shoes', 'BSS02', 'Black', 'Black sport shoes', '', 2500.00, '67048.jpg', 1, '2020-08-03 10:41:57', '2020-08-03 10:41:57'),
(6, 4, 'White Tshirt', 'BTS01', 'Black', 'White Tshirt', 'This is made up of pure cotton', 2500.00, '70026.jpg', 1, '2020-08-05 03:45:21', '2020-08-05 03:45:21'),
(7, 4, 'Red T-shirt', 'RTS', 'Red', 'Red T-shirt', '', 2500.00, '4108.jpg', 1, '2020-08-08 12:01:12', '2020-08-09 00:52:01'),
(8, 4, 'Black T-shirt', 'BTS', 'Black', 'Black T-shirt', 'This is pure cotton', 3000.00, '73070.jpg', 1, '2020-08-08 12:02:27', '2020-08-08 12:02:27'),
(9, 9, 'White Sport Shoes', 'WSS', 'White', 'white Sport Shoes', 'This is super strong', 4500.00, '73803.jpg', 1, '2020-08-08 12:04:07', '2020-08-08 12:04:07'),
(10, 4, 'Blue Tshirt', 'BTS', 'BLue', 'BLue', 'BLue', 1500.00, '55489.png', 1, '2020-08-08 13:00:57', '2020-08-08 13:00:57'),
(11, 5, 'Blue Pants', 'BP', 'Blue', 'BLue', '', 1222.00, '$productDetails->image', 0, '2020-08-09 00:37:35', '2020-08-09 00:44:01');

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
(1, 1, 'GTS01-M', 'medium', 1500.00, 3, '2020-08-03 06:44:45', '2020-08-08 11:16:11'),
(2, 1, 'GTS01-L', 'large', 2500.00, 25, '2020-08-03 06:44:45', '2020-08-08 11:16:11'),
(3, 1, 'GTS01-S', 'small', 1400.00, 5, '2020-08-03 06:44:45', '2020-08-08 11:16:11'),
(4, 4, 'BSS01-S', 'Small', 2500.00, 10, '2020-08-04 04:59:19', '2020-08-08 11:46:23'),
(5, 4, 'BSS01-M', 'Medium', 3000.00, 0, '2020-08-04 04:59:19', '2020-08-08 11:46:23'),
(6, 4, 'BSS01-L', 'Large', 3500.00, 0, '2020-08-04 04:59:19', '2020-08-08 11:46:23'),
(7, 6, 'BTS01-S', 'Small', 1500.00, 10, '2020-08-05 04:19:07', '2020-08-05 04:19:07'),
(8, 6, 'BTS01-M', 'Medium', 2000.00, 15, '2020-08-05 04:23:12', '2020-08-05 04:23:12');

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
(1, 6, '45760.jpg', '2020-08-06 04:22:58', '2020-08-05 22:37:58'),
(2, 6, '72555.jpg', '2020-08-06 04:22:59', '2020-08-05 22:37:59'),
(3, 6, '43004.jpg', '2020-08-06 04:23:00', '2020-08-05 22:38:00'),
(4, 1, '74520.jpg', '2020-08-06 04:25:32', '2020-08-05 22:40:32'),
(5, 1, '16725.jpg', '2020-08-06 04:25:34', '2020-08-05 22:40:34'),
(6, 2, '22325.jpg', '2020-08-06 04:26:39', '2020-08-05 22:41:39');

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
  `admin` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ram', 'Ram@gmail.com', NULL, '$2y$10$2ZjB0EHoQDa3VUnsPecGFO4hfr/n55QstVvkHzrbds5/emthRxRsa', 1, NULL, '2020-06-27 06:05:54', '2020-06-27 06:05:54');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
