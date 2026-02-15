CREATE TABLE IF NOT EXISTS sales_analysis AS
SELECT
    s.transaction_id,

    o.order_date,
    DATE(o.order_date) AS order_date_date,
    o.year,
    o.quarter,
    o.month,

    c.customer_name,
    c.city,
    c.zip_code,

    p.product_name,
    p.category,
    p.price,

    e.first_name  AS employee_first_name,
    e.last_name   AS employee_last_name,
    e.salary      AS employee_salary,

    s.quantity,
    s.discount,
    s.total_sales

FROM sales AS s
JOIN orders AS o
    ON s.order_id = o.order_id
JOIN customers AS c
    ON s.customer_id = c.customer_id
JOIN products AS p
    ON s.product_id = p.product_id
LEFT JOIN employees AS e
    ON s.employee_id = e.employee_id;




SELECT
    transaction_id,
    order_date_date,
    year,
    product_name,
    total_sales
FROM sales_analysis
WHERE year = 2023
  AND total_sales > 10000;	


  CREATE INDEX idx_sales_analysis_order_date
    ON sales_analysis(order_date_date);

CREATE INDEX idx_sales_analysis_year
    ON sales_analysis(year);

CREATE INDEX idx_sales_analysis_city
    ON sales_analysis(city);

SELECT
	AVG(total_sales) as avg_sales
FROM sales_analysis

;
    
SELECT
	customer_name,
	CASE
	WHEN AVG(total_sales) > 251 THEN 'Above Average'
	WHEN AVG(total_sales) = 251 THEN 'Average'
	WHEN AVG(total_sales) < 251 THEN 'Below Average'
	ELSE 'Warning'
END as segment
FROM sales_analysis
GROUP BY customer_name
