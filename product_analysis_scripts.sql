-- LETS PERFORM SOME ANALYSIS ON THE DATA WE HAVE.

-- How many unique cities does the data have?
SELECT 
	DISTINCT city
FROM sales;

-- In which city is each branch?
SELECT 
	DISTINCT city,
    branch
FROM sales;

-- PRODUCT ANALYSIS.

-- How many unique product lines does the data have?
SELECT
	DISTINCT product_line
FROM sales;

-- What is the most selling product line
SELECT
    product_line,
    SUM(quantity) as qty
FROM sales
GROUP BY product_line
ORDER BY qty DESC;

-- What is the total revenue by month
SELECT
	month_name AS month,
	SUM(total) AS total_revenue
FROM sales
GROUP BY month_name 
ORDER BY total_revenue;

-- What is the highest total revenue by month
SELECT
	month_name AS month,
	SUM(total) AS total_revenue
FROM sales
GROUP BY month_name 
ORDER BY total_revenue desc;

-- What are the total COGS by month?
SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM sales
GROUP BY month_name 
ORDER BY cogs;

-- What is the highest total COGS by month?
SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM sales
GROUP BY month_name 
ORDER BY cogs desc;

-- What product line had the largest revenue?
SELECT
	product_line,
	SUM(total) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?
SELECT
	city,
	SUM(total) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue;

-- What is the city and branch with the largest revenue?
SELECT
	city,
    branch,
	SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch 
ORDER BY total_revenue desc;

-- What product line had the highest average VAT?
SELECT
	product_line,
	AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;


-- Retrieve each product line
SELECT product_line FROM SALES;

-- first calculating sales average.
SELECT 
	AVG(quantity) AS avg_qnty
FROM sales;

-- and include an additional column that categorizes the product line as either "Good" or "Bad" based on its sales performance.
-- A product line is classified as "Good" if its sales exceed the average sales, and "Bad" otherwise.
SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 5 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;

-- Which branch sold more products than average product sold?
SELECT 
	branch, 
    SUM(quantity) AS qnty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- What is the most common product line by gender
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

-- What is the average rating of each product line
SELECT
    product_line,
    ROUND(AVG(rating), 2) as avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;
