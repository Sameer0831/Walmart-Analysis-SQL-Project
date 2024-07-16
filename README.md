
# Walmart Sales Data Analysis

## About

This project explores Walmart sales data to identify top-performing branches and products, analyze sales trends, and understand customer behavior. The goal is to improve and optimize sales strategies. The dataset is sourced from the Kaggle Walmart Sales Forecasting Competition.

In this competition, participants are given historical sales data from 45 Walmart stores across various regions. Each store has multiple departments, and the challenge is to forecast sales for each department. The dataset also includes holiday markdown events that impact sales, adding complexity to the predictions.

## Project Purpose

The primary aim of this project is to gain insights into Walmart's sales data to understand the various factors affecting sales across different branches. By analyzing these factors, the project seeks to identify opportunities for optimizing sales strategies and improving overall performance.

Additionally, this project will help develop and strengthen various SQL skills, including:
- **Data Retrieval**: Using SELECT statements to extract relevant data.
- **Data Filtering**: Applying WHERE clauses to filter data based on specific conditions.
- **Aggregation**: Utilizing GROUP BY and aggregate functions (SUM, AVG, COUNT) to summarize data.
- **Joins**: Combining data from multiple tables using INNER JOIN, LEFT JOIN, and other join types.
- **Subqueries**: Writing nested queries to perform complex data retrieval tasks.
- **Data Sorting**: Ordering results using ORDER BY.
- **Window Functions**: Applying window functions to perform calculations across a set of table rows related to the current row.
- **Data Manipulation**: Using INSERT, UPDATE, and DELETE statements to manage data within the database.
- **Indexing**: Understanding how to optimize queries using indexes.

## About the Data

The dataset was sourced from the Kaggle Walmart Sales Forecasting Competition. It contains sales transactions from three Walmart branches located in Mandalay, Yangon, and Naypyitaw. The dataset includes 17 columns and 1,000 rows, providing a comprehensive view of the sales activities across these branches.

## Analysis List

### Product Analysis
Analyze the data to understand different product lines, identify the best-performing product lines, and highlight those that need improvement.

### Sales Analysis
Examine sales trends to evaluate the effectiveness of various sales strategies. This analysis will help determine necessary modifications to enhance sales performance.

### Customer Analysis
Investigate customer segments, purchasing trends, and the profitability of each segment to uncover valuable insights about customer behavior.

## Approach Used

### Data Wrangling
- **Inspection**: The initial step involves inspecting the data to detect and handle NULL and missing values. Appropriate data replacement methods are applied to ensure data integrity.
- **Database Creation**: Build a database, create tables, and insert the data.
- **NULL Value Handling**: Select columns with NULL values. Since the tables were created with NOT NULL constraints for each field, NULL values are effectively filtered out.

### Feature Engineering
- **Time of Day**: Add a new column named `time_of_day` to categorize sales into Morning, Afternoon, and Evening, helping identify which part of the day has the highest sales.
- **Day of the Week**: Add a new column named `day_name` to extract the days of the week (Mon, Tue, Wed, Thu, Fri) for each transaction, providing insights into the busiest days for each branch.
- **Month of the Year**: Add a new column named `month_name` to extract the months (Jan, Feb, Mar) for each transaction, aiding in determining the months with the highest sales and profit.

### Exploratory Data Analysis (EDA)
Conduct EDA to answer the listed questions and achieve the project’s aims. This involves visualizing data patterns, trends, and relationships to draw meaningful insights.

## Conclusion
The analysis of Walmart's sales data revealed several key insights. The top-performing branches and product lines were identified, highlighting the success of certain sales strategies. Conversely, areas needing improvement were pinpointed, offering opportunities for optimization. Sales trends were mapped across different times of the day, days of the week, and months, providing a clearer understanding of customer purchasing behavior. By segmenting customers and analyzing their profitability, we gained valuable insights into customer behavior that can inform future business strategies. Overall, this project demonstrates how data-driven approaches can enhance decision-making and improve sales performance.


