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
    ('groucho', 'marx', 'groucho@themarxbrothers.com', '18484 58th Street', 'NY', 98438, 'New York', 'USA'),
    ('Karen', 'Prescott', 'cary@kuvalis-carroll.co', '38077 Steffanie Valley', 'LA', '22361-7906', 'North Florenciomouth', '38077 Steffanie Valley', 'USA'),
    ('Justin', 'Ditmars', 'marquis@goyette.com', '27754 Heidenreich Path', 'CT', '19675-4297', 'Port Laquitaside', '27754 Heidenreich Path', 'USA'),
    ('Miriam', 'Noe', 'frances.schneider@lynch.info', '835 Shawn Circles', 'AL', '81896', 'Dustymouth', '835 Shawn Circles', 'USA'),
    ('Christopher', 'Saroop', 'zandra@mann.io', '418 Bashirian Port', 'LA', '48018', 'North Evangelineland', '418 Bashirian Port', 'USA'),
    ('Kathleen', 'Walker', 'leighann@murphy.net', '207 Tanya Trail', 'RI', '28724', 'Herzogton', '207 Tanya Trail', 'USA'),
    ('Carlos', 'Burgher', 'mike_stiedemann@mclaughlin.name', '997 Ana Rapids', 'MN', '81915-8403', 'Bodeburgh', '997 Ana Rapids', 'USA'),
    ('Amanda', 'Wagers', 'marquerite@mayert-bosco.org', '2398 Dick Prairie', 'LA', '97757-0097', 'New Concetta', '2398 Dick Prairie', 'USA'),
    ('George', 'Jackson', 'brock.bernier@daugherty.io', '784 Wiza Streets', 'FL', '55937-3793', 'New Tracey', '784 Wiza Streets', 'USA'),
    ('Vera', 'Harper', 'ian.deckow@crist.org', '5635 Vaughn Light', 'OK', '80942', 'East Phyllis', '5635 Vaughn Light', 'USA'),
    ('Ira', 'Shellenbarger', 'michael.wuckert@fay.com', '334 Vernon Canyon', 'IL', '84739-0376', 'Auertown', '334 Vernon Canyon', 'USA'),
    ('Lisa', 'Davidson', 'ramiro@leannon.info', '9117 Heathcote Place', 'AL', '02749-3411', 'Alexisfort', '9117 Heathcote Place', 'USA'),
    ('Vera', 'Hodgson', 'joey@ledner.name', '132 Kerry Lodge', 'IA', '91328-3758', 'South Cleofurt', '132 Kerry Lodge', 'USA'),
    ('Kathryn', 'Delapaz', 'kris.cassin@maggio.org', '7476 Rolfson Bridge', 'SC', '75286-1500', 'Vernitaview', '7476 Rolfson Bridge', 'USA'),
    ('Crystal', 'Salinas', 'griselda@heller.name', '5410 Howe Shores', 'WV', '19728', 'North Chesterhaven', '5410 Howe Shores', 'USA'),
    ('Mary', 'Cervantes', 'tamica.dickens@jones.net', '8873 Mills Springs', 'AK', '25765-1116', 'West Lyndon', '8873 Mills Springs', 'USA'),
    ('James', 'Franco', 'gabriel@gerlach-schinner.name', '94638 Goldner Pines', 'VT', '57376-4162', 'East Edytheville', '94638 Goldner Pines', 'USA'),
    ('Florence', 'Tabor', 'johnnie@goldner.org', '9546 Abshire Spur', 'WI', '68464-1058', 'South Fallon', '9546 Abshire Spur', 'USA'),
    ('Maria', 'Hamilton', 'cliff@stark.info', '8141 Bernier Tunnel', 'OK', '26689', 'New Mosehaven', '8141 Bernier Tunnel', 'USA'),
    ('Geraldine', 'Cloyd', 'franklyn.fay@waelchi-hills.co', '858 Calandra Coves', 'AR', '09935-6982', 'Everettechester', '858 Calandra Coves', 'USA'),
    ('James', 'Trout', 'stacy@rempel-langosh.biz', '363 Dannie Rapids', 'HI', '75862', 'West Mercy', '363 Dannie Rapids', 'USA'),
    ('Johnny', 'Cox', 'giuseppe@terry-boyle.io', '4638 Wanita Springs', 'AL', '19010-3599', 'West Joneland', '4638 Wanita Springs', 'USA'),
    ('Billie', 'Rothman', 'cary@stoltenberg.info', '165 Arleen Court', 'WY', '22512', 'New Keith', '165 Arleen Court', 'USA'),
    ('Karen', 'Lanzillo', 'stevie@mohr-donnelly.biz', '37673 Catrice Summit', 'VT', '92447', 'Wintheisertown', '37673 Catrice Summit', 'USA'),
    ('Ruth', 'Duncan', 'dolly@mcdermott-collins.name', '76358 Crist Forges', 'CT', '47602', 'New Malisaburgh', '76358 Crist Forges', 'USA'),
    ('Andrew', 'Lewis', 'zina@boyer-kozey.org', '53031 Demetrius Locks', 'IL', '08678', 'Rohanport', '53031 Demetrius Locks', 'USA'),
    ('Hattie', 'Kjar', 'mary@morar.com', '15118 Block Mountain', 'FL', '61825', 'South Orafort', '15118 Block Mountain', 'USA'),
    ('Mary', 'Causey', 'ismael@wiza-friesen.io', '12547 Olson Station', 'SD', '24310-0664', 'Lake Krischester', '12547 Olson Station', 'USA'),
    ('Phyllis', 'Simmons', 'jeanine_daugherty@simonis.org', '539 Chang Trafficway', 'WI', '29734', 'Kuhlmanmouth', '539 Chang Trafficway', 'USA'),
    ('John', 'Armstrong', 'judson@collins-carter.info', '4786 Porter Meadows', 'MO', '41678-7086', 'Hanemouth', '4786 Porter Meadows', 'USA'),
    ('Marjorie', 'Byers', 'roosevelt@koch.org', '946 Tracey Squares', 'MI', '47375-0830', 'Alishiaburgh', '946 Tracey Squares', 'USA'),
    ('Mary', 'Giard', 'tiny@weber.org', '5364 Dach Tunnel', 'AR', '91357', 'North Dwayneshire', '5364 Dach Tunnel', 'USA'),
    ('Pamela', 'Mcclain', 'cleopatra@labadie.io', '848 Greenfelder Court', 'IN', '03753', 'Yosthaven', '848 Greenfelder Court', 'USA'),
    ('Randal', 'Milstead', 'cathi@keeling.com', '160 Vanesa Club', 'SC', '73993-0543', 'South Sally', '160 Vanesa Club', 'USA'),
    ('Donna', 'Mchargue', 'janetta.cronin@schultz.info', '7897 Upton Crossroad', 'ID', '11357-8448', 'Port Jarredborough', '7897 Upton Crossroad', 'USA'),
    ('Amy', 'Anderson', 'desmond@bradtke.biz', '77247 Brandi Pike', 'SC', '95772-7097', 'North Ronnie', '77247 Brandi Pike', 'USA');    

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
