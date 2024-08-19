SELECT * FROM countries;

SELECT name FROM countries ORDER BY population ASC LIMIT 1;

SELECT name
FROM countries
ORDER BY population DESC
LIMIT 1 OFFSET 1;

SELECT * FROM countries LIMIT 1;

SELECT COUNT(id) as number_of_countries FROM countries;

SELECT * FROM products;

SELECT DISTINCT `Product name` FROM products;

SELECT COUNT(`Product name`) FROM products WHERE `Parts name` = 'DCX';

SELECT `Model` FROM products ORDER BY `Max service years` DESC LIMIT 1;

SELECT AVG(`Max Weight`) as average_wieght FROM products;

SELECT * FROM celebrities;

SELECT COUNT(*) AS multiple_occupations_count
FROM celebrities
WHERE LENGTH(occupation) - LENGTH(REPLACE(occupation, ',', '')) + 1 > 1;

SELECT first_name
FROM celebrities
WHERE LENGTH(occupation) - LENGTH(REPLACE(occupation, ',', '')) + 1 > 3;

SELECT first_name
FROM celebrities
ORDER BY date_of_birth ASC LIMIT 1 ;

SELECT first_name
FROM celebrities
ORDER BY date_of_birth DESC LIMIT 1 ;

SELECT COUNT(*) FROM orders;

ALTER TABLE countries
ADD COLUMN continent VARCHAR(100);

UPDATE countries
SET continent = CASE
    WHEN name = 'USA' THEN 'North America'
    WHEN name = 'Germany' THEN 'Europe'
    WHEN name = 'France' THEN 'Europe'
    WHEN name = 'Korea' THEN 'Asia'
    ELSE continent
END
WHERE name IN ('USA', 'Germany', 'France', 'Korea');

DELETE FROM celebrities
WHERE occupation NOT LIKE '%Singer%';

ALTER TABLE celebrities
DROP COLUMN occupation;

RENAME TABLE celebrities TO singers;

SELECT * FROM singers;

DELETE FROM singers
WHERE uid BETWEEN 1 AND 10
AND uid NOT IN (8, 9);




