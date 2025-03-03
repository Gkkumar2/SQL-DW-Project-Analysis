-- Sales trend over months by orderdate
SELECT 
	DATETRUNC(MONTH, order_date) AS order_day,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM 
	gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY 
	DATETRUNC(MONTH, order_date)
ORDER BY 
	DATETRUNC(MONTH, order_date)


-- Calculate the total sales per month
SELECT 
	DATETRUNC(MONTH, order_date) AS order_day,
	SUM(sales_amount) AS total_sales
FROM 
	gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY 
	DATETRUNC(MONTH, order_date)
ORDER BY 
	DATETRUNC(MONTH, order_date)