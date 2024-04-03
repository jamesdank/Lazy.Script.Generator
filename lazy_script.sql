-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 03, 2024 at 02:15 AM
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
-- Database: `lazy_script_generator`
--

-- --------------------------------------------------------

--
-- Table structure for table `lazy_script`
--

CREATE TABLE `lazy_script` (
  `lazy_number` tinyint(3) NOT NULL,
  `lazy_name` varchar(200) NOT NULL,
  `lazy_commands` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lazy_script`
--

INSERT INTO `lazy_script` (`lazy_number`, `lazy_name`, `lazy_commands`) VALUES
(1, 'List Users', 'clear ;\r\necho -e \"Users\\n\" ;\r\ncat /etc/passwd ;\r\nsub_menu ;;'),
(2, 'Logged in Users', 'clear ;\r\necho -e \"Logged in Users\\n\" ;\r\npinky ;\r\nsub_menu ;;'),
(3, 'Info about specific User', 'echo -e \"\\n\\e[4mUsername you want to lookup info about?\\e[0m \" ;\r\nread -rp \"Username: \" username ;\r\nclear ;\r\necho -e \"$username Info\\n\" ;\r\npinky $username ;\r\nsub_menu ;;'),
(4, 'Add User', 'echo -e \"\\n\\e[4mUsername you want to add?\\e[0m \" ;\r\nread -rp \"Username: \" username ;\r\nsudo adduser $username ;\r\nclear ;\r\necho -e \"\\nAdding User $username Completed\\n\" ;\r\nsub_menu ;;'),
(5, 'Delete User (without removing user files)', 'echo -e \"\\n\\e[4mUsername you want to delete?\\e[0m \" ;\r\nread -rp \"Username: \" username ;\r\necho -e \"$username Info\\n\" ;\r\npinky $username ;\r\necho -e \"\" ;\r\nread -p \"Are you sure you want delete user $username (y/n)?\" delete\r\ncase \"$delete\" in \r\ny|Y) \r\nclear ;\r\nsudo deluser $username ;\r\necho -e \"Deleted User $username\" ;\r\nsub_menu ;;\r\n                \r\nn|N) \r\nclear ;\r\necho -e \"$username not Deleted\" ;\r\nsub_menu ;;\r\nesac\r\n;;'),
(6, 'Delete User (removing user files)', 'echo -e \"\\n\\e[4mUsername you want to delete?\\e[0m \" ;\r\nread -rp \"Username: \" username ;\r\necho -e \"$username Info\\n\" ;\r\npinky $username ;\r\necho -e \"\" ;\r\nread -p \"Are you sure you want delete user $username and all of their files (y/n)?\" delete\r\ncase \"$delete\" in \r\ny|Y) \r\nclear ;\r\nsudo deluser --remove-home $username ;\r\necho -e \"\\nDeleted User $username and $username Files Completed\" ;\r\nsub_menu ;;\r\n                \r\nn|N) \r\nclear ;\r\necho -e \"$username and files not Deleted\" ;\r\nsub_menu ;;\r\nesac\r\n;;'),
(7, 'Add User to Sudoers File', 'echo -e \"\\n\\e[4mUsername to add to Sudoers File?\\e[0m \" ;\r\nread -rp \"Username: \" username ;\r\nsudo usermod -aG sudo $username ;\r\nclear ;\r\necho -e \"\\nUser $username added to Sudoers File Completed\" ;\r\nsub_menu ;;');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lazy_script`
--
ALTER TABLE `lazy_script`
  ADD UNIQUE KEY `lazy_number` (`lazy_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
