CREATE DATABASE  IF NOT EXISTS `house-of-fire`;
USE `house-of-fire`;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `qty_on_hand` int NOT NULL,
  PRIMARY KEY (`product_id`)
);

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
);

CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `review_date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `rating` int NOT NULL,
  `review_text` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  CONSTRAINT `review_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `review_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `product_Id` int NOT NULL,
  `purchase_date` datetime NOT NULL,
  `quantity` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  CONSTRAINT `transaction_product_id` FOREIGN KEY (`product_Id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `transaction_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

insert into user 
	(first_name, last_name, email, address, state, postal_code, city, country)
	values
    ('jared', 'scarr', 'email@email.com', '1234 Nowhere street', 'WA', 98026, 'Edmonds', 'USA'),
    ('mike', 'murphy', 'themurph@email.com', '1234 Nowhere street', 'WA', 98026, 'Edmonds', 'USA'),
    ('derrek', 'do', 'derrekdoesthings@email.com', '1234 Nowhere street', 'WA', 98026, 'Edmonds', 'USA'),
    ('petar', 'spasic', 'petarpetarpetar@email.com', '1234 Nowhere street', 'WA', 98026, 'Edmonds', 'USA'),
    ('groucho', 'marx', 'groucho@themarxbrothers.com', '18484 58th Street', 'NY', 98438, 'New York', 'USA');

insert into product (name, price, qty_on_hand)
	values
    ('sticker', 3.59, 2000),
    ('party hat', 10.39, 4000),
    ('streamer', 5.49, 1000),
    ('balloon', 1.99, 6000),
    ('mask', 5.99, 10000);

insert into review (product_id, review_date, user_id, rating, review_text)
	values
    (1, '2023-01-01', 2, 5, 'super good'),
    (1, '2023-01-01', 2, 5, 'super good'),
    (1, '2023-01-01', 2, 5, 'super good'),
    (2, '2023-01-01', 4, 0, 'super bad'),
    (2, '2023-01-01', 3, 5, 'super good'),
    (3, '2023-01-01', 3, 0, 'super bad'),
    (4, '2023-01-01', 3, 5, 'super good');

insert into transaction (product_id, purchase_date, quantity, user_id)
	values
    (1, '2022-11-13', 100, 2),
    (2, '2022-12-01', 40, 3),
    (2, '2022-12-01', 500, 2),
    (4, '2022-10-10', 200, 3),
     (1, '2022-07-17', 10, 1);
 
SELECT * from user;