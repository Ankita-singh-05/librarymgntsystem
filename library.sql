-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2023 at 07:05 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'phpgurukulofficial@gmail.com', 'admin', '202cb962ac59075b964b07152d234b70', '2023-02-17 16:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `overdue`
--

CREATE TABLE `overdue` (
  `StudentID` varchar(11) NOT NULL,
  `StudentName` varchar(40) NOT NULL,
  `MobNumber` varchar(11) NOT NULL,
  `Fine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblauthors`
--

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(5, 'Chetan Bhagat', '2023-02-19 05:17:42', NULL),
(6, 'HC Verma', '2023-02-19 05:17:52', NULL),
(7, 'Tech Knowledge', '2023-02-19 05:19:57', NULL),
(8, 'Tech Neo', '2023-02-19 05:20:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `Copies` int(3) NOT NULL,
  `IssuedCopies` int(3) NOT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` int(11) DEFAULT NULL,
  `BookPrice` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `Copies`, `IssuedCopies`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `RegDate`, `UpdationDate`) VALUES
(8, 'Physics', 1, 1, 6, 6, 3456, 340, '2023-02-19 05:18:50', '2023-02-19 05:28:53'),
(9, 'test', 1, 0, 9, 7, 360, 170, '2023-02-19 05:21:09', NULL),
(10, 'Shivaji maharaj', 2, 0, 20, 5, 6789, 90, '2023-02-19 05:34:18', NULL),
(11, 'test', 2, 0, 17, 6, 789, 209, '2023-02-19 05:34:52', NULL),
(12, 'Dracula', 3, 0, 21, 7, 678, 300, '2023-02-19 05:35:59', NULL),
(13, 'Vedic Mathematics', 2, 1, 19, 7, 2345, 100, '2023-02-20 06:01:07', '2023-02-20 06:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(15, 'Technology', 1, '2023-02-19 05:32:00', '0000-00-00 00:00:00'),
(16, 'General Knowledge', 1, '2023-02-19 05:32:11', '0000-00-00 00:00:00'),
(17, 'Science', 1, '2023-02-19 05:32:56', '0000-00-00 00:00:00'),
(18, 'Physics', 1, '2023-02-19 05:33:03', '0000-00-00 00:00:00'),
(19, 'Mathematics', 1, '2023-02-19 05:33:16', '0000-00-00 00:00:00'),
(20, 'History', 1, '2023-02-19 05:33:50', '0000-00-00 00:00:00'),
(21, 'Horror', 1, '2023-02-19 05:35:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblfine`
--

CREATE TABLE `tblfine` (
  `fine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblfine`
--

INSERT INTO `tblfine` (`fine`) VALUES
(10);

-- --------------------------------------------------------

--
-- Table structure for table `tblissuedbookdetails`
--

CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `ReturnStatus` int(1) NOT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblissuedbookdetails`
--

INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `ReturnDate`, `ReturnStatus`, `fine`) VALUES
(18, 7, '3', '2023-02-02 15:47:17', '2023-02-18 06:14:12', 0, NULL),
(19, 3, '5', '2023-02-18 06:16:38', '2023-02-18 06:17:21', 1, NULL),
(20, 3, '8', '2023-02-18 14:34:54', '2023-02-19 04:59:01', 1, NULL),
(21, 8, '5', '2023-02-19 05:28:53', NULL, 0, NULL),
(22, 13, '5', '2023-02-20 06:03:59', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblrequestedbookdetails`
--

CREATE TABLE `tblrequestedbookdetails` (
  `StudentID` varchar(20) NOT NULL,
  `StudName` varchar(40) NOT NULL,
  `BookName` varchar(50) NOT NULL,
  `CategoryName` varchar(20) NOT NULL,
  `AuthorName` varchar(50) NOT NULL,
  `ISBNNumber` int(11) NOT NULL,
  `BookPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblrequestedbookdetails`
--

INSERT INTO `tblrequestedbookdetails` (`StudentID`, `StudName`, `BookName`, `CategoryName`, `AuthorName`, `ISBNNumber`, `BookPrice`) VALUES
('3', 'aaa', 'ttest book', 'Science', 'Chetan Bhagatt', 9878978, 100),
('3', 'aaa', 'Chemistry', 'Science', 'HC Verma', 1111, 15),
('8', 'test', 'ttest book', 'Science', 'Chetan Bhagatt', 9878978, 100),
('8', 'test', 'Chemistry', 'Science', 'HC Verma', 1111, 15),
('5', 'Ankita Singh', 'test', 'Science', 'HC Verma', 789, 209);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(12, '3', 'aaa', 'aaa@gmail.com', '1242354354', '202cb962ac59075b964b07152d234b70', 1, '2023-02-17 05:13:04', NULL),
(13, '4', 'Testing tikone', 'tikoneC@gmail.com', '982213139', '123', 1, '2023-02-17 16:29:03', '2023-02-17 16:37:47'),
(14, '5', 'Ankita Singh', 'ankita@gmail.com', '1123424235', '202cb962ac59075b964b07152d234b70', 1, '2023-02-18 06:15:36', NULL),
(15, '8', 'test', 'test@gmail.com', '48758467', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2023-02-18 14:33:43', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblauthors`
--
ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`StudentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblauthors`
--
ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
