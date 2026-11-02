SELECT
    TRIM(CASE WHEN POSITION(',' IN city) > 0
              THEN SUBSTRING(city FROM '[^,]+$')
              ELSE city END) AS clean_city,
    COUNT(DISTINCT name) AS restaurant_count
FROM Swiggy
GROUP BY 1
ORDER BY 2 DESC;
