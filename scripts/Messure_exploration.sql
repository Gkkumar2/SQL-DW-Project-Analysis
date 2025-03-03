
-- Find the total sales
SELECT 
	SUM(sales_amount) AS Total_sales 
FROM 
	gold.fact_sales

-- Find How many items are sold
SELECT
	SUM(quantity) AS Item_sold 
FROM 
	gold.fact_sales

-- Find the average selling price
SELECT
	AVG(price) AS avg_price 
FROM 
	gold.fact_sales

-- Find Total number of orders
SELECT
	COUNT(order_number) AS Total_orders
FROM 
	gold.fact_sales
SELECT
	COUNT(DISTINCT order_number) AS Total_orders
FROM
	gold.fact_sales

-- Find the total number of product 
SELECT 
	COUNT( DISTINCT(product_key)) AS Total_products 
FROM 
	gold.dim_products

-- Find total number of customers
SELECT	
	COUNT (DISTINCT customer_key) AS Total_customers 
FROM 
	gold.dim_customers

-- Find total number of customers that placed a order
SELECT	
	COUNT (DISTINCT customer_key) AS Total_customers 
FROM 
	gold.fact_sales


-- Report That show all key metrics of the business 
SELECT 'Toatal Sales' AS Messure_Name,SUM(sales_amount) AS Messure_Value FROM gold.fact_sales
UNION ALL 
SELECT 'Toatal Quantity' AS Messure_Name,SUM(quantity) AS Messure_Value FROM gold.fact_sales
UNION ALL 
SELECT 'Avarage Price' AS Messure_Name,AVG(price) AS Messure_Value FROM gold.fact_sales
UNION ALL 
SELECT 'Total Orders' AS Messure_Name,COUNT(DISTINCT order_number)  AS Messure_Value FROM gold.fact_sales
UNION ALL 
SELECT 'Total Products' AS Messure_Name,COUNT( DISTINCT(product_key)) AS Messure_Value FROM gold.dim_products
UNION ALL 
SELECT 'Total Customers' AS Messure_Name,COUNT(DISTINCT customer_key) AS Messure_Value FROM gold.dim_customers
UNION ALL 
SELECT 'Total Customers Placed an Order' AS Messure_Name,COUNT (DISTINCT customer_key) AS Messure_Value FROM gold.fact_sales