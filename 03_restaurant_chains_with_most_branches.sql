SELECT
    DISTINCT name AS restaurant_name,
    COUNT(*) AS restaurant_count
FROM
    swiggy
GROUP BY 1
ORDER BY restaurant_count DESC
LIMIT 25
