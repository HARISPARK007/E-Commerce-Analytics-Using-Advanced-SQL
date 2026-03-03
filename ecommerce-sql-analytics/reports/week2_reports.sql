#Task 2



#Monthly Revenue Trend with MoM % Change 


	with cte as (
	select
	date_format(order_date,'%y-%m') as months,
	sum(total_amount) as monthly_revenue,
	lag(sum(total_amount))over(order by date_format(order_date,'%y-%m') ) as previous_month_revenue

	from orders
	where status='Delivered'
	group by months
	)
	select
	months,monthly_revenue,previous_month_revenue,
	monthly_revenue-previous_month_revenue as monthly_difference,
    round(((monthly_revenue-previous_month_revenue)/previous_month_revenue)*100,0) as mom_percentage_revenue
	from cte ;
    
 

-- rfm customer scoring
WITH customer_rfm AS (
    SELECT 
        customer_id,
        MAX(order_date) AS last_order_date,
        COUNT(order_id) AS frequency,
        SUM(total_amount) AS monetary
    FROM orders
    WHERE status = 'Delivered'
    GROUP BY customer_id
),

rfm_scores AS (
    SELECT 
        customer_id,
        DATEDIFF(CURDATE(), last_order_date) AS recency,
        frequency,
        monetary,
        NTILE(5) OVER (ORDER BY DATEDIFF(CURDATE(), last_order_date) ASC) AS recency_score,
        NTILE(5) OVER (ORDER BY frequency DESC) AS frequency_score,
        NTILE(5) OVER (ORDER BY monetary DESC) AS monetary_score
    FROM customer_rfm
)

SELECT *,
       (recency_score + frequency_score + monetary_score) AS rfm_total_score
FROM rfm_scores
ORDER BY rfm_total_score DESC;


#Customer Cohort Retention
#Get each customer's first purchase month (Cohort Month)
WITH cohort_cte AS (
    SELECT
        customer_id,
        DATE_FORMAT(MIN(order_date), '%Y-%m-01') AS cohort_month
    FROM orders
    GROUP BY customer_id
),
# Get each order with its order month
orders_cte AS (
    SELECT customer_id,
        DATE_FORMAT(order_date, '%Y-%m-01') AS order_month
    FROM orders 
),
# Join and calculate month difference
retention_cte AS (
    SELECT c.customer_id,
        c.cohort_month,
        o.order_month,
        TIMESTAMPDIFF(MONTH, c.cohort_month, o.order_month) AS month_number
    FROM cohort_cte c
    JOIN orders_cte o
        ON c.customer_id = o.customer_id
),
# how many unique customers active in cohort month
active_users AS (
    SELECT
        cohort_month,
        month_number,
        COUNT(DISTINCT customer_id) AS active_customers
    FROM retention_cte
    GROUP BY cohort_month, month_number
),
# Get cohort sizes (first purchase users count)
cohort_size AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM cohort_cte
    GROUP BY cohort_month
)
# Final Retention Table 
SELECT
    a.cohort_month,

    ROUND(100 * SUM(CASE WHEN month_number = 0 THEN active_customers ELSE 0 END) 
          / MAX(cs.total_customers), 2) AS Month_0,

    ROUND(100 * SUM(CASE WHEN month_number = 1 THEN active_customers ELSE 0 END) 
          / MAX(cs.total_customers), 2) AS Month_1,

    ROUND(100 * SUM(CASE WHEN month_number = 2 THEN active_customers ELSE 0 END) 
          / MAX(cs.total_customers), 2) AS Month_2,

    ROUND(100 * SUM(CASE WHEN month_number = 3 THEN active_customers ELSE 0 END) 
          / MAX(cs.total_customers), 2) AS Month_3

FROM active_users a
JOIN cohort_size cs
    ON a.cohort_month = cs.cohort_month
	
GROUP BY a.cohort_month
ORDER BY a.cohort_month;






# customer first purchase vs repeat purchase revenue
with ranking as (
select *, row_number() over(partition by customer_id order by order_date) as order_number from orders where status='Delivered'
)
select customer_id ,
sum(case when order_number=1 then total_amount else 0 end ) as first_purchase_amount,
sum( case when order_number>1 then total_amount else 0 end ) as repeat_purchase_amount,

round
((sum( case when order_number=1 then total_amount else 0 end )* 100)/sum(total_amount),2) as first_purchase_percent,
round
((sum( case when order_number> 1 then total_amount else 0 end )* 100)/sum(total_amount),2) as repeat_purchase_percent
from ranking 
group by customer_id;
	
#Customer Churn Risk Segmentation

