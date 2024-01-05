-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2021 at 12:12 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spring_pos_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjusments`
--

CREATE TABLE `adjusments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adjusments`
--

INSERT INTO `adjusments` (`id`, `reference_id`, `warehouse_id`, `document`, `total_qty`, `note`, `created_at`, `updated_at`) VALUES
(134, 'Aumlan', 3, NULL, 50, 'jkl', '2021-05-05 14:47:00', '2021-05-05 14:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_infos`
--

CREATE TABLE `app_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `app_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `app_logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'photo.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'photo.jpg',
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'biller-1', '3385c9d0847786baa55087ab9110b0e9.jpg', 'company-1', '54354', 'biller1@gmail.com', '0174569475', 'asdsdsd', 'dhaka', 'dhaka', '1254', 'BD', NULL, '2021-04-27 14:00:14', '2021-04-27 14:00:27'),
(2, 'biller 2', 'c7d94a307c0bb6fa1948098761217be1.jpg', 'company 2', '213213', 'biller2@gmail.com', '01745896547', 'sdsadsad', 'sylhet', 'sylhet', '1227', 'sylhet', NULL, '2021-04-27 14:01:16', '2021-04-27 14:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `category_id`, `is_active`, `image`, `created_at`, `updated_at`) VALUES
(1, 'brand-1', 1, 1, '0b3060448f36d11646fcdeace5b8fddf.jpg', '2021-04-27 15:23:30', '2021-04-27 15:23:30'),
(2, 'brand-2', 2, 1, '669fe0fcb2867aa9285db4dfcdc20ebd.jpg', '2021-04-27 15:23:44', '2021-04-27 15:23:44'),
(3, 'brand-3', 4, 0, '0b3060448f36d11646fcdeace5b8fddf.jpg', '2021-04-27 15:24:22', '2021-06-13 09:51:23'),
(4, 'ddddd', 2, 0, 'ee3c7729779e3c215b1b4700e9adedb5.jpg', '2021-05-03 06:58:56', '2021-06-09 11:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `category_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `status`, `category_image`, `created_at`, `updated_at`) VALUES
(1, 'category-1', 1, 'c78fb705fb3c52054b41a83ebf13e917.jpg', '2021-04-27 15:22:41', '2021-06-09 11:57:54'),
(2, 'category-2', 1, 'b8a5b4056b0ec97d72e2cb09ee4a4744.jpg', '2021-04-27 15:22:49', '2021-06-10 05:51:25'),
(4, 'category-3', 0, 'c78fb705fb3c52054b41a83ebf13e917.jpg', '2021-04-27 15:23:04', '2021-06-10 05:29:14'),
(6, 'wwww', 0, '338bc99f327711bb4d6d5b5df9f39184.jpg', '2021-06-13 09:49:35', '2021-06-13 09:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) DEFAULT NULL,
  `expire_date` date NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `amount`, `minimum_amount`, `quantity`, `used`, `expire_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '28460', 'fixed', 200, 100, 10, 1, '2021-08-30', NULL, NULL, '2021-06-13 10:03:35'),
(2, '65303', 'Percentage', 300, NULL, 10, NULL, '2021-04-30', NULL, NULL, NULL),
(3, '27815555', 'fixed', 15044, 100, 100, NULL, '2021-04-30', NULL, NULL, '2021-06-09 12:13:56'),
(4, 'shah75', '', 5, NULL, 10, 3, '2021-04-30', NULL, NULL, '2021-06-09 12:09:22'),
(5, 'fizz90', 'fixed', 100, 2000, 10, NULL, '2021-04-22', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cus_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `a_tax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `company_name`, `phone`, `cus_email`, `a_tax`, `address`, `city`, `state`, `postal_code`, `country`, `created_at`, `updated_at`) VALUES
(1, 'customer- 1', 'company- 1', '01745785846', 'customer1@gmail.com', '11111', 'dhaka', 'dhaka', 'dhaka', '1229', 'UK', NULL, '2021-06-09 10:29:42'),
(2, 'customer- 2', 'company 2', '01745124785', 'customer2@gmail.com', '1511', 'Sylhet', 'dhaka', 'ddddd', '1229', 'BD', NULL, '2021-04-27 13:15:18'),
(3, 'customer- 3', 'company', '01712584685', 'customer3@gmail.com', '45745', 'Sylhet', 'dhaka', 'dhaka', '1245', 'BDD', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_id` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deli_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rec_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `ref`, `sale_id`, `address`, `deli_by`, `rec_by`, `file`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, '773828529', 7, 'hjhgj', 'tttttt', 'ghjhjhj', NULL, 'hfgjfhgj', 'Picking', '2021-04-29 12:54:28', '2021-04-29 12:54:28'),
(2, '1501053679', 1070126651, 'Sylhet', 'Aumlan', 'customer- 2', NULL, 'ghjghj', 'Delivered', '2021-05-05 15:53:41', '2021-05-05 15:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `name`, `email`, `phone_number`, `department_id`, `image`, `address`, `city`, `country`, `created_at`, `updated_at`) VALUES
(1, NULL, 'WWW', 'www@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-29 08:13:05', '2021-04-29 08:13:05'),
(2, NULL, 'Aumlan', 'admin1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-13 09:54:49', '2021-06-13 09:54:49');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `date`, `reference`, `warehouse`, `category`, `amount`, `note`, `created_at`, `updated_at`) VALUES
(1, '2021-04-01', 'Aumlan', 'warehouse- 1', 'Expense Category- 2', 500, 'ghjghj', '2021-04-28 07:08:32', '2021-04-28 07:08:32'),
(2, '2021-04-20', 'xxx', 'warehouse- 1', 'Expense Category- 3', 500, 'kjhk', '2021-04-28 07:08:47', '2021-04-28 07:08:47'),
(3, '2021-06-09', 'Admin 2', 'warehouse- 1', 'Expense Category- 1', 2000, 'tfghfhgf', '2021-06-09 07:31:57', '2021-06-09 11:15:53'),
(4, '2021-04-01', 'Aumlan', 'warehouse- 1', 'Expense Category- 2', 1000, 'ghjghj', '2021-05-28 07:08:32', '2021-05-28 07:08:32'),
(7, '2021-06-09', 'Admin 2', 'warehouse- 1', 'Expense Category- 1', 2000, 'tfghfhgf', '2021-04-13 07:31:57', '2021-04-13 11:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, '237318', 'Expense Category- 1', '2021-04-27 13:09:34', '2021-04-27 13:10:01'),
(3, '397834', 'Expense Category- 2', '2021-04-27 13:10:27', '2021-04-27 13:10:27'),
(4, '421423', 'Expense Category- 3', '2021-04-27 13:10:38', '2021-04-27 13:10:38');

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
-- Table structure for table `get_user_information`
--

CREATE TABLE `get_user_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `giftcards`
--

CREATE TABLE `giftcards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `card` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `giftcards`
--

INSERT INTO `giftcards` (`id`, `card`, `amount`, `expense`, `customer_id`, `user_id`, `expire_date`, `created_by`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '80790994', 1000, NULL, 1, NULL, '2021-04-30', 2, NULL, NULL, NULL),
(2, '63937494', 200, NULL, 1, NULL, '2021-04-28', 2, NULL, NULL, NULL),
(3, '13458911', 300, NULL, 3, NULL, '2021-08-27', 1, NULL, NULL, '2021-06-09 06:11:07'),
(4, '25389863', 500, 500, 3, NULL, '2021-05-08', 1, NULL, NULL, '2021-04-29 13:00:33');

-- --------------------------------------------------------

--
-- Table structure for table `give_answers`
--

CREATE TABLE `give_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `give_answer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(4, '2020_12_03_110656_create_questions_table', 1),
(5, '2020_12_06_102828_create_answers_table', 1),
(6, '2020_12_07_091045_create_give_answers_table', 1),
(7, '2020_12_09_131051_create_categories_table', 1),
(8, '2020_12_09_164403_create_app_infos_table', 1),
(9, '2020_12_09_170055_create_get_user_information_table', 1),
(10, '2021_04_04_142938_create_warehouses_table', 1),
(11, '2021_04_05_150846_create_customers_table', 1),
(12, '2021_04_06_110350_create_expenses_table', 1),
(13, '2021_04_06_174516_create_expense_categories_table', 1),
(15, '2021_04_08_121633_create_sales_table', 1),
(16, '2021_04_10_234849_create_giftcards_table', 1),
(17, '2021_04_11_134122_create_products_table', 1),
(18, '2021_04_12_140608_create_product_warehouses_table', 1),
(19, '2021_04_13_133142_create_suppliers_table', 1),
(20, '2021_04_15_141421_create_brands_table', 1),
(21, '2021_04_18_231804_create_coupons_table', 1),
(22, '2021_04_19_160432_create_adjusments_table', 1),
(23, '2021_04_19_161153_create_productadjusments_table', 1),
(24, '2021_04_19_161344_create_delivaries_table', 1),
(25, '2021_04_20_152641_create_billers_table', 1),
(26, '2021_04_20_160427_create_payment_with_credit_card_table', 1),
(27, '2021_04_21_143925_create_settings_table', 1),
(28, '2021_04_21_161229_create_stock__counts_table', 1),
(29, '2021_04_21_220057_create_product_sales_table', 1),
(30, '2021_04_22_100652_create_payment_with_gift_cards_table', 1),
(31, '2021_04_22_100920_create_payment_with_cheques_table', 1),
(32, '2021_04_22_101004_create_payments_table', 1),
(33, '2021_04_22_180250_create_employees_table', 1),
(34, '2021_04_23_163244_add_status_to_users_table', 1),
(35, '2021_04_24_211257_create_notifications_table', 1),
(36, '2021_04_25_122724_create_drafts_tables', 1),
(37, '2021_04_27_092803_create_purchases_table', 2),
(38, '2021_04_27_095414_create_product__purchases_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `change` double DEFAULT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_reference`, `user_id`, `purchase_id`, `sale_id`, `customer_id`, `amount`, `change`, `paying_method`, `payment_note`, `created_at`, `updated_at`) VALUES
(1, '668996169', 1, 1168477282, 2, 1, 43037, 1540, '1', 'kjhkjh', '2021-04-27 16:09:07', '2021-04-29 13:08:14'),
(2, '4', 2, 7, 3, 2, 5520, NULL, 'card', 'sdfsdf', '2021-04-27 16:12:44', '2021-04-27 16:12:44'),
(3, '190680195', 1, 637553085, 4, 1, 4029.2, NULL, '1', NULL, '2021-04-29 08:54:54', '2021-04-29 12:50:08'),
(4, '5', 1, 2, 6, 1, 250, NULL, 'gift card', 'kj', '2021-04-29 10:58:11', '2021-04-29 10:58:11'),
(5, '2032294908', 1, 1825223039, 7, 1, 3381.7, 0, '4', 'kljkl', '2021-04-29 12:54:28', '2021-04-29 12:54:28'),
(6, '4', 1, 5, 8, 1, 250, NULL, 'gift card', 'kj', '2021-04-29 13:00:33', '2021-04-29 13:00:33'),
(7, '0', 1, 6, 11, 1, 1597, NULL, 'card', 'hgfh', '2021-04-29 13:03:48', '2021-04-29 13:03:48'),
(8, '748550783', 1, 42, NULL, NULL, 46123, 0, 'cash', 'jkhjkjhk', '2021-05-04 20:18:20', '2021-05-04 20:18:20'),
(9, '313739406', 1, 41, NULL, NULL, 110129.7, 0, 'cash', 'ghjhjghj', '2021-05-04 20:39:16', '2021-05-04 20:39:16'),
(10, '1956040088', 1, 40, NULL, NULL, 6656, -1656, 'cash', 'ghjghj', '2021-05-04 20:39:29', '2021-05-04 20:39:29'),
(11, '110685276', 1, 40, NULL, NULL, 6656, 0, 'card', 'fghfdhh', '2021-05-04 20:41:14', '2021-05-04 20:41:14'),
(12, '527702574', 1, 46, NULL, NULL, 29143.25, 0, 'card', 'fgdfgfdfg', '2021-05-05 06:16:16', '2021-05-05 06:16:16'),
(13, '1598876987', 1, 48, NULL, NULL, 26539.6, 0, 'cash', 'gfhfhfg', '2021-05-05 07:24:18', '2021-05-05 07:24:18'),
(14, '1212159533', 1, 48, NULL, NULL, 29414.6, 0, 'cash', NULL, '2021-05-05 07:59:49', '2021-05-05 07:59:49'),
(15, '6', 1, 0, 13, 1, 1406, NULL, 'card', 'fhgh', '2021-05-05 13:58:23', '2021-05-05 13:58:23'),
(16, '977182073', 1, 48, NULL, NULL, 34589.6, 0, 'card', 'ghjghj', '2021-05-05 15:15:22', '2021-05-05 15:15:22'),
(17, '1059071348', 1, 415531240, 14, 2, 11079, NULL, '1', NULL, '2021-05-05 15:53:42', '2021-05-05 16:00:43'),
(18, '1086208111', 1, 47, NULL, NULL, 25295.5, 0, 'card', 'fdgfgsfdg', '2021-06-09 06:04:02', '2021-06-09 06:04:02'),
(19, '206121836', 1, 50, NULL, NULL, 2162, 338, 'cheque', 'gvcbcbvcb', '2021-06-10 07:31:33', '2021-06-10 07:31:33'),
(20, '1920961758', 1, 49, NULL, NULL, 11981, -11781, 'cash', 'dfd', '2021-06-10 07:49:18', '2021-06-10 07:49:18'),
(21, '838327252', 1, 47, NULL, NULL, 25295.5, -24295.5, 'cash', 'dfdsf', '2021-06-10 08:21:52', '2021-06-10 08:21:52'),
(22, '2098492521', 1, 47, NULL, NULL, 25295.5, -23295.5, 'cash', 'dfdsf', '2021-06-10 08:22:57', '2021-06-10 08:22:57'),
(23, '1900209758', 1, 47, NULL, NULL, 25295.5, 0, 'card', NULL, '2021-06-10 08:24:06', '2021-06-10 08:24:06'),
(24, '1210550773', 1, 46, NULL, NULL, 30580.75, 0, 'card', NULL, '2021-06-10 09:39:16', '2021-06-10 09:39:16'),
(25, '583392670', 1, 47, NULL, NULL, 25295.5, -15295.5, 'cash', NULL, '2021-06-10 09:45:00', '2021-06-10 09:45:00'),
(26, '780452395', 1, 47, NULL, NULL, 25295.5, -15000.5, 'cash', NULL, '2021-06-10 09:46:59', '2021-06-10 09:46:59'),
(27, '383106223', 1, 47, NULL, NULL, 25295.5, 0, 'card', NULL, '2021-06-10 09:50:34', '2021-06-10 09:50:34'),
(28, '921605706', 1, 48, NULL, NULL, 39764.6, 0, 'cheque', NULL, '2021-06-10 09:50:47', '2021-06-10 09:50:47'),
(29, '621465053', 1, 47, NULL, NULL, 25295.5, -15295.5, 'cheque', NULL, '2021-06-10 09:52:48', '2021-06-10 09:52:48'),
(30, '1518065284', 1, 47, NULL, NULL, 25295.5, -10295.5, 'card', NULL, '2021-06-10 09:54:02', '2021-06-10 09:54:02'),
(31, '1048867970', 1, 47, NULL, NULL, 25295.5, -10295.5, 'card', NULL, '2021-06-10 09:54:08', '2021-06-10 09:54:08'),
(32, '1657110660', 1, 47, NULL, NULL, 25295.5, -295.5, 'cheque', NULL, '2021-06-10 09:54:23', '2021-06-10 09:54:23'),
(33, '573310929', 1, 47, NULL, NULL, 25295.5, 0, 'card', NULL, '2021-06-10 09:57:32', '2021-06-10 09:57:32'),
(34, '664217924', 1, 47, NULL, NULL, 25295.5, -20295.5, 'cheque', NULL, '2021-06-10 09:58:10', '2021-06-10 09:58:10'),
(35, '1074796336', 1, 47, NULL, NULL, 25295.5, -15295.5, 'card', NULL, '2021-06-10 09:59:03', '2021-06-10 09:59:03'),
(36, '848941069', 1, 47, NULL, NULL, 25295.5, -15295.5, 'cheque', NULL, '2021-06-10 09:59:07', '2021-06-10 09:59:07'),
(37, '1887275322', 1, 47, NULL, NULL, 25295.5, 0, 'card', NULL, '2021-06-10 09:59:32', '2021-06-10 09:59:32'),
(38, '879623598', 1, 47, NULL, NULL, 25295.5, -20295.5, 'cheque', NULL, '2021-06-10 10:00:32', '2021-06-10 10:00:32'),
(39, '645779056', 1, 47, NULL, NULL, 25295.5, -15295.5, 'card', NULL, '2021-06-10 10:25:35', '2021-06-10 10:25:35'),
(40, '1143459523', 1, 47, NULL, NULL, 25295.5, -10295.5, 'cheque', NULL, '2021-06-10 10:26:05', '2021-06-10 10:26:05'),
(41, '1403035209', 1, 47, NULL, NULL, 25295.5, -9295.5, 'cash', NULL, '2021-06-10 10:26:33', '2021-06-10 10:26:33'),
(42, '535256251', 1, 47, NULL, NULL, 25295.5, -8295.5, 'card', NULL, '2021-06-10 10:26:42', '2021-06-10 10:26:42'),
(43, '715597145', 1, 47, NULL, NULL, 25295.5, -7295.5, 'card', NULL, '2021-06-10 10:27:17', '2021-06-10 10:27:17'),
(44, '2143491294', 1, 47, NULL, NULL, 25295.5, 0, 'card', NULL, '2021-06-10 10:29:14', '2021-06-10 10:29:14'),
(45, '1148131152', 1, 47, NULL, NULL, 25295.5, -15295.5, 'card', NULL, '2021-06-10 10:30:27', '2021-06-10 10:30:27'),
(46, '61676721', 1, 47, NULL, NULL, 25295.5, -10295.5, 'cheque', NULL, '2021-06-10 10:30:42', '2021-06-10 10:30:42'),
(47, '93683246', 1, 47, NULL, NULL, 25295.5, -9295.5, 'cash', NULL, '2021-06-10 10:31:15', '2021-06-10 10:31:15'),
(48, '1219713054', 1, 47, NULL, NULL, 25295.5, -8295.5, 'cheque', NULL, '2021-06-10 10:35:41', '2021-06-10 10:35:41'),
(49, '684522767', 1, 47, NULL, NULL, 25295.5, -7295.5, 'cash', NULL, '2021-06-13 06:13:38', '2021-06-13 06:13:38'),
(50, '39572315', 1, 47, NULL, NULL, 25295.5, -6295.5, 'card', NULL, '2021-06-13 06:13:53', '2021-06-13 06:13:53'),
(51, '914809943', 1, 47, NULL, NULL, 25295.5, -5295.5, 'cheque', NULL, '2021-06-13 06:15:00', '2021-06-13 06:15:00'),
(52, '1518946972', 1, 47, NULL, NULL, 25295.5, -4295.5, 'card', 'fdgdfgfd', '2021-06-13 09:52:09', '2021-06-13 09:52:09'),
(53, '7', 1, 3, 15, 1, 1405, 0, 'card', NULL, '2021-06-13 09:59:14', '2021-06-13 09:59:14'),
(54, '6', 1, 1, 16, 1, 894, 0, 'cash', 'ddd', '2021-06-13 10:03:35', '2021-06-13 10:03:35');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_cheques`
--

CREATE TABLE `payment_with_cheques` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_with_cheques`
--

