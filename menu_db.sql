-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 02, 2023 at 02:28 PM
-- Server version: 8.0.30
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `menu_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `nationality` varchar(200) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `about_me` text,
  `video_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `about_content`
--

CREATE TABLE `about_content` (
  `id` int NOT NULL,
  `about_id` int DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `admin_notification`
--

CREATE TABLE `admin_notification` (
  `id` int NOT NULL,
  `notification_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `seen_status` int NOT NULL DEFAULT '0',
  `is_admin_enable` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `send_at` datetime DEFAULT NULL,
  `seen_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_notification_list`
--

CREATE TABLE `admin_notification_list` (
  `id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` longtext,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allergens`
--

CREATE TABLE `allergens` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `images` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `call_waiter_list`
--

CREATE TABLE `call_waiter_list` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `table_no` int NOT NULL,
  `status` int NOT NULL,
  `is_ring` int NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `code` varchar(2) NOT NULL,
  `dial_code` varchar(5) NOT NULL,
  `currency_name` varchar(20) NOT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `code`, `dial_code`, `currency_name`, `currency_symbol`, `currency_code`) VALUES
(1, 'Andorra', 'AD', '+376', 'Euro', '€', 'EUR'),
(2, 'United Arab Emirates', 'AE', '+971', 'United Arab Emirates', 'د.إ', 'AED'),
(3, 'Afghanistan', 'AF', '+93', 'Afghan afghani', '؋', 'AFN'),
(4, 'Antigua and Barbuda', 'AG', '+1268', 'East Caribbean dolla', '$', 'XCD'),
(5, 'Anguilla', 'AI', '+1264', 'East Caribbean dolla', '$', 'XCD'),
(6, 'Albania', 'AL', '+355', 'Albanian lek', 'L', 'ALL'),
(7, 'Armenia', 'AM', '+374', 'Armenian dram', '', 'AMD'),
(8, 'Angola', 'AO', '+244', 'Angolan kwanza', 'Kz', 'AOA'),
(9, 'Argentina', 'AR', '+54', 'Argentine peso', '$', 'ARS'),
(10, 'Austria', 'AT', '+43', 'Euro', '€', 'EUR'),
(11, 'Australia', 'AU', '+61', 'Australian dollar', '$', 'AUD'),
(12, 'Aruba', 'AW', '+297', 'Aruban florin', 'ƒ', 'AWG'),
(13, 'Azerbaijan', 'AZ', '+994', 'Azerbaijani manat', '', 'AZN'),
(14, 'Barbados', 'BB', '+1246', 'Barbadian dollar', '$', 'BBD'),
(15, 'Bangladesh', 'BD', '+880', 'Bangladeshi taka', '৳', 'BDT'),
(16, 'Belgium', 'BE', '+32', 'Euro', '€', 'EUR'),
(17, 'Burkina Faso', 'BF', '+226', 'West African CFA fra', 'Fr', 'XOF'),
(18, 'Bulgaria', 'BG', '+359', 'Bulgarian lev', 'лв', 'BGN'),
(19, 'Bahrain', 'BH', '+973', 'Bahraini dinar', '.د.ب', 'BHD'),
(20, 'Burundi', 'BI', '+257', 'Burundian franc', 'Fr', 'BIF'),
(21, 'Benin', 'BJ', '+229', 'West African CFA fra', 'Fr', 'XOF'),
(22, 'Bermuda', 'BM', '+1441', 'Bermudian dollar', '$', 'BMD'),
(23, 'Brazil', 'BR', '+55', 'Brazilian real', 'R$', 'BRL'),
(24, 'Bhutan', 'BT', '+975', 'Bhutanese ngultrum', 'Nu.', 'BTN'),
(25, 'Botswana', 'BW', '+267', 'Botswana pula', 'P', 'BWP'),
(26, 'Belarus', 'BY', '+375', 'Belarusian ruble', 'Br', 'BYR'),
(27, 'Belize', 'BZ', '+501', 'Belize dollar', '$', 'BZD'),
(28, 'Canada', 'CA', '+1', 'Canadian dollar', '$', 'CAD'),
(29, 'Switzerland', 'CH', '+41', 'Swiss franc', 'Fr', 'CHF'),
(30, 'Cote d\'Ivoire', 'CI', '+225', 'West African CFA fra', 'Fr', 'XOF'),
(31, 'Cook Islands', 'CK', '+682', 'New Zealand dollar', '$', 'NZD'),
(32, 'Chile', 'CL', '+56', 'Chilean peso', '$', 'CLP'),
(33, 'Cameroon', 'CM', '+237', 'Central African CFA ', 'Fr', 'XAF'),
(34, 'China', 'CN', '+86', 'Chinese yuan', '¥ or 元', 'CNY'),
(35, 'Colombia', 'CO', '+57', 'Colombian peso', '$', 'COP'),
(36, 'Costa Rica', 'CR', '+506', 'Costa Rican colón', '₡', 'CRC'),
(37, 'Cuba', 'CU', '+53', 'Cuban convertible pe', '$', 'CUC'),
(38, 'Cape Verde', 'CV', '+238', 'Cape Verdean escudo', 'Esc or $', 'CVE'),
(39, 'Cyprus', 'CY', '+357', 'Euro', '€', 'EUR'),
(40, 'Czech Republic', 'CZ', '+420', 'Czech koruna', 'Kč', 'CZK'),
(41, 'Germany', 'DE', '+49', 'Euro', '€', 'EUR'),
(42, 'Djibouti', 'DJ', '+253', 'Djiboutian franc', 'Fr', 'DJF'),
(43, 'Denmark', 'DK', '+45', 'Danish krone', 'kr', 'DKK'),
(44, 'Dominica', 'DM', '+1767', 'East Caribbean dolla', '$', 'XCD'),
(45, 'Dominican Republic', 'DO', '+1849', 'Dominican peso', '$', 'DOP'),
(46, 'Algeria', 'DZ', '+213', 'Algerian dinar', 'د.ج', 'DZD'),
(47, 'Ecuador', 'EC', '+593', 'United States dollar', '$', 'USD'),
(48, 'Estonia', 'EE', '+372', 'Euro', '€', 'EUR'),
(49, 'Egypt', 'EG', '+20', 'Egyptian pound', '£ or ج.م', 'EGP'),
(50, 'Eritrea', 'ER', '+291', 'Eritrean nakfa', 'Nfk', 'ERN'),
(51, 'Spain', 'ES', '+34', 'Euro', '€', 'EUR'),
(52, 'Ethiopia', 'ET', '+251', 'Ethiopian birr', 'Br', 'ETB'),
(53, 'Finland', 'FI', '+358', 'Euro', '€', 'EUR'),
(54, 'Fiji', 'FJ', '+679', 'Fijian dollar', '$', 'FJD'),
(55, 'Faroe Islands', 'FO', '+298', 'Danish krone', 'kr', 'DKK'),
(56, 'France', 'FR', '+33', 'Euro', '€', 'EUR'),
(57, 'Gabon', 'GA', '+241', 'Central African CFA ', 'Fr', 'XAF'),
(58, 'United Kingdom', 'GB', '+44', 'British pound', '£', 'GBP'),
(59, 'Grenada', 'GD', '+1473', 'East Caribbean dolla', '$', 'XCD'),
(60, 'Georgia', 'GE', '+995', 'Georgian lari', 'ლ', 'GEL'),
(61, 'Guernsey', 'GG', '+44', 'British pound', '£', 'GBP'),
(62, 'Ghana', 'GH', '+233', 'Ghana cedi', '₵', 'GHS'),
(63, 'Gibraltar', 'GI', '+350', 'Gibraltar pound', '£', 'GIP'),
(64, 'Guinea', 'GN', '+224', 'Guinean franc', 'Fr', 'GNF'),
(65, 'Equatorial Guinea', 'GQ', '+240', 'Central African CFA ', 'Fr', 'XAF'),
(66, 'Greece', 'GR', '+30', 'Euro', '€', 'EUR'),
(67, 'Guatemala', 'GT', '+502', 'Guatemalan quetzal', 'Q', 'GTQ'),
(68, 'Guinea-Bissau', 'GW', '+245', 'West African CFA fra', 'Fr', 'XOF'),
(69, 'Guyana', 'GY', '+595', 'Guyanese dollar', '$', 'GYD'),
(70, 'Hong Kong', 'HK', '+852', 'Hong Kong dollar', '$', 'HKD'),
(71, 'Honduras', 'HN', '+504', 'Honduran lempira', 'L', 'HNL'),
(72, 'Croatia', 'HR', '+385', 'Croatian kuna', 'kn', 'HRK'),
(73, 'Haiti', 'HT', '+509', 'Haitian gourde', 'G', 'HTG'),
(74, 'Hungary', 'HU', '+36', 'Hungarian forint', 'Ft', 'HUF'),
(75, 'Indonesia', 'ID', '+62', 'Indonesian rupiah', 'Rp', 'IDR'),
(76, 'Ireland', 'IE', '+353', 'Euro', '€', 'EUR'),
(77, 'Israel', 'IL', '+972', 'Israeli new shekel', '₪', 'ILS'),
(78, 'Isle of Man', 'IM', '+44', 'British pound', '£', 'GBP'),
(79, 'India', 'IN', '+91', 'Indian rupee', '₹', 'INR'),
(80, 'Iraq', 'IQ', '+964', 'Iraqi dinar', 'ع.د', 'IQD'),
(81, 'Iceland', 'IS', '+354', 'Icelandic króna', 'kr', 'ISK'),
(82, 'Italy', 'IT', '+39', 'Euro', '€', 'EUR'),
(83, 'Jersey', 'JE', '+44', 'British pound', '£', 'GBP'),
(84, 'Jamaica', 'JM', '+1876', 'Jamaican dollar', '$', 'JMD'),
(85, 'Jordan', 'JO', '+962', 'Jordanian dinar', 'د.ا', 'JOD'),
(86, 'Japan', 'JP', '+81', 'Japanese yen', '¥', 'JPY'),
(87, 'Kenya', 'KE', '+254', 'Kenyan shilling', 'Sh', 'KES'),
(88, 'Kyrgyzstan', 'KG', '+996', 'Kyrgyzstani som', 'лв', 'KGS'),
(89, 'Cambodia', 'KH', '+855', 'Cambodian riel', '៛', 'KHR'),
(90, 'Kiribati', 'KI', '+686', 'Australian dollar', '$', 'AUD'),
(91, 'Comoros', 'KM', '+269', 'Comorian franc', 'Fr', 'KMF'),
(92, 'Kuwait', 'KW', '+965', 'Kuwaiti dinar', 'د.ك', 'KWD'),
(93, 'Cayman Islands', 'KY', '+ 345', 'Cayman Islands dolla', '$', 'KYD'),
(94, 'Kazakhstan', 'KZ', '+7 7', 'Kazakhstani tenge', '₸', 'KZT'),
(95, 'Laos', 'LA', '+856', 'Lao kip', '₭', 'LAK'),
(96, 'Lebanon', 'LB', '+961', 'Lebanese pound', 'ل.ل', 'LBP'),
(97, 'Saint Lucia', 'LC', '+1758', 'East Caribbean dolla', '$', 'XCD'),
(98, 'Liechtenstein', 'LI', '+423', 'Swiss franc', 'Fr', 'CHF'),
(99, 'Sri Lanka', 'LK', '+94', 'Sri Lankan rupee', 'Rs or රු', 'LKR'),
(100, 'Liberia', 'LR', '+231', 'Liberian dollar', '$', 'LRD'),
(101, 'Lesotho', 'LS', '+266', 'Lesotho loti', 'L', 'LSL'),
(102, 'Lithuania', 'LT', '+370', 'Euro', '€', 'EUR'),
(103, 'Luxembourg', 'LU', '+352', 'Euro', '€', 'EUR'),
(104, 'Latvia', 'LV', '+371', 'Euro', '€', 'EUR'),
(105, 'Morocco', 'MA', '+212', 'Moroccan dirham', 'د.م.', 'MAD'),
(106, 'Monaco', 'MC', '+377', 'Euro', '€', 'EUR'),
(107, 'Moldova', 'MD', '+373', 'Moldovan leu', 'L', 'MDL'),
(108, 'Montenegro', 'ME', '+382', 'Euro', '€', 'EUR'),
(109, 'Madagascar', 'MG', '+261', 'Malagasy ariary', 'Ar', 'MGA'),
(110, 'Marshall Islands', 'MH', '+692', 'United States dollar', '$', 'USD'),
(111, 'Mali', 'ML', '+223', 'West African CFA fra', 'Fr', 'XOF'),
(112, 'Myanmar', 'MM', '+95', 'Burmese kyat', 'Ks', 'MMK'),
(113, 'Mongolia', 'MN', '+976', 'Mongolian tögrög', '₮', 'MNT'),
(114, 'Mauritania', 'MR', '+222', 'Mauritanian ouguiya', 'UM', 'MRO'),
(115, 'Montserrat', 'MS', '+1664', 'East Caribbean dolla', '$', 'XCD'),
(116, 'Malta', 'MT', '+356', 'Euro', '€', 'EUR'),
(117, 'Mauritius', 'MU', '+230', 'Mauritian rupee', '₨', 'MUR'),
(118, 'Maldives', 'MV', '+960', 'Maldivian rufiyaa', '.ރ', 'MVR'),
(119, 'Malawi', 'MW', '+265', 'Malawian kwacha', 'MK', 'MWK'),
(120, 'Mexico', 'MX', '+52', 'Mexican peso', '$', 'MXN'),
(121, 'Malaysia', 'MY', '+60', 'Malaysian ringgit', 'RM', 'MYR'),
(122, 'Mozambique', 'MZ', '+258', 'Mozambican metical', 'MT', 'MZN'),
(123, 'Namibia', 'NA', '+264', 'Namibian dollar', '$', 'NAD'),
(124, 'New Caledonia', 'NC', '+687', 'CFP franc', 'Fr', 'XPF'),
(125, 'Niger', 'NE', '+227', 'West African CFA fra', 'Fr', 'XOF'),
(126, 'Nigeria', 'NG', '+234', 'Nigerian naira', '₦', 'NGN'),
(127, 'Nicaragua', 'NI', '+505', 'Nicaraguan córdoba', 'C$', 'NIO'),
(128, 'Netherlands', 'NL', '+31', 'Euro', '€', 'EUR'),
(129, 'Norway', 'NO', '+47', 'Norwegian krone', 'kr', 'NOK'),
(130, 'Nepal', 'NP', '+977', 'Nepalese rupee', '₨', 'NPR'),
(131, 'Nauru', 'NR', '+674', 'Australian dollar', '$', 'AUD'),
(132, 'Niue', 'NU', '+683', 'New Zealand dollar', '$', 'NZD'),
(133, 'New Zealand', 'NZ', '+64', 'New Zealand dollar', '$', 'NZD'),
(134, 'Oman', 'OM', '+968', 'Omani rial', 'ر.ع.', 'OMR'),
(135, 'Panama', 'PA', '+507', 'Panamanian balboa', 'B/.', 'PAB'),
(136, 'Peru', 'PE', '+51', 'Peruvian nuevo sol', 'S/.', 'PEN'),
(137, 'French Polynesia', 'PF', '+689', 'CFP franc', 'Fr', 'XPF'),
(138, 'Papua New Guinea', 'PG', '+675', 'Papua New Guinean ki', 'K', 'PGK'),
(139, 'Philippines', 'PH', '+63', 'Philippine peso', '₱', 'PHP'),
(140, 'Pakistan', 'PK', '+92', 'Pakistani rupee', '₨', 'PKR'),
(141, 'Poland', 'PL', '+48', 'Polish z?oty', 'zł', 'PLN'),
(142, 'Portugal', 'PT', '+351', 'Euro', '€', 'EUR'),
(143, 'Palau', 'PW', '+680', 'Palauan dollar', '$', ''),
(144, 'Paraguay', 'PY', '+595', 'Paraguayan guaraní', '₲', 'PYG'),
(145, 'Qatar', 'QA', '+974', 'Qatari riyal', 'ر.ق', 'QAR'),
(146, 'Romania', 'RO', '+40', 'Romanian leu', 'lei', 'RON'),
(147, 'Serbia', 'RS', '+381', 'Serbian dinar', 'дин. or din.', 'RSD'),
(148, 'Russia', 'RU', '+7', 'Russian ruble', '', 'RUB'),
(149, 'Rwanda', 'RW', '+250', 'Rwandan franc', 'Fr', 'RWF'),
(150, 'Saudi Arabia', 'SA', '+966', 'Saudi riyal', 'ر.س', 'SAR'),
(151, 'Solomon Islands', 'SB', '+677', 'Solomon Islands doll', '$', 'SBD'),
(152, 'Seychelles', 'SC', '+248', 'Seychellois rupee', '₨', 'SCR'),
(153, 'Sudan', 'SD', '+249', 'Sudanese pound', 'ج.س.', 'SDG'),
(154, 'Sweden', 'SE', '+46', 'Swedish krona', 'kr', 'SEK'),
(155, 'Singapore', 'SG', '+65', 'Brunei dollar', '$', 'BND'),
(156, 'Slovenia', 'SI', '+386', 'Euro', '€', 'EUR'),
(157, 'Slovakia', 'SK', '+421', 'Euro', '€', 'EUR'),
(158, 'Sierra Leone', 'SL', '+232', 'Sierra Leonean leone', 'Le', 'SLL'),
(159, 'San Marino', 'SM', '+378', 'Euro', '€', 'EUR'),
(160, 'Senegal', 'SN', '+221', 'West African CFA fra', 'Fr', 'XOF'),
(161, 'Somalia', 'SO', '+252', 'Somali shilling', 'Sh', 'SOS'),
(162, 'Suriname', 'SR', '+597', 'Surinamese dollar', '$', 'SRD'),
(163, 'El Salvador', 'SV', '+503', 'United States dollar', '$', 'USD'),
(164, 'Swaziland', 'SZ', '+268', 'Swazi lilangeni', 'L', 'SZL'),
(165, 'Chad', 'TD', '+235', 'Central African CFA ', 'Fr', 'XAF'),
(166, 'Togo', 'TG', '+228', 'West African CFA fra', 'Fr', 'XOF'),
(167, 'Thailand', 'TH', '+66', 'Thai baht', '฿', 'THB'),
(168, 'Tajikistan', 'TJ', '+992', 'Tajikistani somoni', '₸', 'TJS'),
(169, 'Turkmenistan', 'TM', '+993', 'Turkmenistan manat', 'm', 'TMT'),
(170, 'Tunisia', 'TN', '+216', 'Tunisian dinar', 'د.ت', 'TND'),
(171, 'Tonga', 'TO', '+676', 'Tongan pa?anga', 'T$', 'TOP'),
(172, 'Turkey', 'TR', '+90', 'Turkish lira', '', 'TRY'),
(173, 'Trinidad and Tobago', 'TT', '+1868', 'Trinidad and Tobago ', '$', 'TTD'),
(174, 'Tuvalu', 'TV', '+688', 'Australian dollar', '$', 'AUD'),
(175, 'Taiwan', 'TW', '+886', 'New Taiwan dollar', '$', 'TWD'),
(176, 'Ukraine', 'UA', '+380', 'Ukrainian hryvnia', '₴', 'UAH'),
(177, 'Uganda', 'UG', '+256', 'Ugandan shilling', 'Sh', 'UGX'),
(178, 'United States', 'US', '+1', 'United States dollar', '$', 'USD'),
(179, 'Uruguay', 'UY', '+598', 'Uruguayan peso', '$', 'UYU'),
(180, 'Uzbekistan', 'UZ', '+998', 'Uzbekistani som', '', 'UZS'),
(181, 'Vietnam', 'VN', '+84', 'Vietnamese ??ng', '₫', 'VND'),
(182, 'Vanuatu', 'VU', '+678', 'Vanuatu vatu', 'Vt', 'VUV'),
(183, 'Wallis and Futuna', 'WF', '+681', 'CFP franc', 'Fr', 'XPF'),
(184, 'Samoa', 'WS', '+685', 'Samoan t?l?', 'T', 'WST'),
(185, 'Yemen', 'YE', '+967', 'Yemeni rial', '﷼', 'YER'),
(186, 'South Africa', 'ZA', '+27', 'South African rand', 'R', 'ZAR'),
(187, 'Zambia', 'ZM', '+260', 'Zambian kwacha', 'ZK', 'ZMW'),
(188, 'Zimbabwe', 'ZW', '+263', 'Botswana pula', 'P', 'BWP');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_list`
--

CREATE TABLE `coupon_list` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `total_limit` int NOT NULL,
  `total_used` int NOT NULL,
  `created_at` datetime NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `time_zone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country_name`, `currency_code`, `icon`, `time_zone`) VALUES
(1, 'Argentinian Peso', 'ARS', '&#36;', ''),
(2, 'Australian Dollar', 'AUD', '&#36;', ''),
(3, 'Brazilian Real', 'BRL', '&#36;', ''),
(4, 'Canadian Dollar', 'CAD', ' &#36;', ''),
(5, 'Swiss Franc', 'CHF', '&#67', ''),
(6, 'Czech Koruna', 'CZK', '&#75;&#269;', ''),
(7, 'Danish Krone', 'DKK', '&#107;&#114;', ''),
(8, 'Euro ', 'EUR', '&#8364;', ''),
(9, 'British Pound', 'GBP', ' &#163;', ''),
(10, 'Hong Kong Dollar', 'HKD', '&#36;', ''),
(11, 'Hungarian Forint', 'HUF', '&#70;&#116;', ''),
(12, 'Indian Rupee', 'INR', '&#8377;', ''),
(13, 'Israeli New Shekel', 'ILS', ' &#8362;', ''),
(14, 'Japanese Yen', 'JPY', ' &#165;', ''),
(15, 'Mexican Peso', 'MXN', '&#36;', ''),
(16, 'Malaysian Ringgit ', 'MYR', '&#82;&#77;', ''),
(17, 'Norwegian Krone', 'NOK', '  &#107;&#114;', ''),
(18, 'New Zealand Dollar', 'NZD', ' &#36;', ''),
(19, 'Philippine Peso', 'PHP', '&#8369;', ''),
(20, 'Polish Zloty', 'PLN', '&#122;&#322;', ''),
(21, 'Russian Ruble', 'RUB', '&#1088;&#1091;&#1073;', ''),
(22, 'Swedish Krona ', 'SEK', ' &#107;&#114;', ''),
(23, 'Singapore Dollar', 'SGD', ' &#36;', ''),
(24, 'Thai Baht', 'THB', '&#3647;', ''),
(25, 'Taiwan New Dollar', 'TWD', '&#78;&#84;&#36;', ''),
(26, 'United States Dollar', 'USD', ' &#36;', '');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_area_list`
--

CREATE TABLE `delivery_area_list` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `area` varchar(255) NOT NULL,
  `cost` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dine_in`
--

CREATE TABLE `dine_in` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `table_no` int NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `id` int NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `msg` longtext NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`id`, `type`, `msg`, `status`, `created_at`) VALUES
(1, 'password_recovery', '\"<p><b><span xss=\\\"removed\\\">Password Recovery Mail from form<\\/span><\\/b> {SITE_NAME}<br> Hello {USERNAME} Use this {PASSWORD} password to login {SITE_NAME} Don\\\\\'t share this password anyone\\u00a0<\\/p>\"', 1, '2020-11-22 10:54:51');

-- --------------------------------------------------------

--
-- Table structure for table `extra_libraries`
--

CREATE TABLE `extra_libraries` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `heading`, `title`, `details`, `status`, `created_at`) VALUES
(1, '', 'How to create  Restaurant', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore repellat dicta officiis voluptates quas et enim facilis voluptatum esse cumque amet beatae assumenda, in, consequatur eos eius, eveniet temporibus asperiores?</p>', 1, '2021-02-25 16:16:51'),
(2, '', 'How to make payments', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore repellat dicta officiis voluptates quas et enim facilis voluptatum esse cumque amet beatae assumenda, in, consequatur eos eius, eveniet temporibus asperiores?</p>', 1, '2021-02-25 16:17:01'),
(3, '', 'How to subscribe', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore repellat dicta officiis voluptates quas et enim facilis voluptatum esse cumque amet beatae assumenda, in, consequatur eos eius, eveniet temporibus asperiores?</p>', 1, '2021-02-25 16:17:21'),
(4, NULL, 'How to create menu', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore repellat dicta<br></p>', 1, '2021-02-25 16:17:36');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int NOT NULL,
  `features` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `is_features` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `features`, `slug`, `status`, `is_features`, `created_at`) VALUES
(1, 'Welcome Page', 'welcome', 1, 1, '2020-09-27 11:21:49'),
(2, 'Menu ', 'menu', 1, 1, '2020-09-27 11:24:28'),
(3, 'Packages', 'packages', 1, 1, '2020-09-28 10:51:50'),
(4, 'specialities', 'specialities', 1, 1, '2020-09-27 17:17:21'),
(5, 'Qr code', 'qr-code', 1, 1, '2020-09-27 11:26:03'),
(6, 'Whatsapp Order', 'whatsapp', 1, 1, '2020-09-27 11:26:19'),
(7, 'Online Order', 'order', 1, 1, '2020-09-27 13:31:06'),
(8, 'Reservation', 'reservation', 1, 1, '2020-09-27 13:31:06'),
(9, 'Contacts', 'contacts', 1, 0, '2020-09-27 13:31:06'),
(10, 'Digital Payment', 'online-payment', 1, 1, '2021-06-05 12:39:21'),
(11, 'OneSignal & PWA', 'pwa-push', 1, 1, '2022-09-08 23:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_list`
--

CREATE TABLE `hotel_list` (
  `id` int NOT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `room_numbers` longtext,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `how_it_works`
--

CREATE TABLE `how_it_works` (
  `id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text,
  `icon` varchar(255) DEFAULT NULL,
  `is_icon` int NOT NULL DEFAULT '1',
  `images` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `how_it_works`
--

INSERT INTO `how_it_works` (`id`, `title`, `details`, `icon`, `is_icon`, `images`, `thumb`, `status`, `created_at`) VALUES
(1, 'Create Your Restaurant', 'Create a new restaurant with scanning QR code or With a package', '<i class=\"fa fa-bath\" aria-hidden=\"true\"></i>', 0, 'uploads/big/d6a67c8dc3f91184f4c2461ac554d5ef.png', 'uploads/thumb/d6a67c8dc3f91184f4c2461ac554d5ef.png', 1, '2021-02-25 13:41:14'),
(2, 'Make Payment', 'After create your restaurant make a payment with PayPal, Stripe, Razorpay or Offline payment method', '<i class=\"fab fa-autoprefixer\"></i>', 1, 'uploads/big/112e1f4de3e7f5a7d39c9682b21b9913.png', 'uploads/thumb/112e1f4de3e7f5a7d39c9682b21b9913.png', 1, '2021-02-25 13:47:14'),
(3, 'Create  a menu', 'Select menus from our restaurant and make order easily with booking or home delivery', '', 0, 'uploads/big/359cf0722719344d9721ed0d5f605a82.png', 'uploads/thumb/359cf0722719344d9721ed0d5f605a82.png', 1, '2021-02-25 15:36:48'),
(4, 'Ordering via chat', 'After finalize create menu you can order via WhatsApp or can continue chat and confirm order', '<i class=\"fa fa-qrcode\" aria-hidden=\"true\"></i>', 1, 'uploads/big/73b481e4c9ee15d0e392d961600f36bf.png', 'uploads/thumb/73b481e4c9ee15d0e392d961600f36bf.png', 1, '2021-02-25 15:34:53'),
(5, 'Track order', 'Track your order by scanning QR code or send order with WhatsApp or quick response', '<i class=\"fa fa-credit-card-alt\" aria-hidden=\"true\"></i>', 1, 'uploads/big/e9a406638047f4c604b613735e05be27.png', 'uploads/thumb/e9a406638047f4c604b613735e05be27.png', 1, '2021-02-25 15:32:38'),
(6, 'Orders analytics', 'Get detailed report about your orders and earning with sales graph. Track your business grows', NULL, 1, 'uploads/big/00b9ebef97fe4be5f7a810d7197f01ca.png', 'uploads/thumb/00b9ebef97fe4be5f7a810d7197f01ca.png', 1, '2021-02-25 15:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `cat_id` int NOT NULL,
  `allergen_id` varchar(255) DEFAULT NULL,
  `title` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title_ar` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title_uz` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title_ru` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title_ch` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title_fr` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title_po` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title_hi` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `images` varchar(200) NOT NULL,
  `thumb` varchar(200) NOT NULL,
  `veg_type` int NOT NULL DEFAULT '0',
  `price` varchar(255) NOT NULL,
  `is_size` int DEFAULT '0',
  `details` text NOT NULL,
  `overview` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `overview_ar` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `overview_uz` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `overview_ru` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `overview_ch` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `overview_fr` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `overview_po` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `overview_hi` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `is_features` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `remaining` int NOT NULL,
  `in_stock` int NOT NULL,
  `img_type` int NOT NULL DEFAULT '1',
  `img_url` varchar(255) DEFAULT NULL,
  `extra_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `orders` int NOT NULL DEFAULT '0',
  `tax_fee` varchar(10) NOT NULL DEFAULT '0',
  `tax_status` varchar(10) NOT NULL DEFAULT '+'
) ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `user_id`, `shop_id`, `cat_id`, `allergen_id`, `title`, `title_ar`, `title_uz`, `title_ru`, `title_ch`, `title_fr`, `title_po`, `title_hi`, `images`, `thumb`, `veg_type`, `price`, `is_size`, `details`, `overview`, `overview_ar`, `overview_uz`, `overview_ru`, `overview_ch`, `overview_fr`, `overview_po`, `overview_hi`, `is_features`, `status`, `created_at`, `remaining`, `in_stock`, `img_type`, `img_url`, `extra_images`, `orders`, `tax_fee`, `tax_status`) VALUES
(1, 2, 1, 1, NULL, 'English', 'Arabic', 'Uzbek', 'Russian', 'Chinese', 'French', 'Portuguese', 'Hindi', 'uploads/big/6adc458225446a182d70cf178fb63b25.jpg', 'uploads/thumb/6adc458225446a182d70cf178fb63b25.jpg', 0, '123', 0, '', 'small description English *', 'small description Arabic', 'small description Uzbek', 'small description Russian', 'small description Chinese', 'small description French', 'small description Portuguese', 'small description Hindi', 0, 1, '2023-01-02 05:52:17', 0, 0, 1, '', NULL, 0, '0', '+');

-- --------------------------------------------------------

--
-- Table structure for table `item_content`
--

CREATE TABLE `item_content` (
  `id` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `label` varchar(250) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `item_extras`
--

CREATE TABLE `item_extras` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `item_id` int NOT NULL,
  `ex_name` varchar(255) NOT NULL,
  `ex_price` double NOT NULL,
  `ex_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_packages`
--

CREATE TABLE `item_packages` (
  `id` int NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `is_price` int NOT NULL DEFAULT '0',
  `item_id` varchar(255) NOT NULL,
  `is_discount` int NOT NULL,
  `discount` int NOT NULL,
  `duration` int NOT NULL,
  `price` double NOT NULL,
  `final_price` double NOT NULL,
  `details` text NOT NULL,
  `overview` text NOT NULL,
  `images` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `is_upcoming` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `live_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `is_special` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `is_home` int NOT NULL,
  `in_stock` int NOT NULL,
  `remaining` int NOT NULL,
  `table_no` int NOT NULL DEFAULT '0',
  `qr_link` varchar(255) DEFAULT NULL,
  `img_type` int NOT NULL DEFAULT '1',
  `img_url` varchar(255) DEFAULT NULL,
  `orders` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `item_sizes`
--

CREATE TABLE `item_sizes` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `item_sizes`
--

INSERT INTO `item_sizes` (`id`, `user_id`, `type`, `title`, `slug`, `status`, `shop_id`) VALUES
(1, 2, 'pizza', 'N', 'p_size_1', 1, 1),
(2, 2, 'pizza', '', 'p_size_2', 1, 1),
(3, 2, 'pizza', '', 'p_size_3', 1, 1),
(4, 2, 'pizza', '', 'p_size_4', 1, 1),
(5, 2, 'pizza', '', 'p_size_5', 1, 1),
(6, 2, 'burger', '', 'b_size_1', 1, 1),
(7, 2, 'burger', '', 'b_size_2', 1, 1),
(8, 2, 'burger', '', 'b_size_3', 1, 1),
(9, 2, 'burger', '', 'b_size_4', 1, 1),
(10, 2, 'burger', '', 'b_size_5', 1, 1),
(11, 2, 'weight', '', 'w_size1', 1, 1),
(12, 2, 'weight', '', 'w_size2', 1, 1),
(13, 2, 'weight', '', 'w_size3', 1, 1),
(14, 2, 'weight', '', 'w_size4', 1, 1),
(15, 2, 'weight', '', 'w_size5', 1, 1),
(16, 2, 'calories', '', 'c_size1', 1, 1),
(17, 2, 'calories', '', 'c_size2', 1, 1),
(18, 2, 'calories', '', 'c_size3', 1, 1),
(19, 2, 'calories', '', 'c_size4', 1, 1),
(20, 2, 'calories', '', 'c_size5', 1, 1),
(21, 2, 'sizes', '', 's_size1', 1, 1),
(22, 2, 'sizes', '', 's_size2', 1, 1),
(23, 2, 'sizes', '', 's_size3', 1, 1),
(24, 2, 'sizes', '', 's_size4', 1, 1),
(25, 2, 'sizes', '', 's_size5', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int NOT NULL,
  `lang_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `direction` varchar(20) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `lang_name`, `slug`, `direction`, `status`, `created_at`) VALUES
(3, 'English', 'english', 'ltr', 1, '2020-09-22 16:42:51'),
(16, 'Arabics', 'arabics', 'ltr', 1, '2023-01-02 05:55:51'),
(17, 'Uzbek', 'uzbek', 'ltr', 1, '2023-01-02 05:56:01'),
(18, 'Russian', 'russian', 'ltr', 1, '2023-01-02 05:56:10'),
(19, 'Chinese', 'chinese', 'ltr', 1, '2023-01-02 05:56:24'),
(20, 'French', 'french', 'ltr', 1, '2023-01-02 05:56:30'),
(21, 'Portuguese', 'portuguese', 'ltr', 1, '2023-01-02 05:56:38'),
(22, 'Hindi', 'hindi', 'ltr', 1, '2023-01-02 05:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `language_data`
--

CREATE TABLE `language_data` (
  `id` int NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `details` text NOT NULL,
  `english` text NOT NULL,
  `arabics` text,
  `uzbek` text,
  `russian` text,
  `chinese` text,
  `french` text,
  `portuguese` text,
  `hindi` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `language_data`
--

INSERT INTO `language_data` (`id`, `keyword`, `type`, `details`, `english`, `arabics`, `uzbek`, `russian`, `chinese`, `french`, `portuguese`, `hindi`) VALUES
(1, 'alert', 'admin', '', 'Alert!', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'net_income', 'admin', '', 'Net income', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'package_by_user', 'admin', '', 'Package by user', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'total_user', 'admin', '', 'Total Users', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'total_package', 'admin', '', 'Total Packages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'total_pages', 'admin', '', 'Total Pages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'new_payment_request', 'admin', '', 'New payment request', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'not_verified', 'admin', '', 'Not Verified', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'expired_account', 'admin', '', 'Expired account', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'expired_date', 'admin', '', 'Expired Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'toatl_revenue', 'admin', '', 'Total revenue', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'revenue', 'admin', '', 'Revenue', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'profile', 'admin', '', 'Profile', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'profile_link', 'admin', '', 'Profile link', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'copy', 'admin', '', 'Copy', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'coppied', 'admin', '', 'Coppied', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'free', 'user', '', 'Free', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'trial', 'admin', '', 'Trial', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'package_type', 'user', '', 'Package type', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'features', 'admin', '', 'Features', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'duration', 'admin', '', 'Duration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'package_name', 'admin', '', 'Package name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'using_trail_package', 'admin', '', 'You are using trail package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'trail_package_expired', 'admin', '', 'Your account will expire soon', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'change_package', 'admin', '', 'Change Package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'account_not_active', 'admin', '', 'Your Account is not active', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'active_now', 'admin', '', 'Active Now', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 're_subscription_msg', 'admin', '', 'You have to re-new your subscription to continue', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'active_account', 'admin', '', 'Active Account', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'expired_account_msg', 'admin', '', 'Sorry your account is expired', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'payment_pending_msg', 'admin', '', 'Your payment is pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'can_pay_subscription', 'admin', '', 'You can pay from subscription', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'pay_now', 'admin', '', 'Pay now', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'pending_request_msg', 'admin', '', 'Your payment request is pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'wait_for_confirmation', 'admin', '', 'Please Wait for the confirmation', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'try_another_method', 'admin', '', 'Try Another Method', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'account_not_verified', 'admin', '', 'Your Account is not Verified', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'resend_send_mail_link', 'admin', '', 'Already send a verification link on your email. if not found', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'resend', 'admin', '', 'Resend', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'if_mail_not_correct_msg', 'admin', '', 'If your email is not correct then change from profile option', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'email', 'label', '', 'Email', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'settings', 'label', '', 'Settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'email_sub', 'label', '', 'Email subjects', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'registration', 'label', '', 'Registration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'payment_gateway', 'label', '', 'Payment Gateway', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'recovery_password', 'label', '', 'Recovery password', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'admin_email', 'label', '', 'Admin email', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'php_mail', 'label', '', 'PHP Mail', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'smtp', 'label', '', 'SMTP', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'smtp_host', 'label', '', 'SMTP HOST', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'smtp_port', 'label', '', 'SMTP PORT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'smtp_password', 'label', '', 'SMTP PASSWORD', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'save_change', 'label', '', 'Save Change', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'paypal', 'label', '', 'Paypal', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'new_users', 'label', '', 'New Users', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'add_user', 'label', '', 'Add User', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'sl', 'label', '', 'Sl', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'username', 'label', '', 'Username', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'active_date', 'label', '', 'Active Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'account_type', 'label', '', 'Account type', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'action', 'label', '', 'Action', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'users', 'label', '', 'Users', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'status', 'label', '', 'Status', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'view_profile', 'label', '', 'View Profile', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'start_date', 'label', '', 'Start Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'free_account', 'label', '', 'Free account', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'trial_package', 'label', '', 'Trial Package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'not_active', 'admin', '', 'Not active yet', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'expired', 'label', '', 'Expired', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'active', 'label', '', 'Active', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'deactive', 'label', '', 'Deactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'verified', 'label', '', 'Verified', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'want_to_verify_this_account', 'admin', '', 'Do you want to verified this account?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'want_to_active_this_account', 'admin', '', 'Do you want to active this account?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'payment_is_verified', 'admin', '', 'You payment is verified', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'paid', 'admin', '', 'Paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'verified_offline_payment_msg', 'admin', '', ' Do You want to verify this payment? Payment will count as an offline payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'pending', 'admin', '', 'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'delete_user_msg', 'admin', '', ' Want to delete this user? Be careful This user will remove permanently.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'current_package', 'label', '', 'Current package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'submit', 'label', '', 'Submit', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'click_here', 'label', '', 'Click here!', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'add_new_user', 'label', '', 'Add New User', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'restaurant_user_name', 'admin', '', 'Restaurant Username', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'select_package', 'label', '', 'Select Package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'add_password', 'label', '', 'Add password', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'password', 'label', '', 'Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'password_msg_add_user', 'label', '', ' If you do not select add password, Password will create randomly and send user by email', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'create_page', 'label', '', 'Create Page', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'title', 'label', '', 'Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'slug', 'label', '', 'Slug', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'details', 'label', '', 'Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'live', 'label', '', 'Live', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 'hide', 'label', '', 'Hide', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'cancel', 'label', '', 'Cancel', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 'all_pages', 'admin', '', 'All Pages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'edit', 'label', '', 'Edit', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 'delete', 'label', '', 'Delete', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'faq', 'label', '', 'Faq', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 'faq_list', 'label', '', 'FAQ List', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'want_to_delete', 'label', '', 'Want to delete?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'how_it_works', 'label', '', 'How it works', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 'upload_image', 'label', '', 'Upload Image', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 'max', 'label', '', 'Max', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'image', 'label', '', 'Image', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'team', 'label', '', 'Team', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'designation', 'label', '', 'Designation', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'offline_payments', 'admin', '', 'Offline Payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'package', 'admin', '', 'Package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 'txn_id', 'admin', '', 'Txn id', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'request_date', 'label', '', 'Request Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 'approve', 'label', '', 'Approve', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 'approved', 'label', '', 'Approved', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'cookie_privacy', 'label', '', 'Cookies & Privacy', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'services', 'label', '', 'Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 'home_features', 'label', '', 'Home Features', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 'add_new', 'label', '', 'Add New', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'upload', 'admin', '', 'Upload', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 'select_direction', 'admin', '', 'Select Direction', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'left_side', 'label', '', 'Left Side', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'right_side', 'label', '', 'Right Side', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'max_character', 'label', '', 'Max character', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'icon', 'label', '', 'Icon', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 'close', 'label', '', 'Close', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'terms_condition', 'label', '', 'Terms & Conditions', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'payment_transaction', 'label', '', 'Payment Transaction', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 'payment_by', 'label', '', 'Payment by', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 'restaurant_details', 'home', '', 'Restaurant Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'restaurant_username', 'user', '', 'Restaurant username', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 'must_unique_english', 'user', '', 'Must be in English & Unique', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'county', 'user', '', 'County', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 'currency', 'user', '', 'Currency', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'dial_code', 'user', '', 'Dial code', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 'phone', 'user', '', 'Phone', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 'restaurant_full_name', 'user', '', 'Restaurant full name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 'short_name', 'user', '', 'Short name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 'location', 'user', '', 'Location', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 'gmap_link', 'user', '', 'Google Map link', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 'address', 'user', '', 'Address', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 'logo', 'user', '', 'Logo', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 'cover_photo', 'user', '', 'Cover Photo', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 'upload_cover_photo', 'user', '', 'Upload Cover Image', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'change_pass', 'user', '', 'Change password', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 'owner_name', 'user', '', 'Owner name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 'select_county', 'user', '', 'Select Country', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 'gender', 'user', '', 'Gender', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 'website', 'user', '', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 'old_pass', 'user', '', 'Old Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 'new_pass', 'user', '', 'New Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 'confirm_password', 'user', '', 'Confirm Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 'profile_pic', 'user', '', 'Profile Picture', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 'add_edit_info', 'label', '', 'Add / Edit Info', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 'shop_name', 'user', '', 'Shop Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 'create_your_restaurant', 'user', '', 'Create Your Restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 'warning', 'user', '', 'Warning!', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 'upload_images', 'user', '', 'Upload Images', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 'select', 'user', '', 'Select', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 'you_have', 'user', '', 'You have', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 'notifications', 'user', '', 'Notifications', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 'new_orders_today', 'user', '', 'New Orders today', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 'reservation_today', 'user', '', 'Reservation Today', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 'completed_orders', 'user', '', 'Completed orders', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 'error', 'user', '', 'Error', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 'copyright', 'admin', '', 'Copyright', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 'version', 'label', '', 'Version', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 'member_since', 'user', '', 'Member since', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 'last_login', 'admin', '', 'Last Login', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, 'logout', 'label', '', 'Logout', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 'dashboard', 'admin', '', 'Dashboard', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 'account_management', 'admin', '', 'Account MANAGEMENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 'packages_management', 'admin', '', 'PACKAGES Management', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 'package_list', 'admin', '', 'Package list', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 'order_types', 'admin', '', 'Order types', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 'site_management', 'admin', '', 'Site management', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 'home', 'admin', '', 'Home', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 'site_features', 'user', '', 'Site Features', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 'international', 'admin', '', 'INTERNATIONAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 'languages', 'admin', '', 'Languages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 'add_languages', 'admin', '', 'Add Languages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, 'dashboard_language', 'admin', '', 'Dashboard Languages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(181, 'fontend_language', 'admin', '', 'Frontend Languages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, 'site_setting', 'admin', '', 'Site Settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(183, 'site_settings', 'admin', '', 'Site settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 'email_settings', 'admin', '', 'Email Settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 'payment_settings', 'admin', '', 'Payment settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 'home_banner_setting', 'admin', '', 'Banner settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 'content', 'admin', '', 'Content', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 'pages', 'admin', '', 'Pages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 'add_page', 'admin', '', 'Add page', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 'cookies_privacy', 'admin', '', 'Cookie & Privacy', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 'user_transaction', 'admin', '', 'User\'s Transactions', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 'backup_database', 'admin', '', 'Backup Database', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 'subscriptions', 'user', '', 'Subscriptions', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, 'menu', 'user', '', 'Menu', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 'menu_categories', 'user', '', 'Menu Categories', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 'items', 'user', '', 'Items', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 'specialties', 'user', '', 'Specialties', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 'allergens', 'user', '', 'Allergens', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 'live_order', 'user', '', 'Live order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 'reservation', 'user', '', 'Reservation', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, 'available_days', 'user', '', 'Available days', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, 'portfolio', 'user', '', 'Portfolio', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 'social_sites', 'user', '', 'Social sites', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 'add_cover_photo', 'user', '', 'Add Cover Photo', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 'manage_features', 'user', '', 'Manage Features', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 'order_config', 'user', '', 'Order Configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 'layouts', 'user', '', 'Layouts', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 'deactive_account', 'user', '', 'Deactivate account', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 'success', 'label', '', 'Success', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'show_details', 'label', '', 'Show Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 'keyword', 'label', '', 'Keyword', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 'values', 'label', '', 'Values', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 'types', 'label', '', 'Types', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 'admin_language', 'admin', '', 'Admin language', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 'user_dashboard', 'label', '', 'User dashboard', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 'fontend_languages', 'label', '', 'Frontend Language', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 'others', 'label', '', 'Others', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 'lang_name', 'admin', '', 'Language name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 'language_slug', 'admin', '', 'Language Slug', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 'left_to_right', 'label', '', 'Left to right', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 'right_to_left', 'admin', '', 'Right to left', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 'price', 'admin', '', 'Price', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 'name', 'label', '', 'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 'create_category', 'user', '', 'Create Category', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, 'category_name', 'user', '', 'Category name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 'select_type', 'label', '', 'Select Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 'pizza', 'user', '', 'Pizza', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 'burger', 'user', '', 'Burger', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, 'order', 'user', '', 'order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, 'sizes', 'user', '', 'Sizes', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, 'size_name', 'user', '', 'Size Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, 'insert_category', 'user', '', 'Please Insert Category', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, 'insert_item_size', 'user', '', 'Please Insert Item Sizes', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, 'insert_item_size_msg', 'user', '', 'you can set price depends on size (size available for pizza & Burger)', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, 'info', 'label', '', 'Info!', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, 'you_can_add', 'user', '', 'You can add', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 'unlimited', 'user', '', 'Unlimited', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 'you_reached_max_limit', 'user', '', 'You reached the maximum limit', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(239, 'you_have_remaining', 'user', '', 'You have remaining', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(240, 'out_of', 'user', '', 'out of', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(241, 'add_items', 'user', '', 'add items', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(242, 'is_size', 'user', '', 'Is Size', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(243, 'veg_type', 'label', '', 'veg type', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, 'non_veg', 'label', '', 'Non veg', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, 'veg', 'label', '', 'veg', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(246, 'small_description', 'user', '', 'small description', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(247, 'show_in_homepage', 'user', '', 'Show in home page', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, 'add_packages', 'user', '', 'Add Package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(249, 'is_discount', 'user', '', 'Is Discount', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(250, 'custom_price', 'user', '', 'Custom Price', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(251, 'discount', 'user', '', 'discount', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, 'is_upcoming', 'user', '', 'Is Upcoming', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(253, 'days', 'user', '', 'days', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, 'empty_item_package', 'user', '', 'Empty Item For Packages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 'empty_item_package_msg', 'user', '', 'You have to create item without size for package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(256, 'is_price_msg_1', 'user', 'Is price is for custom price if you want to set custom price for package.', 'Is price is for custom price if you want to set custom price for package.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 'is_price_msg_2', 'user', 'Otherwise price will set  after calculation all items prices', 'Otherwise price will set after calculation all items prices', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, 'discount_msg', 'user', 'If you want to set discount for this package', 'If you want to set discount for this package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(259, 'featured', 'user', 'Featured', 'Featured', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(260, 'overview', 'user', 'Overview', 'overview', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(261, 'order_id', 'user', 'Order ID', 'Order ID', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, 'order_details', 'user', 'Order Details', 'Order Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(263, 'delivery_charge', 'user', 'Delivery charge', 'delivery charge', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(264, 'total_person', 'user', 'Total Person', 'Total Person', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(265, 'pickup_time', 'user', 'Pickup time', 'Pickup time', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(266, 'accept', 'admin', 'accept', 'accept', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(267, 'completed', 'user', 'Completed', 'Completed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(268, 'accepted', 'user', 'Accepted', 'accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(269, 'cancled', 'user', 'Cancled', 'Cancled', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(270, 'order_list', 'user', 'Order list', 'order list', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(271, 'item_name', 'user', 'Item name', 'item name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(272, 'live_orders', 'user', 'Live orders', 'live orders', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(273, 'all_orders', 'user', 'All orders', 'all orders', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(274, 'order_number', 'user', 'Order number', 'order number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(275, 'order_type', 'user', 'Order type', 'order type', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(276, 'canceled', 'user', 'Canceled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(277, 'create_trail_package_msg', 'user', 'Please Create a Trail Package first', 'Please Create a Trail Package first', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(278, 'create_trail_package_msg_1', 'user', 'After create trial package you can able to create free/others packages', 'After creating trial package you can able to create free/others packages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(279, 'trial_for_month', 'admin', 'Trial for 1 Month', 'Trial for 1 Month', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(280, 'monthly', 'admin', 'monthly', 'monthly', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(281, 'yearly', 'admin', 'yearly', 'yearly', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(282, 'set_free_for_month', 'admin', 'Account will set Free for 1 month', 'Account will set Free for 1 month', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(283, 'limit_text_msg_1', 'admin', 'Set limit for Order & Items. How many Order & items will available for this package', 'Set limit for Order & Items. How many Order & items will available for this package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(284, 'limit_text_msg_2', 'admin', 'Select limit from drop down. if you not select any limit then it will set by default', 'Select limit from dropdown. if you do not select any limit then it will set by default', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(285, 'add_change_feature', 'admin', 'Change/add Features', 'Change/add Features', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(286, 'stripe', 'admin', 'stripe', 'stripe', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(287, 'razorpay', 'admin', 'razorpay', 'razorpay', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(288, 'offline', 'admin', 'offline', 'offline', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(289, 'payment_via', 'admin', 'payment via', 'payment via', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(290, 'send_payment_req', 'admin', 'Send a payment request', 'Send a payment request', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(291, 'payment_verified_successfully', 'admin', 'Your payment verified successfully', 'Your payment verified successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(292, 'ok', 'admin', 'ok', 'ok', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(293, 'stripe_payment_gateway', 'admin', 'Stripe Payment Gateway', 'Stripe Payment Gateway', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(294, 'name_on_card', 'label', 'name on card', 'name on card', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(295, 'card_number', 'admin', 'Card number', 'Card number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(296, 'month', 'admin', 'month', 'month', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(297, 'year', 'admin', 'year', 'year', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(298, 'cvc', 'admin', 'cvc', 'cvc', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(299, 'whatsapp_number', 'label', 'whatsapp Number', 'whatsapp Number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(300, 'youtube', 'home', 'youtube', 'youtube', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(301, 'facebook', 'home', 'facebook', 'facebook', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(302, 'facebook_link', 'home', 'facebook link', 'facebook link', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(303, 'twitter', 'home', 'twitter', 'twitter', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(304, 'instagram', 'home', 'instagram', 'instagram', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(305, 'about_short', 'home', 'about Short text', 'about Short text', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(306, 'profile_qr', 'home', 'Profile QR code', 'Profile QR code', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(307, 'download', 'home', 'Download', 'Download', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(308, 'start_time', 'home', 'start time', 'start time', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(309, 'end_time', 'home', 'end time', 'end time', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(310, 'time_picker', 'home', 'Time picker', 'Time picker', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(311, 'reservation_types', 'home', 'reservation types', 'reservation types', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(312, 'type_name', 'home', 'type name', 'type name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(313, 'reservation_type_list', 'home', 'reservation type list', 'reservation type list', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(314, 'all_reservation_list', 'home', 'All Reservation list', 'All Reservation list', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(315, 'todays_reservations', 'home', 'Todays Reservation', 'Todays Reservation', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(316, 'comments', 'home', 'comments', 'comments', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(317, 'table_reservation', 'home', 'Table Reservation', 'Table Reservation', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(318, 'if_use_smtp', 'label', 'if You use SMTP Mail', 'if You use SMTP Mail', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(319, 'smtp_info_msg', 'label', 'Make sure SMTP MAIL, SMTP HOST, SMTP PORT and SMTP PASSWORD is correct', 'Make sure SMTP MAIL, SMTP HOST, SMTP PORT and SMTP PASSWORD is correct', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(320, 'registration_subject', 'admin', 'Registration Email subject', 'Registration Email subject', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(321, 'payment_mail_subject', 'label', 'Payment mail subject', 'Payment mail subject', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(322, 'recovery_password_heading', 'user', 'Recovery Passowrd', 'Recovery Passowrd', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(323, 'linkedin', 'label', 'linkedin', 'linkedin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(324, 'home_banner', 'admin', 'Home Banner', 'Home Banner', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(325, 'home_small_banner', 'admin', 'Home small banner', 'Home small banner', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(326, 'section_banner', 'admin', 'section banner', 'section banner', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(327, 'add', 'admin', 'add', 'add', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(328, 'section_name', 'admin', 'section name', 'section name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(329, 'pricing', 'admin', 'pricing', 'pricing', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(330, 'reviews', 'admin', 'reviews', 'reviews', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(331, 'contacts', 'admin', 'contacts', 'contacts', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(332, 'section', 'admin', 'section', 'section', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(333, 'heading', 'label', 'heading', 'heading', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(334, 'sub_heading', 'admin', 'sub heading', 'sub heading', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(335, 'banner', 'admin', 'banner', 'banner', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(336, 'paypal_payment', 'admin', 'paypal_ payment', 'paypal payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(337, 'sandbox', 'admin', 'sandbox', 'sandbox', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(338, 'paypal_email', 'admin', 'Paypal Email', 'Paypal Email', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(339, 'paypal_business_email', 'admin', 'Paypal Business Email', 'Paypal Business Email', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(340, 'stripe_payment', 'admin', 'stripe Payment Gateway', 'stripe Payment Gateway', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(341, 'stripe_public_key', 'admin', 'Stripe Public key', 'Stripe Public key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(342, 'stripe_secret_key', 'admin', 'Stripe Secret key', 'Stripe Secret key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(343, 'razorpay_payment', 'admin', 'razorpay payment', 'razorpay payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(344, 'razorpay_key', 'admin', 'Razorpay Key', 'Razorpay Key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(345, 'favicon', 'admin', 'favicon', 'favicon', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(346, 'site_logo', 'admin', 'site_logo', 'site logo', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(347, 'time_zone', 'admin', 'time zone', 'time zone', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(348, 'site_name', 'label', 'site name', 'site name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(349, 'description', 'admin', 'description', 'description', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(350, 'google_analytics', 'admin', 'Google Analytics', 'Google Analytics', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(351, 'pricing_layout', 'admin', 'pricing layout', 'pricing layout', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(352, 'style_1', 'admin', 'Style 1', 'Style 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(353, 'style_2', 'admin', 'Style 2', 'Style 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(354, 'reg_system', 'admin', 'Registration System', 'Registration System', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(355, 'auto_approval', 'label', 'auto approval', 'auto approval', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(356, 'email_verify', 'label', 'Email Verification', 'Email Verification', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(357, 'free_verify', 'label', 'Free Verify', 'Free Verify', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(358, 'user_invoice', 'label', 'user invoice', 'user invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(359, 'rating', 'label', 'rating', 'rating', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(360, 'recaptcha', 'label', 'recaptcha', 'recaptcha', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(361, 'g_site_key', 'label', 'recaptcha site key', 'recaptcha site key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(362, 'g_secret_key', 'label', 'secret Key', 'secret Key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(363, 'order_configuration', 'label', 'Order Configuration', 'Order Configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(364, 'configuration', 'label', 'Configuration', 'Configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(365, 'whatsapp_order', 'label', 'Whatsapp Order', 'Whatsapp Order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(366, 'runing_package', 'user', 'Runing Package', 'Runing Package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(367, 'account_will_expired', 'user', 'Your package will expire after', 'Your package will expire after', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(368, 'package_expiration', 'user', 'Package expiration', 'Package expiration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(369, 'lifetime', 'user', 'Lifetime', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(370, 'payment_not_active_due_to_payment', 'user', 'Your package is not active due to payment. (Pending..)', 'Your package is not active due to payment. (Pending..)', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(371, 'package_reactive_msg', 'user', 'Your package is expired. you can re-active it again', 'Your package is expired. you can re-active it again', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(372, 'select_this_package', 'user', 'You can also select this package', 'You can also select this package', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(373, 'contact_email', 'user', 'Contact email', 'contact email', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(374, 'colors', 'user', 'Colors', 'Colors', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(375, 'color_picker', 'user', 'Color picker', 'Color picker', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(376, 'preloader', 'user', 'Preloader', 'preloader', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(377, 'choose_restaurant_name', 'home', 'Choose your Resaturant Name', 'Choose your Resaturant Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(379, 'create', 'home', 'Create', 'Create', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(380, 'try_with_qr_code', 'home', 'Try With QR code', 'Try With QR code', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(381, 'quick_links', 'home', 'quick links', 'quick links', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(382, 'cookies_msg_1', 'home', 'We use cookies in this website to give you the best experience on our', 'We use cookies in this website to give you the best experience on our', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(383, 'cookies_msg_2', 'home', 'site and show you relevant ads. To find out more, read our', 'site and show you relevant ads. To find out more, read our', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(384, 'copyright_text', 'home', 'All rights reserved.', 'All rights reserved.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(385, 'sign-up', 'home', 'Signup', 'Signup', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(386, 'login', 'home', 'login', 'login', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(387, 'track_order', 'home', 'track order', 'track order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(388, 'lets_work_together', 'home', 'Let\'s work together', 'Let\'s work together', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(389, 'join_our_team_text', 'home', 'Join my team so that together we can achieve success', 'Join my team so that together we can achieve success', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(390, 'forgot_password', 'home', 'Forgot Password', 'Forgot Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(391, 'forget_pass_alert', 'home', 'Seems like you forgot your password for login? if true set your email to reset password', 'Seems like you forgot your password for login? if true set your email to reset password', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(392, 'remember_password', 'home', 'Remember Password?', 'Remember Password?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(393, 'sign_in', 'home', 'Sign in', 'Sign in', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(394, 'sign_in_text', 'home', 'Signup to discover your shop', 'Signup to discover your shop', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(395, 'dont_have_account', 'home', 'Don\'t have account', 'Don\'t have account', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(396, 'read_terms', 'home', 'I have read the', 'I have read the', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(397, 'accept_them', 'home', 'accept them', 'accept them', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(398, 'already_member', 'home', 'Already a Member?', 'Already a Member?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(399, 'message', 'home', 'message', 'message', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(400, 'send', 'home', 'send', 'send', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(401, 'get_start', 'home', 'Get Started', 'Get Started', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(402, 'play_video', 'home', 'Play Video', 'Play Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(403, 'read_more', 'home', 'Read More', 'Read More', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(404, 'all', 'home', 'All', 'All', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(405, 'has_been_add_to_cart', 'home', 'has been added to the cart', 'has been added to the cart', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(406, 'view_cart', 'home', 'View Cart', 'View Cart', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(407, 'size', 'home', 'size', 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(408, 'add_to_cart', 'home', 'add cart', 'add cart', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(409, 'order_form', 'home', 'order form', 'order form', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(410, 'full_name', 'home', 'full name', 'full name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(411, 'person', 'home', 'person', 'person', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(412, 'select_person', 'home', 'select person', 'select person', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(413, 'confirm_order', 'home', 'confirm order', 'confirm order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(414, 'order_confirmed', 'home', '', 'order confirmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(415, 'your_order_id', 'home', 'your order id', 'your order id', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(416, 'track_your_order_using_phone', 'home', 'You can track you order using your phone number', 'You can track you order using your phone number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(417, 'total_qty', 'home', 'Total Qty', 'Total Qty', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(418, 'total_price', 'home', 'Total Price', 'Total Price', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(419, 'order_date', 'home', 'Order Date', 'Order Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(420, 'rejected', 'home', 'rejected', 'rejected', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(421, 'you_have_more', 'home', 'You have more', 'You have more', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(422, 'item_name', 'home', 'Item name', 'item name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(423, 'delivery_address', 'home', 'Delivery address', 'Delivery address', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(424, 'shop_address', 'home', 'shop address', 'shop address', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(425, 'share_your_location', 'home', 'Share your location here', 'Share your location here', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(426, 'order_on_whatsapp', 'home', 'Order On Whatsapp', 'Order On Whatsapp', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(427, 'order_now', 'home', 'order now', 'order now', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(428, 'book_now', 'home', 'Book Now', 'Book Now', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(429, 'watch_video', 'home', 'Watch Video', 'Watch Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(430, 'fast_service', 'home', 'Fast Service', 'Fast Service', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(431, 'fresh_food', 'home', 'Fresh Food', 'Fresh Food', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(432, '24_support', 'home', '24/7 Support', '24/7 Support', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(433, 'about_us', 'home', 'about us', 'about us', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(434, 'maximum_order_alert', 'home', 'Sorry! This Restaurant reached the maximum orders', 'Sorry! This Restaurant reached the maximum orders', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(435, 'contact_us', 'home', 'Contact Us', 'Contact Us', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(436, 'checkout', 'home', 'checkout', 'checkout', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(437, 'sorry_cant_take_order', 'home', 'Sorry! We can not take any orders', 'Sorry! We can not take any orders', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(438, '404_not', 'home', '404 Not Found', '404 Not Found', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(439, 'subject', 'home', 'subject', 'subject', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(440, 'see_more', 'home', 'See More', 'See More', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(441, 'number_of_guest', 'home', 'number of guest', 'number of guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(442, 'reservation_type', 'home', 'reservation type', 'reservation type', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(443, 'any_special_request', 'home', 'Any Special Request?', 'Any Special Request?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(444, 'booking_availabiti_text', 'home', 'Before booking an reservation please check our availability', 'Before booking an reservation please check our availability', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(445, 'phone_number', 'home', 'Phone Number', 'Phone Number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(446, 'check', 'home', 'check', 'check', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(447, 'search_with_username', 'home', 'Search with username', 'Search with username', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(448, 'search', 'home', 'search', 'search', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(449, 'restaurant_name', 'home', 'Restaurant Name', 'Restaurant Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(450, 'forgot', 'home', 'forgot', 'forgot?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(451, 'total', 'home', 'total', 'total', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(452, 'select_order_type', 'home', 'select order type', 'select order type', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(453, 'quick_view', 'home', 'Quick View', 'Quick View', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(454, 'reservation_date', 'home', 'reservation date', 'reservation date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(455, 'restaurant_list', 'admin', 'restaurant list', 'restaurant list', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(456, 'total_restaurant', 'admin', 'total restaurant', 'total restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(457, 'add restaurant', 'admin', 'add_restaurant', 'Add Restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(458, 'packages', 'admin', 'packages', 'packages', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(459, 'features_list', 'admin', 'features list', 'features list', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(460, 'type', 'label', 'type', 'type', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(461, 'save_change_successfully', 'admin', 'save change successfully', 'save change successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(462, 'success_text', 'admin', 'save change successfully', 'save change successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(463, 'error_text', 'admin', 'Somethings Were Wrong!!', 'Somethings Were Wrong!!', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(464, 'yes', 'label', 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(465, 'no', 'label', 'no', 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(466, 'are_you_sure', 'label', 'are_you_sure', 'are you sure', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(467, 'item_deactive_now', 'label', 'This item is deactive now', 'This item is deactive now', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(468, 'item_active_now', 'label', 'Item is active now', 'Item is active now', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(469, 'want_to_reset_password', 'label', 'Want to reset Password?', 'Want to reset Password?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(470, 'sunday', 'user', 'Sunday', 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(471, 'monday', 'user', 'Monday', 'Monday', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(472, 'tuesday', 'user', 'Tuesday', 'Tuesday', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(473, 'wednesday', 'user', 'Wednesday', 'Wednesday', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(474, 'thursday', 'user', 'Thursday', 'Thursday', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(475, 'friday', 'user', 'Friday', 'Friday', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(476, 'saturday', 'user', 'Saturday', 'Saturday', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(477, 'booking_date', 'admin', 'Booking Date', 'Booking Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(478, 'pickup_alert', 'admin', 'Sorry Pickup is not available', 'Sorry Pickup is not available', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(479, 'qty', 'user', 'Qty', 'qty', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(480, 'item', 'user', 'Item', 'item', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(481, 'order_video', 'user', 'Order video link', 'Order video link', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(482, 'home_setting', 'user', 'Home Settings', 'Home Settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(483, 'total_revenue', 'user', 'Total Revenue', 'Total Revenue', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(484, 'categories', 'admin', 'categories', 'categories', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(485, 'images', 'user', 'images', 'images', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(486, 'want_to_deactive_account', 'user', 'Want to deactive your account?', 'Want to deactivate your account?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(487, 'want_to_active_account', 'user', 'Want to active your account?', 'Want to activate your account?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(488, 'back', 'user', 'Back', 'Back', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(489, 'sorry_payment_faild', 'user', 'Sorry Payment Failed', 'Sorry Payment Failed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(490, 'my_cart', 'user', 'My cart', 'My cart', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(491, 'shipping', 'user', 'shipping', 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(492, 'sub_total', 'user', 'Sub Total', 'Sub Total', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(493, 'payment_not_available', 'user', 'payment not available', 'payment not available', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(494, 'stock_status', 'label', '', 'Stock Status', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language_data` (`id`, `keyword`, `type`, `details`, `english`, `arabics`, `uzbek`, `russian`, `chinese`, `french`, `portuguese`, `hindi`) VALUES
(495, 'in_stock', 'label', '', 'In stock', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(496, 'remaining', 'label', '', 'remaining', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(497, 'reset_counter', 'label', '', 'reset counter', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(498, 'reset_stock_count', 'label', '', 'Stock Count will reset', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(499, 'delete_success', 'label', '', 'Delete successfull', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(500, 'availability', 'label', '', 'Availability', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(501, 'out_of_stock', 'label', '', 'Out of stock', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(502, 'set_stock', 'label', '', 'set stock', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(503, 'select_pickup_area', 'label', '', 'Select Pickup area', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(504, 'show_map', 'label', '', 'show map', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(505, 'google_map_api_key', 'label', '', 'Google map api key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(506, 'pickup_point', 'label', '', 'Pickup Point', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(507, 'google_map_status', 'label', '', 'google map status', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(508, 'pickup_time_alert', 'label', '', 'Pickup time not set yet', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(509, 'dine-in', 'label', '', 'Dine in', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(510, 'create_table', 'label', '', 'Create table', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(511, 'table', 'label', '', 'Table', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(512, 'area', 'label', '', 'area', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(513, 'areas', 'label', '', 'areas', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(514, 'size', 'label', '', 'size', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(515, 'add_new_area', 'label', '', 'Add New Area', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(516, 'select_area', 'label', '', 'Select area', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(517, 'area_name', 'label', '', 'Area name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(518, 'add_new_table', 'label', '', 'Add New Table', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(519, 'table_list', 'label', '', 'Table List', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(520, 'set_time', 'label', '', 'Set Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(521, 'set_prepared_time', 'label', '', 'Set Prepared Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(522, 'prepared_time', 'label', '', 'Prepared Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(523, 'hours', 'label', '', 'hours', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(524, 'minutes', 'label', '', 'Minutes', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(525, 'order_status', 'label', '', 'order status', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(526, 'order_accept_msg', 'label', '', 'Order Accept by shop. order will shift after', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(527, 'order_delivery_msg', 'label', '', 'Your order will on the way soon', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(528, 'select_table', 'label', '', 'Select Table', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(529, 'seo_settings', 'admin', '', 'Seo Settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(530, 'keyword', 'admin', '', 'Keyword', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(531, 'description', 'admin', '', 'description', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(532, 'keywords', 'admin', '', 'keywords', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(533, 'confirm_oder', 'admin', '', 'confirm oder', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(534, 'add_extras', 'admin', '', 'Add Extras', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(535, 'add_new_extras', 'admin', '', 'Add new extras', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(536, 'save', 'admin', '', 'save', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(537, 'write_you_name_here', 'user', '', 'Write Your Name Here', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(538, 'order_tracking', 'admin', '', 'Order Tracking', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(539, 'google_map_link', 'user', '', 'Google map link', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(540, 'status_history', 'user', '', 'Status History', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(541, 'just_created', 'user', '', 'Just created', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(542, 'status_from', 'user', '', 'Status from', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(543, 'by_admin', 'user', '', 'By admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(544, 'admin', 'user', '', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(545, 'order_is_on_the_way', 'user', '', 'Order is on the way', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(546, 'complete', 'user', '', 'Complete', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(547, 'new_order', 'user', '', 'New Order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(548, 'served', 'user', '', 'served', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(549, 'serve', 'user', '', 'serve', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(550, 'start_preparing', 'user', '', 'Start Preparing', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(551, 'today_remaining_off', 'user', '', 'Today is our off day', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(552, 'prepared_finish', 'user', '', 'Prepared finish', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(553, 'create_menu', 'user', '', 'Create Menu', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(554, 'generate_qr_code', 'user', '', 'Generate QR code', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(555, 'menu_name', 'user', '', 'Menu name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(556, 'download_qr', 'user', '', 'Download QR', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(557, 'congratulations', 'user', '', 'Congratulations', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(558, 'order_place_successfully', 'user', '', 'Order is completed and have been placed successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(559, 'please_wait_msg', 'user', '', 'please wait..', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(560, 'token_number', 'user', '', 'token number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(561, 'create_qr', 'user', '', 'Create QR', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(562, 'qr_builder', 'user', '', 'Qr Builder', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(563, 'new_dine_order', 'user', '', 'new dine order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(564, 'restaurant_dine_in', 'user', '', 'Restaurant Dine-in', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(565, 'kds', 'user', '', 'KDS', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(566, 'qr_code_generate_msg', 'user', '', 'After generating Qr code download the Qr code and add in your custom flyer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(567, 'extras', 'label', '', 'Extras', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(568, 'order_running_msg', 'admin', '', 'Your order is still running! you cant order the same item until it is completed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(569, 'staff', 'admin', '', 'Staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(570, 'staff_list', 'admin', '', 'Staff list', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(571, 'permission_list', 'admin', '', 'permission list', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(572, 'add_straff', 'admin', '', 'Add Staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(573, 'email_exits_in', 'admin', '', 'Email already exist into user table', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(574, 'email_alreay_exits', 'admin', '', 'Email already exits', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(575, 'available_permossion', 'admin', '', 'Available permission', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(576, 'not_found', 'label', '', 'Not found', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(577, 'live_order_status', 'label', '', 'Live order status', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(578, 'extras', 'label', '', 'Extras', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(579, 'trial_for_week', 'admin', '', 'Trial for 1 week', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(580, 'trial_for_fifteen', 'admin', '', 'Trial for 15 days', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(581, 'weekly', 'admin', '', 'Weekly', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(582, '15_days', 'admin', '', '15 days', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(583, 'is_signup', 'admin', '', 'Show signup button', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(584, 'is_auto_verified', 'admin', '', 'Auto approved Trail user', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(585, 'twillo_sms_settings', 'admin', '', 'Twilio SMS Settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(586, 'account_sid', 'admin', '', 'Account SID', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(587, 'auth_token', 'admin', '', 'Auth Token', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(588, 'twillo_virtual_number', 'admin', '', 'Twilio Virtual Number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(589, 'inactive', 'admin', '', 'Inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(590, 'accept_sms', 'admin', '', 'Accept SMS', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(591, 'complete_sms', 'admin', '', 'Complete SMS', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(592, 'sms_sent', 'admin', '', 'Message Sent', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(593, 'accept_message', 'admin', '', 'Accept Message', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(594, 'completed_message', 'admin', '', 'Completed Message', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(595, 'upgrade', 'admin', '', 'Upgrade', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(596, 'show', 'label', '', 'show', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(597, 'sorry_we_are_closed', 'label', '', 'Sorry We are closed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(598, 'please_check_the_available_list', 'label', '', 'Please check the available list', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(599, 'paypal_environment', 'label', '', 'Paypal Environment', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(600, 'pickup_points', 'label', '', 'Pickup Points', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(601, 'order_is_waiting_for_picked', 'label', '', 'Order is waiting for picked', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(602, 'phone_already_exits', 'label', '', 'Phone already exits', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(603, 'customer_login', 'label', '', 'Customer Login', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(604, 'date', 'label', '', 'Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(605, 'order_status', 'label', '', 'Order status', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(606, 'customer', 'label', '', 'Customer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(607, 'unit_price', 'label', '', 'Unit price', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(608, 'amount', 'label', '', 'Amount', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(609, 'export', 'label', '', 'Export', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(610, 'print', 'label', '', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(611, 'customer_name', 'label', '', 'Customer Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(612, 'delivery_staff_panel', 'label', '', 'Delivery Staff panel', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(613, 'delivery_staff', 'label', '', 'Delivery Staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(614, 'default_prepared_time', 'label', '', 'Default Prepared time', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(615, 'total_earnings', 'label', '', 'Total Earnings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(616, 'picked', 'label', '', 'Picked', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(617, 'mark_as_picked', 'label', '', 'Mark as picked', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(618, 'mark_as_completed', 'label', '', 'Mark as completed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(619, 'mark_as_accepted', 'label', '', 'Mark as Accepted', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(620, 'account', 'label', '', 'Account', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(621, 'ongoing', 'label', '', 'On Going', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(622, 'earning', 'label', '', 'Earning', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(623, 'cod', 'label', '', 'COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(624, 'accepted_by_delivery_staff', 'label', '', 'Accepted By Delivery Staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(625, 'accepted_by', 'label', '', 'Accepted By', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(626, 'delivery_staff', 'label', '', 'Delivery Staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(627, 'picked_by_delivery_staff', 'label', '', 'Picked By Delivery Staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(628, 'picked_by', 'label', '', 'Picked By', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(629, 'delivered_by', 'label', '', 'Delivered By', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(630, 'customer_info', 'label', '', 'Customer info', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(631, 'delivered_by_delivery_staff', 'label', '', 'Delivered By Delivery Staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(632, 'thank_you_purchase_msg', 'label', '', 'Thank you for shopping with us . Please come again', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(633, 'ordered_placed', 'label', '', 'Order Placed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(634, 'we_have_received_your_order', 'label', '', 'We have received your order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(635, 'order_confirmed', 'label', '', 'Order confirmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(636, 'your_order_has_been_confirmed', 'label', '', 'Your order has beep confirmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(637, 'Order Processed', 'label', '', 'Order Processed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(638, 'date', 'label', '', 'Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(639, 'we_are_preparing_your_order', 'label', 'We are preparing your order', 'We are preparing your order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(640, 'ready_to_pickup', 'label', 'Ready to pickup', 'Ready to pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(641, 'your_order_is_ready_to_pickup', 'label', 'Your order is ready for pickup', 'Your order is ready for pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(642, 'order_confirmed_by_dboy', 'label', 'Order confirm by delivery staff', 'Order confirm by delivery staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(643, 'order_accept_by_dboy', 'label', 'Order accepted by delivery staff', 'Order accepted by delivery staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(644, 'order_picked', 'label', 'Order Picked', 'Order Picked', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(645, 'order_picked_by_dboy', 'label', 'Order picked by delivery staff', 'Order picked by delivery staff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(646, 'order_delivered', 'label', 'Order Delivered', 'Order Delivered', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(647, 'order_delivered_successfully', 'label', 'Order delivered successfully', 'Order delivered successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(648, 'filter', 'admin', 'Filter', 'Filter', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(649, 'clear', 'admin', 'Clear', 'Clear', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(650, 'shipping_address', 'admin', 'Shipping Address', 'Shipping Address', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(651, 'get_direction', 'admin', 'Get direction', 'Get direction', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(652, 'call_now', 'admin', 'Call now', 'Call now', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(653, 'order_items', 'admin', 'OrderItems', 'Order Items', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(654, 'shop_configuration', 'admin', 'Shop Configuration', 'Shop Configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(655, 'staffs', 'admin', 'Staffs', 'Staffs', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(656, 'restaurants', 'admin', 'Restaurants', 'Restaurants', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(657, 'preferences', 'admin', 'Preferences', 'Preferences', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(658, 'recaptcha_settings', 'admin', 'Recaptcha Settings', 'ReCaptcha Settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(659, 'on', 'admin', 'On', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(660, 'off', 'admin', 'Off', 'off', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(661, 'enable_to_allow_signup_system', 'admin', 'Enable to allow sign up users to your system', 'Enable to allow sign up users to your system', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(662, 'enable_to_allow_auto_approve', 'admin', 'Enable to allow auto-approved when users sign up to your system', 'Enable to allow auto-approved when users sign up to your system', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(663, 'enable_to_allow_email_verification', 'admin', 'Enable to allow email verification when users sign up to your system', 'Enable to allow email verification when users sign up to your system', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(664, 'enable_to_allow_free_email_verification', 'admin', 'Enable to allow email verification when users sign up with free package to your system', 'Enable to allow email verification when users sign up with free package to your system', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(665, 'user_get_an_invoice', 'admin', 'Users get an invoice when signing up to your system', 'Users get an invoice when signing up to your system', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(666, 'rating_in_landing_page', 'admin', 'Show rating in landing page', 'Show rating in landing page', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(667, 'show_signup_button', 'admin', 'Enable to Show signup button in menu', 'Enable to Show signup button in menu', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(668, 'auto_approve_trial_user', 'admin', 'Enable to Auto Approved trial users when registration in system', 'Enable to Auto Approved trial users when registration in system', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(669, 'add_restaurant', 'admin', 'Add New Restaurant', 'Add New Restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(670, 'country', 'admin', 'Country', 'Country', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(671, 'fifteen', 'admin', 'Fifteen', 'Fifteen', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(672, 'language_data', 'admin', 'Language Data', 'Language Data', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(673, 'enable_to_allow_in_your_system', 'admin', 'Enable to allow in your system', 'Enable to allow in your system', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(674, 'stock_counter', 'admin', 'Stock counter', 'Stock counter', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(675, 'payment_history', 'admin', 'Payment History', 'Payment History', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(676, 'default_email', 'admin', 'Default Email', 'Default Email', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(677, 'invoice', 'admin', 'Invoice', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(678, 'table_order', 'admin', 'Table Order', 'Table Order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(679, 'restaurant_configuration', 'admin', 'Restaurant configuration', 'Restaurant configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(680, 'tables', 'admin', 'Tables', 'Tables', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(681, 'img_url', 'admin', 'Image URL', 'Image URL', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(682, 'dboy_list', 'admin', 'Delivery staff List', 'Delivery staff List', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(683, 'delivery_guy_login', 'admin', 'Delivery Guy Login', 'Delivery Guy Login', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(684, 'personal_info', 'admin', 'Personal Info', 'Personal Info', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(685, 'customer_panel', 'admin', 'Customer panel', 'Customer panel', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(686, 'orders', 'admin', 'Orders', 'Orders', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(687, 'pos_print', 'admin', 'POS Print', 'POS Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(688, 'change_password', 'admin', 'Change Password', 'Change Password', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(689, 'order_processed', 'admin', 'Order Processed', 'Order Processed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(690, 'new_registration', 'admin', 'New Registration', 'New Registration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(691, 'already_have_account', 'admin', 'Already have account', 'Already have account', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(692, 'login_success', 'admin', 'Login successfull', 'Login successful', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(693, 'welcome', 'admin', 'Welcome', 'Welcome', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(694, 'invalid_login', 'admin', 'Invalid login', 'Invalid login', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(695, 'registration_successfull', 'admin', 'Registration successfull', 'Registration successful', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(696, 'sorry', 'admin', 'Sorry', 'Sorry', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(697, 'top_10_selling_item', 'admin', 'Top 10 Selling Item', 'Top 10 Selling Item', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(698, 'top_10_most_earning_items', 'admin', 'Top 10 Most Earning Items', 'Top 10 Most Earning Items', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(699, 'total_amount', 'admin', 'Total Amount', 'Total Amount', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(700, 'times', 'admin', 'Times', 'Times', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(701, 'tax_fee', 'admin', 'Tax Fee', 'Tax Fee', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(702, 'minimum_order', 'admin', 'Minumum Order', 'Minimum Order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(703, 'tax', 'admin', 'Tax', 'Tax', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(704, 'dine_in', 'admin', 'Dine-In', 'Dine-In', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(705, 'language_list', 'admin', 'Languages List', 'Languages List', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(706, 'show_language_dropdown_in_home', 'admin', 'Show Languages Dropdown in landing page', 'Show Languages Dropdown in landing page', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(707, 'cart_is_empty', 'admin', 'Cart is empty', 'Cart is empty', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(708, 'razorpay_key_id', 'admin', 'Razorpay Key Id', 'Razorpay Key Id', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(709, 'secret_key', 'admin', 'Secret Key', 'Secret Key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(710, 'view_shop', 'admin', 'View Shop', 'View Shop', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(711, 'give_your_feedback', 'admin', 'Please give your feedback', 'Please give your feedback', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(712, 'sort_by_newest', 'admin', 'Sort By Newest', 'Sort By Newest', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(713, 'sort_by_highest_rating', 'admin', 'Sort BY Highest Rating', 'Sort BY Highest Rating', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(714, 'sort_by_lowest_rating', 'admin', 'Sort BY Lowest Rating', 'Sort BY Lowest Rating', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(715, 'one_min_ago', 'admin', 'One minute ago', 'One minute ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(716, 'minutes_ago', 'admin', 'Minutes ago', 'Minutes ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(717, 'an_hour_ago', 'admin', 'An hour ago', 'An hour ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(718, 'hrs_ago', 'admin', 'Hrs ago', 'Hrs ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(719, 'yesterday', 'admin', 'Yesterday', 'Yesterday', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(720, 'days_ago', 'admin', 'Days ago', 'Days ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(721, 'a_week_ago', 'admin', 'A week ago', 'A week ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(722, 'weeks_ago', 'admin', 'Weeks ago', 'Weeks ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(723, 'a_month_ago', 'admin', 'A month ago', 'A month ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(724, 'months_ago', 'admin', 'Months ago', 'Months ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(725, 'one_year_ago', 'admin', 'One year ago', 'One year ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(726, 'years_ago', 'admin', 'Years ago', 'Years ago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(727, 'statistics', 'admin', 'Statistics', 'Statistics', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(728, 'total_purchased_item', 'admin', 'Total Purchased Items', 'Total Purchased Items', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(729, 'average_based_on', 'admin', 'Average based on', 'Average based on', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(730, 'test_mail', 'admin', 'Test Mail', 'Test Mail', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(731, 'documentation', 'admin', 'Documentation', 'Documentation', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(732, 'customer_list', 'admin', 'Customer List', 'Customer List', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(733, 'total_orders', 'admin', 'Total Orders', 'Total Orders', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(734, 'add_customer', 'admin', 'Add Customer', 'Add Customer', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(735, 'empty-phone', 'admin', 'Your phone is empty, please insert your phone number', 'Your phone is empty, please insert your phone number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(736, 'empty-country-1', 'admin', 'Your country is empty, please Set your country', 'Your country is empty, please Set your country', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(737, 'empty-country-2', 'admin', 'County will helps you to set your phone code and currency.', 'County will helps you to set your phone code and currency.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(738, 'empty-profile', 'admin', 'Your Profile picture is empty, Please Set your Profile picture.', 'Your Profile picture is empty, Please Set your Profile picture.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(739, 'restaurant_empty_msg-0', 'admin', 'If You do not find menu and other options', 'If You do not find menu and other options', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(740, 'restaurant_empty_msg-1', 'admin', 'Make sure Restaurant profile is complete', 'Make sure Restaurant profile is complete', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(741, 'restaurant_empty_msg-2', 'admin', 'You have to add phone, dial code and country', 'You have to add phone, dial code and country', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(742, 'staff_password_msg', 'admin', 'Staff password will set 1234', 'Staff password will set 1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(743, 'staff_password_change_msg', 'admin', 'Staff can change their password after login', 'Staff can change their password after login', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(744, 'dboy_password_msg', 'admin', 'Delivery guy password will set 1234', 'Delivery guy password will set 1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(745, 'dboy_password_change_msg', 'admin', 'Delivery guy can change password after login', 'Delivery guy can change password after login', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(746, 'customer_password_msg', 'admin', 'Customer password will set 1234', 'Customer password will set 1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(747, 'customer_password_change_msg', 'admin', 'Customer can change their password after login', 'Customer can change their password after login', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(748, 'customer_details', 'admin', 'Customer Details', 'Customer Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(749, 'general', 'admin', 'General', 'General', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(750, 'update_with_my_old_information', 'admin', 'Update with my old information', 'Update with my old information', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(751, 'minimum_price_msg_for_cod', 'admin', 'Price not sufficient for COD', 'Price not sufficient for COD', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(752, 'minimum_price', 'admin', 'Minimum Price', 'Minimum Price', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(753, 'add_new_location', 'admin', 'Add New Location', 'Add New Location', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(754, 'click_the_map_to_get_lan_ln', 'admin', 'Click the map to get Lat/Lng!', 'Click the map to get Lat/Lng!', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(755, 'customer_will_find_restaurant_with_location', 'admin', 'Customer will find your restaurant using this location', 'Customer will find your restaurant using this location', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(756, 'search_for_items', 'admin', 'Search For Items', 'Search For Items', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(757, 'near_me', 'admin', 'Near Me', 'Near Me', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(758, 'shop_rating', 'admin', 'Shop Rating', 'Shop Rating', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(759, 'available_time', 'admin', 'Available Time', 'Available Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(760, 'variants', 'admin', 'Variants', 'Variants', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(761, 'total_sell', 'admin', 'Total Sell', 'Total Sell', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(762, 'popular_store', 'admin', 'Popular Store', 'Popular Store', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(763, 'popular_items', 'admin', 'Popular Items', 'Popular Items', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(764, 'item_search', 'admin', 'Item Search', 'Item Search', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(765, 'show_item_search_in_landing_page', 'admin', 'Show Item search  in landing page', 'Show Item search  in landing page', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(766, 'locations', 'admin', 'Locations', 'Locations', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(767, 'latitude', 'admin', 'Latitude', 'Latitude', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(768, 'longitude', 'admin', 'Longitude', 'Longitude', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(769, 'payment_configuration', 'admin', 'Payment configuration', 'Payment configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(770, 'virtual_number', 'admin', 'Virtual Number', 'Virtual Number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(771, 'please_select_your_payment_menthod', 'admin', 'Please select your payment method', 'Please select your payment method', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(772, 'none', 'admin', 'None', 'None', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(773, 'add_image', 'admin', 'Add Image', 'Add Image', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(774, 'add_new_images', 'admin', 'Add new images', 'Add new images', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(775, 'customer_login_msg', 'admin', 'Enabled customer login in the checkout page', 'Enabled customer login in the checkout page', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(776, 'reset', 'admin', 'Reset', 'Reset', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(777, 'new', 'admin', 'New', 'New', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(778, 'delivery_area', 'admin', 'Delivery Area', 'Delivery Area', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(779, 'add_delivery_area', 'admin', 'Add delivery Area', 'Add delivery Area', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(780, 'call_waiter', 'admin', 'Call Waiter', 'Call Waiter', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(781, 'call', 'admin', 'Call', 'Call', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(782, 'enable_to_allow_call_waiter', 'admin', 'Enable to allow call waiter service', 'Enable to allow call waiter service', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(783, 'call_waiter_msg', 'admin', 'Waiter will get a notification and will available soon!', 'Waiter will get a notification and will available soon!', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(784, 'waiting_notification_msg', 'admin', 'Please wait waiter will be available soon', 'Please wait, Waiter will be available soon', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(785, 'charge', 'admin', 'Charge', 'Charge', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(786, 'show_image', 'admin', 'Show Image', 'Show Image', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(787, 'active_image', 'admin', 'Active Image', 'Active Image', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(788, 'image_url', 'admin', 'Image URL', 'Image URL', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(789, 'is_svg', 'admin', 'Is SVG', 'Is SVG', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(790, 'icon_settings', 'admin', 'Icon Settings', 'Icon Settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(791, 'qr_generator', 'admin', 'QR Code Generator', 'QR Code Generator', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(792, 'foreground_color', 'admin', 'Foreground Color', 'Foreground Color', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(793, 'background_color', 'admin', 'Background Color', 'Background Color', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(794, 'mode', 'admin', 'Mode', 'Mode', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(795, 'text', 'admin', 'Text', 'Text', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(796, 'normal', 'admin', 'Normal', 'Normal', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(797, 'text_color', 'admin', 'Text Color', 'Text Color', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(798, 'position_x', 'admin', 'Position X', 'Position X', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(799, 'position_y', 'admin', 'Position Y', 'Position Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(800, 'qrcode', 'admin', 'Qr Code', 'Qr Code', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(801, 'padding', 'admin', 'Padding', 'Padding', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(802, 'custom_landing_page', 'admin', 'Custom Landing Page', 'Custom Landing Page', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(803, 'enable_custom_landing_page', 'admin', 'Enable Custom Landing page', 'Enable Custom Landing page', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(804, 'landing_page_url', 'admin', 'Landing Page URL', 'Landing Page URL', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(805, 'custom_landing_page_msg', 'admin', 'IF you enable this, the user will redirect in your customer page URL when they enter in systems landing page', 'IF you enable this, the user will redirect in your customer page URL when they enter in systems landing page', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(806, 'installed', 'admin', 'Installed', 'Installed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(807, 'install', 'admin', 'Install', 'Install', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(808, 'uninstall', 'admin', 'Uninstall', 'Uninstall', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(809, 'not_installed', 'admin', 'Not Installed', 'Not Installed', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(810, 'paytm', 'admin', 'Paytm', 'Paytm', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(811, 'stripe_fpx', 'admin', 'Stripe FPX', 'Stripe FPX', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(812, 'flutterwave', 'admin', 'Flutterwave', 'Flutterwave', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(813, 'mercado', 'admin', 'Mercadopago', 'Mercadopago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(814, 'mercadopago', 'admin', 'Mercadopago', 'Mercadopago', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(815, 'public_key', 'admin', 'Public key', 'Public key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(816, 'access_token', 'admin', 'Access Token', 'Access Token', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(817, 'environment', 'admin', 'Environment', 'Environment', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(818, 'area_based_delivery_charge', 'admin', 'Area based delivery charge', 'Area based delivery charge', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(819, 'facebook_pixel', 'admin', 'Facebook Pixel', 'Facebook Pixel', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(820, 'facebook_pixel_id', 'admin', 'Facebook Pixel ID', 'Facebook Pixel ID', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(821, 'google_analytics_id', 'admin', 'Google Analytics ID', 'Google Analytics ID', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(822, 'customer_waiting_msg', 'admin', 'Customer is waiting at table number', 'Customer is waiting at table number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(823, 'weight', 'admin', 'Weight', 'Weight', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(824, 'calories', 'admin', 'Calories', 'Calories', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(825, 'is_variants', 'admin', 'Is variants', 'Is variants', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(826, 'allow_access_google_map_key', 'admin', 'Allow to access google map api key', 'Allow to access google map api key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(827, 'allow_gmap_access', 'admin', 'Allow Gmap Access', 'Allow Gmap Access', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(828, 'enable', 'admin', 'Enable', 'Enable', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(829, 'disable', 'admin', 'Disable', 'Disable', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(830, 'add_more_item', 'admin', 'Add More Items', 'Add More Items', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(831, 'item_added_successfully', 'admin', 'Item Added Successfully', 'Item Added Successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(832, 'edit_order', 'admin', 'Edit Order', 'Edit Order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(833, 'duplicate_item', 'admin', 'Duplicate Item', 'Duplicate Item', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(834, 'clone_item', 'admin', 'Clone Item', 'Clone Item', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(835, 'order_again', 'admin', 'Order again', 'Order again', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(836, 'moved_successfull', 'admin', 'Moved successfully', 'Moved successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(837, 'add_new_item', 'admin', 'Add New Item', 'Add New Item', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(838, 'add_those_extras_also', 'admin', 'Add those Extras also', 'Add those Extras also', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(839, 'whatsapp_config', 'admin', 'WhatsApp Config', 'WhatsApp Config', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(840, 'currency_position', 'admin', 'Currency Position', 'Currency Position', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(841, 'number_format', 'admin', 'Number Format', 'Number Format', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(842, 'pwa', 'admin', 'PWA', 'PWA', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(843, 'pwa_config', 'admin', 'PWA Config', 'PWA Config', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(844, 'enable_to_allow_for_all', 'admin', 'Enable to allow PWA in this system', 'Enable to allow PWA in this system', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(845, 'google_font_name', 'admin', 'Google Font name', 'Google Font name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(846, 'menu_style', 'admin', 'Menu Style', 'Menu Style', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(847, 'menu_bottom', 'admin', 'Menu Bottom', 'Menu Bottom', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(848, 'menu_top', 'admin', 'Menu Top', 'Menu Top', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(849, 'more', 'admin', 'More', 'More', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(850, 'today', 'admin', 'Today', 'Today', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(851, 'pickup_date', 'admin', 'Pickup Date', 'Pickup Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(852, 'pasta', 'admin', 'Pasta', 'Pasta', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(853, 'add_to_home_screen', 'admin', 'Add to home screen', 'Add to home screen', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(854, 'coupon_applied_successfully', 'admin', 'Coupon Applied Successfully', 'Coupon Applied Successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(855, 'add_more_image', 'admin', 'Add More Images', 'Add More Images', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(856, 'custom_css', 'admin', 'Custom CSS', 'Custom CSS', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(857, 'security_pin', 'admin', 'Security Pin', 'Security Pin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(858, 'enable_pin_when_customer_track_order', 'admin', 'Enable Pin when customer track their order and when they place call waiter', 'Enable Pin when customer track their order and when they place call waiter', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(859, 'security_pin_not_match', 'admin', 'Security Pin doesn\'t Match', 'Security Pin doesn\'t Match', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(860, 'date_format', 'admin', 'Date Format', 'Date Format', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(861, 'time_format', 'admin', 'Time Format', 'Time Format', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(862, 'upgrade_license', 'admin', 'Upgrade License', 'Upgrade License', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(863, 'change_domain', 'admin', 'Change Domain', 'Change Domain', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(864, 'theme_color', 'admin', 'Theme Color', 'Theme Color', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(865, 'phone_number_is_missing', 'admin', 'Phone Number is missing', 'Phone Number is missing', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(866, 'Please_add_your_phone_number', 'admin', 'Please add your phone number', 'Please add your phone number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(867, 'site_name_is_missing', 'admin', 'Site Name is missing', 'Site Name is missing', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(868, 'please_config_your_site_settings', 'admin', 'Please configure the site settings', 'Please configure the site settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(869, 'email_is_missing', 'admin', 'Email is missing', 'Email is missing', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(870, 'please_confing_the_email', 'admin', 'Please configure the Email settings', 'Please configure the Email settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(871, 'those_steps_are_most_important', 'admin', 'Those Steps are most important to configure first', 'Those Steps are most important to configure first', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(872, 'restaurant_name_is_missing', 'admin', 'Restaurant Name is missing', 'Restaurant Name is missing', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(873, 'please_config_the_shop_settings_configuration', 'admin', 'Please configure restaurant settings and shop configuration', 'Please configure restaurant settings and shop configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(874, 'order_types_config', 'admin', 'Order Types Configuration', 'Order Types Configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(875, 'enable_payment', 'admin', 'Enable Payment', 'Enable Payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(876, 'pay_later', 'admin', 'Pay Later', 'Pay Later', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(877, 'import', 'admin', 'Import', 'Import', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(878, 'required_alert', 'admin', 'Please fill up the % field', 'Please fill up the %s field', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(879, 'pickup_area', 'admin', 'Pickup Area', 'Pickup Area', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(880, 'restaurant_empty_alert_msg', 'admin', 'If You do not find menu and other options', 'If You do not find menu and other options, ', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(881, 'restaurant_empty_alert_msg-2', 'admin', 'Make sure Restaurant profile is complete', 'Make sure Restaurant profile is complete', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(882, 'restaurant_empty_alert_msg-3', 'admin', 'You have to add phone, dial code and country', 'You have to add phone, dial code and country', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(883, 'add_coupon', 'admin', 'Add Coupon', 'Add Coupon', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(884, 'used', 'admin', 'Used', 'Used', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(885, 'use_coupon_code', 'admin', 'Use Coupon Code', 'Use Coupon Code', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(886, 'import', 'admin', 'Import', 'Import', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(887, 'coupon_discount', 'admin', 'Coupon Discount', 'Coupon Discount', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(888, 'limit', 'admin', 'Limit', 'Limit', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(889, 'apply', 'admin', 'Apply', 'Apply', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(890, 'do_you_have_coupon', 'admin', 'Do you have coupon?', 'Do you have coupon?', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(891, 'end_date', 'admin', 'End Date', 'End Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(892, 'coupon_code', 'admin', 'Coupon Code', 'Coupon Code', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(893, 'coupon_code_reached_the_max_limit', 'admin', 'Coupon code reached the maximum limit', 'Coupon code reached the maximum limit', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(894, 'coupon_code_not_exists', 'admin', 'Coupon code not exists', 'Coupon code not exists', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(895, 'coupon_list', 'admin', 'Coupon List', 'Coupon List', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(896, 'paystack', 'admin', 'Paystack', 'Paystack', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(897, 'paystack_publick_key', 'admin', 'Paystack Public Key', 'Paystack Public Key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(898, 'paystack_secret_key', 'admin', 'Paystack Secret Key', 'Paystack Secret Key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(899, 'paystack_payment_gateways', 'admin', 'Paystack Payment Gateways', 'Paystack Payment Gateways', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(900, 'nearby_radius', 'admin', 'Nearby Radius', 'Nearby Radius', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(901, 'all_extras', 'admin', 'All Extras', 'All Extras', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(902, 'add_extra', 'admin', 'Add Extra', 'Add Extra', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(903, 'onsignal_api', 'admin', 'OnSignal  API', 'OnSignal  API', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(904, 'onsignal_app_id', 'admin', 'Onesignal App ID', 'Onesignal App ID', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(905, 'user_auth_key', 'admin', 'User Auth Key', 'User Auth Key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(906, 'allow_onsignal_access', 'admin', 'Allow onSignal Notification', 'Allow onSignal Notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(907, 'disabled_onsignal_access', 'admin', 'Disabled onSignal Notification', 'Disabled onSignal Notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(908, 'custom_link', 'admin', 'Custom Link', 'Custom Link', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(909, 'send_notifications', 'admin', 'Send Notification', 'Send Notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(910, 'notifications_send_successfully', 'admin', 'Notifications send successfully', 'Notifications send successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(911, 'hide_pay_later', 'admin', 'Hide Pay later', 'Hide Pay later', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(912, 'payment_required', 'admin', 'Payment Required', 'Payment Required', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(913, 'table_no', 'admin', 'Table No', 'Table No', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(914, '6_month', 'admin', 'Half Year / 6 month', 'Half Year / 6 month', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(915, 'half_yearly', 'admin', 'Half Year / 6 month', 'Half Year- 6 month', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(916, 'signup_questions', 'admin', 'Signup Questions', 'Signup Questions', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(917, 'security_question', 'admin', 'Security Question', 'Security Question', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(918, 'write_your_answer_here', 'admin', 'Write your answer here', 'Write your answer here', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(919, 'enable_security_question', 'admin', 'Enable Security Question', 'Enable Security Question', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(920, 'security_question_ans_not_correct', 'admin', 'Security Questions answer is not correct', 'Security Questions answer is not correct', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(921, 'change', 'admin', 'Change', 'Change', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(922, 'change_amount', 'admin', 'Change Amount', 'Change Amount', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(923, 'enable_radius_base_delivery', 'admin', 'Enable Raduis Based Delivery', 'Enable Radius Based Delivery', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(924, 'delivery_settings', 'admin', 'Delivery Settings', 'Delivery Settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(925, 'radius_base_delivery_settings', 'admin', 'Enable Radius Based Delivery Settings', 'Radius Based Delivery Settings', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(926, 'radius', 'admin', 'Radius', 'Radius', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(927, 'not_found_msg', 'admin', 'Not Found Message', 'Not Found Message', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(928, 'price_tax_msg', 'admin', 'Tax are only for showing tax status in invoice. Set your price including/excluding tax', 'Tax are only for showing tax status in invoice. Set your price including/excluding tax', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(929, 'item_tax_status', 'admin', 'Item Tax Status', 'Item Tax Status', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(930, 'tax_included', 'admin', 'Tax Included', 'Tax Included', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(931, 'tax_excluded', 'admin', 'Tax Excluded', 'Tax Excluded', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(932, 'kds_pin', 'admin', 'KDS Pin', 'KDS Pin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(933, 'enter_pin', 'admin', 'Enter Pin', 'Enter Pin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(934, 'Qr Code', 'admin', 'Qr code', 'Qr code', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(935, 'specialities', 'admin', 'Specialities', 'Specialities', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(936, 'subscriber list', 'admin', 'Subscribers List', 'Subscribers List', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(937, 'subscribers', 'admin', 'Subscribers', 'Subscribers', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(938, 'third-party_chatting_app', 'admin', 'Third-party chatting apps', 'Third-party chatting apps', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(939, 'choose_an_app', 'admin', 'Choose an App', 'Choose an App', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(940, 'app_id', 'admin', 'App ID', 'App ID', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `language_data` (`id`, `keyword`, `type`, `details`, `english`, `arabics`, `uzbek`, `russian`, `chinese`, `french`, `portuguese`, `hindi`) VALUES
(941, 'onesignal_configuration', 'admin', 'OneSignal Configuration', 'OneSignal Configuration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(942, 'verify_payment', 'admin', 'Verify Payment', 'Verify Payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(943, 'transaction_id', 'admin', 'Transaction ID', 'Transaction ID', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(944, 'bank_details', 'admin', 'Bank Details', 'Bank Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(945, 'enable_transaction_id_field', 'admin', 'Enable Transaction ID field', 'Enable Transaction ID field', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(946, 'sendgrid_api_key', 'admin', 'SendGrid API KEy', 'SendGrid API Key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(947, 'api_key', 'admin', 'API Key', 'API Key', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(948, 'sendgrid', 'admin', 'SendGrid', 'SendGrid', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(949, 'activities', 'admin', 'Activities', 'Activities', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(950, 'mark_as_unread', 'admin', 'Mark as Unread', 'Mark as Unread', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(951, 'mark_as_read', 'admin', 'Mark as read', 'Mark as read', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(952, 'send_payment_mail_to_user', 'admin', 'Send Payment Mail to the user', 'Send Payment Mail to the user', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(953, 'unseen_notification', 'admin', 'Unseen Notification', 'Unseen Notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(954, 'seen_notification', 'admin', 'Seen Notification', 'Seen Notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(955, 'unseen', 'admin', 'Unseen', 'Unseen', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(956, 'unseen_last_notification', 'admin', 'Unseen Last Notification', 'Unseen Last Notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(957, 'send_notification', 'admin', 'Send Notification', 'Send Notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(958, 'seen', 'admin', 'Seen', 'Seen', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(959, 'send_time', 'admin', 'Send Time', 'Send Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(960, 'select_notification', 'admin', 'Select Notification', 'Select Notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(961, 'notification_list', 'admin', 'Notification List', 'Notification List', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(962, 'create_notification', 'admin', 'Create Notification', 'Create Notification', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(963, 'manage_order_types', 'admin', 'Manage Order Types', 'Manage Order Types', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(964, 'select_all', 'admin', 'Select All', 'Select All', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(965, 'checked_all', 'admin', 'Checked All', 'Checked All', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(966, 'custom_fields', 'admin', 'Custom Fields', 'Custom Fields', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(967, 'demo', 'admin', 'Demo', 'Demo', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(968, 'restaurant_demo', 'admin', 'Restaurant Demo ', 'Demo Restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(969, 'mark_as_delivered', 'admin', 'Mark as delivered', 'Mark as delivered', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(970, 'delivered', 'admin', 'Delivered', 'Delivered', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(971, 'select_delivery_boy', 'admin', 'Select Delivery Boy', 'Select Delivery Boy', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(972, 'mark_as_paid', 'admin', 'Mark as Paid', 'Mark as Paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(973, 'unpaid', 'admin', 'Unpaid', 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(974, 'mark_as_completed_paid', 'admin', 'Mark as completed & Paid', 'Mark as completed & Paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(975, 'completed_paid', 'admin', 'Completed & Paid', 'Completed & Paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(976, 'add_delivery_boy', 'admin', 'Add delivery Boy', 'Add delivery guy', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(977, 'dboy_name', 'admin', 'Delivery Guy', 'Delivery Guy', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(978, 'selectd_by_restaurant', 'admin', 'Selected by Restaurant', 'Selected by Restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(979, 'vendor', 'admin', 'Vendor', 'Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(980, 'account_created_successfully', 'admin', 'Account Created Successfully', 'Account Created Successfully', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(981, 'account_confirmation_link_msg', 'admin', 'The account confirmation link has been emailed to you, follow the link in the email to continue.', 'The account confirmation link has been emailed to you, follow the link in the email to continue.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(982, 'please_login_to_continue', 'admin', 'Please Login to continue.', 'Please Login to continue.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(983, 'sorry_today_pickup_time_is_not_available', 'admin', 'Sorry, Pickup Time is not available today', 'Sorry, Pickup Time is not available today', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(984, 'table-dine-in', 'admin', 'Table / Dine-in', 'Table / Dine-in', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(985, 'enable_whatsapp_for_order', 'admin', 'Enable WhatsApp For order', 'Enable WhatsApp For order', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(986, 'room_services', 'admin', 'Room services', 'Room services', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(987, 'hotel_name', 'admin', 'Hotel Name', 'Hotel Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(988, 'hotel_list', 'admin', 'Hotel List', 'Hotel List', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(989, 'room_numbers', 'admin', 'Room Numbers', 'Room Numbers', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(990, 'sorry_room_numbers_not_available', 'admin', 'Sorry Room Not found', 'Sorry Room Not found', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(991, 'room_number', 'admin', 'Room Number', 'Room Number', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(992, 'package_restaurant_dine_in', 'admin', 'Package / Restaurant Dine-In', 'Package / Restaurant Dine-In', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(993, 'open_24_hours', 'admin', 'Open 24 Hours', 'Open 24 Hours', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(994, 'enable_24_hours', 'admin', 'Enable 24 Hours', 'Enable 24 Hours', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(995, 'select_room_number', 'admin', 'Select Room Number', 'Select Room Number', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE `menu_type` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `name_uz` varchar(255) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `name_ch` varchar(255) NOT NULL,
  `name_fr` varchar(255) NOT NULL,
  `name_po` varchar(255) NOT NULL,
  `name_hi` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `orders` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`id`, `user_id`, `type`, `name_en`, `name_ar`, `name_uz`, `name_ru`, `name_ch`, `name_fr`, `name_po`, `name_hi`, `details`, `orders`, `status`, `created_at`, `thumb`, `images`) VALUES
(1, 2, 'pizza', 'Category name English *', 'Category name Arabic', 'Category name Uzbek', 'Category name Russian', 'Category name Chinese', 'Category name French', 'Category name Portuguese', 'asdasdasdd', '', 0, 1, '2023-01-02 20:08:15', 'uploads/thumb/9eaf7176e0348e6062a47cb7793bb284.jpg', 'uploads/big/9eaf7176e0348e6062a47cb7793bb284.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment`
--

CREATE TABLE `offline_payment` (
  `txn_id` varchar(255) NOT NULL,
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `package` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `approve_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_item_list`
--

CREATE TABLE `order_item_list` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `item_id` int NOT NULL,
  `qty` int NOT NULL,
  `sub_total` double NOT NULL,
  `item_price` double NOT NULL,
  `is_package` int NOT NULL,
  `package_id` int NOT NULL,
  `is_size` int NOT NULL,
  `size_slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `is_extras` int NOT NULL DEFAULT '0',
  `extra_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_payment_info`
--

CREATE TABLE `order_payment_info` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `price` varchar(255) NOT NULL,
  `currency_code` varchar(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `payment_by` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `order_type` int NOT NULL DEFAULT '0',
  `all_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ;

-- --------------------------------------------------------

--
-- Table structure for table `order_types`
--

CREATE TABLE `order_types` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `is_order_types` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_types`
--

INSERT INTO `order_types` (`id`, `name`, `slug`, `status`, `is_order_types`, `created_at`) VALUES
(1, 'Cash on delivery', 'cash-on-delivery', 1, 1, '2021-04-06 16:48:57'),
(2, 'Booking', 'booking', 1, 1, '2021-04-06 16:50:12'),
(3, 'Reservation', 'reservation', 1, 0, '2021-04-06 16:50:38'),
(4, 'Pickup', 'pickup', 1, 1, '2021-04-06 16:50:38'),
(5, 'Pay in card', 'pay-in-cash', 1, 1, '2021-04-06 16:50:38'),
(6, 'Dine-in', 'dine-in', 1, 1, '2021-04-06 16:50:38'),
(7, 'Pay cash', 'pay-cash', 1, 1, '2022-09-20 23:04:31'),
(8, 'Room Service', 'room-service', 1, 1, '2022-09-20 23:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `order_user_list`
--

CREATE TABLE `order_user_list` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `uid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '0==panding,\r\n1==approve,2==completed,3==reject',
  `created_at` datetime NOT NULL,
  `reservation_date` datetime NOT NULL,
  `order_type` int NOT NULL DEFAULT '1',
  `table_no` int NOT NULL DEFAULT '0',
  `total_person` int NOT NULL,
  `total` varchar(255) NOT NULL,
  `cancel_time` datetime NOT NULL,
  `accept_time` datetime DEFAULT NULL,
  `completed_time` datetime DEFAULT NULL,
  `g_map` varchar(255) NOT NULL,
  `is_ring` int NOT NULL DEFAULT '0',
  `is_table` int NOT NULL,
  `reservation_type` int NOT NULL,
  `comments` text NOT NULL,
  `qr_link` varchar(255) NOT NULL,
  `delivery_charge` double NOT NULL,
  `is_payment` int NOT NULL,
  `payment_by` varchar(255) NOT NULL,
  `pickup_point` int NOT NULL,
  `es_time` varchar(10) NOT NULL,
  `time_slot` varchar(10) NOT NULL,
  `estimate_time` datetime DEFAULT NULL,
  `is_extras` int NOT NULL DEFAULT '0',
  `delivery_area` varchar(255) DEFAULT NULL,
  `is_preparing` int NOT NULL DEFAULT '0',
  `token_number` varchar(255) DEFAULT NULL,
  `dine_id` int NOT NULL DEFAULT '0',
  `customer_id` int NOT NULL,
  `dboy_id` int NOT NULL,
  `dboy_status` int NOT NULL,
  `is_picked` int NOT NULL,
  `discount` double NOT NULL,
  `dboy_accept_time` datetime DEFAULT NULL,
  `dboy_picked_time` datetime DEFAULT NULL,
  `dboy_completed_time` datetime DEFAULT NULL,
  `is_db_accept` int NOT NULL DEFAULT '0',
  `is_db_completed` int NOT NULL DEFAULT '0',
  `tax_fee` double NOT NULL,
  `sub_total` double NOT NULL,
  `pickup_time` varchar(255) DEFAULT NULL,
  `customer_rating` varchar(50) DEFAULT NULL,
  `customer_review` text,
  `rating_time` datetime DEFAULT NULL,
  `shipping_id` int NOT NULL,
  `pickup_date` date DEFAULT NULL,
  `is_coupon` int NOT NULL DEFAULT '0',
  `coupon_percent` varchar(255) DEFAULT NULL,
  `coupon_id` int NOT NULL DEFAULT '0',
  `use_payment` int NOT NULL DEFAULT '0',
  `tips` double DEFAULT NULL,
  `is_change` int NOT NULL DEFAULT '0',
  `change_amount` varchar(50) NOT NULL DEFAULT '0',
  `is_restaurant_payment` int NOT NULL DEFAULT '0',
  `is_db_request` int NOT NULL DEFAULT '0',
  `db_completed_by` varchar(255) NOT NULL DEFAULT 'staff',
  `hotel_id` int NOT NULL,
  `room_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int NOT NULL,
  `package_name` varchar(250) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `package_type` varchar(255) NOT NULL DEFAULT 'year',
  `order_limit` int NOT NULL DEFAULT '0',
  `item_limit` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `custom_fields_config` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `slug`, `price`, `package_type`, `order_limit`, `item_limit`, `status`, `created_at`, `custom_fields_config`) VALUES
(1, 'Trial Basic', 'trial-basic', 0, 'fifteen', 3, 4, 1, '2021-09-07 11:27:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `account_type` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `all_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method_list`
--

CREATE TABLE `payment_method_list` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `active_slug` varchar(255) DEFAULT NULL,
  `status_slug` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment_method_list`
--

INSERT INTO `payment_method_list` (`id`, `name`, `slug`, `active_slug`, `status_slug`, `status`) VALUES
(1, 'Paypal', 'paypal', 'paypal_status', 'is_paypal', 1),
(2, 'Stripe', 'stripe', 'stripe_status', 'is_stripe', 1),
(3, 'Razorpay', 'razorpay', 'razorpay_status', 'is_razorpay', 1),
(4, 'Stripe FPX', 'stripe_fpx', 'stripe_fpx_status', 'is_fpx', 1),
(5, 'Paytm', 'paytm', 'paytm_status', 'is_paytm', 1),
(6, 'Mercadopago', 'mercado', 'mercado_status', 'is_mercado', 1),
(7, 'Flutterwave', 'flutterwave', 'flutterwave_status', 'is_flutterwave', 1),
(8, 'Paystack', 'paystack', 'paystack_status', 'is_paystack', 1),
(9, 'Offline', 'offline', 'offline_status', 'is_offline', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission_list`
--

CREATE TABLE `permission_list` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `permission_list`
--

INSERT INTO `permission_list` (`id`, `title`, `slug`, `status`) VALUES
(1, 'Add New Item', 'add', 1),
(2, 'Update', 'update', 1),
(3, 'Delete', 'delete', 1),
(4, 'Settings Control', 'setting-control', 1),
(5, 'Order Control', 'order-control', 1),
(6, 'Profile Control', 'profile-control', 1),
(7, 'Change status', 'change-status', 1),
(8, 'Order cancel', 'order-cancel', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pickup_points_area`
--

CREATE TABLE `pickup_points_area` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `images` varchar(250) DEFAULT NULL,
  `thumb` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `link` varchar(250) DEFAULT NULL,
  `is_video` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `id` int NOT NULL,
  `package_id` int DEFAULT NULL,
  `feature_id` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`id`, `package_id`, `feature_id`, `status`, `created_at`) VALUES
(1, 1, 1, 1, '2021-09-07 11:27:33'),
(2, 1, 2, 1, '2021-09-07 11:27:33'),
(3, 1, 3, 1, '2021-09-07 11:27:33'),
(4, 1, 4, 1, '2021-09-07 11:27:33'),
(5, 1, 5, 1, '2021-09-07 11:27:33'),
(6, 1, 6, 1, '2021-09-07 11:27:33'),
(7, 1, 7, 1, '2021-09-07 11:27:33'),
(8, 1, 8, 1, '2021-09-07 11:27:34'),
(9, 1, 9, 1, '2021-09-07 11:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `privacy`
--

CREATE TABLE `privacy` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `profile_home`
--

CREATE TABLE `profile_home` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `whatsapp_text` text,
  `document` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `address` text,
  `google_map` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `question_list`
--

CREATE TABLE `question_list` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_date`
--

CREATE TABLE `reservation_date` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `days` int NOT NULL,
  `start_time` varchar(50) NOT NULL,
  `end_time` varchar(50) NOT NULL,
  `is_24` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_types`
--

CREATE TABLE `reservation_types` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `shop_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_list`
--

CREATE TABLE `restaurant_list` (
  `id` int NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `address` varchar(266) NOT NULL,
  `email` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `about_short` varchar(255) NOT NULL,
  `is_order` int NOT NULL DEFAULT '1',
  `delivery_charge_in` double NOT NULL DEFAULT '0',
  `delivery_charge_out` double NOT NULL DEFAULT '0',
  `timing` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `cover_photo` varchar(255) NOT NULL,
  `cover_photo_thumb` varchar(255) NOT NULL,
  `is_reservation` int NOT NULL DEFAULT '1',
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `off_day` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `social_list` text NOT NULL,
  `created_at` datetime NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `icon` varchar(10) NOT NULL,
  `dial_code` varchar(10) NOT NULL,
  `country_id` int NOT NULL,
  `is_whatsapp` int NOT NULL DEFAULT '1',
  `paypal_config` varchar(255) NOT NULL,
  `stripe_config` varchar(255) NOT NULL,
  `razorpay_config` varchar(255) NOT NULL,
  `stock_status` int NOT NULL,
  `is_stock_count` int NOT NULL,
  `gmap_key` varchar(255) NOT NULL,
  `is_gmap` int NOT NULL,
  `is_kds` int NOT NULL DEFAULT '1',
  `es_time` int NOT NULL,
  `time_slot` varchar(20) DEFAULT NULL,
  `tax_fee` double NOT NULL,
  `min_order` double NOT NULL,
  `discount` double NOT NULL,
  `pickup_time_slots` text,
  `slogan` varchar(255) DEFAULT NULL,
  `is_review` int NOT NULL DEFAULT '1',
  `is_paypal` int NOT NULL DEFAULT '1',
  `is_stripe` int NOT NULL DEFAULT '1',
  `is_razorpay` int NOT NULL DEFAULT '1',
  `paypal_status` int NOT NULL DEFAULT '1',
  `stripe_status` int NOT NULL DEFAULT '1',
  `razorpay_status` int NOT NULL DEFAULT '1',
  `stripe_fpx_status` int NOT NULL DEFAULT '0',
  `mercado_status` int NOT NULL DEFAULT '0',
  `paytm_status` int NOT NULL DEFAULT '0',
  `flutterwave_status` int NOT NULL DEFAULT '0',
  `is_fpx` int NOT NULL DEFAULT '1',
  `fpx_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_mercado` int NOT NULL DEFAULT '0',
  `mercado_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_paytm` int NOT NULL DEFAULT '0',
  `paytm_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_flutterwave` int NOT NULL DEFAULT '0',
  `flutterwave_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_customer_login` int NOT NULL DEFAULT '1',
  `currency_position` int NOT NULL DEFAULT '1',
  `number_formats` int NOT NULL DEFAULT '1',
  `is_area_delivery` int NOT NULL DEFAULT '0',
  `is_call_waiter` int NOT NULL DEFAULT '1',
  `is_admin_gmap` int NOT NULL DEFAULT '0',
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `whatsapp_msg` text,
  `is_language` int NOT NULL DEFAULT '0',
  `is_pin` int NOT NULL DEFAULT '0',
  `pin_number` varchar(255) DEFAULT NULL,
  `date_format` int NOT NULL DEFAULT '8',
  `time_format` int NOT NULL DEFAULT '1',
  `is_coupon` int NOT NULL DEFAULT '0',
  `paystack_status` int NOT NULL DEFAULT '1',
  `is_paystack` int NOT NULL DEFAULT '0',
  `paystack_config` longtext,
  `is_admin_onsignal` int NOT NULL DEFAULT '0',
  `is_question` int NOT NULL DEFAULT '0',
  `is_radius` int NOT NULL DEFAULT '0',
  `radius_config` longtext,
  `is_tax` int NOT NULL DEFAULT '0',
  `tax_status` varchar(10) NOT NULL DEFAULT '+',
  `is_kds_pin` int NOT NULL DEFAULT '0',
  `kds_pin` varchar(20) DEFAULT NULL,
  `order_view_style` int NOT NULL DEFAULT '1',
  `whatsapp_enable_for` longtext NOT NULL
) ;

--
-- Dumping data for table `restaurant_list`
--

INSERT INTO `restaurant_list` (`id`, `shop_id`, `user_id`, `username`, `phone`, `name`, `short_name`, `location`, `address`, `email`, `about`, `about_short`, `is_order`, `delivery_charge_in`, `delivery_charge_out`, `timing`, `thumb`, `images`, `cover_photo`, `cover_photo_thumb`, `is_reservation`, `start_time`, `end_time`, `off_day`, `status`, `social_list`, `created_at`, `currency_code`, `icon`, `dial_code`, `country_id`, `is_whatsapp`, `paypal_config`, `stripe_config`, `razorpay_config`, `stock_status`, `is_stock_count`, `gmap_key`, `is_gmap`, `is_kds`, `es_time`, `time_slot`, `tax_fee`, `min_order`, `discount`, `pickup_time_slots`, `slogan`, `is_review`, `is_paypal`, `is_stripe`, `is_razorpay`, `paypal_status`, `stripe_status`, `razorpay_status`, `stripe_fpx_status`, `mercado_status`, `paytm_status`, `flutterwave_status`, `is_fpx`, `fpx_config`, `is_mercado`, `mercado_config`, `is_paytm`, `paytm_config`, `is_flutterwave`, `flutterwave_config`, `is_customer_login`, `currency_position`, `number_formats`, `is_area_delivery`, `is_call_waiter`, `is_admin_gmap`, `whatsapp_number`, `whatsapp_msg`, `is_language`, `is_pin`, `pin_number`, `date_format`, `time_format`, `is_coupon`, `paystack_status`, `is_paystack`, `paystack_config`, `is_admin_onsignal`, `is_question`, `is_radius`, `radius_config`, `is_tax`, `tax_status`, `is_kds_pin`, `kds_pin`, `order_view_style`, `whatsapp_enable_for`) VALUES
(1, '2IkC9M1', 2, 'rest', '1222454545', 'Rest', 'Res', 'Rest', 'Rest', 'Rest@Rest.com', '', 'Rest', 1, 0, 0, '', '', '', '', '', 1, '00:00:00', '00:00:00', '', 1, '{\"whatsapp\":\"\",\"facebook\":\"\",\"instagram\":\"\",\"twitter\":\"\",\"youtube\":\"\",\"website\":\"\"}', '2023-01-02 04:00:24', '', '$', '44', 1, 1, '', '', '', 0, 0, '', 0, 1, 0, NULL, 0, 0, 0, NULL, 'Rest', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, NULL, 0, NULL, 0, NULL, 0, NULL, 1, 2, 1, 0, 1, 0, NULL, NULL, 0, 0, NULL, 8, 1, 0, 1, 0, NULL, 0, 0, 0, NULL, 0, '+', 0, NULL, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `section_banners`
--

CREATE TABLE `section_banners` (
  `id` int NOT NULL,
  `section_name` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `sub_heading` text,
  `images` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `section_banners`
--

INSERT INTO `section_banners` (`id`, `section_name`, `heading`, `sub_heading`, `images`, `status`, `created_at`) VALUES
(1, 'home', 'Build Your Brand With', 'We are team of talanted designers making websites with Bootstrap', 'uploads/site_banners/17352a0601cfc7d6903ef8ed691a257c.jpg', 1, '2021-02-20 10:35:54'),
(2, 'features', 'AMAZING FEATURES PROJECT', 'Lorem ipsum dolor sit amet, consectetur adipisicing, elit. Consequatur neque tenetur dolores laudantium quod facere qua', 'uploads/big/54140304836f646b3a46f5e0ebc9a900.png', 1, '2020-10-01 15:25:47'),
(3, 'faq', 'FAQ', 'Lorem ipsum dolor sit amet, consectetur adipisicing, elit. Consequatur neque tenetur dolores laudantium quod facere qua', 'uploads/site_banners/db6862f2f5907b6d9a5c7b4b0efe3404.png', 1, '2021-02-25 16:21:58'),
(4, 'how_it_works', 'HOW IT WORKS', 'Lorem ipsum dolor sit amet, consectetur adipisicing, elit. Consequatur neque tenetur dolores laudantium quod facere qua', NULL, 1, '2020-10-01 15:34:33'),
(5, 'teams', 'MEET WITH OUR TEAMS', 'Lorem ipsum dolor sit amet, consectetur adipisicing, elit. Consequatur neque tenetur dolores laudantium quod facere qua', NULL, 1, '2020-10-01 15:35:01'),
(6, 'services', 'OUR SERVICES', 'Lorem ipsum dolor sit amet, consectetur adipisicing, elit. Consequatur neque tenetur dolores laudantium quod facere qua', NULL, 1, '2020-10-01 15:40:10'),
(7, 'reviews', 'Reviews', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Unde, eum vel recusandae, voluptas dolore dicta! Lorem ipsum dolor sit amet consectetur', NULL, 1, '2020-10-18 10:46:53'),
(8, 'pricing', 'Select a package to continue', 'Lorem ipsum dolor sit amet, consectetur adipisicing, elit. Consequatur neque tenetur dolores laudantium quod facere qua', NULL, 0, '2020-10-16 16:29:29'),
(9, 'contacts', 'Contacts', 'Need any help. Please contact with us', NULL, 1, '2021-02-20 17:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(250) NOT NULL,
  `icon` varchar(250) NOT NULL,
  `details` text NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `icon`, `details`, `status`, `created_at`) VALUES
(1, 8, 'Click to Call', '<i class=\"fas fa-phone\"></i>', 'Your customers will reach you by just tapping on mobile number on vCard.', 1, '2020-10-12 11:35:47'),
(3, 8, 'Click to Call', '<i class=\"fas fa-home\"></i>', 'Your customers will reach you by just tapping on mobile number on vCard.', 1, '2020-10-13 16:23:00'),
(4, 8, 'Click to Call', '<i class=\"fas fa-phone\"></i>', 'Your customers will reach you by just tapping on mobile number on vCard.Your customers will reach you by just tapping on mobile number on vCard. Your customers will reach you by just tapping on mobile number on vCard.', 1, '2020-10-12 11:35:47'),
(5, 8, 'Click to Call', '<i class=\"fas fa-phone\"></i>', 'Your customers will reach you by just tapping on mobile number on vCard.', 1, '2020-10-12 11:35:47'),
(6, 8, 'Click to Call', '<i class=\"fas fa-phone\"></i>', 'Your customers will reach you by just tapping on mobile number on vCard.', 0, '2020-10-12 11:35:47'),
(7, 8, 'Click to Call', '<i class=\"fas fa-phone\"></i>', 'Your customers will reach you by just tapping on mobile number on vCard.', 0, '2020-10-12 11:35:47');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `site_name` varchar(250) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `analytics` text NOT NULL,
  `smtp_mail` varchar(255) NOT NULL,
  `email_type` int NOT NULL DEFAULT '1',
  `smtp_config` varchar(255) NOT NULL,
  `subjects` varchar(255) NOT NULL,
  `is_paypal` int NOT NULL DEFAULT '0',
  `paypal_config` varchar(255) NOT NULL,
  `is_stripe` int NOT NULL DEFAULT '0',
  `stripe_config` varchar(255) NOT NULL,
  `is_recaptcha` int NOT NULL DEFAULT '0',
  `recaptcha_config` varchar(255) NOT NULL,
  `social_sites` longtext,
  `pricing_layout` int NOT NULL DEFAULT '1',
  `time_zone` varchar(255) NOT NULL DEFAULT 'Asia/Dhaka',
  `is_registration` tinyint NOT NULL DEFAULT '1',
  `auto_approval` int NOT NULL DEFAULT '1',
  `is_email_verification` int NOT NULL DEFAULT '1',
  `new_user_mail` int NOT NULL DEFAULT '1',
  `is_email_verify_free` int NOT NULL DEFAULT '0',
  `user_invoice` int NOT NULL DEFAULT '1',
  `language` varchar(255) NOT NULL DEFAULT 'english',
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `user_count` int NOT NULL DEFAULT '0',
  `home_banner` varchar(255) NOT NULL,
  `home_banner_thumb` varchar(255) NOT NULL,
  `site_qr_link` varchar(255) NOT NULL,
  `site_qr_logo` varchar(255) NOT NULL,
  `active_code` varchar(255) NOT NULL,
  `site_id` int NOT NULL,
  `version` double NOT NULL,
  `user_id` int NOT NULL,
  `razorpay_key` varchar(255) DEFAULT NULL,
  `razorpay_key_id` varchar(255) DEFAULT NULL,
  `is_razorpay` int NOT NULL DEFAULT '0',
  `currency` int NOT NULL DEFAULT '26',
  `is_ads` int NOT NULL DEFAULT '0',
  `is_rating` int NOT NULL DEFAULT '1',
  `site_info` varchar(255) DEFAULT NULL,
  `purchase_code` varchar(255) NOT NULL,
  `supported_until` datetime DEFAULT NULL,
  `is_user` int NOT NULL DEFAULT '1',
  `is_order_video` int NOT NULL DEFAULT '1',
  `site_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `seo_settings` text,
  `active_key` varchar(155) DEFAULT NULL,
  `is_signup` int NOT NULL DEFAULT '1',
  `is_auto_verified` int NOT NULL DEFAULT '0',
  `twillo_sms_settings` varchar(255) NOT NULL,
  `country_id` int NOT NULL DEFAULT '15',
  `is_update` int NOT NULL DEFAULT '0',
  `license_name` varchar(255) NOT NULL,
  `is_lang_list` int NOT NULL DEFAULT '1',
  `purchase_date` datetime DEFAULT NULL,
  `license_code` varchar(255) DEFAULT NULL,
  `is_item_search` int NOT NULL DEFAULT '1',
  `environment` varchar(255) NOT NULL DEFAULT 'live',
  `is_landing_page` int NOT NULL DEFAULT '0',
  `landing_page_url` varchar(255) DEFAULT NULL,
  `pixel_id` varchar(255) DEFAULT NULL,
  `paypal_status` int NOT NULL DEFAULT '1',
  `stripe_status` int NOT NULL DEFAULT '1',
  `razorpay_status` int NOT NULL DEFAULT '1',
  `stripe_fpx_status` int NOT NULL DEFAULT '0',
  `mercado_status` int NOT NULL DEFAULT '0',
  `paytm_status` int NOT NULL DEFAULT '0',
  `flutterwave_status` int NOT NULL DEFAULT '0',
  `is_fpx` int NOT NULL DEFAULT '1',
  `fpx_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_mercado` int NOT NULL DEFAULT '0',
  `mercado_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_paytm` int NOT NULL DEFAULT '0',
  `paytm_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_flutterwave` int NOT NULL DEFAULT '0',
  `flutterwave_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `gmap_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_pwa` int NOT NULL DEFAULT '0',
  `pwa_config` text,
  `system_fonts` varchar(255) DEFAULT NULL,
  `custom_css` longtext,
  `long_description` longtext,
  `paystack_status` int NOT NULL DEFAULT '1',
  `is_paystack` int NOT NULL DEFAULT '0',
  `paystack_config` longtext,
  `nearby_length` varchar(20) DEFAULT '5',
  `extras` longtext,
  `notifications` longtext,
  `restaurant_demo` varchar(50) DEFAULT NULL,
  `sendgrid_api_key` longtext,
  `currency_position` int NOT NULL DEFAULT '1',
  `number_formats` int NOT NULL DEFAULT '1',
  `offline_status` int NOT NULL DEFAULT '1',
  `is_offline` int NOT NULL DEFAULT '1',
  `offline_config` longtext
) ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `copyright`, `description`, `analytics`, `smtp_mail`, `email_type`, `smtp_config`, `subjects`, `is_paypal`, `paypal_config`, `is_stripe`, `stripe_config`, `is_recaptcha`, `recaptcha_config`, `social_sites`, `pricing_layout`, `time_zone`, `is_registration`, `auto_approval`, `is_email_verification`, `new_user_mail`, `is_email_verify_free`, `user_invoice`, `language`, `logo`, `favicon`, `user_count`, `home_banner`, `home_banner_thumb`, `site_qr_link`, `site_qr_logo`, `active_code`, `site_id`, `version`, `user_id`, `razorpay_key`, `razorpay_key_id`, `is_razorpay`, `currency`, `is_ads`, `is_rating`, `site_info`, `purchase_code`, `supported_until`, `is_user`, `is_order_video`, `site_url`, `created_at`, `updated_at`, `seo_settings`, `active_key`, `is_signup`, `is_auto_verified`, `twillo_sms_settings`, `country_id`, `is_update`, `license_name`, `is_lang_list`, `purchase_date`, `license_code`, `is_item_search`, `environment`, `is_landing_page`, `landing_page_url`, `pixel_id`, `paypal_status`, `stripe_status`, `razorpay_status`, `stripe_fpx_status`, `mercado_status`, `paytm_status`, `flutterwave_status`, `is_fpx`, `fpx_config`, `is_mercado`, `mercado_config`, `is_paytm`, `paytm_config`, `is_flutterwave`, `flutterwave_config`, `gmap_config`, `is_pwa`, `pwa_config`, `system_fonts`, `custom_css`, `long_description`, `paystack_status`, `is_paystack`, `paystack_config`, `nearby_length`, `extras`, `notifications`, `restaurant_demo`, `sendgrid_api_key`, `currency_position`, `number_formats`, `offline_status`, `is_offline`, `offline_config`) VALUES
(1, 'Menu', '', '', '', '', 1, '', '', 0, '', 0, '', 0, '', NULL, 1, 'Asia/Dhaka', 1, 1, 1, 1, 0, 1, 'english', '', '', 0, '', '', 'uploads/qr_image/site_qr_1719452692.png', '', 'active_code', 99, 2.8, 0, NULL, NULL, 0, 26, 0, 1, '', 'purchase_code', '0000-00-00 00:00:00', 1, 1, 'site_url', '2023-01-02 03:58:14', NULL, NULL, 'active_key', 1, 0, '', 15, 0, 'Extended', 1, '0000-00-00 00:00:00', '', 1, 'live', 0, NULL, '', 1, 1, 1, 0, 0, 0, 0, 1, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '', 1, 0, NULL, '5', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_location_list`
--

CREATE TABLE `shop_location_list` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_features`
--

CREATE TABLE `site_features` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `images` varchar(200) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `details` text,
  `dir` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `site_features`
--

INSERT INTO `site_features` (`id`, `user_id`, `title`, `images`, `thumb`, `icon`, `details`, `dir`, `status`, `created_at`) VALUES
(1, 1, 'Choose a name of your  Restaurant', '', '', '<i class=\"icofont-newspaper\"></i>', 'Choose you name and create your restaurant easily', 'left', 1, '2021-02-25 15:54:09'),
(2, 1, 'Create Menu', '', '', '<i class=\"icofont-list\"></i>', 'Add to cart your item and make a menu', 'right', 1, '2021-02-25 16:00:05'),
(3, 1, 'Make an order', '', '', '<i class=\"icofont-fast-delivery\"></i>', 'After select all items make an order select order type like  booking or home delivery ', 'right', 1, '2021-02-25 16:03:50'),
(4, 1, 'Mail verification', '', '', '<i class=\"icofont-envelope-open\"></i>', 'After create you account , verify you account by mail verification', 'left', 1, '2021-02-25 15:55:40'),
(6, 1, 'Make  Payment', NULL, NULL, '<i class=\"icofont-pay\"></i>', 'Make a payment if your not a free user. Make payment using Stripe,Paypal,Razorpay', 'left', 1, '2021-02-25 15:56:58'),
(7, 1, 'QR code', NULL, NULL, '<i class=\"icofont-qr-code\"></i>', 'After create account dynamically create your account QR code. Share your account via QR code', 'left', 1, '2021-02-25 15:58:46'),
(8, 1, 'Ordering via Whatsapp', NULL, NULL, '<i class=\"icofont-wechat\"></i>', 'After complete order confirm order via WhatsApp,  continue chat & finalize order', 'right', 1, '2021-02-25 16:10:34'),
(9, 1, 'Track your order', NULL, NULL, '<i class=\"icofont-search-restaurant\"></i>', 'Track your order using your phone & Order id or QR code', 'right', 1, '2021-02-25 16:12:15');

-- --------------------------------------------------------

--
-- Table structure for table `site_services`
--

CREATE TABLE `site_services` (
  `id` int NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `details` text,
  `images` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `site_services`
--

INSERT INTO `site_services` (`id`, `title`, `details`, `images`, `thumb`, `status`, `created_at`) VALUES
(1, 'Create Your Restaurant Profile', '<p>Make you restaurant profile with unique design, Dynamic color, Social sites.</p>', 'uploads/big/e003eb0309f4315d253ec4ffb31b2ca1.png', 'uploads/thumb/e003eb0309f4315d253ec4ffb31b2ca1.png', 1, '2021-02-25 16:34:19'),
(2, 'Check Order and orders statistics', '<p>Check your order, reservation , revenue and all statistics with strong dashboard  </p>', 'uploads/big/cb082005e089ae453eae2cc6f41f2acd.png', 'uploads/thumb/cb082005e089ae453eae2cc6f41f2acd.png', 1, '2021-02-25 16:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `site_team`
--

CREATE TABLE `site_team` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `images` varchar(200) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `site_team`
--

INSERT INTO `site_team` (`id`, `user_id`, `name`, `designation`, `images`, `thumb`, `status`, `created_at`) VALUES
(1, 1, 'Mr. Alex', 'CEO', 'uploads/big/c31f02324e2cc2ded3a1286d48be5030.jpg', 'uploads/thumb/c31f02324e2cc2ded3a1286d48be5030.jpg', 1, '2021-02-25 16:30:25'),
(2, 1, 'Mr. Smith', 'Client', 'uploads/big/38ceda12ce3cc859232f10e6c563e8fe.jpg', 'uploads/thumb/38ceda12ce3cc859232f10e6c563e8fe.jpg', 1, '2021-02-25 16:29:57'),
(3, 1, 'Miss Arenda', 'Client', 'uploads/big/aa01e93ee641057da403846721c66d8c.jpg', 'uploads/thumb/aa01e93ee641057da403846721c66d8c.jpg', 1, '2021-02-22 10:43:48'),
(6, 1, 'Mr. Beak', 'Manager', 'uploads/big/ffa2b9a5422b2f745d0c3febd07027e0.jpg', 'uploads/thumb/ffa2b9a5422b2f745d0c3febd07027e0.jpg', 1, '2021-02-25 16:31:00');

-- --------------------------------------------------------

--
-- Table structure for table `social_sites`
--

CREATE TABLE `social_sites` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `bg_color` varchar(50) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `social_sites`
--

INSERT INTO `social_sites` (`id`, `user_id`, `name`, `icon`, `type`, `link`, `color`, `bg_color`, `status`, `created_at`) VALUES
(1, 8, 'facebook', '<i class=\"fa fa-facebook\" aria-hidden=\"true\"></i>', '', 'https://www.facebook.com/nazmul.nm/', NULL, NULL, 1, '2020-10-12 10:59:05'),
(2, 8, 'twitter', '<i class=\"fa fa-twitter\" aria-hidden=\"true\"></i>', 'others', 'https://www.twitter.com/nazmul.nm/', NULL, NULL, 1, '2020-11-01 17:55:16'),
(3, 8, 'instagram', '<i class=\"fa fa-instagram\" aria-hidden=\"true\"></i>', '', 'https://www.twitter.com/nazmul.nm/', NULL, NULL, 1, '2020-11-01 17:55:30'),
(4, 8, 'github', '<i class=\"fa fa-github\" aria-hidden=\"true\"></i>', '', 'https://www.github.com/nazmul.nm/', NULL, NULL, 1, '2020-11-01 17:55:40'),
(5, 8, 'youtube', '<i class=\"fa fa-youtube\" aria-hidden=\"true\"></i>', '', '', NULL, NULL, 1, '2019-12-03 16:32:02'),
(6, 8, 'whatsapp', '<i class=\"fa fa-whatsapp\" aria-hidden=\"true\"></i>', 'whatsapp', '01745419093', NULL, NULL, 1, '2020-11-01 17:55:53'),
(7, 8, 'behance', '<i class=\"fa fa-behance\" aria-hidden=\"true\"></i>', '', '', NULL, NULL, 1, '2019-12-03 16:33:19'),
(8, 8, 'dribbble', '<i class=\"fa fa-dribbble\" aria-hidden=\"true\"></i>', '', '', NULL, NULL, 1, '2019-12-03 16:34:32'),
(10, 8, 'pinterest', '<i class=\"fab fa-pinterest-p\"></i>', 'others', '', NULL, NULL, 1, '2020-10-12 10:55:02');

-- --------------------------------------------------------

--
-- Table structure for table `staff_list`
--

CREATE TABLE `staff_list` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'staff',
  `country_id` varchar(5) DEFAULT NULL,
  `address` text,
  `gmap_link` text,
  `question` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriber_list`
--

CREATE TABLE `subscriber_list` (
  `id` int NOT NULL,
  `shop_id` int NOT NULL,
  `auth_id` int NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_areas`
--

CREATE TABLE `table_areas` (
  `id` int NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_list`
--

CREATE TABLE `table_list` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `area_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `size` int NOT NULL,
  `status` int NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `images` varchar(200) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `country` int DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `address` mediumtext,
  `account_type` int DEFAULT NULL,
  `user_role` int NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `is_verify` int NOT NULL DEFAULT '0',
  `is_payment` int NOT NULL DEFAULT '0',
  `is_expired` int NOT NULL DEFAULT '0',
  `is_request` int NOT NULL DEFAULT '0',
  `designation` varchar(250) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `verify_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `theme` int NOT NULL DEFAULT '1',
  `documents` varchar(255) DEFAULT NULL,
  `theme_color` int NOT NULL DEFAULT '0',
  `colors` varchar(255) NOT NULL DEFAULT '29c7ac',
  `cover_photo` varchar(255) DEFAULT NULL,
  `vcf_qr` varchar(255) DEFAULT NULL,
  `qr_link` varchar(255) DEFAULT NULL,
  `share_link` int NOT NULL,
  `is_deactived` int NOT NULL DEFAULT '0',
  `site_info` varchar(255) NOT NULL,
  `dial_code` varchar(20) NOT NULL,
  `hit` int NOT NULL DEFAULT '0',
  `menu_style` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `phone`, `country`, `password`, `gender`, `address`, `account_type`, `user_role`, `is_active`, `is_verify`, `is_payment`, `is_expired`, `is_request`, `designation`, `website`, `thumb`, `start_date`, `end_date`, `last_login`, `verify_time`, `created_at`, `theme`, `documents`, `theme_color`, `colors`, `cover_photo`, `vcf_qr`, `qr_link`, `share_link`, `is_deactived`, `site_info`, `dial_code`, `hit`, `menu_style`) VALUES
(1, 'admin', 'Abdou', 'admin@a.com', '01024020051', 2, '202cb962ac59075b964b07152d234b70', 'Male', '', NULL, 1, 1, 0, 0, 0, 0, '', '', NULL, NULL, NULL, '2023-01-02 20:02:12', NULL, '2023-01-02 03:21:08', 1, NULL, 0, '29c7ac', NULL, NULL, NULL, 0, 0, '', '', 0, 1),
(2, 'rest', NULL, 'admin@aa.com', NULL, NULL, '81dc9bdb52d04dc20036dbd8313ed055', NULL, NULL, 1, 0, 1, 1, 1, 0, 0, NULL, NULL, NULL, '2023-01-02 03:59:21', '2023-01-17 23:59:59', '2023-01-02 20:07:01', '2023-01-02 03:59:21', NULL, 1, NULL, 0, '29c7ac', NULL, NULL, NULL, 0, 0, '', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_active_features`
--

CREATE TABLE `users_active_features` (
  `id` int NOT NULL,
  `feature_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users_active_features`
--

INSERT INTO `users_active_features` (`id`, `feature_id`, `user_id`, `heading`, `sub_heading`, `status`) VALUES
(1, 1, 2, NULL, NULL, 1),
(2, 2, 2, NULL, NULL, 1),
(3, 3, 2, NULL, NULL, 1),
(4, 4, 2, NULL, NULL, 1),
(5, 5, 2, NULL, NULL, 1),
(6, 6, 2, NULL, NULL, 1),
(7, 7, 2, NULL, NULL, 1),
(8, 8, 2, NULL, NULL, 1),
(9, 9, 2, NULL, NULL, 1),
(10, 10, 2, NULL, NULL, 1),
(11, 11, 2, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_active_order_types`
--

CREATE TABLE `users_active_order_types` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `shop_id` int NOT NULL,
  `type_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `is_payment` int NOT NULL DEFAULT '0',
  `is_required` int NOT NULL DEFAULT '0',
  `is_admin_enable` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_rating`
--

CREATE TABLE `users_rating` (
  `id` int NOT NULL,
  `action_id` int DEFAULT '0',
  `user_id` int DEFAULT '0',
  `rating` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `msg` text,
  `rating_type` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `preloader` int NOT NULL DEFAULT '1',
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `is_download` int NOT NULL DEFAULT '0',
  `smtp_mail` varchar(255) DEFAULT NULL,
  `smtp_config` text,
  `email_type` int NOT NULL DEFAULT '1',
  `is_facebook` int NOT NULL DEFAULT '1',
  `seo_settings` text,
  `twillo_sms_settings` text,
  `pixel_id` varchar(255) DEFAULT NULL,
  `analytics_id` varchar(255) DEFAULT NULL,
  `icon_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `qr_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `pwa_config` text,
  `table_qr_config` longtext,
  `onesignal_config` longtext,
  `extra_config` longtext
) ;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`id`, `user_id`, `preloader`, `status`, `created_at`, `is_download`, `smtp_mail`, `smtp_config`, `email_type`, `is_facebook`, `seo_settings`, `twillo_sms_settings`, `pixel_id`, `analytics_id`, `icon_settings`, `qr_config`, `pwa_config`, `table_qr_config`, `onesignal_config`, `extra_config`) VALUES
(1, 2, 1, 1, NULL, 0, 'Rest@Rest.com', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_content`
--
ALTER TABLE `about_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_notification`
--
ALTER TABLE `admin_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_notification_list`
--
ALTER TABLE `admin_notification_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allergens`
--
ALTER TABLE `allergens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_waiter_list`
--
ALTER TABLE `call_waiter_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `coupon_list`
--
ALTER TABLE `coupon_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_area_list`
--
ALTER TABLE `delivery_area_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dine_in`
--
ALTER TABLE `dine_in`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_libraries`
--
ALTER TABLE `extra_libraries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_list`
--
ALTER TABLE `hotel_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `how_it_works`
--
ALTER TABLE `how_it_works`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_content`
--
ALTER TABLE `item_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_extras`
--
ALTER TABLE `item_extras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_packages`
--
ALTER TABLE `item_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_sizes`
--
ALTER TABLE `item_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_data`
--
ALTER TABLE `language_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_payment`
--
ALTER TABLE `offline_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_item_list`
--
ALTER TABLE `order_item_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_payment_info`
--
ALTER TABLE `order_payment_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_types`
--
ALTER TABLE `order_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_user_list`
--
ALTER TABLE `order_user_list`
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
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_method_list`
--
ALTER TABLE `payment_method_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_list`
--
ALTER TABLE `permission_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_points_area`
--
ALTER TABLE `pickup_points_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy`
--
ALTER TABLE `privacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_home`
--
ALTER TABLE `profile_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_list`
--
ALTER TABLE `question_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation_date`
--
ALTER TABLE `reservation_date`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation_types`
--
ALTER TABLE `reservation_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_list`
--
ALTER TABLE `restaurant_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_banners`
--
ALTER TABLE `section_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_location_list`
--
ALTER TABLE `shop_location_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_features`
--
ALTER TABLE `site_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_services`
--
ALTER TABLE `site_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_team`
--
ALTER TABLE `site_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_sites`
--
ALTER TABLE `social_sites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_list`
--
ALTER TABLE `staff_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriber_list`
--
ALTER TABLE `subscriber_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_areas`
--
ALTER TABLE `table_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_list`
--
ALTER TABLE `table_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_active_features`
--
ALTER TABLE `users_active_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_active_order_types`
--
ALTER TABLE `users_active_order_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_rating`
--
ALTER TABLE `users_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `about_content`
--
ALTER TABLE `about_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_notification`
--
ALTER TABLE `admin_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_notification_list`
--
ALTER TABLE `admin_notification_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `allergens`
--
ALTER TABLE `allergens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_waiter_list`
--
ALTER TABLE `call_waiter_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `coupon_list`
--
ALTER TABLE `coupon_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `delivery_area_list`
--
ALTER TABLE `delivery_area_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dine_in`
--
ALTER TABLE `dine_in`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `extra_libraries`
--
ALTER TABLE `extra_libraries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hotel_list`
--
ALTER TABLE `hotel_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `how_it_works`
--
ALTER TABLE `how_it_works`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_content`
--
ALTER TABLE `item_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_extras`
--
ALTER TABLE `item_extras`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_packages`
--
ALTER TABLE `item_packages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_sizes`
--
ALTER TABLE `item_sizes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `language_data`
--
ALTER TABLE `language_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=996;

--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offline_payment`
--
ALTER TABLE `offline_payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item_list`
--
ALTER TABLE `order_item_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_payment_info`
--
ALTER TABLE `order_payment_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_types`
--
ALTER TABLE `order_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_user_list`
--
ALTER TABLE `order_user_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_info`
--
ALTER TABLE `payment_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_method_list`
--
ALTER TABLE `payment_method_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permission_list`
--
ALTER TABLE `permission_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pickup_points_area`
--
ALTER TABLE `pickup_points_area`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `privacy`
--
ALTER TABLE `privacy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile_home`
--
ALTER TABLE `profile_home`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_list`
--
ALTER TABLE `question_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_date`
--
ALTER TABLE `reservation_date`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_types`
--
ALTER TABLE `reservation_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_list`
--
ALTER TABLE `restaurant_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_banners`
--
ALTER TABLE `section_banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_location_list`
--
ALTER TABLE `shop_location_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_features`
--
ALTER TABLE `site_features`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `site_services`
--
ALTER TABLE `site_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_team`
--
ALTER TABLE `site_team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `social_sites`
--
ALTER TABLE `social_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staff_list`
--
ALTER TABLE `staff_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriber_list`
--
ALTER TABLE `subscriber_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_areas`
--
ALTER TABLE `table_areas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_list`
--
ALTER TABLE `table_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_active_features`
--
ALTER TABLE `users_active_features`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users_active_order_types`
--
ALTER TABLE `users_active_order_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_rating`
--
ALTER TABLE `users_rating`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_settings`
--
ALTER TABLE `user_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