with last_purchase as(
select customer_id,date_format(max(order_date),'%y-%m-%d')as last_purchase_date 
from orders 
where status='Delivered' 
group by customer_id)
select customer_id ,datediff(current_date(),last_purchase_date )as interval_last,last_purchase_date ,
case
when datediff(current_date(),last_purchase_date) <=30 then "low risk"
when datediff(current_date(),last_purchase_date) <=60 then "medium risk"
when datediff(current_date(),last_purchase_date) <=90 then "high risk"
else "very high risk"
end as risk_factor
from last_purchase group by last_purchase_date, customer_id ;

#Product Margin Ranking by Category
with product_margin as (
select * , 
round(((price-cost)*100 )/price) as margin_percent 
from products )
select *, 
rank() 
over(partition by category order by margin_percent desc)as margin_rank  
from product_margin;

#Low-Stock & Restock Alert

SELECT 
    p.product_name,
    pi.stock_quantity,
    pi.restock_threshold,
    CASE
        WHEN pi.stock_quantity = 0 THEN 'Critical'
        WHEN pi.stock_quantity <= pi.restock_threshold THEN 'Restock Needed'
        ELSE 'Normal'
    END AS stock_status
FROM product_inventory pi
JOIN products p 
    ON pi.product_id = p.product_id;

#Return Rate by Product & Category

SELECT 
    p.category,
    
    coalesce(p.product_name,'subtotal') as product_name,
    COUNT(r.return_id) AS returns,
    COUNT(oi.order_item_id) AS total_sales,
    ROUND(COUNT(r.return_id) * 100.0 / COUNT(oi.order_item_id),2) AS return_rate
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
LEFT JOIN returns r 
    ON oi.order_item_id = r.order_item_id
GROUP BY p.category, p.product_name
WITH ROLLUP;

#Top & Bottom Products by Net Revenue
WITH revenue_calc AS (
    SELECT 
        p.product_name,
        SUM(oi.line_total) AS total_sales,
        SUM(IFNULL(r.refund_amount,0)) AS refunds,
        SUM(oi.line_total) - SUM(IFNULL(r.refund_amount,0)) AS net_revenue
    FROM order_items oi
    JOIN products p 
        ON oi.product_id = p.product_id
    LEFT JOIN returns r 
        ON oi.order_item_id = r.order_item_id
    GROUP BY p.product_name
)

SELECT * FROM (
    (SELECT * FROM revenue_calc ORDER BY net_revenue ASC LIMIT 5)
    UNION ALL
    (SELECT * FROM revenue_calc ORDER BY net_revenue DESC LIMIT 5)
) AS combined_revenue;
;

#Promotion Effectiveness
SELECT 
    CASE 
        WHEN op.order_id IS NULL THEN 'No Promo'
        ELSE 'With Promo'
    END AS promo_status,
    COUNT(o.order_id) AS orders,
    AVG(o.total_amount) AS avg_order_value
FROM orders o
LEFT JOIN order_promotions op
    ON o.order_id = op.order_id
WHERE o.status = 'Delivered'
GROUP BY promo_status;

#Weekly Sales Heatmap
SELECT 
	year(order_date) AS year_no,
    WEEK(order_date) AS week_no,
    DAYNAME(order_date) AS day_name,
    SUM(total_amount) AS sales
FROM orders
WHERE status = 'Delivered'
GROUP BY year_no, week_no, day_name
ORDER BY week_no;

#Category Revenue Breakdown with Subtotals

SELECT 
   COALESCE(category, 'Total') AS category,
  COALESCE(product_name, 'Subtotal') AS product_name,
    SUM(oi.line_total) AS revenuek
FROM order_items oi
JOIN products p 

    ON oi.product_id = p.product_id
GROUP BY category, product_name WITH ROLLUP;


# Weekly Sales Heatmap
WITH weekly_data AS (
    SELECT
        YEAR(order_date) AS year,
        WEEK(order_date, 1) AS week_number,
        DAYNAME(order_date) AS weekday,
        SUM(total_amount) AS total_sales
    FROM orders
    WHERE status = 'Delivered'
    GROUP BY year, week_number, weekday
)

SELECT
    year,
    week_number,

    SUM(CASE WHEN weekday = 'Monday' THEN total_sales ELSE 0 END) AS Mon,
    SUM(CASE WHEN weekday = 'Tuesday' THEN total_sales ELSE 0 END) AS Tue,
    SUM(CASE WHEN weekday = 'Wednesday' THEN total_sales ELSE 0 END) AS Wed,
    SUM(CASE WHEN weekday = 'Thursday' THEN total_sales ELSE 0 END) AS Thu,
    SUM(CASE WHEN weekday = 'Friday' THEN total_sales ELSE 0 END) AS Fri,
    SUM(CASE WHEN weekday = 'Saturday' THEN total_sales ELSE 0 END) AS Sat,
    SUM(CASE WHEN weekday = 'Sunday' THEN total_sales ELSE 0 END) AS Sun,
SUM(total_sales) AS Weekly_Total
FROM weekly_data
GROUP BY year, week_number
ORDER BY year, week_number;


