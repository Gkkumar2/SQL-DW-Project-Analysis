-- Which category contributes most to the overall sales
WITH cat_sales AS (
    SELECT
        p.category,
        SUM(s.sales_amount) AS Total_Sales
    FROM 
        gold.fact_sales s
    LEFT JOIN
        gold.dim_products p
    ON 
        s.product_key = p.product_key
    GROUP BY 
        p.category
)

SELECT 
    category,
    Total_Sales,
    CONCAT (CAST(ROUND(Total_Sales * 100.0 / (SELECT SUM(Total_Sales) FROM cat_sales), 2) AS DECIMAL(5,2)),'%') AS Percentage_Contribution
FROM 
    cat_sales
ORDER BY 
    Total_Sales DESC;

--subcategory 

WITH cat_sales AS (
    SELECT
        p.subcategory,
        SUM(s.sales_amount) AS Total_Sales
    FROM 
        gold.fact_sales s
    LEFT JOIN
        gold.dim_products p
    ON 
        s.product_key = p.product_key
    GROUP BY 
        p.subcategory
)

SELECT 
    subcategory,
    Total_Sales,
    CONCAT (CAST(ROUND(Total_Sales * 100.0 / (SELECT SUM(Total_Sales) FROM cat_sales), 2) AS DECIMAL(5,2)),'%') AS Percentage_Contribution
FROM 
    cat_sales
ORDER BY 
    Total_Sales DESC;


