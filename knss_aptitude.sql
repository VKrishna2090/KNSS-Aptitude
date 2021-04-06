-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 05:54 AM
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
(220512, 'Data Link Layer', 'Attempt all questions.', '00:30:00', 2, 20, '2021-04-05', '2021-04-10', 3, 354570),
(735864, 'Basics of Java', 'Attempt all questions.', '00:10:00', 5, 10, '2021-04-01', '2021-04-03', 3, 102),
(830290, 'Network Layer', '', '00:20:00', 10, 20, '2021-04-05', '2021-04-25', 3, 354570),
(944393, 'Java Data Types', 'Attempt all questions', '00:10:00', 5, 10, '2021-04-01', '2021-04-08', 3, 102),
(951153, 'Lists 1', '', '00:16:00', 8, 16, '2021-04-05', '2021-04-25', 3, 101);

-- --------------------------------------------------------

--
-- Table structure for table `exams_given`
--

CREATE TABLE `exams_given` (
  `exam_code` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `marks` float NOT NULL,
  `number_of_attempts` int(11) NOT NULL,
  `date_attempted` date NOT NULL,
  `is_checked` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exams_given`
--

INSERT INTO `exams_given` (`exam_code`, `user_id`, `marks`, `number_of_attempts`, `date_attempted`, `is_checked`) VALUES
(29532, 1, 14, 1, '2021-03-24', 1),
(220512, 1, 19, 1, '2021-04-05', 1);

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
(4858, '16 and 32 bits', '0', 63198),
(4921, 'Active open', '0', 303765),
(18657, 'Bytecode is executed by JVM', '1', 116507),
(19147, '5', '1', 759722),
(19720, 'Only b', '1', 451234),
(21691, 'b) Data encryption', '0', 120784),
(22631, 'Flow control', '1', 248061),
(25377, 'Congestion control', '0', 248061),
(38113, 'empty output', '0', 450480),
(40824, '1', '0', 534052),
(57262, '25', '0', 609450),
(72333, 'compiler error', '1', 450480),
(79281, 'Synchronization', '0', 240841),
(83865, '[‘h’, ‘e’, ‘l’, ‘l’, ‘o’]', '1', 951343),
(85579, 'SYNC flooding attack', '0', 522053),
(91970, 'Simultaneous open', '1', 472815),
(98619, 'Flow control', '0', 240841),
(108477, 'b) 7', '1', 350750),
(109061, 'shuffle(list1)', '0', 597274),
(109899, 'b) Session layer', '1', 284799),
(110379, 'Error control', '0', 248061),
(114641, 'd) Randomized', '0', 189944),
(117535, 'a) Application layer', '0', 284799),
(127328, 'a) Application layer', '0', 368558),
(130828, 'JDB', '1', 306072),
(134237, 'Passive attack', '0', 522053),
(136964, 'void', '0', 400765),
(138469, 'Error', '0', 746152),
(140728, '12454', '1', 421285),
(142337, 'd) Link layer', '0', 284799),
(142981, 'a) Data compression', '0', 120784),
(154720, 'c) 6', '0', 350750),
(159231, 'JRE', '0', 306072),
(165609, 'b) NIC', '0', 690226),
(188946, 'Both Sequence & Acknowledgment number', '0', 885871),
(189322, 'Acknowledgment number', '1', 885871),
(210450, 'int', '0', 488964),
(224802, 'Use of exception handling', '0', 116507),
(232156, 'Passive open', '0', 141490),
(242023, 'Sequence number', '0', 885871),
(261250, '2445', '0', 421285),
(264331, 'None', '0', 759722),
(266658, 'random.shuffleList(list1)', '0', 597274),
(269586, 'a) Application layer', '1', 164844),
(280672, 'Active close', '0', 303765),
(284539, 'c) Transport layer', '0', 284799),
(286436, '8', '0', 700707),
(289928, '16 and 32 bytes', '0', 63198),
(292268, 'Error', '0', 759722),
(299796, 'long', '0', 488964),
(304858, 'Mutual open', '0', 472815),
(313247, '[‘llo’]', '0', 951343),
(314605, '[25, 14, 222, 33, 2]', '0', 609450),
(321330, 'Passive attack', '0', 342795),
(325028, '16-bits and 32-bits', '0', 719861),
(337319, 'runtime error', '0', 987254),
(338632, '16-bits and 16-bits', '1', 719861),
(362355, '25', '0', 666257),
(362874, 'Hexadecimal', '0', 463942),
(371504, 'a) End system', '1', 100639),
(375186, 'JVM', '0', 306072),
(420401, 'd) 10', '0', 606065),
(421421, 'Error', '0', 534052),
(428411, '8.0', '0', 700707),
(428709, '2', '0', 746152),
(433198, 'Architecture Neutral', '0', 746651),
(433710, 'Denial-of-service attack', '1', 522053),
(437844, 'list1.shuffle()', '0', 597274),
(439003, 'a) 5', '0', 350750),
(455151, '[‘olleh’]', '0', 951343),
(459612, '32-bits and 32-bits', '0', 719861),
(482648, 'None', '0', 746152),
(484460, '8.8', '0', 700707),
(484567, 'Unicode escape sequence', '1', 463942),
(486733, '1', '1', 666257),
(496995, 'compiler error', '1', 987254),
(502018, 'Dynamic binding between objects', '0', 116507),
(504150, 'Object-oriented', '0', 746651),
(505900, 'Error detection', '0', 248061),
(506027, 'b) Removed', '1', 189944),
(506972, 'd) 10', '0', 350750),
(515259, 'Passive open', '1', 303765),
(516843, 'Error', '0', 609450),
(524095, 'Octal escape', '0', 463942),
(539630, 'JDK', '0', 306072),
(541845, 'Checksum', '0', 885871),
(554248, '25', '1', 746152),
(561619, 'a) Added', '0', 189944),
(564877, '3', '0', 666257),
(567072, 'b) 7', '0', 606065),
(568391, 'c) 6', '0', 606065),
(574940, 'Passive close', '0', 141490),
(576887, 'long', '0', 400765),
(581499, 'Mutual Close', '0', 472815),
(581711, 'garbage value', '0', 987254),
(590314, 'The applet makes the Java code secure and portable', '0', 116507),
(597911, 'Only a', '0', 451234),
(600292, 'Hello', '0', 450480),
(619705, 'Passive close', '0', 303765),
(627412, '20 and 60 bytes', '1', 63198),
(638968, 'd) Packet transport', '0', 690226),
(648123, 'random.shuffle(list1)', '1', 597274),
(660586, 'Active attack', '0', 522053),
(664842, 'd) Session layer', '1', 368558),
(670544, '0', '0', 987254),
(672392, 'Three-Way Handshaking', '1', 240841),
(677572, 'Active close', '0', 141490),
(679520, 'a) End system', '1', 690226),
(695791, 'Object', '0', 400765),
(717998, '[‘hello’]', '0', 951343),
(721192, 'd) Session layer', '0', 164844),
(733072, 'c) Link layer', '0', 368558),
(734780, 'Use of pointers', '1', 746651),
(735425, 'double', '1', 488964),
(740571, 'Dynamic', '0', 746651),
(743299, 'c) Ethernet', '0', 100639),
(744923, '15', '1', 534052),
(778877, 'Denial-of-service attack', '0', 342795),
(784358, 'c) Link layer', '0', 164844),
(786245, 'd) All of the mentioned', '1', 120784),
(805622, 'float', '0', 488964),
(811493, 'Active attack', '0', 342795),
(813637, 'int', '1', 400765),
(825645, 'b) Transport layer', '0', 368558),
(840455, 'runtime error', '0', 450480),
(847705, '9', '0', 534052),
(849599, '8.800000095367432', '1', 700707),
(852093, 'c) Rearranged', '0', 189944),
(855117, '[2, 33, 222, 14]', '1', 609450),
(881592, 'd) Signal transmission', '0', 100639),
(887668, '123', '0', 421285),
(903267, 'SYNC flooding attack', '1', 342795),
(904275, '5', '0', 666257),
(906844, 'a) 5', '1', 606065),
(906882, 'Simultaneous close', '0', 472815),
(908419, '133', '0', 421285),
(919573, 'Line feed', '0', 463942),
(927320, 'Both a and b', '0', 451234),
(929450, '4', '0', 759722),
(931107, 'Forwarding', '0', 240841),
(932733, '32-bits and 16-bits', '0', 719861),
(936745, 'b) Transport layer', '0', 164844),
(941248, 'b) NIC', '0', 100639),
(955896, 'c) Ethernet', '0', 690226),
(961134, 'Neither a nor b', '0', 451234),
(962472, 'c) Data description', '0', 120784),
(976313, 'Active open', '1', 141490),
(991889, '20 and 60 bits', '0', 63198);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `question_description` text NOT NULL,
  `question_type` enum('O','S') NOT NULL COMMENT 'O-objective, S-subjective',
  `marks` float NOT NULL,
  `exam_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `question_description`, `question_type`, `marks`, `exam_code`) VALUES
