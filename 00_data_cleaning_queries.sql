SELECT COUNT(*) FROM swiggy;

SELECT
  SUM(CASE WHEN restaurant_name IS NULL THEN 1 ELSE 0 END) AS null_names,
  SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_ratings,
  SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_cities
FROM swiggy;

DELETE FROM swiggy
WHERE rating = 'NEW' OR rating = '--';


UPDATE swiggy
SET rating = CAST(rating AS DECIMAL(2,1))
WHERE rating NOT IN ('NEW', '--', 'NA');

ALTER TABLE swiggy ADD COLUMN cost_num INTEGER;

UPDATE swiggy
SET cost_num = REGEXP_REPLACE(cost, '[^0-9]', '', 'g')::INTEGER
WHERE cost ~ '[0-9]';
