-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 01, 2025 at 05:19 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment`
--

-- --------------------------------------------------------

--
-- Table structure for table `Assignments`
--

CREATE TABLE `Assignments` (
  `s.no` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL,
  `assignment_id` varchar(10) NOT NULL DEFAULT '""',
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` text NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Assignments`
--

INSERT INTO `Assignments` (`s.no`, `classroom_id`, `assignment_id`, `id`, `title`, `file`, `description`, `due_date`) VALUES
(1, 3, '2', 2, 'maths-assignment', '', 'solve all problems', '2025-02-27 05:44:24'),
(3, 3, '2', 2, 'maths-assignment', '', 'solve all problems', '2025-02-27 05:44:33'),
(4, 3, '2', 2, 'maths-assignment', '', 'solve all problems', '2025-02-27 05:44:38'),
(5, 3, '2', 2, 'physics', '', 'solve all problems', '2025-02-27 05:44:42'),
(6, 3, '2', 2, 'physics', '', 'solve all problems', '2025-02-27 05:44:47'),
(7, 3, '2', 2, 'physics', '', 'solve all problems', '2025-02-27 05:44:50'),
(8, 3, '2', 2, 'physics', '', 'solve all problems', '2025-02-27 05:44:55'),
(9, 3, '2', 2, 'physics', '', 'solve all problems', '2025-02-27 05:45:24'),
(10, 3, '2', 2, 'physics', 'uploads/3/67aaf14cbf03b.pdf', 'solve all problems', '2025-02-27 05:45:15'),
(11, 3, '2', 2, 'physics', 'uploads/3/67b5791193375.pdf', 'solve all problems', '2025-02-27 05:45:18'),
(12, 3, '2', 2, 'algorithms', 'uploads/3/67b6b9a34ea6c.pdf', 'solve all problems', '2025-02-27 05:45:02'),
(13, 3, '2', 2, 'algorithms', 'uploads/3/67b83f459e1ae.pdf', 'solve all problems', '2025-02-27 05:45:06'),
(15, 3, '2', 2, 'test', 'uploads/3/67bfd4d3a0141.pdf', 'these is a test', '2025-02-27 05:45:11'),
(16, 3, '3', 2, 'test', 'uploads/3/3.pdf', 'these is a test', '2025-02-15 18:30:00'),
(17, 3, '3', 2, 'test', 'uploads/3/3.pdf', 'these is a test', '2025-02-15 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `Classrooms`
--

CREATE TABLE `Classrooms` (
  `s_no` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `class_name` varchar(255) NOT NULL,
  `class_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Classrooms`
--

INSERT INTO `Classrooms` (`s_no`, `id`, `classroom_id`, `class_name`, `class_code`) VALUES
(3, 2, 2, 'physics', '1111'),
(4, 1, 3, 'asdfg', '123456'),
(5, 1, 6, 'abcd', '098765'),
(6, 2, 7, 'dinesh', '123789'),
(7, 1, 5, 'zxcvbnm', 'ABCD'),
(8, 1, 1, 'zxcvbnm', 'MF'),
(9, 2, 22, 'zxcvbnm', 'MF89'),
(11, 2, 99, 'MK', '123456789'),
(12, 2, 88, 'M', '1'),
(13, 2, 885, 'My', '15'),
(14, 2, 8856, 'My5', '157');

-- --------------------------------------------------------

--
-- Table structure for table `Enrollments`
--

CREATE TABLE `Enrollments` (
  `s_no` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Enrollments`
--

