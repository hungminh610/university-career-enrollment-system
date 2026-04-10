-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Apr 10, 2026 at 04:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universitydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `career_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `degree_level` varchar(50) DEFAULT NULL,
  `duration_years` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `careers`
--

INSERT INTO `careers` (`career_id`, `department_id`, `name`, `degree_level`, `duration_years`, `description`) VALUES
(1, 1, 'Computer Science BSc', 'BSc', 3, 'Bachelor in Computer Science'),
(2, 1, 'Artificial Intelligence MSc', 'MSc', 2, 'AI specialization'),
(3, 2, 'Economics BSc', 'BSc', 3, 'Bachelor in Economics'),
(4, 2, 'Finance MSc', 'MSc', 2, 'Master in Finance'),
(5, 3, 'Mechanical Engineering BSc', 'BSc', 3, 'Bachelor in Mechanical Engineering'),
(6, 3, 'Civil Engineering MSc', 'MSc', 2, 'Master in Civil Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `classrooms`
--

CREATE TABLE `classrooms` (
  `classroom_id` int(11) NOT NULL,
  `building` varchar(50) DEFAULT NULL,
  `room_number` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classrooms`
--

INSERT INTO `classrooms` (`classroom_id`, `building`, `room_number`, `capacity`) VALUES
(1, 'A', '101', 80),
(2, 'A', '202', 60),
(3, 'B', '105', 90),
(4, 'B', '210', 40),
(5, 'E', '330', 120),
(6, 'C', '110', 50);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `career_id` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `department_id`, `career_id`, `code`, `name`, `credits`, `year`) VALUES
(1, 1, 1, 'INF101', 'Programming I', 6, 1),
(2, 1, 1, 'INF201', 'Data Structures', 6, 2),
(3, 1, 2, 'AI501', 'Machine Learning', 8, 1),
(4, 2, 3, 'ECO101', 'Microeconomics', 6, 1),
(5, 2, 4, 'FIN301', 'Financial Markets', 8, 2),
(6, 3, 5, 'MECH101', 'Engineering Basics', 8, 1),
(7, 3, 6, 'CIV500', 'Advanced Structural Design', 10, 1),
(8, 1, 1, 'INF301', 'Operating Systems', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `course_offerings`
--

CREATE TABLE `course_offerings` (
  `offering_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `academic_year` varchar(20) DEFAULT NULL,
  `schedule_info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_offerings`
--

INSERT INTO `course_offerings` (`offering_id`, `course_id`, `professor_id`, `classroom_id`, `semester`, `academic_year`, `schedule_info`) VALUES
(1, 1, 1, 1, 'Fall', '2024/2025', 'Mon 10-12'),
(2, 2, 1, 2, 'Fall', '2024/2025', 'Wed 14-16'),
(3, 3, 2, 3, 'Spring', '2024/2025', 'Tue 09-12'),
(4, 4, 3, 4, 'Fall', '2024/2025', 'Thu 11-13'),
(5, 5, 4, 5, 'Spring', '2024/2025', 'Fri 10-12'),
(6, 6, 5, 6, 'Fall', '2024/2025', 'Mon 14-16'),
(7, 7, 6, 5, 'Spring', '2024/2025', 'Wed 08-10'),
(8, 8, 2, 1, 'Fall', '2024/2025', 'Tue 14-16'),
(9, 1, 2, 2, 'Spring', '2024/2025', 'Fri 09-11'),
(10, 4, 3, 4, 'Spring', '2024/2025', 'Mon 16-18');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `office` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `name`, `office`, `phone`) VALUES
(1, 'Computer Science', 'B12', '555-1010'),
(2, 'Economics', 'A22', '555-2020'),
(3, 'Engineering', 'C05', '555-3030');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `offering_id` int(11) DEFAULT NULL,
  `enroll_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `student_id`, `offering_id`, `enroll_date`, `status`, `grade`) VALUES
(1, 1, 1, '2024-09-10', 'enrolled', NULL),
(2, 1, 2, '2024-09-11', 'enrolled', NULL),
(3, 2, 1, '2024-09-10', 'enrolled', NULL),
(4, 2, 3, '2024-09-15', 'enrolled', NULL),
(5, 3, 4, '2024-09-18', 'enrolled', NULL),
(6, 4, 6, '2024-09-20', 'enrolled', NULL),
(7, 5, 5, '2024-09-19', 'enrolled', NULL),
(8, 6, 7, '2024-09-20', 'enrolled', NULL),
(9, 7, 8, '2024-09-21', 'enrolled', NULL),
(10, 8, 9, '2024-09-21', 'enrolled', NULL),
(11, 11, 3, '2026-04-10', 'enrolled', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `professor_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `office` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`professor_id`, `department_id`, `first_name`, `last_name`, `email`, `office`) VALUES
(1, 1, 'Alice', 'Miller', 'alice.miller@univ.com', 'C310'),
(2, 1, 'John', 'Smith', 'john.smith@univ.com', 'C208'),
(3, 2, 'Emma', 'Brown', 'emma.brown@univ.com', 'A115'),
(4, 2, 'William', 'Davis', 'will.davis@univ.com', 'A210'),
(5, 3, 'Oliver', 'Wilson', 'oliver.wilson@univ.com', 'E404'),
(6, 3, 'Sophia', 'Johnson', 'sophia.johnson@univ.com', 'E112');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `email`, `password_hash`, `first_name`, `last_name`, `birth_date`, `gender`, `phone`, `registration_date`) VALUES
(1, 'tom1@univ.com', 'hash1', 'Tom', 'Jackson', '2003-01-12', 'male', '111-222', '2026-04-10 11:50:17'),
(2, 'julia2@univ.com', 'hash2', 'Julia', 'Kim', '2004-05-03', 'female', '222-333', '2026-04-10 11:50:17'),
(3, 'maria3@univ.com', 'hash3', 'Maria', 'Lopez', '2002-09-28', 'female', '333-444', '2026-04-10 11:50:17'),
(4, 'alex4@univ.com', 'hash4', 'Alex', 'Wang', '2003-07-07', 'male', '444-555', '2026-04-10 11:50:17'),
(5, 'luca5@univ.com', 'hash5', 'Luca', 'Ferrari', '2001-11-11', 'male', '555-666', '2026-04-10 11:50:17'),
(6, 'hana6@univ.com', 'hash6', 'Hana', 'Nguyen', '2004-12-30', 'female', '666-777', '2026-04-10 11:50:17'),
(7, 'kevin7@univ.com', 'hash7', 'Kevin', 'Brown', '2003-02-10', 'male', '777-888', '2026-04-10 11:50:17'),
(8, 'nora8@univ.com', 'hash8', 'Nora', 'Ivanova', '2001-10-09', 'female', '888-999', '2026-04-10 11:50:17'),
(9, 'sam9@univ.com', 'hash9', 'Sam', 'Peterson', '2002-06-21', 'male', '999-111', '2026-04-10 11:50:17'),
(10, 'mia10@univ.com', 'hash10', 'Mia', 'Khan', '2003-03-13', 'female', '222-111', '2026-04-10 11:50:17'),
(11, 'minhdeptrai3000@gmail.com', '$2y$10$AVT6JZUk1sbgT22uYmVoruTEfdBfYEdsMOiK.2FI8VuJxytHhpv/i', 'test', 'test', '2004-10-06', NULL, '3516409468', '2026-04-10 12:36:00');

-- --------------------------------------------------------

--
-- Table structure for table `student_careers`
--

CREATE TABLE `student_careers` (
  `student_id` int(11) NOT NULL,
  `career_id` int(11) NOT NULL,
  `enroll_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_careers`
--

INSERT INTO `student_careers` (`student_id`, `career_id`, `enroll_date`, `status`, `is_primary`) VALUES
(1, 1, '2023-10-01', 'active', 1),
(2, 1, '2023-10-02', 'active', 1),
(3, 3, '2023-09-15', 'active', 1),
(4, 5, '2023-10-10', 'active', 1),
(5, 4, '2023-11-01', 'active', 1),
(6, 6, '2023-09-20', 'active', 1),
(11, 1, '2026-04-10', 'active', 1),
(11, 2, '2026-04-10', 'active', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`career_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `career_id` (`career_id`);

--
-- Indexes for table `course_offerings`
--
ALTER TABLE `course_offerings`
  ADD PRIMARY KEY (`offering_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `professor_id` (`professor_id`),
  ADD KEY `classroom_id` (`classroom_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `offering_id` (`offering_id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`professor_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `student_careers`
--
ALTER TABLE `student_careers`
  ADD PRIMARY KEY (`student_id`,`career_id`),
  ADD KEY `career_id` (`career_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `career_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `classroom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_offerings`
--
ALTER TABLE `course_offerings`
  MODIFY `offering_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `professor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `careers`
--
ALTER TABLE `careers`
  ADD CONSTRAINT `careers_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`career_id`) REFERENCES `careers` (`career_id`);

--
-- Constraints for table `course_offerings`
--
ALTER TABLE `course_offerings`
  ADD CONSTRAINT `course_offerings_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `course_offerings_ibfk_2` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professor_id`),
  ADD CONSTRAINT `course_offerings_ibfk_3` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`classroom_id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`offering_id`) REFERENCES `course_offerings` (`offering_id`);

--
-- Constraints for table `professors`
--
ALTER TABLE `professors`
  ADD CONSTRAINT `professors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `student_careers`
--
ALTER TABLE `student_careers`
  ADD CONSTRAINT `student_careers_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `student_careers_ibfk_2` FOREIGN KEY (`career_id`) REFERENCES `careers` (`career_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
