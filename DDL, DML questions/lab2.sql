CREATE DATABASE `SIC`;
USE `SIC`;

CREATE TABLE `countries` (
  `id` serial ,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `population` int NOT NULL,
  `latitude` decimal(10,8),
  `longitude` decimal(11,8),
  PRIMARY KEY (`name`)
);

CREATE TABLE `famous_people` (
  `uid` int NOT NULL AUTO_INCREMENT ,
  `name` varchar(100) NOT NULL,
  `occupation` varchar(150) NOT NULL,
  `birthday` varchar(150) NOT NULL,
  `existence` BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`uid`)
);

CREATE TABLE `products` (
	`pid` int NOT NULL AUTO_INCREMENT ,
  `Product name` varchar(75) NOT NULL  ,
  `Model` varchar(75) NOT NULL,
  `Max Weight` DECIMAL(8,3) CHECK (`Max Weight` BETWEEN 0.001 AND 40000.000),
  `Max service years` int NOT NULL,
  `Parts name` varchar(50),
  `Conservation status` CHAR(3),
  PRIMARY KEY (`pid`)
);

INSERT INTO products (`Product name`, model, `Max Weight`, `Max service years`, `Parts name`) VALUES
('DC motor', 'D940GB', 750, 15, 'DCX'),
('BLDC motor', 'SJ730GHE', 3800, 25, 'SNP'),
('AC motor', 'G8150BHE', 10000, 30, 'GDE');
SELECT * FROM products;


CREATE TABLE `orders` (
	`id` int NOT NULL AUTO_INCREMENT ,
  `customer_name` varchar(100) NOT NULL  ,
  `burger` varchar(50) NOT NULL,
  `side`  varchar(50),
  `drink` varchar(50),
  `order_total` DECIMAL(5,2) NOT NULL CHECK(`order_total` <= 100),
  PRIMARY KEY (`id`)
);

RENAME TABLE famous_people TO celebrities;

ALTER TABLE celebrities
CHANGE COLUMN name first_name VARCHAR(80);

ALTER TABLE celebrities
ADD COLUMN  last_name VARCHAR(100) NOT NULL;

ALTER TABLE celebrities
CHANGE COLUMN birthday date_of_birth DATE NOT NULL;

ALTER TABLE products
MODIFY COLUMN `Max Weight`DECIMAL(8,3) CHECK(`Max Weight` BETWEEN 0.0001 AND 200000.0000);

ALTER TABLE products
ADD CONSTRAINT `Model` UNIQUE(`Model`);

ALTER TABLE orders
ADD COLUMN email_address VARCHAR(50);

ALTER TABLE orders
ADD COLUMN customer_loyalty_points INT DEFAULT 0  ,
ADD COLUMN burger_cost DECIMAL(5,2) CHECK(burger_cost <= 100) DEFAULT 0 , 
ADD COLUMN side_cost DECIMAL(5,2) CHECK(side_cost <= 100) DEFAULT 0 ,
ADD COLUMN drink_cost DECIMAL(5,2) CHECK(drink_cost <= 100) DEFAULT 0 ,
DROP COLUMN order_total;
