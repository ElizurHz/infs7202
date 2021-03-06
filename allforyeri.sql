-- phpMyAdmin SQL Dump
-- version 4.0.10.15
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016-05-30 05:35:09
-- 服务器版本: 5.5.46
-- PHP 版本: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `allforyeri`
--

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(20) NOT NULL,
  `comment_title` varchar(50) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `comment_time` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `post_id` int(20) NOT NULL,
  PRIMARY KEY (`comment_id`,`post_id`),
  KEY `username` (`username`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_title`, `comment`, `comment_time`, `username`, `post_id`) VALUES
(1, 'comment title 1', 'content 1', '21/5/2016 13:12', 'yeri', 160521001),
(1, 'Love this', 'So beautiful!', '24/5/2016 13:06', 'SeulRene', 160524001),
(2, 'comment title 2', 'comment content 2', '21/5/2016 13:22', 'elizur', 160521001),
(2, 'I like the smile face', 'That smile''s just like my daughter...', '24/5/2016 13:25', 'SeulgiBear', 160524001);

-- --------------------------------------------------------

--
-- 表的结构 `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `post_id` int(20) NOT NULL,
  `media_id` int(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`post_id`,`media_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `media`
--

INSERT INTO `media` (`post_id`, `media_id`, `type`, `url`) VALUES
(160521001, 1, 'pic', '160521001/01.jpg'),
(160521001, 2, 'pic', '160521001/02.jpg'),
(160524001, 1, 'pic', '160524001/01.jpg'),
(160524001, 2, 'pic', '160524001/02.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `thumbnail` varchar(200) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `posts`
--

INSERT INTO `posts` (`post_id`, `title`, `content`, `thumbnail`) VALUES
(160521001, '160521 Ediya Music Festival', 'CR: BEAUTIFUL MOMENT', '160521001/01.jpg'),
(160524001, '160524 Summer Concert ', 'CR:Popsicle', '160524001/01.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `admin` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`username`, `password`, `admin`) VALUES
('elizur', 'f28d6fb009676705dbcc3a23b6aeaf2b', 0),
('SeulgiBear', '59401024a21c109a2f3f5608f57e1993', 0),
('SeulRene', '7611873cec1ff3f9d342ab6bcd57b430', 0),
('yeri', '028e0b64de57a0e061b8573970448283', 1);

--
-- 限制导出的表
--

--
-- 限制表 `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- 限制表 `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
