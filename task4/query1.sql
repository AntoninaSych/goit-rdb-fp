-- 1)
ALTER TABLE infectious_data
    ADD COLUMN start_of_year DATE;

UPDATE infectious_data
SET start_of_year = STR_TO_DATE(CONCAT(year, '-01-01'), '%Y-%m-%d')
WHERE year IS NOT NULL;


SELECT year, start_of_year FROM infectious_data limit 10