INSERT INTO `payment_with_cheques` (`id`, `payment_id`, `cheque_no`, `created_at`, `updated_at`) VALUES
(1, 5, '88878', '2021-04-29 12:54:29', '2021-04-29 12:54:29'),
(2, 19, '121223323', '2021-06-10 07:31:34', '2021-06-10 07:31:34'),
(3, 28, NULL, '2021-06-10 09:50:47', '2021-06-10 09:50:47'),
(4, 29, NULL, '2021-06-10 09:52:48', '2021-06-10 09:52:48'),
(5, 32, NULL, '2021-06-10 09:54:23', '2021-06-10 09:54:23'),
(6, 34, NULL, '2021-06-10 09:58:10', '2021-06-10 09:58:10'),
(7, 36, NULL, '2021-06-10 09:59:07', '2021-06-10 09:59:07'),
(8, 38, NULL, '2021-06-10 10:00:32', '2021-06-10 10:00:32'),
(9, 40, NULL, '2021-06-10 10:26:05', '2021-06-10 10:26:05'),
(10, 46, '34354', '2021-06-10 10:30:42', '2021-06-10 10:30:42'),
(11, 48, '435435', '2021-06-10 10:35:41', '2021-06-10 10:35:41'),
(12, 51, '12345687', '2021-06-13 06:15:00', '2021-06-13 06:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_card`
--

CREATE TABLE `payment_with_credit_card` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_with_credit_card`
--

INSERT INTO `payment_with_credit_card` (`id`, `payment_id`, `customer_id`, `customer_stripe_id`, `card_number`, `charge_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'null', '545354', 'null', '2021-04-27 16:12:44', '2021-04-27 16:12:44'),
(2, 7, 1, 'null', '456546', 'null', '2021-04-29 13:03:48', '2021-04-29 13:03:48'),
(3, 11, 1, NULL, '456546', NULL, '2021-05-04 20:41:14', '2021-05-04 20:41:14'),
(4, 12, 1, NULL, '11111', NULL, '2021-05-05 06:16:16', '2021-05-05 06:16:16'),
(5, 15, 1, 'null', '2252525', 'null', '2021-05-05 13:58:23', '2021-05-05 13:58:23'),
(6, 16, 1, NULL, 'jghj', NULL, '2021-05-05 15:15:22', '2021-05-05 15:15:22'),
(7, 17, 2, 'null', '', 'null', '2021-05-05 15:53:42', '2021-05-05 15:53:42'),
(8, 18, 1, NULL, '1111111', NULL, '2021-06-09 06:04:02', '2021-06-09 06:04:02'),
(9, 31, 1, NULL, '234234', NULL, '2021-06-10 09:54:08', '2021-06-10 09:54:08'),
(10, 45, 1, NULL, '23324', NULL, '2021-06-10 10:30:27', '2021-06-10 10:30:27'),
(11, 50, 1, NULL, '324324', NULL, '2021-06-13 06:13:53', '2021-06-13 06:13:53'),
(12, 52, 1, NULL, '43543543', NULL, '2021-06-13 09:52:09', '2021-06-13 09:52:09'),
(13, 53, 1, 'null', '43345435', 'null', '2021-06-13 09:59:14', '2021-06-13 09:59:14');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_gift_cards`
--

CREATE TABLE `payment_with_gift_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `gift_card_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_with_gift_cards`
--

