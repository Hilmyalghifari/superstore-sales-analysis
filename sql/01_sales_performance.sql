USE superstore_db;

-- 1. Overall Business Performance

SELECT
    COUNT(DISTINCT `Order ID`) AS total_orders,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    SUM(`Sales`) AS total_sales,
    SUM(`Profit`) AS total_profit,
    SUM(`Quantity`) AS total_quantity,
    ROUND(AVG(`Sales`), 2) AS average_sales_per_row,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100, 2
    ) AS profit_margin_percentage
FROM superstore;

-- 2. Yearly Sales and Profit Performance

SELECT
    YEAR(`Order Date`) AS order_year,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100, 2
    ) AS profit_margin
FROM superstore
GROUP BY YEAR(`Order Date`)
ORDER BY order_year;

-- 3. Monthly Sales Performance

SELECT
    YEAR(`Order Date`) AS order_year,
    MONTH(`Order Date`) AS order_month,
    MONTHNAME(`Order Date`) AS month_name,
    ROUND(SUM(`Sales`), 2) AS total_sales,
    ROUND(SUM(`Profit`), 2) AS total_profit,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM superstore
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`),
    MONTHNAME(`Order Date`)
ORDER BY
    order_year,
    order_month;

-- 4. Highest and Lowest Monthly Sales

SELECT
    YEAR(`Order Date`) AS order_year,
    MONTHNAME(`Order Date`) AS month_name,
    ROUND(SUM(`Sales`), 2) AS total_sales
FROM superstore
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`),
    MONTHNAME(`Order Date`)
ORDER BY total_sales DESC
LIMIT 5;