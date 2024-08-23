CREATE TABLE continent(
continent_id INT NOT NULL AUTO_INCREMENT , 
continent_name VARCHAR(50) NULL , 
PRIMARY KEY (continent_id)
);

INSERT INTO continent(continent_id,continent_name) VALUES
 (1,'Africa'),(2 , 'Asia') , (3 , 'Europe') , (4 , 'North America'),(5 ,'South America');

DELETE FROM countries;

INSERT INTO countries (name, capital, population, continent_id) VALUES 
('USA', 'Washington D.C.', 333098437, (SELECT continent_id FROM continent WHERE continent_name = 'North America')),
('Germany', 'Berlin', 84073552, (SELECT continent_id FROM continent WHERE continent_name = 'Europe')),
('France', 'Paris', 65426179, (SELECT continent_id FROM continent WHERE continent_name = 'Europe')),
('Korea', 'Seoul', 51305186, (SELECT continent_id FROM continent WHERE continent_name = 'Asia')),
('Mexico', 'Mexico City', 130262216, (SELECT continent_id FROM continent WHERE continent_name = 'North America')),
('Egypt', 'Cairo', 104258327, (SELECT continent_id FROM continent WHERE continent_name = 'Africa'));

SELECT * FROM countries;


CREATE TABLE customers(
customer_id INT AUTO_INCREMENT NOT NULL , 
customer_name VARCHAR(50) , 
cusotmer_email VARCHAR(50) ,
PRIMARY KEY (customer_id)
);

CREATE TABLE orders(
order_id INT AUTO_INCREMENT NOT NULL ,
order_status VARCHAR(50) ,
customer_id INT ,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
PRIMARY KEY (order_id)) ;

CREATE TABLE order_items(
item_id INT AUTO_INCREMENT NOT NULL ,
order_id INT ,
product_id INT , 
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id),
PRIMARY KEY (item_id)
);


DROP TABLE products;

CREATE TABLE products(
product_id INT AUTO_INCREMENT NOT NULL ,
product_name VARCHAR(50) ,
product_cost DECIMAL(5,2) ,
redeem_points DECIMAL(5,2) ,
PRIMARY KEY (product_id)
);