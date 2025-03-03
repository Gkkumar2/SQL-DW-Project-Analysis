-- Running total of sales over the time
WITH total AS (
    SELECT 
        DATETRUNC(YEAR, order_date) AS order_day,
        SUM(sales_amount) AS Yearly_sales,
        AVG(sales_amount) AS Yearly_average

    FROM 
        gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY 
        DATETRUNC(YEAR, order_date)
)
SELECT 
    order_day,
	Yearly_sales,
    SUM(Yearly_sales) OVER (ORDER BY order_day) AS Running_total,
    AVG(yearly_average) OVER (ORDER BY order_day) AS Moving_average
FROM total;