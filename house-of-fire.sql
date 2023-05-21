CREATE DATABASE  IF NOT EXISTS `house-of-fire`;
USE `house-of-fire`;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` text,
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
    ('David', 'Miller', 'hermila@ritchie-pouros.info', '2605 Pollich Port', 'WA', '67925', 'Shaniceborough', 'USA'),
    ('Antonia', 'Olivas', 'sanford.treutel@bashirian-rice.com', '9805 Jast Oval', 'UT', '01450', 'North Keira', 'USA'),
    ('Shirley', 'Henderson', 'ricki.schmitt@senger.co', '4578 Pa Squares', 'NM', '00757', 'New Gregorytown', 'USA'),
    ('Ruth', 'Hill', 'lou@morar.co', '634 Brekke Expressway', 'ID', '92339', 'North Orville', 'USA'),
    ('Ray', 'Garney', 'eli.wisozk@blanda.com', '17407 Hauck Loaf', 'DE', '00132', 'Port Kraigmouth', 'USA'),
    ('Connie', 'Kent', 'renaldo@rogahn.org', '184 Wilderman Forest', 'NH', '02283-6470', 'South Caleb', 'USA'),
    ('William', 'Perez', 'luigi.wilderman@bernhard-boyer.org', '92868 Johnston Drive', 'NV', '51161', 'Trompmouth', 'USA'),
    ('Dan', 'Gable', 'antionette@abernathy.biz', '92075 Hintz Roads', 'AK', '80602', 'West Rennafurt', 'USA'),
    ('John', 'Hall', 'derrick@bradtke.biz', '151 Romaguera Knolls', 'AK', '35789-3678', 'Hillschester', 'USA'),
    ('Tanya', 'Corley', 'elane_fadel@turcotte.biz', '97043 Buck Points', 'AK', '35024-5587', 'Alinastad', 'USA'),
    ('Terry', 'Bradley', 'sulema@schmeler.net', '435 Russel Ramp', 'RI', '84404-7653', 'North Efren', 'USA'),
    ('Maureen', 'Mcmahan', 'guillermo@goldner.biz', '698 Lockman Circle', 'NH', '35595-1718', 'South Randell', 'USA'),
    ('Andra', 'Norstrand', 'ariel_schaefer@gleason.io', '2278 Hettinger Shoal', 'NY', '21649', 'East Sherell', 'USA'),
    ('Linda', 'Cox', 'joeann.koepp@nitzsche-aufderhar.co', '527 Rosenbaum Port', 'MN', '24535-6905', 'New Ashlie', 'USA'),
    ('Susan', 'Rodriguez', 'edwardo@bergnaum-cummerata.co', '95127 Harry Walks', 'GA', '82226-8885', 'South Jeffreyview', 'USA'),
    ('Michael', 'Rodriguez', 'homer@wisozk-roob.io', '443 Witting Corners', 'VA', '32220', 'West Linwood', 'USA'),
    ('Joseph', 'Holloway', 'twana.runolfsson@goodwin-bartell.com', '3364 Belinda Turnpike', 'WA', '55319-0498', 'West Araceli', 'USA'),
    ('Douglas', 'Silvey', 'mariko@haag-kohler.co', '794 Harold Rapids', 'MO', '79192', 'Angleatown', 'USA'),
    ('Candace', 'Wolf', 'blair.grady@grady-anderson.net', '6642 Schaden Passage', 'IN', '31655', 'Remaburgh', 'USA'),
    ('Antonia', 'Garcia', 'fletcher@buckridge.com', '866 Romaguera Forest', 'KS', '19127', 'West Renae', 'USA'),
    ('Diane', 'Buchanan', 'wyatt@romaguera.info', '928 Skiles Plains', 'MO', '63434', 'West Zachery', 'USA'),
    ('Ella', 'Wade', 'zachery@christiansen.co', '120 Cormier Springs', 'AL', '06746-3353', 'Port Rolf', 'USA'),
    ('Abel', 'Johnson', 'tad@kshlerin.biz', '83347 Robin Trafficway', 'IN', '67843', 'Leciaburgh', 'USA'),
    ('Booker', 'Flora', 'ona@rohan.biz', '492 Wolff Circles', 'MA', '93344-5616', 'South Shantae', 'USA'),
    ('Landon', 'Urias', 'ruben.hyatt@sporer-durgan.net', '579 Kerluke Trace', 'AK', '41970-0689', 'Jimhaven', 'USA'),
    ('Fred', 'Hendrickson', 'jude@kulas-lesch.io', '581 Hauck Garden', 'NJ', '97870', 'Jonathonmouth', 'USA'),
    ('Rosa', 'Hendricks', 'mitzi@roberts.net', '889 Swaniawski Streets', 'MI', '48403-1751', 'Lake Lindsey', 'USA'),
    ('Gene', 'Maldonado', 'eugene@schaefer-predovic.org', '2921 Predovic Orchard', 'SD', '59874', 'Altonton', 'USA'),
    ('Richard', 'Moultry', 'tyrone.cassin@blick.co', '93902 Sammie Manor', 'DE', '46951', 'Jefffurt', 'USA'),
    ('Agnes', 'Mchugh', 'clint@purdy.com', '203 Marielle Islands', 'NY', '20074', 'Williamsonshire', 'USA'),
    ('Richard', 'Arguelles', 'noe_fadel@johnston.name', '630 Schuster Lake', 'VA', '32646', 'New Ellieshire', 'USA'),
    ('Charles', 'Owens', 'marissa.medhurst@mckenzie-mertz.io', '501 Mitchell Burg', 'HI', '46259-4311', 'East Jere', 'USA'),
    ('Jeremy', 'Mcdaniel', 'arvilla_zieme@lesch.co', '146 Clair Dam', 'LA', '28723', 'Hectorberg', 'USA'),
    ('Janet', 'Thon', 'sadie@oberbrunner.com', '372 Sam Knolls', 'KS', '49068', 'Lake Lala', 'USA'),
    ('David', 'Drake', 'yuk.bahringer@morar-baumbach.org', '9414 Emard Roads', 'UT', '91335', 'Jaynemouth', 'USA'),

insert into product (name, type, price, description, qty_on_hand)
	values
    ('BlazeGuard','Fire-resistant clothing',49.99,'BlazeGuard offers premium fire-resistant clothing that combines style and safety. Made with advanced flame-resistant materials, this collection provides reliable protection in high-temperature environments.'),
    ('InfernoScent','Fragrance line',29.99,'Experience the captivating allure of InfernoScent, a fragrance line inspired by the mesmerizing beauty of fire. Each scent embodies warmth and intensity, leaving a trail of seductive notes that ignite the senses.'),
    ('FlameFusion','Energy drink',2.99,'Power up your day with FlameFusion, the ultimate energy drink that delivers a burst of fiery vitality. Packed with a potent blend of natural ingredients and a hint of spicy flavor, it ignites your energy levels and fuels your passion.'),
    ('EmberGlow','Home decor candles',19.99,'Create an inviting ambiance with EmberGlow home decor candles. Crafted with care, these candles cast a warm, comforting glow that dances playfully, bringing the enchanting essence of flickering flames to your living space.'),
    ('PyroPeak','Outdoor adventure gear',99.99,'Conquer the great outdoors with PyroPeak, a range of premium adventure gear designed for thrill-seekers. From rugged backpacks to durable tents and innovative tools, PyroPeak equips you for unforgettable expeditions.'),
    ('FireSpark','Fireworks',19.99,'Light up the night sky with FireSpark fireworks. Crafted with meticulous attention to detail, these vibrant and spectacular pyrotechnics deliver an awe-inspiring display of dazzling colors and breathtaking patterns.'),
    ('IgniteX','High-performance car engine',5999.99,'Unleash the power of IgniteX, a high-performance car engine that sets your vehicle ablaze with unrivaled speed and exhilaration. Built with cutting-edge technology and precision engineering, it's the ultimate choice for automotive enthusiasts.'),
    ('ScorchWave','Surfboard',499.99,'Ride the ScorchWave and catch the wildest waves with confidence. This high-performance surfboard is meticulously crafted to deliver unmatched stability, maneuverability, and speed, giving you the ultimate surfing experience.'),
    ('HeatRider','Heated motorcycle gloves',149.99,'Keep your hands warm and comfortable during chilly rides with HeatRider heated motorcycle gloves. These technologically advanced gloves feature built-in heating elements and superior insulation, ensuring optimal warmth and dexterity on the road.'),
    ('FieryAura','Yoga mat',39.99,'Enhance your yoga practice with FieryAura, a premium yoga mat that radiates energy and inspires focus. Its textured surface provides a secure grip, while the vibrant fire-inspired design adds a touch of passion to your sessions.'),
    ('FlareBlitz','Sports shoes',79.99,'Ignite your athletic performance with FlareBlitz sports shoes. Designed for speed and agility, these lightweight shoes feature advanced cushioning, excellent traction, and a sleek, fiery design that sets you apart on the field or court.'),
    ('InfernoBurst','Hot sauce',7.99,'Prepare your taste buds for a fiery explosion with InfernoBurst hot sauce. Made from a unique blend of the hottest peppers and spices, this sauce adds intense heat and a bold kick to your favorite dishes.'),
    ('BurnoutBlaze','Automotive racing tires',199.99,'Experience unmatched speed and precision on the racetrack with BurnoutBlaze racing tires. Engineered for maximum grip and durability, these high-performance tires deliver superior handling and control, setting the stage for victory.'),
    ('TorchFlame','Portable camping stove',49.99,'Embrace the spirit of adventure with TorchFlame, a portable camping stove that ensures delicious meals even in the most remote locations. With its powerful flame and compact design, it provides reliable heat for cooking outdoors.'),
    ('IgnitionGlow','Lighter',9.99,'IgnitionGlow is not just an ordinary lighter—it's a compact and reliable fire-starting companion. With its sleek design, powerful flame, and easy-to-use functionality, it guarantees quick and hassle-free ignition in any situation.'),
    ('FirestormX','Gaming laptop',1299.99,'Unleash your gaming prowess with FirestormX, the ultimate gaming laptop that sets the gaming world ablaze. Boasting top-of-the-line specifications, stunning visuals, and blazing-fast performance, it's your gateway to immersive gaming adventures.'),
    ('Emberstrike','Martial arts gloves',79.99,'Enhance your combat skills with Emberstrike, the gloves that combine superior protection with exceptional flexibility. Engineered with state-of-the-art materials and reinforced padding, these gloves empower you to unleash your full martial arts potential.'),
    ('BlazeTrail','Hiking backpack',89.99,'Embark on epic outdoor expeditions with BlazeTrail, the hiking backpack that ignites your wanderlust. Crafted with durable materials and smart storage compartments, it offers ample space and comfort for all your hiking essentials.'),
    ('PyroWave','Bluetooth speaker',69.99,'Set the mood and amplify your music with PyroWave, the Bluetooth speaker that delivers explosive sound quality. With its dynamic audio performance and captivating light effects, it creates an immersive auditory and visual experience.'),
    ('FlameShimmer','Hair styling tool',59.99,'Elevate your hairstyling game with FlameShimmer, the versatile hair styling tool that adds a touch of glamour to your locks. From sleek straightening to voluminous curls, it's your go-to companion for achieving stunning hairstyles with a fiery flair.'),
    ('IncineratorX','BBQ grill',299.99,'Ignite your inner grill master with the IncineratorX BBQ grill. This high-quality grill features advanced temperature control, ample cooking space, and a robust construction that ensures even heat distribution, allowing you to sear and sizzle your favorite meats and vegetables to perfection.'),
    ('IgniteForce','Fitness supplement',39.99,'IgniteForce is the ultimate fitness supplement designed to unleash your maximum potential. Packed with powerful ingredients and formulated to boost energy, enhance endurance, and accelerate recovery, it fuels your workouts and helps you achieve your fitness goals.'),
    ('ScorchFlicker','Photography light kit',199.99,'Illuminate your photography with ScorchFlicker, a professional light kit that brings out the true brilliance of your subjects. With adjustable intensity and temperature settings, it offers precise lighting control for captivating and vibrant shots.'),
    ('InfernoGaze','Sunglasses',149.99,'Set your sights on style with InfernoGaze sunglasses. These sleek and contemporary shades feature polarized lenses that not only provide exceptional UV protection but also offer enhanced clarity and a fiery aesthetic that complements any outfit.'),
    ('HeatWave','Heating pad',29.99,'Ease tension and soothe your muscles with HeatWave heating pad. Designed for targeted relief, this portable and adjustable pad delivers a comforting heat that penetrates deep into your body, providing soothing warmth and relaxation.'),
    ('FireGlimmer','Jewelry collection',299.99,'FireGlimmer presents an exquisite jewelry collection that captures the essence of fire's radiant beauty. Crafted with precision and adorned with sparkling gemstones, each piece showcases a captivating and fiery brilliance that illuminates any occasion.'),
    ('BlazeBurst','Action figure',14.99,'Unleash the action-packed adventures with BlazeBurst action figures. These highly detailed and poseable figures embody the spirit of bravery and heroism, bringing the excitement of fiery battles and epic storytelling to life.'),
    ('EmberVortex','Vacuum cleaner',149.99,'Experience the cleaning power of EmberVortex, a high-performance vacuum cleaner that leaves no trace of dust or debris. With its advanced suction technology and innovative design, it effortlessly captures dirt, ensuring a spotless and pristine environment.'),
    ('InfernoRise','Energy bar',2.49,'Fuel your active lifestyle with InfernoRise energy bars. Bursting with nutritious ingredients and a blend of energizing flavors, these bars provide a quick and convenient source of sustainable energy for those who are always on the go.'),
    ('BurnoutSpark','Racing motorcycle',12999.99,'Unleash the thrill of speed with BurnoutSpark racing motorcycles. Built for adrenaline seekers, these powerful and agile bikes combine cutting-edge engineering, sleek aesthetics, and unrivaled performance to dominate the racetrack.'),
    ('TorchFury','Flashlight',19.99,'Illuminate the darkness with TorchFury, the reliable and powerful flashlight that guides your path. Featuring a long-lasting battery, durable construction, and a focused beam of intense light, it's the perfect companion for outdoor adventures and emergency situations.'),
    ('IgnitionGlow','Fire pit',199.99,'Create a warm and inviting atmosphere with IgnitionGlow fire pit. Crafted with premium materials and a sleek design, this fire pit not only provides a captivating display of flickering flames but also offers a cozy gathering spot for memorable outdoor moments.'),
    ('FirestormPulse','Wireless earbuds',99.99,'Immerse yourself in music with FirestormPulse wireless earbuds. Featuring high-fidelity sound, comfortable fit, and seamless connectivity, these earbuds deliver an electrifying audio experience, allowing you to enjoy your favorite tunes with fiery passion.'),
    ('EmberFlash','Camera flash',79.99,'Illuminate your photography with EmberFlash camera flash. Designed to enhance lighting in low-light situations, this versatile flash unit delivers a burst of light that ignites every scene, capturing the finest details and adding a captivating glow to your photos.'),
    ('BlazeThrust','Power tool set',249.99,'Empower your DIY projects with BlazeThrust power tool set. This comprehensive collection of high-quality tools, including drills, saws, and drivers, is engineered to deliver maximum performance and precision, igniting your creativity and craftsmanship.'),
    ('PyroLuminous','Paint set',29.99,'Ignite your artistic expression with PyroLuminous paint set. These vibrant and high-quality paints, inspired by the colors of fire, allow you to unleash your creativity and bring your artwork to life with a fiery palette that captures attention.'),
    ('FlameDazzle','Nail polish',7.99,'Set your nails ablaze with FlameDazzle nail polish. This collection of fiery hues and sparkling finishes adds a touch of glamour and elegance to your manicure, ensuring your nails become the center of attention wherever you go.'),
    ('IncineratorRage','Gaming console',499.99,'Immerse yourself in a world of gaming with IncineratorRage gaming console. Designed for ultimate performance and seamless gameplay, this console sets the gaming arena on fire with its powerful hardware, advanced features, and immersive graphics.'),
    ('IgniteBlitz','Clothing iron',49.99,'IgniteBlitz clothing iron revolutionizes your ironing experience. With its powerful steam output, smooth glide, and innovative features, this iron ensures effortless and efficient wrinkle removal, leaving your garments with a pristine, fire-inspired finish.'),
    ('ScorchFlare','Outdoor grill',299.99,'Embrace the sizzle and flavor of outdoor cooking with ScorchFlare grill. This versatile and durable grill features precise temperature control, ample cooking space, and a stylish design that ignites your passion for grilling delicious meals in the great outdoors.'),
    ('InfernoWhisper','Electric kettle',39.99,'Heat water with speed and style using InfernoWhisper electric kettle. Boasting a sleek design and rapid boiling technology, this kettle efficiently brings water to a boil, releasing steam and a fiery whistle sound that signals the perfect cup of tea or coffee.'),
    ('BlazeSprint','Running shoes',89.99,'Ignite your running performance with BlazeSprint running shoes. Engineered for speed and comfort, these lightweight and responsive shoes provide optimal cushioning, traction, and breathability, empowering you to reach new levels of speed and agility.'),
    ('EmberBloom','Flower arrangement',49.99,'Experience the fiery elegance of EmberBloom flower arrangements. Combining vibrant blooms, rich colors, and artistic flair, each arrangement captures the essence of a flickering flame, adding a touch of warmth and beauty to any space.'),
    ('PyroStrike','Soccer ball',29.99,'Set the field ablaze with PyroStrike soccer ball. Designed for precision and control, this high-performance ball features a durable construction and aerodynamic design that ensures optimal flight and accuracy, sparking excitement on the soccer pitch.'),
    ('FlameQuench','Hydration backpack',79.99,'Stay hydrated during your adventures with FlameQuench hydration backpack. This innovative backpack combines a spacious storage compartment with a hydration bladder, allowing you to quench your thirst while keeping essential gear close at hand.'),
    ('IgniteRhythm','Music streaming service',9.99,'IgniteRhythm is the ultimate music streaming service that sets your playlists on fire. With an extensive library of fiery tracks spanning various genres, curated playlists, and personalized recommendations, it fuels your passion for music.'),
    ('ScorchBlast','Hairdryer',59.99,'Achieve salon-quality results with ScorchBlast hairdryer. Engineered with advanced technology and a powerful airflow, this hairdryer dries and styles your hair in a flash, leaving you with a voluminous, sleek, and fire-inspired look.'),
    ('EmberEssence','Aromatherapy diffuser',39.99,'Transform your space into a haven of tranquility with EmberEssence aromatherapy diffuser. Emitting a gentle mist infused with fragrant essential oils, this diffuser creates a soothing ambiance and adds a touch of fire-inspired serenity to any room.'),
    ('BurnoutFury','Racing video game',59.99,'Experience the adrenaline-fueled excitement of BurnoutFury, the ultimate racing video game. With stunning graphics, intense gameplay, and a wide selection of blazing fast cars, it immerses you in a world of high-speed races and fiery competition.'),
    ('TorchGlide','Roller skates',89.99,'Light up the streets with TorchGlide roller skates. These stylish and high-performance skates feature LED lights that create a dazzling display as you glide, bringing an electrifying and fiery flair to your skating adventures.');
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
