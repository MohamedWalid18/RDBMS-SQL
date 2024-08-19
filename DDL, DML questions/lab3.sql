INSERT INTO countries (`name`, `city`,`population`) VALUES
('USA', 'Washington D.C.', 333098437),
('Germany', 'Berlin', 84073352),
('France', 'Paris', 65426179),
('Korea', 'Seoul', 51305186);
SELECT * FROM countries;


INSERT INTO celebrities (first_name, last_name, date_of_birth,occupation) VALUES
('Namjoon', 'Kim', '1994-09-12','Singer'),
('Jeongguk', 'Jeon', '1997-09-01','Singer'),
('Yoongi', 'Min', '1993-03-09','Singer'),
('Hoseok', 'Jung', '1994-02-18','Singer'),
('Taehyun', 'Kim', '1995-12-30','Writer'),
('Jimin', 'Park', '1995-10-13','Writer'),
('Seokjin', 'Kim', '1992-12-04','Writer');


INSERT INTO celebrities (first_name, last_name, date_of_birth,occupation) VALUES
('Yong', 'Cho', '1915-12-12','Singer, Actor'),
('SY', 'Lee', '1962-07-03','Actor');

ALTER TABLE celebrities
ADD COLUMN Deceased BOOLEAN DEFAULT FALSE;

INSERT INTO celebrities (first_name, last_name, date_of_birth,occupation, Deceased) VALUES
('Jason',  '' ,'1968-08-15','Singer, Actress' , FALSE ),
('Henry', '', '1961-11-06','Singer, Songwriter, Actor' , TRUE);

ALTER TABLE celebrities
MODIFY COLUMN last_name VARCHAR(100) NULL;

INSERT INTO orders (customer_name, email_address, burger , side , drink , customer_loyalty_points , burger_cost , side_cost , drink_cost) VALUES
('Henry Kim', 'henry@lab.com', 'cheeseburger', 'fries', 'soda' , 10 , 5 , 1.50 , 0.99),
('Shaun Silverman', 'shaun@lab.com', 'cheeseburger & chicken burger, ', 'onion ring , chocolate shake &  fries', 'soda' , 20 , 13 , 5.5 , 0.99),
('Jason Gomez', NULL,NULL, 'onion rings, strawberry shake' ,NULL, 4 , 0 , 4 , 0);

ALTER TABLE orders
MODIFY COLUMN burger VARCHAR(100) NULL;

SELECT population FROM countries WHERE name = 'Korea';

SELECT population,city FROM countries;

SELECT name FROM countries ORDER BY name ASC;

SELECT name,city,population FROM countries ORDER BY population DESC;

SELECT name,city,population FROM countries ORDER BY population ASC;

SELECT name FROM countries WHERE population < 100000000;

SELECT name FROM countries WHERE population BETWEEN 50000000 AND 100000000;

SELECT `Product name` , `Model` , `Max Weight` , `Max service years` 
FROM products 
ORDER BY 'Max service years' ASC;

SELECT `Product name`  
FROM products 
ORDER BY `Max Weight` DESC;

SELECT first_name , last_name
FROM celebrities WHERE Deceased = False;

SELECT first_name , last_name
FROM celebrities
WHERE date_of_birth > 1990-12-12
ORDER BY date_of_birth ASC;

SELECT first_name , last_name
FROM celebrities
WHERE occupation = 'Singer, Actress' AND occupation ='Singer, Songwriter, Actor';

SELECT first_name , last_name
FROM celebrities
ORDER BY date_of_birth DESC;

SELECT * FROM orders;

ALTER TABLE orders
ADD COLUMN total_cost DECIMAL(10,2) AS (burger_cost + drink_cost + side_cost);

SELECT customer_name FROM orders ORDER BY total_cost DESC;

SELECT email_address FROM orders WHERE email_address IS NOT NULL; 


SELECT customer_name FROM orders WHERE side LIKE '%fries%';

SELECT customer_name FROM orders WHERE side LIKE '%shake%';

SELECT customer_name FROM orders WHERE burger IS NULL;




