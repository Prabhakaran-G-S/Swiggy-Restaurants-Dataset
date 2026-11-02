SELECT
    TRIM(cleaned_cuisine) AS cuisine,
    COUNT(DISTINCT id) AS restaurant_count
FROM Swiggy,
     UNNEST(STRING_TO_ARRAY(cuisine, ',')) AS cleaned_cuisine
WHERE TRIM(cleaned_cuisine) NOT IN ('NA', '')
GROUP BY 1
ORDER BY 2 DESC;
