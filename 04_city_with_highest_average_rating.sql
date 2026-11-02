SELECT
    TRIM(CASE WHEN POSITION (',' IN city)>0
            THEN SUBSTRING (city FROM '[^,]+$')
            ELSE city END) AS city,
    ROUND(AVG(rating :: NUMERIC),2) AS avg_rating,
    COUNT(DISTINCT id) AS restaurant_count
FROM
    swiggy
WHERE rating NOT IN ('NA')
GROUP BY 1
HAVING COUNT(DISTINCT id) > 100
ORDER BY 2 DESC
