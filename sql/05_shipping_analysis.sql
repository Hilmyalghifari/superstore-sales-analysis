USE superstore_db;

-- 1. Shipping Mode Performance

SELECT
    `Ship Mode`,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100, 2
    ) AS profit_margin,
    ROUND(
        AVG(`Shipping Duration`), 2
    ) AS average_shipping_duration
FROM superstore
GROUP BY `Ship Mode`
ORDER BY total_orders DESC;

-- 2. Average Shipping Duration by Order

SELECT
    `Ship Mode`,
    COUNT(*) AS total_orders,
    ROUND(AVG(shipping_duration), 2) AS avg_shipping_duration
FROM (
    SELECT
        `Order ID`,
        `Ship Mode`,
        MAX(`Shipping Duration`) AS shipping_duration
    FROM superstore
    GROUP BY
        `Order ID`,
        `Ship Mode`
) AS order_level
GROUP BY `Ship Mode`
ORDER BY avg_shipping_duration ASC;

-- 3. Order-Level Data Consistency Check

SELECT
    COUNT(*) AS total_orders,
    SUM(
        CASE WHEN ship_mode_count > 1
        THEN 1 ELSE 0 END
    ) AS inconsistent_ship_mode,
    SUM(
        CASE WHEN duration_count > 1
        THEN 1 ELSE 0 END
    ) AS inconsistent_shipping_duration
FROM (
    SELECT
        `Order ID`,
        COUNT(DISTINCT `Ship Mode`) AS ship_mode_count,
        COUNT(DISTINCT `Shipping Duration`) AS duration_count
    FROM superstore
    GROUP BY `Order ID`
) AS order_validation;