-- Find the date of first and last order
SELECT 
	MIN(order_date) AS First_order_date ,
	MAX(order_date) AS Last_order_date
FROM 
	gold.fact_sales

-- How many years of sales are availble 
SELECT 
	MIN(order_date) AS First_order_date ,
	MAX(order_date) AS Last_order_date,
	DATEDIFF(YEAR,MIN(order_date),MAX(order_date)) AS Year_differance
FROM 
	gold.fact_sales;

-- Find youngest and oldest customers 
WITH agecte AS 
    (SELECT 
        first_name,
        last_name,
        birthdate,
        DATEDIFF(YEAR, birthdate, GETDATE()) AS AGE
    FROM gold.dim_customers
    )
SELECT 
    MAX(AGE) AS MAXIMUM_AGE,
    MIN(AGE) AS MINIMUM_AGE
FROM 
	agecte;
