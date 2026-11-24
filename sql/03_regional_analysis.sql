USE superstore_db;

-- 1. Regional Sales and Profit Performance

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    SUM(Quantity) AS total_quantity,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100, 2
    ) AS profit_margin
FROM superstore
GROUP BY Region
ORDER BY total_sales DESC;

-- 2. Regional Performance by Category

SELECT
    Region,
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100, 2
    ) AS profit_margin
FROM superstore
GROUP BY
    Region,
    Category
ORDER BY
    Region,
    total_profit DESC;

-- 3. Central Region Subcategory Performance

SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100, 2
    ) AS profit_margin
FROM superstore
WHERE Region = 'Central'
GROUP BY `Sub-Category`
ORDER BY total_profit ASC;