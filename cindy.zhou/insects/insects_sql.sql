-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost:3306
-- 生成日期： 2020-12-07 08:12:25
-- 服务器版本： 5.6.49-cll-lve
-- PHP 版本： 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `insects_sql`
--

-- --------------------------------------------------------

--
-- 表的结构 `insect_tracking`
--

CREATE TABLE `insect_tracking` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `des` text,
  `types` varchar(255) DEFAULT NULL,
  `coordinatesss` varchar(255) DEFAULT NULL,
  `characters` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `insect_tracking`
--

INSERT INTO `insect_tracking` (`id`, `img`, `title`, `des`, `types`, `coordinatesss`, `characters`) VALUES
(0000000001, 'upload/1606962647.png', 'Bee', 'Bees are all bees to pollen and nectar for food, from spring to the end of autumn, in the plant flowering season, bees are busy every day. Winter is the bees\' only brief period of leisure. ', 'Harmless,Fly', '39.81652033705979,-121.10881260173653', 'Like hot'),
(0000000002, 'upload/1606964180.png', 'Fly', 'Flies have a unique digestive tract. When they eat food with a variety of bacteria, in the digestive tract for rapid processing, rapid uptake of nutritious food and timely elimination of useless dross, waste and germs.', 'Harmful,Fly', '36.451032209314654,-119.70581779765223', 'Like hot'),
(0000000015, 'upload/1607139981.png', 'Butterfly', 'Butterflies are about 14,000 species of Bai in the world, most of which are distributed in America, especially in the Amazon Basin. Butterflies are generally colorful and have many stripes on their bodies. ', 'Harmless,Fly', NULL, 'Like hot'),
(0000000006, 'upload/1606998464.png', 'Fire ant', 'Ants (ants) live for a long time. Workers can live from a few weeks to three to 10 years, and queens can live for years or even 10 years. An ant nest can grow in one place for years or even decades. ', 'Harmful,Climb', '38.94374534002597,-117.48792312055984', 'Like humidity'),
(0000000007, 'upload/1606998600.png', 'Mosquito', 'Mosquitoes, which are pests, like humidity and heat. Females usually suck blood for food, while males suck plant juices. Female blood-sucking mosquitoes can transmit the disease.', 'Harmful,Fly', '37.1103672156866,-117.77899847260036', 'Like humidity and heat '),
(0000000021, 'upload/1607167957.png', 'Ladybug', 'Ladybird is a beneficial insect with a temperature of about 20â„ƒ. It is a predatory insect. Its body is like half a ball, and its head and black wings are orange.', 'Harmless,Climb', NULL, 'Like hot'),
(0000000017, 'upload/1607142722.png', 'Dragonbug', 'The Dragonbug is a kind of multicolored insect. The four bai arms with large wings are its most obvious characteristics. A vermin eater, friendly. It has to hold its body and then turn. ', 'Harmless,Fly', NULL, 'Like hot'),
(0000000013, 'upload/1607139023.png', 'Spider', 'Spiders are both beneficial and harmful to humans, but in terms of their contribution, they are mainly beneficial insects. In the fields, for example, spiders prey mostly on crop pests. ', 'Harmless,Climb', NULL, 'Like hot'),
(0000000020, 'upload/1607144190.png', 'Butterfly', 'Butterflies are about 14,000 species of Bai in the world, most of which are distributed in America, especially in the Amazon Basin. Butterflies are generally colorful and have many stripes on their bodies. ', 'Harmless,Fly', NULL, 'Like hot ');

-- --------------------------------------------------------

--
-- 表的结构 `trancking_location`
--

CREATE TABLE `trancking_location` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `insect_tracking_id` int(11) NOT NULL,
  `coordinate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `trancking_location`
--

INSERT INTO `trancking_location` (`id`, `insect_tracking_id`, `coordinate`) VALUES
(00000000001, 1, '39.81652033705979,-121.10881260173653'),
(00000000002, 2, '36.451032209314654,-119.70581779765223'),
(00000000003, 3, '37.59508061726362,-120.44395851412234'),
(00000000004, 5, '39.03542063767029,-122.5254663323324'),
(00000000005, 6, '38.94374534002597,-117.48792312055984'),
(00000000006, 7, '37.1103672156866,-117.77899847260036'),
(00000000007, 8, '37.050278010798536,-115.53491939262516'),
(00000000008, 12, '40.223898912284746,-123.45215568827723'),
(00000000009, 13, '39.022306384438224,-123.61695061015223'),
(00000000010, 14, '35.83167743220344,-120.14678570164875'),
(00000000011, 15, '35.76244663643667,-120.00807877495883'),
(00000000012, 16, '36.996988567502136,-117.55249748515223'),
(00000000013, 17, '41.964286840635324,-119.2668471276236'),
(00000000014, 18, '33.80433677569913,-115.57260781207431'),
(00000000015, 19, '47.96927697441377,-121.01514378237711'),
(00000000016, 20, '43.687236945679096,-121.16846202877107'),
(00000000017, 21, '37.48132338111039,-121.28159395461503');

-- --------------------------------------------------------

--
-- 表的结构 `user_tracking`
--

CREATE TABLE `user_tracking` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_tracking`
--

INSERT INTO `user_tracking` (`id`, `username`, `email`, `password`, `head`, `sex`, `age`, `nickname`, `status`, `location`) VALUES
(0000000001, 'Li', '728717952@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '', '25', '', '', '', ''),
(0000000002, 'Liqing ', 'Liqing4028@163.com ', '5f4dcc3b5aa765d61d8327deb882cf99', '', 'F', '28', 'Liqing ', NULL, NULL),
(0000000003, 'Username', 'liqing4028@163.com', '5f4dcc3b5aa765d61d8327deb882cf99', '', 'F', '28', 'NAME', NULL, NULL),
(0000000004, 'admin', '123@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', NULL, NULL),
(0000000005, 'user', '767927598@qq.com', '1a1dc91c907325c69271ddf0c944bc72', '', NULL, NULL, NULL, NULL, NULL),
(0000000006, 'test', '123@qq.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL),
(0000000007, 'user0', '728717952@qq.com', '1a1dc91c907325c69271ddf0c944bc72', '', 'female', '22', 'Cindy ', 'Student', 'San Francisco, CA'),
(0000000008, 'user99', 'user@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', NULL, NULL, NULL, NULL, NULL, NULL),
(0000000009, 'user00', 'user@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', NULL, NULL, NULL, NULL, NULL, NULL),
(0000000010, 'fre', 'fer@gmai.com', '22c276a05aa7c90566ae2175bcc2a9b0', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- 转储表的索引
--

--
-- 表的索引 `insect_tracking`
--
ALTER TABLE `insect_tracking`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `trancking_location`
--
ALTER TABLE `trancking_location`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `user_tracking`
--
ALTER TABLE `user_tracking`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `insect_tracking`
--
ALTER TABLE `insect_tracking`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 使用表AUTO_INCREMENT `trancking_location`
--
ALTER TABLE `trancking_location`
  MODIFY `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `user_tracking`
--
ALTER TABLE `user_tracking`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
