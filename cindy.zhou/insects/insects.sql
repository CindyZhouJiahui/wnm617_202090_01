/*
Navicat MySQL Data Transfer

Source Server         : 昆虫
Source Server Version : 50731
Source Host           : 47.100.81.135:3306
Source Database       : kunchong

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2020-12-03 21:46:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `insect_tracking`
-- ----------------------------
DROP TABLE IF EXISTS `insect_tracking`;
CREATE TABLE `insect_tracking` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `des` text,
  `types` varchar(255) DEFAULT NULL,
  `coordinatesss` varchar(255) DEFAULT NULL,
  `characters` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of insect_tracking
-- ----------------------------
INSERT INTO `insect_tracking` VALUES ('0000000001', 'upload/1606962647.png', 'Bee', 'Bees are all bees to pollen and nectar for food, from spring to the end of autumn, in the plant flowering season, bees are busy every day. Winter is the bees\' only brief period of leisure. ', 'Harmless,Fly', '39.81652033705979,-121.10881260173653', 'Like hot');
INSERT INTO `insect_tracking` VALUES ('0000000002', 'upload/1606964180.png', 'Fly', 'Flies have a unique digestive tract. When they eat food with a variety of bacteria, in the digestive tract for rapid processing, rapid uptake of nutritious food and timely elimination of useless dross, waste and germs.', 'Harmful,Fly', '36.451032209314654,-119.70581779765223', 'Like hot');
INSERT INTO `insect_tracking` VALUES ('0000000003', 'upload/1606998055.png', 'Ladybug', 'Ladybird is a beneficial insect with a temperature of about 20℃. It is a predatory insect. Its body is like half a ball, and its head and black wings are orange. ', 'Harmless,Fly', '37.59508061726362,-120.44395851412234', 'Like hot');
INSERT INTO `insect_tracking` VALUES ('0000000005', 'upload/1606998346.png', 'Butterfly', 'Butterflies are about 14,000 species of Bai in the world, most of which are distributed in America, especially in the Amazon Basin. Butterflies are generally colorful and have many stripes on their bodies. ', 'Harmless,Fly', '39.03542063767029,-122.5254663323324', 'Like hot');
INSERT INTO `insect_tracking` VALUES ('0000000006', 'upload/1606998464.png', 'Fire ant', 'Ants (ants) live for a long time. Workers can live from a few weeks to three to 10 years, and queens can live for years or even 10 years. An ant nest can grow in one place for years or even decades. ', 'Harmful,Climb', '38.94374534002597,-117.48792312055984', 'Like humidity');
INSERT INTO `insect_tracking` VALUES ('0000000007', 'upload/1606998600.png', 'Mosquito', 'Mosquitoes, which are pests, like humidity and heat. Females usually suck blood for food, while males suck plant juices. Female blood-sucking mosquitoes can transmit the disease.', 'Harmful,Fly', '37.1103672156866,-117.77899847260036', 'Like humidity and heat ');
INSERT INTO `insect_tracking` VALUES ('0000000008', 'upload/1606998746.png', 'Dragonbug', 'The Dragonbug is a kind of multicolored insect. The four bai arms with large wings are its most obvious characteristics. A vermin eater, friendly. It has to hold its body and then turn. ', 'Harmless,Fly', '37.050278010798536,-115.53491939262516', 'Like hot');
INSERT INTO `insect_tracking` VALUES ('0000000012', 'upload/1606999743.png', 'Spider', 'Spiders are both beneficial and harmful to humans, but in terms of their contribution, they are mainly beneficial insects. In the fields, for example, spiders prey mostly on crop pests. ', 'Harmless,Climb', '40.223898912284746,-123.45215568827723', 'Like hot ');

-- ----------------------------
-- Table structure for `trancking_location`
-- ----------------------------
DROP TABLE IF EXISTS `trancking_location`;
CREATE TABLE `trancking_location` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `insect_tracking_id` int(11) NOT NULL,
  `coordinate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trancking_location
-- ----------------------------
INSERT INTO `trancking_location` VALUES ('00000000001', '1', '39.81652033705979,-121.10881260173653');
INSERT INTO `trancking_location` VALUES ('00000000002', '2', '36.451032209314654,-119.70581779765223');
INSERT INTO `trancking_location` VALUES ('00000000003', '3', '37.59508061726362,-120.44395851412234');
INSERT INTO `trancking_location` VALUES ('00000000004', '5', '39.03542063767029,-122.5254663323324');
INSERT INTO `trancking_location` VALUES ('00000000005', '6', '38.94374534002597,-117.48792312055984');
INSERT INTO `trancking_location` VALUES ('00000000006', '7', '37.1103672156866,-117.77899847260036');
INSERT INTO `trancking_location` VALUES ('00000000007', '8', '37.050278010798536,-115.53491939262516');
INSERT INTO `trancking_location` VALUES ('00000000008', '12', '40.223898912284746,-123.45215568827723');

-- ----------------------------
-- Table structure for `user_tracking`
-- ----------------------------
DROP TABLE IF EXISTS `user_tracking`;
CREATE TABLE `user_tracking` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_tracking
-- ----------------------------
INSERT INTO `user_tracking` VALUES ('0000000001', 'Li', '767927598@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'upload/1606999172.png', '', '22', 'Amy ', '', '');
INSERT INTO `user_tracking` VALUES ('0000000002', 'Liqing ', 'Liqing4028@163.com ', '5f4dcc3b5aa765d61d8327deb882cf99', '', 'F', '28', 'Liqing ', null, null);
INSERT INTO `user_tracking` VALUES ('0000000003', 'Username', 'liqing4028@163.com', '5f4dcc3b5aa765d61d8327deb882cf99', '', 'F', '28', 'NAME', null, null);
INSERT INTO `user_tracking` VALUES ('0000000004', 'admin', '123@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', null, null);
INSERT INTO `user_tracking` VALUES ('0000000005', 'user', '767927598@qq.com', '1a1dc91c907325c69271ddf0c944bc72', '', null, null, null, null, null);
INSERT INTO `user_tracking` VALUES ('0000000006', 'test', '123@qq.com', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, null);
