SELECT
    TRIM(cleaned_cuisine) AS cuisine,
    ROUND(AVG(rating :: NUMERIC), 2) AS avg_rating,
    COUNT(DISTINCT id) AS restaurant_count
FROM Swiggy,
     UNNEST(STRING_TO_ARRAY(cuisine, ',')) AS cleaned_cuisine
WHERE TRIM(cleaned_cuisine) NOT IN ('NA', '', 'Ice Cream', 'Desserts', 'Beverages', 'Bakery', 'Juices',
        'Snacks', 'Sweets', 'Salads', 'Healthy Food', 'Combo', 'Home Food',
        'Fast Food', 'Street Food', 'Chaat', 'Pizzas', 'Burgers', 'Pastas',
        'Biryani', 'Thalis', 'Kebabs', 'Grill', 'Barbecue', 'Tandoor', 'Seafood')
      AND rating NOT IN ('NA')
GROUP BY 1
HAVING COUNT(DISTINCT id) > 100
ORDER BY 2 DESC;
