-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: Node26_BTFood
-- Generation Time: 2022-12-12 20:56:22.2530
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `food_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`food_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `res_rate` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `res_id` int NOT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `res_rate_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `res_rate_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Image` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Beef', 'https://thitbo.vivusea.com/bo-wagyu-a5-thit-bo-ngon-nhat-the-gioi.html?gclid=Cj0KCQiAnNacBhDvARIsABnDa69v0lZJTRHIr9PT7_gie2TdRhhdAHLNv0na_d95FMuaMPwRl_HOYasaAmBzEALw_wcB', 500, 'Wagyu', 2),
(2, 'Milk tea', 'https://phuclong.com.vn/uploads/dish/3c2d50a2c26783-hngtrsaphclongtrosaphclong.png', 20, 'tra sua phuc long', 1),
(3, 'Coffee', 'https://athome.starbucks.com/sites/default/files/2022-05/CAH_CaramelMacch_Ingredient_2880x2880.jpg', 25, 'ca phe ', 1),
(4, 'Coke', 'https://medicare.vn/wp-content/uploads/2021/01/0063149.jpg', 15, 'coke', 1),
(5, 'Croissant', 'https://cdn.tgdd.vn/Files/2021/08/06/1373418/cach-lam-banh-sung-bo-banh-croissant-ngan-lop-thom-ngon-noi-tieng-cua-phap-202108061216171587.jpg', 25, 'banh sung trau ', 2);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'drink'),
(2, 'main');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 2, '2022-12-06 08:25:13'),
(1, 3, '2022-09-07 07:13:45'),
(2, 1, '2022-11-11 08:25:23'),
(2, 3, '2022-07-05 07:13:53'),
(3, 1, '2022-11-01 08:25:34'),
(4, 1, '2022-08-02 07:14:02'),
(4, 2, '2022-12-10 08:25:54'),
(4, 3, '2022-12-01 08:25:41');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 2, 3, '...', NULL),
(1, 4, 2, '...', NULL),
(1, 5, 1, '...', NULL),
(2, 1, 2, '...', NULL),
(3, 3, 1, '...', NULL),
(3, 4, 4, '...', NULL),
(4, 5, 2, '...', NULL);

INSERT INTO `res_rate` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 3, 5, '2022-12-02 08:28:54'),
(2, 2, 4, '2022-10-27 08:29:01'),
(3, 1, 4, '2022-11-28 08:29:12'),
(4, 2, 5, '2022-09-16 08:29:24'),
(4, 3, 5, '2022-08-18 08:29:31');

INSERT INTO `restaurant` (`res_id`, `res_name`, `Image`, `desc`) VALUES
(1, 'Kpub', 'https://www.facebook.com/KPub.NuongDuongPhoHanQuoc/photos/a.838012376276718/3021879017890032/', 'kpub'),
(2, 'Cheese coffee', 'https://www.facebook.com/cheesecoffee.vn/photos/a.344072732621304/1759464791082084', 'Cheese Coffee'),
(3, 'Phuc Long', 'https://www.facebook.com/phuclongcoffeeandtea/photos/a.430183617051283/5586108241458769', 'Phuc Long');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'trân châu trắng ', 5, 2),
(2, 'trân châu đen', 5, 2),
(3, 'caramel', 10, 3);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyen Thi Phuong Thao ', 'thao.nguyen@gmail.com', '123'),
(2, 'Bui Yen Nga ', 'nga.bui@gmail.com', '456'),
(3, 'Huynh Thao Vy ', 'vy.huynh@gmail.com ', '789'),
(4, 'Ta Linh Dan ', 'dan.ta@gmail.com', '321'),
(5, 'Nguyen Phuong Dung ', 'dung.nguyen@gmail.com', '654'),
(6, 'Hoang Phuong Nam ', 'nam.nguyen@gmail.com', '987');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;