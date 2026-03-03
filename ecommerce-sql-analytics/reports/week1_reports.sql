# Task 1
#Revenue by Day
SELECT 
    DATE(order_date) AS order_day,
    SUM(total_amount) AS revenue
FROM orders
WHERE status = 'Delivered'
GROUP BY DATE(order_date)
ORDER BY order_day;

#Revenue by Week
SELECT 
    YEAR(order_date) AS year,
    WEEK(order_date) AS week_no,
    SUM(total_amount) AS weekly_revenue
FROM orders
WHERE status = 'Delivered'
GROUP BY YEAR(order_date), WEEK(order_date);

#Top 5 Products by Revenue and Quality
SELECT 
    p.product_name,
    SUM(oi.line_total) AS total_revenue,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;


#Customers with No Orders
SELECT 
    c.customer_id,
    c.first_name,
    c.city,o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


#Customer Classification
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    CASE
        WHEN COUNT(order_id) > 1 THEN 'Repeat'
        ELSE 'One-Time'
    END AS customer_type
FROM orders
GROUP BY customer_id;

#Customer Lifetime Value
SELECT 
    c.customer_id,
    c.first_name,
    SUM(o.total_amount) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY lifetime_value DESC;

#Top 5 Customers by Revenue
SELECT 
    c.customer_id,
    c.first_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 5;
	
# View for Revenue_by_day
CREATE VIEW Revenue_by_day AS
SELECT 
    DATE(order_date) AS order_day,
    SUM(total_amount) AS revenue
FROM orders
WHERE status = 'Delivered'
GROUP BY DATE(order_date)
ORDER BY order_day;
select * from top_5_customer;

# View for Revenue by Week
 CREATE VIEW Revenue_by_week AS 
 SELECT 
    YEAR(order_date) AS year,
    WEEK(order_date) AS week_no,
    SUM(total_amount) AS weekly_revenue
FROM orders
WHERE status = 'Delivered'
GROUP BY YEAR(order_date), WEEK(order_date);
 
 # View for Top 5 Products by Revenue
 CREATE VIEW top_5_products AS
 SELECT 
    p.product_name,
    SUM(oi.line_total) AS total_revenue,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;
 
#Views for Customer with no orders
CREATE VIEW customer_no_order AS 
SELECT 
    c.customer_id,
    c.first_name,
    c.city
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

#Views for Customer Classification
CREATE VIEW Customer_classification AS
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    CASE
        WHEN COUNT(order_id) > 1 THEN 'Repeat'
        ELSE 'One-Time'
    END AS customer_type
FROM orders
GROUP BY customer_id;

# View for Customer lifetime value 
CREATE VIEW customer_lifetime AS
SELECT 
    c.customer_id,
    c.first_name,
    SUM(o.total_amount) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY lifetime_value DESC;

#View for top 5 customer with revenue
CREATE VIEW top_5_customer AS 
SELECT 
    c.customer_id,
    c.first_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 5;


#Top 5 Customers by Profit percentage
SELECT 
    c.customer_id,
    c.first_name,
    SUM(oi.line_total) AS total_revenue,
    SUM(oi.line_total - (p.cost * oi.quantity)) AS total_profit,
    ROUND(
        (SUM(oi.line_total - (p.cost * oi.quantity)) / SUM(oi.line_total)) * 100,
        2
    ) AS profit_percentage
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.first_name
ORDER BY profit_percentage DESC
LIMIT 5;

#View Top 5 Customers by Profit percentage
CREATE OR REPLACE VIEW Top5_customer_profit AS
SELECT 
    c.customer_id,
    c.first_name,
    SUM(oi.line_total) AS total_revenue,
    SUM(oi.line_total - (p.cost * oi.quantity)) AS total_profit,
    ROUND((SUM(oi.line_total - (p.cost * oi.quantity)) / SUM(oi.line_total)) * 100,2) AS profit_percentage
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.first_name
ORDER BY profit_percentage DESC
LIMIT 5;


SELECT * FROM top5_customer_profit;


SELECT 
    oi.product_id,
    oi.unit_price,
    p.cost
FROM order_items oi
JOIN products p 
ON oi.product_id = p.product_id
LIMIT 10;
select * ,case 
when cost>500 then 'success'
else 'failed'
end as test
from products;