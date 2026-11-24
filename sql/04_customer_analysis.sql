USE superstore_db;

-- 1. Customer Segment Performance

SELECT
    Segment,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100, 2
    ) AS profit_margin,
    ROUND(
        SUM(Sales) / COUNT(DISTINCT `Order ID`), 2
    ) AS average_order_value
FROM superstore
GROUP BY Segment
ORDER BY total_sales DESC;