(63198, '<b>Size of TCP segment header ranges between ___________</b>', 'O', 2, 830290),
(100639, 'Transport layer is implemented in ______________', 'O', 2, 29532),
(116507, 'Which of the following option leads to the portability and security of Java?', 'O', 2, 735864),
(120784, 'The functionalities of the presentation layer include ____________', 'O', 2, 29532),
(141490, '<b>A client that wishes to connect to an open server tells its TCP that it needs to be connected to that particular server. The process is called ___________</b>', 'O', 2, 830290),
(164844, 'In TCP IP Model, when data is sent from device A to device B, the 5th layer to receive data at B is ____________', 'O', 2, 29532),
(189944, 'In the OSI model, as a data packet moves from the lower to the upper layers, headers are _______', 'O', 2, 29532),
(240841, '<b>Connection establishment in TCP is done by which mechanism?</b>', 'O', 2, 830290),
(248061, '<b>The receiver of the data controls the amount of data that are to be sent by the sender is referred to as ___________</b>', 'O', 2, 830290),
(284799, 'Delimiting and synchronization of data exchange is provided by __________', 'O', 2, 29532),
(303765, '<b>The server program tells its TCP that it is ready to accept a connection. This process is called ___________</b>', 'O', 2, 830290),
(306072, '_____ is used to find and fix bugs in the Java programs.', 'O', 2, 735864),
(342795, '<b>A malicious attacker sends a large number of SYNC segments to a server, pretending that each of them is coming from a different client by faking the source IP address in the datagram. Which type of attack is being performed in this situation?</b>', 'O', 2, 830290),
(350750, 'The number of layers in ISO OSI reference model is __________', 'O', 2, 29532),
(354533, '<p><strong>Enumerate the main responsibilities of the data link layer.</strong></p>\r\n', 'S', 10, 220512),
(361910, '<p><strong>Explain Hamming Code with examples.</strong></p>\r\n', 'S', 10, 220512),
(368558, 'In OSI model, when data is sent from device A to device B, the 5th layer to receive data at B is _________', 'O', 2, 29532),
(400765, 'What is the return type of the hashCode() method in the Object class?', 'O', 2, 735864),
(421285, '<b>Suppose list1 is [2445,133,12454,123], what is max(list1)?</b>', 'O', 2, 951153),
(450480, '<p><strong>Predict the output of the following Java program:</strong></p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p><code>class</code> <code>Test { </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>public</code> <code>static</code> <code>void</code> <code>main(String[] args) { </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>for</code><code>(</code><code>int</code> <code>i = 0; 0; i++) </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{ </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>System.out.println(</code><code>&quot;Hello&quot;</code><code>); </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>break</code><code>; </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>} </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>} </code></p>\r\n\r\n			<p><code>} </code></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'O', 2, 944393),
(451234, '<p><strong>Which of the following statements is/are TRUE regarding Java? </strong></p>\r\n\r\n<p>a. Constants that cannot be changed are declared using the &lsquo;static&rsquo; keyword.</p>\r\n\r\n<p>b. A class can only inherit one class but can implement multiple interfaces.</p>\r\n', 'O', 2, 944393),
(463942, 'The \\u0021 article referred to as a', 'O', 2, 735864),
(472815, '<b>In Three-Way Handshaking process, the situation where both the TCP’s issue an active open is ___________</b>', 'O', 2, 830290),
(488964, '<p><strong>Which data type value is returned by all transcendental math functions?</strong></p>\r\n', 'O', 2, 944393),
(522053, '<b>SYNC flooding attack belongs to a type of security attack known as ___________</b>', 'O', 2, 830290),
(534052, '<b>Suppose list1 is [1, 5, 9], what is sum(list1)?</b>', 'O', 2, 951153),
(597274, '<b>To shuffle the list(say list1) what function do we use?</b>', 'O', 2, 951153),
(606065, 'How many layers are present in the Internet protocol stack (TCP/IP model)?', 'O', 2, 29532),
(609450, '<b>Suppose list1 is [2, 33, 222, 14, 25], What is list1[:-1]?</b>', 'O', 2, 951153),
(666257, '<b>Suppose list1 is [3, 5, 25, 1, 3], what is min(list1)?</b>', 'O', 2, 951153),
(690226, 'Application layer is implemented in ____________', 'O', 2, 29532),
(700707, '<p><strong>Predict the output of the following program.</strong></p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p><code>class</code> <code>Test</code></p>\r\n\r\n			<p><code>{</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>public</code> <code>static</code> <code>void</code> <code>main(String[] args)</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Double object = </code><code>new</code> <code>Double(</code><code>&quot;2.4&quot;</code><code>);</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>int</code> <code>a = object.intValue();</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>byte</code> <code>b = object.byteValue();</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>float</code> <code>d = object.floatValue();</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>double</code> <code>c = object.doubleValue();</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>System.out.println(a + b + c + d );</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p>\r\n\r\n			<p><code>}</code></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'O', 2, 944393),
(719861, '<b>The sizes of source and destination port address in TCP header are ___________ respectively.</b>', 'O', 2, 830290),
(746152, '<b>Suppose list1 is [2, 33, 222, 14, 25], What is list1[-1]?</b>', 'O', 2, 951153),
(746651, 'Which of the following is not a Java features?', 'O', 2, 735864),
(759722, '<b>Suppose listExample is [‘h’,’e’,’l’,’l’,’o’], what is len(listExample)?</b>', 'O', 2, 951153),
(885871, '<b>What allows TCP to detect lost segments and in turn recover from that loss?</b>', 'O', 2, 830290),
(951343, '<b>What is the output when we execute list(“hello”)?</b>', 'O', 2, 951153),
(987254, '<p><strong>What is the output of:</strong></p>\r\n\r\n<p><code>class</code> <code>Main { &nbsp;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;</code><code>public</code> <code>static</code> <code>void</code> <code>main(String args[]) { &nbsp; &nbsp; &nbsp;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>int</code> <code>t; &nbsp; &nbsp; &nbsp;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>System.out.println(t); </code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>} &nbsp; </code></p>\r\n\r\n<p><code>}</code></p>\r\n', 'O', 2, 944393);

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
(186587, 1, 664842),
(210588, 1, 906844),
(249454, 1, 561619),
(261272, 1, 786245),
(398833, 1, 721192),
(552065, 1, 371504),
(605224, 1, 679520),
(796522, 1, 109899),
(902430, 1, 108477);

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

--
-- Dumping data for table `subjective_solution`
--

INSERT INTO `subjective_solution` (`solution_id`, `answer`, `question_id`) VALUES
(636284, '1617643180_Data_link_layer.pdf', 354533),
(816478, '1617643202_Hamming_Code.pdf', 361910);

-- --------------------------------------------------------

--
-- Table structure for table `subjective_student_solution`
--

CREATE TABLE `subjective_student_solution` (
  `solution_id` int(11) NOT NULL,
  `answer` varchar(10000) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjective_student_solution`
--

INSERT INTO `subjective_student_solution` (`solution_id`, `answer`, `question_id`, `user_id`) VALUES
(108325, '1617644131_Data_link_layer.pdf', 354533, 1),
(434330, '1617644131_Hamming_Code.pdf', 361910, 1);

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
  ADD KEY `it belongs to this exam1` (`exam_code`);

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
-- Indexes for table `subjective_student_solution`
--
ALTER TABLE `subjective_student_solution`
  ADD PRIMARY KEY (`solution_id`),
  ADD KEY `answer of this q` (`question_id`),
  ADD KEY `answer given by` (`user_id`);

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
  ADD CONSTRAINT `it belongs to this exam1` FOREIGN KEY (`exam_code`) REFERENCES `exam` (`exam_code`);

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

--
-- Constraints for table `subjective_student_solution`
--
ALTER TABLE `subjective_student_solution`
  ADD CONSTRAINT `answer given by` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `answer of this q` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
