DROP DATABASE IF EXISTS `house-of-fire`;
CREATE DATABASE  IF NOT EXISTS `house-of-fire`;
USE `house-of-fire`;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` text,
  `price` float NOT NULL,
  `qty_on_hand` int NOT NULL DEFAULT 0,
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
  `review_text` text DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  CONSTRAINT `review_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `review_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `purchase_date` datetime NOT NULL,
  `quantity` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  CONSTRAINT `transaction_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `transaction_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

insert into user 
	(first_name, last_name, email, address, state, postal_code, city, country)
	values
    ('jared', 'scarr', 'email@email.com', '1234 Nowhere street', 'WA', '98026', 'Edmonds', 'USA'),
    ('mike', 'murphy', 'themurph@email.com', '1234 Nowhere street', 'WA', '98026', 'Edmonds', 'USA'),
    ('derrek', 'do', 'derrekdoesthings@email.com', '1234 Nowhere street', 'WA', '98026', 'Edmonds', 'USA'),
    ('petar', 'spasic', 'petarpetarpetar@email.com', '1234 Nowhere street', 'WA', '98026', 'Edmonds', 'USA'),
    ('groucho', 'marx', 'groucho@themarxbrothers.com', '18484 58th Street', 'NY', '98438', 'New York', 'USA'),
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
    ('David', 'Drake', 'yuk.bahringer@morar-baumbach.org', '9414 Emard Roads', 'UT', '91335', 'Jaynemouth', 'USA');

insert into product (name, type, price, description, qty_on_hand)
	values
	('BlazeGuard','Fire-resistant clothing',49.99,'BlazeGuard offers premium fire-resistant clothing that combines style and safety. Made with advanced flame-resistant materials, this collection provides reliable protection in high-temperature environments.',7),
	('InfernoScent','Fragrance line',29.99,'Experience the captivating allure of InfernoScent, a fragrance line inspired by the mesmerizing beauty of fire. Each scent embodies warmth and intensity, leaving a trail of seductive notes that ignite the senses.',5),
	('FlameFusion','Energy drink',2.99,'Power up your day with FlameFusion, the ultimate energy drink that delivers a burst of fiery vitality. Packed with a potent blend of natural ingredients and a hint of spicy flavor, it ignites your energy levels and fuels your passion.',1),
	('EmberGlow','Home decor candles',19.99,'Create an inviting ambiance with EmberGlow home decor candles. Crafted with care, these candles cast a warm, comforting glow that dances playfully, bringing the enchanting essence of flickering flames to your living space.',9),
	('PyroPeak','Outdoor adventure gear',99.99,'Conquer the great outdoors with PyroPeak, a range of premium adventure gear designed for thrill-seekers. From rugged backpacks to durable tents and innovative tools, PyroPeak equips you for unforgettable expeditions.',6),
	('FireSpark','Fireworks',19.99,'Light up the night sky with FireSpark fireworks. Crafted with meticulous attention to detail, these vibrant and spectacular pyrotechnics deliver an awe-inspiring display of dazzling colors and breathtaking patterns.',8),
	('IgniteX','High-performance car engine',5999.99,'Unleash the power of IgniteX, a high-performance car engine that sets your vehicle ablaze with unrivaled speed and exhilaration. Built with cutting-edge technology and precision engineering, it\'s the ultimate choice for automotive enthusiasts.',0),
	('ScorchWave','Surfboard',499.99,'Ride the ScorchWave and catch the wildest waves with confidence. This high-performance surfboard is meticulously crafted to deliver unmatched stability, maneuverability, and speed, giving you the ultimate surfing experience.',10),
	('HeatRider','Heated motorcycle gloves',149.99,'Keep your hands warm and comfortable during chilly rides with HeatRider heated motorcycle gloves. These technologically advanced gloves feature built-in heating elements and superior insulation, ensuring optimal warmth and dexterity on the road.',1),
	('FieryAura','Yoga mat',39.99,'Enhance your yoga practice with FieryAura, a premium yoga mat that radiates energy and inspires focus. Its textured surface provides a secure grip, while the vibrant fire-inspired design adds a touch of passion to your sessions.',8),
	('FlareBlitz','Sports shoes',79.99,'Ignite your athletic performance with FlareBlitz sports shoes. Designed for speed and agility, these lightweight shoes feature advanced cushioning, excellent traction, and a sleek, fiery design that sets you apart on the field or court.',5),
	('InfernoBurst','Hot sauce',7.99,'Prepare your taste buds for a fiery explosion with InfernoBurst hot sauce. Made from a unique blend of the hottest peppers and spices, this sauce adds intense heat and a bold kick to your favorite dishes.',0),
	('BurnoutBlaze','Automotive racing tires',199.99,'Experience unmatched speed and precision on the racetrack with BurnoutBlaze racing tires. Engineered for maximum grip and durability, these high-performance tires deliver superior handling and control, setting the stage for victory.',3),
	('TorchFlame','Portable camping stove',49.99,'Embrace the spirit of adventure with TorchFlame, a portable camping stove that ensures delicious meals even in the most remote locations. With its powerful flame and compact design, it provides reliable heat for cooking outdoors.',6),
	('IgnitionGlow','Lighter',9.99,'IgnitionGlow is not just an ordinary lighter—it\'s a compact and reliable fire-starting companion. With its sleek design, powerful flame, and easy-to-use functionality, it guarantees quick and hassle-free ignition in any situation.',0),
	('FirestormX','Gaming laptop',1299.99,'Unleash your gaming prowess with FirestormX, the ultimate gaming laptop that sets the gaming world ablaze. Boasting top-of-the-line specifications, stunning visuals, and blazing-fast performance, it\'s your gateway to immersive gaming adventures.',2),
	('Emberstrike','Martial arts gloves',79.99,'Enhance your combat skills with Emberstrike, the gloves that combine superior protection with exceptional flexibility. Engineered with state-of-the-art materials and reinforced padding, these gloves empower you to unleash your full martial arts potential.',1),
	('BlazeTrail','Hiking backpack',89.99,'Embark on epic outdoor expeditions with BlazeTrail, the hiking backpack that ignites your wanderlust. Crafted with durable materials and smart storage compartments, it offers ample space and comfort for all your hiking essentials.',7),
	('PyroWave','Bluetooth speaker',69.99,'Set the mood and amplify your music with PyroWave, the Bluetooth speaker that delivers explosive sound quality. With its dynamic audio performance and captivating light effects, it creates an immersive auditory and visual experience.',0),
	('FlameShimmer','Hair styling tool',59.99,'Elevate your hairstyling game with FlameShimmer, the versatile hair styling tool that adds a touch of glamour to your locks. From sleek straightening to voluminous curls, it\'s your go-to companion for achieving stunning hairstyles with a fiery flair.',1),
	('IncineratorX','BBQ grill',299.99,'Ignite your inner grill master with the IncineratorX BBQ grill. This high-quality grill features advanced temperature control, ample cooking space, and a robust construction that ensures even heat distribution, allowing you to sear and sizzle your favorite meats and vegetables to perfection.',10),
	('IgniteForce','Fitness supplement',39.99,'IgniteForce is the ultimate fitness supplement designed to unleash your maximum potential. Packed with powerful ingredients and formulated to boost energy, enhance endurance, and accelerate recovery, it fuels your workouts and helps you achieve your fitness goals.',7),
	('ScorchFlicker','Photography light kit',199.99,'Illuminate your photography with ScorchFlicker, a professional light kit that brings out the true brilliance of your subjects. With adjustable intensity and temperature settings, it offers precise lighting control for captivating and vibrant shots.',1),
	('InfernoGaze','Sunglasses',149.99,'Set your sights on style with InfernoGaze sunglasses. These sleek and contemporary shades feature polarized lenses that not only provide exceptional UV protection but also offer enhanced clarity and a fiery aesthetic that complements any outfit.',4),
	('HeatWave','Heating pad',29.99,'Ease tension and soothe your muscles with HeatWave heating pad. Designed for targeted relief, this portable and adjustable pad delivers a comforting heat that penetrates deep into your body, providing soothing warmth and relaxation.',4),
	('FireGlimmer','Jewelry collection',299.99,'FireGlimmer presents an exquisite jewelry collection that captures the essence of fire\'s radiant beauty. Crafted with precision and adorned with sparkling gemstones, each piece showcases a captivating and fiery brilliance that illuminates any occasion.',10),
	('BlazeBurst','Action figure',14.99,'Unleash the action-packed adventures with BlazeBurst action figures. These highly detailed and poseable figures embody the spirit of bravery and heroism, bringing the excitement of fiery battles and epic storytelling to life.',2),
	('EmberVortex','Vacuum cleaner',149.99,'Experience the cleaning power of EmberVortex, a high-performance vacuum cleaner that leaves no trace of dust or debris. With its advanced suction technology and innovative design, it effortlessly captures dirt, ensuring a spotless and pristine environment.',4),
	('InfernoRise','Energy bar',2.49,'Fuel your active lifestyle with InfernoRise energy bars. Bursting with nutritious ingredients and a blend of energizing flavors, these bars provide a quick and convenient source of sustainable energy for those who are always on the go.',5),
	('BurnoutSpark','Racing motorcycle',12999.99,'Unleash the thrill of speed with BurnoutSpark racing motorcycles. Built for adrenaline seekers, these powerful and agile bikes combine cutting-edge engineering, sleek aesthetics, and unrivaled performance to dominate the racetrack.',0),
	('TorchFury','Flashlight',19.99,'Illuminate the darkness with TorchFury, the reliable and powerful flashlight that guides your path. Featuring a long-lasting battery, durable construction, and a focused beam of intense light, it\'s the perfect companion for outdoor adventures and emergency situations.',0),
	('IgnitionGlow','Fire pit',199.99,'Create a warm and inviting atmosphere with IgnitionGlow fire pit. Crafted with premium materials and a sleek design, this fire pit not only provides a captivating display of flickering flames but also offers a cozy gathering spot for memorable outdoor moments.',0),
	('FirestormPulse','Wireless earbuds',99.99,'Immerse yourself in music with FirestormPulse wireless earbuds. Featuring high-fidelity sound, comfortable fit, and seamless connectivity, these earbuds deliver an electrifying audio experience, allowing you to enjoy your favorite tunes with fiery passion.',8),
	('EmberFlash','Camera flash',79.99,'Illuminate your photography with EmberFlash camera flash. Designed to enhance lighting in low-light situations, this versatile flash unit delivers a burst of light that ignites every scene, capturing the finest details and adding a captivating glow to your photos.',0),
	('BlazeThrust','Power tool set',249.99,'Empower your DIY projects with BlazeThrust power tool set. This comprehensive collection of high-quality tools, including drills, saws, and drivers, is engineered to deliver maximum performance and precision, igniting your creativity and craftsmanship.',3),
	('PyroLuminous','Paint set',29.99,'Ignite your artistic expression with PyroLuminous paint set. These vibrant and high-quality paints, inspired by the colors of fire, allow you to unleash your creativity and bring your artwork to life with a fiery palette that captures attention.',9),
	('FlameDazzle','Nail polish',7.99,'Set your nails ablaze with FlameDazzle nail polish. This collection of fiery hues and sparkling finishes adds a touch of glamour and elegance to your manicure, ensuring your nails become the center of attention wherever you go.',4),
	('IncineratorRage','Gaming console',499.99,'Immerse yourself in a world of gaming with IncineratorRage gaming console. Designed for ultimate performance and seamless gameplay, this console sets the gaming arena on fire with its powerful hardware, advanced features, and immersive graphics.',7),
	('IgniteBlitz','Clothing iron',49.99,'IgniteBlitz clothing iron revolutionizes your ironing experience. With its powerful steam output, smooth glide, and innovative features, this iron ensures effortless and efficient wrinkle removal, leaving your garments with a pristine, fire-inspired finish.',9),
	('ScorchFlare','Outdoor grill',299.99,'Embrace the sizzle and flavor of outdoor cooking with ScorchFlare grill. This versatile and durable grill features precise temperature control, ample cooking space, and a stylish design that ignites your passion for grilling delicious meals in the great outdoors.',3),
	('InfernoWhisper','Electric kettle',39.99,'Heat water with speed and style using InfernoWhisper electric kettle. Boasting a sleek design and rapid boiling technology, this kettle efficiently brings water to a boil, releasing steam and a fiery whistle sound that signals the perfect cup of tea or coffee.',4),
	('BlazeSprint','Running shoes',89.99,'Ignite your running performance with BlazeSprint running shoes. Engineered for speed and comfort, these lightweight and responsive shoes provide optimal cushioning, traction, and breathability, empowering you to reach new levels of speed and agility.',3),
	('EmberBloom','Flower arrangement',49.99,'Experience the fiery elegance of EmberBloom flower arrangements. Combining vibrant blooms, rich colors, and artistic flair, each arrangement captures the essence of a flickering flame, adding a touch of warmth and beauty to any space.',4),
	('PyroStrike','Soccer ball',29.99,'Set the field ablaze with PyroStrike soccer ball. Designed for precision and control, this high-performance ball features a durable construction and aerodynamic design that ensures optimal flight and accuracy, sparking excitement on the soccer pitch.',1),
	('FlameQuench','Hydration backpack',79.99,'Stay hydrated during your adventures with FlameQuench hydration backpack. This innovative backpack combines a spacious storage compartment with a hydration bladder, allowing you to quench your thirst while keeping essential gear close at hand.',6),
	('IgniteRhythm','Music streaming service',9.99,'IgniteRhythm is the ultimate music streaming service that sets your playlists on fire. With an extensive library of fiery tracks spanning various genres, curated playlists, and personalized recommendations, it fuels your passion for music.',0),
	('ScorchBlast','Hairdryer',59.99,'Achieve salon-quality results with ScorchBlast hairdryer. Engineered with advanced technology and a powerful airflow, this hairdryer dries and styles your hair in a flash, leaving you with a voluminous, sleek, and fire-inspired look.',3),
	('EmberEssence','Aromatherapy diffuser',39.99,'Transform your space into a haven of tranquility with EmberEssence aromatherapy diffuser. Emitting a gentle mist infused with fragrant essential oils, this diffuser creates a soothing ambiance and adds a touch of fire-inspired serenity to any room.',0),
	('BurnoutFury','Racing video game',59.99,'Experience the adrenaline-fueled excitement of BurnoutFury, the ultimate racing video game. With stunning graphics, intense gameplay, and a wide selection of blazing fast cars, it immerses you in a world of high-speed races and fiery competition.',3),
	('TorchGlide','Roller skates',89.99,'Light up the streets with TorchGlide roller skates. These stylish and high-performance skates feature LED lights that create a dazzling display as you glide, bringing an electrifying and fiery flair to your skating adventures.',10);
insert into review (product_id, review_date, user_id, rating, review_text)
	values
    (1, '2023-01-01', 2, 5, 'super good'),
    (1, '2023-01-01', 2, 5, 'super good'),
    (1, '2023-01-01', 2, 5, 'super good'),
    (2, '2023-01-01', 4, 0, 'super bad'),
    (2, '2023-01-01', 3, 5, 'super good'),
    (3, '2023-01-01', 3, 0, 'super bad'),
    (4, '2023-01-01', 3, 5, 'super good'),
    (1, '2022-03-11', 16, 4, 'The BlazeGuard fire-resistant clothing is well-made and offers good protection. However, the sizing runs a bit small, so consider ordering a size up.'),
    (12, '2022-02-28', 17, 5, 'InfernoBurst hot sauce is my new favorite! It\'s got a serious kick but also a depth of flavor that\'s not always found in hot sauces. Will buy again!'),
    (17, '2022-06-17', 39, 3, 'Emberstrike martial arts gloves offer decent protection but the material is a bit stiff and needs time to break in. Not bad, but there are better options.'),
    (24, '2022-03-16', 29, 2, 'The InfernoGaze sunglasses look stylish but they\'re not very durable. Mine broke after a few weeks of light use.'),
    (29, '2022-07-08', 32, 4, 'InfernoRise energy bars taste great and provide a solid energy boost. They\'re a bit crumbly though, so be careful when eating on the go.'),
    (30, '2022-01-13', 22, 5, 'The BurnoutSpark racing motorcycle is an absolute thrill to ride. It\'s fast, handles well, and looks stunning. If you love speed, this is the bike for you.'),
    (35, '2021-11-06', 32, 3, 'The BlazeThrust power tool set offers good value for the price. The tools are durable enough for basic home repairs, but professional craftsmen might want something more robust.'),
    (41, '2021-10-23', 23, 1, 'The InfernoWhisper electric kettle broke after a few uses. It initially heated water quickly, but then it just stopped working. Not recommended.'),
    (47, '2021-06-19', 22, 5, 'The ScorchBlast hairdryer is fantastic! It dries my hair quickly without causing any damage. The different heat settings are a big plus.'),
    (49, '2022-06-15', 35, 4, 'BurnoutFury is a fun racing video game with good graphics and controls. The storyline could be better, but overall, it\'s a good game for racing fans.'),
    (5, '2021-10-27', 27, 5, 'PyroPeak outdoor adventure gear is durable and well-designed. From camping to hiking, these products have really enhanced my outdoor experiences.'),
    (13, '2023-02-13', 16, 4, 'The BurnoutBlaze racing tires offer good traction and handle well in various conditions. They\'re a bit pricier than other brands, but worth it for serious racers.'),
    (15, '2022-11-22', 34, 2, 'The IgnitionGlow lighter was disappointing. It worked well for the first few days, but then started to leak fluid. I wouldn\'t recommend it.'),
    (19, '2023-02-17', 15, 4, 'The PyroWave Bluetooth speaker delivers great sound quality and the battery life is impressive. It\'s portable and sturdy, too. However, the Bluetooth connection can be a bit finicky at times.'),
    (23, '2022-07-16', 38, 3, 'The ScorchFlicker photography light kit is decent for beginners but doesn\'t offer the level of control experienced photographers might want. It\'s reasonably priced but you get what you pay for.'),
    (28, '2022-07-10', 31, 1, 'The EmberVortex vacuum cleaner has a weak suction and frequently gets clogged. I ended up returning it after a week.'),
    (34, '2023-02-06', 11, 5, 'The EmberFlash camera flash has significantly improved my low-light photography. It\'s easy to attach, adjust, and doesn\'t drain the battery as quickly as my old flash did.'),
    (36, '2023-03-28', 2, 4, 'The PyroLuminous paint set has a nice range of colors and the pigment quality is good. However, some of the paints dry out quickly if not used promptly.'),
    (40, '2021-08-10', 4, 2, 'The ScorchFlare outdoor grill was difficult to assemble and the heat distribution seems uneven. I wouldn\'t recommend it for serious grillers.'),
    (45, '2023-02-03', 1, 5, 'The FlameQuench hydration backpack is a game-changer for my long-distance runs. It\'s lightweight, comfortable, and the water flow from the hydration system is excellent.'),
    (4, '2023-05-02', 40, 5, 'EmberGlow candles are amazing. They burn evenly, last long, and the scents are subtle and relaxing. They add a wonderful ambiance to my home.'),
    (6, '2022-03-10', 20, 3, 'FireSpark fireworks are okay. They were colorful and pretty, but didn\'t last as long as I\'d have liked. Also, a couple of them failed to ignite.'),
    (8, '2023-05-03', 7, 4, 'The ScorchWave surfboard is fantastic! It\'s light, maneuverable, and rides smoothly. The design is also really cool. I just wish it came with a carrying bag.'),
    (10, '2021-08-20', 35, 2, 'The FieryAura yoga mat is decent, but it slips a bit during intense sessions. Also, it\'s thinner than I expected.'),
    (16, '2021-06-18', 12, 5, 'The FirestormX gaming laptop is a beast! It runs all my games smoothly, doesn\'t overheat, and the screen quality is top-notch. Absolutely worth every penny.'),
    (21, '2022-06-11', 40, 3, 'The IncineratorX BBQ grill is good, but the assembly instructions were a bit confusing. Once assembled, it grills well and has a decent cooking area.'),
    (26, '2021-06-26', 25, 4, 'The FireGlimmer jewelry collection is gorgeous. The designs are unique and the quality seems good. However, the earrings were a bit heavier than I\'d like.'),
    (32, '2021-10-06', 3, 1, 'I was disappointed with the IgnitionGlow fire pit. It started rusting after only a few uses. I wouldn\'t recommend it.'),
    (38, '2022-09-04', 2, 5, 'The IncineratorRage gaming console delivers excellent performance and graphics. The controllers are comfortable and responsive. It\'s everything a gamer could want.'),
    (44, '2022-01-04', 15, 4, 'The PyroStrike soccer ball is well made and keeps its shape even after intense play. My son loves it. It loses half a star because it arrived deflated, but that\'s a minor issue.'),
    (2, '2022-01-16', 16, 5, 'InfernoScent is my new favorite fragrance line. It has a rich, long-lasting aroma that\'s not overpowering. It\'s absolutely perfect for any occasion.'),
    (9, '2022-05-21', 38, 4, 'The ScorchWave surfboard is lightweight and durable. It handles waves well, but it\'s a bit slippery, so be sure to wax it properly.'),
    (14, '2021-09-04', 12, 3, 'The TorchFlame camping stove is compact and heats up quickly. However, the fuel consumption is higher than I expected.'),
    (20, '2023-02-08', 36, 2, 'I had high hopes for the FlameShimmer hair styling tool, but it left my hair frizzy. It heats up fast, but the temperature control isn\'t great.'),
    (25, '2022-01-03', 25, 5, 'The HeatWave heating pad is a lifesaver for my back pain. It heats up quickly and the auto-off feature is a nice safety touch.'),
    (31, '2022-11-18', 1, 4, 'The TorchFury flashlight is very bright and lightweight. The battery life is impressive too. It loses half a star because the on/off button is a bit stiff.'),
    (37, '2023-02-26', 5, 3, 'The FlameDazzle nail polish colors are beautiful, but they chip easily. I love the variety but I wish it lasted longer.'),
    (43, '2022-09-16', 7, 4, 'The EmberBloom flower arrangement was a hit at my dinner party. The flowers were fresh and the arrangement was beautiful. However, it was smaller than I expected for the price.'),
    (48, '2022-05-29', 39, 1, 'I found the EmberEssence aromatherapy diffuser hard to operate and it stopped working after a few weeks. Not worth the money in my opinion.'),
    (50, '2022-08-17', 8, 5, 'The TorchGlide roller skates are comfortable and easy to control. The design is sleek and stylish too. A fun way to exercise!'),
    (3, '2021-10-27', 35, 4, 'FlameFusion definitely gives me the energy boost I need for my workouts. The taste is pretty good, but it\'s a bit too sweet for my liking.'),
    (7, '2021-09-17', 2, 3, 'The IgniteX engine is powerful and offers high performance. However, the installation process was a bit complex. I recommend professional installation if you\'re not mechanically inclined.'),
    (11, '2022-06-14', 35, 5, 'I love my FlareBlitz sports shoes! They\'re comfortable, stylish, and perfect for my gym routine. Great support and cushioning.'),
    (18, '2022-02-01', 2, 4, 'The BlazeTrail hiking backpack is durable, spacious, and comfortable. It\'s really light too. The only downside is the lack of a built-in hydration bladder.'),
    (22, '2021-08-19', 8, 2, 'I didn\'t notice much difference after using the IgniteForce fitness supplement. Also, it upset my stomach a bit. Maybe it works for others, but it didn\'t work for me.'),
    (27, '2022-03-28', 35, 3, 'The BlazeBurst action figure is well-made, but the articulation could be better. My kids like it, but it\'s not their favorite.'),
    (33, '2023-02-26', 11, 5, 'FirestormPulse wireless earbuds have excellent sound quality, and the battery life is impressive. They fit securely and comfortably in my ears. Highly recommended.'),
    (39, '2022-04-22', 17, 1, 'The IgniteBlitz clothing iron leaked water the second time I used it. It also doesn\'t glide smoothly over fabrics. Very disappointed.'),
    (42, '2023-01-27', 14, 5, 'The BlazeSprint running shoes are incredibly comfortable and lightweight. They\'ve improved my running experience significantly. Great shoes at a great price.'),
    (46, '2023-05-16', 18, 4, 'IgniteRhythm is a decent music streaming service with a good selection of songs. However, the user interface could be more intuitive. Still, I find it worth the subscription.'),
    (1, '2021-06-28', 15, 4, 'The BlazeGuard fire-resistant clothing is impressive. It\'s not just functional but also surprisingly comfortable. I feel much safer at work. However, the sizing could be improved.'),
    (2, '2021-06-29', 26, 3, 'InfernoScent is a unique fragrance. I\'ve received a lot of compliments when wearing it, though it\'s stronger than I usually prefer. Still, it lasts all day.'),
    (3, '2022-01-25', 26, 5, 'FlameFusion energy drink provides a great boost without the crash later. The taste is refreshing. It\'s now my go-to for long study sessions.'),
    (4, '2022-12-09', 6, 4, 'EmberGlow home decor candles add a warm, cozy ambiance to my living room. The scent is subtle and soothing. But watch out, they burn quicker than expected.'),
    (5, '2023-04-27', 22, 2, 'I was excited for the PyroPeak outdoor adventure gear but the quality didn\'t meet my expectations. The materials feel cheap and durability is questionable.'),
    (6, '2022-08-27', 18, 1, 'FireSpark fireworks were a letdown. Only half of them worked, and those that did weren\'t as vibrant as advertised.'),
    (7, '2021-10-22', 22, 4, 'IgniteX car engine has transformed my car\'s performance. It\'s noticeably smoother and more powerful. Installation was a bit challenging, though.'),
    (8, '2021-09-24', 38, 3, 'The ScorchWave surfboard is good for beginners but advanced surfers might find it lacking in control and responsiveness.'),
    (9, '2021-06-19', 15, 5, 'HeatRider heated motorcycle gloves are excellent. They keep my hands warm even on the coldest rides without sacrificing dexterity. Great for winter riding.'),
    (10, '2023-03-08', 30, 3, 'The FieryAura yoga mat is nicely cushioned and comfortable. However, it tends to slide a bit on hardwood floors.'),
    (11, '2022-06-18', 3, 5, 'FlareBlitz sports shoes are fantastic for my cardio routine. They offer great support and are really comfortable even for long workout sessions.'),
    (12, '2022-04-12', 27, 1, 'InfernoBurst hot sauce is too hot and overpowers the flavors of the food. It\'s also thinner than I prefer.'),
    (13, '2022-03-11', 3, 4, 'BurnoutBlaze racing tires have improved my car\'s grip and control significantly. The wear rate seems a bit high, but the performance is worth it.'),
    (14, '2022-08-15', 35, 5, 'TorchFlame camping stove is compact and highly efficient. It boils water quickly, and the flame control is great. Perfect for my camping trips.'),
    (15, '2023-04-11', 22, 2, 'IgnitionGlow lighter is stylish, but the flame isn\'t consistent and it ran out of fuel quickly. Not the quality I expected.'),
    (16, '2021-09-21', 1, 4, 'FirestormX gaming laptop handles all the latest games without any lag or overheating. The fan can get a bit loud, but it\'s a small price for its performance.'),
    (17, '2023-01-31', 7, 3, 'Emberstrike martial arts gloves are comfortable but lack sufficient padding. They\'re fine for light training, but not for heavy bag work.'),
    (18, '2022-11-21', 26, 5, 'BlazeTrail hiking backpack is spacious and durable. It\'s lightweight and has a lot of useful compartments. Would recommend for any hiking enthusiasts.'),
    (19, '2022-09-28', 31, 2, 'PyroWave Bluetooth speaker delivers decent sound, but the battery life is disappointing. It also takes a long time to fully charge.'),
    (20, '2021-12-21', 37, 4, 'The FlameShimmer hair styling tool heats up quickly and does a great job straightening and curling my hair. However, the handle gets hotter than it should.');    

insert into transaction (product_id, purchase_date, quantity, user_id)
	values
    (1, '2022-11-13', 10, 2),
    (2, '2022-12-01', 4, 3),
    (2, '2022-12-01', 50, 2),
    (4, '2022-10-10', 20, 3),
	(1, '2022-07-17', 1, 1),
    (1, '2022-02-25', 4, 16),
    (12, '2022-02-17', 18, 17),
    (17, '2022-06-09', 2, 39),
    (24, '2022-03-06', 9, 29),
    (29, '2022-07-06', 7, 32),
    (30, '2022-01-02', 9, 22),
    (35, '2021-10-26', 10, 32),
    (41, '2021-10-13', 3, 23),
    (47, '2021-06-08', 7, 22),
    (49, '2022-06-06', 18, 35),
    (5, '2021-10-14', 7, 27),
    (13, '2023-02-10', 16, 16),
    (15, '2022-11-18', 18, 34),
    (19, '2023-02-07', 11, 15),
    (23, '2022-07-07', 6, 38),
    (28, '2022-07-01', 17, 31),
    (34, '2023-02-01', 15, 11),
    (36, '2023-03-19', 14, 2),
    (40, '2021-08-02', 15, 4),
    (45, '2023-01-24', 20, 1),
    (4, '2023-04-30', 18, 40),
    (6, '2022-03-01', 13, 20),
    (8, '2023-04-19', 13, 7),
    (10, '2021-08-17', 13, 35),
    (16, '2021-06-12', 12, 12),
    (21, '2022-06-08', 16, 40),
    (26, '2021-06-13', 7, 25),
    (32, '2021-09-27', 1, 3),
    (38, '2022-08-22', 7, 2),
    (44, '2021-12-26', 9, 15),
    (2, '2022-01-04', 4, 16),
    (9, '2022-05-15', 19, 38),
    (14, '2021-08-23', 5, 12),
    (20, '2023-02-04', 10, 36),
    (25, '2021-12-23', 17, 25),
    (31, '2022-11-14', 8, 1),
    (37, '2023-02-15', 4, 5),
    (43, '2022-09-13', 17, 7),
    (48, '2022-05-19', 3, 39),
    (50, '2022-08-11', 1, 8),
    (3, '2021-10-23', 13, 35),
    (7, '2021-09-07', 17, 2),
    (11, '2022-06-07', 10, 35),
    (18, '2022-01-21', 14, 2),
    (22, '2021-08-07', 14, 8),
    (27, '2022-03-14', 16, 35),
    (33, '2023-02-14', 19, 11),
    (39, '2022-04-15', 18, 17),
    (42, '2023-01-15', 19, 14),
    (46, '2023-05-06', 16, 18),
    (1, '2021-06-20', 19, 15),
    (2, '2021-06-17', 19, 26),
    (3, '2022-01-13', 19, 26),
    (4, '2022-11-26', 3, 6),
    (5, '2023-04-22', 5, 22),
    (6, '2022-08-16', 14, 18),
    (7, '2021-10-15', 19, 22),
    (8, '2021-09-22', 15, 38),
    (9, '2021-06-08', 15, 15),
    (10, '2023-02-26', 2, 30),
    (11, '2022-06-17', 11, 3),
    (12, '2022-03-30', 2, 27),
    (13, '2022-02-28', 7, 3),
    (14, '2022-08-14', 6, 35),
    (15, '2023-04-01', 11, 22),
    (16, '2021-09-18', 19, 1),
    (17, '2023-01-29', 13, 7),
    (18, '2022-11-10', 13, 26),
    (19, '2022-09-26', 3, 31),
    (20, '2021-12-13', 19, 37);
    
