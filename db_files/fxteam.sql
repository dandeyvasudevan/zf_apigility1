-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 30, 2014 at 05:36 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fxteam`
--
CREATE DATABASE IF NOT EXISTS `fxteam` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fxteam`;

-- --------------------------------------------------------

--
-- Table structure for table `instruments`
--

CREATE TABLE IF NOT EXISTS `instruments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `instrument` varchar(10) DEFAULT NULL,
  `displayname` varchar(100) DEFAULT NULL,
  `tickvalue` decimal(10,4) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_instrument` (`instrument`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumer_key` varchar(30) NOT NULL,
  `access_token` varchar(16) NOT NULL,
  `access_token_secret` varchar(32) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_used_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumers`
--

CREATE TABLE IF NOT EXISTS `oauth_consumers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumer_key` varchar(30) NOT NULL,
  `consumer_secret` varchar(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `application` varchar(255) DEFAULT NULL,
  `description` text,
  `callback_url` varchar(500) DEFAULT NULL,
  `enable_password_grant` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oauth_consumers`
--

INSERT INTO `oauth_consumers` (`id`, `consumer_key`, `consumer_secret`, `created_date`, `user_id`, `application`, `description`, `callback_url`, `enable_password_grant`) VALUES
(1, 'web2', 'web2secret', '2014-10-20 11:16:25', 1, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patch_history`
--

CREATE TABLE IF NOT EXISTS `patch_history` (
  `patch_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `patch_number` int(11) DEFAULT NULL,
  `date_patched` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`patch_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patterns`
--

CREATE TABLE IF NOT EXISTS `patterns` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `patternname` varchar(10) DEFAULT NULL,
  `displayname` varchar(100) DEFAULT NULL,
  `altnames` varchar(1000) DEFAULT NULL,
  `video_uri` varchar(600) DEFAULT NULL,
  `image_uri` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_patternname` (`patternname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE IF NOT EXISTS `trades` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `capital` decimal(10,4) DEFAULT NULL,
  `order_date` int(11) DEFAULT NULL,
  `risk` decimal(10,4) DEFAULT NULL,
  `instrument` varchar(10) DEFAULT NULL,
  `direction` varchar(10) DEFAULT NULL,
  `pattern` varchar(10) DEFAULT NULL,
  `entry` decimal(10,4) DEFAULT NULL,
  `sl` decimal(10,4) DEFAULT NULL,
  `tp` decimal(10,4) DEFAULT NULL,
  `rr` varchar(30) DEFAULT NULL,
  `filled` varchar(1) DEFAULT NULL,
  `fill_time` int(11) DEFAULT NULL,
  `exit_time` int(11) DEFAULT NULL,
  `exit_type` varchar(10) DEFAULT NULL,
  `exit_price` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_dates` (`order_date`,`fill_time`,`exit_time`),
  KEY `idx_user` (`user_id`),
  KEY `idx_result` (`exit_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trade_comments`
--

CREATE TABLE IF NOT EXISTS `trade_comments` (
  `trade_id` int(11) DEFAULT NULL,
  `comment` mediumtext,
  `date` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `idx_trade` (`trade_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `request_code` char(8) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password`, `email`, `last_login`, `admin`, `full_name`, `active`, `request_code`) VALUES
(1, 'vasudevan', 'dandey', 'dandeyvasudevan@gmail.com', NULL, NULL, 'vasudevan Dandey', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `watchlists`
--

CREATE TABLE IF NOT EXISTS `watchlists` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `instrument` varchar(10) DEFAULT NULL,
  `weekly` varchar(1000) DEFAULT NULL,
  `daily` varchar(1000) DEFAULT NULL,
  `candlestick` varchar(1000) DEFAULT NULL,
  `resistancemajor` decimal(10,4) DEFAULT NULL,
  `resistanceminor` decimal(10,4) DEFAULT NULL,
  `supportmajor` decimal(10,4) DEFAULT NULL,
  `supportminor` decimal(10,4) DEFAULT NULL,
  `notes` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `idx_dates` (`date`),
  KEY `idx_user` (`user_id`),
  KEY `idx_instrument` (`instrument`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
