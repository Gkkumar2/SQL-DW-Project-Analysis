

-- Which 5 product genarates highest revenue
SELECT TOP 5
	p.product_name,
	SUM(s.sales_amount) Total_revunue
FROM 
	gold.fact_sales s
LEFT JOIN 
	gold.dim_products p
ON 
	s.product_key = p.product_key
GROUP BY 
	P.product_name
ORDER BY 
	Total_revunue DESC

-- What 5 worst product interms of sales 
SELECT TOP 5
	p.product_name,
	SUM(s.sales_amount) Total_sales
FROM 
	gold.fact_sales s
LEFT JOIN 
	gold.dim_products p
ON 
	s.product_key = p.product_key
GROUP BY 
	P.product_name
ORDER BY 
	Total_sales ASC

-- Find top 10 customers who genarated most revenue
SELECT TOP 10
	c.customer_key,
	c.first_name,
	c.last_name,
	SUM(s.sales_amount) Total_revenue
FROM 
	gold.fact_sales s
LEFT JOIN 
	gold.dim_customers c
ON 
	s.customer_key = c.customer_key
GROUP BY
	c.customer_key,
	c.first_name,
	c.last_name
ORDER BY 
	Total_revenue desc

--The 3 customers with fewest orders
SELECT TOP 3
	c.customer_key,
	c.first_name,
	c.last_name,
	COUNT(DISTINCT s.order_number) AS Total_Orders
FROM 
	gold.fact_sales s
LEFT JOIN 
	gold.dim_customers c
ON 
	s.customer_key = c.customer_key
GROUP BY
	c.customer_key,
	c.first_name,
	c.last_name
ORDER BY 
	Total_Orders ASC