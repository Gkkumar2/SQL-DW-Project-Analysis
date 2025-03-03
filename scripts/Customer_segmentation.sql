/* Segement products into cost ranges an count how many products
fall in to each segment*/

WITH segment AS (
SELECT 
	product_id,
	product_name,
	product_cost,
	CASE 
		WHEN product_cost > 1000 THEN 'Luxury'
		WHEN product_cost >= 100 AND product_cost <=1000 THEN 'Mid'
	    ELSE 'Cheap'
	END AS Segment
FROM 
	gold.dim_products
WHERE product_name IS NOT NULL
GROUP BY 
	product_id,
	product_name,
	product_cost
)
SELECT 
	product_name,
	product_cost,
	Segment
FROM segment
GROUP BY 
	product_name,
	product_cost,
	Segment
ORDER BY 
	product_cost DESC
-- Count how many products fall into each segment
WITH segment AS (
SELECT 
	product_id,
	product_name,
	product_cost,
	CASE 
		WHEN product_cost > 1000 THEN 'Luxury'
		WHEN product_cost >= 100 AND product_cost <=1000 THEN 'Mid'
	    ELSE 'Cheap'
	END AS Segment
FROM 
	gold.dim_products
WHERE product_name IS NOT NULL
GROUP BY 
	product_id,
	product_name,
	product_cost
)
SELECT 
	Segment,
	COUNT( product_id) AS COUNT_SEG
FROM 
	segment
GROUP BY 
	Segment
ORDER BY 
	COUNT( product_id)

/*Group customers into three segments based on their spending behavior:
	- VIP: Customers with at least 12 months of history and spending more than €5,000.
	- Regular: Customers with at least 12 months of history but spending €5,000 or less.
	- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group
*/

WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS total_spending,
        MIN(order_date) AS first_order,
        MAX(order_date) AS last_order,
        DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
),
Segment AS(
SELECT 
  customer_key,
      CASE 
        WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
        WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
        ELSE 'New'
      END AS customer_segment
    FROM customer_spending
)
SELECT 
	customer_segment,
	COUNT(customer_key)
FROM
	Segment
GROUP BY 
	customer_segment
ORDER BY 
	COUNT(customer_key) DESC;