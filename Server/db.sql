-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 10, 2020 at 07:05 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--
CREATE DATABASE IF NOT EXISTS `school` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `school`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `category` int(11) NOT NULL,
  `answer_1` int(11) NOT NULL,
  `answer_2` int(11) NOT NULL,
  `answer_3` int(11) NOT NULL,
  `answer_4` int(11) NOT NULL,
  `answer_5` int(11) NOT NULL,
  `answer_6` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_1` (`answer_1`),
  KEY `answer_2` (`answer_2`),
  KEY `answer_3` (`answer_3`),
  KEY `answer_4` (`answer_4`),
  KEY `answer_5` (`answer_5`),
  KEY `answer_6` (`answer_6`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `category`, `answer_1`, `answer_2`, `answer_3`, `answer_4`, `answer_5`, `answer_6`) VALUES
(1, 'Are you practical, athletic, straight forward and good with tools and machinery?', 1, 1, 2, 3, 4, 5, 6),
(2, 'Can you fix electrical things, solve mechanical problems and work on automobiles?', 1, 1, 2, 3, 4, 5, 6),
(3, 'Are you inquisitive, analytical, scientific and accurate?', 2, 1, 2, 3, 4, 5, 6),
(4, 'Can you think abstractly, solve math problems, understand physical theories and do complex calculations?', 2, 1, 2, 3, 4, 5, 6),
(5, 'Are you creative, imaginative, innovative and intuitive? ', 3, 1, 2, 3, 4, 5, 6),
(6, 'Can you sketch, draw, paint, play musical instruments and write stories or poetries?', 3, 1, 2, 3, 4, 5, 6),
(7, 'Are you friendly, helpful, understanding and idealistic?', 4, 1, 2, 3, 4, 5, 6),
(8, 'Can you teach or train others, lead a group discussion, plan and supervise an activity?', 4, 1, 2, 3, 4, 5, 6),
(9, 'Are you self-confident, Assertive, Sociable and persuasive?', 5, 1, 2, 3, 4, 5, 6),
(10, 'Can you initiate projects, convince people to do things your way, give talk or speeches and organize events or activates?', 5, 1, 2, 3, 4, 5, 6),
(11, 'Are you well-groomed, numerically inclined, conscientious and efficient?', 6, 1, 2, 3, 4, 5, 6),
(12, 'Can you work well within a system, do a lot of paper work in a short time, keep accurate records, use a computer terminal?', 6, 1, 2, 3, 4, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `question_answers`
--

DROP TABLE IF EXISTS `question_answers`;
CREATE TABLE IF NOT EXISTS `question_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(50) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_answers`
--

INSERT INTO `question_answers` (`id`, `answer`, `value`) VALUES
(1, 'Strongly Disagree', 0),
(2, 'Moderately Disagree', 1),
(3, 'Slightly Disagree', 2),
(4, 'Slightly Agree', 4),
(5, 'Moderately Agree', 6),
(6, 'Strongly Agree', 10);

-- --------------------------------------------------------

--
-- Table structure for table `question_categories`
--

DROP TABLE IF EXISTS `question_categories`;
CREATE TABLE IF NOT EXISTS `question_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_categories`
--

INSERT INTO `question_categories` (`id`, `Category`, `description`) VALUES
(1, 'Realistic', 'You like working mainly with your hands making, equipment and machinery, designing, building, repairing. Subjects to develop your skills English, Maths, Science, Technology, Computing'),
(2, 'Investigative', 'You like to discover and research ideas, investigate and experiment, thinking analytically and logically, computing. Subjects to develop your skills English, Maths, Science, Computing, Technology'),
(3, 'Artistic', 'You like using art, music or drama to express yourself, expressing artistically or physically, communicating by speaking. Subjects to develop your skills English, Social Studies, Music, Drama, Art'),
(4, 'Social', 'You like working with people to teach, train, inform, help, Selling, promoting and Persuading, developing ideas. Subjects to develop your skills English, Maths, Business Studies, Accounting, Economics'),
(5, 'Enterprising', 'You like meeting people, leading, talking to and influencing others, Computing and keyboarding, recording and keeping records Subjects to develop your skills English, Maths, Business, and Studies. '),
(6, 'Conventional', 'You like working indoors and at tasks that involve organizing and being accurate, computing and keyboarding. Subjects to develop your skills English, Maths, Business Studies, Accounting, Economics');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `marks` int(11) DEFAULT NULL,
  `category1` int(11) DEFAULT NULL,
  `category2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category1` (`category1`),
  KEY `category2` (`category2`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `userName`, `email`, `marks`, `category1`, `category2`) VALUES
(1, 'user', 'user', 15, 2, NULL),
(2, 'nimal', 'nimal@nimal.com', NULL, NULL, NULL),
(4, 'kamal', 'kamal@kamal.com', NULL, NULL, NULL),
(5, 'john', 'john', 25, 3, NULL),
(6, 'hashan', 'hashan@gmail.com', 51, 2, NULL),
(7, 'kushantha', 'kushi.charuka@gmail.com', 58, 6, NULL),
(8, 'kushiya', 'kushi@gmail.com', NULL, 6, NULL),
(9, 'nizra', 'nizra@gmail.com', 58, 6, NULL),
(10, 'test', 'test', 33, 3, NULL),
(11, 'fgdfg', 'dfgd', NULL, NULL, NULL),
(12, 'abc', 'hashan@gmail.com', 29, 3, NULL),
(13, 'kushanthaa', 'kushi.charuka@gmail.com', 55, 4, NULL),
(14, 'sa', 'sa', 41, 6, NULL),
(15, 'acs', 'abs@gamail.com', 46, 5, NULL),
(16, 'aaaa', 'hashan@gmail.com', 25, 2, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `Questions_ibfk_1` FOREIGN KEY (`answer_1`) REFERENCES `question_answers` (`id`),
  ADD CONSTRAINT `Questions_ibfk_2` FOREIGN KEY (`answer_2`) REFERENCES `question_answers` (`id`),
  ADD CONSTRAINT `Questions_ibfk_3` FOREIGN KEY (`answer_3`) REFERENCES `question_answers` (`id`),
  ADD CONSTRAINT `Questions_ibfk_4` FOREIGN KEY (`answer_4`) REFERENCES `question_answers` (`id`),
  ADD CONSTRAINT `Questions_ibfk_5` FOREIGN KEY (`answer_5`) REFERENCES `question_answers` (`id`),
  ADD CONSTRAINT `Questions_ibfk_6` FOREIGN KEY (`answer_6`) REFERENCES `question_answers` (`id`),
  ADD CONSTRAINT `Questions_ibfk_7` FOREIGN KEY (`category`) REFERENCES `question_categories` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`category1`) REFERENCES `question_categories` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`category2`) REFERENCES `question_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
