-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16 يناير 2024 الساعة 10:51
-- إصدار الخادم: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajar`
--

-- --------------------------------------------------------

--
-- بنية الجدول `document`
--

CREATE TABLE `document` (
  `ID` int(11) NOT NULL,
  `Id_Item` int(11) NOT NULL,
  `name` text NOT NULL,
  `Id_user_lessor` int(11) NOT NULL,
  `Id_user_tenant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `document`
--

INSERT INTO `document` (`ID`, `Id_Item`, `name`, `Id_user_lessor`, `Id_user_tenant`) VALUES
(5, 16, 'بيت في حطين', 1, 2),
(6, 17, 'سيارة كامري 2020', 2, 1),
(7, 23, 'بيت في ام الحمام', 1, 2);

-- --------------------------------------------------------

--
-- بنية الجدول `porducts`
--

CREATE TABLE `porducts` (
  `ID` int(255) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `type` text NOT NULL,
  `region` text NOT NULL,
  `price` text NOT NULL,
  `pahtImg` text NOT NULL,
  `idUser` int(255) NOT NULL,
  `condit` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `porducts`
--

INSERT INTO `porducts` (`ID`, `name`, `description`, `type`, `region`, `price`, `pahtImg`, `idUser`, `condit`) VALUES
(16, 'بيت في حطين', 'بيت على شرعيان شمالي عمره ٣ سنوات', 'عقار', 'الرياض', '80000', '7404modern-residential-district-with-green-roof-balcony-generated-by-ai.jpg', 1, 1),
(17, 'سيارة كامري 2020', 'سيارة موديل 2020 فل كامل', 'مركبات', 'الرياض', '500', '4319e673ecfe-3d5b-40e6-a442-f8dccbab95f03104023651737824750.jpg', 2, 1),
(22, 'بيت في حطين', 'بيت في حطين على شرعياَ \nثلاث غرف \nمطبخ وحمام', 'عقار', 'الرياض', '85000', '1314modern-residential-district-with-green-roof-balcony-generated-by-ai.jpg', 1, 0),
(23, 'بيت في ام الحمام', 'بيت في ام الحمام', 'عقار', 'الرياض', '22000', '91991801d97c-7403-47c7-a492-3af0ea3447386224123613157752675.jpg', 1, 1),
(24, 'اكورد 2022', 'السيارة فل كامل', 'مركبات', 'جدة', '800', '515b72723fb-d672-4cb1-917c-3239c293b9898811569058632221155.jpg', 2, 0),
(25, 'بلايستيشن', 'بلايستيشن 5 ', 'اجهزة اكترونية', 'جدة', '200', '676modern-residential-district-with-green-roof-balcony-generated-by-ai.jpg', 2, 0),
(26, 'بيت في العارض', 'شقه على شرعياَ', 'عقار', 'الرياض', '18000', '2575bdc59280-6ee8-4525-a2a1-0506577101935501455061939164875.jpg', 2, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `ID` int(255) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`ID`, `name`, `email`, `password`) VALUES
(1, 'ناصر اليامي', 'ion75392@gmail.com', 'ce1c1cdc2fac8e1167f22cd4bd88d324'),
(2, 'عبدالرحمن ماجد', 'aboarh@gmail.com', '297ff4a97fcda4bc0ecf0bb18168034a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `porducts`
--
ALTER TABLE `porducts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `porducts`
--
ALTER TABLE `porducts`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
