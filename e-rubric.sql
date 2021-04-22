-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2021 at 08:35 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-rubric`
--

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `Lecturername` varchar(50) DEFAULT NULL,
  `LecturerID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`Lecturername`, `LecturerID`) VALUES
('Dr. Lim Bao Ren', 'S001'),
('Dr Lim Wei Han', 'L001'),
('Dr Lim Wei Han', 'L001');

-- --------------------------------------------------------

--
-- Table structure for table `rubric`
--

CREATE TABLE `rubric` (
  `Rubriccriteria0` varchar(50) DEFAULT NULL,
  `Rubriccriteria1` varchar(50) DEFAULT NULL,
  `Rubriccriteria2` varchar(50) DEFAULT NULL,
  `Rubricname` varchar(50) DEFAULT NULL,
  `Rubricperformancedesc0` varchar(200) DEFAULT NULL,
  `Rubricperformancedesc1` varchar(200) DEFAULT NULL,
  `Rubricperformancedesc2` varchar(200) DEFAULT NULL,
  `Rubricperformancedesc3` varchar(200) DEFAULT NULL,
  `Rubricperformancedesc4` varchar(200) DEFAULT NULL,
  `Rubricperformancedesc5` varchar(200) DEFAULT NULL,
  `Rubricperformancedesc6` varchar(200) DEFAULT NULL,
  `Rubricperformancedesc7` varchar(200) DEFAULT NULL,
  `Rubricperformancedesc8` varchar(200) DEFAULT NULL,
  `Rubricperformancerating0` varchar(50) DEFAULT NULL,
  `Rubricperformancerating1` varchar(50) DEFAULT NULL,
  `Rubricperformancerating2` varchar(50) DEFAULT NULL,
  `Subjectcode` varchar(50) DEFAULT NULL,
  `RubricID` varchar(50) NOT NULL,
  `LecturerID` varchar(50) DEFAULT NULL,
  `StudentID` varchar(50) DEFAULT NULL,
  `SubjectID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rubric`
--

INSERT INTO `rubric` (`Rubriccriteria0`, `Rubriccriteria1`, `Rubriccriteria2`, `Rubricname`, `Rubricperformancedesc0`, `Rubricperformancedesc1`, `Rubricperformancedesc2`, `Rubricperformancedesc3`, `Rubricperformancedesc4`, `Rubricperformancedesc5`, `Rubricperformancedesc6`, `Rubricperformancedesc7`, `Rubricperformancedesc8`, `Rubricperformancerating0`, `Rubricperformancerating1`, `Rubricperformancerating2`, `Subjectcode`, `RubricID`, `LecturerID`, `StudentID`, `SubjectID`) VALUES
('Components of the Report', 'Question/ Purpose', 'Spelling, Punctuation, Grammar', 'Rubric for problem solving ', 'The writing presents a clear claim and provides evidence and make clear the reasoning', 'The writing presents a clear claim and provides evidence, butmake clear the reasoning', 'The writing presents only a vague or confusing claim', 'The conclusion effectively strengthens the claim by displaying the relationship', 'The claim, evidence and reasoning linking them are presented in a logical order', 'Claim, support, conclusion and structure are absent', 'Language forms are used frequently, mostly correctly and consistency', 'Language forms are used frequently and mostly correctly but not consistently', 'Language forms are sporadic and mostly not correct', 'Good', 'Satisfactory', 'Minimal', 'SCSJ-1102', 'R001', NULL, NULL, NULL),
('Promptness and Initiative', 'Delivery of Post', 'Relevance of Post', 'Rubric for assignment', 'Consistently responds to postings in less than 24 hours; demonstrate good self-initiative', 'Responds to most postings within a 24 hour period; requires occasional prompting to post', 'Dose not respond to most postings; rarely participates freely', 'Consistently uses grammatically correct posts with rare misspellings', 'Few grammatically or spelling errors are noted in post', 'Unitizes poor spelling and grammar in most posts; posts appear hasty', 'Consistently posts topics related to discussion topic; cites additional references related to topic', 'Frequently posts topics that are related to discussion content; prompts further discussion of topic', 'Posts topics which do not related to the discussion; makes short or irrelevant marks', 'Good', 'Satisfactory ', 'Minimal', 'SCSJ-3303', 'R002', NULL, NULL, NULL),
('Subject content', 'Awareness of issues', 'Critical thinking', 'Rubric for project', 'a comprehensive grasp of the subject matter is demonstrated, including an in-depth understanding of the relevant concepts, thesis and issue related to the topic\r\n', 'an excellent grasp of the subject matter is demonstrated', 'a basic grasp of the subject matter is demonstrated', 'an awareness of differing viewpoint is demonstrated and a rigorous assessment of these undertaken where relevant', 'an awareness of differing viewpoint is demonstrated and an assessment of theses attempts were relevant', 'assets viewpoint without acknowledging alternative viewpoints', 'an ability to think critically is demonstrated in the analysis, synthesis and evaluative of relevant information', 'the paper goes beyond description to implementation, analysis, synthesis and evalutaion', 'accurate information incorporating relevant sources and references is concerned', 'Good ', 'Satisfactory ', 'Minimal', 'SCSJ-3343', 'R003', NULL, NULL, NULL),
('Components of the Report', 'Question/ Purpose', 'Spelling, Punctuation, Grammar', 'Rubric for IT II', 'The writing presents a clear claim and provides evidence and make clear the reasoning', 'The writing presents a clear claim and provides evidence, butmake clear the reasoning', 'The writing presents only a vague or confusing claim', 'The conclusion effectively strengthens the claim by displaying the relationship', 'The claim, evidence and reasoning linking them are presented in a logical order', 'Claim, support, conclusion and structure are absent', 'Language forms are used frequently, mostly correctly and consistency', 'Language forms are used frequently and mostly correctly but not consistently', 'Language forms are sporadic and mostly not correct', 'Good', 'Satisfactory', 'Minimal', 'SCSJ-1102', 'R005', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Carrymark` float DEFAULT NULL,
  `Course` varchar(50) DEFAULT NULL,
  `Studentname` varchar(50) DEFAULT NULL,
  `StudentID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Carrymark`, `Course`, `Studentname`, `StudentID`) VALUES
(3.99, 'Software Engineering', 'Lim Wei Han', 'S001');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `Subjectname` varchar(50) DEFAULT NULL,
  `Subjectcode` varchar(50) NOT NULL,
  `StudentID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`Subjectname`, `Subjectcode`, `StudentID`) VALUES
('PT2', 'SCSJ-1102', NULL),
('SDA', 'SCSJ-3343', NULL),
('AI', 'SCSJ-3553', NULL),
('DL', 'SCSR-1106', NULL),
('EXCEL', 'UKQE-3001', NULL),
('ENG', 'ULAB-3162', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Password` varchar(50) DEFAULT NULL,
  `AcidID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Password`, `AcidID`) VALUES
('123', 'L001'),
('123', 'S001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rubric`
--
ALTER TABLE `rubric`
  ADD UNIQUE KEY `RubricID` (`RubricID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD UNIQUE KEY `Subjectcode` (`Subjectcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
