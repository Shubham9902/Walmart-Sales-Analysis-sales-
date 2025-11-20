Walmart Sales Analysis – SQL Project

This project analyzes Walmart’s transactional sales data using SQL. The goal is to extract meaningful business insights, identify performance patterns, and evaluate customer behavior across branches, product lines, and payment methods.

The dataset and SQL scripts provided demonstrate practical use of analytical queries, window functions, segmentation logic, and trend analysis.

🎯 Project Objectives

Evaluate branch performance based on sales growth.

Identify the most profitable product lines.

Segment customers by spending behavior.

Detect anomalies in sales transactions.

Analyze sales distribution by gender and monthly seasonality.

Determine top-paying customers and repeat customers.

Understand city-wise payment preferences.

🛠️ Tools & Technologies

MySQL / SQL

Window Functions (DENSE_RANK, ROW_NUMBER)

Aggregations & Grouping

Case Expressions

Date & Time Functions

📊 Key Insights Extracted
1. Top Branch by Sales

Used total sales aggregation to rank branches based on revenue.

2. Most Profitable Product Line (Per Branch)

DENSE_RANK used to find the highest gross-income product line per branch.

3. Customer Spending Segmentation

Classified each customer into:

High-value

Medium-value

Low-value
based on transaction totals.

4. Sales Anomaly Detection

Flagged unusually high sales (above dataset average) for further analysis.

5. City-wise Most Popular Payment Method

Identified preferred payment mode per city using ROW_NUMBER.

6. Monthly Sales by Gender

Analyzed gender-based contribution to monthly sales trends.

7. Best Product Line by Customer Type

Identified which product categories perform best for each customer segment.

8. Repeat Customer Identification

Counted unique invoices to detect returning customer behavior.

9. Top 5 High-Value Customers

Ranked customers by total sales volume.

10. Weekly Sales Trends

Analyzed day-wise patterns to understand peak sales periods.

📁 SQL Queries Included

Each task is implemented using efficient SQL queries covering:

Joins

Window Functions

Aggregations

Subqueries

Date Parsing

Ranking Functions

All queries are organized and labeled inside Walmart.sql.

🚀 How to Run

Import the dataset into MySQL:

use walmart_sales;
select * from walmartsales;


Run each SQL block inside Walmart.sql as per the task headings.

📈 Results & Business Value

This analysis supports:

Revenue optimization

Customer segmentation strategies

Inventory and product line decisions

Marketing and pricing alignment

Fraud/anomaly detection improvements
