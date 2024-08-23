INSERT INTO customers (customer_name, cusotmer_email) VALUES
('Shaun Silverman', 'shaun.silver@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Brown', 'bob.brown@example.com');


INSERT INTO orders (customer_id, order_status, order_id) VALUES
(1, 'completed', 1),
(2, 'in progress', 2),
(3, 'completed', 3),
(4, 'placed', 4);

INSERT INTO products (product_name, product_cost , redeem_points) VALUES
('sandwich', 999.99 , 5),
('fries', 699.99 , 3),
('fries', 399.99 , 3 ),
('drink', 199.99 , 1);

INSERT INTO order_items (order_id, product_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 1);

SELECT name , continent_name FROM countries
INNER JOIN continent ON countries.continent_id = continent.continent_id;

SELECT name , capital FROM countries
INNER JOIN continent ON countries.continent_id = continent.continent_id
WHERE continent_name = 'Asia' ;


SELECT 
    o.order_id, 
    c.customer_name AS customer_name, 
    p.product_name AS product_name
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id;


SELECT DISTINCT 
    o.order_id
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
WHERE 
    o.order_id NOT IN (
        SELECT 
            o2.order_id
        FROM 
            orders o2
        JOIN 
            order_items oi2 ON o2.order_id = oi2.order_id
        JOIN 
            products p2 ON oi2.product_id = p2.product_id
        WHERE 
            p2.product_name = 'sandwich'
    );


SELECT DISTINCT 
    c.customer_name AS customer_name
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
WHERE 
    o.order_id IN (
        SELECT 
            o.order_id
        FROM 
            orders o
        JOIN 
            order_items oi ON o.order_id = oi.order_id
        JOIN 
            products p ON oi.product_id = p.product_id
        WHERE 
            o.order_id NOT IN (
                SELECT 
                    o2.order_id
                FROM 
                    orders o2
                JOIN 
                    order_items oi2 ON o2.order_id = oi2.order_id
                JOIN 
                    products p2 ON oi2.product_id = p2.product_id
                WHERE 
                    p2.product_name = 'sandwich'
            )
    );

SELECT 
    SUM(p.product_cost) AS total_cost
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
WHERE 
    c.customer_name = 'Shaun Silverman';


SELECT 
    p.product_name AS product_name, 
    COUNT(oi.product_id) AS total_orders
FROM 
    products p
JOIN 
    order_items oi ON p.product_id = oi.product_id
GROUP BY 
    p.product_name;
