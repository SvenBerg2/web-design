SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
--
-- Database: `cdworlddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_quantity` int(11) DEFAULT NULL,
  `cart_amount` decimal(16,2) DEFAULT NULL,
  `date_added` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `cd_quantity` int(11) DEFAULT NULL,
  `cd_amount` decimal(16,2) DEFAULT NULL,
  `cart_cart_id` int(11) NOT NULL,
  `product_product_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `product_category_category_id` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` varchar(8) COLLATE utf8_bin NOT NULL,
  `category_name` varchar(16) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
('GAME', 'Game'),
('MOVIE', 'Movie'),
('MUSIC', 'Music');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `post_code` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `phone_number` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `address`, `city`, `country`, `post_code`, `phone_number`, `email`, `password`) VALUES
(6, 'Myo', 'Phone', 'Flat 3, 128 Sunningfields Road\r\nHendon', 'London', 'United Kingdom', 'NW4 4RE', '7862689942', 'myomyintphone@outlook.com', '12345678'),
(7, 'John', 'Smith', 'ABC', 'London', 'United Kingdom', 'NW4 4RE', '7862689942', 'johnsmith@outlook.com', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `game_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `developer_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `publisher_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `game_genre` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `product_product_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `product_category_category_id` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `director_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `studio_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `movie_genre` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `duration` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `product_product_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `product_category_category_id` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_name`, `director_name`, `studio_name`, `movie_genre`, `duration`, `product_product_id`, `product_category_category_id`) VALUES
('Seven Samurai', 'Akira Kurosawa', ' Toho Studios', 'Foreign', '207 ', 'SEVSAMBLR', 'MOVIE');

-- --------------------------------------------------------

--
-- Table structure for table `music`
--

CREATE TABLE `music` (
  `album_name` varchar(32) COLLATE utf8_bin NOT NULL,
  `artist_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `label` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `music_genre` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `product_product_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `product_category_category_id` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `music`
--

INSERT INTO `music` (`album_name`, `artist_name`, `label`, `music_genre`, `product_product_id`, `product_category_category_id`) VALUES
('Screaming for Vengeance: Remaste', 'Judas Priest', 'Columbia', 'Heavy Metal', 'JPSFVCD', 'MUSIC');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `total_amount` decimal(16,2) DEFAULT NULL,
  `shipping_shipping_id` int(11) NOT NULL,
  `payment_payment_id` int(11) NOT NULL,
  `customer_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_quantity` int(11) DEFAULT NULL,
  `order_price` decimal(16,2) DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `order_order_id` int(11) NOT NULL,
  `order_customer_customer_id` int(11) NOT NULL,
  `order_shipping_shipping_id` int(11) NOT NULL,
  `product_product_id` varchar(16) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `customer_customer_id` int(11) NOT NULL,
  `payment_amount` decimal(16,2) DEFAULT NULL,
  `payment_method` varchar(16) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `product_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `product_price` decimal(16,2) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `status` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `image1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `category_category_id` varchar(8) COLLATE utf8_bin NOT NULL,
  `product_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `release_date`, `status`, `image1`, `image2`, `description`, `category_category_id`, `product_quantity`) VALUES
('JPSFVCD', 'Judas Priest - Screaming for Vengeance: Remastered', '4.99', '2001-04-30', 'In Stock', 'JPSFVCD_1.jpg', '', 'Heavy metal album by Judas Priest.', 'MUSIC', 100),
('SEVSAMBLR', 'Seven Samurai Blu-ray', '9.99', '2014-08-25', 'In Stock', 'SEVSAMBLR_1.jpg', 'SEVSAMBLR_2.jpg', 'Directed by Akira Kurosawa.', 'MOVIE', 10);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL,
  `shipping_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`cart_cart_id`,`product_product_id`,`product_category_category_id`),
  ADD KEY `fk_cart_detail_product1` (`product_product_id`,`product_category_category_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`game_name`,`product_product_id`,`product_category_category_id`),
  ADD KEY `fk_game_product1` (`product_product_id`,`product_category_category_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`product_product_id`,`product_category_category_id`);

--
-- Indexes for table `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`album_name`,`product_product_id`,`product_category_category_id`),
  ADD KEY `fk_music_product1` (`product_product_id`,`product_category_category_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`,`shipping_shipping_id`,`payment_payment_id`,`customer_customer_id`),
  ADD KEY `fk_order_payment1` (`payment_payment_id`),
  ADD KEY `shipping_shipping_id` (`shipping_shipping_id`),
  ADD KEY `fk_order_customer1` (`customer_customer_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_order_id`,`order_customer_customer_id`,`order_shipping_shipping_id`,`product_product_id`),
  ADD KEY `fk_order_detail_order1` (`order_order_id`,`order_shipping_shipping_id`),
  ADD KEY `fk_order_detail_product1` (`product_product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`,`customer_customer_id`),
  ADD KEY `fk_table1_customer1` (`customer_customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`,`category_category_id`),
  ADD KEY `fk_product_category1` (`category_category_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `customer_customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `customer_customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `fk_cart_detail_cart1` FOREIGN KEY (`cart_cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cart_detail_product1` FOREIGN KEY (`product_product_id`,`product_category_category_id`) REFERENCES `product` (`product_id`, `category_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `fk_game_product1` FOREIGN KEY (`product_product_id`,`product_category_category_id`) REFERENCES `product` (`product_id`, `category_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `fk_movie_product1` FOREIGN KEY (`product_product_id`,`product_category_category_id`) REFERENCES `product` (`product_id`, `category_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `music`
--
ALTER TABLE `music`
  ADD CONSTRAINT `fk_music_product1` FOREIGN KEY (`product_product_id`,`product_category_category_id`) REFERENCES `product` (`product_id`, `category_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_payment1` FOREIGN KEY (`payment_payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_shipping1` FOREIGN KEY (`shipping_shipping_id`) REFERENCES `shipping` (`shipping_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `fk_order_detail_order1` FOREIGN KEY (`order_order_id`,`order_shipping_shipping_id`) REFERENCES `order` (`order_id`, `shipping_shipping_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_detail_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_table1_customer1` FOREIGN KEY (`customer_customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
