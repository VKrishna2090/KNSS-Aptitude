-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2021 at 05:32 PM
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
(29532, 'Reference Models', 'Attempt all questions. 2 marks each.', '00:18:00', 9, 18, '2021-03-23', '2021-06-04', 3, 354570),
(131661, 'Sockets', '', '00:20:00', 10, 20, '2021-05-20', '2021-06-09', 3, 354570),
(220512, 'Data Link Layer', 'Attempt all questions.', '00:30:00', 2, 20, '2021-04-05', '2021-06-04', 3, 354570),
(462143, 'Variables Names', '', '00:10:00', 5, 10, '2021-05-01', '2021-06-17', 9, 394755),
(463739, 'Error Handling', 'Attempt all questions.\r\nEach MCQ-type question has 2 marks, and each Subjective type question has 5 marks.\r\nThere is a total of 5 MCQ-type questions and 2 Subjective type questions.', '00:40:00', 7, 20, '2021-04-08', '2021-06-04', 9, 394755),
(680079, 'Physical Layer', '', '00:20:00', 10, 20, '2021-05-17', '2021-06-06', 3, 354570),
(735864, 'Basics of Java', 'Attempt all questions.', '00:10:00', 5, 10, '2021-04-01', '2021-04-15', 3, 102),
(751248, 'Strings', 'Attempt all questions.', '00:40:00', 6, 20, '2021-04-06', '2021-06-03', 3, 101),
(770110, 'Basic SQL Operations', 'Attempt all 5 MCQ type question. Each question has 2 marks.', '00:15:00', 5, 10, '2021-04-08', '2021-06-04', 9, 482635),
(824974, 'Triggers', '', '00:18:00', 9, 18, '2021-04-08', '2021-04-28', 9, 482635),
(830290, 'Network Layer', '', '00:20:00', 10, 20, '2021-04-05', '2021-04-25', 3, 354570),
(891530, 'Core Data Type', '', '00:20:00', 4, 10, '2021-05-15', '2021-05-31', 3, 101),
(944393, 'Java Data Types', 'Attempt all questions', '00:10:00', 5, 10, '2021-04-01', '2021-06-01', 3, 101),
(951153, 'Lists 1', '', '00:16:00', 8, 16, '2021-04-05', '2021-06-04', 3, 101);

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
(29532, 13, 14, 1, '2021-04-09', 0),
(131661, 6, 2, 1, '2021-05-20', 1),
(220512, 1, 19, 1, '2021-04-05', 1),
(220512, 6, 19, 1, '2021-04-09', 1),
(220512, 14, 18, 1, '2021-04-09', 1),
(220512, 15, 0, 1, '2021-04-09', 0),
(462143, 6, 8, 1, '2021-04-09', 1),
(462143, 10, 8, 1, '2021-04-09', 0),
(462143, 11, 8, 1, '2021-04-08', 1),
(462143, 13, 8, 1, '2021-04-09', 1),
(463739, 15, 6, 1, '2021-04-09', 0),
(680079, 1, 4, 1, '2021-05-17', 0),
(735864, 11, 6, 1, '2021-04-09', 1),
(735864, 14, 6, 1, '2021-04-09', 1),
(751248, 14, 10, 1, '2021-04-09', 0),
(770110, 1, 10, 1, '2021-05-15', 1),
(770110, 6, 8, 1, '2021-05-15', 0),
(770110, 10, 4, 1, '2021-04-09', 1),
(770110, 11, 6, 1, '2021-04-08', 1),
(830290, 15, 8, 1, '2021-04-09', 1),
(944393, 6, 4, 1, '2021-05-15', 1),
(951153, 1, 14, 1, '2021-05-15', 1),
(951153, 6, 14, 1, '2021-04-09', 1),
(951153, 13, 16, 1, '2021-04-09', 1);

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
(9889, 'Can be', '1', 233837),
(10296, 'all of the mentioned', '1', 970237),
(14173, 'Cannot be', '0', 233837),
(15927, 'Ascending', '1', 643653),
(18657, 'Bytecode is executed by JVM', '1', 116507),
(19147, '5', '1', 759722),
(19720, 'Only b', '1', 451234),
(21691, 'b) Data encryption', '0', 120784),
(22631, 'Flow control', '1', 248061),
(24952, ': old only', '0', 477129),
(25377, 'Congestion control', '0', 248061),
(31034, 'Compilation error', '0', 991863),
(38113, 'empty output', '0', 450480),
(40824, '1', '0', 534052),
(46314, '–', '0', 310083),
(46337, '@', '1', 310083),
(49153, 'From', '0', 312245),
(54850, 'Descending', '0', 643653),
(57262, '25', '0', 609450),
(57417, 'Public static InetAddress get Localhost()', '0', 852716),
(68552, 'physical signalling sublayer', '1', 311062),
(72333, 'compiler error', '1', 450480),
(76187, 'Atleast, Exactly', '0', 647274),
(77236, 'trasnport layer', '0', 409975),
(79281, 'Synchronization', '0', 240841),
(81898, 'To avoid conflicts with environment variables of an operating system', '0', 346381),
(83865, '[‘h’, ‘e’, ‘l’, ‘l’, ‘o’]', '1', 951343),
(85579, 'SYNC flooding attack', '0', 522053),
(91773, 'coaxial cable', '0', 395540),
(91970, 'Simultaneous open', '1', 472815),
(98619, 'Flow control', '0', 240841),
(99645, 'amplitude modulation', '0', 97538),
(106671, 'Exactly, Atleast', '1', 647274),
(108477, 'b) 7', '1', 350750),
(109061, 'shuffle(list1)', '0', 597274),
(109395, 'Public Output Stream get Output Stream ()', '0', 846215),
(109899, 'b) Session layer', '1', 284799),
(110379, 'Error control', '0', 248061),
(111613, 'both start & stop signalling and flow control', '1', 57242),
(113982, 'Datagram Packet', '0', 540175),
(114564, 'optical fiber', '1', 395540),
(114641, 'd) Randomized', '0', 189944),
(117535, 'a) Application layer', '0', 284799),
(118684, '1.5', '0', 235030),
(127328, 'a) Application layer', '0', 368558),
(130828, 'JDB', '1', 306072),
(134237, 'Passive attack', '0', 522053),
(136964, 'void', '0', 400765),
(138469, 'Error', '0', 746152),
(140728, '12454', '1', 421285),
(140968, '0', '1', 275481),
(142337, 'd) Link layer', '0', 284799),
(142981, 'a) Data compression', '0', 120784),
(151806, 'True', '1', 392017),
(154720, 'c) 6', '0', 350750),
(154796, 'data link layer', '1', 409975),
(156078, 'False', '0', 387870),
(159231, 'JRE', '0', 306072),
(165609, 'b) NIC', '0', 690226),
(176985, 'Public String get Hostname()', '1', 852716),
(181945, 'electrical cable', '0', 395540),
(188946, 'Both Sequence & Acknowledgment number', '0', 885871),
(189322, 'Acknowledgment number', '1', 885871),
(189833, 'FROM', '0', 321478),
(190331, 'Whatever user types', '1', 991863),
(200308, 'Insert, Update, Delete', '1', 507929),
(210450, 'int', '0', 488964),
(212406, 'none of the mentioned', '0', 451266),
(224802, 'Use of exception handling', '0', 116507),
(224938, 'float', '0', 580911),
(226293, 'Yna PYnat tive PYnativ vitanYP', '0', 596767),
(229795, 'False', '0', 392017),
(231784, 'for insert, on', '0', 120610),
(232099, 'Atleast, All', '0', 647274),
(232156, 'Passive open', '0', 141490),
(242023, 'Sequence number', '0', 885871),
(243212, '6', '0', 968673),
(247990, 'Public void connect ()', '0', 846215),
(248729, 'Port number', '0', 416969),
(252644, 'all of the mentioned', '1', 556286),
(256799, 'Functions', '0', 898857),
(259757, 'Procedures', '0', 898857),
(261250, '2445', '0', 421285),
(264331, 'None', '0', 759722),
(265407, 'Socket', '0', 433679),
(266143, 'Protocol', '0', 433679),
(266415, 'start and stop signalling', '0', 57242),
(266658, 'random.shuffleList(list1)', '0', 597274),
(269586, 'a) Application layer', '1', 164844),
(269840, 'physical address sublayer', '0', 311062),
(270731, 'UpperCase letters', '0', 48116),
(280672, 'Active close', '0', 303765),
(281452, '/@', '0', 310083),
(284539, 'c) Transport layer', '0', 284799),
(286436, '8', '0', 700707),
(289928, '16 and 32 bytes', '0', 63198),
(292268, 'Error', '0', 759722),
(294592, 'Public getByName()', '0', 852716),
(299796, 'long', '0', 488964),
(301434, 'abort();', '0', 8759),
(304858, 'Mutual open', '0', 472815),
(308377, 'stdout', '0', 920411),
(309247, 'channel coding', '0', 556286),
(309296, '70251', '0', 21929),
(313247, '[‘llo’]', '0', 951343),
(314605, '[25, 14, 222, 33, 2]', '0', 609450),
(317198, 'MAC Address', '0', 433679),
(320175, 'ormat', '0', 147921),
(321124, 'twisted pair cable', '0', 395540),
(321163, 'Both :new and : old', '1', 477129),
(321330, 'Passive attack', '0', 342795),
(325028, '16-bits and 32-bits', '0', 719861),
(329323, 'Views', '1', 556472),
(333399, 'formatio', '0', 147921),
(334472, 'Ought to be', '0', 233837),
(334959, '1', '0', 235030),
(335952, 'Same', '0', 643653),
(337319, 'runtime error', '0', 987254),
(338632, '16-bits and 16-bits', '1', 719861),
(341200, 'str1', '1', 235030),
(345963, 'None of the mentioned', '0', 120610),
(352915, 'True', '1', 387870),
(358295, 'format', '1', 147921),
(360054, 'LowerCase letters', '1', 48116),
(362355, '25', '0', 666257),
(362874, 'Hexadecimal', '0', 463942),
(371504, 'a) End system', '1', 100639),
(372927, '7', '0', 21929),
(375186, 'JVM', '0', 306072),
(381300, 'Only its own IP address', '0', 416969),
(386708, 'electrical specification of transmission line signal level', '0', 531073),
(398618, 'PYn PYnat ive PYnativ vitanYP', '0', 596767),
(400204, 'AS', '1', 321478),
(408905, 'return(expr);', '0', 8759),
(415882, 'All of the mentioned', '0', 556472),
(417176, 'Undefined behaviour', '0', 991863),
(420401, 'd) 10', '0', 606065),
(421421, 'Error', '0', 534052),
(428411, '8.0', '0', 700707),
(428709, '2', '0', 746152),
(431678, 'multiplexing', '1', 184892),
(432156, 'PYn PYnat ive PYnativ PYnativ ', '0', 596767),
(433198, 'Architecture Neutral', '0', 746651),
(433639, 'Datagram Socket(int port, Int Address address)', '1', 614148),
(433710, 'Denial-of-service attack', '1', 522053),
(437844, 'list1.shuffle()', '0', 597274),
(439003, 'a) 5', '0', 350750),
(448565, '.ora', '0', 821349),
(451560, 'All of the mentioned', '0', 507929),
(452054, 'Server Socket', '0', 540175),
(455151, '[‘olleh’]', '0', 951343),
(457027, 'All, Exactly', '0', 647274),
(458747, '22 None', '0', 224762),
(459612, '32-bits and 32-bits', '0', 719861),
(469034, '“Comp Sci”', '1', 312245),
(475499, 'To avoid conflicts since library routines use such names', '1', 346381),
(476278, 'None 22', '0', 224762),
(481192, 'digital modulation', '1', 97538),
(481533, 'Compiler and linker implementations', '1', 346741),
(482648, 'None', '0', 746152),
(484460, '8.8', '0', 700707),
(484567, 'Unicode escape sequence', '1', 463942),
(486733, '1', '1', 666257),
(488499, '/', '0', 310083),
(489737, 'All of the mentioned', '0', 329936),
(490727, '14', '0', 968673),
(491268, 'It is not standardized', '0', 346381),
(495890, 'Error is generated', '1', 224762),
(495931, 'None', '1', 965155),
(496995, 'compiler error', '1', 987254),
(502018, 'Dynamic binding between objects', '0', 116507),
(504150, 'Object-oriented', '0', 746651),
(505900, 'Error detection', '0', 248061),
(506027, 'b) Removed', '1', 189944),
(506972, 'd) 10', '0', 350750),
(507924, 'bit-by-bit delivery', '1', 299307),
(515259, 'Passive open', '1', 303765),
(516843, 'Error', '0', 609450),
(517914, 'application to application delivery', '0', 299307),
(518347, '6/4', '0', 235030),
(522540, 'both stdout and stdin', '0', 920411),
(524095, 'Octal escape', '0', 463942),
(526680, 'application layer', '0', 409975),
(538114, 'line coding', '0', 556286),
(539630, 'JDK', '0', 306072),
(541845, 'Checksum', '0', 885871),
(544969, 'frequency modulation', '0', 97538),
(549678, 'Tuples', '0', 834444),
(549768, 'all of the mentioned', '1', 531073),
(554248, '25', '1', 746152),
(559855, 'Dictionary', '0', 834444),
(561619, 'a) Added', '0', 189944),
(564877, '3', '0', 666257),
(565571, 'network layer', '0', 409975),
(566760, 'Any nonzero value', '0', 275481),
(567072, 'b) 7', '0', 606065),
(567997, 'MAC Address', '0', 508479),
(568391, 'c) 6', '0', 606065),
(574940, 'Passive close', '0', 141490),
(576887, 'long', '0', 400765),
(579319, '31', '1', 968673),
(580169, 'IP address of Server', '0', 416969),
(581499, 'Mutual Close', '0', 472815),
(581711, 'garbage value', '0', 987254),
(587702, 'analog modulation', '0', 184892),
(590314, 'The applet makes the Java code secure and portable', '0', 116507),
(597911, 'Only a', '0', 451234),
(600292, 'Hello', '0', 450480),
(608818, 'none of the mentioned', '0', 920411),
(608841, 'JOIN', '0', 321478),
(609693, 'digital modulation', '0', 184892),
(619705, 'Passive close', '0', 303765),
(620230, 'Public synchronized void close ()', '0', 846215),
(627412, '20 and 60 bytes', '1', 63198),
(635386, 'radio waves', '0', 970237),
(637479, 'For, insert', '0', 120610),
(638968, 'd) Packet transport', '0', 690226),
(639562, '63', '1', 287830),
(640370, 'None of the mentioned', '0', 346741),
(642779, 'Triggers generated after a particular operation', '0', 329936),
(644900, 'On, for insert', '1', 120610),
(646585, 'None of the mentioned', '0', 991863),
(648123, 'random.shuffle(list1)', '1', 597274),
(652305, 'All attributes of instructor and teaches are selected', '0', 247813),
(653775, 'exit(expr);', '1', 8759),
(654991, 'Public Socket accept ()', '1', 846215),
(656561, 'These triggers run after an insert, views, update or delete on a table', '0', 329936),
(660586, 'Active attack', '0', 522053),
(661692, 'stdin', '1', 920411),
(664842, 'd) Session layer', '1', 368558),
(669997, 'abort(expr)', '0', 451266),
(670274, 'None None', '0', 224762),
(670544, '0', '0', 987254),
(672392, 'Three-Way Handshaking', '1', 240841),
(672696, 'Neither :new nor : old', '0', 477129),
(675373, 'Yna PYnat tive PYnativ PYnativ', '1', 596767),
(677432, 'All attributes of instructor are selected on the given condition', '1', 247813),
(677572, 'Active close', '0', 141490),
(678627, 'None of the mentioned', '0', 48116),
(679520, 'a) End system', '1', 690226),
(681320, 'Only the some attributes from instructed and teaches are selected', '0', 247813),
(682746, 'False', '0', 314646),
(684142, 'only start signalling', '0', 57242),
(688619, 'ferror(expr)', '0', 451266),
(690434, 'bool', '0', 965155),
(695791, 'Object', '0', 400765),
(710692, 'both exit(expr); and abort();', '0', 8759),
(710796, 'Socket', '0', 508479),
(713502, '14', '0', 287830),
(715289, 'Datagram Socket()', '0', 614148),
(717998, '[‘hello’]', '0', 951343),
(721192, 'd) Session layer', '0', 164844),
(723116, 'phase modulation', '0', 184892),
(724266, 'Datagram Socket(int port)', '0', 614148),
(724995, '.pls', '0', 821349),
(730462, '.sql', '1', 821349),
(733072, 'c) Link layer', '0', 368558),
(733588, 'All attributes of teaches are selected on given condition', '0', 247813),
(734780, 'Use of pointers', '1', 746651),
(735425, 'double', '1', 488964),
(736976, '12', '0', 968673),
(739961, 'Protocol', '1', 508479),
(740571, 'Dynamic', '0', 746651),
(743299, 'c) Ethernet', '0', 100639),
(744923, '15', '1', 534052),
(745576, 'IP Address', '0', 508479),
(746784, 'int', '1', 580911),
(751847, 'Update', '0', 556472),
(753369, 'phase modulation', '0', 97538),
(755025, 'dict', '0', 580911),
(758928, 'Public String getHostAddress()', '0', 852716),
(761836, 'To avoid conflicts since assemblers and loaders use such names', '0', 346381),
(768568, '15', '0', 21929),
(770378, 'port to port delivery', '0', 299307),
(778877, 'Denial-of-service attack', '0', 342795),
(780713, 'Both Datagram Socket & Datagram Packet', '1', 540175),
(784358, 'c) Link layer', '0', 164844),
(785987, 'Assemblers and loaders implementations', '0', 346741),
(786245, 'd) All of the mentioned', '1', 120784),
(788663, 'Employee', '0', 312245),
(789825, 'Datagram Socket', '0', 540175),
(791781, '12', '0', 287830),
(791853, 'microwaves', '0', 970237),
(795890, 'physical data sublayer', '0', 311062),
(805622, 'float', '0', 488964),
(810773, 'Class', '1', 834444),
(811493, 'Active attack', '0', 342795),
(813637, 'int', '1', 400765),
(813895, 'True', '1', 314646),
(814808, 'specification for IR over optical fiber', '0', 531073),
(815028, 'C language', '0', 346741),
(819538, 'Triggers', '1', 898857),
(820458, 'flow control', '0', 57242),
(823639, 'Lists', '0', 834444),
(825645, 'b) Transport layer', '0', 368558),
(826498, '.txt', '0', 821349),
(837957, 'Always', '0', 233837),
(839892, 'Any', '0', 643653),
(840455, 'runtime error', '0', 450480),
(843837, 'int', '0', 965155),
(847705, '9', '0', 534052),
(848070, 'Delete', '0', 556472),
(849599, '8.800000095367432', '1', 700707),
(852093, 'c) Rearranged', '0', 189944),
(855117, '[2, 33, 222, 14]', '1', 609450),
(855723, 'exit(expr)', '1', 451266),
(857804, 'Define, Create', '0', 507929),
(860878, ': new only', '0', 477129),
(861592, 'orma', '0', 147921),
(865115, 'Error', '1', 21929),
(868208, '1', '0', 275481),
(869473, 'CamelCase letters', '0', 48116),
(873913, 'bool', '0', 580911),
(881592, 'd) Signal transmission', '0', 100639),
(883287, 'Dept_name', '0', 312245),
(884048, 'Drop, Comment', '0', 507929),
(887668, '123', '0', 421285),
(893208, 'physical transport sublayer', '0', 311062),
(903267, 'SYNC flooding attack', '1', 342795),
(904275, '5', '0', 666257),
(906844, 'a) 5', '1', 606065),
(906882, 'Simultaneous close', '0', 472815),
(908419, '133', '0', 421285),
(908627, 'IP Address', '1', 433679),
(911472, 'These triggers run after an insert, update or delete on a table', '1', 329936),
(916933, 'RENAME', '0', 321478),
(918342, 'mechanical specifications of electrical connectors and cables', '0', 531073),
(919573, 'Line feed', '0', 463942),
(927320, 'Both a and b', '0', 451234),
(928230, 'None of the mentioned', '0', 898857),
(929450, '4', '0', 759722),
(931107, 'Forwarding', '0', 240841),
(932733, '32-bits and 16-bits', '0', 719861),
(934223, '31', '0', 287830),
(936745, 'b) Transport layer', '0', 164844),
(939926, 'Compilation error', '0', 275481),
(941248, 'b) NIC', '0', 100639),
(951197, 'void', '0', 965155),
(954075, 'modulation', '0', 556286),
(955202, 'Datagram Socket(int address)', '0', 614148),
(955896, 'c) Ethernet', '0', 690226),
(961134, 'Neither a nor b', '0', 451234),
(962472, 'c) Data description', '0', 120784),
(976313, 'Active open', '1', 141490),
(980531, 'infrared', '0', 970237),
(986212, 'Both IP address of Server & Port number', '1', 416969),
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
(8759, '<p><strong>Which of the following function can be used to terminate the main function from another function safely?</strong></p>\r\n', 'O', 2, 463739),
(21929, '<p><strong>What will the below Python code will return?</strong></p>\r\n\r\n<p><code>list1=[0,2,5,1]<br />\r\nstr1=&quot;7&quot;<br />\r\nfor i in list1:<br />\r\n&nbsp; &nbsp; str1=str1+i<br />\r\nprint(str1)</code></p>\r\n\r\n<div class=\"ms-editor-squiggler\" style=\"color: initial; font: initial; font-feature-settings: initial; font-kerning: initial; font-optical-sizing: initial; font-variation-settings: initial; forced-color-adjust: initial; text-orientation: initial; text-rendering: initial; -webkit-font-smoothing: initial; -webkit-locale: initial; -webkit-text-orientation: initial; -webkit-writing-mode: initial; writing-mode: initial; zoom: initial; place-content: initial; place-items: initial; place-self: initial; alignment-baseline: initial; animation: initial; appearance: initial; aspect-ratio: initial; backdrop-filter: initial; backface-visibility: initial; background: initial; background-blend-mode: initial; baseline-shift: initial; block-size: initial; border-block: initial; border: initial; border-radius: initial; border-collapse: initial; border-end-end-radius: initial; border-end-start-radius: initial; border-inline: initial; border-start-end-radius: initial; border-start-start-radius: initial; inset: initial; box-shadow: initial; box-sizing: initial; break-after: initial; break-before: initial; break-inside: initial; buffered-rendering: initial; caption-side: initial; caret-color: initial; clear: initial; clip: initial; clip-path: initial; clip-rule: initial; color-interpolation: initial; color-interpolation-filters: initial; color-rendering: initial; color-scheme: initial; columns: initial; column-fill: initial; gap: initial; column-rule: initial; column-span: initial; contain: initial; contain-intrinsic-size: initial; content: initial; content-visibility: initial; counter-increment: initial; counter-reset: initial; counter-set: initial; cursor: initial; cx: initial; cy: initial; d: initial; display: block; dominant-baseline: initial; empty-cells: initial; fill: initial; fill-opacity: initial; fill-rule: initial; filter: initial; flex: initial; flex-flow: initial; float: initial; flood-color: initial; flood-opacity: initial; grid: initial; grid-area: initial; height: 0px; hyphens: initial; image-orientation: initial; image-rendering: initial; inline-size: initial; inset-block: initial; inset-inline: initial; isolation: initial; letter-spacing: initial; lighting-color: initial; line-break: initial; list-style: initial; margin-block: initial; margin: initial; margin-inline: initial; marker: initial; mask: initial; mask-type: initial; max-block-size: initial; max-height: initial; max-inline-size: initial; max-width: initial; min-block-size: initial; min-height: initial; min-inline-size: initial; min-width: initial; mix-blend-mode: initial; object-fit: initial; object-position: initial; offset: initial; opacity: initial; order: initial; origin-trial-test-property: initial; orphans: initial; outline: initial; outline-offset: initial; overflow-anchor: initial; overflow-wrap: initial; overflow: initial; overscroll-behavior-block: initial; overscroll-behavior-inline: initial; overscroll-behavior: initial; padding-block: initial; padding: initial; padding-inline: initial; page: initial; page-orientation: initial; paint-order: initial; perspective: initial; perspective-origin: initial; pointer-events: initial; position: initial; quotes: initial; r: initial; resize: initial; ruby-position: initial; rx: initial; ry: initial; scroll-behavior: initial; scroll-margin-block: initial; scroll-margin: initial; scroll-margin-inline: initial; scroll-padding-block: initial; scroll-padding: initial; scroll-padding-inline: initial; scroll-snap-align: initial; scroll-snap-stop: initial; scroll-snap-type: initial; shape-image-threshold: initial; shape-margin: initial; shape-outside: initial; shape-rendering: initial; size: initial; speak: initial; stop-color: initial; stop-opacity: initial; stroke: initial; stroke-dasharray: initial; stroke-dashoffset: initial; stroke-linecap: initial; stroke-linejoin: initial; stroke-miterlimit: initial; stroke-opacity: initial; stroke-width: initial; tab-size: initial; table-layout: initial; text-align: initial; text-align-last: initial; text-anchor: initial; text-combine-upright: initial; text-decoration: initial; text-decoration-skip-ink: initial; text-indent: initial; text-overflow: initial; text-shadow: initial; text-size-adjust: initial; text-transform: initial; text-underline-offset: initial; text-underline-position: initial; touch-action: initial; transform: initial; transform-box: initial; transform-origin: initial; transform-style: initial; transition: initial; user-select: initial; vector-effect: initial; vertical-align: initial; visibility: initial; -webkit-app-region: initial; border-spacing: initial; -webkit-border-image: initial; -webkit-box-align: initial; -webkit-box-decoration-break: initial; -webkit-box-direction: initial; -webkit-box-flex: initial; -webkit-box-ordinal-group: initial; -webkit-box-orient: initial; -webkit-box-pack: initial; -webkit-box-reflect: initial; -webkit-highlight: initial; -webkit-hyphenate-character: initial; -webkit-line-break: initial; -webkit-line-clamp: initial; -webkit-mask-box-image: initial; -webkit-mask: initial; -webkit-mask-composite: initial; -webkit-perspective-origin-x: initial; -webkit-perspective-origin-y: initial; -webkit-print-color-adjust: initial; -webkit-rtl-ordering: initial; -webkit-ruby-position: initial; -webkit-tap-highlight-color: initial; -webkit-text-combine: initial; -webkit-text-decorations-in-effect: initial; -webkit-text-emphasis: initial; -webkit-text-emphasis-position: initial; -webkit-text-fill-color: initial; -webkit-text-security: initial; -webkit-text-stroke: initial; -webkit-transform-origin-x: initial; -webkit-transform-origin-y: initial; -webkit-transform-origin-z: initial; -webkit-user-drag: initial; -webkit-user-modify: initial; white-space: initial; widows: initial; width: initial; will-change: initial; word-break: initial; word-spacing: initial; x: initial; y: initial; z-index: initial;\">&nbsp;</div>\r\n', 'O', 2, 751248),
(48116, '<b>All keywords in C are in ____________</b>', 'O', 2, 462143),
(57242, '<b>In asynchronous serial communication the physical layer provides ___________</b>', 'O', 2, 680079),
(63198, '<b>Size of TCP segment header ranges between ___________</b>', 'O', 2, 830290),
(97538, '<b>Bits can be sent over guided and unguided media as analog signal by ___________</b>', 'O', 2, 680079),
(100639, 'Transport layer is implemented in ______________', 'O', 2, 29532),
(116507, 'Which of the following option leads to the portability and security of Java?', 'O', 2, 735864),
(120610, '<b>The CREATE TRIGGER statement is used to create the trigger. THE _____ clause specifies the table name on which the trigger is to be attached. The ______ specifies that this is an AFTER INSERT trigger.</b>', 'O', 2, 824974),
(120784, 'The functionalities of the presentation layer include ____________', 'O', 2, 29532),
(141490, '<b>A client that wishes to connect to an open server tells its TCP that it needs to be connected to that particular server. The process is called ___________</b>', 'O', 2, 830290),
(147921, '<p><strong>What will be the output of the below Python code?</strong></p>\r\n\r\n<pre>\r\nstr1=&quot;Information&quot;\r\nprint(str1[2:8])\r\n</pre>\r\n', 'O', 2, 751248),
(157641, '<p>What is core data type in Python?</p>\r\n', 'S', 4, 891530),
(164844, 'In TCP IP Model, when data is sent from device A to device B, the 5th layer to receive data at B is ____________', 'O', 2, 29532),
(184892, '<b>A single channel is shared by multiple signals by ____________</b>', 'O', 2, 680079),
(189944, 'In the OSI model, as a data packet moves from the lower to the upper layers, headers are _______', 'O', 2, 29532),
(224762, '<p><strong>What will be the output of the following Python code?</strong></p>\r\n\r\n<pre>\r\n<code>class father:   \r\n    def __init__(self, param):       \r\n    self.o1 = param\r\n</code></pre>\r\n\r\n<pre>\r\n<code>class child(father):   \r\n    def __init__(self, param):        \r\n&nbsp;   self.o2 = param</code></pre>\r\n\r\n<pre>\r\n<code>obj = child(22)\r\nprint &quot;%d %d&quot; % (obj.o1, obj.o2)</code></pre>\r\n\r\n<div class=\"ms-editor-squiggler\" style=\"color: initial; font: initial; font-feature-settings: initial; font-kerning: initial; font-optical-sizing: initial; font-variation-settings: initial; forced-color-adjust: initial; text-orientation: initial; text-rendering: initial; -webkit-font-smoothing: initial; -webkit-locale: initial; -webkit-text-orientation: initial; -webkit-writing-mode: initial; writing-mode: initial; zoom: initial; place-content: initial; place-items: initial; place-self: initial; alignment-baseline: initial; animation: initial; appearance: initial; aspect-ratio: initial; backdrop-filter: initial; backface-visibility: initial; background: initial; background-blend-mode: initial; baseline-shift: initial; block-size: initial; border-block: initial; border: initial; border-radius: initial; border-collapse: initial; border-end-end-radius: initial; border-end-start-radius: initial; border-inline: initial; border-start-end-radius: initial; border-start-start-radius: initial; inset: initial; box-shadow: initial; box-sizing: initial; break-after: initial; break-before: initial; break-inside: initial; buffered-rendering: initial; caption-side: initial; caret-color: initial; clear: initial; clip: initial; clip-path: initial; clip-rule: initial; color-interpolation: initial; color-interpolation-filters: initial; color-rendering: initial; color-scheme: initial; columns: initial; column-fill: initial; gap: initial; column-rule: initial; column-span: initial; contain: initial; contain-intrinsic-size: initial; content: initial; content-visibility: initial; counter-increment: initial; counter-reset: initial; counter-set: initial; cursor: initial; cx: initial; cy: initial; d: initial; display: block; dominant-baseline: initial; empty-cells: initial; fill: initial; fill-opacity: initial; fill-rule: initial; filter: initial; flex: initial; flex-flow: initial; float: initial; flood-color: initial; flood-opacity: initial; grid: initial; grid-area: initial; height: 0px; hyphens: initial; image-orientation: initial; image-rendering: initial; inline-size: initial; inset-block: initial; inset-inline: initial; isolation: initial; letter-spacing: initial; lighting-color: initial; line-break: initial; list-style: initial; margin-block: initial; margin: initial; margin-inline: initial; marker: initial; mask: initial; mask-type: initial; max-block-size: initial; max-height: initial; max-inline-size: initial; max-width: initial; min-block-size: initial; min-height: initial; min-inline-size: initial; min-width: initial; mix-blend-mode: initial; object-fit: initial; object-position: initial; offset: initial; opacity: initial; order: initial; origin-trial-test-property: initial; orphans: initial; outline: initial; outline-offset: initial; overflow-anchor: initial; overflow-wrap: initial; overflow: initial; overscroll-behavior-block: initial; overscroll-behavior-inline: initial; overscroll-behavior: initial; padding-block: initial; padding: initial; padding-inline: initial; page: initial; page-orientation: initial; paint-order: initial; perspective: initial; perspective-origin: initial; pointer-events: initial; position: initial; quotes: initial; r: initial; resize: initial; ruby-position: initial; rx: initial; ry: initial; scroll-behavior: initial; scroll-margin-block: initial; scroll-margin: initial; scroll-margin-inline: initial; scroll-padding-block: initial; scroll-padding: initial; scroll-padding-inline: initial; scroll-snap-align: initial; scroll-snap-stop: initial; scroll-snap-type: initial; shape-image-threshold: initial; shape-margin: initial; shape-outside: initial; shape-rendering: initial; size: initial; speak: initial; stop-color: initial; stop-opacity: initial; stroke: initial; stroke-dasharray: initial; stroke-dashoffset: initial; stroke-linecap: initial; stroke-linejoin: initial; stroke-miterlimit: initial; stroke-opacity: initial; stroke-width: initial; tab-size: initial; table-layout: initial; text-align: initial; text-align-last: initial; text-anchor: initial; text-combine-upright: initial; text-decoration: initial; text-decoration-skip-ink: initial; text-indent: initial; text-overflow: initial; text-shadow: initial; text-size-adjust: initial; text-transform: initial; text-underline-offset: initial; text-underline-position: initial; touch-action: initial; transform: initial; transform-box: initial; transform-origin: initial; transform-style: initial; transition: initial; user-select: initial; vector-effect: initial; vertical-align: initial; visibility: initial; -webkit-app-region: initial; border-spacing: initial; -webkit-border-image: initial; -webkit-box-align: initial; -webkit-box-decoration-break: initial; -webkit-box-direction: initial; -webkit-box-flex: initial; -webkit-box-ordinal-group: initial; -webkit-box-orient: initial; -webkit-box-pack: initial; -webkit-box-reflect: initial; -webkit-highlight: initial; -webkit-hyphenate-character: initial; -webkit-line-break: initial; -webkit-line-clamp: initial; -webkit-mask-box-image: initial; -webkit-mask: initial; -webkit-mask-composite: initial; -webkit-perspective-origin-x: initial; -webkit-perspective-origin-y: initial; -webkit-print-color-adjust: initial; -webkit-rtl-ordering: initial; -webkit-ruby-position: initial; -webkit-tap-highlight-color: initial; -webkit-text-combine: initial; -webkit-text-decorations-in-effect: initial; -webkit-text-emphasis: initial; -webkit-text-emphasis-position: initial; -webkit-text-fill-color: initial; -webkit-text-security: initial; -webkit-text-stroke: initial; -webkit-transform-origin-x: initial; -webkit-transform-origin-y: initial; -webkit-transform-origin-z: initial; -webkit-user-drag: initial; -webkit-user-modify: initial; white-space: initial; widows: initial; width: initial; will-change: initial; word-break: initial; word-spacing: initial; x: initial; y: initial; z-index: initial;\">&nbsp;</div>\r\n', 'O', 2, 751248),
(233837, '<b>Triggers ________ enabled or disabled</b>', 'O', 2, 824974),
(235030, '<p><strong>What will be the output of following Python code?</strong></p>\r\n\r\n<pre>\r\n<code>str1=&quot;6/4&quot;\r\nprint(&quot;str1&quot;)</code></pre>\r\n', 'O', 2, 751248),
(240841, '<b>Connection establishment in TCP is done by which mechanism?</b>', 'O', 2, 830290),
(247813, '<p><code>SELECT instructor.*<br />\r\nFROM instructor, teaches<br />\r\nWHERE instructor.ID= teaches.ID;</code></p>\r\n\r\n<p><strong>This query does which of the following operation?</strong></p>\r\n\r\n<div class=\"ms-editor-squiggler\" style=\"color: initial; font: initial; font-feature-settings: initial; font-kerning: initial; font-optical-sizing: initial; font-variation-settings: initial; forced-color-adjust: initial; text-orientation: initial; text-rendering: initial; -webkit-font-smoothing: initial; -webkit-locale: initial; -webkit-text-orientation: initial; -webkit-writing-mode: initial; writing-mode: initial; zoom: initial; place-content: initial; place-items: initial; place-self: initial; alignment-baseline: initial; animation: initial; appearance: initial; aspect-ratio: initial; backdrop-filter: initial; backface-visibility: initial; background: initial; background-blend-mode: initial; baseline-shift: initial; block-size: initial; border-block: initial; border: initial; border-radius: initial; border-collapse: initial; border-end-end-radius: initial; border-end-start-radius: initial; border-inline: initial; border-start-end-radius: initial; border-start-start-radius: initial; inset: initial; box-shadow: initial; box-sizing: initial; break-after: initial; break-before: initial; break-inside: initial; buffered-rendering: initial; caption-side: initial; caret-color: initial; clear: initial; clip: initial; clip-path: initial; clip-rule: initial; color-interpolation: initial; color-interpolation-filters: initial; color-rendering: initial; color-scheme: initial; columns: initial; column-fill: initial; gap: initial; column-rule: initial; column-span: initial; contain: initial; contain-intrinsic-size: initial; content: initial; content-visibility: initial; counter-increment: initial; counter-reset: initial; counter-set: initial; cursor: initial; cx: initial; cy: initial; d: initial; display: block; dominant-baseline: initial; empty-cells: initial; fill: initial; fill-opacity: initial; fill-rule: initial; filter: initial; flex: initial; flex-flow: initial; float: initial; flood-color: initial; flood-opacity: initial; grid: initial; grid-area: initial; height: 0px; hyphens: initial; image-orientation: initial; image-rendering: initial; inline-size: initial; inset-block: initial; inset-inline: initial; isolation: initial; letter-spacing: initial; lighting-color: initial; line-break: initial; list-style: initial; margin-block: initial; margin: initial; margin-inline: initial; marker: initial; mask: initial; mask-type: initial; max-block-size: initial; max-height: initial; max-inline-size: initial; max-width: initial; min-block-size: initial; min-height: initial; min-inline-size: initial; min-width: initial; mix-blend-mode: initial; object-fit: initial; object-position: initial; offset: initial; opacity: initial; order: initial; origin-trial-test-property: initial; orphans: initial; outline: initial; outline-offset: initial; overflow-anchor: initial; overflow-wrap: initial; overflow: initial; overscroll-behavior-block: initial; overscroll-behavior-inline: initial; overscroll-behavior: initial; padding-block: initial; padding: initial; padding-inline: initial; page: initial; page-orientation: initial; paint-order: initial; perspective: initial; perspective-origin: initial; pointer-events: initial; position: initial; quotes: initial; r: initial; resize: initial; ruby-position: initial; rx: initial; ry: initial; scroll-behavior: initial; scroll-margin-block: initial; scroll-margin: initial; scroll-margin-inline: initial; scroll-padding-block: initial; scroll-padding: initial; scroll-padding-inline: initial; scroll-snap-align: initial; scroll-snap-stop: initial; scroll-snap-type: initial; shape-image-threshold: initial; shape-margin: initial; shape-outside: initial; shape-rendering: initial; size: initial; speak: initial; stop-color: initial; stop-opacity: initial; stroke: initial; stroke-dasharray: initial; stroke-dashoffset: initial; stroke-linecap: initial; stroke-linejoin: initial; stroke-miterlimit: initial; stroke-opacity: initial; stroke-width: initial; tab-size: initial; table-layout: initial; text-align: initial; text-align-last: initial; text-anchor: initial; text-combine-upright: initial; text-decoration: initial; text-decoration-skip-ink: initial; text-indent: initial; text-overflow: initial; text-shadow: initial; text-size-adjust: initial; text-transform: initial; text-underline-offset: initial; text-underline-position: initial; touch-action: initial; transform: initial; transform-box: initial; transform-origin: initial; transform-style: initial; transition: initial; user-select: initial; vector-effect: initial; vertical-align: initial; visibility: initial; -webkit-app-region: initial; border-spacing: initial; -webkit-border-image: initial; -webkit-box-align: initial; -webkit-box-decoration-break: initial; -webkit-box-direction: initial; -webkit-box-flex: initial; -webkit-box-ordinal-group: initial; -webkit-box-orient: initial; -webkit-box-pack: initial; -webkit-box-reflect: initial; -webkit-highlight: initial; -webkit-hyphenate-character: initial; -webkit-line-break: initial; -webkit-line-clamp: initial; -webkit-mask-box-image: initial; -webkit-mask: initial; -webkit-mask-composite: initial; -webkit-perspective-origin-x: initial; -webkit-perspective-origin-y: initial; -webkit-print-color-adjust: initial; -webkit-rtl-ordering: initial; -webkit-ruby-position: initial; -webkit-tap-highlight-color: initial; -webkit-text-combine: initial; -webkit-text-decorations-in-effect: initial; -webkit-text-emphasis: initial; -webkit-text-emphasis-position: initial; -webkit-text-fill-color: initial; -webkit-text-security: initial; -webkit-text-stroke: initial; -webkit-transform-origin-x: initial; -webkit-transform-origin-y: initial; -webkit-transform-origin-z: initial; -webkit-user-drag: initial; -webkit-user-modify: initial; white-space: initial; widows: initial; width: initial; will-change: initial; word-break: initial; word-spacing: initial; x: initial; y: initial; z-index: initial;\">&nbsp;</div>\r\n', 'O', 2, 770110),
(248061, '<b>The receiver of the data controls the amount of data that are to be sent by the sender is referred to as ___________</b>', 'O', 2, 830290),
(275481, '<p><strong>What is the output of the following C code if there is no error in stream fp?</strong></p>\r\n\r\n<pre>\r\n<code>#include &lt;stdio.h&gt;    \r\nint main()    \r\n{        \r\n    FILE *fp;        \r\n    fp = fopen(&quot;newfile&quot;, &quot;w&quot;);        \r\n    printf(&quot;%d\\n&quot;, ferror(fp));        \r\n    return 0;    \r\n}</code></pre>\r\n', 'O', 2, 463739),
(284799, 'Delimiting and synchronization of data exchange is provided by __________', 'O', 2, 29532),
(287830, '<b>C99 standard guarantees uniqueness of __________ characters for internal names.</b>', 'O', 2, 462143),
(299307, '<b>The physical layer is concerned with ___________</b>', 'O', 2, 680079),
(303765, '<b>The server program tells its TCP that it is ready to accept a connection. This process is called ___________</b>', 'O', 2, 830290),
(306072, '_____ is used to find and fix bugs in the Java programs.', 'O', 2, 735864),
(310083, '<b>The variables in the triggers are declared using</b>', 'O', 2, 824974),
(311062, '<b>The portion of physical layer that interfaces with the media access control sublayer is called ___________</b>', 'O', 2, 680079),
(312245, '<p><code>SELECT * FROM employee WHERE dept_name=&quot;Comp Sci&quot;;</code></p>\r\n\r\n<p><strong>In the SQL given above there is an error. Identify the error.</strong></p>\r\n\r\n<div class=\"ms-editor-squiggler\" style=\"color: initial; font: initial; font-feature-settings: initial; font-kerning: initial; font-optical-sizing: initial; font-variation-settings: initial; forced-color-adjust: initial; text-orientation: initial; text-rendering: initial; -webkit-font-smoothing: initial; -webkit-locale: initial; -webkit-text-orientation: initial; -webkit-writing-mode: initial; writing-mode: initial; zoom: initial; place-content: initial; place-items: initial; place-self: initial; alignment-baseline: initial; animation: initial; appearance: initial; aspect-ratio: initial; backdrop-filter: initial; backface-visibility: initial; background: initial; background-blend-mode: initial; baseline-shift: initial; block-size: initial; border-block: initial; border: initial; border-radius: initial; border-collapse: initial; border-end-end-radius: initial; border-end-start-radius: initial; border-inline: initial; border-start-end-radius: initial; border-start-start-radius: initial; inset: initial; box-shadow: initial; box-sizing: initial; break-after: initial; break-before: initial; break-inside: initial; buffered-rendering: initial; caption-side: initial; caret-color: initial; clear: initial; clip: initial; clip-path: initial; clip-rule: initial; color-interpolation: initial; color-interpolation-filters: initial; color-rendering: initial; color-scheme: initial; columns: initial; column-fill: initial; gap: initial; column-rule: initial; column-span: initial; contain: initial; contain-intrinsic-size: initial; content: initial; content-visibility: initial; counter-increment: initial; counter-reset: initial; counter-set: initial; cursor: initial; cx: initial; cy: initial; d: initial; display: block; dominant-baseline: initial; empty-cells: initial; fill: initial; fill-opacity: initial; fill-rule: initial; filter: initial; flex: initial; flex-flow: initial; float: initial; flood-color: initial; flood-opacity: initial; grid: initial; grid-area: initial; height: 0px; hyphens: initial; image-orientation: initial; image-rendering: initial; inline-size: initial; inset-block: initial; inset-inline: initial; isolation: initial; letter-spacing: initial; lighting-color: initial; line-break: initial; list-style: initial; margin-block: initial; margin: initial; margin-inline: initial; marker: initial; mask: initial; mask-type: initial; max-block-size: initial; max-height: initial; max-inline-size: initial; max-width: initial; min-block-size: initial; min-height: initial; min-inline-size: initial; min-width: initial; mix-blend-mode: initial; object-fit: initial; object-position: initial; offset: initial; opacity: initial; order: initial; origin-trial-test-property: initial; orphans: initial; outline: initial; outline-offset: initial; overflow-anchor: initial; overflow-wrap: initial; overflow: initial; overscroll-behavior-block: initial; overscroll-behavior-inline: initial; overscroll-behavior: initial; padding-block: initial; padding: initial; padding-inline: initial; page: initial; page-orientation: initial; paint-order: initial; perspective: initial; perspective-origin: initial; pointer-events: initial; position: initial; quotes: initial; r: initial; resize: initial; ruby-position: initial; rx: initial; ry: initial; scroll-behavior: initial; scroll-margin-block: initial; scroll-margin: initial; scroll-margin-inline: initial; scroll-padding-block: initial; scroll-padding: initial; scroll-padding-inline: initial; scroll-snap-align: initial; scroll-snap-stop: initial; scroll-snap-type: initial; shape-image-threshold: initial; shape-margin: initial; shape-outside: initial; shape-rendering: initial; size: initial; speak: initial; stop-color: initial; stop-opacity: initial; stroke: initial; stroke-dasharray: initial; stroke-dashoffset: initial; stroke-linecap: initial; stroke-linejoin: initial; stroke-miterlimit: initial; stroke-opacity: initial; stroke-width: initial; tab-size: initial; table-layout: initial; text-align: initial; text-align-last: initial; text-anchor: initial; text-combine-upright: initial; text-decoration: initial; text-decoration-skip-ink: initial; text-indent: initial; text-overflow: initial; text-shadow: initial; text-size-adjust: initial; text-transform: initial; text-underline-offset: initial; text-underline-position: initial; touch-action: initial; transform: initial; transform-box: initial; transform-origin: initial; transform-style: initial; transition: initial; user-select: initial; vector-effect: initial; vertical-align: initial; visibility: initial; -webkit-app-region: initial; border-spacing: initial; -webkit-border-image: initial; -webkit-box-align: initial; -webkit-box-decoration-break: initial; -webkit-box-direction: initial; -webkit-box-flex: initial; -webkit-box-ordinal-group: initial; -webkit-box-orient: initial; -webkit-box-pack: initial; -webkit-box-reflect: initial; -webkit-highlight: initial; -webkit-hyphenate-character: initial; -webkit-line-break: initial; -webkit-line-clamp: initial; -webkit-mask-box-image: initial; -webkit-mask: initial; -webkit-mask-composite: initial; -webkit-perspective-origin-x: initial; -webkit-perspective-origin-y: initial; -webkit-print-color-adjust: initial; -webkit-rtl-ordering: initial; -webkit-ruby-position: initial; -webkit-tap-highlight-color: initial; -webkit-text-combine: initial; -webkit-text-decorations-in-effect: initial; -webkit-text-emphasis: initial; -webkit-text-emphasis-position: initial; -webkit-text-fill-color: initial; -webkit-text-security: initial; -webkit-text-stroke: initial; -webkit-transform-origin-x: initial; -webkit-transform-origin-y: initial; -webkit-transform-origin-z: initial; -webkit-user-drag: initial; -webkit-user-modify: initial; white-space: initial; widows: initial; width: initial; will-change: initial; word-break: initial; word-spacing: initial; x: initial; y: initial; z-index: initial;\">&nbsp;</div>\r\n', 'O', 2, 770110),
(314646, '<b>The URL Connection class can be used to read and write data to the specified resource that is referred by the URL.</b>', 'O', 2, 131661),
(321478, '<p><code>SELECT name ____ instructor name, course id<br />\r\nFROM instructor, teaches<br />\r\nWHERE instructor.ID= teaches.ID;</code></p>\r\n\r\n<p><strong>Which keyword must be used here to rename the field name?</strong></p>\r\n', 'O', 2, 770110),
(329936, '<b>What are the after triggers?</b>', 'O', 2, 824974),
(342795, '<b>A malicious attacker sends a large number of SYNC segments to a server, pretending that each of them is coming from a different client by faking the source IP address in the datagram. Which type of attack is being performed in this situation?</b>', 'O', 2, 830290),
(343355, '<p><strong>Explain the following with an&nbsp;example for each:-</strong></p>\r\n\r\n<ol>\r\n	<li>Divide by zero error in C</li>\r\n	<li>No such file or directory</li>\r\n	<li>Semantic Error</li>\r\n	<li>Syntax error&nbsp;</li>\r\n	<li>Use of EXIT_SUCCESS ,EXIT_FAILURE to deal with errors</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div class=\"ms-editor-squiggler\" style=\"color: initial; font: initial; font-feature-settings: initial; font-kerning: initial; font-optical-sizing: initial; font-variation-settings: initial; forced-color-adjust: initial; text-orientation: initial; text-rendering: initial; -webkit-font-smoothing: initial; -webkit-locale: initial; -webkit-text-orientation: initial; -webkit-writing-mode: initial; writing-mode: initial; zoom: initial; place-content: initial; place-items: initial; place-self: initial; alignment-baseline: initial; animation: initial; appearance: initial; aspect-ratio: initial; backdrop-filter: initial; backface-visibility: initial; background: initial; background-blend-mode: initial; baseline-shift: initial; block-size: initial; border-block: initial; border: initial; border-radius: initial; border-collapse: initial; border-end-end-radius: initial; border-end-start-radius: initial; border-inline: initial; border-start-end-radius: initial; border-start-start-radius: initial; inset: initial; box-shadow: initial; box-sizing: initial; break-after: initial; break-before: initial; break-inside: initial; buffered-rendering: initial; caption-side: initial; caret-color: initial; clear: initial; clip: initial; clip-path: initial; clip-rule: initial; color-interpolation: initial; color-interpolation-filters: initial; color-rendering: initial; color-scheme: initial; columns: initial; column-fill: initial; gap: initial; column-rule: initial; column-span: initial; contain: initial; contain-intrinsic-size: initial; content: initial; content-visibility: initial; counter-increment: initial; counter-reset: initial; counter-set: initial; cursor: initial; cx: initial; cy: initial; d: initial; display: block; dominant-baseline: initial; empty-cells: initial; fill: initial; fill-opacity: initial; fill-rule: initial; filter: initial; flex: initial; flex-flow: initial; float: initial; flood-color: initial; flood-opacity: initial; grid: initial; grid-area: initial; height: 0px; hyphens: initial; image-orientation: initial; image-rendering: initial; inline-size: initial; inset-block: initial; inset-inline: initial; isolation: initial; letter-spacing: initial; lighting-color: initial; line-break: initial; list-style: initial; margin-block: initial; margin: initial; margin-inline: initial; marker: initial; mask: initial; mask-type: initial; max-block-size: initial; max-height: initial; max-inline-size: initial; max-width: initial; min-block-size: initial; min-height: initial; min-inline-size: initial; min-width: initial; mix-blend-mode: initial; object-fit: initial; object-position: initial; offset: initial; opacity: initial; order: initial; origin-trial-test-property: initial; orphans: initial; outline: initial; outline-offset: initial; overflow-anchor: initial; overflow-wrap: initial; overflow: initial; overscroll-behavior-block: initial; overscroll-behavior-inline: initial; overscroll-behavior: initial; padding-block: initial; padding: initial; padding-inline: initial; page: initial; page-orientation: initial; paint-order: initial; perspective: initial; perspective-origin: initial; pointer-events: initial; position: initial; quotes: initial; r: initial; resize: initial; ruby-position: initial; rx: initial; ry: initial; scroll-behavior: initial; scroll-margin-block: initial; scroll-margin: initial; scroll-margin-inline: initial; scroll-padding-block: initial; scroll-padding: initial; scroll-padding-inline: initial; scroll-snap-align: initial; scroll-snap-stop: initial; scroll-snap-type: initial; shape-image-threshold: initial; shape-margin: initial; shape-outside: initial; shape-rendering: initial; size: initial; speak: initial; stop-color: initial; stop-opacity: initial; stroke: initial; stroke-dasharray: initial; stroke-dashoffset: initial; stroke-linecap: initial; stroke-linejoin: initial; stroke-miterlimit: initial; stroke-opacity: initial; stroke-width: initial; tab-size: initial; table-layout: initial; text-align: initial; text-align-last: initial; text-anchor: initial; text-combine-upright: initial; text-decoration: initial; text-decoration-skip-ink: initial; text-indent: initial; text-overflow: initial; text-shadow: initial; text-size-adjust: initial; text-transform: initial; text-underline-offset: initial; text-underline-position: initial; touch-action: initial; transform: initial; transform-box: initial; transform-origin: initial; transform-style: initial; transition: initial; user-select: initial; vector-effect: initial; vertical-align: initial; visibility: initial; -webkit-app-region: initial; border-spacing: initial; -webkit-border-image: initial; -webkit-box-align: initial; -webkit-box-decoration-break: initial; -webkit-box-direction: initial; -webkit-box-flex: initial; -webkit-box-ordinal-group: initial; -webkit-box-orient: initial; -webkit-box-pack: initial; -webkit-box-reflect: initial; -webkit-highlight: initial; -webkit-hyphenate-character: initial; -webkit-line-break: initial; -webkit-line-clamp: initial; -webkit-mask-box-image: initial; -webkit-mask: initial; -webkit-mask-composite: initial; -webkit-perspective-origin-x: initial; -webkit-perspective-origin-y: initial; -webkit-print-color-adjust: initial; -webkit-rtl-ordering: initial; -webkit-ruby-position: initial; -webkit-tap-highlight-color: initial; -webkit-text-combine: initial; -webkit-text-decorations-in-effect: initial; -webkit-text-emphasis: initial; -webkit-text-emphasis-position: initial; -webkit-text-fill-color: initial; -webkit-text-security: initial; -webkit-text-stroke: initial; -webkit-transform-origin-x: initial; -webkit-transform-origin-y: initial; -webkit-transform-origin-z: initial; -webkit-user-drag: initial; -webkit-user-modify: initial; white-space: initial; widows: initial; width: initial; will-change: initial; word-break: initial; word-spacing: initial; x: initial; y: initial; z-index: initial;\">&nbsp;</div>\r\n', 'S', 5, 463739),
(346381, '<b>Why do variable names beginning with the underscore is not encouraged?</b>', 'O', 2, 462143),
(346741, '<b>Variable name resolution (number of significant characters for the uniqueness of variable) depends on ___________</b>', 'O', 2, 462143),
(350750, 'The number of layers in ISO OSI reference model is __________', 'O', 2, 29532),
(354533, '<p><strong>Enumerate the main responsibilities of the data link layer.</strong></p>\r\n', 'S', 10, 220512),
(361910, '<p><strong>Explain Hamming Code with examples.</strong></p>\r\n', 'S', 10, 220512),
(368558, 'In OSI model, when data is sent from device A to device B, the 5th layer to receive data at B is _________', 'O', 2, 29532),
(387870, '<b>The flush () method of Print Stream class flushes any un-cleared buffers in the memory.</b>', 'O', 2, 131661),
(392017, '<b>Datagram is basically just a piece of information but there is no guarantee of its content, arrival or arrival time.</b>', 'O', 2, 131661),
(395540, '<b>Which transmission media provides the highest transmission speed in a network?</b>', 'O', 2, 680079),
(400765, 'What is the return type of the hashCode() method in the Object class?', 'O', 2, 735864),
(409975, '<b>The physical layer translates logical communication requests from the ______ into hardware specific operations.</b>', 'O', 2, 680079),
(416969, '<b>The client in socket programming must know which information?</b>', 'O', 2, 131661),
(421285, '<b>Suppose list1 is [2445,133,12454,123], what is max(list1)?</b>', 'O', 2, 951153),
(433679, '<b>What does the java.net.InetAddress class represent?</b>', 'O', 2, 131661),
(450480, '<p><strong>Predict the output of the following Java program:</strong></p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p><code>class</code> <code>Test { </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>public</code> <code>static</code> <code>void</code> <code>main(String[] args) { </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>for</code><code>(</code><code>int</code> <code>i = 0; 0; i++) </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{ </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>System.out.println(</code><code>&quot;Hello&quot;</code><code>); </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>break</code><code>; </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>} </code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>} </code></p>\r\n\r\n			<p><code>} </code></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'O', 2, 944393),
(451234, '<p><strong>Which of the following statements is/are TRUE regarding Java? </strong></p>\r\n\r\n<p>a. Constants that cannot be changed are declared using the &lsquo;static&rsquo; keyword.</p>\r\n\r\n<p>b. A class can only inherit one class but can implement multiple interfaces.</p>\r\n', 'O', 2, 944393),
(451266, '<p><strong>Within main, return expr statement is equivalent to ________</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n', 'O', 2, 463739),
(463942, 'The \\u0021 article referred to as a', 'O', 2, 735864),
(472815, '<b>In Three-Way Handshaking process, the situation where both the TCP’s issue an active open is ___________</b>', 'O', 2, 830290),
(477129, '<b>Which prefixes are available to Oracle triggers?</b>', 'O', 2, 824974),
(488964, '<p><strong>Which data type value is returned by all transcendental math functions?</strong></p>\r\n', 'O', 2, 944393),
(507929, '<b>What are the different in triggers?</b>', 'O', 2, 824974),
(508479, '<b>TCP, FTP, Telnet, SMTP, POP etc. are examples of ___________</b>', 'O', 2, 131661),
(522053, '<b>SYNC flooding attack belongs to a type of security attack known as ___________</b>', 'O', 2, 830290),
(531073, '<b>The physical layer provides __________</b>', 'O', 2, 680079),
(534052, '<b>Suppose list1 is [1, 5, 9], what is sum(list1)?</b>', 'O', 2, 951153),
(540175, '<b>Which classes are used for connection-less socket programming?</b>', 'O', 2, 131661),
(553533, '<p><strong>Explain&nbsp;errno, perror(), and strerror() used in Error handling in C.</strong></p>\r\n\r\n<div class=\"ms-editor-squiggler\" style=\"color: initial; font: initial; font-feature-settings: initial; font-kerning: initial; font-optical-sizing: initial; font-variation-settings: initial; forced-color-adjust: initial; text-orientation: initial; text-rendering: initial; -webkit-font-smoothing: initial; -webkit-locale: initial; -webkit-text-orientation: initial; -webkit-writing-mode: initial; writing-mode: initial; zoom: initial; place-content: initial; place-items: initial; place-self: initial; alignment-baseline: initial; animation: initial; appearance: initial; aspect-ratio: initial; backdrop-filter: initial; backface-visibility: initial; background: initial; background-blend-mode: initial; baseline-shift: initial; block-size: initial; border-block: initial; border: initial; border-radius: initial; border-collapse: initial; border-end-end-radius: initial; border-end-start-radius: initial; border-inline: initial; border-start-end-radius: initial; border-start-start-radius: initial; inset: initial; box-shadow: initial; box-sizing: initial; break-after: initial; break-before: initial; break-inside: initial; buffered-rendering: initial; caption-side: initial; caret-color: initial; clear: initial; clip: initial; clip-path: initial; clip-rule: initial; color-interpolation: initial; color-interpolation-filters: initial; color-rendering: initial; color-scheme: initial; columns: initial; column-fill: initial; gap: initial; column-rule: initial; column-span: initial; contain: initial; contain-intrinsic-size: initial; content: initial; content-visibility: initial; counter-increment: initial; counter-reset: initial; counter-set: initial; cursor: initial; cx: initial; cy: initial; d: initial; display: block; dominant-baseline: initial; empty-cells: initial; fill: initial; fill-opacity: initial; fill-rule: initial; filter: initial; flex: initial; flex-flow: initial; float: initial; flood-color: initial; flood-opacity: initial; grid: initial; grid-area: initial; height: 0px; hyphens: initial; image-orientation: initial; image-rendering: initial; inline-size: initial; inset-block: initial; inset-inline: initial; isolation: initial; letter-spacing: initial; lighting-color: initial; line-break: initial; list-style: initial; margin-block: initial; margin: initial; margin-inline: initial; marker: initial; mask: initial; mask-type: initial; max-block-size: initial; max-height: initial; max-inline-size: initial; max-width: initial; min-block-size: initial; min-height: initial; min-inline-size: initial; min-width: initial; mix-blend-mode: initial; object-fit: initial; object-position: initial; offset: initial; opacity: initial; order: initial; origin-trial-test-property: initial; orphans: initial; outline: initial; outline-offset: initial; overflow-anchor: initial; overflow-wrap: initial; overflow: initial; overscroll-behavior-block: initial; overscroll-behavior-inline: initial; overscroll-behavior: initial; padding-block: initial; padding: initial; padding-inline: initial; page: initial; page-orientation: initial; paint-order: initial; perspective: initial; perspective-origin: initial; pointer-events: initial; position: initial; quotes: initial; r: initial; resize: initial; ruby-position: initial; rx: initial; ry: initial; scroll-behavior: initial; scroll-margin-block: initial; scroll-margin: initial; scroll-margin-inline: initial; scroll-padding-block: initial; scroll-padding: initial; scroll-padding-inline: initial; scroll-snap-align: initial; scroll-snap-stop: initial; scroll-snap-type: initial; shape-image-threshold: initial; shape-margin: initial; shape-outside: initial; shape-rendering: initial; size: initial; speak: initial; stop-color: initial; stop-opacity: initial; stroke: initial; stroke-dasharray: initial; stroke-dashoffset: initial; stroke-linecap: initial; stroke-linejoin: initial; stroke-miterlimit: initial; stroke-opacity: initial; stroke-width: initial; tab-size: initial; table-layout: initial; text-align: initial; text-align-last: initial; text-anchor: initial; text-combine-upright: initial; text-decoration: initial; text-decoration-skip-ink: initial; text-indent: initial; text-overflow: initial; text-shadow: initial; text-size-adjust: initial; text-transform: initial; text-underline-offset: initial; text-underline-position: initial; touch-action: initial; transform: initial; transform-box: initial; transform-origin: initial; transform-style: initial; transition: initial; user-select: initial; vector-effect: initial; vertical-align: initial; visibility: initial; -webkit-app-region: initial; border-spacing: initial; -webkit-border-image: initial; -webkit-box-align: initial; -webkit-box-decoration-break: initial; -webkit-box-direction: initial; -webkit-box-flex: initial; -webkit-box-ordinal-group: initial; -webkit-box-orient: initial; -webkit-box-pack: initial; -webkit-box-reflect: initial; -webkit-highlight: initial; -webkit-hyphenate-character: initial; -webkit-line-break: initial; -webkit-line-clamp: initial; -webkit-mask-box-image: initial; -webkit-mask: initial; -webkit-mask-composite: initial; -webkit-perspective-origin-x: initial; -webkit-perspective-origin-y: initial; -webkit-print-color-adjust: initial; -webkit-rtl-ordering: initial; -webkit-ruby-position: initial; -webkit-tap-highlight-color: initial; -webkit-text-combine: initial; -webkit-text-decorations-in-effect: initial; -webkit-text-emphasis: initial; -webkit-text-emphasis-position: initial; -webkit-text-fill-color: initial; -webkit-text-security: initial; -webkit-text-stroke: initial; -webkit-transform-origin-x: initial; -webkit-transform-origin-y: initial; -webkit-transform-origin-z: initial; -webkit-user-drag: initial; -webkit-user-modify: initial; white-space: initial; widows: initial; width: initial; will-change: initial; word-break: initial; word-spacing: initial; x: initial; y: initial; z-index: initial;\">&nbsp;</div>\r\n', 'S', 5, 463739),
(556286, '<b>The physical layer is responsible for __________</b>', 'O', 2, 680079),
(556472, '<b>Triggers are supported in</b>', 'O', 2, 824974),
(580911, '<p>What is the return type of function id?</p>\r\n', 'O', 2, 891530);
INSERT INTO `question` (`question_id`, `question_description`, `question_type`, `marks`, `exam_code`) VALUES
(596767, '<p><strong>Guess the correct output of the following code?</strong></p>\r\n\r\n<pre>\r\nstr1 = &quot;PYnative&quot;\r\nprint(str1[1:4], str1[:5], str1[4:], str1[0:-1], str1[:-1])</pre>\r\n\r\n<div class=\"ms-editor-squiggler\" style=\"color: initial; font: initial; font-feature-settings: initial; font-kerning: initial; font-optical-sizing: initial; font-variation-settings: initial; forced-color-adjust: initial; text-orientation: initial; text-rendering: initial; -webkit-font-smoothing: initial; -webkit-locale: initial; -webkit-text-orientation: initial; -webkit-writing-mode: initial; writing-mode: initial; zoom: initial; place-content: initial; place-items: initial; place-self: initial; alignment-baseline: initial; animation: initial; appearance: initial; aspect-ratio: initial; backdrop-filter: initial; backface-visibility: initial; background: initial; background-blend-mode: initial; baseline-shift: initial; block-size: initial; border-block: initial; border: initial; border-radius: initial; border-collapse: initial; border-end-end-radius: initial; border-end-start-radius: initial; border-inline: initial; border-start-end-radius: initial; border-start-start-radius: initial; inset: initial; box-shadow: initial; box-sizing: initial; break-after: initial; break-before: initial; break-inside: initial; buffered-rendering: initial; caption-side: initial; caret-color: initial; clear: initial; clip: initial; clip-path: initial; clip-rule: initial; color-interpolation: initial; color-interpolation-filters: initial; color-rendering: initial; color-scheme: initial; columns: initial; column-fill: initial; gap: initial; column-rule: initial; column-span: initial; contain: initial; contain-intrinsic-size: initial; content: initial; content-visibility: initial; counter-increment: initial; counter-reset: initial; counter-set: initial; cursor: initial; cx: initial; cy: initial; d: initial; display: block; dominant-baseline: initial; empty-cells: initial; fill: initial; fill-opacity: initial; fill-rule: initial; filter: initial; flex: initial; flex-flow: initial; float: initial; flood-color: initial; flood-opacity: initial; grid: initial; grid-area: initial; height: 0px; hyphens: initial; image-orientation: initial; image-rendering: initial; inline-size: initial; inset-block: initial; inset-inline: initial; isolation: initial; letter-spacing: initial; lighting-color: initial; line-break: initial; list-style: initial; margin-block: initial; margin: initial; margin-inline: initial; marker: initial; mask: initial; mask-type: initial; max-block-size: initial; max-height: initial; max-inline-size: initial; max-width: initial; min-block-size: initial; min-height: initial; min-inline-size: initial; min-width: initial; mix-blend-mode: initial; object-fit: initial; object-position: initial; offset: initial; opacity: initial; order: initial; origin-trial-test-property: initial; orphans: initial; outline: initial; outline-offset: initial; overflow-anchor: initial; overflow-wrap: initial; overflow: initial; overscroll-behavior-block: initial; overscroll-behavior-inline: initial; overscroll-behavior: initial; padding-block: initial; padding: initial; padding-inline: initial; page: initial; page-orientation: initial; paint-order: initial; perspective: initial; perspective-origin: initial; pointer-events: initial; position: initial; quotes: initial; r: initial; resize: initial; ruby-position: initial; rx: initial; ry: initial; scroll-behavior: initial; scroll-margin-block: initial; scroll-margin: initial; scroll-margin-inline: initial; scroll-padding-block: initial; scroll-padding: initial; scroll-padding-inline: initial; scroll-snap-align: initial; scroll-snap-stop: initial; scroll-snap-type: initial; shape-image-threshold: initial; shape-margin: initial; shape-outside: initial; shape-rendering: initial; size: initial; speak: initial; stop-color: initial; stop-opacity: initial; stroke: initial; stroke-dasharray: initial; stroke-dashoffset: initial; stroke-linecap: initial; stroke-linejoin: initial; stroke-miterlimit: initial; stroke-opacity: initial; stroke-width: initial; tab-size: initial; table-layout: initial; text-align: initial; text-align-last: initial; text-anchor: initial; text-combine-upright: initial; text-decoration: initial; text-decoration-skip-ink: initial; text-indent: initial; text-overflow: initial; text-shadow: initial; text-size-adjust: initial; text-transform: initial; text-underline-offset: initial; text-underline-position: initial; touch-action: initial; transform: initial; transform-box: initial; transform-origin: initial; transform-style: initial; transition: initial; user-select: initial; vector-effect: initial; vertical-align: initial; visibility: initial; -webkit-app-region: initial; border-spacing: initial; -webkit-border-image: initial; -webkit-box-align: initial; -webkit-box-decoration-break: initial; -webkit-box-direction: initial; -webkit-box-flex: initial; -webkit-box-ordinal-group: initial; -webkit-box-orient: initial; -webkit-box-pack: initial; -webkit-box-reflect: initial; -webkit-highlight: initial; -webkit-hyphenate-character: initial; -webkit-line-break: initial; -webkit-line-clamp: initial; -webkit-mask-box-image: initial; -webkit-mask: initial; -webkit-mask-composite: initial; -webkit-perspective-origin-x: initial; -webkit-perspective-origin-y: initial; -webkit-print-color-adjust: initial; -webkit-rtl-ordering: initial; -webkit-ruby-position: initial; -webkit-tap-highlight-color: initial; -webkit-text-combine: initial; -webkit-text-decorations-in-effect: initial; -webkit-text-emphasis: initial; -webkit-text-emphasis-position: initial; -webkit-text-fill-color: initial; -webkit-text-security: initial; -webkit-text-stroke: initial; -webkit-transform-origin-x: initial; -webkit-transform-origin-y: initial; -webkit-transform-origin-z: initial; -webkit-user-drag: initial; -webkit-user-modify: initial; white-space: initial; widows: initial; width: initial; will-change: initial; word-break: initial; word-spacing: initial; x: initial; y: initial; z-index: initial;\">&nbsp;</div>\r\n', 'O', 2, 751248),
(597274, '<b>To shuffle the list(say list1) what function do we use?</b>', 'O', 2, 951153),
(606065, 'How many layers are present in the Internet protocol stack (TCP/IP model)?', 'O', 2, 29532),
(609450, '<b>Suppose list1 is [2, 33, 222, 14, 25], What is list1[:-1]?</b>', 'O', 2, 951153),
(614148, '<b>Which constructor of Datagram Socket class is used to create a datagram socket and binds it with the given Port Number?</b>', 'O', 2, 131661),
(643653, '<pre>\r\n<code>SELECT name\r\nFROM instructor\r\nWHERE dept name = &rsquo;Physics&rsquo;\r\nORDER BY name;</code></pre>\r\n\r\n<p><strong>By default, the order by clause lists items in ______ order.</strong></p>\r\n', 'O', 2, 770110),
(647274, '<p><strong>&#39;_ _ _&#39;&nbsp;matches any string of ______ three characters. &#39;_ _ _ %&#39;&nbsp;matches any string of at ______ three characters.</strong></p>\r\n', 'O', 2, 770110),
(666257, '<b>Suppose list1 is [3, 5, 25, 1, 3], what is min(list1)?</b>', 'O', 2, 951153),
(690226, 'Application layer is implemented in ____________', 'O', 2, 29532),
(700707, '<p><strong>Predict the output of the following program.</strong></p>\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p><code>class</code> <code>Test</code></p>\r\n\r\n			<p><code>{</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>public</code> <code>static</code> <code>void</code> <code>main(String[] args)</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Double object = </code><code>new</code> <code>Double(</code><code>&quot;2.4&quot;</code><code>);</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>int</code> <code>a = object.intValue();</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>byte</code> <code>b = object.byteValue();</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>float</code> <code>d = object.floatValue();</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>double</code> <code>c = object.doubleValue();</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>System.out.println(a + b + c + d );</code></p>\r\n\r\n			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p>\r\n\r\n			<p><code>}</code></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'O', 2, 944393),
(719861, '<b>The sizes of source and destination port address in TCP header are ___________ respectively.</b>', 'O', 2, 830290),
(746152, '<b>Suppose list1 is [2, 33, 222, 14, 25], What is list1[-1]?</b>', 'O', 2, 951153),
(746651, 'Which of the following is not a Java features?', 'O', 2, 735864),
(759722, '<b>Suppose listExample is [‘h’,’e’,’l’,’l’,’o’], what is len(listExample)?</b>', 'O', 2, 951153),
(821349, '<b>The default extension for an Oracle SQL*Plus file is:</b>', 'O', 2, 824974),
(834444, '<p>Which of these is not a core data type?</p>\r\n', 'O', 2, 891530),
(846215, '<b>Which methods are commonly used in Server Socket class?</b>', 'O', 2, 131661),
(848850, '<p><strong>Explain String manipulation&nbsp;using built-in functions&nbsp;of&nbsp;Python with examples.</strong></p>\r\n', 'S', 10, 751248),
(852716, '<b>In Inet Address class, which method returns the host name of the IP Address?</b>', 'O', 2, 131661),
(885871, '<b>What allows TCP to detect lost segments and in turn recover from that loss?</b>', 'O', 2, 830290),
(898857, '<b>A __________ is a special kind of a store procedure that executes in response to certain action on the table like insertion, deletion or updation of data.</b>', 'O', 2, 824974),
(920411, '<p><strong>stderr is similar to?</strong></p>\r\n', 'O', 2, 463739),
(951343, '<b>What is the output when we execute list(“hello”)?</b>', 'O', 2, 951153),
(965155, '<p>Given a function that does not return any value, what value is thrown by default when executed in shell.</p>\r\n', 'O', 2, 891530),
(968673, '<b>C99 standard guarantees uniqueness of ___________ characters for external names.</b>', 'O', 2, 462143),
(970237, '<b>Wireless transmission of signals can be done via ___________</b>', 'O', 2, 680079),
(987254, '<p><strong>What is the output of:</strong></p>\r\n\r\n<p><code>class</code> <code>Main { &nbsp;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;</code><code>public</code> <code>static</code> <code>void</code> <code>main(String args[]) { &nbsp; &nbsp; &nbsp;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>int</code> <code>t; &nbsp; &nbsp; &nbsp;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>System.out.println(t); </code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>} &nbsp; </code></p>\r\n\r\n<p><code>}</code></p>\r\n', 'O', 2, 944393),
(991863, '<p><strong>What will be the output of the following C code?</strong></p>\r\n\r\n<pre>\r\n<code>#include &lt;stdio.h&gt;    \r\nint main()    \r\n{        \r\n    char buf[12];        \r\n    stderr = stdin;        \r\n    fscanf(stderr, &quot;%s&quot;, buf);        \r\n    printf(&quot;%s\\n&quot;, buf);    \r\n}</code></pre>\r\n\r\n<div class=\"ms-editor-squiggler\" style=\"color: initial; font: initial; font-feature-settings: initial; font-kerning: initial; font-optical-sizing: initial; font-variation-settings: initial; forced-color-adjust: initial; text-orientation: initial; text-rendering: initial; -webkit-font-smoothing: initial; -webkit-locale: initial; -webkit-text-orientation: initial; -webkit-writing-mode: initial; writing-mode: initial; zoom: initial; place-content: initial; place-items: initial; place-self: initial; alignment-baseline: initial; animation: initial; appearance: initial; aspect-ratio: initial; backdrop-filter: initial; backface-visibility: initial; background: initial; background-blend-mode: initial; baseline-shift: initial; block-size: initial; border-block: initial; border: initial; border-radius: initial; border-collapse: initial; border-end-end-radius: initial; border-end-start-radius: initial; border-inline: initial; border-start-end-radius: initial; border-start-start-radius: initial; inset: initial; box-shadow: initial; box-sizing: initial; break-after: initial; break-before: initial; break-inside: initial; buffered-rendering: initial; caption-side: initial; caret-color: initial; clear: initial; clip: initial; clip-path: initial; clip-rule: initial; color-interpolation: initial; color-interpolation-filters: initial; color-rendering: initial; color-scheme: initial; columns: initial; column-fill: initial; gap: initial; column-rule: initial; column-span: initial; contain: initial; contain-intrinsic-size: initial; content: initial; content-visibility: initial; counter-increment: initial; counter-reset: initial; counter-set: initial; cursor: initial; cx: initial; cy: initial; d: initial; display: block; dominant-baseline: initial; empty-cells: initial; fill: initial; fill-opacity: initial; fill-rule: initial; filter: initial; flex: initial; flex-flow: initial; float: initial; flood-color: initial; flood-opacity: initial; grid: initial; grid-area: initial; height: 0px; hyphens: initial; image-orientation: initial; image-rendering: initial; inline-size: initial; inset-block: initial; inset-inline: initial; isolation: initial; letter-spacing: initial; lighting-color: initial; line-break: initial; list-style: initial; margin-block: initial; margin: initial; margin-inline: initial; marker: initial; mask: initial; mask-type: initial; max-block-size: initial; max-height: initial; max-inline-size: initial; max-width: initial; min-block-size: initial; min-height: initial; min-inline-size: initial; min-width: initial; mix-blend-mode: initial; object-fit: initial; object-position: initial; offset: initial; opacity: initial; order: initial; origin-trial-test-property: initial; orphans: initial; outline: initial; outline-offset: initial; overflow-anchor: initial; overflow-wrap: initial; overflow: initial; overscroll-behavior-block: initial; overscroll-behavior-inline: initial; overscroll-behavior: initial; padding-block: initial; padding: initial; padding-inline: initial; page: initial; page-orientation: initial; paint-order: initial; perspective: initial; perspective-origin: initial; pointer-events: initial; position: initial; quotes: initial; r: initial; resize: initial; ruby-position: initial; rx: initial; ry: initial; scroll-behavior: initial; scroll-margin-block: initial; scroll-margin: initial; scroll-margin-inline: initial; scroll-padding-block: initial; scroll-padding: initial; scroll-padding-inline: initial; scroll-snap-align: initial; scroll-snap-stop: initial; scroll-snap-type: initial; shape-image-threshold: initial; shape-margin: initial; shape-outside: initial; shape-rendering: initial; size: initial; speak: initial; stop-color: initial; stop-opacity: initial; stroke: initial; stroke-dasharray: initial; stroke-dashoffset: initial; stroke-linecap: initial; stroke-linejoin: initial; stroke-miterlimit: initial; stroke-opacity: initial; stroke-width: initial; tab-size: initial; table-layout: initial; text-align: initial; text-align-last: initial; text-anchor: initial; text-combine-upright: initial; text-decoration: initial; text-decoration-skip-ink: initial; text-indent: initial; text-overflow: initial; text-shadow: initial; text-size-adjust: initial; text-transform: initial; text-underline-offset: initial; text-underline-position: initial; touch-action: initial; transform: initial; transform-box: initial; transform-origin: initial; transform-style: initial; transition: initial; user-select: initial; vector-effect: initial; vertical-align: initial; visibility: initial; -webkit-app-region: initial; border-spacing: initial; -webkit-border-image: initial; -webkit-box-align: initial; -webkit-box-decoration-break: initial; -webkit-box-direction: initial; -webkit-box-flex: initial; -webkit-box-ordinal-group: initial; -webkit-box-orient: initial; -webkit-box-pack: initial; -webkit-box-reflect: initial; -webkit-highlight: initial; -webkit-hyphenate-character: initial; -webkit-line-break: initial; -webkit-line-clamp: initial; -webkit-mask-box-image: initial; -webkit-mask: initial; -webkit-mask-composite: initial; -webkit-perspective-origin-x: initial; -webkit-perspective-origin-y: initial; -webkit-print-color-adjust: initial; -webkit-rtl-ordering: initial; -webkit-ruby-position: initial; -webkit-tap-highlight-color: initial; -webkit-text-combine: initial; -webkit-text-decorations-in-effect: initial; -webkit-text-emphasis: initial; -webkit-text-emphasis-position: initial; -webkit-text-fill-color: initial; -webkit-text-security: initial; -webkit-text-stroke: initial; -webkit-transform-origin-x: initial; -webkit-transform-origin-y: initial; -webkit-transform-origin-z: initial; -webkit-user-drag: initial; -webkit-user-modify: initial; white-space: initial; widows: initial; width: initial; will-change: initial; word-break: initial; word-spacing: initial; x: initial; y: initial; z-index: initial;\">&nbsp;</div>\r\n', 'O', 2, 463739);

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
(2430, 1, 744923),
(6117, 15, 140968),
(21916, 6, 813895),
(22533, 10, 15927),
(27697, 1, 486733),
(29391, 11, 639562),
(30877, 6, 639562),
(37149, 13, 855117),
(52075, 13, 679520),
(53726, 15, 855723),
(65502, 1, 648123),
(72862, 1, 99645),
(81624, 11, 475499),
(88173, 13, 786245),
(94366, 1, 431678),
(100115, 14, 734780),
(109549, 6, 745576),
(110677, 14, 375186),
(127173, 6, 265407),
(131359, 10, 360054),
(132783, 11, 76187),
(140790, 6, 620230),
(143872, 11, 734780),
(145921, 10, 400204),
(151079, 14, 576887),
(156677, 15, 25377),
(168001, 13, 721192),
(184035, 14, 675373),
(186587, 1, 664842),
(201472, 6, 724266),
(208755, 6, 106671),
(210588, 1, 906844),
(219828, 13, 744923),
(223863, 13, 108477),
(228047, 13, 579319),
(228740, 6, 677432),
(238939, 11, 360054),
(245842, 6, 314605),
(249454, 1, 561619),
(260390, 6, 49153),
(261272, 1, 786245),
(268535, 6, 785987),
(268996, 6, 140728),
(272485, 10, 475499),
(275938, 1, 140728),
(287347, 15, 289928),
(299758, 10, 579319),
(318604, 14, 495890),
(321673, 13, 140728),
(323446, 13, 475499),
(325968, 15, 653775),
(366991, 1, 19147),
(387182, 1, 15927),
(397588, 13, 486733),
(398833, 1, 721192),
(406058, 10, 639562),
(412026, 15, 433710),
(429233, 6, 229795),
(446140, 10, 785987),
(448492, 6, 294592),
(451206, 6, 83865),
(454982, 1, 549768),
(462817, 6, 789825),
(478019, 6, 428411),
(493381, 6, 156078),
(495711, 6, 496995),
(497202, 11, 785987),
(509435, 13, 506027),
(515027, 14, 865115),
(515405, 1, 83865),
(518151, 10, 76187),
(531333, 6, 580169),
(532982, 6, 744923),
(533015, 6, 648123),
(536454, 1, 538114),
(538934, 11, 576887),
(542943, 1, 770378),
(544402, 13, 664842),
(544866, 15, 4921),
(552065, 1, 371504),
(552370, 1, 554248),
(596820, 1, 469034),
(602872, 15, 903267),
(604610, 6, 15927),
(605224, 1, 679520),
(613763, 1, 106671),
(618745, 11, 18657),
(620681, 11, 484567),
(633469, 1, 820458),
(635086, 6, 554248),
(636698, 6, 735425),
(640601, 13, 19147),
(644285, 6, 360054),
(657130, 11, 579319),
(665756, 1, 314605),
(669314, 11, 400204),
(678509, 13, 743299),
(689654, 1, 893208),
(692301, 13, 906844),
(703850, 15, 417176),
(709252, 6, 475499),
(715425, 14, 18657),
(723175, 6, 600292),
(725455, 1, 400204),
(735346, 15, 672392),
(740354, 13, 360054),
(742613, 10, 652305),
(765413, 11, 788663),
(779948, 14, 341200),
(780775, 13, 785987),
(791278, 14, 484567),
(795937, 10, 788663),
(796068, 15, 304858),
(796522, 1, 109899),
(797650, 13, 554248),
(805197, 6, 19147),
(807582, 11, 15927),
(811403, 15, 541845),
(815612, 15, 459612),
(854683, 1, 635386),
(860182, 6, 579319),
(870774, 13, 639562),
(874958, 6, 400204),
(891783, 1, 565571),
(893778, 13, 83865),
(902430, 1, 108477),
(926963, 15, 976313),
(928879, 1, 677432),
(942277, 6, 486733),
(942985, 6, 961134),
(953949, 11, 677432),
(963173, 14, 358295),
(969995, 13, 648123),
(980184, 11, 539630),
(983370, 1, 91773),
(987149, 15, 308377),
(991772, 13, 109899);

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
(266310, 'Microprocessors', 'Learn Microprocessors'),
(354570, 'Computer Networks', 'Learn computer networking'),
(394755, 'C', 'Learn C'),
(482635, 'DBMS', 'Learn Database Management Systems'),
(523916, 'HTML', 'Learn HTML'),
(685797, 'Automata Theory', 'Learn Automata Theory'),
(687680, 'Discrete Mathematics', 'Learn Discrete Mathematics'),
(933084, 'Operating Systems', 'Learn Operating Systems');

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
(83149, '1617895929_Error_handling_in_C-_2.pdf', 343355),
(537184, '1621099676_Core_Data_Type.pdf', 157641),
(636284, '1617643180_Data_link_layer.pdf', 354533),
(693939, '1617895595_Error_handling_in_C-_1.pdf', 553533),
(702075, '1617685351_Python_String_Manipulation.pdf', 848850),
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
(8878, '1617956599_Data_link_layer.pdf', 354533, 15),
(108325, '1617644131_Data_link_layer.pdf', 354533, 1),
(147865, '1617956599_Hamming_Code.pdf', 361910, 15),
(151207, '1617957043_Hamming_Code.pdf', 361910, 14),
(333375, '1617957043_Data_link_layer.pdf', 354533, 14),
(434330, '1617644131_Hamming_Code.pdf', 361910, 1),
(553361, '1617957156_Data_link_layer.pdf', 354533, 6),
(625046, '1617957156_Hamming_Code.pdf', 361910, 6),
(769128, '1617956794_Error_handling_in_C-_2.pdf', 343355, 15),
(790301, '1617957108_Python_String_Manipulation.pdf', 848850, 14),
(981340, '1617956794_Error_handling_in_C-_1.pdf', 553533, 15);

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
  `mobile_number` varchar(20) DEFAULT NULL,
  `role_id` enum('0','1') NOT NULL COMMENT '0-Staff, 1-Student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `fname`, `lname`, `mobile_number`, `role_id`) VALUES
(1, '2019krishna.v@ves.ac.in', 'pbkdf2:sha256:150000$F93Nw635$3390adb3f791292d8599b0922f78433378fe7820d52c989f423f27c544727fb6', 'Krishnasubramaniam', 'V', NULL, '1'),
(3, 'vkrishna2090@gmail.com', 'pbkdf2:sha256:150000$F93Nw635$3390adb3f791292d8599b0922f78433378fe7820d52c989f423f27c544727fb6', 'Krishna ', 'V', '8779949739', '0'),
(6, '2019ninad.rao@ves.ac.in', 'pbkdf2:sha256:150000$F93Nw635$3390adb3f791292d8599b0922f78433378fe7820d52c989f423f27c544727fb6', 'Ninad', 'Rao', '8356852631', '1'),
(9, 'ninadsrao@gmail.com', 'pbkdf2:sha256:150000$F93Nw635$3390adb3f791292d8599b0922f78433378fe7820d52c989f423f27c544727fb6', 'Ninad S', 'Rao', '918356852631', '0'),
(10, '2019aamir.ansari@ves.ac.in', 'pbkdf2:sha256:150000$F93Nw635$3390adb3f791292d8599b0922f78433378fe7820d52c989f423f27c544727fb6', 'Aamir', 'Ansari', '8850604991', '1'),
(11, '2019sreekesh.iyer@ves.ac.in', 'pbkdf2:sha256:150000$F93Nw635$3390adb3f791292d8599b0922f78433378fe7820d52c989f423f27c544727fb6', 'Sreekesh', 'Iyer', '7506916922', '1'),
(12, 'd2019shalaka.waghamale@ves.ac.in', 'pbkdf2:sha256:150000$F93Nw635$3390adb3f791292d8599b0922f78433378fe7820d52c989f423f27c544727fb6', 'Shalaka ', 'Waghamale', '9619680468', '1'),
(13, '2019kanaiya.kanabar@ves.ac.in', 'pbkdf2:sha256:150000$F93Nw635$3390adb3f791292d8599b0922f78433378fe7820d52c989f423f27c544727fb6', 'Kanaiya', 'Kanabar', '1234567890', '1'),
(14, '2019jisha.philip@ves.ac.in', 'pbkdf2:sha256:150000$F93Nw635$3390adb3f791292d8599b0922f78433378fe7820d52c989f423f27c544727fb6', 'Jisha Anna', 'Philip', '1234567890', '1'),
(15, '2019isha.gawde@ves.ac.in', 'pbkdf2:sha256:150000$F93Nw635$3390adb3f791292d8599b0922f78433378fe7820d52c989f423f27c544727fb6', 'Isha', 'Gawde', '1234567890', '1');

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
