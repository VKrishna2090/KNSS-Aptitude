-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2021 at 08:08 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `knss_aptitude`
--

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_code` int(11) NOT NULL,
  `exam_title` varchar(50) NOT NULL,
  `exam_instructions` varchar(200) DEFAULT NULL,
  `time_limit` time NOT NULL,
  `total_number_of_questions` int(11) NOT NULL,
  `total_marks` float NOT NULL,
  `start_date` date NOT NULL DEFAULT current_timestamp(),
  `end_date` date NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`exam_code`, `exam_title`, `exam_instructions`, `time_limit`, `total_number_of_questions`, `total_marks`, `start_date`, `end_date`, `user_id`, `subject_id`) VALUES
(730168, 'Python Lists 1', '', '00:00:24', 8, 16, '2021-03-18', '2021-04-07', 3, 101);

-- --------------------------------------------------------

--
-- Table structure for table `exams_given`
--

CREATE TABLE `exams_given` (
  `exam_code` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `marks` float NOT NULL,
  `number_of_attempts` int(11) NOT NULL,
  `date_attempted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` int(11) NOT NULL,
  `option_description` varchar(300) NOT NULL,
  `is_correct` enum('0','1') NOT NULL COMMENT '0-not correct, 1-correct',
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_description`, `is_correct`, `question_id`) VALUES
(30123, 'c) 15', '1', 323038),
(114803, 'c) 25', '0', 895314),
(121414, 'b) 4', '0', 972380),
(133985, 'd) 123', '0', 742758),
(134562, 'a) 5', '1', 972380),
(142411, 'd) random.shuffleList(list1)', '0', 898055),
(199944, 'd) 1', '1', 895314),
(305219, 'b) [‘hello’]', '0', 317826),
(313879, 'a) 1', '0', 323038),
(330084, 'b) 9', '0', 323038),
(355208, 'd) [‘olleh’]', '0', 317826),
(363595, 'b) None', '0', 507904),
(417445, 'a) [‘h’, ‘e’, ‘l’, ‘l’, ‘o’]', '1', 317826),
(438513, 'c) 25', '0', 480268),
(439737, 'b) 133', '0', 742758),
(507803, 'a) Error', '0', 507904),
(561831, 'b) shuffle(list1)', '0', 898055),
(581375, 'a) 2445', '0', 742758),
(613622, 'c) None', '0', 972380),
(626903, 'c) 25', '1', 507904),
(629667, 'a) 3', '0', 895314),
(635015, 'd) 2', '0', 507904),
(662913, 'd) [25, 14, 222, 33, 2]', '0', 480268),
(666717, 'a) [2, 33, 222, 14]', '1', 480268),
(703888, 'd) Error', '0', 323038),
(786926, 'a) list1.shuffle()', '0', 898055),
(865257, 'c) random.shuffle(list1)', '1', 898055),
(882000, 'b) 5', '0', 895314),
(902915, 'c) 12454', '1', 742758),
(915342, 'c) [‘llo’]', '0', 317826),
(928097, 'd) Error', '0', 972380),
(963418, 'b) Error', '0', 480268);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `question_description` varchar(300) NOT NULL,
  `question_type` enum('O','S') NOT NULL COMMENT 'O-objective, S-subjective',
  `marks` float NOT NULL,
  `exam_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `question_description`, `question_type`, `marks`, `exam_code`) VALUES
(317826, 'What is the output when we execute list(“hello”)?', 'O', 2, 730168),
(323038, 'Suppose list1 is [1, 5, 9], what is sum(list1)?', 'O', 2, 730168),
(480268, 'Suppose list1 is [2, 33, 222, 14, 25], What is list1[:-1]?', 'O', 2, 730168),
(507904, 'Suppose list1 is [2, 33, 222, 14, 25], What is list1[-1]?', 'O', 2, 730168),
(742758, 'Suppose list1 is [2445,133,12454,123], what is max(list1)?', 'O', 2, 730168),
(895314, 'Suppose list1 is [3, 5, 25, 1, 3], what is min(list1)?', 'O', 2, 730168),
(898055, 'To shuffle the list(say list1) what function do we use?', 'O', 2, 730168),
(972380, 'Suppose listExample is [‘h’,’e’,’l’,’l’,’o’], what is len(listExample)?', 'O', 2, 730168);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(30) NOT NULL,
  `subject_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_name`, `subject_description`) VALUES
(101, 'Python', 'Learn Python'),
(102, 'Java', 'Learn Java');

-- --------------------------------------------------------

--
-- Table structure for table `subjective_solution`
--

CREATE TABLE `subjective_solution` (
  `solution_id` int(11) NOT NULL,
  `answer` varchar(10000) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `mobile_number` bigint(20) DEFAULT NULL,
  `role_id` enum('0','1') NOT NULL COMMENT '0-Staff, 1-Student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `fname`, `lname`, `mobile_number`, `role_id`) VALUES
(1, '2019krishna.v@ves.ac.in', 'password', 'Krishnasubramaniam', 'V', NULL, '1'),
(3, 'vkrishna2090@gmail.com', 'password', 'Krishna ', 'V', NULL, '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_code`),
  ADD KEY `created_by_user_id` (`user_id`),
  ADD KEY `subject` (`subject_id`);

--
-- Indexes for table `exams_given`
--
ALTER TABLE `exams_given`
  ADD PRIMARY KEY (`exam_code`,`user_id`),
  ADD KEY `student who gave the exam` (`user_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `it belongs to the question` (`question_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `it belongs to this exam` (`exam_code`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `subjective_solution`
--
ALTER TABLE `subjective_solution`
  ADD PRIMARY KEY (`solution_id`),
  ADD KEY `subjective question's solution` (`question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `created_by_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`);

--
-- Constraints for table `exams_given`
--
ALTER TABLE `exams_given`
  ADD CONSTRAINT `exam` FOREIGN KEY (`exam_code`) REFERENCES `exam` (`exam_code`),
  ADD CONSTRAINT `student who gave the exam` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `it belongs to the question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `it belongs to this exam` FOREIGN KEY (`exam_code`) REFERENCES `exam` (`exam_code`);

--
-- Constraints for table `subjective_solution`
--
ALTER TABLE `subjective_solution`
  ADD CONSTRAINT `subjective question's solution` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
