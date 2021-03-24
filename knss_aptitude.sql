-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2021 at 06:39 AM
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
(29532, 'Reference Models', 'Attempt all questions. 2 marks each.', '00:18:00', 9, 18, '2021-03-23', '2021-04-12', 3, 354570),
(435886, 'Python Lists 1', '', '00:16:00', 8, 16, '2021-03-23', '2021-04-12', 3, 101),
(559097, 'Queue Data Structure', '', '00:20:00', 10, 20, '2021-03-23', '2021-04-12', 3, 102);

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

--
-- Dumping data for table `exams_given`
--

INSERT INTO `exams_given` (`exam_code`, `user_id`, `marks`, `number_of_attempts`, `date_attempted`) VALUES
(29532, 1, 18, 1, '2021-03-24');

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
(4517, 'c) Front and read pointers point to the first element', '1', 579846),
(21691, 'b) Data encryption', '0', 120784),
(32938, 'b) 9', '0', 966985),
(36507, 'c) [‘llo’]', '0', 41135),
(39252, 'd) add and remove', '0', 329854),
(40683, 'a) 3', '0', 38905),
(48724, 'a) [2, 33, 222, 14]', '1', 281450),
(89235, 'd) Tree', '0', 348037),
(90102, 'a) 5', '1', 880655),
(103084, 'c) dequeue() removes and returns the next item in line while peek() returns the next item in line', '1', 575875),
(108477, 'b) 7', '1', 350750),
(109899, 'b) Session layer', '1', 284799),
(114641, 'd) Randomized', '0', 189944),
(117535, 'a) Application layer', '0', 284799),
(127328, 'a) Application layer', '0', 368558),
(128248, 'b) 5', '0', 38905),
(130903, 'b) Queue', '1', 348037),
(133497, 'b) enqueue and dequeue', '1', 329854),
(139937, 'c) At the centre of list', '0', 502322),
(142337, 'd) Link layer', '0', 284799),
(142981, 'a) Data compression', '0', 120784),
(154720, 'c) 6', '0', 350750),
(165609, 'b) NIC', '0', 690226),
(174005, 'd) Error', '0', 966985),
(184075, 'b) [‘hello’]', '0', 41135),
(199065, 'a) Front pointer points to first element; rear pointer points to the last element', '0', 579846),
(243570, 'a) True', '1', 358767),
(269586, 'a) Application layer', '1', 164844),
(276071, 'd) Front pointer points to the first element; rear pointer points to null object', '0', 579846),
(284361, 'a) 2445', '0', 86132),
(284539, 'c) Transport layer', '0', 284799),
(305181, 'a) dequeue() and peek() remove and return the next time in line', '0', 575875),
(305186, 'c) random.shuffle(list1)', '1', 422586),
(329367, 'b) Error', '0', 281450),
(333114, 'c) 25', '0', 281450),
(336467, 'c) 25', '0', 38905),
(357900, 'c) enqueue and peek', '0', 329854),
(361441, 'c) Stack and Queue is FIFO', '0', 413192),
(371504, 'a) End system', '1', 100639),
(381263, 'b) 133', '0', 86132),
(394870, 'a) Stack', '0', 348037),
(396873, 'a) push and pop', '0', 329854),
(418623, 'd) peek() removes and returns the next item in line while dequeue() returns the next item in line', '0', 575875),
(420401, 'd) 10', '0', 606065),
(435616, 'c) TransferQueue', '0', 829713),
(437353, 'a) 1', '0', 966985),
(439003, 'a) 5', '0', 350750),
(451439, 'b) dequeue() and peek() return the next item in line', '0', 575875),
(455301, 'd) [‘olleh’]', '0', 41135),
(476203, 'c) 15', '1', 966985),
(492463, 'd) 2', '0', 110284),
(506027, 'b) Removed', '1', 189944),
(506972, 'd) 10', '0', 350750),
(521969, 'd) 123', '0', 86132),
(522432, 'd) [25, 14, 222, 33, 2]', '0', 281450),
(545689, 'b) shuffle(list1)', '0', 422586),
(561619, 'a) Added', '0', 189944),
(562456, 'a) [‘h’, ‘e’, ‘l’, ‘l’, ‘o’]', '1', 41135),
(567072, 'b) 7', '0', 606065),
(568391, 'c) 6', '0', 606065),
(575733, 'b) BigDecimal.MAX_VALUE', '0', 619159),
(582427, 'b) Tail of list', '1', 502322),
(597068, 'd) 1', '1', 38905),
(601910, 'a) Integer.MAX_VALUE', '1', 619159),
(638968, 'd) Packet transport', '0', 690226),
(642838, 'b) Queue is LIFO; Stack is FIFO', '0', 413192),
(653890, 'a) Head of list', '0', 502322),
(657642, 'b) rear=(rear+1)%MAX_SIZE', '1', 345952),
(664842, 'd) Session layer', '1', 368558),
(675961, 'a) rear=(rear%1)+MAX_SIZE', '0', 345952),
(679520, 'a) End system', '1', 690226),
(700224, 'c) 25', '1', 110284),
(721192, 'd) Session layer', '0', 164844),
(731450, 'c) 99999999', '0', 619159),
(733072, 'c) Link layer', '0', 368558),
(736491, 'd) BlockingQueue', '0', 829713),
(743299, 'c) Ethernet', '0', 100639),
(754504, 'd) rear=rear%(MAX_SIZE+1)', '0', 345952),
(755673, 'd) Stack and Queue is LIFO', '0', 413192),
(760015, 'b) False', '0', 358767),
(784358, 'c) Link layer', '0', 164844),
(786245, 'd) All of the mentioned', '1', 120784),
(793737, 'c) rear=rear+(1%MAX_SIZE)', '0', 345952),
(819414, 'd) random.shuffleList(list1)', '0', 422586),
(822678, 'a) list1.shuffle()', '0', 422586),
(825645, 'b) Transport layer', '0', 368558),
(834853, 'a) Error', '0', 110284),
(852093, 'c) Rearranged', '0', 189944),
(858341, 'b) Rear pointer points to first element; front pointer points to the last element', '0', 579846),
(868053, 'c) None', '0', 880655),
(881592, 'd) Signal transmission', '0', 100639),
(881771, 'a) Stack is LIFO; Queue is FIFO', '1', 413192),
(885866, 'd) Integer.INFINITY', '0', 619159),
(890550, 'a) BlockingQueue', '0', 829713),
(901018, 'd) Error', '0', 880655),
(903462, 'c) 12454', '1', 86132),
(906844, 'a) 5', '1', 606065),
(922024, 'c) Array', '0', 348037),
(929328, 'd) All the old entries are pushed and then the new element is inserted', '0', 502322),
(936745, 'b) Transport layer', '0', 164844),
(941248, 'b) NIC', '0', 100639),
(955896, 'c) Ethernet', '0', 690226),
(962472, 'c) Data description', '0', 120784),
(972442, 'b) None', '0', 110284),
(976406, 'b) 4', '0', 880655),
(991216, 'b) BlockingEnque', '1', 829713);

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
(38905, 'Suppose list1 is [3, 5, 25, 1, 3], what is min(list1)?', 'O', 2, 435886),
(41135, 'What is the output when we execute list(“hello”)?', 'O', 2, 435886),
(86132, 'Suppose list1 is [2445,133,12454,123], what is max(list1)?', 'O', 2, 435886),
(100639, 'Transport layer is implemented in ______________', 'O', 2, 29532),
(110284, 'Suppose list1 is [2, 33, 222, 14, 25], What is list1[-1]?', 'O', 2, 435886),
(120784, 'The functionalities of the presentation layer include ____________', 'O', 2, 29532),
(164844, 'In TCP IP Model, when data is sent from device A to device B, the 5th layer to receive data at B is ____________', 'O', 2, 29532),
(189944, 'In the OSI model, as a data packet moves from the lower to the upper layers, headers are _______', 'O', 2, 29532),
(281450, 'Suppose list1 is [2, 33, 222, 14, 25], What is list1[:-1]?', 'O', 2, 435886),
(284799, 'Delimiting and synchronization of data exchange is provided by __________', 'O', 2, 29532),
(329854, 'What is the correct method used to insert and delete items from the queue?', 'O', 2, 559097),
(345952, 'If the size of the array used to implement a circular queue is MAX_SIZE. How rear moves to traverse inorder to insert an element in the queue?', 'O', 2, 559097),
(348037, 'Which data structure is used in Breadth First Traversal of a graph?', 'O', 2, 559097),
(350750, 'The number of layers in ISO OSI reference model is __________', 'O', 2, 29532),
(358767, 'PriorityQueue is thread safe.', 'O', 2, 559097),
(368558, 'In OSI model, when data is sent from device A to device B, the 5th layer to receive data at B is _________', 'O', 2, 29532),
(413192, 'What is the difference between Queue and Stack?', 'O', 2, 559097),
(422586, 'To shuffle the list(say list1) what function do we use?', 'O', 2, 435886),
(502322, 'Where does a new element be inserted in linked list implementation of a queue?', 'O', 2, 559097),
(575875, 'What is difference between dequeue() and peek() function of java?', 'O', 2, 559097),
(579846, 'What are the use of front and rear pointers in CircularQueue implementation?', 'O', 2, 559097),
(606065, 'How many layers are present in the Internet protocol stack (TCP/IP model)?', 'O', 2, 29532),
(619159, 'What is the remaining capacity of BlockingQueue whose intrinsic capacity is not defined?', 'O', 2, 559097),
(690226, 'Application layer is implemented in ____________', 'O', 2, 29532),
(829713, 'Which of the below is not a subinterface of Queue?', 'O', 2, 559097),
(880655, 'Suppose listExample is [‘h’,’e’,’l’,’l’,’o’], what is len(listExample)?', 'O', 2, 435886),
(966985, 'Suppose list1 is [1, 5, 9], what is sum(list1)?', 'O', 2, 435886);

-- --------------------------------------------------------

--
-- Table structure for table `selected_options`
--

CREATE TABLE `selected_options` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `selected_options`
--

INSERT INTO `selected_options` (`id`, `user_id`, `option_id`) VALUES
(74815, 1, 906844),
(89748, 1, 664842),
(151288, 1, 269586),
(182322, 1, 109899),
(292853, 1, 108477),
(368317, 1, 786245),
(531221, 1, 506027),
(627885, 1, 371504),
(855016, 1, 679520);

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
(102, 'Java', 'Learn Java'),
(354570, 'Computer Networks', 'Learn computer networking');

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
-- Indexes for table `selected_options`
--
ALTER TABLE `selected_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id chose` (`user_id`),
  ADD KEY `option chosen` (`option_id`);

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
-- Constraints for table `selected_options`
--
ALTER TABLE `selected_options`
  ADD CONSTRAINT `option chosen` FOREIGN KEY (`option_id`) REFERENCES `options` (`option_id`),
  ADD CONSTRAINT `user_id chose` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `subjective_solution`
--
ALTER TABLE `subjective_solution`
  ADD CONSTRAINT `subjective question's solution` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