INSERT INTO `payment_with_gift_cards` (`id`, `payment_id`, `gift_card_id`, `created_at`, `updated_at`) VALUES
(1, 4, 4, '2021-04-29 10:58:11', '2021-04-29 10:58:11'),
(2, 6, 4, '2021-04-29 13:00:33', '2021-04-29 13:00:33');

-- --------------------------------------------------------

--
-- Table structure for table `productadjusments`
--

CREATE TABLE `productadjusments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjusments_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productadjusments`
--

INSERT INTO `productadjusments` (`id`, `adjusments_id`, `product_id`, `qty`, `note`, `created_at`, `updated_at`) VALUES
(262, 134, 4, 30, 'jkl', '2021-05-05 14:47:00', '2021-05-05 14:51:14'),
(263, 134, 3, 20, 'jkl', '2021-05-05 14:47:00', '2021-05-05 14:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `purchase_unit_id` int(11) DEFAULT NULL,
  `sale_unit_id` int(11) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `alert_quantity` int(11) DEFAULT NULL,
  `promotion` int(11) DEFAULT NULL,
  `promotion_price` double DEFAULT NULL,
  `starting_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_variant` int(11) DEFAULT NULL,
  `featured` int(11) DEFAULT NULL,
  `product_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `type`, `barcode_symbology`, `brand_id`, `category_id`, `unit_id`, `purchase_unit_id`, `sale_unit_id`, `cost`, `price`, `qty`, `alert_quantity`, `promotion`, `promotion_price`, `starting_date`, `last_date`, `tax_id`, `tax_method`, `image`, `file`, `is_variant`, `featured`, `product_list`, `qty_list`, `price_list`, `product_details`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'product-1', 'standard', '408938', 1, 1, 1, 1, 1, 200, 250, 342, 10, 1, 500, '2021-04-13', '2021-05-01', 10, 1, 'ceccf03ca59db4bf1e68f383a78fd775.jpg', '', NULL, 1, '', '', '', '<p>sdfsdfsd</p>', 1, '2021-04-27 15:25:51', '2021-06-13 09:59:14'),
(2, 'product-2', 'standard', '584571', 2, 2, 2, 1, 1, 300, 350, 464, 10, NULL, NULL, NULL, NULL, 10, 2, '0c55975088f04a8d9bc0466a294707b7.jpg', '', NULL, 1, '', '', '', '<p>dfsdfsdf</p>', 1, '2021-04-27 15:27:01', '2021-06-13 10:03:35'),
(3, 'product-3', 'standard', '173136', 2, 2, 3, 1, 1, 400, 450, 309, 10, NULL, NULL, NULL, NULL, 10, 2, 'f108883366d27481a11058631a3ed261.jpg', '', NULL, NULL, '', '', '', '<p>ytutyuytu</p>', 1, '2021-04-27 15:28:01', '2021-06-13 10:03:35'),
(4, 'product-4', 'standard', '140171', 1, 1, 2, 1, 1, 500, 550, 535, 10, NULL, NULL, NULL, NULL, 15, 2, '3d24b70f05da3a58f944686c7935fc67.jpg', '', NULL, 1, '', '', '', '<p>fghfghfghfgh</p>', 1, '2021-04-27 15:29:39', '2021-05-03 20:34:34'),
(5, 'combo-1', 'combo', '366523', 2, 2, NULL, NULL, NULL, NULL, 56750, 200, NULL, NULL, NULL, NULL, NULL, 10, 2, '33dde9c10c11e17cb2d32913eb6143a3.jpg', '', NULL, 1, '1,2,3,19', '10,15,20,50', '250,350,450,800', '<p>ghjghjghj</p>', 1, '2021-04-27 18:33:55', '2021-05-04 11:48:32'),
(20, 'aumlan', 'standard', '600301', 1, 1, 3, 1, 1, 100, 200, 5, 5, 1, 200, '2021-06-10', '2021-06-30', 10, 2, 'd2194bd61ee0dcab3818335fb2c5d0f1.jpg', '', NULL, 1, '', '', '', '<p>dfjkghjfdgjkfdhkjg</p>', 1, '2021-06-10 05:53:54', '2021-06-10 07:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `product_sales`
--

CREATE TABLE `product_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sales`
--

INSERT INTO `product_sales` (`id`, `sale_id`, `product_id`, `qty`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 15, 1250, 20, 15, 60, 500, '2021-04-27 16:07:25', '2021-04-29 12:49:27'),
(2, 1, 2, 10, 1750, 20, 15, 60, 500, '2021-04-27 16:07:25', '2021-04-29 12:49:27'),
(3, 1, 3, 1, 2250, 20, 15, 60, 500, '2021-04-27 16:07:26', '2021-04-29 12:49:27'),
(4, 2, 1, 10, 1250, 20, 15, 60, 500, '2021-04-27 16:09:06', '2021-04-29 13:08:13'),
(5, 2, 2, 40, 1750, 20, 15, 60, 500, '2021-04-27 16:09:06', '2021-04-29 13:08:13'),
(6, 2, 3, 50, 2250, 20, 15, 60, 500, '2021-04-27 16:09:07', '2021-04-29 13:08:14'),
(7, 3, 1, 5, 1250, 20, 15, 60, 500, '2021-04-27 16:12:43', '2021-04-27 16:12:43'),
(8, 3, 2, 5, 1750, 20, 15, 60, 500, '2021-04-27 16:12:43', '2021-04-27 16:12:43'),
(9, 3, 3, 5, 2250, 20, 15, 60, 500, '2021-04-27 16:12:43', '2021-04-27 16:12:43'),
(10, 4, 1, 15, 250, 10, 10, 32, 2522, '2021-04-29 08:54:53', '2021-04-29 12:22:24'),
(11, 4, 2, 10, 350, 10, 10, 32, 5272, '2021-04-29 08:54:53', '2021-04-29 12:22:24'),
(12, 5, 1, 1, 250, 20, 15, 60, 500, '2021-04-29 10:56:02', '2021-04-29 10:56:02'),
(13, 6, 1, 1, 250, 20, 15, 60, 500, '2021-04-29 10:58:11', '2021-04-29 10:58:11'),
(14, 7, 1, 5, 250, 10, 10, 32, 1272, '2021-04-29 12:54:28', '2021-04-29 12:54:28'),
(15, 7, 2, 5, 350, 10, 10, 32, 1772, '2021-04-29 12:54:28', '2021-04-29 12:54:28'),
(16, 8, 1, 1, 250, 20, 15, 60, 500, '2021-04-29 13:00:32', '2021-04-29 13:00:32'),
(17, 9, 1, 4, 1000, 20, 15, 60, 500, '2021-04-29 13:03:08', '2021-04-29 13:03:08'),
(18, 10, 1, 4, 1000, 20, 15, 60, 500, '2021-04-29 13:03:22', '2021-04-29 13:03:22'),
(19, 11, 1, 2, 500, 20, 15, 60, 500, '2021-04-29 13:03:48', '2021-04-29 13:03:48'),
(20, 11, 2, 2, 700, 20, 15, 60, 500, '2021-04-29 13:03:48', '2021-04-29 13:03:48'),
(21, 12, 1, 3, 750, 20, 15, 60, 500, '2021-04-29 13:04:24', '2021-04-29 13:04:24'),
(22, 13, 2, 2, 700, 20, 15, 60, 500, '2021-05-05 13:58:23', '2021-05-05 13:58:23'),
(23, 13, 1, 2, 500, 20, 15, 60, 500, '2021-05-05 13:58:23', '2021-05-05 13:58:23'),
(24, 14, 1, 10, 250, 0, 10, 25, 2525, '2021-05-05 15:53:41', '2021-05-05 15:53:41'),
(25, 14, 2, 20, 350, 0, 10, 35, 7035, '2021-05-05 15:53:41', '2021-05-05 15:53:41'),
(26, 15, 1, 1, 250, 20, 15, 60, 500, '2021-06-13 09:59:14', '2021-06-13 09:59:14'),
(27, 15, 2, 3, 1050, 20, 15, 60, 500, '2021-06-13 09:59:14', '2021-06-13 09:59:14'),
(28, 16, 3, 1, 450, 20, 15, 60, 500, '2021-06-13 10:03:35', '2021-06-13 10:03:35'),
(29, 16, 2, 1, 350, 20, 15, 60, 500, '2021-06-13 10:03:35', '2021-06-13 10:03:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouses`
--

CREATE TABLE `product_warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `purchase_unit_id` int(11) DEFAULT NULL,
  `sale_unit_id` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warehouses`
--

INSERT INTO `product_warehouses` (`id`, `product_id`, `variant_id`, `warehouse_id`, `qty`, `purchase_unit_id`, `sale_unit_id`, `created_at`, `updated_at`) VALUES
(109, '1', NULL, 1, 60, NULL, NULL, '2021-05-04 22:10:07', '2021-06-09 06:16:09'),
(110, '2', NULL, 1, 102, NULL, NULL, '2021-05-04 22:10:07', '2021-06-13 10:03:35'),
(111, '3', NULL, 1, 149, NULL, NULL, '2021-05-04 22:10:08', '2021-06-13 10:03:35'),
(112, '1', NULL, 2, 5, NULL, NULL, '2021-05-05 09:00:21', '2021-06-13 09:59:14'),
(113, '2', NULL, 2, 23, NULL, NULL, '2021-05-05 09:00:21', '2021-06-13 09:59:14'),
(119, '4', NULL, 3, 60, NULL, NULL, '2021-05-05 14:26:49', '2021-05-05 14:51:15'),
(120, '3', NULL, 3, 30, NULL, NULL, '2021-05-05 14:47:01', '2021-05-05 14:51:15'),
(121, '1', NULL, 3, 15, NULL, NULL, '2021-05-05 16:02:17', '2021-06-10 10:41:28'),
(122, '2', NULL, 3, 20, NULL, NULL, '2021-05-05 16:02:18', '2021-06-10 10:41:28'),
(123, '20', NULL, 2, 5, NULL, NULL, '2021-06-10 07:13:03', '2021-06-10 07:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `product__purchases`
--

CREATE TABLE `product__purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `received` double DEFAULT NULL,
  `purchase_unit_id` int(11) DEFAULT NULL,
  `net_unit_cost` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product__purchases`
--

INSERT INTO `product__purchases` (`id`, `purchase_id`, `product_id`, `variant_id`, `qty`, `received`, `purchase_unit_id`, `net_unit_cost`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(75, 46, 1, NULL, 10, 10, 1, 250, 0, 15, 25, 2525, '2021-05-04 22:10:07', '2021-05-05 06:18:10'),
(76, 46, 2, NULL, 30, 30, 2, 350, 0, 15, 35, 7035, '2021-05-04 22:10:07', '2021-05-04 22:13:54'),
(77, 46, 3, NULL, 30, 30, 3, 450, 0, 15, 45, 13545, '2021-05-04 22:10:08', '2021-05-04 22:10:08'),
(78, 47, 1, NULL, 10, 10, 1, 250, 0, 10, 25, 2525, '2021-05-05 06:28:11', '2021-06-09 06:16:09'),
(79, 47, 2, NULL, 20, 20, 2, 350, 0, 10, 35, 7035, '2021-05-05 06:28:11', '2021-06-09 06:16:09'),
(80, 47, 3, NULL, 30, 30, 3, 450, 0, 10, 45, 13545, '2021-05-05 06:28:12', '2021-06-09 06:16:09'),
(81, 48, 1, NULL, 20, 20, 1, 250, 0, 15, 25, 2525, '2021-05-05 06:53:27', '2021-05-05 07:53:22'),
(82, 48, 2, NULL, 20, 20, 2, 350, 0, 15, 35, 7035, '2021-05-05 06:53:27', '2021-05-05 07:15:51'),
(83, 48, 3, NULL, 50, 50, 3, 450, 0, 15, 45, 13545, '2021-05-05 06:53:27', '2021-05-05 15:18:30'),
(84, 49, 1, NULL, 15, 15, 1, 250, 0, 10, 25, 3775, '2021-05-05 16:02:17', '2021-06-10 10:41:28'),
(85, 49, 2, NULL, 20, 20, 2, 350, 0, 10, 35, 7035, '2021-05-05 16:02:18', '2021-06-10 10:41:28'),
(86, 50, 20, NULL, 10, 5, 3, 200, 0, 10, 20, 2020, '2021-06-10 07:13:03', '2021-06-10 07:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double DEFAULT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double NOT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `user_id`, `warehouse_id`, `supplier_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `status`, `payment_status`, `document`, `note`, `created_at`, `updated_at`) VALUES
(46, 'Aumlan', 1, 1, 1, 3, 70, 0, 105, 26605, 15, NULL, 100, 100, 30580.75, 30580.75, 0, 1, '', 'jghjghj', '2021-05-04 22:10:07', '2021-06-10 09:39:16'),
(47, 'Aumlan', 1, 1, 3, 3, 60, 0, 105, 23105, 10, NULL, 200, 100, 25295.5, 21000, 0, 0, '', 'fg', '2021-05-05 06:28:11', '2021-06-13 09:53:33'),
(48, 'Aumlan', 1, 1, 2, 3, 90, 0, 105, 34605, 15, NULL, 201, 200, 39764.6, 39764.6, 0, 1, '', 'kjhkjhk', '2021-05-05 06:53:27', '2021-06-10 09:50:47'),
(49, 'Aumlan', 1, 3, 1, 3, 45, 0, 142.5, 16392, 10, NULL, 100, 200, 18121.2, 11981, 0, 0, '', 'ghkjk', '2021-05-05 16:02:17', '2021-06-13 09:55:33'),
(50, 'Aumlan', 1, 2, 2, 2, 20, 0, 55, 5555, 10, NULL, 100, 50, 6050.5, 2162, 1, 0, '', 'asdsds', '2021-06-10 07:13:03', '2021-06-13 10:07:02');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double NOT NULL,
  `order_discount` double NOT NULL,
  `cupon_id` int(11) DEFAULT NULL,
  `cupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `reference_no`, `user_id`, `Customer_id`, `warehouse_id`, `biller_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `order_tax_rate`, `order_tax`, `order_discount`, `cupon_id`, `cupon_discount`, `shipping_cost`, `sale_status`, `payment_status`, `document`, `paid_amount`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(1, 9, 2, 1, 1, 1, 3, 15, 0, 0, 5250, 5520, 10, 520, 50, 1, 260, 60, 1, 1, 'null', 5520, 'sdfsdf', 'sdfsdf', '2021-04-28 16:07:25', '2021-04-27 16:07:25'),
(2, 9, 1, 1, 1, 1, 3, 100, 60, 210, 39120, 43037, 10, 3907, 50, 1, NULL, 60, 1, 1, 'null', 44577, 'sdfsdf', 'sdfsdf', '2021-04-28 16:09:06', '2021-04-29 13:08:13'),
(3, 2, 2, 1, 1, 1, 3, 15, 0, 0, 5250, 5520, 10, 520, 50, 1, 260, 60, 1, 1, 'null', 5520, 'sdfsdf', 'sdfsdf', '2021-04-28 16:12:42', '2021-04-27 16:12:42'),
(4, 1354609813, 1, 1, 1, 1, 1, 15, 10, 42, 3772, 4029.2, 10, 357.2, 200, NULL, NULL, 100, 1, 1, 'null', NULL, 'dfgdfgfd', 'dfgfdgfdg', '2021-04-29 08:54:53', '2021-04-29 12:50:08'),
(5, 5, 1, 3, NULL, 1, 1, 1, 0, 0, 250, 250, 0, 0, 0, 1, NULL, 0, 1, 1, 'null', 250, 'jhkh', 'hjk', '2021-04-29 10:56:02', '2021-04-29 10:56:02'),
(6, 7, 1, 3, 1, 1, 1, 1, 0, 0, 250, 250, 0, 0, 0, 1, NULL, 0, 1, 1, 'null', 250, 'jhkh', 'hjk', '2021-04-29 10:58:11', '2021-04-29 10:58:11'),
(7, 1308670705, 1, 1, 1, 1, 2, 10, 20, 64, 3044, 3381.7, 10, 226.7, 777, 1, NULL, 888, 1, 1, NULL, 3381.7, 'jkl', 'jkljkhl', '2021-04-29 12:54:28', '2021-04-29 12:54:28'),
(8, 2, 1, 3, 1, 1, 1, 1, 0, 0, 250, 250, 0, 0, 0, 1, NULL, 0, 1, 1, 'null', 250, 'jhkh', 'hjk', '2021-04-29 13:00:32', '2021-04-29 13:00:32'),
(9, 3, 1, 1, NULL, 1, 3, 10, 0, 0, 3530, 4083, 10, 353, 0, 1, NULL, 200, 1, 1, 'null', 4083, 'gfh', 'ghgh', '2021-04-29 13:03:08', '2021-04-29 13:03:08'),
(10, 6, 1, 1, NULL, 1, 3, 10, 0, 0, 3530, 4083, 10, 353, 0, 1, NULL, 200, 1, 1, 'null', 4083, 'gfh', 'ghgh', '2021-04-29 13:03:22', '2021-04-29 13:03:22'),
(11, 8, 1, 1, 1, 1, 2, 4, 0, 0, 1270, 1597, 10, 127, 0, 1, NULL, 200, 1, 1, 'null', 1597, 'gfh', 'ghgh', '2021-04-29 13:03:48', '2021-04-29 13:03:48'),
(12, 4, 1, 2, NULL, 1, 2, 4, 0, 0, 1135, 1135, 0, 0, 0, 1, NULL, 0, 1, 1, 'null', 500, 'fgh', 'fgh', '2021-04-29 13:04:24', '2021-04-29 13:04:24'),
(13, 2, 1, 1, 1, 1, 2, 4, 0, 0, 1270, 1406, 10, 126, 10, 1, NULL, 20, 1, 1, 'null', 1406, 'fgh', 'fghfgh', '2021-05-05 13:58:22', '2021-05-05 13:58:22'),
(14, 1070126651, 1, 2, 1, 2, 2, 30, 0, 80, 9560, 11079, 15, 1419, 100, 1, NULL, 200, 1, 1, 'null', 11079, 'ghjghj', 'ghjghfj', '2021-06-06 15:53:41', '2021-06-06 16:00:43'),
(15, 0, 1, 1, 2, 1, 2, 4, 0, 0, 1405, 1405, 0, 0, 0, 1, NULL, 0, 1, 1, 'null', 1405, NULL, NULL, '2021-06-13 09:59:14', '2021-06-13 09:59:14'),
(16, 3, 1, 1, 1, 1, 2, 2, 0, 0, 880, 894, 20, 174, 10, 1, 200, 50, 1, 1, 'null', 1000, 'dgff', 'dfgfdg', '2021-06-13 10:03:35', '2021-06-13 10:03:35');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_access` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copy_write` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `site_logo`, `currency`, `time_zone`, `staff_access`, `currency_position`, `copy_write`, `app_version`, `created_at`, `updated_at`) VALUES
(1, 'SpringSoft POS', 'photo.jpg', 'BDT', 'Asia/Dhaka', 'own', 'prefix', 'SpringSoft-IT', 'version 1.0', '2021-04-27 12:01:50', '2021-04-27 12:01:50'),
(2, 'SpringSoft POS', '745938d2f2e94b795b47135d20436f88.png', 'BDT', 'Asia/Dhaka', 'own', NULL, 'SpringSoft-IT', 'version 1.0', '2021-04-27 13:08:58', '2021-04-27 13:08:58'),
(3, 'SpringSoft POS aumlan', '745938d2f2e94b795b47135d20436f88.png', 'BDT', 'Asia/Dhaka', 'own', NULL, 'SpringSoft-IT', 'version 1.0', '2021-06-10 07:18:42', '2021-06-10 07:18:42'),
(4, 'SpringSoft POS', '745938d2f2e94b795b47135d20436f88.png', 'BDT', 'Asia/Dhaka', 'own', NULL, 'SpringSoft-IT', 'version 1.0', '2021-06-10 07:18:48', '2021-06-10 07:18:48'),
(5, 'SpringSoft POS aumlan', '745938d2f2e94b795b47135d20436f88.png', 'BDT', 'Asia/Dhaka', 'own', NULL, 'SpringSoft-IT', 'version 1.0', '2021-06-10 07:43:25', '2021-06-10 07:43:25'),
(6, 'SpringSoft POS', '745938d2f2e94b795b47135d20436f88.png', 'BDT', 'Asia/Dhaka', 'own', NULL, 'SpringSoft-IT', 'version 1.0', '2021-06-10 07:43:46', '2021-06-10 07:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `stock__counts`
--

CREATE TABLE `stock__counts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock__counts`
--

INSERT INTO `stock__counts` (`id`, `user_id`, `reference_no`, `warehouse_id`, `type`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'r-id: 1Aumlan', 1, '0', 'category-1, category-2', 'brand-1', '2021-04-29 09:45:00', '2021-04-29 09:45:00'),
(2, 1, 'r-id: 1Aumlan', 2, '1', 'category-1, category-3', 'brand-1, brand-2', '2021-04-29 09:45:32', '2021-04-29 09:45:32'),
(3, 1, 'r-id: 1Aumlan', 1, '0', 'category-1, category-2', 'brand-2, brand-3, ddddd', '2021-05-03 09:14:59', '2021-05-03 09:14:59'),
(4, 1, 'r-id: 1Aumlan', 1, '1', 'category-3', 'brand-1', '2021-06-09 06:01:57', '2021-06-09 06:01:57');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `company_name`, `vat_number`, `phone`, `email`, `image`, `address`, `city`, `state`, `postal_code`, `country`, `created_at`, `updated_at`) VALUES
(1, 'supplier-1', 'company 1', '45645654', '0174587587', 'supplier1@gmail.com', 'ccea529698ce4c823219ca0edffb1718.jpg', 'aaaaaaaa', 'dhaka', 'dhaka', 1229, 'BD', '2021-04-27 13:32:47', '2021-04-27 13:32:47'),
(2, 'supplier-2', 'company 2', '56678', '01745825479', 'supplier2@gmail.com', '', 'dfsdfsdfds', 'dhaka', 'dhaka', 1234, 'BD', '2021-04-27 13:33:46', '2021-04-27 13:37:12'),
(3, 'supplier-3', 'company-3', '57567', '01745123624', 'supplier3@gmail.com', '9f1892843d856aaa2e5a3a30295cd4a7.jpg', 'aaaaaa', 'sylhet', 'sylhet', 1472, 'BDD', '2021-04-27 13:38:18', '2021-04-27 13:50:23');

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
  `role` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aumlan', 'admin1@gmail.com', NULL, '$2y$10$TDY.dawhpnv9NRNaneR3.usZ0yhlxryHVItSdAoLseh2TFBNun7si', 2, 1, NULL, '2021-06-13 09:54:49', '2021-06-13 09:54:49'),
(2, 'Admin 2', 'admin2@gmail.com', NULL, '$2y$10$xSYjo7DFoj//vZjAC/SzAum/BIKeLvhRwzzydZ6IweYZ2WH8LVnha', 1, 1, NULL, '2021-04-27 13:07:06', '2021-04-27 13:07:06'),
(3, 'Admin 3', 'admin3@gmail.com', NULL, '$2y$10$xNv474CGN6tBQCpU0bcxn.0OsR81y0ktEeVdBWnbVPjURDOOTvWCi', 1, 1, NULL, '2021-04-29 07:28:42', '2021-04-29 07:28:42'),
(4, 'Owner 2', 'owner2@gmail.com', NULL, '$2y$10$lE76yYpP31Z41tYSffvRgOubmk1NC5qApPo4.EGH.uoZobG3AzfKy', 2, 1, NULL, '2021-04-29 07:37:41', '2021-04-29 07:37:41'),
(5, 'Employee 2', 'employee2@gmail.com', NULL, '$2y$10$oXGSYm.0TxWsBg0wvrNaQ.8wslLvr9C/SLX0uOGquuf8LAxFDuP3u', 3, 0, NULL, '2021-04-29 07:38:37', '2021-04-29 07:38:37'),
(6, 'Employee 1', 'employee1@gmail.com', NULL, '$2y$10$gUHx04.cBAbRd8nhfeAIl.f5YU3lKeZoaq4tO6R89iftOIhQAoyxq', 3, 1, NULL, '2021-04-29 07:49:22', '2021-04-29 07:49:22'),
(7, 'Owner 1', 'owner1@gmail.com', NULL, '$2y$10$IGDMjoXdFlfG1rxGDz/sBeeVz.5fOp4c1TP6bhO6O1mrANWwHc6Em', 2, 1, NULL, '2021-04-29 08:13:05', '2021-04-29 08:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'warehouse- 1', '01745846587', 'warehouse1@gmail.com', 'dhaka', 1, NULL, NULL),
(2, 'warehouse- 2', '01745821369', 'warehouse2@gmail.com', 'Sylhet', 1, NULL, NULL),
(3, 'warehouse- 3', '01712548459', 'warehouse3@gmail.com', 'Rajshahi', 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjusments`
--
ALTER TABLE `adjusments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_infos`
--
ALTER TABLE `app_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
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
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `get_user_information`
--
ALTER TABLE `get_user_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `giftcards`
--
ALTER TABLE `giftcards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `give_answers`
--
ALTER TABLE `give_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_cheques`
--
ALTER TABLE `payment_with_cheques`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_gift_cards`
--
ALTER TABLE `payment_with_gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productadjusments`
--
ALTER TABLE `productadjusments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warehouses`
--
ALTER TABLE `product_warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product__purchases`
--
ALTER TABLE `product__purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock__counts`
--
ALTER TABLE `stock__counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjusments`
--
ALTER TABLE `adjusments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_infos`
--
ALTER TABLE `app_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `get_user_information`
--
ALTER TABLE `get_user_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `giftcards`
--
ALTER TABLE `giftcards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `give_answers`
--
ALTER TABLE `give_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `payment_with_cheques`
--
ALTER TABLE `payment_with_cheques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment_with_gift_cards`
--
ALTER TABLE `payment_with_gift_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productadjusments`
--
ALTER TABLE `productadjusments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_warehouses`
--
ALTER TABLE `product_warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `product__purchases`
--
ALTER TABLE `product__purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock__counts`
--
ALTER TABLE `stock__counts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
