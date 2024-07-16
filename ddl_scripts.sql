-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- Use WalmartSales dB
use walmartSales;

-- Create table to load the data
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

-- Lets see the data to perform data cleaning if needed.

SELECT
	*
FROM sales;

-- Load data using import wizard

-- see the data after loading
SELECT 	* FROM sales;

-- LETS PERFORM SOME FEATURE ENGINEERING ON OUR DATASET
-- ADDING A TIME FEATURE (FEATURE-1)
SELECT time FROM sales;

-- ADDING SPECIFIC DAY OF TIME TO THESE TIME VALUES.
SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;

-- ADD THIS TIME_OF_DAY TO OUR SALES TABLE.
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

-- ADD VALUES TO THIS TIME_OF_DAY COLUMN.
UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

-- VIEW THE DATA
SELECT 	* FROM sales;

-- IF GOT ANY ERROR THEN SEE THE SETTINGS AND turn off safe mode for update
-- Edit > Preferences > SQL Edito > scroll down and toggle safe mode
-- Reconnect to MySQL: Query > Reconnect to server

-- VIEW THE DATA
SELECT 	* FROM sales;

-- ADDING A DAY FEATURE (FEATURE-2)
SELECT date FROM sales;

SELECT
	date,
	DAYNAME(date)
FROM sales;

-- ADD THIS DAY_COL TO OUR SALES TABLE.
ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

-- SEE THE UPDATED TABLE COLUMNS
SELECT * FROM sales;

-- LOAD DATA TO THIS NEW COLUMN
UPDATE sales
SET day_name = DAYNAME(date);

-- SEE THE UPDATED TABLE DATA
SELECT * FROM sales;

-- -- ADDING A MONTH FEATURE (FEATURE-3)
SELECT
	date
FROM sales;

SELECT
	date,
	MONTHNAME(date)
FROM sales;

-- ADD THIS MONTH_COL TO OUR SALES TABLE.
ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

-- SEE THE UPDATED TABLE COLUMNS
SELECT * FROM sales;

-- LOAD DATA TO THIS NEW COLUMN
UPDATE sales
SET month_name = monthname(date);

-- SEE THE UPDATED TABLE DATA
SELECT * FROM sales;

-- TABLE SETUP IS DONE. 