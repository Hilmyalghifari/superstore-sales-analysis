USE superstore_db;

-- 1. Category Performance Analysis

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100, 2
    ) AS profit_margin
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC;

-- 2. Subcategory Performance Analysis

SELECT
    Category,
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100, 2
    ) AS profit_margin
FROM superstore
GROUP BY
    Category,
    `Sub-Category`
ORDER BY total_profit DESC;

-- 3. Top 10 Most Profitable Products

SELECT
    `Product Name`,
    Category,
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity
FROM superstore
GROUP BY
    `Product Name`,
    Category,
    `Sub-Category`
ORDER BY total_profit DESC
LIMIT 10;

-- 4. Discount Impact on Profit by Subcategory

SELECT
    Category,
    `Sub-Category`,
    Discount,
    COUNT(*) AS total_transactions,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Profit), 2) AS average_profit
FROM superstore
GROUP BY
    Category,
    `Sub-Category`,
    Discount
ORDER BY
    Category,
    `Sub-Category`,
    Discount;

-- 5. Worst Discount Combinations

SELECT
    Category,
    `Sub-Category`,
    Discount,
    COUNT(*) AS total_transactions,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Profit), 2) AS average_profit
FROM superstore
GROUP BY
    Category,
    `Sub-Category`,
    Discount
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC
LIMIT 10;