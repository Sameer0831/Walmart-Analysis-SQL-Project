-- -- CUSTOMER ANALYSIS --

-- How many unique customer types does the data have?
SELECT
	DISTINCT customer_type
FROM sales;

-- How many unique payment methods does the data have?
SELECT
	DISTINCT payment
FROM sales;

-- What is the most common customer type?
SELECT
	customer_type,
	count(*) as count
FROM sales
GROUP BY customer_type
ORDER BY count DESC;

-- Which customer type buys the most?
SELECT
	customer_type,
    COUNT(*) as products_bought
FROM sales
GROUP BY customer_type;

-- What is the gender of most of the customers?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- What is the gender distribution per branch?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales
WHERE branch = "C" -- " A " , " B "
GROUP BY gender
ORDER BY gender_cnt DESC;

-- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC; -- time of the day does not really affect the rating, its almost same rating at each time of the day.

-- Which time of the day do customers give most ratings per branch?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
WHERE branch = "A" -- " C " , " B "
GROUP BY time_of_day
ORDER BY avg_rating DESC;
-- Branch A and C are doing well in ratings, branch B needs to do a 
-- little more to get better ratings.

-- Which day fo the week has the best avg ratings?
SELECT
	day_name,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name 
ORDER BY avg_rating DESC;
-- Mon, Tue and Friday are the top best days for good ratings

-- why is that the case, how many sales are made on these days?
 SELECT 
    day_name, AVG(total)
FROM 
    sales
WHERE 
    day_name LIKE 'S%' OR day_name LIKE 'Thu%' OR day_name LIKE 'We%'
GROUP BY 
    day_name;
    
-- FOR OTHER DAYS
 SELECT 
    day_name, AVG(total)
FROM 
    sales
WHERE 
    day_name LIKE 'M%' OR day_name LIKE 'TU%' OR day_name LIKE 'F%'
GROUP BY 
    day_name;
    
-- Which day of the week has the best average ratings per branch?
SELECT 
	day_name,
	COUNT(day_name) total_sales
FROM sales
WHERE branch = "C" -- "A", "B"
GROUP BY day_name
ORDER BY total_sales DESC;


