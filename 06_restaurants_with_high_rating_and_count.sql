SELECT
    name AS restaurant_name,
    ROUND(AVG(rating::NUMERIC), 2) AS avg_rating,
    rating_count
FROM swiggy
WHERE rating NOT IN ('NA')
  AND rating_count LIKE '%K+%'
GROUP BY 1,3
HAVING ROUND(AVG(rating::NUMERIC), 2) > 4.5
ORDER BY 2 DESC;
