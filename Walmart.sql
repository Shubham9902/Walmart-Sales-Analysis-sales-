use walmart_sales;
select* from walmartsales;
## Task 1: Identifying the Top Branch by Sales Growth Rate
SELECT branch,round(SUM(total),2) AS total_sales FROM walmartsales
 GROUP BY branch ORDER BY total_sales DESC;

## Task 2: Finding the Most Profitable Product Line for Each Branch
with Rankingtable as
(
select branch, product_line, round(sum(gross_income),0) as Total_Gross_income, dense_rank() 
over(partition by branch order by sum(gross_income)  desc)
as Ranking from walmartsales group by branch,product_line
)
 select branch, product_line, total_gross_income from rankingtable where ranking = 1 ;
 
 ##Task 3: Analyzing Customer Segmentation Based on Spending
select Invoice_ID, Branch, Customer_Type, Total,
case 
when total > 500 then "High value costumer"
when total>100 then "Medium value costumer"
else "Low value Costumer"
end as Spending_segment
From walmartsales 
order by total desc;

## Task 4: Detecting Anomalies in Sales Transactions 
select invoice_id, branch, city, Product_Line, Total from walmartsales
where total >(select avg(total) from walmartsales ) order by total desc;

## Task 5: Most Popular Payment Method by City
with citypaymentcount as
(
select city,payment, count(payment) as Payment_Count, 
row_number() over( partition by city order by count(payment) desc) as ranking 
from walmartsales group by payment, city
)
 
 select city, payment as Most_payment_Method, payment_Count from citypaymentcount 
 where ranking=1;
 
##  Task 6: Monthly Sales Distribution by Gender
SELECT MONTHNAME(STR_TO_DATE(date, '%d-%m-%Y')) AS month, gender, SUM(total) AS total_sales
FROM walmartsales
GROUP BY month, gender
ORDER BY MIN(STR_TO_DATE(date, '%d-%m-%Y')), gender;
 
 ##Task 7: Best Product Line by Customer Type
with productline as(
select customer_type, Product_line, round(sum(gross_income),0) as Total_gross_income,
dense_rank() over(partition by customer_type order by sum(gross_income) desc) 
as ranking from walmartsales group by customer_type , Product_line)

select customer_type, product_line, Total_gross_income from productline where ranking = 1;

## Task 8: Identifying Repeat Customers 
SELECT customer_type,COUNT(DISTINCT invoice_id) AS number_of_purchases FROM walmartsales
GROUP BY customer_type
HAVING COUNT(DISTINCT invoice_id) > 1
ORDER BY number_of_purchases DESC;

 ## Task 9: Finding Top 5 Customers by Sales Volume 
 SELECT invoice_id,customer_type,gender,product_line,total AS sales_volume
FROM walmartsales
ORDER BY total DESc LIMIT 5;

 ##Task 10: Analyzing Sales Trends by Day of the Week
SELECT DAYNAME(STR_TO_DATE(date, '%d-%m-%Y')) AS day_of_week,SUM(total) AS total_sales
FROM walmartsales
GROUP BY day_of_week, DAYOFWEEK(STR_TO_DATE(date, '%d-%m-%Y'))
ORDER BY DAYOFWEEK(STR_TO_DATE(date, '%d-%m-%Y'));