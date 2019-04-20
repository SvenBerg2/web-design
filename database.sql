SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cdworlddb
-- -----------------------------------------------------
-- database for cdworld project
-- 

-- -----------------------------------------------------
-- Schema cdworlddb
--
-- database for cdworld project
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cdworlddb` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `cdworlddb` ;

-- -----------------------------------------------------
-- Table `cdworlddb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`customer` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(32) NULL,
  `last_name` VARCHAR(32) NULL,
  `address` VARCHAR(255) NULL,
  `city` VARCHAR(32) NULL,
  `country` VARCHAR(16) NULL,
  `post_code` VARCHAR(8) NULL,
  `phone_number` VARCHAR(11) NULL,
  `email` VARCHAR(64) NULL,
  `password` VARCHAR(32) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`shipping` (
  `shipping_id` INT NOT NULL,
  `shipping_date` DATE NULL,
  PRIMARY KEY (`shipping_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`payment` (
  `payment_id` INT NOT NULL,
  `customer_customer_id` INT NOT NULL,
  `payment_date` DATE NULL,
  `payment_amount` DECIMAL(16,2) NULL,
  `payment_method` VARCHAR(16) NULL,
  PRIMARY KEY (`payment_id`, `customer_customer_id`),
  CONSTRAINT `fk_table1_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `cdworlddb`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`order` (
  `order_id` INT NOT NULL,
  `order_date` DATE NULL,
  `order_status` VARCHAR(16) BINARY NULL,
  `total_quantity` INT NULL,
  `total_amount` DECIMAL(16,2) NULL,
  `tax` DECIMAL(16,2) NULL,
  `shipping_shipping_id` INT NOT NULL,
  `payment_payment_id` INT NOT NULL,
  `customer_customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `shipping_shipping_id`, `payment_payment_id`, `customer_customer_id`),
  CONSTRAINT `fk_order_shipping1`
    FOREIGN KEY (`shipping_shipping_id`)
    REFERENCES `cdworlddb`.`shipping` (`shipping_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_payment1`
    FOREIGN KEY (`payment_payment_id`)
    REFERENCES `cdworlddb`.`payment` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `cdworlddb`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`cart` (
  `cart_id` INT NOT NULL,
  `cart_quantity` INT NULL,
  `cart_amount` DECIMAL(16,2) NULL,
  `date_added` DATE NULL,
  PRIMARY KEY (`cart_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`category` (
  `category_id` VARCHAR(8) NOT NULL,
  `category_name` VARCHAR(16) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`product` (
  `product_id` VARCHAR(16) NOT NULL,
  `product_name` VARCHAR(64) NULL,
  `product_price` DECIMAL(16,2) NULL,
  `release_date` DATE NULL,
  `status` VARCHAR(45) NULL,
  `image1` VARCHAR(255) NULL,
  `image2` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `category_category_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`product_id`, `category_category_id`),
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `cdworlddb`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`order_detail` (
  `order_quantity` INT NULL,
  `order_price` DECIMAL(16,2) NULL,
  `delivered_date` DATE NULL,
  `order_order_id` INT NOT NULL,
  `order_customer_customer_id` INT NOT NULL,
  `order_shipping_shipping_id` INT NOT NULL,
  `product_product_id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`order_order_id`, `order_customer_customer_id`, `order_shipping_shipping_id`, `product_product_id`),
  CONSTRAINT `fk_order_detail_order1`
    FOREIGN KEY (`order_order_id` , `order_shipping_shipping_id`)
    REFERENCES `cdworlddb`.`order` (`order_id` , `shipping_shipping_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_detail_product1`
    FOREIGN KEY (`product_product_id`)
    REFERENCES `cdworlddb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`cart_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`cart_detail` (
  `cd_quantity` INT NULL,
  `cd_amount` DECIMAL(16,2) NULL,
  `cart_cart_id` INT NOT NULL,
  `product_product_id` VARCHAR(16) NOT NULL,
  `product_category_category_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`cart_cart_id`, `product_product_id`, `product_category_category_id`),
  CONSTRAINT `fk_cart_detail_cart1`
    FOREIGN KEY (`cart_cart_id`)
    REFERENCES `cdworlddb`.`cart` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_detail_product1`
    FOREIGN KEY (`product_product_id` , `product_category_category_id`)
    REFERENCES `cdworlddb`.`product` (`product_id` , `category_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`movie` (
  `movie_name` VARCHAR(32) NULL,
  `director_name` VARCHAR(64) NULL,
  `studio_name` VARCHAR(64) NULL,
  `movie_genre` VARCHAR(32) NULL,
  `duration` VARCHAR(8) NULL,
  `product_product_id` VARCHAR(16) NOT NULL,
  `product_category_category_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`product_product_id`, `product_category_category_id`),
  CONSTRAINT `fk_movie_product1`
    FOREIGN KEY (`product_product_id` , `product_category_category_id`)
    REFERENCES `cdworlddb`.`product` (`product_id` , `category_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`music`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`music` (
  `album_name` VARCHAR(32) NOT NULL,
  `artist_name` VARCHAR(64) NULL,
  `label` VARCHAR(64) NULL,
  `music_genre` VARCHAR(32) NULL,
  `product_product_id` VARCHAR(16) NOT NULL,
  `product_category_category_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`album_name`, `product_product_id`, `product_category_category_id`),
  CONSTRAINT `fk_music_product1`
    FOREIGN KEY (`product_product_id` , `product_category_category_id`)
    REFERENCES `cdworlddb`.`product` (`product_id` , `category_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdworlddb`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`game` (
  `game_name` VARCHAR(64) NOT NULL,
  `developer_name` VARCHAR(64) NULL,
  `publisher_name` VARCHAR(64) NULL,
  `game_genre` VARCHAR(32) NULL,
  `product_product_id` VARCHAR(16) NOT NULL,
  `product_category_category_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`game_name`, `product_product_id`, `product_category_category_id`),
  CONSTRAINT `fk_game_product1`
    FOREIGN KEY (`product_product_id` , `product_category_category_id`)
    REFERENCES `cdworlddb`.`product` (`product_id` , `category_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `cdworlddb` ;

-- -----------------------------------------------------
-- Placeholder table for view `cdworlddb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdworlddb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `cdworlddb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdworlddb`.`view1`;
USE `cdworlddb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

