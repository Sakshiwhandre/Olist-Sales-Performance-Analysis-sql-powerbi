-- insights

-- how many total numbers of orders does the company have?
SELECT 
    COUNT(*) AS total_orders
FROM
    olist_orders_dataset;
 
 -- how many orders are delievered , canceled,shipped,etc?
 SELECT order_status, COUNT(*) AS total_orders
 FROM olist_orders_dataset
 GROUP BY order_status
 ORDER BY total_orders DESC;
 
 -- delivery success rate
 -- fulfilling rate
 SELECT 
    ROUND(SUM(CASE
                WHEN order_status = 'delivered' THEN 1
                ELSE 0
            END) / COUNT(*) * 100,
            2) AS delivery_success_rate
FROM
    olist_orders_dataset;
    
-- cancellation rate

SELECT 
    ROUND(SUM(CASE
                WHEN order_status = 'canceled' THEN 1
                ELSE 0
            END) / COUNT(*) * 100,
            2) AS cancellation_rate
FROM
    olist_orders_dataset;
    
-- an order increasing or decrasing over time?
SELECT 
    DATE(order_purchase_timestamp) AS order_date,
    COUNT(*) AS total_orders
FROM
    olist_orders_dataset
GROUP BY order_date
ORDER BY order_date;
    
-- monthly order trend
SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%y-%m') AS month,
    COUNT(*) AS total_orders
FROM
    olist_orders_dataset
GROUP BY month
ORDER BY month;

-- monthly revenue trend
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%y-%m') AS month,
    SUM(oi.price) AS total_revenue
FROM
    olist_orders_dataset o
        JOIN
    olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- calculate AOV(average order value)
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%y-%m') AS month,
    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id),
            2) AS avg_order_value
FROM
    olist_orders_dataset o
        JOIN
    olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- product performance
-- which products are driving revenue
SELECT 
    p.product_category_name,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM
    olist_order_items_dataset oi
        JOIN
    olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC;

-- proftitablity analysis
SELECT 
    p.product_category_name,
    ROUND(SUM(oi.price - oi.freight_value), 2) AS estimated_profit
FROM
    olist_order_items_dataset oi
        JOIN
    olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY estimated_profit DESC;

-- detect loss-making categories
SELECT 
    p.product_category_name,
    ROUND(SUM(oi.price - oi.freight_value), 2) AS estimated_profit
FROM
    olist_order_items_dataset oi
        JOIN
    olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
HAVING estimated_profit < 0
ORDER BY estimated_profit;

-- customer behaviour analysis
SELECT 
    CASE
        WHEN COUNT(o.order_id) > 1 THEN 'Repeat Customer'
        ELSE 'one-time Customers'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM
    olist_orders_dataset o
GROUP BY o.customer_id;

SELECT 
    customer_type, COUNT(*) AS total_customers
FROM
    (SELECT 
        customer_id,
            CASE
                WHEN COUNT(order_id) > 1 THEN 'repeat customers'
                ELSE 'one-time customers'
            END AS customer_type
    FROM
        olist_orders_dataset
    GROUP BY customer_id) t
GROUP BY customer_type;

SELECT 
    customer_type, COUNT(*) AS total_customers
FROM
    (SELECT 
        c.customer_unique_id,
            CASE
                WHEN COUNT(o.order_id) > 1 THEN 'Repeat Customer'
                ELSE 'One-time Customer'
            END AS customer_type
    FROM
        olist_orders_dataset o
    JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id) t
GROUP BY customer_type;

SELECT 
    CASE
        WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 'Late Delivery'
        ELSE 'On-Time Delivery'
    END AS delivery_status,
    COUNT(*) AS total_orders
FROM
    olist_orders_dataset
WHERE
    order_delivered_customer_date IS NOT NULL
        AND order_estimated_delivery_date IS NOT NULL
GROUP BY delivery_status;

-- delievery delay in days
SELECT 
    ROUND(AVG(DATEDIFF(order_delivered_customer_date,
                    order_estimated_delivery_date)),
            2) AS avg_delay_days
FROM
    olist_orders_dataset
WHERE
    order_delivered_customer_date > order_estimated_delivery_date;
    
 -- late delievery by state
 SELECT c.customer_state,COUNT(*) AS late_orders
 FROM olist_orders_dataset o 
 JOIN olist_customers_dataset c
 ON o.customer_id = c.customer_id 
 WHERE o.order_delivered_customer_date > o.order_estimated_delivery_date
 GROUP BY c.customer_state
 ORDER BY late_orders DESC;