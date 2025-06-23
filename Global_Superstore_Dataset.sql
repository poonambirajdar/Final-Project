use superstore_data;

select * from orders;

-- Top selling category
select Category, SUM(Sales) AS TotalSale
from orders
group by Category
order by TotalSale desc;

-- Top 10 Customers by Sales
SELECT 
    `Customer Name`,
    `Customer ID`,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Customer Name`, `Customer ID`
ORDER BY Total_Sales DESC
LIMIT 10;

--  Sales by Region
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

--  Monthly Order Trends
SELECT 
    DATE_FORMAT('Order Date', '%Y-%m') AS Month,
    COUNT('Order ID') AS Total_Orders,
    SUM(Sales) AS Monthly_Sales
FROM orders
GROUP BY Month
ORDER BY Month;

-- Top 5 Products by Sales
SELECT 
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 5;

-- JOIN order table and return table
SELECT o.*
FROM orders o
LEFT JOIN returns r
ON o.`Order ID` = r.`Order ID`;



