-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2021 at 05:29 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `health-monitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `from_id`, `to_id`, `message`, `created`) VALUES
(1, 2, 1, 'Hello', '2020-08-10 11:47:08'),
(2, 2, 1, 'hello', '2020-08-10 11:48:52'),
(3, 1, 2, 'Hello', '2020-08-10 11:49:33'),
(4, 2, 1, 'how are you?', '2020-08-10 11:50:42'),
(5, 1, 2, 'I am fine how are you', '2020-08-10 11:50:59'),
(6, 1, 2, 'Chat is working properly?', '2020-08-10 11:51:11'),
(7, 2, 1, 'hii', '2020-08-10 21:17:47'),
(8, 1, 2, 'hiii', '2020-08-10 21:18:00'),
(9, 2, 3, 'hello', '2020-08-10 21:34:52'),
(10, 2, 1, 'hiii', '2020-08-10 21:40:31'),
(11, 1, 2, 'Hiii', '2020-08-10 22:01:58'),
(12, 2, 3, 'Hello', '2020-08-10 22:02:10'),
(13, 3, 2, 'Hello', '2020-08-10 22:02:32'),
(14, 1, 2, 'hii', '2020-08-10 22:23:43'),
(15, 1, 2, 'How are your?', '2020-08-11 23:18:05'),
(16, 2, 1, 'hiii', '2020-08-17 08:13:13'),
(17, 2, 1, 'hiii', '2020-08-17 08:17:34'),
(18, 1, 2, 'hii', '2020-08-17 08:17:41'),
(19, 4, 1, 'hey\n', '2021-11-09 23:56:43'),
(20, 6, 5, 'hey', '2021-11-09 23:58:13'),
(21, 5, 6, 'hi\n', '2021-11-09 23:58:24'),
(22, 6, 5, 'how are you patient\n', '2021-11-09 23:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `address`, `city`, `state`, `description`, `updated`) VALUES
(1, 2, 'test', 'test', 'est', 'test', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `address`, `city`, `state`, `description`, `created`, `updated`) VALUES
(1, 1, 'test', 'test', 'test', 'test', '0000-00-00 00:00:00', '2020-08-10 11:43:42');

-- --------------------------------------------------------

--
-- Table structure for table `patient_readings`
--

CREATE TABLE `patient_readings` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `blood_sugar` int(11) DEFAULT NULL,
  `blood_pressure` int(11) DEFAULT NULL,
  `heart_rate` int(11) DEFAULT NULL,
  `temprature` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_readings`
--

INSERT INTO `patient_readings` (`id`, `patient_id`, `blood_sugar`, `blood_pressure`, `heart_rate`, `temprature`, `created`, `updated`) VALUES
(1, 1, 65, 56, 78, 78, '2020-08-10 11:43:52', '2020-08-10 11:43:52'),
(3, 1, 65, 56, 67, 78, '2020-08-10 11:44:10', '2020-08-10 11:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userToken` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('Doctor','Patient') NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userToken`, `name`, `mobile`, `email`, `password`, `type`, `last_login_time`, `created`, `updated`) VALUES
(1, '8a2776e7748c129f07b379c194885690', 'patient', '1231231231', 'patient@test.com', '$2y$10$VEhimEu.o1cv5lmboOajKuxo6ntn7AbGo0rEkgLdSas3u.uhCmZhq', 'Patient', '2020-08-17 18:06:56', '2020-08-10 11:43:27', '2020-08-17 18:06:56'),
(2, '4f3bdcb8e9d3717abc450ffd2fd9bc3d', 'doctor', '1231231231', 'doctor@test.com', '$2y$10$kbJG2oKhGAbcpckFmqm1VudZOQvTQaQfqoj43HjURpz/fPg7FHtDq', 'Doctor', '2020-08-17 07:54:37', '2020-08-10 11:45:27', '2020-08-17 07:54:37'),
(3, '7ae2cdb7b24f9276b763b77eab13e2d9', 'patient2', '9876543211', 'patient2@test.com', '$2y$10$ZCOfnmYhYVvH4SpUlO88ROKZvAzMvMt9k5liKKQ0iWeyoNS3bGR.e', 'Patient', '2020-08-10 22:02:22', '2020-08-10 21:15:22', '2020-08-10 22:02:22'),
(4, 'e6f018b7e20d2bcb2dc181b690e2c4c2', 'Manju R', '09961431389', 'devblixt@gmail.com', '$2y$10$LcA.PW9DsRoPvZ5KN5UGiOw6UtsRtnFDrX6CQwhIjcJIbc5oL/bDm', 'Doctor', '2021-11-09 17:55:42', '2021-11-09 17:55:42', '2021-11-09 17:55:42'),
(5, '8d32f9acda6fcf9495c3482cd01382b6', 'patient1', '1234567890', 'asdfghjk@ghjm.fghjk', '$2y$10$Ofa7MVmKc7xvLN6Htbg0N.Z8ZLMpSnTXrqPVh2BQL3N3jOkcy3QIC', 'Patient', '2021-11-09 23:57:08', '2021-11-09 23:57:08', '2021-11-09 23:57:08'),
(6, '011604753ee3b4996d65bea6f00d1a0c', 'doctor', '1234567890', 'asdfg@fghjk.ghjk', '$2y$10$PEndmaKGmIohdwNzR6mxt.3BU084.42TPyBSSMDKV5AW6nLZnynjm', 'Doctor', '2021-11-09 23:58:02', '2021-11-09 23:58:02', '2021-11-09 23:58:02'),
(7, '562e4579bc7c630c80a9aef4e4d23ede', 'doctortest', '1234567890', 'ghjk@ghjk.ghj', '$2y$10$FHInO2Q8pYdwxDDenRd1z.h6cDAbPW8COAWI64m4VQnutgUsjrm9G', 'Doctor', '2021-11-10 09:48:34', '2021-11-10 09:48:34', '2021-11-10 09:48:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_readings`
--
ALTER TABLE `patient_readings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient_readings`
--
ALTER TABLE `patient_readings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
