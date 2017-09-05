
CREATE TABLE `user` (
	`user_id` VARCHAR(20) NOT NULL,
	`user_name` VARCHAR(20) NOT NULL,
	`user_pass` VARCHAR(20) NOT NULL,
	`user_addr` VARCHAR(100) NOT NULL,
	`user_tel` VARCHAR(25) NOT NULL,
	`user_mail` VARCHAR(30) NULL,
	`user_post` INT(6) NULL,
	`user_nick` VARCHAR(10) NULL,
	`user_point` INT(10) NULL DEFAULT '0',
	PRIMARY KEY (`user_id`)
)
COLLATE='utf8_general_ci'
;

CREATE TABLE `seller` (
	`seller_num` INT(10) NOT NULL AUTO_INCREMENT,
	`seller_type` VARCHAR(20) NOT NULL,
	`seller_name` VARCHAR(30) NOT NULL,
	`seller_tell` VARCHAR(50) NOT NULL,
	`seller_phone` VARCHAR(50) NOT NULL,
	`seller_addr` VARCHAR(100) NOT NULL,
	`seller_img` VARCHAR(50) NULL,
	`seller_comment` VARCHAR(50) NULL,
	`seller_passwd` VARCHAR(50) NOT NULL,
	`seller_id` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`seller_num`)
)
COLLATE='utf8_general_ci'
;

CREATE TABLE `menu` (
	`menu_code` INT(20) NOT NULL AUTO_INCREMENT,
	`seller_num` INT(10) NOT NULL,
	`menu_name` VARCHAR(20) NOT NULL,
	`menu_price` INT(10) NOT NULL,
	`seller_name` VARCHAR(30) NOT NULL,
	`seller_type` VARCHAR(20) NOT NULL,
	`menu_type` VARCHAR(20) NOT NULL,
	`menu_img` VARCHAR(50) NULL,
	PRIMARY KEY (`menu_code`),
	FOREIGN KEY(`seller_num`) REFERENCES seller(`seller_num`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
;

CREATE TABLE `review` (
	`review_num` INT(11) NOT NULL AUTO_INCREMENT,
	`seller_num` INT(11) NOT NULL,
	`user_id` VARCHAR(50) NOT NULL,
	`contents` VARCHAR(200) NOT NULL,
	`reply` VARCHAR(200) NULL,
	`review_date` DATE NOT NULL,
	PRIMARY KEY(`review_num`),
	FOREIGN KEY(`seller_num`) REFERENCES seller(`seller_num`) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(`user_id`) REFERENCES user(`user_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
;

CREATE TABLE `ord` (
	`order_num` INT(20) NOT NULL AUTO_INCREMENT,
	`user_id` VARCHAR(20) NOT NULL,
	`menu_code` INT(20) NOT NULL,
	`order_date` DATETIME NOT NULL,
	`order_addr` VARCHAR(100) NOT NULL,
	`client_tel` VARCHAR(25) NOT NULL,
	`quantity` VARCHAR(50) NOT NULL,
	`etc` VARCHAR(100) NULL,
	`seller_name` VARCHAR(30) NULL,
	`order_year` VARCHAR(50) NULL,
	`order_month` VARCHAR(50) NULL,
	`order_day` VARCHAR(50) NULL,
	`order_sum` INT(11) NULL,
	`discount` INT(11) NULL,
	`final_sum` INT(11) NULL,
	PRIMARY KEY (`order_num`),
	FOREIGN KEY(`user_id`) REFERENCES user(`user_id`) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(`menu_code`) REFERENCES menu(`menu_code`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
;

CREATE TABLE `qna` (
	`qna_id` INT(10) NOT NULL AUTO_INCREMENT,
	`user_id` VARCHAR(20) NOT NULL,
	`title` VARCHAR(50) NOT NULL,
	`type` VARCHAR(10) NOT NULL,
	`contents` VARCHAR(300) NOT NULL,
	PRIMARY KEY(`qna_id`),
	FOREIGN KEY(`user_id`) REFERENCES user(`user_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
;

CREATE TABLE `review` (
	`seller_num` INT(11) NULL,
	`user_id` VARCHAR(50) NOT NULL,
	`title` VARCHAR(50) NULL,
	`contents` VARCHAR(200) NOT NULL,
	`reply` VARCHAR(200) NULL,
	FOREIGN KEY(`seller_num`) REFERENCES seller(`seller_num`) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(`user_id`) REFERENCES user(`user_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
;

CREATE TABLE `reply` (
	`reply_num` INT(11) NOT NULL AUTO_INCREMENT,
	`review_num` INT(11) NOT NULL,
	`comment` VARCHAR(200) NULL DEFAULT NULL,
	`com_date` VARCHAR(50) NOT NULL,
	`seller_num` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`reply_num`),
	FOREIGN KEY(`seller_num`) REFERENCES seller(`seller_num`) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(`review_num`) REFERENCES review(`review_num`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci';