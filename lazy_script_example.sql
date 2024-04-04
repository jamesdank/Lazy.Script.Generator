-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 04, 2024 at 03:15 AM
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
  `lazy_id` tinyint(3) NOT NULL,
  `lazy_name` varchar(200) NOT NULL,
  `lazy_commands` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lazy_script`
--

INSERT INTO `lazy_script` (`lazy_id`, `lazy_name`, `lazy_commands`) VALUES
(1, '/users/List Users', 'clear ;\r\necho -e \"Users\\n\" ;\r\ncat /etc/passwd ;\r\nsub_menu ;;'),
(2, '/users/Logged in Users', 'clear ;\r\necho -e \"Logged in Users\\n\" ;\r\npinky ;\r\nsub_menu ;;'),
(3, '/users/Info about specific User', 'echo -e \"\\n\\e[4mUsername you want to lookup info about?\\e[0m \" ;\r\nread -rp \"Username: \" username ;\r\nclear ;\r\necho -e \"$username Info\\n\" ;\r\npinky $username ;\r\nsub_menu ;;'),
(4, '/users/Add User', 'echo -e \"\\n\\e[4mUsername you want to add?\\e[0m \" ;\r\nread -rp \"Username: \" username ;\r\nsudo adduser $username ;\r\nclear ;\r\necho -e \"\\nAdding User $username Completed\\n\" ;\r\nsub_menu ;;'),
(5, '/users/Delete User (without removing user files)', 'echo -e \"\\n\\e[4mUsername you want to delete?\\e[0m \" ;\r\nread -rp \"Username: \" username ;\r\necho -e \"$username Info\\n\" ;\r\npinky $username ;\r\necho -e \"\" ;\r\nread -p \"Are you sure you want delete user $username (y/n)?\" delete\r\ncase \"$delete\" in \r\ny|Y) \r\nclear ;\r\nsudo deluser $username ;\r\necho -e \"Deleted User $username\" ;\r\nsub_menu ;;\r\n                \r\nn|N) \r\nclear ;\r\necho -e \"$username not Deleted\" ;\r\nsub_menu ;;\r\nesac\r\n;;'),
(6, '/users/Delete User (removing user files)', 'echo -e \"\\n\\e[4mUsername you want to delete?\\e[0m \" ;\r\nread -rp \"Username: \" username ;\r\necho -e \"$username Info\\n\" ;\r\npinky $username ;\r\necho -e \"\" ;\r\nread -p \"Are you sure you want delete user $username and all of their files (y/n)?\" delete\r\ncase \"$delete\" in \r\ny|Y) \r\nclear ;\r\nsudo deluser --remove-home $username ;\r\necho -e \"\\nDeleted User $username and $username Files Completed\" ;\r\nsub_menu ;;\r\n                \r\nn|N) \r\nclear ;\r\necho -e \"$username and files not Deleted\" ;\r\nsub_menu ;;\r\nesac\r\n;;'),
(7, '/users/Add User to Sudoers File', 'echo -e \"\\n\\e[4mUsername to add to Sudoers File?\\e[0m \" ;\r\nread -rp \"Username: \" username ;\r\nsudo usermod -aG sudo $username ;\r\nclear ;\r\necho -e \"\\nUser $username added to Sudoers File Completed\" ;\r\nsub_menu ;;'),
(8, '/system/Update System (apt)', 'clear ;\r\necho -e \"Updating system...\" ;\r\nsleep 2 ;\r\nsudo apt update -y ;\r\n\r\necho -e \"\\nUpgrading system...\" ;\r\nsleep 2 ;\r\nsudo apt upgrade -y ;\r\n            \r\necho -e \"\\nCleaning up update files and purging unused packages...\" ;\r\nsleep 2 ;\r\nsudo apt clean -y ;\r\nsudo apt autoremove -y ;\r\n\r\nclear ;\r\necho -e \"Updating System Completed\" ;\r\nsub_menu ;;'),
(9, '/system/System Info', 'clear ;\r\ncat /etc/os-release ;\r\nsub_menu ;;'),
(10, '/config_files/Edit ~/.bashrc', 'sudo &#36;editor ~/.bashrc ;\r\nclear ;\r\nsub_menu ;;'),
(11, '/config_files/Edit /etc/fstab', 'sudo &#36;editor /etc/fstab ;\r\nclear ;\r\nsub_menu ;;'),
(12, '/config_files/Edit /etc/apt/sources.list', 'sudo &#36;editor /etc/apt/sources.list ;\r\nclear ;\r\nsub_menu ;;'),
(13, '/config_files/Edit /etc/network/interfaces', 'sudo &#36;editor /etc/network/interfaces ;\r\nclear ;\r\nsub_menu ;;'),
(14, '/config_files/Edit crontab', 'EDITOR=$editor crontab -e ;\r\nclear ;\r\nsub_menu ;;'),
(15, '/config_files/Edit crontab root', 'sudo EDITOR=$editor crontab -u root -e ;\r\nclear ;\r\nsub_menu ;;'),
(16, '/logs/View Systemd Logs', 'clear ;\r\nsudo journalctl -f ;\r\nsub_menu ;;\r\n'),
(17, '/logs/View Boot Logs & Check Errors', 'clear ;\r\nsudo journalctl -xb ;\r\nsub_menu ;;'),
(18, '/logs/View Wifi Logs Live', 'clear ;\r\nsudo dmesg -w ;\r\nsub_menu ;;'),
(19, '/config_files/Edit ~/.bash_aliases', 'sudo &#36;editor ~/.bash_aliases ;\r\nclear ;\r\nsub_menu ;;');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lazy_script`
--
ALTER TABLE `lazy_script`
  ADD PRIMARY KEY (`lazy_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lazy_script`
--
ALTER TABLE `lazy_script`
  MODIFY `lazy_id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
