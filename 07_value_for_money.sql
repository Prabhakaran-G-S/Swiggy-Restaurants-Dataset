WITH city_stats AS (
    SELECT
        TRIM(CASE WHEN POSITION(',' IN city) > 0
                  THEN SUBSTRING(city FROM '[^,]+$')
                  ELSE city END) AS city,
        ROUND(AVG(rating::NUMERIC), 2) AS avg_rating,
        ROUND(AVG(cost_num), 0) AS avg_cost,
        COUNT(DISTINCT id) AS restaurant_count
    FROM swiggy
    WHERE rating NOT IN ('NA')
    GROUP BY 1
    HAVING COUNT(DISTINCT id) > 50
)
SELECT city, avg_rating, avg_cost, restaurant_count
FROM city_stats
WHERE avg_rating >= (SELECT PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY avg_rating) FROM city_stats)
  AND avg_cost   <= (SELECT PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY avg_cost)   FROM city_stats)
ORDER BY avg_rating DESC;