INSERT INTO `Enrollments` (`s_no`, `id`, `classroom_id`, `joined_at`) VALUES
(1, 3, 3, '2025-02-05 18:30:00'),
(2, 4, 3, '2025-02-06 18:30:00'),
(3, 5, 1, '2025-02-06 18:30:00'),
(4, 7, 3, '2025-02-06 18:30:00'),
(5, 6, 3, '2025-02-06 18:30:00'),
(6, 11, 3, '2025-02-06 18:30:00'),
(7, 11, 2, '2025-02-17 18:30:00'),
(8, 8, 3, '2025-02-17 18:30:00'),
(9, 10, 0, '2025-02-23 18:30:00'),
(46, 10, 6, '2025-02-24 18:30:00'),
(53, 10, 2, '2025-02-24 18:30:00'),
(54, 11, 22, '2025-02-24 18:30:00'),
(55, 14, 2, '2025-02-24 18:30:00'),
(56, 16, 22, '2025-02-25 09:38:09'),
(57, 16, 6, '2025-02-26 05:24:16'),
(58, 18, 3, '2025-02-26 05:29:25'),
(59, 13, 1, '2025-02-26 05:33:20'),
(60, 15, 2, '2025-02-26 05:38:20'),
(61, 16, 1, '2025-02-26 05:42:02'),
(62, 16, 2, '2025-02-26 05:48:46'),
(63, 8, 7, '2025-02-26 06:33:11'),
(64, 8, 2, '2025-02-26 06:35:47'),
(65, 7, 7, '2025-02-26 09:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `Submissions`
--

CREATE TABLE `Submissions` (
  `s.no` int(11) NOT NULL,
  `classroom_id` varchar(255) NOT NULL,
  `assignment_id` varchar(20) NOT NULL DEFAULT '"''',
  `id` int(20) NOT NULL DEFAULT 0,
  `file_url` text NOT NULL DEFAULT '""',
  `marks` int(11) DEFAULT 0,
  `submitted_at` text NOT NULL DEFAULT '""'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Submissions`
--

INSERT INTO `Submissions` (`s.no`, `classroom_id`, `assignment_id`, `id`, `file_url`, `marks`, `submitted_at`) VALUES
(6, '3', '2', 16, 'uploads/67aaf29067161_1739256464_sample_test.pdf', 75, '2025-02-11 12:17:44'),
(7, '3', '2', 4, 'uploads/67ad66cc9922a_1739417292_sample_test.pdf', 80, '2025-02-13 08:58:12'),
(8, '3', '2', 11, 'uploads/submissions/67b57d5d4dc54_1739947357.pdf', 100, '2025-02-19 12:12:37'),
(12, '3', '2', 11, 'uploads/submissions/67c00c7331bf3_1740639347.pdf', NULL, '2025-02-27 12:25:47'),
(13, '3', '2', 11, 'uploads/submissions/67c2847ae71b6_1740801146.pdf', NULL, '2025-03-01 09:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `role` enum('teacher','student') NOT NULL,
  `profile_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `name`, `phone`, `email`, `password`, `role`, `profile_image`) VALUES
(1, 'John Doe', '9876543210', 'john.doe@example.com', '123456789', 'teacher', 'uploads/profile_1_1740465719.png'),
(2, 'hari', '1234567890', 'hari6@gmail.com', '12345', 'teacher', 'https://yourdomain.com/uploads/profile_2_1740465551.png'),
(3, 'Alice Johnson', '7654321098', 'alice.johnson@example.com', '123456', 'student', 'https://yourdomain.com/uploads/profile_3_1740465563.png'),
(4, 'Bob Williams', '6543210987', 'bob.williams@example.com', '123456', 'student', ''),
(5, 'Charlie Brown', '5432109876', 'charlie.brown@example.com', '123456', 'student', ''),
(6, 'David Wilson', '4321098765', 'david.wilson@example.com', '123456', 'student', ''),
(7, 'Emma Davis', '3210987654', 'emma.davis@example.com', '123456', 'student', ''),
(8, 'Frank Miller', '2109876543', 'frank.miller@example.com', '123456', 'student', ''),
(9, 'Grace Lee', '1098765432', 'grace.lee@example.com', '123456', 'student', ''),
(10, 'Henry Clark', '9988776655', 'henry.clark@example.com', '123456', 'student', ''),
(11, 'user', '2357569513', 'user@gmail.com', '123456', 'student', 'uploads/profile_11_1740465712.png'),
(12, 'hari', '2357569513', 'hari@gmail.com', '12345', 'student', ''),
(13, 'hari', '2357569513', 'hari2@gmail.com', '12', 'student', ''),
(14, 'hari', '2357569513', 'hari23@gmail.com', '12345', 'student', ''),
(15, 'Elamaran', '8974561230', 'ela@123.com', '123', 'teacher', ''),
(16, 'dinesh', '9491984039', 'dinesh@gmail.com', '179750', 'student', ''),
(17, 'hems the', '9705273767', 'hemanth@gmail.com', '1797', 'student', ''),
(18, 'harish', '123987654', 'harish@gmail.com', '000', 'student', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assignments`
--
ALTER TABLE `Assignments`
  ADD PRIMARY KEY (`s.no`);

--
-- Indexes for table `Classrooms`
--
ALTER TABLE `Classrooms`
  ADD PRIMARY KEY (`s_no`),
  ADD UNIQUE KEY `unique_class_code` (`class_code`),
  ADD UNIQUE KEY `unique_classroom_id` (`classroom_id`);

--
-- Indexes for table `Enrollments`
--
ALTER TABLE `Enrollments`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `Submissions`
--
ALTER TABLE `Submissions`
  ADD PRIMARY KEY (`s.no`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Assignments`
--
ALTER TABLE `Assignments`
  MODIFY `s.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Classrooms`
--
ALTER TABLE `Classrooms`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Enrollments`
--
ALTER TABLE `Enrollments`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `Submissions`
--
ALTER TABLE `Submissions`
  MODIFY `s.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assignments`
--
ALTER TABLE `Assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `Classrooms` (`s_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Classrooms`
--
ALTER TABLE `Classrooms`
  ADD CONSTRAINT `classrooms_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Enrollments`
--
ALTER TABLE `Enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
